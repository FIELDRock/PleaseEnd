#!/bin/bash
# Update the package manager and install Docker
sudo yum update -y
sudo yum install -y docker

# Start Docker and enable it to start on boot
sudo service docker start
sudo systemctl enable docker

# Add the ec2-user to the Docker group (so you can run Docker commands without sudo)
sudo usermod -aG docker ec2-user


sudo docker pull fieldrock/cs360_frontend_image_test:latest
docker run -d -p 3000:3000 --name cs360_frontend_container fieldrock/cs360_frontend_image_test:latest

sudo docker pull fieldrock/cs360_backend_image_test:latest
docker run -d -p 1337:1337 fieldrock/cs360_backend_image_test:lastest



