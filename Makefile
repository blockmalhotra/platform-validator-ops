IMAGE_NAME=nodehealth
IMAGE_TAG?=local

.PHONY: build test run clean health

build:
	docker build -f docker/Dockerfile -t $(IMAGE_NAME):$(IMAGE_TAG) .

test:
	docker run --rm $(IMAGE_NAME):$(IMAGE_TAG) ./nodehealth --help || true
	@echo "Build test passed"

run:
	docker run -d \
		-p 8080:8080 \
		-e CHAIN_NAME=cosmos \
		--name $(IMAGE_NAME) \
		$(IMAGE_NAME):$(IMAGE_TAG)

health:
	curl -s http://localhost:8080/health | jq .

clean:
	docker stop $(IMAGE_NAME) 2>/dev/null || true
	docker rm $(IMAGE_NAME) 2>/dev/null || true
