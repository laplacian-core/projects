#!/usr/bin/env bash
set -e
PROJECT_BASE_DIR=$(cd $"${BASH_SOURCE%/*}/../../" && pwd)

SCRIPT_BASE_DIR="$PROJECT_BASE_DIR/scripts"
TARGET_PROJECT_DIR="${PROJECT_BASE_DIR}/subprojects/laplacian.schema.document-template"

(cd $TARGET_PROJECT_DIR
  if [[ ! -f ./scripts/laplacian-generate.sh ]]
  then
    ./scripts/update-project.sh
  fi
  ./scripts/publish-local.sh
)