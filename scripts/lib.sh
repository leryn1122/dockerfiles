#!/usr/bin/env bash

function write_dockerignore {  
  cat <<EOF>> .dockerignore
.docker-build.sh
Dockerfile.template
EOF
}

function render_dockerfile {
  cat ../config.toml | tpl --file Dockerfile.template --decoder toml > Dockerfile
}


function remove_dockerignore {
  rm ./.dockerignore
}

function remove_dockerfile {
  rm ./Dockerfile
}