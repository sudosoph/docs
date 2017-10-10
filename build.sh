#! /bin/bash

set -o errexit
set -o xtrace

path=$(dirname "${0}")

docker build --tag hugo "${path}"

docker run --rm --volume "${path}:/src" --workdir /src hugo
