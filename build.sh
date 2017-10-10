#! /bin/bash

set -o errexit
set -o xtrace

cd "$(dirname "${0}")"

docker build --tag hugo .

docker run --rm --volume "$(pwd):/src" --workdir /src hugo
