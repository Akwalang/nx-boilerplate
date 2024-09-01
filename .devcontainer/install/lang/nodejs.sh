#!/bin/bash

LOG_PATH="$(pwd)/.devcontainer/logs/nodejs.log"

printf "" > "$LOG_PATH"

NAME="nodejs:"

Log "$(Purple "$NAME") Begin installation"

curl -sL https://deb.nodesource.com/setup_22.x | bash - >> $LOG_PATH 2>&1
apt-get install -y nodejs >> $LOG_PATH 2>&1

Log "$(Purple "$NAME") Install TypeScript"

npm install -g typescript >> $LOG_PATH 2>&1

Log "$(Purple "$NAME") $(Yellow "Node.js $(node -v)")"
Log "$(Purple "$NAME") $(Yellow "npm v$(npm -v)")"
Log "$(Purple "$NAME") $(Yellow "tsc $(tsc -v)")"

Log "$(Purple "$NAME") Installation completed"
