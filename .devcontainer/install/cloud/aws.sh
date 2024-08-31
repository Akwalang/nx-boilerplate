#!/bin/bash

NAME="AWS CLI v2"

Log "$(Purple "$NAME") Begin installation"

Log "$(Purple "$NAME") Downloading archive..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip" &> /dev/null

Log "$(Purple "$NAME") Unzip archive..."
unzip /tmp/awscliv2.zip -d /bin/awscliv2 > /dev/null

Log "$(Purple "$NAME") Installing..."
/bin/awscliv2/aws/install > /dev/null

Log "$(Purple "$NAME") Installation completed"
