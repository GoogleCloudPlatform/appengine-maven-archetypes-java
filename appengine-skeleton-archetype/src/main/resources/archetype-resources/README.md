#set( $pound = '#' )
appengine-skeleton
==================

This is a generated application from the appengine-skeleton archetype.

See the [Google App Engine standard environment documentation][ae-docs] for more
detailed instructions.

[ae-docs]: https://cloud.google.com/appengine/docs/java/


* [Java 8](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
* [Maven](https://maven.apache.org/download.cgi) (at least 3.5)
* [Google Cloud SDK](https://cloud.google.com/sdk/) (aka gcloud)

$pound$pound Setup

    gcloud init
    gcloud beta auth application-default login

$pound$pound Maven
$pound$pound$pound Running locally

#if ( $CloudSDK_Tooling == "true" )
    mvn appengine:run
#else
    mvn appengine:devappserver
#end

$pound$pound$pound Deploying

#if ( $CloudSDK_Tooling == "true" )
    mvn appengine:deploy
#else
    mvn appengine:update
#end

$pound$pound Testing

    mvn verify

As you add / modify the source code (`src/main/java/...`) it's very useful to add
[unit testing](https://cloud.google.com/appengine/docs/java/tools/localunittesting)
to (`src/main/test/...`).  The following resources are quite useful:

* [Junit4](http://junit.org/junit4/)
* [Mockito](http://mockito.org/)
* [Truth](http://google.github.io/truth/)
