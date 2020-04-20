#!/usr/bin/env bash
set -e
SCRIPT_BASE_DIR=$(cd $"${BASH_SOURCE%/*}" && pwd)
PROJECT_BASE_DIR=$(cd $SCRIPT_BASE_DIR && cd .. && pwd)
LOCAL_REPO_PATH='../mvn-repo'
SUBPROJECTS='subprojects/laplacian-arch.datasource.flyway-migration-template
subprojects/laplacian-arch.datasource.schema-model
subprojects/laplacian-arch.datasource.schema-plugin
subprojects/laplacian-arch.model.service-api
subprojects/laplacian-arch.schema.service-api
subprojects/laplacian-arch.template.service-api.springboot2
subprojects/laplacian.metamodel-plugin
subprojects/laplacian.metamodel
subprojects/laplacian.project.base-template
subprojects/laplacian.project.document-content
subprojects/laplacian.project.project-types
subprojects/laplacian.project.schema-model
subprojects/laplacian.project.schema-plugin
subprojects/laplacian.schema.document-template
subprojects/laplacian.schema.plugin-template
'

for subproject in $SUBPROJECTS
do
  if [[ -d "$subproject/.git" ]]
  echo "
  === $subproject ===
  "
  then
    (cd $subproject && git status)
  fi
done