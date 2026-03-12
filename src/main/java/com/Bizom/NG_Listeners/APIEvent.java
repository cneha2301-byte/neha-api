package com.Bizom.NG_Listeners;

import org.testng.ITestContext;
import org.testng.ITestListener;
import org.testng.ITestResult;

import com.Bizom.reportutils.*;
import com.aventstack.extentreports.ExtentTest;

import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.util.ArrayList;
import java.util.List;


public class APIEvent implements ITestListener {


    @Override
    public void onTestStart(ITestResult arg0) {
    }
    @Override
    public void onTestSuccess(ITestResult iTestResult) {
        // Remove passed tests from Extent Report - only keep failed tests
        try {
            ExtentTest currentTest = ReportManager.getCurrentAPITest();
            if (currentTest != null) {
                ReportManager.removePassedTest(currentTest);
            }
        } catch (Exception e) {
            // Error handled silently - failure will be reported by test framework
        }
    }

    @Override
    public void onTestFailure(ITestResult iTestResult) {
        try {
            // Ensure test exists before logging failure
            ExtentTest currentTest = ReportManager.getCurrentAPITest();
            if (currentTest != null) {
                String errorMessage = iTestResult.getThrowable() != null 
                    ? iTestResult.getThrowable().toString() 
                    : "Test failed with unknown error";
                
                // Explicitly fail the test using fail() method to ensure it's marked as FAILED
                currentTest.fail(errorMessage);
                
                // Also log the failure for additional context
                ReportManager.logFailAPI("Test execution failed: " + errorMessage);
                
                ReportManager.endCurrentAPITest();
            }
        } catch (Exception e) {
            // Error handled silently - failure will be reported by test framework
        }
    }

    @Override
    public void onTestSkipped(ITestResult arg0) {
        // TODO Auto-generated method stub

    }

    @Override
    public void onFinish(ITestContext arg0) {
        // TODO Auto-generated method stub

    }

    @Override
    public void onStart(ITestContext arg0) {

    }

    @Override
    public void onTestFailedButWithinSuccessPercentage(ITestResult arg0) {
        // TODO Auto-generated method stub

    }

    public static List<String> getParameterNames(Method method) {
        Parameter[] parameters = method.getParameters();
        List<String> parameterNames = new ArrayList<>();

        for (Parameter parameter : parameters) {
            if(!parameter.isNamePresent()) {
                throw new IllegalArgumentException("Parameter names are not present!");
            }

            String parameterName = parameter.getName();
            parameterNames.add(parameterName);
        }

        return parameterNames;
    }

}