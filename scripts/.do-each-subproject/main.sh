#!/usr/bin/env bash

SUBPROJECTS='subprojects/laplacian.common-model
subprojects/laplacian.domain-model-plugin.project-template
subprojects/laplacian.domain-model.project-template
subprojects/laplacian.generator.project-template
subprojects/laplacian.metamodel
subprojects/laplacian.project-group.project-template
subprojects/laplacian.project.domain-model
subprojects/laplacian.project.project-types
'

main() {
  for subproject in $SUBPROJECTS
  do
    local path="$PROJECT_BASE_DIR/$subproject"
    echo "
    === $subproject ===
    "
    (cd $path
      $ARGS
    )
  done
}