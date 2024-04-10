#!/bin/bash

# Directory containing your website files on the host machine
WEBSITE_DIR="/root/service-website"

# Command to pull the latest changes from the GitHub repository
cd "$WEBSITE_DIR"
git pull

# Restart the Docker container to apply the changes
docker restart elated_brattain
