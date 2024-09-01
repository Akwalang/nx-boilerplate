#!/bin/bash

install_lang_php() {
  local NAME="php"
  local LOG_PATH="$(pwd)/.devcontainer/logs/install_lang_$NAME.log"

  printf "" > "$LOG_PATH"

  Log "$(Purple "$NAME"): Begin installation"

  apt-get update >> $LOG_PATH 2>&1

  apt-get install -y \
      lsb-release \
      ca-certificates \
      apt-transport-https \
      software-properties-common \
      wget >> $LOG_PATH 2>&1

  add-apt-repository ppa:ondrej/php -y >> $LOG_PATH 2>&1

  apt-get update >> $LOG_PATH 2>&1

  apt-get install -y php8.2 php8.2-cli php8.2-fpm php8.2-mbstring php8.2-curl >> $LOG_PATH 2>&1

  apt-get clean && rm -rf /var/lib/apt/lists/* >> $LOG_PATH 2>&1

  mapfile -t lines <<< $(php -v)
  Log "$(Purple "$NAME"): $(Yellow "${lines[0]}")"

  Log "$(Purple "$NAME"): Installation completed"
}
