#!/usr/bin/env bash
# set -e
# echo "=== start ==="
# cd "$(dirname "$0")"
# if [ ! -x "$(command -v docker)" ] ||
#    [ ! -x "$(command -v node)" ]; then
#     echo ""
#     echo -e "\033[0;31m[Error with Exception]\033[0m"
#     echo "Please make sure Docker and Node.js are installed"
#     echo ""
#     echo "Install Docker: https://docs.docker.com/install/"
#     echo "Install Node.js: https://nodejs.org/en/"
#     echo ""
#     exit
# fi
confirm_recreate() {
    read -p "Are you sure? (y/n): " choice
    case "$choice" in
        y|Y ) rm -rf "$1" && mkdir -p "$1";;
        n|N ) return 0;;
        * ) exit 1;;
    esac
}

recreate_storages() {
    echo "=== Delete blockchain data for 'blog' [eosio/eos-dev] ? ==="
    confirm_recreate "./eosio_docker/data"
    echo "=== Delete 'mongodb' data [mongo] ? ==="
    confirm_recreate "./storage_docker/mongo"
    echo "=== Delete 'postgresql' data [postgres] ? ==="
    confirm_recreate "./storage_docker/postgres";
}

read -p "Clear storage and blockchain data? (y/n): " choice
case "$choice" in
    y|Y ) recreate_storages;;
    n|N ) return 0;;
    * ) exit 1;;
esac

echo "=== pull images (eosio/eos-dev, mongo, postgres, adminer) from https://hub.docker.com ==="
docker-compose up -d --remove-orphans --no-build

# cd "./frontend" && npm install
# cd "../backend" && npm install
# cd "../"
