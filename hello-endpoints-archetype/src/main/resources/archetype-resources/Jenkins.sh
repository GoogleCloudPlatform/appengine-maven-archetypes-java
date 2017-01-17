#!/bin/bash

# Jenkins Test Script
# Test getGreeting Endpoint (hello world!)
curl -X GET \
  "https://${GOOGLE_PROJECT_ID}.appspot.com/_ah/api/helloworld/v1/hellogreeting/0" | \
  tee /dev/tty | grep "hello world!"

# Test getGreeting Endpoint (goodbye world!)
curl -X GET \
  "https://${GOOGLE_PROJECT_ID}.appspot.com/_ah/api/helloworld/v1/hellogreeting/1" | \
  tee /dev/tty | grep "goodbye world!"

# Test listGreeting Endpoint (hello world! and goodbye world!)
curl -X GET \
  "https://${GOOGLE_PROJECT_ID}.appspot.com/_ah/api/helloworld/v1/hellogreeting" | \
  tee /dev/tty | grep "hello world!\|goodbye world!"

# Test multiply Endpoint (This is a greeting.)
curl -X POST \
  -H "Content-Type: application/json" \
  --data "{'message':'This is a greeting.'}" \
  "https://${GOOGLE_PROJECT_ID}.appspot.com/_ah/api/helloworld/v1/hellogreeting/1" | \
  tee /dev/tty | grep "This is a greeting."
