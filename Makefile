REPOSITORY := ghcr.io/s6n-labs/distroless-php
PUSH := false
BUILDX := false
PLATFORMS := linux/amd64
DOCKER_ARGS :=
DOCKER_BUILD := docker build

ifeq ($(BUILDX), true)
	DOCKER_BUILD = docker buildx build
	DOCKER_ARGS += --platform
	DOCKER_ARGS += "${PLATFORMS}"

	ifeq ($(PUSH), true)
		DOCKER_ARGS += --push
	endif
endif

%:
	$(eval DIR := $(shell echo $@ | sed 's#-#/#g' | xargs printf 'php/%s'))
	mkdir -p "${DIR}"
	echo "tag: $@" | mustache - Dockerfile.mustache > "${DIR}/Dockerfile"
	$(DOCKER_BUILD) -t "${REPOSITORY}:$@" ${DOCKER_ARGS} "${DIR}"
