#!/bin/bash

install_lang_rust() {
  local NAME="rust"
  local LOG_PATH="$(pwd)/.devcontainer/logs/install_lang_$NAME.log"

  printf "" > "$LOG_PATH"

  Log "$(Purple "$NAME"): Begin installation"

  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y 2>&1 | while IFS= read -r line; do
    if [[ "$line" = *"info: installing component"* ]]; then
      Log "$(Purple "$NAME"): $(Yellow "${line/"info: installing"/"add"}")"
    fi
    echo "$line" >> "$LOG_PATH"
  done

  cd $HOME/.cargo/bin

  ./rustup component add rust-analyzer 2>&1 | while IFS= read -r line; do
    if [[ "$line" = *"info: installing component"* ]]; then
      Log "$(Purple "$NAME"): $(Yellow "${line/"info: installing"/"add"}")"
    fi
    echo "$line" >> "$LOG_PATH"
  done

  echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc

  source ~/.bashrc

  Log "$(Purple "$NAME"): $(Yellow "$(./rustc --version)")"

  Log "$(Purple "$NAME"): Installation completed"
}
