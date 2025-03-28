# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin python3
sudo usermod -aG docker $USER



#!/bin/bash


ENV_VAR_NAME="WEBHOOK_PYTHON_PATH"


DEFAULT_WEBHOOK_SCRIPT_PATH="~/production/webhook.py"

# Check if the environment variable is already set
if [ -n "${!ENV_VAR_NAME}" ]; then
    WEBHOOK_SCRIPT_PATH="${!ENV_VAR_NAME}"
    echo "Environment variable $ENV_VAR_NAME is already set to $WEBHOOK_SCRIPT_PATH."
else
    # If not set, use the default path and add it to ~/.bashrc
    WEBHOOK_SCRIPT_PATH="$DEFAULT_WEBHOOK_SCRIPT_PATH"
    echo "export $ENV_VAR_NAME=$WEBHOOK_SCRIPT_PATH" >> ~/.bashrc
    source ~/.bashrc
    echo "Environment variable $ENV_VAR_NAME has been set to $WEBHOOK_SCRIPT_PATH."
fi



# Cron job entry
CRON_JOB="@reboot python3 $WEBHOOK_SCRIPT_PATH"

# Check if the script exists
if [ ! -f "$WEBHOOK_SCRIPT_PATH" ]; then
    echo "Error: $WEBHOOK_SCRIPT_PATH does not exist!"
    exit 1
fi

# Check if the cron job is already present
crontab -l | grep -F "$CRON_JOB" > /dev/null

if [ $? -eq 0 ]; then
    echo "Cron job is already set up. No changes made."
else
    # Add the cron job if it's not already in crontab
    (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -
    echo "Cron job has been added to run the webhook script at boot."
fi