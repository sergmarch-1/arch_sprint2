#!/bin/bash

# Exit on any failure
set -e

# Add shards to the cluster via the mongos router
echo "Adding shards to the cluster..."
docker exec -it router mongosh --port 27018 --eval '
sh.addShard("shard01/shard01:27021");
sh.addShard("shard02/shard02:27022");
sh.enableSharding("somedb");
sh.shardCollection("somedb.helloDoc", { "name" : "hashed" } );'


echo "Router initialization complete!"