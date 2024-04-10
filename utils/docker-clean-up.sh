# List all docker containers
# --------------------------
#docker ps -a


# Remove all docker containers
# -----------------------------
#docker rm -f $(docker ps -a -q)
#docker rm -f $(docker ps -a | grep issuer | awk '{print $1}')
#docker rm -f $(docker ps -a | grep holder | awk '{print $1}')


# Remmove all docker volumes
# --------------------------
#docker volume ls
#docker volume prune -a


# Remove all docker networks
# ---------------------------
#docker network ls
#docker network prune


# Remove all docker images
# ---------------------------
#docker images
#docker images prune