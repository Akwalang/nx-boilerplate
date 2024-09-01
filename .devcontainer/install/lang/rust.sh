#!/bin/bash

LOG_PATH="$(pwd)/.devcontainer/logs/rust.log"

printf "" > "$LOG_PATH"

NAME="rust:"

Log "$(Purple "$NAME") Begin installation"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y >> $LOG_PATH 2>&1

# Добавление пути к Cargo в PATH
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc

# Применение изменений
source ~/.bashrc

Yellow
rustc --version
NoStyle

Log "$(Purple "$NAME") Installation completed"
