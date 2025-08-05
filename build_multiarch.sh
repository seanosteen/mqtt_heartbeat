#!/bin/sh
docker buildx build --no-cache \
	--attest type=provenance,mode=max --sbom=true \
	--push --platform linux/arm64/v8,linux/amd64 \
	--tag seanosteen/mqtt_heartbeat:latest .
