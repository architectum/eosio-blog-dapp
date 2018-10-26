#!/usr/bin/env bash
set -e # Exit immediatly if at least one of command fails
echo "=== start ==="
cd "$(dirname "$0")"
if [ ! -x "$(command -v docker)" ] ||
   [ ! -x "$(command -v node)" ]; then
    echo ""
    echo -e "\033[0;31m[Error with Exception]\033[0m"
    echo "Please make sure Docker and Node.js are installed"
    echo ""
    echo "Install Docker: https://docs.docker.com/install/"
    echo "Install Node.js: https://nodejs.org/en/"
    echo ""
    exit
fi
echo "=== pull eosio/eos-dev image v1.3.2 from docker hub ==="
echo "=== pull mongo image 4.0 from docker hub ==="
docker-compose pull
#
echo "=== setup/reset data for 'blog' ==="
rm -rf "./eosio_docker/data"
mkdir -p "./eosio_docker/data"
#
echo "=== setup/reset data for 'mongo' ==="
rm -rf "./storage_docker/mongo"
mkdir -p "./storage_docker/mongo"
#
echo "=== setup/reset data for 'redis' ==="
rm -rf "./storage_docker/redis"
mkdir -p "./storage_docker/redis"
#
echo "=== npm install packpage for frontend react app ==="
cd "./frontend"
npm install
cd "../"
#
echo "=== npm install packpage for frontend react app ==="
cd "./backend"
npm install
cd "../"
