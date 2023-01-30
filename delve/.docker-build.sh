#!/usr/bin/env bash

set -eux

cd "$(dirname "${BASH_SOURCE[0]}")" && pwd || exit 1
if [[ -f "../scripts/lib.sh" ]] ; then
  # shellcheck source=/dev/null
  source "../scripts/lib.sh"
fi

write_dockerignore
render_dockerfile

export VERSION="$(cat ../config.toml | tpl '{{ .dependency.delve }}' --decoder toml)"
docker build --tag harbor.leryn.top/infra/delve:"${VERSION}" .

remove_dockerfile
remove_dockerignore