#! /bin/bash

set -euo pipefail

set -a; source .env-cardano; set +a

mkdir -p $NODE_DB

if [ "$(ls -A "${NODE_DB}")" ]
then
    echo "Node state is present, not downloading the snapshot."
else
    if [ $CARDANO_NETWORK == "mainnet" ]
    then
        # download the node-db snapshot, or wait for the node to sync for a long time
        curl -o - https://downloads.csnapshots.io/mainnet/$(curl -s https://downloads.csnapshots.io/mainnet/mainnet-db-snapshot.json| jq -r .[].file_name ) | lz4 -c -d - | tar -x -C $NODE_DB
        mv $NODE_DB/db/* $NODE_DB/
        rm -rf $NODE_DB/db
    elif [ $CARDANO_NETWORK == "preprod" ]
    then
        curl -o - https://downloads.csnapshots.io/testnet/$(curl -s https://downloads.csnapshots.io/testnet/testnet-db-snapshot.json| jq -r .[].file_name ) | lz4 -c -d - | tar -x -C $NODE_DB
        mv $NODE_DB/db/* $NODE_DB/
        rm -rf $NODE_DB/db
    elif [ $CARDANO_NETWORK == "sanchonet" ]
    then echo "no cache for sancho";
    else
        echo "NETWORK must be mainnet or preprod or sanchonet"
        exit 1
    fi
fi

# start the services
NETWORK=${NETWORK} NODE_DB=${NODE_DB} docker-compose -p cardano -f ./docker-compose-cardano.yml --env-file .env-cardano up -d
