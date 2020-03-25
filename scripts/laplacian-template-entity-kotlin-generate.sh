#!/usr/bin/env bash
set -e
SCRIPT_BASE_DIR=$(cd $"${BASH_SOURCE%/*}" && pwd)
PROJECT_BASE_DIR=$(cd $SCRIPT_BASE_DIR && cd .. && pwd)

TARGET_PROJECT_DIR=./generated-projects/laplacian.template.entity.kotlin
TARGET_MODEL_DIR="$TARGET_PROJECT_DIR/model"
TARGET_PROJECT_MODEL_FILE="$TARGET_MODEL_DIR/template-entity-kotlin-project.yaml"

mkdir -p $TARGET_MODEL_DIR
cat <<END_FILE > $TARGET_PROJECT_MODEL_FILE
project:
  group: laplacian
  name: template.entity.kotlin
  namespace: laplacian
  subprojects: []
END_FILE


GENERATOR_SCRIPT_FILE_NAME=laplacian-template-entity-kotlin-generate.sh
TARGET_SCRIPT_DIR="$TARGET_PROJECT_DIR/scripts"
TARGET_PROJECT_GENERATOR_SCRIPT="$TARGET_SCRIPT_DIR/$GENERATOR_SCRIPT_FILE_NAME"

mkdir -p $TARGET_SCRIPT_DIR
cat <<END_FILE > $TARGET_PROJECT_GENERATOR_SCRIPT
#!/usr/bin/env bash
set -e
SCRIPT_BASE_DIR=\$(cd \$"${BASH_SOURCE%/*}" && pwd)
PROJECT_BASE_DIR=\$(cd \$SCRIPT_BASE_DIR && cd .. && pwd)

#
# Generate resources for template.entity.kotlin project.
#
(cd \$PROJECT_BASE_DIR
  \${SCRIPT_BASE_DIR}/laplacian-generate.sh \\
  --template 'laplacian:laplacian.template.project.base:1.0.0' \\
  --model-files './model/template-entity-kotlin-project.yaml' \\
  --template-files "$PROJECT_BASE_DIR/./laplacian.template.template.base/template" \\
  --target-dir ./
)
END_FILE
chmod 755 $TARGET_PROJECT_GENERATOR_SCRIPT

(cd $TARGET_PROJECT_DIR
  ./scripts/$GENERATOR_SCRIPT_FILE_NAME
)