$project = "python-environment"
docker compose -p $project down
docker images prune -f
docker volume prune -f