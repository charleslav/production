source .env

export CR_PAT=$TOKEN_GHCR ; echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin

docker pull ghcr.io/$GIT_USERNAME/$IMAGE_NAME:latest

docker run -d -p 80:80 ghcr.io/$GIT_USERNAME/$IMAGE_NAME