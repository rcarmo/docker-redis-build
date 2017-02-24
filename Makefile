export IMAGE_NAME=rcarmo/redis-build
# TODO: do suffix/pathname selection dynamically for every flavour

alpine:
	docker build -t $(IMAGE_NAME):alpine -f alpine/Dockerfile \
		--build-arg VCS_REF=`git rev-parse --short HEAD` \
		--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` .

rmi:
	docker rmi -f $(IMAGE_NAME):alpine

push:
	-docker push $(IMAGE_NAME):alpine

clean:
	-docker rm -v $$(docker ps -a -q -f status=exited)
	-docker rmi $$(docker images -q -f dangling=true)
	-docker rmi $(IMAGE_NAME):alpine
	-docker rmi $(IMAGE_NAME)
