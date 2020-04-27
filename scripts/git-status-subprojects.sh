#!/usr/bin/env bash
set -e
PROJECT_BASE_DIR=$(cd $"${BASH_SOURCE%/*}/../" && pwd)

SCRIPT_BASE_DIR="$PROJECT_BASE_DIR/scripts"
LOCAL_REPO_PATH='../mvn-repo'
SUBPROJECTS='subprojects/laplacian-arch.datasource.flyway-migration-template
subprojects/laplacian-arch.datasource.schema-model
subprojects/laplacian-arch.datasource.schema-plugin
subprojects/laplacian-arch.service-api.schema-model
subprojects/laplacian-arch.service-api.schema-plugin
subprojects/laplacian-arch.service-api.springboot2-template
subprojects/laplacian.common-model
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