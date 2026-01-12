IMAGE_NAME := alpine-xinetd

.PHONY: *
help:
	@printf "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s :)\n"

build: ## Build for publishing
	docker build -t panubo/$(IMAGE_NAME) .

run: ## Run container normally
	docker run -p 37:37/udp -p 37:37/tcp --rm -it --name time-server panubo/$(IMAGE_NAME)

# run-non-root:
# 	docker run --cap-add CAP_NET_BIND_SERVICE --user 1000:1000 -p 37:37/udp -p 37:37/tcp --rm -it --name time-server panubo/$(IMAGE_NAME)

shell: ## Run sh
	docker run --rm -it panubo/$(IMAGE_NAME) sh

_ci_test:
	true
