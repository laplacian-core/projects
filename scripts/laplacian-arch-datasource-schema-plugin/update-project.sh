#!/usr/bin/env bash
set -e
SCRIPT_BASE_DIR=$(cd $"${BASH_SOURCE%/*}" && pwd)
PROJECT_BASE_DIR=$(cd $SCRIPT_BASE_DIR && cd ../.. && pwd)

FILE_INDEX_PATH="$PROJECT_BASE_DIR/model/project/files.yaml"

normalize_path () {
  local path=$1
  if [[ $path == /* ]]
  then
    echo $path
  else
    echo "${PROJECT_BASE_DIR}/$path"
  fi
}

LOCAL_MODULE_REPOSITORY_PATH="$(normalize_path './subprojects/mvn-repo')"
LOCAL_MODULE_REPOSITORY_URL='https://github.com/nabla-squared/mvn-repo'
LOCAL_MODULE_REPOSITORY_BRANCH='master'

TARGET_PROJECT_DIR="$(normalize_path 'subprojects/laplacian-arch.datasource.schema-plugin')"
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
  group: laplacian-arch
  name: datasource.schema-plugin
  type: plugin
  namespace: laplacian.arch.datasource
  version: '1.0.0'
  description: |
    A schema gradle plugin for the datasource arch model
  subprojects: []
  schemas: []
  plugins:
  - group: laplacian
    name: metamodel-plugin
    version: '1.0.0'
  - group: laplacian
    name: project.schema-plugin
    version: '1.0.0'
  templates:
  - group: laplacian
    name: project.base-template
    version: '1.0.0'
  - group: laplacian
    name: schema.plugin-template
    version: '1.0.0'
  models:
  - group: laplacian
    name: metamodel
    version: '1.0.0'
  - group: laplacian-arch
    name: datasource.schema-model
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

main