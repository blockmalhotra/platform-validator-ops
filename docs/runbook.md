# Runbook: platform-validator-ops

## Start Demo
docker compose -f demo/docker-compose.yml up

## Scale Validators
kubectl scale statefulset validator --replicas=2

## Monitor
curl /metrics | grep validator_block_height

## Common Issues
- Sync lag: check peers in /health, restart pod.
- Slashing risk: ensure HA with multiple nodes.
