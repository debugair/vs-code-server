$project = "python-environment"
docker compose -p $project down
docker image prune -f
docker volume prune -f