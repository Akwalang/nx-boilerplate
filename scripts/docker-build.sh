#!/bin/bash

. "/workspaces/repo/.bashrc/incl.sh"

# Check if the required arguments are provided
if [ $# -lt 2 ]; then
  Log "$(Red "Usage: $0 <lang> <project_name>")"
  exit 1
fi

LANG=$1
PACKAGE_NAME=$2

DOCKER_FILE_PATH="${ROOT}/configs/lang/${LANG}/Dockerfile"
PACKAGE_DIR="/packages/${PACKAGE_NAME}"
IMAGE_NAME="${PACKAGE_NAME}_image"

NewLine

Log "Building Docker image..."
Log "PROJECT ROOT: $(Purple $ROOT)"
Log "DOCKER FILE PATH: $(Purple $DOCKER_FILE_PATH)"
Log "IMAGE NAME: $(Purple $IMAGE_NAME)"

NewLine

docker build --build-arg PACKAGE_NAME="$PACKAGE_NAME" -f "$DOCKER_FILE_PATH" -t "$IMAGE_NAME" $ROOT

if [ $? -eq 0 ]; then
  NewLine
  Log "Docker image $(Purple $IMAGE_NAME) built $(Green "successfully")!"
else
  NewLine
  Error "Docker image \"$IMAGE_NAME\" built FAILED!"
  exit 1
fi
