#!/usr/bin/env sh

# Started as root: give wallet files that a Dappmanager backup restore copied in as root back to
# nobody, then re-run this script as nobody (home /alephium-home), the user the node always ran as.
# The node rewrites a wallet file in place when deriving an address or changing the active one,
# which fails on a root-owned file.
if [ "$(id -u)" = "0" ]; then
    find /alephium-home/.alephium-wallets ! -user nobody -exec chown nobody:nogroup {} +
    export HOME=/alephium-home
    exec setpriv --reuid=nobody --regid=nogroup --init-groups "$0" "$@"
fi

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
