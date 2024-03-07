# Docker Image Deployment Script

This repository contains a Bash script (`homarr_img.sh`) that facilitates the deployment of images to a Docker container via SSH (in this case for homarr). The script automates the process of copying files from a local directory to a remote server and then into a Docker container's directory.

## Prerequisites

Before using this script, ensure the following prerequisites are met:

- Local machine with Bash shell support.
- Remote server accessible via SSH.
- Docker installed on the remote server.
- Docker container running on the remote server.

## Usage

To use the script, follow these steps:

1. Clone this repository to your local machine.
2. Make the script executable if necessary: `chmod +x homarr_img.sh`
3. Execute the script with the appropriate parameters:

./homarr_img.sh [SSH_CONNECTION_STRING] [DOCKER_CONTAINER_ID] [REMOTE_FILE_PATH]

Replace `[SSH_CONNECTION_STRING]` with your SSH connection string (e.g., `user@10.10.1.0`).
Replace `[DOCKER_CONTAINER_ID]` with the ID of your Docker container.
Replace `[REMOTE_FILE_PATH]` with the path on the remote server where you want to copy the files (e.g., `/home/user/`).


## Script Overview
The script performs the following actions:

1. Creates a local directory called `img-homarr`.
2. Copies all files from the current directory to `img-homarr`.
3. Removes nested `img-homarr` directories to avoid redundancy.
4. Copies the `img-homarr` directory to the remote server specified by the SSH connection string and the provided file path.
5. Uses SSH to execute a Docker command to copy files from the `img-homarr` directory on the remote server into the specified Docker container.
6. Removes the `img-homarr` directory from the remote server.
7. Cleans up the local `img-homarr` directory.

