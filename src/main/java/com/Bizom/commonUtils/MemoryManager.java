package com.Bizom.commonUtils;

import com.Bizom.api.Base.ApiTestBase;
import com.Bizom.api.Base.TestContext;

import java.lang.management.ManagementFactory;
import java.lang.management.MemoryMXBean;

/**
 * Utility class for managing memory and garbage collection in test scenarios
 * Helps prevent memory leaks by explicitly cleaning up test context objects
 * and suggesting garbage collection after each scenario
 */
public class MemoryManager {
    
    private static final boolean ENABLE_MEMORY_LOGGING = false; // Set to true for debugging
    private static final long MEMORY_THRESHOLD_MB = 500; // Log warning if memory exceeds this
    
    /**
     * Cleans up TestContext to release memory after scenario completion
     * This method safely clears all data structures without affecting reports
     * 
     * @param testContext The TestContext instance to clean up
     */
    public static void cleanupTestContext(TestContext testContext) {
        if (testContext == null) {
            return;
        }
        
        try {
            ApiTestBase apiTestBase = testContext.getApiTestBase();
            if (apiTestBase == null) {
                return;
            }
            
            // Clear large Response object (can be 1-10MB+ for large responses)
            if (apiTestBase.response != null) {
                apiTestBase.response = null;
            }
            
            // Clear RequestSpecification (can hold headers, base URIs, etc.)
            if (apiTestBase.specification != null) {
                apiTestBase.specification = null;
            }
            
            // Clear RequestSpecBuilder
            if (apiTestBase.specBuilder != null) {
                apiTestBase.specBuilder = null;
            }
            
            // Clear string request object
            apiTestBase.stringRequestObject = null;
            
            // Clear and reinitialize maps to release memory
            if (apiTestBase.requestMap != null) {
                apiTestBase.requestMap.clear();
            }
            
            if (apiTestBase.contextMap != null) {
                apiTestBase.contextMap.clear();
            }
            
            // Clear request data list
            if (apiTestBase.requestData != null) {
                apiTestBase.requestData.clear();
            }
            
        } catch (Exception e) {
            // Silently handle any cleanup errors to avoid disrupting test execution
            // Errors during cleanup should not fail tests
        }
    }
    
    /**
     * Suggests garbage collection to JVM
     * Note: This is a suggestion only - JVM may or may not perform GC immediately
     * This method is non-blocking and safe to call frequently
     */
    public static void suggestGarbageCollection() {
        try {
            // Suggest GC (non-blocking, JVM decides when to actually run GC)
            System.gc();
            
            // Small delay to allow GC to start if it decides to run
            // This is minimal overhead (~1-2ms) and helps in memory-intensive scenarios
            Thread.sleep(1);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        } catch (Exception e) {
            // Silently handle any errors
        }
    }
    
    /**
     * Performs complete cleanup: clears TestContext and suggests GC
     * This is the recommended method to call after each scenario
     * 
     * @param testContext The TestContext instance to clean up
     */
    public static void performCleanup(TestContext testContext) {
        cleanupTestContext(testContext);
        suggestGarbageCollection();
        
        // Optional: Log memory usage if enabled
        if (ENABLE_MEMORY_LOGGING) {
            logMemoryUsage();
        }
    }
    
    /**
     * Gets current memory usage in MB
     * Useful for monitoring and debugging
     * 
     * @return Current used memory in MB
     */
    public static long getUsedMemoryMB() {
        try {
            MemoryMXBean memoryBean = ManagementFactory.getMemoryMXBean();
            long usedMemory = memoryBean.getHeapMemoryUsage().getUsed();
            return usedMemory / (1024 * 1024); // Convert bytes to MB
        } catch (Exception e) {
            return -1; // Return -1 if unable to get memory info
        }
    }
    
    /**
     * Gets maximum available heap memory in MB
     * 
     * @return Maximum heap memory in MB
     */
    public static long getMaxMemoryMB() {
        try {
            MemoryMXBean memoryBean = ManagementFactory.getMemoryMXBean();
            long maxMemory = memoryBean.getHeapMemoryUsage().getMax();
            return maxMemory / (1024 * 1024); // Convert bytes to MB
        } catch (Exception e) {
            return -1;
        }
    }
    
    /**
     * Logs current memory usage (only if logging is enabled)
     * Helps identify memory leaks during test execution
     */
    private static void logMemoryUsage() {
        try {
            long usedMB = getUsedMemoryMB();
            long maxMB = getMaxMemoryMB();
            
            if (usedMB > 0 && maxMB > 0) {
                double usagePercent = (usedMB * 100.0) / maxMB;
                
                // Only log if memory usage is high
                if (usedMB > MEMORY_THRESHOLD_MB) {
                    System.out.println(String.format(
                        "[MemoryManager] Memory Usage: %d MB / %d MB (%.1f%%)",
                        usedMB, maxMB, usagePercent
                    ));
                }
            }
        } catch (Exception e) {
            // Silently handle logging errors
        }
    }
    
    /**
     * Clears static collections in CucumberHooksDef to prevent accumulation
     * Should be called periodically (e.g., every N scenarios) or at suite end
     * 
     * Note: This method uses reflection to access CucumberHooksDef static fields
     * If the class structure changes, this may need to be updated
     */
    public static void clearStaticCollections() {
        try {
            // Access CucumberHooksDef via reflection to clear static collections
            Class<?> hooksClass = Class.forName("com.Bizom.hooks.CucumberHooksDef");
            
            // Clear passedTests list (keep last 100 for reference)
            java.lang.reflect.Field passedTestsField = hooksClass.getField("passedTests");
            @SuppressWarnings("unchecked")
            java.util.ArrayList<String> passedTests = 
                (java.util.ArrayList<String>) passedTestsField.get(null);
            if (passedTests != null && passedTests.size() > 100) {
                passedTests.subList(0, passedTests.size() - 100).clear();
            }
            
            // Clear failedTests list (keep all failed tests for reporting)
            // Failed tests are important, so we don't clear them
            
            // Clear totalTestCases list (keep last 200 for reference)
            java.lang.reflect.Field totalTestCasesField = hooksClass.getField("totalTestCases");
            @SuppressWarnings("unchecked")
            java.util.ArrayList<String> totalTestCases = 
                (java.util.ArrayList<String>) totalTestCasesField.get(null);
            if (totalTestCases != null && totalTestCases.size() > 200) {
                totalTestCases.subList(0, totalTestCases.size() - 200).clear();
            }
            
        } catch (Exception e) {
            // Silently handle - reflection access may fail if class structure changes
            // This is a best-effort cleanup, not critical
        }
    }
}




