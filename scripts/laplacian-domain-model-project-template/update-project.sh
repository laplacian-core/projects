#!/usr/bin/env bash
set -e
PROJECT_BASE_DIR=$(cd $"${BASH_SOURCE%/*}/../../" && pwd)

SCRIPT_BASE_DIR="$PROJECT_BASE_DIR/scripts"
LOCAL_REPO_PATH="$PROJECT_BASE_DIR/../mvn-repo"

TARGET_PROJECT_DIR="$PROJECT_BASE_DIR/subprojects/laplacian.domain-model.project-template"
TARGET_MODEL_DIR="$TARGET_PROJECT_DIR/model"
TARGET_PROJECT_MODEL_FILE="$TARGET_MODEL_DIR/project.yaml"

GENERATOR_SCRIPT_FILE_NAME=generate.sh
TARGET_SCRIPT_DIR="$TARGET_PROJECT_DIR/scripts"
TARGET_PROJECT_GENERATOR_SCRIPT="$TARGET_SCRIPT_DIR/$GENERATOR_SCRIPT_FILE_NAME"

main() {
  checkout_from_code_repository
  create_project_model_file
  install_generator
  trap run_generator 0
}

create_project_model_file() {
  mkdir -p $TARGET_MODEL_DIR
  cat <<END_FILE > $TARGET_PROJECT_MODEL_FILE
project:
  group: laplacian
  name: domain-model.project-template
  type: template
  namespace: laplacian
  version: '1.0.0'
  description:
    en: |
      This is a template module that generates directory structure, development scripts, and relating documents for a domain model project.
    ja: |
      ドメインモデルプロジェクトのディレクトリ構成、開発用スクリプト、各種ドキュメントを生成するテンプレートモジュールです。
    zh: |
      这是一个模板模块、用于生成域模型项目的目录结构、开发脚本和相关文档。
  source_repository:
    url: https://github.com/nabla-squared/laplacian.domain-model.project-template.git
    branch: master
  module_repositories:
    local:
      path: ../../../mvn-repo
      url: https://github.com/nabla-squared/mvn-repo
      branch: master
    remote:
    - https://github.com/nabla-squared/mvn-repo
  template_files:
  - 'dest/'
END_FILE
}

checkout_from_code_repository() {
  if [[ ! -d $TARGET_PROJECT_DIR/.git ]]
  then
    mkdir -p $TARGET_PROJECT_DIR
    rm -rf $TARGET_PROJECT_DIR
    git clone \
        https://github.com/nabla-squared/laplacian.domain-model.project-template.git \
        $TARGET_PROJECT_DIR
  fi
  (cd $TARGET_PROJECT_DIR
    git checkout master
    git pull
  )
}


install_generator() {
  mkdir -p $TARGET_SCRIPT_DIR
  (cd $TARGET_PROJECT_DIR
    curl -Ls https://git.io/fhxcl | bash
  )
}

run_generator() {
  ${TARGET_SCRIPT_DIR}/laplacian-generate.sh \
    --plugin 'laplacian:laplacian.project.schema-plugin:1.0.0' \
    --plugin 'laplacian:laplacian.common-model-plugin:1.0.0' \
    --model 'laplacian:laplacian.project.project-types:1.0.0' \
    --model 'laplacian:laplacian.common-model:1.0.0' \
    --template 'laplacian:laplacian.generator.project-template:1.0.0' \
    --model-files './model/project.yaml' \
    --model-files './model/project' \
    --target-dir './' \
    --local-repo "$LOCAL_REPO_PATH"
}

main