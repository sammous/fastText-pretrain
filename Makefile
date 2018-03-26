DOCKER_BUILD_CMD=sudo docker build
DOCKER_MELT_IMAGE=melt
DOCKER_FASTTEXT_IMAGE=fasttext_image

build:
	$(DOCKER_BUILD_CMD) -t $(DOCKER_MELT_IMAGE) -f melt/Dockerfile .
	#$(DOCKER_BUILD_CMD) -t $(DOCKER_FASTTEXT_IMAGE) -f DockerfileFastText .

run:
	sudo docker run -p 5000:5000 --name melt -v $(pwd)/data:/data $(DOCKER_MELT_IMAGE)
	echo 'Docker container id for MElt is :'
	echo '#####'
	sudo docker ps -aqf "name=melt"
	echo '#####'

clean:
	#clean existing containers
	sudo docker stop melt
	sudo docker container prune
	sudo docker rmi melt
	
start: clean build run
