#!/usr/bin/env sh

if [ $EXPLORER_ENABLED = "enabled" ]; then
    echo "Start service"
else
    echo "Exit EXPLORER_ENABLED<>enabled; sleep 60 seconds before exit"
    sleep 60
    exit 1
fi

echo "Starting java -jar /explorer-backend.jar ${JAVA_NET_OPTS} ${JAVA_MEM_OPTS} ${JAVA_GC_OPTS} ${JAVA_EXTRA_OPTS} $@"
exec java -jar /explorer-backend.jar ${JAVA_NET_OPTS} ${JAVA_MEM_OPTS} ${JAVA_GC_OPTS} ${JAVA_EXTRA_OPTS} $@