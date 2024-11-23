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