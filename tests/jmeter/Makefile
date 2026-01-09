JMETER_VER := 5.6.3

.PHONY: *

build:
	docker build -t panubo/time-server-jmeter .

run:
	docker run --rm -it panubo/time-server-jmeter sh

run-test:
	docker run --rm -it -v $(PWD):/workdir --workdir /workdir --user $(shell id -u) panubo/time-server-jmeter /opt/apache-jmeter-${JMETER_VER}/bin/jmeter.sh -n -t "Test Plan.jmx" -l my_results.jtl
