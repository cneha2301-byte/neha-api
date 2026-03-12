package com.Bizom.commonUtils;

public class DBQueries {

    private static final String get_Data = "select * from sample table ";


    public static String getDBQueries(String requestName) {
        switch (requestName) {
            case "get_Data":
                return get_Data;
            default:
                throw new RuntimeException("Resource uri not defined for the specific file name - " + requestName);
        }
    }
}

