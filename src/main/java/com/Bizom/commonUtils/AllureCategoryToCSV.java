package com.Bizom.commonUtils;//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.

import java.io.*;
import java.nio.file.*;
import java.util.*;
import org.json.JSONArray;
import org.json.JSONObject;

public class AllureCategoryToCSV {

    public static void main(String[] args) {
        // ✅ Input: path to categories.json
        String inputPath = "/Users/amitabhabagchi/Downloads/Allure_Reports/allure-report/data/categories.json"; // <-- change this
        // ✅ Output: path to save CSV
        String outputPath = "/Users/amitabhabagchi/Downloads/suites.csv";

        try {
            // Read the categories.json content
            String jsonText = new String(Files.readAllBytes(Paths.get(inputPath)));

            JSONArray categories;
            if (jsonText.trim().startsWith("[")) {
                categories = new JSONArray(jsonText);
            } else {
                JSONObject root = new JSONObject(jsonText);
                categories = root.optJSONArray("children");
                if (categories == null) {
                    System.err.println("No 'children' array found in root JSON.");
                    return;
                }
            }

            // Write to CSV
            try (PrintWriter writer = new PrintWriter(new FileWriter(outputPath))) {
                writer.println("Failure Reason,Impacted Count");

                for (int i = 0; i < categories.length(); i++) {
                    JSONObject category = categories.getJSONObject(i);
                    JSONArray children = category.optJSONArray("children");
                    if (children == null) continue;

                    for (int j = 0; j < children.length(); j++) {
                        JSONObject child = children.getJSONObject(j);
                        String reason = child.optString("name", "").replace(",", " ");
                        JSONArray impacted = child.optJSONArray("children");
                        int impactedCount = (impacted != null) ? impacted.length() : 0;

                        // 🔹 Compact long messages intelligently
                        String compactReason = compactText(reason, 180); // limit to 180 chars

                        writer.println(compactReason + "," + impactedCount);
                    }
                }
            }

            System.out.println("✅ CSV generated: " + outputPath);
        } catch (Exception e) {
            System.err.println("❌ Error processing JSON: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // ✂️ Utility method to trim long text safely
    private static String compactText(String text, int maxLength) {
        if (text == null) return "";
        text = text.trim();
        if (text.length() <= maxLength) return text;

        // Try to end cleanly at first punctuation or space near cutoff
        int cut = text.indexOf('.', maxLength / 2);
        if (cut == -1 || cut > maxLength) cut = text.indexOf(' ', maxLength / 2);
        if (cut == -1 || cut > maxLength) cut = maxLength;
        return text.substring(0, cut).trim() + "...";
    }
}