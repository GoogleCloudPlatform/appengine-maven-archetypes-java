App Engine Java Guestbook
=========================

Sample guestbook for use with App Engine Java.

## Requirements

* Java 7
* [Maven](https://maven.apache.org/download.cgi) (at least 3.3.9)
* [Google Cloud SDK](https://cloud.google.com/sdk/) (aka gcloud)

WARNING: Java 7 is REQUIRED when you use JSP's locally.

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


For further information, consult the [Java App Engine](https://developers.google.com/appengine/docs/java/overview) documentation.

To see all the available goals for the App Engine plugin, run

    mvn help:describe -Dplugin=appengine
