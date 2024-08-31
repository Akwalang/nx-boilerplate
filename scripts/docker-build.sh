#!/bin/bash

. "/workspaces/repo/.bashrc/incl.sh"

# Check if the required arguments are provided
if [ $# -lt 1 ]; then
  Log "$(Red "Usage: $0 <lang> <project_name>")"
  exit 1
fi

LANG=$1
PACKAGE_NAME=$2

DOCKERFILE_NAME="${ROOT}/packages/${LANG}-Dockerfile"
PACKAGE_DIR="${ROOT}/packages/${PACKAGE_NAME}"
IMAGE_NAME="${PACKAGE_NAME}_image"

# Move to the project directory
cd "$PACKAGE_DIR" || { Log "$(Red "Project directory not found!")"; exit 1; }

NewLine

Log "Building Docker image..."
Log "PROJECT ROOT: $(Purple $ROOT)"
Log "PACKAGE DIR: $(Purple $PACKAGE_DIR)"
Log "DOCKERFILE NAME: $(Purple $DOCKERFILE_NAME)"
Log "IMAGE NAME: $(Purple $IMAGE_NAME)"

NewLine

Orange
docker build --build-arg SOURCE_FOLDER="$PACKAGE_FOLDER" -f "$DOCKERFILE_NAME" -t "$IMAGE_NAME" .
NoStyle

NewLine

if [ $? -eq 0 ]; then
  Log "Docker image $(Purple $IMAGE_NAME) built $(Green "successfully")!"
else
  Error "Docker image \"$IMAGE_NAME\" built FAILED!"
  exit 1
fi
