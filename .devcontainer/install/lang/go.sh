#!/bin/bash

LOG_PATH="$(pwd)/.devcontainer/logs/go.log"

printf "" > "$LOG_PATH"

NAME="golang:"

Log "$(Purple "$NAME") Begin installation"

GO_VERSION="1.23.0"
GO_TAR="go$GO_VERSION.linux-amd64.tar.gz"
GO_URL="https://golang.org/dl/$GO_TAR"
INSTALL_DIR="/usr/local"

wget $GO_URL -O /tmp/$GO_TAR >> $LOG_PATH

tar -C $INSTALL_DIR -xzf /tmp/$GO_TAR >> $LOG_PATH

rm /tmp/$GO_TAR >> $LOG_PATH

echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc

source ~/.bashrc

Log "$(Purple "$NAME") $(Yellow "$(go version)")"

Log "$(Purple "$NAME") Installation completed"
