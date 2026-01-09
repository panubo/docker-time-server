# Time Protocol Server (RFC 868)

This is an [RFC 868](https://datatracker.ietf.org/doc/html/rfc868/) [Time Protocol](https://en.wikipedia.org/wiki/Time_Protocol) Server implemented with [openSUSE/xinetd](https://github.com/openSUSE/xinetd) running on Alpine Linux.

The image is lightweight and suitable for production use.

## Building the image

You can build the image using the provided `Makefile`:

```bash
make build
```

This will build the Docker image with the name `panubo/alpine-xinetd`.

## Running the server

To run the time server, you can use the `run` target in the `Makefile`:

```bash
make run
```

This will start the container and map the necessary ports (37/tcp and 37/udp).

## Testing

### Client Example

You can test the server using tools like `socat` or `rdate`.

```bash
# Test UDP
socat -x - UDP4-DATAGRAM:127.0.0.1:37

# Test TCP
socat -x - TCP-CONNECT:127.0.0.1:37

# Using rdate (part of busybox)
rdate -p 127.0.0.1
```

### JMeter Load Tests

The project includes a JMeter test plan to verify the server's functionality. To run the tests, you need to have Docker installed.

First, build the JMeter test image:

```bash
cd tests/jmeter
make build
```

Then, run the tests:

```bash
make run-test
```

This will execute the test plan `Test Plan.jmx` and connect to a local instance of time-server running on localhost / UDP port 37.

## Status

Stable and production ready.
