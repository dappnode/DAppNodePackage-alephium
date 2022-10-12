#!/usr/bin/env sh

if [ $EXPLORER_ENABLED = "enabled" ]; then
    echo "Start service"
else
    echo "Exit EXPLORER_ENABLED<>enabled; sleep 60 seconds before exit"
    sleep 60
    exit 1
fi

exec /app/entrypoint.sh