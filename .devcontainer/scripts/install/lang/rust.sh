#!/bin/bash

install_lang_rust() {
  local NAME="rust"
  local LOG_PATH="$(pwd)/.devcontainer/logs/install_lang_$NAME.log"

  printf "" > "$LOG_PATH"

  Log "$(Purple "$NAME"): Begin installation"

  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y >> $LOG_PATH 2>&1
  rustup component add rust-analyzer >> $LOG_PATH 2>&1

  echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc

  source ~/.bashrc

  Log "$(Purple "$NAME"): $(Yellow "$(rustc --version)")"

  Log "$(Purple "$NAME"): Installation completed"
}
