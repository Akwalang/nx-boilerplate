#!/bin/bash

NAME="Golang"

Log "$(Purple "$NAME") Begin installation"

rm -rf /usr/local/go && tar -C /usr/local -xzf go1.23.0.linux-amd64.tar.gz

export PATH=$PATH:/usr/local/go/bin

Log "$(Purple "$NAME") Installation completed"
