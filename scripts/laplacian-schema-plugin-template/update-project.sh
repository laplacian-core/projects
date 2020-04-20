#!/usr/bin/env bash
set -e
SCRIPT_BASE_DIR=$(cd $"${BASH_SOURCE%/*}" && pwd)
PROJECT_BASE_DIR=$(cd $SCRIPT_BASE_DIR && cd ../.. && pwd)

FILE_INDEX_PATH="$PROJECT_BASE_DIR/model/project/files.yaml"

normalize_path () {
  local path=$1
  if [[ $path == ./* ]]
  then
    echo "${PROJECT_BASE_DIR}/$path"
  else
    echo $path
  fi
}

LOCAL_MODULE_REPOSITORY_PATH="$(normalize_path './subprojects/mvn-repo')"
LOCAL_MODULE_REPOSITORY_URL='https://github.com/nabla-squared/mvn-repo'
LOCAL_MODULE_REPOSITORY_BRANCH='master'

TARGET_PROJECT_DIR="$(normalize_path 'subprojects/laplacian.schema.plugin-template')"
TARGET_MODEL_DIR="$TARGET_PROJECT_DIR/model"
TARGET_PROJECT_MODEL_FILE="$TARGET_MODEL_DIR/project.yaml"

GENERATOR_SCRIPT_FILE_NAME=generate.sh
TARGET_SCRIPT_DIR="$TARGET_PROJECT_DIR/scripts"
TARGET_PROJECT_GENERATOR_SCRIPT="$TARGET_SCRIPT_DIR/$GENERATOR_SCRIPT_FILE_NAME"

main() {
  setup_local_module_repository
  checkout_from_code_repository
  create_project_model_file
  run_generator
}

setup_local_module_repository() {
  mkdir -p $LOCAL_MODULE_REPOSITORY_PATH
  if [[ ! -d "$LOCAL_MODULE_REPOSITORY_PATH/.git" ]]
  then
    rm -rf $LOCAL_MODULE_REPOSITORY_PATH
    git clone \
      $LOCAL_MODULE_REPOSITORY_URL \
      $LOCAL_MODULE_REPOSITORY_PATH
  fi
  (cd $LOCAL_MODULE_REPOSITORY_PATH
    git checkout $LOCAL_MODULE_REPOSITORY_BRANCH
    git pull
  )
}

create_project_model_file() {
  mkdir -p $TARGET_MODEL_DIR
  cat <<END_FILE > $TARGET_PROJECT_MODEL_FILE
project:
  group: laplacian
  name: schema.plugin-template
  type: template
  namespace: laplacian
  version: '1.0.0'
  description: |
    This template is generates a schema gradle plugin which defines the structure of models.
  source_repository:
    url: https://github.com/nabla-squared/laplacian.schema.plugin-template.git
    branch: master
  templates:
  - group: laplacian
    name: project.base-template
    version: '1.0.0'
  models:
  - group: laplacian
    name: project.document-content
    version: '1.0.0'
END_FILE
}

checkout_from_code_repository() {
  if [[ ! -d $TARGET_PROJECT_DIR/.git ]]
  then
    mkdir -p $TARGET_PROJECT_DIR
    rm -rf $TARGET_PROJECT_DIR
    git clone \
        https://github.com/nabla-squared/laplacian.schema.plugin-template.git \
        $TARGET_PROJECT_DIR
  fi
  (cd $TARGET_PROJECT_DIR
    git checkout master
    git pull
  )
}


run_generator() {
  mkdir -p $TARGET_SCRIPT_DIR
  (cd $TARGET_PROJECT_DIR
    curl -Ls https://git.io/fhxcl | bash
    ./scripts/update-project.sh
  )
}

main