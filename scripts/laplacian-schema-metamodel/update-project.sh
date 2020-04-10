#!/usr/bin/env bash
set -e
SCRIPT_BASE_DIR=$(cd $"${BASH_SOURCE%/*}" && pwd)
PROJECT_BASE_DIR=$(cd $SCRIPT_BASE_DIR && cd ../.. && pwd)

LOCAL_MODULE_REPOSITORY_PATH='./subprojects/mvn-repo'
LOCAL_MODULE_REPOSITORY_URL='https://github.com/nabla-squared/mvn-repo'
LOCAL_MODULE_REPOSITORY_BRANCH='master'

TARGET_PROJECT_DIR=subprojects/laplacian.schema.metamodel
TARGET_MODEL_DIR="$TARGET_PROJECT_DIR/model"
TARGET_PROJECT_MODEL_FILE="$TARGET_MODEL_DIR/project.yaml"

GENERATOR_SCRIPT_FILE_NAME=generate.sh
TARGET_SCRIPT_DIR="$TARGET_PROJECT_DIR/scripts"
TARGET_PROJECT_GENERATOR_SCRIPT="$TARGET_SCRIPT_DIR/$GENERATOR_SCRIPT_FILE_NAME"

main() {
  setup_local_module_repository
  create_project_model_file
  run_generator
}

setup_local_module_repository() {
  local local_repo="$(normalize_path $LOCAL_MODULE_REPOSITORY_PATH)"
  if [[ ! -d "$local_repo/.git" ]]
  then
    mkdir -p $local_repo
    rm -rf $local_repo
    git clone \
        $LOCAL_MODULE_REPOSITORY_URL \
        $local_repo
    git checkout $LOCAL_MODULE_REPOSITORY_BRANCH
  fi
  git pull

}

create_project_model_file() {
  mkdir -p $TARGET_MODEL_DIR
  cat <<END_FILE > $TARGET_PROJECT_MODEL_FILE
project:
  group: laplacian
  name: schema.metamodel
  type: schema
  namespace: laplacian.metamodel
  version: '1.0.0'
  description: |
    A model which expresses the logical structure of laplacian-based projects and modules.
  subprojects: []
  schemas:
  - group: laplacian
    name: schema.metamodel
    version: '1.0.0'
  - group: laplacian
    name: schema.project
    version: '1.0.0'
  templates:
  - group: laplacian
    name: template.schema
    version: '1.0.0'
  models:
  - group: laplacian
    name: model.metamodel
    version: '1.0.0'
  model_files: []
  template_files: []
END_FILE
}



run_generator() {
  mkdir -p $TARGET_SCRIPT_DIR
  (cd $TARGET_PROJECT_DIR
    if [[ ! -f ./scripts/laplacian-generate.sh ]]
    then
      curl -Ls https://git.io/fhxcl | bash
    fi
    ./scripts/update-project.sh
  )
}

normalize_path () {
  local path=$1
  if [[ $path == /* ]]
  then
    echo $path
  else
    echo "${PROJECT_BASE_DIR}/$path"
  fi
}

main