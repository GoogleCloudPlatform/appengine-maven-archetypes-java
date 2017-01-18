#!/bin/bash

# Build Test Archetype
mvn verify

# Change path to generated archetype
pushd target/test-classes/projects/basic/project/basic

# Attempt to clean and deploy generated archetype
mvn clean appengine:deploy \
    -Dapp.deploy.version="${GOOGLE_VERSION_ID}" \
    -DskipTests=true

# End-2-End test the deployment
bash Jenkins.sh

# Pop from generated archetype
popd

