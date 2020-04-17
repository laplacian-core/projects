#!/usr/bin/env bash

set -e
SCRIPT_BASE_DIR=$(cd $"${BASH_SOURCE%/*}" && pwd)
PROJECT_BASE_DIR=$(cd $SCRIPT_BASE_DIR && cd ../.. && pwd)

TARGET_PROJECT_DIR="${PROJECT_BASE_DIR}/subprojects/laplacian.project-base.template"

(cd $TARGET_PROJECT_DIR
  if [[ ! -f ./scripts/laplacian-generate.sh ]]
  then
    ./scripts/update-project.sh
  fi
  ./scripts/publish-local.sh
)