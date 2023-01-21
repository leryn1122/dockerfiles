#!/usr/bin/env bash

set -eux

cd "$(dirname "${BASH_SOURCE[0]}")" && pwd || exit 1
if [[ -f "../scripts/lib.sh" ]] ; then
  # shellcheck source=/dev/null
  source "../scripts/lib.sh"
fi

export DEBIAN_VERSION=11.6-slim
export S3FS_VERSION=1.89
export MIRRORS_SOURCE="mirrors.tuna.tsinghua.edu.cn"

write_dockerignore

docker build \
  --tag harbor.leryn.top/infra/s3fs:v${S3FS_VERSION} \
  --build-arg DEBIAN_VERSION=${DEBIAN_VERSION} \
  --build-arg MIRRORS_SOURCE=${MIRRORS_SOURCE} \
  --build-arg S3FS_VERSION=${S3FS_VERSION}-1 \
  .

remove_dockerignore