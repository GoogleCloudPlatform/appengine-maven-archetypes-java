#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
# Skeleton Google Cloud Endpoints Frameworks for App Engine using a discovery document

This generated sample provides a skeleton to get started with Cloud Endpoints
Frameworks for App Engine using a discovery document. This sample contains comments
of how to use the prior Endpoints Frameworks as well. For clarity, the prior Endpoints
Frameworks and the new Endpoints Frameworks are denoted as Endpoints Frameworks v1.0
and Endpoints Frameworks v2.0 respectively.

Google Cloud Endpoints Frameworks v2.0 provides new functionality which may
require payment and uses an OpenAPI specification instead of the discovery document.
The OpenAPI development process is explained [here][8] and a quickstart is
provided [here][9].

## Products
- [Google App Engine Standard][1]

## Language
- [Java][2]

## APIs
- [Google Cloud Endpoints Frameworks v2.0][8]
- [Google Cloud Endpoints Frameworks v1.0][3]

## Build and Deployment Plugins
- [Google Cloud Endpoints Frameworks Maven Plugin][10]
- [Google Cloud Endpoints Frameworks Gradle Plugin][11]

## Setup

1. Add your API method to `src/main/java/${packageInPathFormat}/YourFirstAPI.java`.

1. [Optional]: These sub steps are not required but you need this
   if you want to have auth protected methods.

    1. Update the values in `src/main/java/${packageInPathFormat}/Constants.java`
       to reflect the respective client IDs you have registered in the
       [APIs Console][6].

    1. You also need to supply the web client ID you have registered
       in the [APIs Console][4] to your client of choice (web, Android,
       iOS).

1. [Optional]: Use Cloud Endpoints Frameworks v1.0.

    - Uncomment Endpoints Frameworks v1.0 sections and comment
      Endpoints Frameworks v2.0 sections in the following files.

      ```
        pom.xml
        build.gradle
        src/main/webapp/WEB-INF/web.xml
      ```

###  Maven

1. Build a fresh binary with

    `mvn clean compile`

1. Run the application locally at [localhost:8080][5] with

    `mvn appengine:run`

1. Explore local server's api explorer with

  [localhost:8080/_ah/api/explorer][5]

1. Generate the client library in a zip file named `helloworld-v1-java.zip` with

    `mvn endpoints-framework:clientLibs`

1. Deploy your application to Google App Engine with

    `mvn appengine:deploy`

### Gradle

1. Build a fresh binary with

    `gradle clean compileJava`

1. Run the application locally at [localhost:8080][5] with

    `gradle appengineRun`

1. Explore local server's api explorer with

  [localhost:8080/_ah/api/explorer][5]


1. Generate the client library in a zip file named `helloworld-v1-java.zip` with

    `gradle endpointsClientLibs`

1. Deploy your application to Google App Engine with

    `gradle appengineDeploy`


[1]: https://developers.google.com/appengine
[2]: http://java.com/en/
[3]: https://developers.google.com/appengine/docs/java/endpoints/
[4]: https://developers.google.com/appengine/docs/java/tools/maven
[5]: https://localhost:8080/_ah/api/explorer
[6]: https://console.developers.google.com/
