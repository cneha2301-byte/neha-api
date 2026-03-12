package com.Bizom.commonUtils;

/**
 * Utility class to control console logging output
 * Set system property "console.logging.enabled=false" to disable verbose console output
 * This helps reduce console log size in Jenkins/IntelliJ for large test suites
 */
public class LoggingUtility {
    
    private static final String CONSOLE_LOGGING_PROPERTY = "console.logging.enabled";
    private static final boolean DEFAULT_LOGGING_ENABLED = false; // Default to minimal logging
    
    /**
     * Check if console logging is enabled
     * @return true if logging is enabled, false otherwise
     */
    public static boolean isLoggingEnabled() {
        String property = System.getProperty(CONSOLE_LOGGING_PROPERTY);
        if (property == null) {
            return DEFAULT_LOGGING_ENABLED;
        }
        return Boolean.parseBoolean(property);
    }
    
    /**
     * Print message only if console logging is enabled
     * @param message Message to print
     */
    public static void log(String message) {
        if (isLoggingEnabled()) {
            System.out.println(message);
        }
    }
    
    /**
     * Print error message (always printed, regardless of logging setting)
     * @param message Error message to print
     */
    public static void logError(String message) {
        System.err.println("[ERROR] " + message);
    }
    
    /**
     * Print warning message (always printed, regardless of logging setting)
     * @param message Warning message to print
     */
    public static void logWarning(String message) {
        System.err.println("[WARNING] " + message);
    }
    
    /**
     * Print failure message (always printed for failed tests)
     * @param message Failure message to print
     */
    public static void logFailure(String message) {
        System.err.println("[FAILURE] " + message);
    }
    
    /**
     * Print test execution summary (always printed)
     * @param message Summary message to print
     */
    public static void logSummary(String message) {
        System.out.println("[SUMMARY] " + message);
    }
}


