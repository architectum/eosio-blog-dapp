#!/usr/bin/env bash
if [ -e "/mnt/dev/data/initialized" ]; then
    source "./scripts/docker/continue_blockchain.sh"
else
    source "./scripts/docker/init_blockchain.sh"
fi
