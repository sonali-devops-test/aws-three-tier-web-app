#!/bin/bash

set -e

DOCKERHUB_USERNAME="sonalis9"

echo "Stopping old containers..."
docker stop backend || true
docker stop frontend || true

echo "Removing old containers"
docker rm backend || true
docker rm frontend || true

echo "Pulling latest images..."
docker pull $DOCKERHUB_USERNAME/backend:latest
docker pull $DOCKERHUB_USERNAME/frontend:latest

echo "Starting backend..."
docker run -d --name backend -p 4000:4000 $DOCKERHUB_USERNAME/backend:latest

echo "Starting frontend..."
docker run -d --name frontend -p 3000:80 $DOCKERHUB_USERNAME/frontend:latest

echo "Deployment completed successfully!"
