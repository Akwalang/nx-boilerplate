#!/bin/bash

source "/workspaces/repo/.config/bash/incl.sh"
source "/workspaces/repo/.devcontainer/scripts/setup/incl.sh"

Log "Begin eviroment setup"

setup_git

Log "Environment setup $(Green "completed")"
