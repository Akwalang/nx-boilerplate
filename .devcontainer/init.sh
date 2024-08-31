#!/bin/bash

. "/workspaces/repo/.bashrc/incl.sh"

Log "Setup Git"
. "/workspaces/repo/.devcontainer/git/setup.sh"

Log "Install applications"
. "/workspaces/repo/.devcontainer/install/install.sh"
