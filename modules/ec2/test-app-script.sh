#!/bin/bash
yum update -y
yum install -y telnet
yum install -y docker
systemctl enable docker
systemctl start docker
aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 615299770153.dkr.ecr.us-east-2.amazonaws.com
docker pull 615299770153.dkr.ecr.us-east-2.amazonaws.com/test-app:latest

# Define BACKEND_URL dynamically
BACKEND_URL="http://$1"

# Run the Docker container with the environment variable
docker run -d -p 3000:3000 -e BACKEND_URL=$BACKEND_URL 615299770153.dkr.ecr.us-east-2.amazonaws.com/test-app:latest
