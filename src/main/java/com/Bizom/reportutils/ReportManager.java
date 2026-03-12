package com.Bizom.reportutils;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;


import com.aventstack.extentreports.ExtentReports;
import com.aventstack.extentreports.ExtentTest;
import com.aventstack.extentreports.Status;
import com.aventstack.extentreports.reporter.ExtentSparkReporter;
import com.aventstack.extentreports.reporter.configuration.Theme;



public class ReportManager {
    public static ExtentSparkReporter htmlReporterAPI;
    public static ExtentReports extentAPI;
    public static Map<Long, ExtentTest> testMapAPI = new HashMap<>();
    public static ExtentTest testSuiteAPI;
    public static Map<String, ExtentTest> extentMapAPI = new HashMap<>();

    public static void startApiReport() {

        if (htmlReporterAPI == null) {
            String timeStamp = new SimpleDateFormat("dd.MM.yyyy.HH.mm.ss").format(new Date());
            String dateStamp = new SimpleDateFormat("dd.MM.yyyy").format(new Date());
            htmlReporterAPI = new ExtentSparkReporter(
                    System.getProperty("user.dir") + "/Execution_Reports/API_Reports/Bizom_API.html");
            
            // Configure theme and other settings BEFORE attaching to ExtentReports
            // This ensures consistent theme application across all pages
            htmlReporterAPI.config().setDocumentTitle(":: Bizom API Report ::");
            htmlReporterAPI.config().setReportName("** API REPORT **");
            // Set Dark Theme - must be set before attaching reporter
            htmlReporterAPI.config().setTheme(Theme.DARK);
            
            // Create and attach reporter after configuration
            extentAPI = new ExtentReports();
            extentAPI.attachReporter(htmlReporterAPI);
            extentAPI.setSystemInfo("Host Name", "Bizom Application");
            extentAPI.setSystemInfo("Environment", "devuitest.bziomdev.in");
            extentAPI.setSystemInfo("User Name", "Test Automation User");
        } else {
            // Ensure theme is set even if reporter already exists (for consistency)
            htmlReporterAPI.config().setTheme(Theme.DARK);
        }
    }

    public static void startTestAPI(String apiTestSuiteName, String... categories) {
        if (extentMapAPI.containsKey(apiTestSuiteName)) {
            extentAPI.removeTest(extentMapAPI.get(apiTestSuiteName));
            apiTestSuiteName = "Rerun - " + apiTestSuiteName;
        }
        testSuiteAPI = extentAPI.createTest(apiTestSuiteName);
        testSuiteAPI.assignCategory(categories);
        testMapAPI.put(Thread.currentThread().getId(), testSuiteAPI);

    }

    public static void createAPI_Node(String api_scenarioName) {

        testSuiteAPI.createNode(api_scenarioName);

    }

    public static void logPassAPI(String message) {
        ExtentTest currentTest = getCurrentAPITest();
        if (currentTest != null) {
            currentTest.log(Status.PASS, message);
        }

    }

    public static void logFailAPI(String message) {
        ExtentTest currentTest = getCurrentAPITest();
        if (currentTest != null) {
            currentTest.log(Status.FAIL, message);
        }

    }
    
    /**
     * Explicitly fail the current test in ExtentReports
     * This ensures the test is marked as FAILED, not just logged with FAIL status
     * 
     * @param message The failure message to log
     */
    public static void failCurrentTest(String message) {
        ExtentTest currentTest = getCurrentAPITest();
        if (currentTest != null) {
            currentTest.fail(message);
        }
    }

    public static void logInfoAPI(String message) {
        ExtentTest currentTest = getCurrentAPITest();
        if (currentTest != null) {
            currentTest.log(Status.INFO, message);
        }

    }

    public static void endCurrentAPITest() {
        ExtentTest currentTest = getCurrentAPITest();
        if (currentTest != null) {
            currentTest.getExtent().flush();
            testMapAPI.remove(Thread.currentThread().getId());
        }
    }

    public static ExtentTest getCurrentAPITest() {
        return testMapAPI.get(Thread.currentThread().getId());

    }

    public static void removePassedTest(ExtentTest test) {
        try {
            // Remove the test from extent report if it passed
            if (test != null && test.getExtent() != null) {
                extentAPI.removeTest(test);
                testMapAPI.remove(Thread.currentThread().getId());
            }
        } catch (Exception e) {
            // Error handled silently - failure will be reported by test framework
        }
    }

    public static void endAPIReport() {

        extentAPI.flush();
    }
    
    /**
     * Clear old Extent report files before starting a new build
     * This ensures each build starts with a clean report
     */
    public static void clearOldExtentReports() {
        try {
            String reportPath = System.getProperty("user.dir") + "/Execution_Reports/API_Reports/Bizom_API.html";
            File reportFile = new File(reportPath);
            
            if (reportFile.exists()) {
                if (reportFile.delete()) {
                    // Report file deleted successfully
                }
            }
            
            // Also clear any old report directories if they exist
            Path reportsDir = Paths.get(System.getProperty("user.dir") + "/Execution_Reports/API_Reports");
            if (Files.exists(reportsDir)) {
                File[] reportFiles = reportsDir.toFile().listFiles();
                if (reportFiles != null) {
                    for (File file : reportFiles) {
                        if (file.isFile() && file.getName().endsWith(".html")) {
                            file.delete();
                        }
                    }
                }
            }
        } catch (Exception e) {
            // Error handled silently - failure will be reported by test framework
        }
    }
}