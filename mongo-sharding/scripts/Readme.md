Задание 2. Шардирование

Для запуска, из mongo-sharding выполняем последовательно:
 docker compose up -d
 ./scripts/confsrv-init.sh 
    ./scripts/shard-init.sh 
        ./scripts/router-init.sh 

Для проверки данных:
./scripts/router-data.sh (1000)
./scripts/confshard-data.sh (492 и 508)
    

    