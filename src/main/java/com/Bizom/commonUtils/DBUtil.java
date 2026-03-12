package com.Bizom.commonUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class DBUtil {

    private static String DB_SERVER;
    private static String DB_NAME;
    private static String USER_NAME;
    private static String USER_PASSWORD;

    private static String URL;
    private static String USER;
    private static String PASSWORD;

    // initialize the DB configuration dynamically
    static {
        initializeDB();
    }

    private static void initializeDB() {
        String executionBase = System.getProperty("executionBase", "integration").toLowerCase();
        ConfigReader.loadProperties();

        switch (executionBase) {
            case "bizomweb":
                DB_SERVER = ConfigReader.getValue("bizomWebDbServer");
                DB_NAME = ConfigReader.getValue("bizomWebDbName");
                USER_NAME = ConfigReader.getValue("bizomWebDbUser");
                USER_PASSWORD = ConfigReader.getValue("bizomWebDbPassword");
                break;

            case "integration":
                DB_SERVER = ConfigReader.getValue("integrationDbServer");
                DB_NAME = ConfigReader.getValue("integrationDbName");
                USER_NAME = ConfigReader.getValue("integrationDbUser");
                USER_PASSWORD = ConfigReader.getValue("integrationDbPassword");
                break;

            case "retailer":
                DB_SERVER = ConfigReader.getValue("retailerDbServer");
                DB_NAME = ConfigReader.getValue("retailerDbName");
                USER_NAME = ConfigReader.getValue("retailerDbUser");
                USER_PASSWORD = ConfigReader.getValue("retailerDbPassword");
                break;

            default:
                throw new IllegalArgumentException("Invalid executionBase: " + executionBase);
        }

        URL = "jdbc:mysql://" + DB_SERVER + "/" + DB_NAME;
        USER = USER_NAME;
        PASSWORD = USER_PASSWORD;

        System.out.println("\n\u001B[46;30m[DB CONNECTED]\u001B[0m Using DB: \u001B[36m" + DB_NAME + "\u001B[0m (" + DB_SERVER + ")");
    }

    // Generic fetch method
    public static List<Map<String, Object>> getData(String tableName,
                                                    List<String> columns,
                                                    String whereClause) {

        List<Map<String, Object>> results = new ArrayList<>();
        String columnString = String.join(",", columns);
        String query = "SELECT " + columnString + " FROM " + tableName;

        if (whereClause != null && !whereClause.isEmpty()) {
            query += " WHERE " + whereClause;
        }

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            ResultSetMetaData metaData = rs.getMetaData();
            int colCount = metaData.getColumnCount();

            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                for (int i = 1; i <= colCount; i++) {
                    row.put(metaData.getColumnName(i), rs.getObject(i));
                }
                results.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("DB fetch failed: " + e.getMessage());
        }

        return results;
    }

    public static int updateData(String tableName,
                                 Map<String, Object> updateColumns,
                                 String whereClause) {

        if (updateColumns == null || updateColumns.isEmpty()) {
            throw new IllegalArgumentException("No columns provided for update.");
        }

        // Build the SET clause dynamically
        String setClause = updateColumns.keySet()
                .stream()
                .map(col -> col + " = ?")
                .collect(Collectors.joining(", "));

        String query = "UPDATE " + tableName + " SET " + setClause;
        if (whereClause != null && !whereClause.isEmpty()) {
            query += " WHERE " + whereClause;
        }

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            int index = 1;
            for (Object value : updateColumns.values()) {
                pstmt.setObject(index++, value);
            }

            int updatedRows = pstmt.executeUpdate();
            System.out.println("Updated " + updatedRows + " row(s) in table " + tableName);
            return updatedRows;

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("DB update failed: " + e.getMessage());
        }
    }

}