#!/bin/bash

source "/workspaces/repo/.bashrc/incl.sh"
source "/workspaces/repo/.devcontainer/scripts/setup/incl.sh"

Log "Begin eviroment setup"

setup_git

Log "Environment setup $(Green "completed")"
