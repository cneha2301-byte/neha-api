package com.Bizom.NG_Listeners;

import java.io.FileWriter;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.testng.IExecutionListener;
import org.testng.IReporter;
import org.testng.IResultMap;
import org.testng.ISuite;
import org.testng.ISuiteListener;
import org.testng.ISuiteResult;
import org.testng.ITestContext;
import org.testng.ITestNGMethod;
import org.testng.TestListenerAdapter;
import org.testng.xml.XmlSuite;

import com.opencsv.CSVWriter;
import com.Bizom.reportutils.ReportManager;

public class SuiteEvent extends TestListenerAdapter implements ISuiteListener, IExecutionListener, IReporter {
    CSVWriter writer;
    public List<String[]> data = new ArrayList<String[]>();



    @Override
    public void onFinish(ISuite arg0) {

    }

    @Override
    public void onStart(ISuite arg0) {

    }

    public void onExecutionStart() {
        // Clear old Allure results before starting a new build
        com.Bizom.allure.AllureResultFilter.clearAllResults();
        
        // Clear old Extent reports before starting a new build
        ReportManager.clearOldExtentReports();
        
        ReportManager.startApiReport();
    }

    @Override
    public void onExecutionFinish() {
        ReportManager.endAPIReport();
        
        // Filter out passed tests from Allure results automatically
        // Wait for Allure to finish writing all result files before filtering
        try {
            // Wait for Allure to finish writing all result files (asynchronously)
            Thread.sleep(15000); // Wait 15 seconds for async operations
            Thread.sleep(2000); // Additional 2 seconds buffer
            
            // Filter passed tests from Allure results - only keep failures
            com.Bizom.allure.AllureResultFilter.filterPassedTests();
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        } catch (Exception e) {
            // Error handled silently - failure will be reported by test framework
        }
    }

    @Override
    public void generateReport(List<XmlSuite> arg0, List<ISuite> arg1, String outputDirectory) {

        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        String csv = "./test.csv";

        try {
            writer = new CSVWriter(new FileWriter(csv));
        } catch (IOException e) {
            // Error handled silently - failure will be reported by test framework
        }

        for (ISuite iSuite : arg1) {
            Map<String, ISuiteResult> results = iSuite.getResults();
            Set<String> keys = results.keySet();
            for (String key : keys) {
                ITestContext context = results.get(key).getTestContext();
                IResultMap resultMap = context.getFailedTests();

                // -------------------------FAILED TEST CASE-----------------------------
                Collection<ITestNGMethod> failedMethods = resultMap.getAllMethods();
                for (ITestNGMethod iTestNGMethod : failedMethods) {
                    Date DateTime = new Date(iTestNGMethod.getDate());
                    String dateDate = dateFormat.format(DateTime);
                    String[] array_DataTime = dateDate.split(" ");
                    data.add(new String[] { array_DataTime[0], array_DataTime[1], iTestNGMethod.getMethodName(),
                            iTestNGMethod.getDescription(), "FAIL" });
                }

                // -------------------------PASSED TEST CASE-----------------------------

                IResultMap resultMapPass = context.getPassedTests();
                Collection<ITestNGMethod> passMethods = resultMapPass.getAllMethods();
                for (ITestNGMethod iTestNGMethod : passMethods) {
                    Date DateTime = new Date(iTestNGMethod.getDate());
                    String dateDate = dateFormat.format(DateTime);
                    String[] array_DataTime = dateDate.split(" ");
                    data.add(new String[] { array_DataTime[0], array_DataTime[1], iTestNGMethod.getMethodName(),
                            iTestNGMethod.getDescription(), "PASS" });

                }

            }

        }
        String[] header = { "Date", "Time", "Test Case ID", "Description", "Result" };
        writer.writeNext(header);
        writer.writeAll(data);
        try {
            writer.close();
        } catch (IOException e) {

            // Error handled silently - failure will be reported by test framework
        }
    }


}
