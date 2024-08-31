#!/bin/bash

Log "$(Purple "PHP") Begin installation"

sudo dpkg -l | grep php | tee packages.txt

# Add Ondrej's PPA
sudo add-apt-repository ppa:ondrej/php
sudo apt update > /dev/null

# Install new PHP 8.1 packages
sudo apt install php8.1 php8.1-cli php8.1-{bz2,curl,mbstring,intl} > /dev/null

Log "$(Purple "PHP") Installation completed"
