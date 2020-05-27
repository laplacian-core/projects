#!/usr/bin/env bash

SCRIPTS='generate-laplacian-common-model
generate-laplacian-domain-model-plugin-project-template
generate-laplacian-domain-model-project-template
generate-laplacian-generator-project-template
generate-laplacian-metamodel
generate-laplacian-project-group-project-template
generate-laplacian-project-domain-model
generate-laplacian-project-project-types
'

main() {
  $PROJECT_BASE_DIR/scripts/generate
  for script in $SCRIPTS
  do
    echo "
    === $script ===
    "
    $PROJECT_BASE_DIR/scripts/$script
  done
}