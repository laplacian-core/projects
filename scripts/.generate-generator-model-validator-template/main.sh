#!/usr/bin/env bash

SCRIPTS_DIR='scripts'
GENERATOR_SCRIPT='generate.sh'
LAPLACIAN_GENERATOR="$SCRIPTS_DIR/laplacian-generate.sh"
TARGET_PROJECT_DIR="$PROJECT_BASE_DIR/subprojects/laplacian.generator.model-validator-template"
TARGET_MODEL_DIR="$TARGET_PROJECT_DIR/model"
TARGET_SCRIPT_DIR="$TARGET_PROJECT_DIR/$SCRIPTS_DIR"
TARGET_PROJECT_MODEL_FILE="$TARGET_MODEL_DIR/project.yaml"

RAW_HOST='https://raw.githubusercontent.com/nabla-squared/laplacian.generator.project-template/master'

main() {
  sync_source_with_repository
  create_project_model_file
  if ! [ -f $TARGET_SCRIPT_DIR/$GENERATOR_SCRIPT ]
  then
    install_generator
  fi
  run_generator
}


sync_source_with_repository() {
  if [[ ! -d $TARGET_PROJECT_DIR/.git ]]
  then
    mkdir -p $TARGET_PROJECT_DIR
    rm -rf $TARGET_PROJECT_DIR
    git clone -b master \
        https://github.com/nabla-squared/laplacian.generator.model-validator-template.git \
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
  name: generator.model-validator-template
  type: template
  namespace: laplacian
  version: '1.0.0'
  description:
    en: |
      Generates a script that performs model validation using the domain model definition.
      In addition, outputs settings that enable validation and code completion on [Visual Studio Code](https://code.visualstudio.com/).
    ja: |
      ドメインモデル定義に沿ったモデル検証を行うスクリプトを生成します。
      加えて、[Visual Studio Code](https://code.visualstudio.com/)上でのバリデーションと入力補完を可能とする設定を出力します。
    zh: |
      生成一个使用域模型定义执行模型验证的脚本。
      此外，在[Visual Studio Code](https://code.visualstudio.com/)上输出能够进行验证和代码完成的设置。
  source_repository:
    url: https://github.com/nabla-squared/laplacian.generator.model-validator-template.git
    branch: master
  module_repositories:
    local:
      path: ../../../mvn-repo
    remote:
    - https://github.com/nabla-squared/mvn-repo
END_FILE
}

install_generator() {
  local TMP_DIR=".TMP"
  mkdir -p $TARGET_SCRIPT_DIR
  (cd $TARGET_PROJECT_DIR
    curl -Ls -o ./$LAPLACIAN_GENERATOR $RAW_HOST/$LAPLACIAN_GENERATOR
    chmod 755 ./$LAPLACIAN_GENERATOR
    $LAPLACIAN_GENERATOR \
      --plugin 'laplacian:laplacian.project.domain-model-plugin:1.0.0' \
      --plugin 'laplacian:laplacian.common-model-plugin:1.0.0' \
      --template 'laplacian:laplacian.generator.project-template:1.0.0' \
      --model 'laplacian:laplacian.project.project-types:1.0.0' \
      --model-files 'model/project.yaml' \
      --model-files "$TMP_DIR/model/" \
      --local-repo '../../../mvn-repo' \
      --target-dir "$TMP_DIR"
    $LAPLACIAN_GENERATOR \
      --plugin 'laplacian:laplacian.project.domain-model-plugin:1.0.0' \
      --plugin 'laplacian:laplacian.common-model-plugin:1.0.0' \
      --template 'laplacian:laplacian.generator.project-template:1.0.0' \
      --model 'laplacian:laplacian.project.project-types:1.0.0' \
      --model-files 'model/project.yaml' \
      --model-files "$TMP_DIR/model/" \
      --local-repo '../../../mvn-repo' \
      --target-dir "$TMP_DIR"
  )
  trap "rm -rf $TARGET_PROJECT_DIR/$TMP_DIR" EXIT
  mkdir -p $TARGET_SCRIPT_DIR
  rm -rf $TARGET_SCRIPT_DIR
  mv "$TARGET_PROJECT_DIR/$TMP_DIR/scripts" $TARGET_SCRIPT_DIR
}

run_generator() {
  $TARGET_SCRIPT_DIR/$GENERATOR_SCRIPT
}