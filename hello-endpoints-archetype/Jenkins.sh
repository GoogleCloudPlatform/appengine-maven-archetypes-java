#!/bin/bash

# Fail on non-zero return and print
set -xe

# Jenkins Test Script
function TestEndpoints () {
  # Test getGreeting Endpoint (hello world!)
  curl -X GET \
    "https://${2}-dot-${1}.appspot.com/_ah/api/helloworld/v1/hellogreeting/0" | \
    grep "hello version-${2}"

  # Test getGreeting Endpoint (goodbye world!)
  curl -X GET \
    "https://${2}-dot-${1}.appspot.com/_ah/api/helloworld/v1/hellogreeting/1" | \
    grep "goodbye world!"

  # Test listGreeting Endpoint (hello world! and goodbye world!)
  curl -X GET \
    "https://${2}-dot-${1}.appspot.com/_ah/api/helloworld/v1/hellogreeting" | \
    grep "hello world!\|goodbye world!"

  # Test multiply Endpoint (This is a greeting.)
  curl -X POST \
    -H "Content-Type: application/json" \
    --data "{'message':'This is a greeting from instance ${2}'}." \
    "https://${2}-dot-${1}.appspot.com/_ah/api/helloworld/v1/hellogreeting/1" | \
    grep "This is a greeting from instance ${2}."
}

# Build Test Archetype
mvn verify

# Change path to generated archetype
pushd target/test-classes/projects/basic/project/basic

# Jenkins provides values for GOOGLE_PROJECT_ID and GOOGLE_VERSION_ID
# Update Greetings.java
sed -i'.bak' -e "s/hello world!/hello version-${GOOGLE_VERSION_ID}!/g" src/main/java/it/pkg/Greetings.java

# Attempt to clean and deploy generated archetype
mvn clean appengine:deploy \
    -Dapp.deploy.version="${GOOGLE_VERSION_ID}"

# End-2-End tests
TestEndpoints "${GOOGLE_PROJECT_ID}" "${GOOGLE_VERSION_ID}"

# Clean
mvn clean

# Set deploy version
sed -i'.bak' -e "s/deploy {/deploy {\n version='${GOOGLE_VERSION_ID}'/g" build.gradle

# Modify Greetings.java for Gradle
sed -i'.bak' -e "s/hello version-${GOOGLE_VERSION_ID}!/hello version-gradle-${GOOGLE_VERSION_ID}!/g" src/main/java/it/pkg/Greetings.java

# Deploy
gradle appengineDeploy

# End-2-End tests
TestEndpoints "${GOOGLE_PROJECT_ID}" "gradle-${GOOGLE_VERSION_ID}"

# Clean up
gradle clean

# Pop from generated archetype
popd


