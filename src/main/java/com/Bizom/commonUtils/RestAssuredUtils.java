package com.Bizom.commonUtils;

import static io.restassured.RestAssured.given;

import java.io.File;
import java.util.Map;

import com.Bizom.reportutils.ReportManager;

import io.restassured.RestAssured;
import io.restassured.authentication.PreemptiveBasicAuthScheme;
import io.restassured.builder.RequestSpecBuilder;
import io.restassured.config.DecoderConfig;
import io.restassured.config.RestAssuredConfig;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import io.restassured.specification.QueryableRequestSpecification;
import io.restassured.specification.RequestSpecification;
import io.restassured.specification.SpecificationQuerier;

public class RestAssuredUtils {

    public static String baseURI;
 //    public static final String baseURI = ConfigReader.getValue("baseURI");


    //  public static RequestSpecBuilder getSpec() {
//     RestAssured.config = RestAssuredConfig.config()
//           .encoderConfig(EncoderConfig.encoderConfig().appendDefaultContentCharsetToContentTypeIfUndefined(false))
//           .and().paramConfig(ParamConfig.paramConfig().queryParamsUpdateStrategy(UpdateStrategy.REPLACE));
//     return new RequestSpecBuilder().setBaseUri(baseURI).setRelaxedHTTPSValidation().setConfig(RestAssured.config);
//  }
    public static RequestSpecBuilder getSpec() {
        RestAssured.config = RestAssuredConfig.config().decoderConfig(DecoderConfig.decoderConfig().useNoWrapForInflateDecoding(true));
        //config(config().decoderConfig(decoderConfig().noContentDecoders();
        return new RequestSpecBuilder().setBaseUri(baseURI).setRelaxedHTTPSValidation().setConfig(RestAssured.config);
    }


    public static RequestSpecBuilder getJsonReqSpec() {
        PreemptiveBasicAuthScheme basicAuth = new PreemptiveBasicAuthScheme();
        basicAuth.setUserName("");
        basicAuth.setPassword("");
        return new RequestSpecBuilder().setBaseUri(baseURI).setRelaxedHTTPSValidation().setAuth(basicAuth)
                .setAccept("application/json").setContentType("application/json");
    }

    public static RequestSpecBuilder getXxxEncodedReqSpec() {
        PreemptiveBasicAuthScheme basicAuth = new PreemptiveBasicAuthScheme();
        basicAuth.setUserName("");
        basicAuth.setPassword("");
        return new RequestSpecBuilder().setBaseUri(baseURI).setRelaxedHTTPSValidation().setAuth(basicAuth)
                .setAccept("application/json").setContentType("application/x-www-form-urlencoded");
    }

    public static Response get(RequestSpecification specification, String resourceURI) {

        QueryableRequestSpecification queryable = SpecificationQuerier.query(specification);

        Response response = given().headers("Accept", "application/json, text/plain, */*", "Connection", "keep-alive", "Accept-Charset", "UTF-8").contentType(ContentType.JSON).spec(specification).when().get(resourceURI);
        String hdr = response.headers().toString();
        //RequestSpecification req = given().log().headers();
        //System.out.println("request headers areeeeee::::" +req.toString());

        //String hdr1 = response.bo.toString();
//     ReportManager.logInfoAPI("URL: " + resourceURI);
        ReportManager.logInfoAPI("Headerrrrsssssssss: " + hdr);
        ReportManager.logInfoAPI("<details><summary><font color=\"green\"><b>Click to view URL</b></font></summary><p><pre>" + resourceURI + "</pre></script></p></details>");
        ReportManager.logInfoAPI("<details><summary><font color=\"green\"><b>Click to view Header</b></font></summary><p><pre>" + hdr + "</pre></script></p></details>");
        return response;
    }

    public static Response get(RequestSpecification specification, Map<String, Object> pathParam, String resourceURI) {
        QueryableRequestSpecification queryable = SpecificationQuerier.query(specification);
        Response response = given().spec(specification).relaxedHTTPSValidation().when().pathParams(pathParam)
                .get(resourceURI);
//     ReportManager.logInfoAPI("URL: " + resourceURI);
        String hdr = response.headers().toString();
        ReportManager.logInfoAPI("<details><summary><font color=\"green\"><b>Click to view URL</b></font></summary><p><pre>" + resourceURI + "</pre></script></p></details>");
        ReportManager.logInfoAPI("<details><summary><font color=\"green\"><b>Click to view Header</b></font></summary><p><pre>" + hdr + "</pre></script></p></details>");
        return response;
    }

    public static Response get(RequestSpecification specification, String resourceURI, Map<String, Object> queryParam) {
        QueryableRequestSpecification queryable = SpecificationQuerier.query(specification);
        if (resourceURI.contains("?")) {
            resourceURI = resourceURI.substring(0, resourceURI.indexOf('?'));
        }
        Response response = given().spec(specification).relaxedHTTPSValidation().when()
                .queryParams(queryParam).get(resourceURI);
        String hdr = response.headers().toString();
//     ReportManager.logInfoAPI("URL: " + resourceURI);
        ReportManager.logInfoAPI("<details><summary><font color=\"green\"><b>Click to view URL</b></font></summary><p><pre>" + resourceURI + "</pre></script></p></details>");
        ReportManager.logInfoAPI("<details><summary><font color=\"green\"><b>Click to view Header</b></font></summary><p><pre>" + hdr + "</pre></script></p></details>");
        return response;
    }

    public static Response get(RequestSpecification specification, String resourceURI, Map<String, Object> queryParam,
                               Map<String, Object> pathParam) {
        QueryableRequestSpecification queryable = SpecificationQuerier.query(specification);
        if (resourceURI.contains("?")) {
            resourceURI = resourceURI.substring(0, resourceURI.indexOf('?'));
        }
        Response response = RestAssured.given().spec(specification).when().queryParams(queryParam).pathParams(pathParam)
                .get(resourceURI);
        return response;
    }

    public static Response get(RequestSpecification specification, String resourceURI, Map<String, Object> pathParam,
                               String body) {
        QueryableRequestSpecification queryable = SpecificationQuerier.query(specification);
        Response response = given().spec(specification).when().body(body).pathParams(pathParam).get(resourceURI);
        return response;
    }

    public static Response get(RequestSpecification specification, String resourceURI, Map<String, Object> pathParam,
                               Map<String, Object> queryParam, String body) {
        QueryableRequestSpecification queryable = SpecificationQuerier.query(specification);
        Response response = given().spec(specification).when().body(body).queryParams(queryParam).pathParams(pathParam)
                .get(resourceURI);

        return response;
    }

    public static Response get(RequestSpecification specification, String resourceURI, String body,
                               Map<String, Object> queryParam) {

        Response response = given().spec(specification).when().body(body).queryParams(queryParam).get(resourceURI);

        return response;
    }

    public static Response get(RequestSpecification specification, String resourceURI, String body) {
        Response response = given().spec(specification).relaxedHTTPSValidation().when().body(body)
                .get(resourceURI);

        return response;
    }

    public static Response post(RequestSpecification specification, Map<String, Object> pathParams, String resourceURI) {
        return given().spec(specification).body(pathParams).post(resourceURI);
    }

    public static Response post(RequestSpecification specification, String body, String resourceURI) {
        Response response;
        //Response response = null;
        if (resourceURI.contains("test/get_otp")) {
            specification = RestAssured.given();
            response = given().contentType(ContentType.JSON).spec(specification).relaxedHTTPSValidation().when().body(body)
                    .post(resourceURI);
        } else {
            //ReportManager.startApiReport();
            response = given().spec(specification).headers("Accept", "application/json, text/plain, */*", "Connection", "keep-alive", "Accept-Charset", "UTF-8").contentType(ContentType.JSON).relaxedHTTPSValidation().when().body(body)
                    .post(resourceURI);
        }

//     String hdr = response.headers().toString();
//     String hd = response.getBody().print();

        try {
            ReportManager.logInfoAPI("<details><summary><font color=\"green\"><b>Click to view URL</b></font></summary><p><pre>" + resourceURI + "</pre></script></p></details>");
            ReportManager.logInfoAPI("<details><summary><font color=\"green\"><b>Click to view Payload</b></font></summary><p><pre>" + body + "</pre></script></p></details>");

        } catch (Exception e) {

        }
        return response;
    }

    public static Response post(RequestSpecification specification, String body, Map<String, Object> pathParam,
                                String resourceURI) {
        QueryableRequestSpecification queryable = SpecificationQuerier.query(specification);

        Response response = given().contentType(ContentType.JSON).spec(specification).relaxedHTTPSValidation().when().pathParams(pathParam).body(body)
                .post(resourceURI);

        return response;
    }

    public static Response post(RequestSpecification specification, Map<String, Object> pathParam, String resourceURI,
                                File file) {
//     File file = new File(FilePath);
        QueryableRequestSpecification queryable = SpecificationQuerier.query(specification);

        Response response = given().contentType(ContentType.JSON).spec(specification).relaxedHTTPSValidation().when().pathParams(pathParam)
                .multiPart(file).post(resourceURI);

        return response;
    }

    public static Response post(RequestSpecification specification, Map<String, Object> pathParam,
                                Map<String, Object> queryParam, String resourceURI) {
        QueryableRequestSpecification queryable = SpecificationQuerier.query(specification);

        Response response = given().spec(specification).when().pathParams(pathParam).queryParams(queryParam)
                .post(resourceURI);

        return response;
    }

    public static Response post(RequestSpecification specification, String body, Map<String, Object> pathParam,
                                String resourceURI, Map<String, Object> queryParam) {
        QueryableRequestSpecification queryable = SpecificationQuerier.query(specification);

        Response response = given().spec(specification).when().queryParams(queryParam).pathParams(pathParam).body(body)
                .post(resourceURI);

        return response;
    }

    public static Response post(RequestSpecification specification, String body, String resourceURI,
                                Map<String, Object> queryParam) {
        QueryableRequestSpecification queryable = SpecificationQuerier.query(specification);

        Response response = given().spec(specification).when().queryParams(queryParam).body(body)
                .post(resourceURI);

        return response;
    }

    public static Response put(RequestSpecification specification, String body, String resourceURI) {

        Response response = given().spec(specification).relaxedHTTPSValidation().when().body(body)
                .put(resourceURI);

        return response;
    }


    public static Response put(RequestSpecification specification, String body, String resourceURI,
                               Map<String, Object> pathParam) {

        Response response = given().spec(specification).relaxedHTTPSValidation().when().pathParams(pathParam).body(body)
                .put(resourceURI);
        String hdr = response.headers().toString();
        ReportManager.logInfoAPI("<details><summary><font color=\"green\"><b>Click to view URL</b></font></summary><p><pre>" + resourceURI + "</pre></script></p></details>");
        ReportManager.logInfoAPI("<details><summary><font color=\"green\"><b>Click to view Header</b></font></summary><p><pre>" + hdr + "</pre></script></p></details>");
        return response;

    }

    public static Response put(RequestSpecification specification, String body, Map<String, Object> queryParam,
                               String resourceURI) {
        QueryableRequestSpecification queryable = SpecificationQuerier.query(specification);
        Response response = given().spec(specification).when().queryParams(queryParam).body(body).put(resourceURI);

        return response;
    }


    public static Response putPath(RequestSpecification specification, String body, Map<String, Object> pathParam,
                                   String resourceURI) {
        QueryableRequestSpecification queryable = SpecificationQuerier.query(specification);

        Response response = given().spec(specification).relaxedHTTPSValidation().when().pathParams(pathParam).body(body)
                .put(resourceURI);
        return response;
    }

    public static Response put(RequestSpecification specification, String body, Map<String, Object> queryParam,
                               String resourceURI, Map<String, Object> pathParam) {

        Response response = given().spec(specification).when().queryParams(queryParam).pathParams(pathParam).body(body)
                .put(resourceURI);

        return response;
    }

    public static Response patch(RequestSpecification specification, Map<String, Object> pathParam, String body,
                                 String resourceURI) {

        Response response = given().spec(specification).relaxedHTTPSValidation().when().pathParams(pathParam).body(body)
                .patch(resourceURI);


        return response;
    }

    public static Response patchWithTwoDynamicIds(RequestSpecification specification, Map<String, Object> pathParam, Map<String, Object> pathParam1, String body,
                                                  String resourceURI) {

        Response response = given().spec(specification).relaxedHTTPSValidation().when().pathParams(pathParam).pathParams(pathParam1).body(body)
                .patch(resourceURI);

        return response;
    }

    public static Response patchWithoutParams(RequestSpecification specification, String body, String resourceURI) {
        Response response = given().spec(specification).relaxedHTTPSValidation().when().body(body)
                .patch(resourceURI);

        return response;
    }

    public static Response delete(RequestSpecification specification, String resourceURI) {

        Response response = given().spec(specification).when().delete(resourceURI);

        return response;
    }

    public static Response delete(RequestSpecification specification, Map<String, Object> pathParam,
                                  String resourceURI) {

        Response response = given().spec(specification).when().pathParams(pathParam).delete(resourceURI);

        return response;
    }

    public static Response delete(RequestSpecification specification, Map<String, Object> pathParam, String resourceURI,
                                  Map<String, Object> queryParam) {

        Response response = given().spec(specification).when().queryParams(queryParam).pathParams(pathParam)
                .delete(resourceURI);

        return response;
    }

    public static Response delete(RequestSpecification specification, String resourceURI,
                                  Map<String, Object> queryParam) {

        Response response = given().spec(specification).when().queryParams(queryParam).delete(resourceURI);

        return response;
    }

    public static Response delete(RequestSpecification specification, String resourceURI,
                                  Map<String, Object> queryParam, Map<String, Object> pathParam) {

        Response response = given().spec(specification).when().queryParams(queryParam).pathParams(pathParam)
                .delete(resourceURI);
        return response;
    }

    public static Response delete(RequestSpecification specification, String resourceURI, Map<String, Object> pathParam,
                                  String body) {
        Response response = given().spec(specification).when().body(body).pathParams(pathParam).delete(resourceURI);
        return response;
    }

    public static Response delete(RequestSpecification specification, String resourceURI, Map<String, Object> pathParam,
                                  Map<String, Object> queryParam, String body) {
        Response response = given().spec(specification).when().body(body).queryParams(queryParam).pathParams(pathParam)
                .delete(resourceURI);
        return response;
    }

    public static Response delete(RequestSpecification specification, String resourceURI, String body,
                                  Map<String, Object> queryParam) {
        if (resourceURI.contains("?")) {
            resourceURI = resourceURI.substring(0, resourceURI.indexOf('?'));
        }
        Response response = given().spec(specification).when().queryParams(queryParam).body(body)
                .delete(resourceURI);
        return response;
    }

    public static Response delete(RequestSpecification specification, String resourceURI, String body) {
        Response response = given().spec(specification).body(body).when().delete(resourceURI);
        return response;
    }

    public static Response post(RequestSpecification specification, Map<String, Object> formParam, String formParameter,
                                String resourceURI, String FilePath) {
        File file = new File(FilePath);

        QueryableRequestSpecification queryable = SpecificationQuerier.query(specification);

        Response response = given().spec(specification).relaxedHTTPSValidation().when()
                .multiPart("file", file, "multipart/form-data")
                .formParams(formParam).post(resourceURI);


        String hdr = response.headers().toString();
//     ReportManager.logInfoAPI("URL: " + resourceURI);
//     ReportManager.logInfoAPI("Header: " + hdr);

        ReportManager.logInfoAPI("<details><summary><font color=\"green\"><b>Click to view URL</b></font></summary><p><pre>" + resourceURI + "</pre></script></p></details>");
        ReportManager.logInfoAPI("<details><summary><font color=\"green\"><b>Click to view Header</b></font></summary><p><pre>" + hdr + "</pre></script></p></details>");

        return response;

    }

    public static Response post(RequestSpecification specification, String resourceURI) {

        Response response = given().spec(specification).relaxedHTTPSValidation().when()
                .post(resourceURI);
        String hdr = response.headers().toString();
        ReportManager.logInfoAPI("<details><summary><font color=\"green\"><b>Click to view URL</b></font></summary><p><pre>" + resourceURI + "</pre></script></p></details>");
        ReportManager.logInfoAPI("<details><summary><font color=\"green\"><b>Click to view Header</b></font></summary><p><pre>" + hdr + "</pre></script></p></details>");

        return response;
    }


    public static Response postwithExcel(RequestSpecification specification,

                                         String resourceURI, String FilePath, String formatType) {

        File file = new File(FilePath);

        QueryableRequestSpecification queryable = SpecificationQuerier.query(specification);

        Response response = given().spec(specification).relaxedHTTPSValidation().when()

                .multiPart("file", file, formatType)

                .post(resourceURI);

        String hdr = response.headers().toString();

//                 ReportManager.logInfoAPI("URL: " + resourceURI);

//                 ReportManager.logInfoAPI("Header: " + hdr);

        ReportManager.logInfoAPI(
                "<details><summary><font color=\"green\"><b>Click to view BaseURI</b></font></summary><p><pre>"
                        + baseURI + "</pre></script></p></details>");

        ReportManager
                .logInfoAPI("<details><summary><font color=\"green\"><b>Click to view URL</b></font></summary><p><pre>"
                        + resourceURI + "</pre></script></p></details>");

        ReportManager.logInfoAPI(
                "<details><summary><font color=\"green\"><b>Click to view Header</b></font></summary><p><pre>" + hdr
                        + "</pre></script></p></details>");

        return response;

    }

    public static Response post(RequestSpecification specification, Map<String, Object> pathParam, String body, String resourceURI) {
//     File file = new File(FilePath);
//     QueryableRequestSpecification queryable = SpecificationQuerier.query(specification);

        Response response = given().contentType(ContentType.JSON).spec(specification).relaxedHTTPSValidation().when().pathParams(pathParam).body(body)
                .post(resourceURI);

        return response;
    }

    public static Response post(RequestSpecification specification, Map<String, Object> pathParam,Map<String, Object> formParam, String formParameter,
                                String resourceURI, String FilePath) {
        File file = new File(FilePath);

        QueryableRequestSpecification queryable = SpecificationQuerier.query(specification);

        Response response = given().spec(specification).relaxedHTTPSValidation().when()
                .pathParams(pathParam).multiPart("file", file, "multipart/form-data")
                .formParams(formParam).post(resourceURI);


        String hdr = response.headers().toString();
//     ReportManager.logInfoAPI("URL: " + resourceURI);
//     ReportManager.logInfoAPI("Header: " + hdr);

        ReportManager.logInfoAPI("<details><summary><font color=\"green\"><b>Click to view URL</b></font></summary><p><pre>" + resourceURI + "</pre></script></p></details>");
        ReportManager.logInfoAPI("<details><summary><font color=\"green\"><b>Click to view Header</b></font></summary><p><pre>" + hdr + "</pre></script></p></details>");

        return response;

    }
}
