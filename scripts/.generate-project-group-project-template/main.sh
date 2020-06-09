#!/usr/bin/env bash

MODEL_DIR='model'
PROJECT_MODEL_FILE="$MODEL_DIR/project.yaml"
MODEL_SCHEMA_PARTIAL='model-schema-partial.json'
MODEL_SCHEMA_FULL='model-schema-full.json'

SCRIPTS_DIR='scripts'
PROJECT_GENERATOR="$SCRIPTS_DIR/generate.sh"
PROJECT_GENERATOR_MAIN="$SCRIPTS_DIR/.generate/main.sh"
LAPLACIAN_GENERATOR="$SCRIPTS_DIR/laplacian-generate.sh"
VSCODE_SETTING=".vscode/settings.json"

TARGET_PROJECT_DIR="$PROJECT_BASE_DIR/subprojects/project-group-project-template"
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
        https://github.com/laplacian-core/project-group.project-template.git \
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
  name: project-group.project-template
  type: template
  namespace: laplacian
  version: '1.0.0'
  description:
    en: |
      This is a template used by project groups to generate standard project folder structure and scripts for operations and development.
    ja: |
      プロジェクトグループ用の標準プロジェクト構成および、運用・開発用スクリプトを生成するテンプレートです。
    zh: |
      这个模板是项目组用来生成标准的项目文件夹结构和操作和开发脚本的模板。
  source_repository:
    url: https://github.com/laplacian-core/project-group.project-template.git
    branch: master
  module_repositories:
    local:
      ../../../mvn-repo
    remote:
    - https://github.com/nabla-squared/mvn-repo
  template_files:
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
  cp "$PROJECT_BASE_DIR/$rel_path" $rel_path
}

run_generator() {
  $TARGET_PROJECT_DIR/$PROJECT_GENERATOR \
    --local-module-repository '../../../mvn-repo' \
    --updates-scripts-only

  # We need to run it twice as the generate.sh itself may be updated in the first run.
  $TARGET_PROJECT_DIR/$PROJECT_GENERATOR \
    --local-module-repository '../../../mvn-repo'
}