#!/bin/bash

install_lang_nodejs() {
  local NAME="nodejs"
  local LOG_PATH="$(pwd)/.devcontainer/logs/install_lang_$NAME.log"

  printf "" > "$LOG_PATH"

  Log "$(Purple "$NAME"): Begin installation"

  curl -sL https://deb.nodesource.com/setup_22.x | bash - >> $LOG_PATH 2>&1
  apt-get install -y nodejs >> $LOG_PATH 2>&1

  Log "$(Purple "$NAME"): Install TypeScript"
  npm install -g typescript ts-node >> $LOG_PATH 2>&1

  Log "$(Purple "$NAME"): Install NX"
  npm install -g nx >> $LOG_PATH 2>&1

  local tscv=$(tsc -v)

  Log "$(Purple "$NAME"): $(Yellow "Node.js $(node -v)")"
  Log "$(Purple "$NAME"): $(Yellow "npm v$(npm -v)")"
  Log "$(Purple "$NAME"): $(Yellow "tsc ${tscv/"Version "/"v"}")"

  Log "$(Purple "$NAME"): Installation completed"
}
