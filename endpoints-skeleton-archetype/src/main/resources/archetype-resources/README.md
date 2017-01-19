#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
endpoints-skeleton
==================

A skeleton application for Google Cloud Endpoints in Java.

## Products
- [App Engine][1]

## Language
- [Java][2]

## APIs
- [Google Cloud Endpoints][3]
- [Google App Engine Maven plugin][4]

## Setup Instructions

1. Add your API method to `src/main/java/${packageInPathFormat}/YourFirstAPI.java`.

1. [Optional]: These sub steps are not required but you need this
   if you want to have auth protected methods.

    1. Update the values in `src/main/java/${packageInPathFormat}/Constants.java`
       to reflect the respective client IDs you have registered in the
       [APIs Console][6].

    1. You also need to supply the web client ID you have registered
       in the [APIs Console][4] to your client of choice (web, Android,
       iOS).

1. [Optional]: Use Endpoints Frameworks v1.0.

    * Uncomment commented Endpoints Frameworks v1.0 sections and comment
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
