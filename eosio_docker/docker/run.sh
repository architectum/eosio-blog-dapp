#!/usr/bin/env bash
if [ -e "/mnt/dev/data/initialized" ]; then
    source "/opt/eosio/bin/scripts/continue_blockchain.sh"
else
    source "/opt/eosio/bin/scripts/init_blockchain.sh"
fi
