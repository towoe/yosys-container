IMAGE_NAME ?= docker.io/towoe/yosys
BUILD_OPTS ?= --network host \
	      --format docker
CONTAINER_TOOL ?= podman

image: Containerfile
	@$(CONTAINER_TOOL) build $(BUILD_OPTS) -t $(IMAGE_NAME) .

