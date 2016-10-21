appengine-standard-archetype
============================

This is a generated App Engine Standard Java application from the appengine-standard-archetype archetype.

## Requirements

* Java 7
* [Maven](https://maven.apache.org/download.cgi) (at least 3.3.9)
* [Gradle](https://gradle.org/gradle-download/) (optional)
* [Google Cloud SDK](https://cloud.google.com/sdk/) (aka gcloud)

Initialize the Google Cloud SDK using:

    gcloud init

This skeleton is ready to run.

## Maven

### Run Locally

    mvn appengine:run

### Deploy

    mvn appengine:deploy

### Test Only

    mvn test

## Gradle

### Run Locally

    gradle appengineRun

### Deploy

    gradle appengineDeploy

### Test Only

    gradle test

## Modify the Skeleton

As you add / modify the source code (`src/main/java/...`) it's very useful to add [unit testing](https://cloud.google.com/appengine/docs/java/tools/localunittesting)
to (`src/main/test/...`).  The following resources are quite useful:

* [Junit4](http://junit.org/junit4/)
* [Mockito](http://mockito.org/)
* [Truth](http://google.github.io/truth/)
