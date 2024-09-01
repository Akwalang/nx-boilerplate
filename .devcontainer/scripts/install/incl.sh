#!/bin/bash

source "/workspaces/repo/.bashrc/incl.sh"

INSTALL_ROOT="/workspaces/repo/.devcontainer/scripts/install"

for dir in "$INSTALL_ROOT"/*/; do
  if [ -d "$dir" ]; then
    for script in "$dir"*.sh; do
      if [ -f "$script" ]; then
        Log "Import file: $(Cyan "${script/"/workspaces/repo/"/""}")"
        source "$script"
      fi
    done
  fi
done
