#set( $pound = '#' )
appengine-flexible-archetype
============================

This is a generated App Engine Flexible Java application from the appengine-flexible-archetype archetype.

$pound$pound Requirements

* [Java 8](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
* [Maven](https://maven.apache.org/download.cgi) (at least 3.3.9)
* [Gradle](https://gradle.org/gradle-download/) (optional)
* [Google Cloud SDK](https://cloud.google.com/sdk/) (aka gcloud)

Initialize the Google Cloud SDK using:

    gcloud init

This skeleton is ready to run.

$pound$pound Maven

$pound$pound$pound Run Locally

    mvn jetty:run

$pound$pound$pound Deploy

    mvn appengine:deploy

$pound$pound$pound Test Only

    mvn verify

$pound$pound Modify the Skeleton

As you add / modify the source code [(`src/main/java/...`)](src/main/java/) it's very useful to add unit testing
to [(`src/main/test/...`)](src/main/test/).  The following resources are quite useful:

* [Junit4](http://junit.org/junit4/)
* [Mockito](http://mockito.org/)
* [Truth](http://google.github.io/truth/)

$pound$pound Updating to latest Artifacts

An easy way to keep your projects up to date is to use the maven [Versions plugin][versions-plugin].

    mvn versions:display-plugin-updates
    mvn versions:display-dependency-updates
    mvn versions:use-latest-versions

Our usual process is to test, update the versions, then test again before committing back.

[plugin]: http://www.mojohaus.org/versions-maven-plugin/
