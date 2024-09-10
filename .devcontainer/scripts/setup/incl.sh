#!/bin/bash

source "/workspaces/repo/.config/bash/incl.sh"

SETUP_ROOT="/workspaces/repo/.devcontainer/scripts/setup"

for dir in "$SETUP_ROOT"/*/; do
  if [ -d "$dir" ]; then
    for script in "$dir"*.sh; do
      if [ -f "$script" ]; then
        Log "Import file: $(Cyan "${script/"/workspaces/repo/"/""}")"
        source "$script"
      fi
    done
  fi
done
