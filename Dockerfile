FROM alpine:latest

RUN apk update && \
    apk add \
        ca-certificates \
        wget && \
    update-ca-certificates

RUN wget https://github.com/gohugoio/hugo/releases/download/v0.29/hugo_0.29_Linux-64bit.tar.gz -O hugo.tar.gz && \
    tar -xzf hugo.tar.gz && \
    rm hugo.tar.gz && \
    mv hugo /usr/bin && \
    chmod 755 /usr/bin/hugo

ENTRYPOINT [ "hugo" ]
