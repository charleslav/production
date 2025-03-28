# Production for docker

This is a repository to create the production without the development code

## Criteria:
- be a personnal repository
- have a package in your repository tagged *latest*


## Step 1
If you are on a ubuntu machine
```bash
bash installation.sh
```

## Step 2
Create a "Personal Access Token" and all the permissions related to "packages"

## Step 3
Create a .env in the root of this file and add
```env
TOKEN_GHCR= {your token}
IMAGE_NAME= {your docker image name}
GIT_USERNAME= {github username}
```

## STEP 4
```bash
bash start_docker.sh
```

