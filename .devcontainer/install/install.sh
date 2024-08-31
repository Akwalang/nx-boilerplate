#!/bin/bash

INSTALL_ROOT="/workspaces/repo/.devcontainer/install"

. "$INSTALL_ROOT/cloud/aws.sh"

. "$INSTALL_ROOT/db/postgresql.sh"

. "$INSTALL_ROOT/lang/go.sh"
. "$INSTALL_ROOT/lang/nodejs.sh"
. "$INSTALL_ROOT/lang/php.sh"
. "$INSTALL_ROOT/lang/rust.sh"
