#!/bin/bash

# Copyright 2017 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

export GOOGLE_PROJECT_ID=maven-archetypes-java
export GOOGLE_VERSION_ID=${BUILD_ID}
export CLOUDSDK_ACTIVE_CONFIG_NAME=ae-maven-archetypes-java

apt-get clean && apt-get update
apt-get install -qqy expect shellcheck unzip wget maven gradle

# Install gcloud
if [ ! -d ${HOME}/google-cloud-sdk ]; then
    pushd ${HOME}
    wget https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz --directory-prefix=${HOME}
    tar xzf google-cloud-sdk.tar.gz
    ./google-cloud-sdk/install.sh --usage-reporting false --path-update false --command-completion false
    popd
fi

export PATH=${HOME}/google-cloud-sdk/bin:${HOME}/appengine-java-sdk/bin:${PATH}
gcloud -q components update app-engine-java
java -version

# Activate the service account.
gcloud config configurations create ${CLOUDSDK_ACTIVE_CONFIG_NAME} || /bin/true
gcloud -q auth activate-service-account --key-file ${KOKORO_GFILE_DIR}/secrets-password.txt
gcloud -q config set project ${GOOGLE_PROJECT_ID}

## BEGIN TESTS ##
gcloud info

# Test hello-endpoints-archetype/
pushd github/appengine-maven-archetypes-java/hello-endpoints-archetype

# Run tests for hello-endpoints-archetype
bash Jenkins.sh
popd 
# End of hello-endpoints-archetype
