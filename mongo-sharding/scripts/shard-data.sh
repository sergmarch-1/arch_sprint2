#!/bin/bash

###
# Инициализируем бд
###

docker compose exec -T shard01 mongosh --port 27021 <<EOF

use somedb;
print(db.helloDoc.countDocuments());

EOF

docker compose exec -T shard02 mongosh --port 27022 <<EOF

use somedb;
print(db.helloDoc.countDocuments());

EOF
