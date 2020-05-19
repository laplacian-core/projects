#!/usr/bin/env bash

SUBPROJECTS='subprojects/laplacian-arch.architecture-document-template
subprojects/laplacian-arch.datasource.flyway-migration-template
subprojects/laplacian-arch.datasource.schema-model
subprojects/laplacian-arch.datasource.schema-plugin
subprojects/laplacian-arch.service-api.schema-model
subprojects/laplacian-arch.service-api.schema-plugin
subprojects/laplacian-arch.service-api.springboot2-template
subprojects/laplacian.common-model-plugin
subprojects/laplacian.common-model
subprojects/laplacian.domain-model-plugin.project-template
subprojects/laplacian.domain-model.project-template
subprojects/laplacian.generator.project-template
subprojects/laplacian.metamodel-plugin
subprojects/laplacian.metamodel
subprojects/laplacian.project-group.document-template
subprojects/laplacian.project.domain-model
subprojects/laplacian.project.project-types
'

main() {
  for subproject in $SUBPROJECTS
  do
    local path="$PROJECT_BASE_DIR/$subproject"
    if [[ -d "$path/.git" ]]
    then
      echo "
      === $subproject ===
      "
      (cd $path
        git $ARGS
      )
    fi
  done
}