DOCKER_BUILD_CMD=docker build

install:
	docker volume create --name data
build:
	$(DOCKER_BUILD_CMD) -t melt -f DockerfileMElt .
	$(DOCKER_BUILD_CMD) -t fasttext_pretrain -f Dockerfile .
