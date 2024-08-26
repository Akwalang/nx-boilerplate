#!/bin/bash

# Путь к хуку commit-msg
HOOK_SOURCE=".devcontainer/git/hooks/commit-msg"
HOOK_DESTINATION=".git/hooks/commit-msg"

# Проверка, существует ли папка .git/hooks
if [ -d ".git/hooks" ]; then
    # Копирование хука в папку хуков Git
    cp "$HOOK_SOURCE" "$HOOK_DESTINATION"
    # Сделать хук исполняемым
    chmod +x "$HOOK_DESTINATION"
    Log "$(Blue "commit-msg") installes $(Green "successfully")"
else
    Log "$(Blue "commit-msg") installation $(Red "FAILED")"
    exit 1
fi
