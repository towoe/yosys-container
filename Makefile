IMAGE_NAME ?= towoe/yosys
BUILD_OPTS ?= --network host
CONTAINER_TOOL ?= podman

image: Containerfile
	@$(CONTAINER_TOOL) build $(BUILD_OPTS) -t $(IMAGE_NAME) .

