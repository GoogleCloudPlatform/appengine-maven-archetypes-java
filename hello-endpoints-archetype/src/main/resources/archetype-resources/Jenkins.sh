#!/bin/bash

# Fail on non-zero return
set -xe

# Jenkins Test Script
# Test getGreeting Endpoint (hello world!)
curl -X GET \
  "https://${GOOGLE_PROJECT_ID}.appspot.com/_ah/api/helloworld/v1/hellogreeting/0" | \
  grep "hello world!"

# Test getGreeting Endpoint (goodbye world!)
curl -X GET \
  "https://${GOOGLE_PROJECT_ID}.appspot.com/_ah/api/helloworld/v1/hellogreeting/1" | \
  grep "goodbye world!"

# Test listGreeting Endpoint (hello world! and goodbye world!)
curl -X GET \
  "https://${GOOGLE_PROJECT_ID}.appspot.com/_ah/api/helloworld/v1/hellogreeting" | \
  grep "hello world!\|goodbye world!"

# Test multiply Endpoint (This is a greeting.)
curl -X POST \
  -H "Content-Type: application/json" \
  --data "{'message':'This is a greeting from instance ${GOOGLE_VERSION_ID}'}." \
  "https://${GOOGLE_PROJECT_ID}.appspot.com/_ah/api/helloworld/v1/hellogreeting/1" | \
  grep "This is a greeting from instance ${GOOGLE_VERSION_ID}."
