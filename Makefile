IMAGE_NAME := alpine-xinetd

build:
	docker build -t panubo/$(IMAGE_NAME) .

run:
	docker run --rm -it panubo/$(IMAGE_NAME)

shell:
	docker run --rm -it panubo/$(IMAGE_NAME) sh
