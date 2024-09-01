#!/bin/bash

install_lang_go() {
  local NAME="golang"
  local LOG_PATH="$(pwd)/.devcontainer/logs/install_lang_$NAME.log"

  printf "" > "$LOG_PATH"

  Log "$(Purple "$NAME"): Begin installation"

  local GO_VERSION="1.23.0"
  local GO_TAR="go$GO_VERSION.linux-amd64.tar.gz"
  local GO_URL="https://golang.org/dl/$GO_TAR"
  local INSTALL_DIR="/usr/local"

  # wget $GO_URL -O /tmp/$GO_TAR 2>&1 | grep -v ".........." &>> $LOG_PATH

  wget $GO_URL -O /tmp/$GO_TAR 2>&1 | while IFS= read -r line; do
      if [[ "$line" != *".........."* ]]; then
          echo "$line" >> "$LOG_PATH"
      fi
  done

  tar -C $INSTALL_DIR -xzf /tmp/$GO_TAR &>> $LOG_PATH

  go install golang.org/x/tools/gopls@latest 2>&1 | while IFS= read -r line; do
    Log "$(Purple "$NAME"): $(Yellow "${line/"go: downloading "/""}")"
  done

  rm /tmp/$GO_TAR &>> $LOG_PATH

  echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc

  source ~/.bashrc

  Log "$(Purple "$NAME"): $(Yellow "$(go version)")"

  Log "$(Purple "$NAME"): Installation completed"
}
