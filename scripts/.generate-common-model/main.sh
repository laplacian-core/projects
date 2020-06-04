#!/usr/bin/env bash

RAW_HOST='https://raw.githubusercontent.com/nabla-squared/laplacian.projects/master'

MODEL_DIR='model'
PROJECT_MODEL_FILE="$MODEL_DIR/project.yaml"
MODEL_SCHEMA_PARTIAL='model-schema-partial.json'
MODEL_SCHEMA_FULL='model-schema-full.json'

SCRIPTS_DIR='scripts'
PROJECT_GENERATOR="$SCRIPTS_DIR/generate.sh"
PROJECT_GENERATOR_MAIN="$SCRIPTS_DIR/.generate/main.sh"
LAPLACIAN_GENERATOR="$SCRIPTS_DIR/laplacian-generate.sh"
VSCODE_SETTING=".vscode/settings.json"

TARGET_PROJECT_DIR="$PROJECT_BASE_DIR/subprojects/laplacian.common-model"
TARGET_MODEL_DIR="$TARGET_PROJECT_DIR/$MODEL_DIR"
TARGET_SCRIPT_DIR="$TARGET_PROJECT_DIR/$SCRIPTS_DIR"
TARGET_PROJECT_MODEL_FILE="$TARGET_MODEL_DIR/project.yaml"

main() {
  sync_source_with_repository
  create_project_model_file
  install_generator
  run_generator
}


sync_source_with_repository() {
  if [[ ! -d $TARGET_PROJECT_DIR/.git ]]
  then
    mkdir -p $TARGET_PROJECT_DIR
    rm -rf $TARGET_PROJECT_DIR
    git clone -b master \
        https://github.com/nabla-squared/laplacian.common-model.git \
        $TARGET_PROJECT_DIR
  else
    (cd $TARGET_PROJECT_DIR && git pull)
  fi
}


create_project_model_file() {
  mkdir -p $TARGET_MODEL_DIR
  cat <<END_FILE > $TARGET_PROJECT_MODEL_FILE
project:
  group: laplacian
  name: common-model
  type: domain-model
  namespace: laplacian.common
  version: '1.0.0'
  description:
    en: |
      Defines the generally applicable models that is not specific to a certain domain.
    ja: |
      特定のドメインに特化していない汎用的に適用できるモデルを定義します。
    zh: |
      定义了不特定于某一领域的普遍适用模型。
  source_repository:
    url: https://github.com/nabla-squared/laplacian.common-model.git
    branch: master
  module_repositories:
    local:
      ../../../mvn-repo
    remote:
    - https://github.com/nabla-squared/mvn-repo
  model_files:
  - 'dest/'
END_FILE
}

install_generator() {
  (cd $TARGET_PROJECT_DIR
    install_file $LAPLACIAN_GENERATOR
    install_file $PROJECT_GENERATOR
    install_file $PROJECT_GENERATOR_MAIN
    install_file $VSCODE_SETTING
    install_file $MODEL_SCHEMA_FULL
    install_file $MODEL_SCHEMA_PARTIAL
  )
}

install_file() {
  local rel_path="$1"
  local dir_path=$(dirname $rel_path)
  if [ ! -z $dir_path ] && [ ! -d $dir_path ]
  then
    mkdir -p $dir_path
  fi
  curl -Ls -o "$rel_path" "$RAW_HOST/$rel_path"
  if [[ $rel_path == *.sh ]]
  then
    chmod 755 "$rel_path"
  fi
}

run_generator() {
  $TARGET_PROJECT_DIR/$PROJECT_GENERATOR \
    --local-module-repository '../../../mvn-repo'
}