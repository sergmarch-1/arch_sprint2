#!/bin/bash

###
# Инициализируем бд
###

docker compose exec -T router mongosh --port 27018 <<EOF

use somedb
for(var i = 0; i < 1000; i++) db.helloDoc.insert({age:i, name:"ly"+i});
print(db.helloDoc.countDocuments());

EOF


