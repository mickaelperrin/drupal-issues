#!/bin/bash

if [ "$1" = 'apache2-foreground' ]; then

    for f in /docker-entrypoint.d/*; do
        case "$f" in
            *.sh)     echo "$0: running $f"; . "$f" ;;
            *)        echo "$0: ignoring $f" ;;
        esac
        echo
    done

    for f in /patches/*; do
        case "$f" in
            *.patch)  echo "$0: applying patch $f"; git --git-dir /var/www/html apply "$f";;
            *)        echo "$0: ignoring $f" ;;
        esac
        echo
    done

fi

exec "$@"