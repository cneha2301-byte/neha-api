package com.Bizom.runner;

import com.Bizom.NG_Listeners.APIEvent;
import com.Bizom.NG_Listeners.SuiteEvent;
import com.Bizom.api.Base.TestContext;
import com.Bizom.commonUtils.RestAssuredUtils;
import com.Bizom.stepDefinitions.ApiBackgroundSteps;
import com.Bizom.stepDefinitions.ApiResponseValidationSteps;
import com.Bizom.stepDefinitions.PostSteps;
import io.cucumber.testng.CucumberOptions;
import io.cucumber.testng.FeatureWrapper;
import io.cucumber.testng.PickleWrapper;
import io.cucumber.testng.TestNGCucumberRunner;
import org.testng.annotations.*;

import java.util.HashMap;

@Listeners({ SuiteEvent.class, APIEvent.class })

@CucumberOptions(features = { "src/test/java/com/Bizom/IntegrationAPI/feature" },tags="@EdituserwithHQ001", glue = {

        "com/Bizom/hooks", "com/Bizom/stepDefinitions"}, plugin = {
        "pretty", "html:target/site/cucumber-pretty/cucumber.html", "json:target/cucumber/cucumber.json",
        "rerun:target/api_rerun.txt", "io.qameta.allure.cucumber7jvm.AllureCucumber7Jvm"}, monochrome = true, publish = true, dryRun = false)
//
public class IntegrationAPI_Runner {

    private TestNGCucumberRunner testNGCucumberRunner;

    @BeforeClass(alwaysRun = true)
    public void setUpClass() throws Exception {
        testNGCucumberRunner = new TestNGCucumberRunner(this.getClass());
        System.out.println("@Before class");
        setupAccessToken();
    }
    private void setupAccessToken() {
        try {
            System.out.println("=== Setting up Access Token ===");

            TestContext testContext = new TestContext();

            PostSteps postSteps = new PostSteps(testContext);
            ApiBackgroundSteps backgroundSteps = new ApiBackgroundSteps(testContext);
            ApiResponseValidationSteps validationSteps = new ApiResponseValidationSteps(testContext);

            backgroundSteps.baseUriForTransactions();
            if (testContext.getApiTestBase().requestMap == null) {
                testContext.getApiTestBase().requestMap = new HashMap<>();
            }
            testContext.getApiTestBase().specification = RestAssuredUtils.getSpec().build();
            System.out.println("Specification initialized using RestAssuredUtils.getSpec().build()");

            postSteps.postWithXmlPayload("config_user");
            validationSteps.postApplicationWithFullPathXML("accessToken");

            System.out.println("Access token stored as: accessToken.xml");

        } catch (Throwable e) {
            throw new RuntimeException("Failed to setup access token", e);
        }
    }

    @Test(groups = "cucumber", description = "Run Cucumber Scenario", dataProvider = "scenarios")
    public void scenario(PickleWrapper pickleEventWrapper, FeatureWrapper cucumberFeatureWrapper) throws Throwable {
        testNGCucumberRunner.runScenario(pickleEventWrapper.getPickle());
    }

    @DataProvider(parallel = false)
    public Object[][] scenarios() {
        System.out.println("@Data provider");
        if (testNGCucumberRunner == null) {
            testNGCucumberRunner = new TestNGCucumberRunner(this.getClass());
        }

        return testNGCucumberRunner.provideScenarios();
    }

    @AfterClass(alwaysRun = true)
    public void tearDownClass() {
        System.out.println("@Afterclass");
        testNGCucumberRunner.finish();
    }
}
