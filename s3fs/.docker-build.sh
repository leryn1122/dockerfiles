#!/usr/bin/env bash

set -eux

cd "$(dirname "${BASH_SOURCE[0]}")" && pwd || exit 1
if [[ -f "../scripts/lib.sh" ]] ; then
  # shellcheck source=/dev/null
  source "../scripts/lib.sh"
fi

write_dockerignore
render_dockerfile

export VERSION="$(cat ../config.toml | tpl '{{ .dependency.s3fs }}' --decoder toml)"
docker build --tag harbor.leryn.top/infra/s3fs:"${VERSION}" .

remove_dockerfile
remove_dockerignore