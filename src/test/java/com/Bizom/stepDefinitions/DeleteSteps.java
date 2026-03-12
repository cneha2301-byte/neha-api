package com.Bizom.stepDefinitions;

import com.Bizom.api.Base.TestContext;
import com.Bizom.ccl.WS_PayloadsHeaders;
import com.Bizom.commonUtils.ResourceURIS;
import com.Bizom.commonUtils.RestAssuredUtils;

import io.cucumber.java.en.When;

public class DeleteSteps {

    private TestContext apiTestContext;

    public DeleteSteps(TestContext apiTestContext) {
        this.apiTestContext = apiTestContext;
    }

    @When("^I send the DELETE request to \"([^\"]*)\" endpoint$")
    public void delete(String fileName) {
        if (apiTestContext.getApiTestBase().requestMap.isEmpty()) {
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.REQUEST_NAME.name(), fileName);
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                    ResourceURIS.getResourceURI(fileName));
        }
        apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);
        apiTestContext.getApiTestBase().response = RestAssuredUtils.get(apiTestContext.getApiTestBase().specification,
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()));

    }

}
