#!/bin/bash

NAME="Node.js 22"

Log "$(Purple "$NAME") Begin installation"

curl -sL https://deb.nodesource.com/setup_22.x | bash -
apt-get install -y nodejs

Log "$(Purple "$NAME") Install TypeScript"

npm install -g typescript

Log "$(Purple "$NAME") Installation completed"
