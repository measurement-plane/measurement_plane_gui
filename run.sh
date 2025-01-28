#!/bin/bash

# Set environment variables
CONTAINER_NAME="measurement_plane_gui_container"
IMAGE_NAME="amlabdr/measurement_plane_gui:latest"
BROKER_URL=${BROKER_URL:-"amqp://localhost:5672/"}

# Stop and remove any running container with the same name
docker stop $CONTAINER_NAME >/dev/null 2>&1 || true
docker rm $CONTAINER_NAME >/dev/null 2>&1 || true

# Attempt to pull the latest image
echo "Attempting to pull the latest image..."
if docker pull "$IMAGE_NAME"; then
    echo "Successfully pulled the latest image."
else
    echo "Warning: Failed to pull the image. Using the existing local image, if available."
fi

# Run the container
docker run --name "$CONTAINER_NAME" \
    -e BROKER_URL="$BROKER_URL" \
    -p 8050:8050 \
    "$IMAGE_NAME" || {
    echo "Error: Failed to start the container."
    exit 1
}
