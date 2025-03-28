source .env

export CR_PAT=$TOKEN_GHCR ; echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin

docker pull ghcr.io/$GIT_USERNAME/$IMAGE_NAME:latest

#If already running, delete it
docker stop $IMAGE_NAME 2>/dev/null
docker rm $IMAGE_NAME 2>/dev/null


docker run -d -p 80:80 --name $IMAGE_NAME ghcr.io/$GIT_USERNAME/$IMAGE_NAME
