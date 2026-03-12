package com.Bizom.allure;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 * Utility class to filter Allure results and remove passed tests
 * This should be called after test execution to clean up Allure results
 * Can be run as a standalone Java program: java -cp ... com.Bizom.allure.AllureResultFilter
 */
public class AllureResultFilter {
    
    private static final String ALLURE_RESULTS_DIR = "Execution_Reports/Allure_Reports/allure-results";
    
    /**
     * Main method to run as standalone program
     */
    public static void main(String[] args) {
        filterPassedTests();
    }
    
    /**
     * Clear all old Allure results before starting a new build
     * This ensures that each new build starts with a clean slate
     * and doesn't accumulate failures from previous builds
     */
    public static void clearAllResults() {
        try {
            Path resultsDir = Paths.get(ALLURE_RESULTS_DIR);
            if (!Files.exists(resultsDir)) {
                Files.createDirectories(resultsDir);
                return;
            }
            
            File[] resultFiles = resultsDir.toFile().listFiles();
            if (resultFiles == null || resultFiles.length == 0) {
                return;
            }
            
            for (File file : resultFiles) {
                try {
                    if (file.isFile()) {
                        file.delete();
                    } else if (file.isDirectory()) {
                        // Recursively delete directories if any
                        deleteDirectory(file);
                    }
                } catch (Exception e) {
                    // Error handled silently - failure will be reported by test framework
                }
            }
            
        } catch (Exception e) {
            // Error handled silently - failure will be reported by test framework
        }
    }
    
    /**
     * Recursively delete a directory and its contents
     */
    private static void deleteDirectory(File directory) {
        if (directory.exists()) {
            File[] files = directory.listFiles();
            if (files != null) {
                for (File file : files) {
                    if (file.isDirectory()) {
                        deleteDirectory(file);
                    } else {
                        file.delete();
                    }
                }
            }
            directory.delete();
        }
    }
    
    /**
     * Filter out passed test results from Allure results directory
     * Only failed tests will remain in the results
     */
    public static void filterPassedTests() {
        try {
            Path resultsDir = Paths.get(ALLURE_RESULTS_DIR);
            if (!Files.exists(resultsDir)) {
                return;
            }
            
            // Wait a bit more to ensure all files are fully written
            Thread.sleep(1000);
            
            File[] resultFiles = resultsDir.toFile().listFiles((dir, name) -> name.endsWith("-result.json"));
            if (resultFiles == null || resultFiles.length == 0) {
                return;
            }
            
            for (File resultFile : resultFiles) {
                try {
                    // Check if file is still being written (file size is changing)
                    long initialSize = resultFile.length();
                    Thread.sleep(100); // Small delay
                    long finalSize = resultFile.length();
                    
                    if (initialSize != finalSize) {
                        // File still being written, skip for now
                        continue;
                    }
                    
                    try (BufferedReader reader = new BufferedReader(new FileReader(resultFile))) {
                        StringBuilder fileContent = new StringBuilder();
                        String line;
                        
                        // Read entire file content
                        while ((line = reader.readLine()) != null) {
                            fileContent.append(line);
                        }
                        
                        String content = fileContent.toString();
                        
                        // Skip empty files
                        if (content.trim().isEmpty()) {
                            continue;
                        }
                        
                        String status = extractStatus(content);
                        
                        // Only remove if status is explicitly "passed" (case-insensitive)
                        // Keep all other statuses (failed, skipped, broken, unknown) to be safe
                        if ("passed".equalsIgnoreCase(status)) {
                            resultFile.delete();
                        }
                    }
                } catch (IOException e) {
                    // Error handled silently - keep file to be safe
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                    break;
                }
            }
            
        } catch (Exception e) {
            // Error handled silently - failure will be reported by test framework
        }
    }
    
    /**
     * Extract status from JSON content
     * Looks for "status":"passed" or "status":"failed" etc.
     */
    private static String extractStatus(String jsonContent) {
        // Look for status field in JSON
        // Pattern: "status":"passed" or "status" : "passed"
        String[] patterns = {
            "\"status\"\\s*:\\s*\"(passed|failed|skipped|broken)\"",
            "'status'\\s*:\\s*'(passed|failed|skipped|broken)'"
        };
        
        for (String pattern : patterns) {
            java.util.regex.Pattern p = java.util.regex.Pattern.compile(pattern, java.util.regex.Pattern.CASE_INSENSITIVE);
            java.util.regex.Matcher m = p.matcher(jsonContent);
            if (m.find()) {
                return m.group(1).toLowerCase();
            }
        }
        
        // Fallback: simple string search
        if (jsonContent.toLowerCase().contains("\"status\"") && jsonContent.toLowerCase().contains("\"passed\"")) {
            return "passed";
        } else if (jsonContent.toLowerCase().contains("\"status\"") && jsonContent.toLowerCase().contains("\"failed\"")) {
            return "failed";
        } else if (jsonContent.toLowerCase().contains("\"status\"") && jsonContent.toLowerCase().contains("\"skipped\"")) {
            return "skipped";
        } else if (jsonContent.toLowerCase().contains("\"status\"") && jsonContent.toLowerCase().contains("\"broken\"")) {
            return "broken";
        }
        
        return "unknown";
    }
}

