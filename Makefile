IMAGE_NAME := alpine-xinetd

build:
	docker build -t panubo/$(IMAGE_NAME) .

run:
	docker run -p 37:37/udp -p 37:37/tcp --rm -it --name time-server panubo/$(IMAGE_NAME)

# run-non-root:
# 	docker run --cap-add CAP_NET_BIND_SERVICE --user 1000:1000 -p 37:37/udp -p 37:37/tcp --rm -it --name time-server panubo/$(IMAGE_NAME)

shell:
	docker run --rm -it panubo/$(IMAGE_NAME) sh

_ci_test:
	true
