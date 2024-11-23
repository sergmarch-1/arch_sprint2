Задание 2. Шардирование

Для запуска, из mongo-sharding выполняем последовательно:
 docker compose up -d
 ./scripts/confsrv-init.sh 
    ./scripts/shard-init.sh 
        ./scripts/router-init.sh 

Для проверки данных:
./scripts/router-data.sh (1000)
./scripts/confshard-data.sh (492 и 508)
    
Задание 3. Репликация

в compose.yaml добавлены реплики для каждого шарда: shard01a, shard01b, shard01c и shard02a, shard02b, shard02c
+ дополнены скрипты инициализации shard-init, router-init и скрипт проверки данных shard-data

Для запуска, из mongo-sharding-repl выполняем последовательно:
 docker compose up -d
 ./scripts/confsrv-init.sh 
    ./scripts/shard-init.sh 
        ./scripts/router-init.sh 

Для проверки данных:
./scripts/router-data.sh (1000)
./scripts/confshard-data.sh (492, 492, 492 и 508, 508, 508)
    