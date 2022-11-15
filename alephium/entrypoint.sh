#!/usr/bin/env sh

ALEPHIUM_HOME=${ALEPHIUM_HOME:-/alephium-home/.alephium}
ALEPHIUM_NETWORK=${ALEPHIUM_NETWORK:-mainnet}

# snapshot-loader.sh originally available at from https://github.com/touilleio/alephium-standalone
# Call snapshot-loader.sh and ensure it completed successfully, stopping the execution otherwise.
if [ $INITIALIZING_FROM_SNAPSHOT = "enabled" ]; then
    if ! ./snapshot-loader.sh
    then
        echo "Loading the snapshot failed. See logs above for more details, apply recommended actions and retry"
        exit 1
    fi
fi

echo "Starting java -jar /alephium.jar ${JAVA_NET_OPTS} ${JAVA_MEM_OPTS} ${JAVA_GC_OPTS} ${JAVA_EXTRA_OPTS} ${EXTRA_OPTS} $@"
exec java -jar /alephium.jar ${JAVA_NET_OPTS} ${JAVA_MEM_OPTS} ${JAVA_GC_OPTS} ${JAVA_EXTRA_OPTS} ${EXTRA_OPTS} $@
