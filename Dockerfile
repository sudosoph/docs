FROM alpine:latest

RUN apk update && \
    apk add \
        ca-certificates \
        wget && \
    update-ca-certificates

RUN wget https://github.com/gohugoio/hugo/releases/download/v0.64.1/hugo_0.64.1_Linux-64bit.tar.gz -O hugo.tar.gz && \
    tar -xzf hugo.tar.gz && \
    rm hugo.tar.gz && \
    mv hugo /usr/bin && \
    chmod 755 /usr/bin/hugo

ENTRYPOINT [ "hugo" ]
