#!/bin/bash

function deploy_app {
  BUNDLE_FOLDER="build"
  
  aws s3 sync $BUNDLE_FOLDER s3://${BUCKET_NAME}/$APP_NAME --delete
}

# Only:
# - Releases
# - Security env variables are available. PR from forks don't have them.
if [ -n "$AWS_SECRET_ACCESS_KEY" ] && [ -n "$BUCKET_NAME" ]
then
  echo "Executing in $(pwd)"
  # app name is the name of the current folder
  APP_NAME="$(basename $(pwd))"
  deploy_app $APP_NAME
else
  echo "[ERROR] App could not be deployed because of missing environment variables"
  exit 1
fi
