#!/bin/bash
set -e

IMAGE_NAME=${IMAGE_NAME:-nodehealth}
IMAGE_TAG=${IMAGE_TAG:-local}

echo "Building $IMAGE_NAME:$IMAGE_TAG"
docker build -f docker/Dockerfile -t $IMAGE_NAME:$IMAGE_TAG .
echo "Done."
