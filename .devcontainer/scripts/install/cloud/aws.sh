#!/bin/bash

install_cloud_aws() {
  local NAME="aws_cli"
  local LOG_PATH="$(pwd)/.devcontainer/logs/install_cloud_$NAME.log"

  Log "$(Purple "$NAME"): Begin installation"

  Log "$(Purple "$NAME"): Downloading archive..."
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip" &>> $LOG_PATH

  Log "$(Purple "$NAME"): Unzip archive..."
  unzip /tmp/awscliv2.zip -d /bin/awscliv2 &>> /dev/null

  Log "$(Purple "$NAME"): Installing..."
  /bin/awscliv2/aws/install &>> $LOG_PATH

  Log "$(Purple "$NAME"): $(Yellow "$(aws --version)")"

  Log "$(Purple "$NAME"): Installation completed"
}
