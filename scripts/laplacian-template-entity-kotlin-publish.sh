#!/usr/bin/env bash
set -e
SCRIPT_BASE_DIR=$(cd $"${BASH_SOURCE%/*}" && pwd)
PROJECT_BASE_DIR=$(cd $SCRIPT_BASE_DIR && cd .. && pwd)

TARGET_PROJECT_DIR=./generated-projects/laplacian.template.entity.kotlin

(cd $TARGET_PROJECT_DIR
  if [[ ! -f ./scripts/laplacian-generate.sh ]]
  then
    ./scripts/laplacian-project-generate.sh
  fi
  ./scripts/laplacian-project-publish.sh
)