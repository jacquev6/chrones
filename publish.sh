#!/bin/bash

# Copyright 2020-2022 Laurent Cabaret
# Copyright 2020-2022 Vincent Jacques

set -o errexit
cd "$(dirname "${BASH_SOURCE[0]}")/"


image=$(docker build --quiet --build-arg UID=$(id -u) development)

docker run \
  --rm --interactive --tty \
  --mount type=bind,src=$HOME/.gitconfig,dst=/home/user/.gitconfig,ro \
  --mount type=bind,src=$HOME/.ssh/id_rsa,dst=/home/user/.ssh/id_rsa,ro \
  --mount type=bind,src=$HOME/.ssh/known_hosts,dst=/home/user/.ssh/known_hosts \
  --volume "$PWD:/wd" --workdir /wd \
  $image \
    python3 development/publish.py "$@"
