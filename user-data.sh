#!/bin/bash
# Update the package manager and install Docker
sudo yum update -y
sudo yum install -y docker
sudo service docker start
sudo usermod -aG docker ec2-user

# Pull and run the Docker container
sudo docker run -d -p 3000:3000 --name test-frontend-container fieldrockcs/360_frontend_image_test:latest