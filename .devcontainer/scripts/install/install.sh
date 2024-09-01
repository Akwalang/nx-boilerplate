#!/bin/bash

source "/workspaces/repo/.bashrc/incl.sh"
source "/workspaces/repo/.devcontainer/scripts/install/incl.sh"

Log "Begin Installation"

install_cloud_aws

install_db_postgresql

install_lang_go
install_lang_nodejs
install_lang_php
install_lang_rust

Log "Installation $(Green "completed")"
