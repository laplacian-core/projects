#!/usr/bin/env bash

SCRIPTS_DIR='scripts'
GENERATOR_SCRIPT='generate.sh'
LAPLACIAN_GENERATOR="$SCRIPTS_DIR/laplacian-generate.sh"
TARGET_PROJECT_DIR="$PROJECT_BASE_DIR/subprojects/laplacian-arch.service-api.schema-model"
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
        https://github.com/nabla-squared/laplacian-arch.service-api-schema-model.git \
        $TARGET_PROJECT_DIR
  else
    (cd $TARGET_PROJECT_DIR && git pull)
  fi
}


create_project_model_file() {
  mkdir -p $TARGET_MODEL_DIR
  cat <<END_FILE > $TARGET_PROJECT_MODEL_FILE
project:
  group: laplacian-arch
  name: service-api.schema-model
  type: schema-model
  namespace: laplacian.arch.service.api
  version: '1.0.0'
  description:
    en: |
      A model that expresses the logical structure of a service API.
      This model consists of REST api model, GraphQL interface model, and datasource usage model.
    ja: |
      A model that expresses the logical structure of a service API.
      This model consists of REST api model, GraphQL interface model, and datasource usage model.
    zh: |
      A model that expresses the logical structure of a service API.
      This model consists of REST api model, GraphQL interface model, and datasource usage model.
  source_repository:
    url: https://github.com/nabla-squared/laplacian-arch.service-api-schema-model.git
    branch: master
  module_repositories:
    local:
      path: ../../../mvn-repo
    remote:
    - https://github.com/nabla-squared/mvn-repo
  models:
  - group: laplacian-arch
    name: datasource.schema-model
    version: '1.0.0'
  model_files:
  - 'src/'
END_FILE
}

install_generator() {
  local TMP_DIR=".TMP"
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