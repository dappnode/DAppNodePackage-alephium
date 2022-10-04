#!/usr/bin/env sh

if [ $EXPLORER_ENABLED = true ]; then
    echo "Start service"
else
    echo "Exit EXPLORER_ENABLED<>true; sleep 60 seconds before exit"
    sleep 60
    exit 1
fi

initdb
exec postgres