#!/bin/bash

if [ -d /tmp/artifacts ]; then
    echo "exists /tmp/artifacts"
else
    mkdir /tmp/artifacts
    echo "done mkdir /tmp/artifacts"
fi

MODEL_NAME=int_pillar

docker run --rm -it --entrypoint='/bin/bash' \
    --mount type=bind,source=/tmp/artifacts,target=/tmp/artifacts \
    --mount type=bind,source=$PWD/$MODEL_NAME,target=/mnt/$MODEL_NAME \
    --mount type=bind,source=$PWD/gt,target=/mnt/gt  \
    -e "PYTHON_VERSION=3" -e "PYTHON_MINOR_VERSION=9" -e "PIP_MANYLINUX2010=1" -e "TF_VERSION=2.6.0" open_dataset_pip
