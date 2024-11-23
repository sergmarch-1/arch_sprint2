#!/bin/bash

# Exit on any failure
set -e

# Add shards to the cluster via the mongos router
echo "Adding shards to the cluster..."
docker exec -it router mongosh --port 27018 --eval '
sh.addShard("rs1/shard01a:27021");
sh.addShard("rs1/shard01b:27031");
sh.addShard("rs1/shard01c:27041");
sh.addShard("rs2/shard02a:27022");
sh.addShard("rs2/shard02b:27032");
sh.addShard("rs2/shard02c:27042");
sh.enableSharding("somedb");
sh.shardCollection("somedb.helloDoc", { "name" : "hashed" } );'


echo "Router initialization complete!"