# Production for docker

This is a repository to create the production without the development code

## Criteria:
- new ubuntu machine (or other distributions)
- have a package in your repository tagged *latest*


## Step 1
If you are on a ubuntu machine
```bash
bash start_docker.sh
```

## Step 2
Create a "Personal Access Token" and all the permissions related to "packages"

## Step 3
Create a .env in the root of this file and add
TOKEN_GHCR=
PROJECT_NAME=
GIT_USERNAME=

## Step 4
Add your token beside the TOKEN_GHCR
Add your project name beside the PROJECT_NAME
Add your github username beside the GIT_USERNAME

## STEP 5
```bash
bash update_docker.sh
```

