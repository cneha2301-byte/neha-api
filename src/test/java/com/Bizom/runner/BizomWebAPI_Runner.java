package com.Bizom.runner;

import com.Bizom.NG_Listeners.APIEvent;
import com.Bizom.NG_Listeners.SuiteEvent;
import com.Bizom.api.Base.TestContext;
import com.Bizom.commonUtils.RestAssuredUtils;
import com.Bizom.stepDefinitions.ApiBackgroundSteps;
import com.Bizom.stepDefinitions.ApiResponseValidationSteps;
import com.Bizom.stepDefinitions.GetSteps;
import com.Bizom.stepDefinitions.PostSteps;
import io.cucumber.testng.CucumberOptions;
import io.cucumber.testng.FeatureWrapper;
import io.cucumber.testng.PickleWrapper;
import io.cucumber.testng.TestNGCucumberRunner;
import org.testng.annotations.*;

import java.util.HashMap;

@Listeners({ SuiteEvent.class, APIEvent.class })

@CucumberOptions(features = { "src/test/java/com/Bizom/BizomWebAPI/feature" },tags="@negagd", glue = {
        "com/Bizom/hooks", "com/Bizom/stepDefinitions"}, plugin = {
        "html:target/site/cucumber-pretty/cucumber.html", "json:target/cucumber/cucumber.json",
        "rerun:target/api_rerun.txt", "io.qameta.allure.cucumber7jvm.AllureCucumber7Jvm"}, monochrome = true, publish = false, dryRun = false)
//
public class BizomWebAPI_Runner {

    private TestNGCucumberRunner testNGCucumberRunner;

    @BeforeClass(alwaysRun = true)
    public void setUpClass() throws Exception {
        testNGCucumberRunner = new TestNGCucumberRunner(this.getClass());
        setupAccessToken();
    }
    private void setupAccessToken() {
        try {
            TestContext testContext = new TestContext();

            PostSteps postSteps = new PostSteps(testContext);
            ApiBackgroundSteps backgroundSteps = new ApiBackgroundSteps(testContext);
            ApiResponseValidationSteps validationSteps = new ApiResponseValidationSteps(testContext);

            RestAssuredUtils.baseURI ="https://devapi.bizomdev.in/";
            if (testContext.getApiTestBase().requestMap == null) {
                testContext.getApiTestBase().requestMap = new HashMap<>();
            }
            testContext.getApiTestBase().specification = RestAssuredUtils.getSpec().build();

            postSteps.postWithXmlPayload("config_user");
            validationSteps.postApplicationWithFullPathXML("accessToken");

        } catch (Exception e) {
            throw new RuntimeException("Failed to setup access token: " + e.getMessage(), e);
        }
    }

    @Test(groups = "cucumber", description = "Run Cucumber Scenario", dataProvider = "scenarios")
    public void scenario(PickleWrapper pickleEventWrapper, FeatureWrapper cucumberFeatureWrapper) throws Throwable {
        testNGCucumberRunner.runScenario(pickleEventWrapper.getPickle());
    }

    @DataProvider(parallel = false)
    public Object[][] scenarios() {
        if (testNGCucumberRunner == null) {
            testNGCucumberRunner = new TestNGCucumberRunner(this.getClass());
        }

        return testNGCucumberRunner.provideScenarios();
    }

    @AfterClass(alwaysRun = true)
    public void tearDownClass() {
        testNGCucumberRunner.finish();
    }


    @AfterMethod(alwaysRun = true)
    public void logOutUser() {
    //    userLogout();
    }

    public static  void userLogout() {
        try {
            TestContext testContext = new TestContext();

            GetSteps getSteps = new GetSteps(testContext);

            RestAssuredUtils.baseURI = "https://devuitest.bizomdev.in/";
            testContext.getApiTestBase().specification = RestAssuredUtils.getSpec().build();

            getSteps.get("logout_user");

            testContext.getApiTestBase().specification = null;

        } catch (Exception e) {
            throw new RuntimeException("Failed to logout user: " + e.getMessage(), e);
        }

    }


}
