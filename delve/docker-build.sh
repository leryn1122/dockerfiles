#!/usr/bin/env bash

set -eux

cd "$(dirname "${BASH_SOURCE[0]}")" && pwd || exit 1
if [[ -f "../scripts/lib.sh" ]] ; then
  # shellcheck source=/dev/null
  source "../scripts/lib.sh"
fi

export GO_VERSION=1.19
export DEBIAN_VERSION=11.6-slim
export DELVE_VERSION=v1.7.3
export MIRRORS_SOURCE="mirrors.tuna.tsinghua.edu.cn"
export GITHUB_PROXY="https://ghproxy.com/"
export GOPROXY="https://goproxy.cn,direct"

write_dockerignore

docker build \
  --tag harbor.leryn.top/infra/delve:${DELVE_VERSION} \
  --build-arg GO_VERSION=${GO_VERSION} \
  --build-arg DEBIAN_VERSION=${DEBIAN_VERSION} \
  --build-arg DELVE_VERSION=${DELVE_VERSION} \
  --build-arg MIRRORS_SOURCE=${MIRRORS_SOURCE} \
  --build-arg GITHUB_PROXY=${GITHUB_PROXY} \
  --build-arg GOPROXY=${GOPROXY} \
  .

remove_dockerignore