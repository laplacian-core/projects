#!/usr/bin/env bash
set -e
PROJECT_BASE_DIR=$(cd $"${BASH_SOURCE%/*}/../../" && pwd)

SCRIPT_BASE_DIR="$PROJECT_BASE_DIR/scripts"
LOCAL_REPO_PATH="$PROJECT_BASE_DIR/../mvn-repo"

TARGET_PROJECT_DIR="$PROJECT_BASE_DIR/subprojects/laplacian-arch.datasource.schema-model"
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
  group: laplacian-arch
  name: datasource.schema-model
  type: schema-model
  namespace: laplacian.arch.datasource
  version: '1.0.0'
  description:
    en: |
      This model expresses a view of a data-store (ex:RDBMS, KVS, etc..) from a certain client This model consists of the following entities:
      - The information which is necessary to connect the data-store
      - The entities allowed for clients to access
      - The queries issued by the client
    ja: |
      This model expresses a view of a data-store (ex:RDBMS, KVS, etc..) from a certain client This model consists of the following entities:
      - The information which is necessary to connect the data-store
      - The entities allowed for clients to access
      - The queries issued by the client
    zh: |
      This model expresses a view of a data-store (ex:RDBMS, KVS, etc..) from a certain client This model consists of the following entities:
      - The information which is necessary to connect the data-store
      - The entities allowed for clients to access
      - The queries issued by the client
  source_repository:
    url: https://github.com/nabla-squared/laplacian-arch.model.datasource.git
    branch: master
  module_repositories:
    local:
      path: ../../../mvn-repo
      url: https://github.com/nabla-squared/mvn-repo
      branch: master
    remote:
    - https://github.com/nabla-squared/mvn-repo
  model_files:
  - $(normalize_path 'src/')
END_FILE
}

checkout_from_code_repository() {
  if [[ ! -d $TARGET_PROJECT_DIR/.git ]]
  then
    mkdir -p $TARGET_PROJECT_DIR
    rm -rf $TARGET_PROJECT_DIR
    git clone \
        https://github.com/nabla-squared/laplacian-arch.model.datasource.git \
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