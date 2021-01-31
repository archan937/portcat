FROM alpine:latest
MAINTAINER Paul Engel <pm_engel@icloud.com>

RUN apk update\
 && apk add bash socat

COPY src/portcat /usr/local/bin/portcat
RUN chmod +x /usr/local/bin/portcat

ENTRYPOINT ["portcat"]
