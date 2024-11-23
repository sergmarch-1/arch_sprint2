#!/bin/bash

###
# Инициализируем бд
###

docker compose exec -T configSrv01 mongosh --port 27019 <<EOF
use somedb
for(var i = 0; i < 1000; i++) db.helloDoc.insertOne({age:i, name:"ly"+i})

rs.initiate(
  {
    _id : "--configReplSet",
       configsvr: true,
    members: [
      { _id: 0, host: "configSrv01:27019" }
    ]
  }
);
EOF

echo "Configuration Server initialization complete!"

# Exit on any failure
set -e

# Initialize shard01 replica set
echo "Initializing shard01 replica set..."

docker exec -it shard01a mongosh --port 27021 --eval '
rs.initiate({
  _id: "rs1",
  members: [
    { _id: 0, host: "shard01a:27021" },
    { _id: 1, host: "shard01b:27031" },
    { _id: 2, host: "shard01c:27041" }
  ]
});
'

# sleep 2
# docker exec -it shard01 mongosh --port 27021 --eval 'rs.status();'

# Initialize shard02 replica set
echo "Initializing shard02 replica set..."
docker exec -it shard02a mongosh --port 27022 --eval '
rs.initiate({
  _id: "rs2",
  members: [
    { _id: 3, host: "shard02a:27022" },
    { _id: 4, host: "shard02b:27032" },
    { _id: 5, host: "shard02c:27042" }
  ]
});
'

echo "Shards initialization complete!"