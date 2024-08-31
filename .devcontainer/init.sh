#!/bin/bash

. "/workspaces/repo/.bashrc/incl.sh"

Log "Install applications"
. "/workspaces/repo/.devcontainer/install/install.sh"

Log "Setup environment"
. "/workspaces/repo/.devcontainer/setup/setup.sh"
