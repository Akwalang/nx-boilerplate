#!/bin/bash

install_db_postgresql() {
  local NAME="postgresql"
  local LOG_PATH="$(pwd)/.devcontainer/logs/install_db_$NAME.log"

  printf "" > "$LOG_PATH"

  Log "$(Purple "$NAME") Begin installation"

  apt-get install -y postgresql --no-install-recommends > $LOG_PATH

  Log "$(Purple "$NAME") Installation completed"
}
