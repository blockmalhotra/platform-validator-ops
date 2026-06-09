#!/bin/bash
set -e

PORT=${1:-8080}
echo "Checking node health on port $PORT..."
curl -sf http://localhost:$PORT/health | jq .
