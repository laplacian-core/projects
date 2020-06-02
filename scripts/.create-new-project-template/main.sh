#!/usr/bin/env bash

SUBPROJECT_MODEL_FILE="$PROJECT_BASE_DIR/src/project/subprojects/laplacian/project.yaml"

main() {
  create_subproject_model_file
  generate_subproject
  show_next_action_message
}

create_subproject_model_file() {
  mkdir -p $(basedir $SUBPROJECT_MODEL_FILE)
cat <<'EOF' > $SUBPROJECT_MODEL_FILE
_description: &description
  en: |
    The $PROJECT_NAME project.

project:
  subprojects:
  - group: 'laplacian'
    type: 'template'
    name: '$PROJECT_NAME'
    namespace: '$NAMESPACE'
    description: *description
    version: '$PROJECT_VERSION'
#   source_repository:
#     url: https://github.com/laplacian/$PROJECT_NAME.git
    template_files:
    - dest/
EOF
}

generate_subproject() {
  $SCRIPT_BASE_DIR/generate.sh
  $SCRIPT_BASE_DIR/generate-projects.sh
}

show_next_action_message() {
  echo "The new subproject is created at ./subprojects/laplacian.${PROJECT_NAME}/"
}