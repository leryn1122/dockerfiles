#!/usr/bin/env bash

function write_dockerignore {  
  cat <<EOF>> .dockerignore
docker-build.sh
EOF
}

function remove_dockerignore {
  rm ./.dockerignore
}