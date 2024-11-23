docker exec -it redis01

apt-get update && apt-get install -y redis-tools

echo "yes" | redis-cli --cluster create   173.17.0.91:6379   173.17.0.92:6379   173.17.0.93:6379   173.17.0.94:6379   173.17.0.95:6379   173.17.0.96:6379   --cluster-replicas 1