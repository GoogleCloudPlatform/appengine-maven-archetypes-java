#!/bin/bash

# Fail on non-zero return and print
set -xe

# Build Test Archetype
mvn verify

# Change path to generated archetype
pushd target/test-classes/projects/basic/project/basic

# Attempt to clean and deploy generated archetype
mvn clean appengine:deploy \
    -Dapp.deploy.version="${GOOGLE_VERSION_ID}" \
    -DskipTests=true

# End-2-End tests
bash Jenkins.sh

# Clean and redploy using Gradle
mvn clean

# Delete Version $GOOGLE_VERSION_ID
gcloud -q app services set-traffic default --splits 1=1
gcloud -q app versions delete ${GOOGLE_VERSION_ID}

# Set deploy version
sed -i'.bak' -e "s/deploy {/deploy {\n version='${GOOGLE_VERSION_ID}'/g" build.gradle

# Deploy
gradle appengineDeploy

# End-2-End tests
bash Jenkins.sh

# Pop from generated archetype
popd


