#!/bin/bash
# Update the package manager and install Docker
sudo yum update -y
sudo yum install -y docker

# Start Docker and enable it to start on boot
sudo service docker start
sudo systemctl enable docker

# Add the ec2-user to the Docker group (so you can run Docker commands without sudo)
sudo usermod -aG docker ec2-user

# Pull the Docker image and run the container
# Specify the Docker image and container name
IMAGE_NAME="fieldrock/cs360_frontend_image_test:latest"
CONTAINER_NAME="test-frontend-container"

# Pull the Docker image
echo "Pulling Docker image: $IMAGE_NAME"
sudo docker pull $IMAGE_NAME

# Check if the image was pulled successfully
if [ $? -eq 0 ]; then
  echo "Docker image pulled successfully."

  # Run the container
  echo "Running the Docker container..."
  sudo docker run -d -p 3000:3000 --name $CONTAINER_NAME $IMAGE_NAME
else
  echo "Failed to pull Docker image. Exiting."
  exit 1
fi
