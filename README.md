# Time Protocol Server (RFC 868)

This is an [RFC 868](https://datatracker.ietf.org/doc/html/rfc868/) [Time Protocol](https://en.wikipedia.org/wiki/Time_Protocol) Server implemented with [openSUSE/xinetd](https://github.com/openSUSE/xinetd).

## Client

```
socat -x - UDP4-DATAGRAM:127.0.0.1:37
socat -x - TCP-CONNECT:127.0.0.1:37
```
