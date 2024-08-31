#!/bin/bash

NAME="PostgreSQL Client"

Log "$(Purple "$NAME") Begin installation"

apt-get install -y postgresql-client --no-install-recommends > /dev/null

Log "$(Purple "$NAME") Installation completed"
