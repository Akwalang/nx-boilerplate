#!/bin/bash

. "/workspaces/repo/.config/bash/incl.sh"

# Check if the required arguments are provided
if [ $# -lt 3 ]; then
  Log "$(Red "Usage: $0 <lang> <type> <project_name>")"
  exit 1
fi

LANG=$1
PACKAGE_TYPE=$2
PACKAGE_NAME=$3

DOCKER_FILE_PATH="${ROOT}/.config/lang/${LANG}/Dockerfile"
PACKAGE_DIR="/packages/${PACKAGE_TYPE}/${PACKAGE_NAME}"
IMAGE_NAME="${PACKAGE_TYPE}_${PACKAGE_NAME}_image"

NewLine

Log "Building Docker image..."
Log "PROJECT ROOT: $(Purple $ROOT)"
Log "DOCKER FILE PATH: $(Purple $DOCKER_FILE_PATH)"
Log "IMAGE NAME: $(Purple $IMAGE_NAME)"

NewLine

docker build \
  --build-arg PACKAGE_TYPE="$PACKAGE_TYPE" \
  --build-arg PACKAGE_NAME="$PACKAGE_NAME" \
  -f "$DOCKER_FILE_PATH" \
  -t "$IMAGE_NAME" \
  $ROOT

if [ $? -eq 0 ]; then
  NewLine
  Log "Docker image $(Purple $IMAGE_NAME) built $(Green "successfully")!"
else
  NewLine
  Error "Docker image \"$IMAGE_NAME\" built FAILED!"
  exit 1
fi
