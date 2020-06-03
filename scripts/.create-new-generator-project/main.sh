#!/usr/bin/env bash

SUBPROJECTS_DIR="src/project/subprojects/laplacian"

main() {
  create_subproject_model_file
  generate_subproject
  show_next_action_message
}

create_subproject_model_file() {
  local model_file="$PROJECT_BASE_DIR/$SUBPROJECTS_DIR/$PROJECT_NAME.yaml"
  mkdir -p $(dirname $model_file)
cat <<EOF > $model_file
_description: &description
  en: |
    The $PROJECT_NAME project.

project:
  subprojects:
  - group: 'laplacian'
    type: 'generator'
    name: '$PROJECT_NAME'
    namespace: '$NAMESPACE'
    description: *description
    version: '$PROJECT_VERSION'
#   source_repository:
#     url: https://github.com/laplacian/$PROJECT_NAME.git
EOF
}

generate_subproject() {
  $SCRIPT_BASE_DIR/generate.sh
  $SCRIPT_BASE_DIR/generate-${PROJECT_NAME}.sh
}

show_next_action_message() {
  echo "The new subproject is created at ./subprojects/laplacian.${PROJECT_NAME}/"
}