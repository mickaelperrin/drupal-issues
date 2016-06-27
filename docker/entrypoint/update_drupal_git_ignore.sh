#!/usr/bin/env bash
grep -q -F 'vendor/' /var/www/html/.gitignore || echo 'vendor/' >> /var/www/html/.gitignore