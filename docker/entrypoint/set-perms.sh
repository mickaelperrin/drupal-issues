#!/usr/bin/env bash
echo "Updating UID of www-data"
if [ -d /var/www/html ]; then
    usermod -u $(stat -c '%u' /var/www/html) www-data
fi
