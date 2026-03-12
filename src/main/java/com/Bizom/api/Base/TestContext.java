package com.Bizom.api.Base;

/**
 * TestContext class that holds test execution context for each scenario
 * Uses ThreadLocal to enable cleanup from hooks
 */
public class TestContext {

    private ApiTestBase apiTestBase;
    
    // ThreadLocal to store current TestContext for cleanup from hooks
    private static final ThreadLocal<TestContext> currentContext = new ThreadLocal<>();

    public TestContext() {
        apiTestBase = new ApiTestBase();
        // Register this instance in ThreadLocal for cleanup access
        currentContext.set(this);
    }

    public ApiTestBase getApiTestBase() {
        return apiTestBase;
    }
    
    /**
     * Gets the current TestContext for the current thread
     * Used by hooks to access TestContext for cleanup
     * 
     * @return Current TestContext instance or null if not set
     */
    public static TestContext getCurrent() {
        return currentContext.get();
    }
    
    /**
     * Clears the ThreadLocal reference
     * Should be called after scenario completion to prevent memory leaks
     */
    public static void clearCurrent() {
        currentContext.remove();
    }
    
    /**
     * Cleans up this TestContext instance
     * Clears all data structures to release memory
     */
    public void cleanup() {
        if (apiTestBase != null) {
            // Clear large Response object
            apiTestBase.response = null;
            
            // Clear RequestSpecification
            apiTestBase.specification = null;
            
            // Clear RequestSpecBuilder
            apiTestBase.specBuilder = null;
            
            // Clear string request object
            apiTestBase.stringRequestObject = null;
            
            // Clear maps
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
        }
    }

}