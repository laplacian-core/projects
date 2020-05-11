#!/usr/bin/env bash
set -e
PROJECT_BASE_DIR=$(cd $"${BASH_SOURCE%/*}/../" && pwd)

SCRIPT_BASE_DIR="$PROJECT_BASE_DIR/scripts"
LOCAL_REPO_PATH='../mvn-repo'
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

for subproject in $SUBPROJECTS
do
  if [[ -d "$subproject/.git" ]]
  then
    echo "
    === $subproject ===
    "
    (cd $subproject && git status)
  fi
done