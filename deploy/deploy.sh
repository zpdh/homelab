#!/bin/bash

set -e

ROOT_DIR="$(dirname "$0")/.."

echo "Starting deployment..."
cd "$ROOT_DIR"

echo "Pulling changes..."
git pull --ff-only

echo "Deploying services..."
podman compose up -d

echo "Deployment Complete!"
