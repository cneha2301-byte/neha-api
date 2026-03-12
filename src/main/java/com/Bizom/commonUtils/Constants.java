package com.Bizom.commonUtils;

public class Constants {

    //extent report path



    // inside reporting modification
    public static final String ICON_SOCIAL_LINKEDIN_URL = "https://www.linkedin.com/in/author";
    public static final String ICON_SOCIAL_GITHUB_URL = "github.com/manojpraba/";
    public static final String ICON_SOCIAL_LINKEDIN = "<a href='" + ICON_SOCIAL_LINKEDIN_URL
            + "'><i class='fa fa-linkedin-square' style='font-size:24px'></i></a>";
    public static final String ICON_SOCIAL_GITHUB = "<a href='" + ICON_SOCIAL_GITHUB_URL
            + "'><i class='fa fa-github-square' style='font-size:24px'></i></a>";



    public static final String RESOURCE_DIR = "./src/test/resources/";
    public static final String DATAINPUT_DIR="./src/test/resources/ApiTestData/";
    public static final String CONFIG_DIR = "./src/test/resources/Configurations/";
    public static final String JSON_CONTENTTYPE="application/json";
    public static final String JSONINPUT_DIR="./src/test/resources/InputData/";
    public static final String XMLINPUT_DIR="./src/test/resources/InputData/";
    
    // HTTP Status Codes
    public static final int STATUS_200_OK = 200;
    public static final int STATUS_201_CREATED = 201;
    public static final int STATUS_202_ACCEPTED = 202;
    public static final int STATUS_204_NO_CONTENT = 204;
    public static final int STATUS_400_BAD_REQUEST = 400;
    public static final int STATUS_401_UNAUTHORIZED = 401;
    public static final int STATUS_403_FORBIDDEN = 403;
    public static final int STATUS_404_NOT_FOUND = 404;
    public static final int STATUS_405_METHOD_NOT_ALLOWED = 405;
    public static final int STATUS_409_CONFLICT = 409;
    public static final int STATUS_422_UNPROCESSABLE_ENTITY = 422;
    public static final int STATUS_500_INTERNAL_SERVER_ERROR = 500;
    public static final int STATUS_502_BAD_GATEWAY = 502;
    public static final int STATUS_503_SERVICE_UNAVAILABLE = 503;
    public static final int STATUS_504_GATEWAY_TIMEOUT = 504;
}
