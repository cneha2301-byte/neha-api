package com.Bizom.commonUtils;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.*;
import java.nio.file.Files;
import java.util.*;

public class ApiChecker {

    public static void main(String[] args) {

        String excelPath = "/Users/amitabhabagchi/Downloads/WebAPI_list.xlsx";   // your file
        String logFilePath = "/Users/amitabhabagchi/Downloads/all_a_based_controller_data.csv";          // your log file


        try {
            // Read API list from Excel
            List<String> apiList = readApisFromExcel(excelPath);

            // Read entire log content
            String logContent = Files.readString(new File(logFilePath).toPath());
            logContent = logContent.replace("\\/", "/");
            List<String> foundApis = new ArrayList<>();
            List<String> missingApis = new ArrayList<>();

            for (String api : apiList) {
                if (logContent.contains(api)) {
                    foundApis.add(api);
                } else {
                    missingApis.add(api);
                }
            }

            System.out.println("=========== APIs Found in Log ===========");
            foundApis.forEach(System.out::println);

            System.out.println("\n=========== APIs Missing in Log ===========");
            missingApis.forEach(System.out::println);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Reads API list from Sheet 1 (index 0), Column A (index 0)
    private static List<String> readApisFromExcel(String excelPath) throws Exception {
        List<String> apiList = new ArrayList<>();

        FileInputStream fis = new FileInputStream(excelPath);
        Workbook workbook = new XSSFWorkbook(fis);
        Sheet sheet = workbook.getSheetAt(0); // sheet 1

        for (Row row : sheet) {
            Cell cell = row.getCell(0); // column A
            if (cell != null) {
                String api = cell.toString().trim();
                if (!api.isEmpty()) {
                    apiList.add(api);
                }
            }
        }

        workbook.close();
        fis.close();

        return apiList;
    }
}

