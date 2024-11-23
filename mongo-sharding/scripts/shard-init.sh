#!/bin/bash

# Exit on any failure
set -e

# Initialize shard01 replica set
echo "Initializing shard01 replica set..."
docker exec -it shard01 mongosh --port 27021 --eval '
rs.initiate({
  _id: "shard01",
  members: [
    { _id: 0, host: "shard01:27021" }
  ]
});
'

# sleep 2
# docker exec -it shard01 mongosh --port 27021 --eval 'rs.status();'

# Initialize shard02 replica set
echo "Initializing shard02 replica set..."
docker exec -it shard02 mongosh --port 27022 --eval '
rs.initiate({
  _id: "shard02",
  members: [
    { _id: 1, host: "shard02:27022" }
  ]
});
'

echo "Shards initialization complete!"
