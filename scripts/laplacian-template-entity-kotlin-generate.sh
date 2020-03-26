#!/usr/bin/env bash
set -e
SCRIPT_BASE_DIR=$(cd $"${BASH_SOURCE%/*}" && pwd)
PROJECT_BASE_DIR=$(cd $SCRIPT_BASE_DIR && cd .. && pwd)

TARGET_PROJECT_DIR=./generated-projects/laplacian.template.entity.kotlin
TARGET_MODEL_DIR="$TARGET_PROJECT_DIR/model"
TARGET_PROJECT_MODEL_FILE="$TARGET_MODEL_DIR/template-entity-kotlin-project.yaml"

normalize_path () {
  local path=$1
  if [[ $path == /* ]]
  then
    echo $path
  else
    echo "${PROJECT_BASE_DIR}/$path"
  fi
}

mkdir -p $TARGET_MODEL_DIR
cat <<END_FILE > $TARGET_PROJECT_MODEL_FILE
project:
  group: laplacian
  name: template.entity.kotlin
  namespace: laplacian
  subprojects: []
  schemas: []
  templates:
  - group: laplacian
    name: template.project.base
    version: '1.0.0'
  model_files: []
  template_files:
  - $(normalize_path './laplacian.template.template.base/template')
END_FILE

GENERATOR_SCRIPT_FILE_NAME=laplacian-template-entity-kotlin-generate.sh
TARGET_SCRIPT_DIR="$TARGET_PROJECT_DIR/scripts"
TARGET_PROJECT_GENERATOR_SCRIPT="$TARGET_SCRIPT_DIR/$GENERATOR_SCRIPT_FILE_NAME"

mkdir -p $TARGET_SCRIPT_DIR

(cd $TARGET_PROJECT_DIR
  if [[ ! -f ./scripts/laplacian-generate.sh ]]
  then
    curl -Ls https://git.io/fhxcl | bash
  fi
  ./scripts/laplacian-project-generate.sh
)