FROM alpine:latest

RUN apk update && \
    apk add \
        ca-certificates \
        wget && \
    update-ca-certificates

ENV HUGO_VERSION=0.65.3

RUN wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}//hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz -O hugo.tar.gz && \
    tar -xzf hugo.tar.gz && \
    rm hugo.tar.gz && \
    mv hugo /usr/bin && \
    chmod 755 /usr/bin/hugo

ENTRYPOINT [ "hugo" ]
