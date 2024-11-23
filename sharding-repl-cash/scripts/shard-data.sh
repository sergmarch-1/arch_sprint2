#!/bin/bash

###
# Инициализируем бд
###

docker compose exec -T shard01a mongosh --port 27021 <<EOF

use somedb;
print(db.helloDoc.countDocuments());

EOF

docker compose exec -T shard01b mongosh --port 27031 <<EOF

use somedb;
print(db.helloDoc.countDocuments());

EOF

docker compose exec -T shard01c mongosh --port 27041 <<EOF

use somedb;
print(db.helloDoc.countDocuments());

EOF

docker compose exec -T shard02a mongosh --port 27022 <<EOF

use somedb;
print(db.helloDoc.countDocuments());

EOF

docker compose exec -T shard02b mongosh --port 27032 <<EOF

use somedb;
print(db.helloDoc.countDocuments());

EOF

docker compose exec -T shard02c mongosh --port 27042 <<EOF

use somedb;
print(db.helloDoc.countDocuments());

EOF

