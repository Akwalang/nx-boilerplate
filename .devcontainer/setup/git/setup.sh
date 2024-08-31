#!/bin/bash

HOOK_SOURCE=".devcontainer/setup/git/hooks/commit-msg"
HOOK_DESTINATION=".git/hooks/commit-msg"

if [ -d ".git/hooks" ]; then
    cp "$HOOK_SOURCE" "$HOOK_DESTINATION"
    chmod +x "$HOOK_DESTINATION"
    Log "$(Blue "commit-msg") installes $(Green "successfully")"
else
    Error "\"commit-msg\" installation \"FAILED\""
    exit 1
fi
