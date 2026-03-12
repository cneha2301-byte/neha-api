package com.Bizom.commonUtils;

import java.io.*;
import java.nio.file.*;
import java.util.*;
import java.util.regex.*;

public class EndPointChecker {

    private static final Pattern GET_METHOD_PATTERN =
            Pattern.compile("\"method\"\\s*:\\s*\"GET\"");

    private static final Pattern PATH_PATTERN =
            Pattern.compile("\"path\"\\s*:\\s*\\[(.*?)\\]");

    public static void main(String[] args) throws IOException {

        Path csvPath = Paths.get("/Users/amitabhabagchi/Downloads/automation_data/data_collection_5.csv");

        Set<String> getEndpoints = new LinkedHashSet<>();

        try (BufferedReader br = Files.newBufferedReader(csvPath)) {
            String line;

            while ((line = br.readLine()) != null) {

                // 🔥 IMPORTANT: normalize escaped quotes from CSV
                line = line.replace("\"\"", "\"");

                // Detect GET method
                if (GET_METHOD_PATTERN.matcher(line).find()) {

                    Matcher pathMatcher = PATH_PATTERN.matcher(line);

                    if (pathMatcher.find()) {
                        String rawPath = pathMatcher.group(1);

                        String endpoint = rawPath
                                .replace("\"", "")
                                .replaceAll("\\s*,\\s*", "/");

                        getEndpoints.add(endpoint);
                    }
                }
            }
        }

        System.out.println("GET Endpoints found:");
        getEndpoints.forEach(System.out::println);
    }
}
