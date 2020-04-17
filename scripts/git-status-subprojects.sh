#!/usr/bin/env bash
set -e
SCRIPT_BASE_DIR=$(cd $"${BASH_SOURCE%/*}" && pwd)
PROJECT_BASE_DIR=$(cd $SCRIPT_BASE_DIR && cd .. && pwd)
LOCAL_REPO_PATH='../mvn-repo'
SUBPROJECTS='subprojects/laplacian-arch.model.datasource
subprojects/laplacian-arch.model.service-api
subprojects/laplacian-arch.schema.datasource
subprojects/laplacian-arch.schema.service-api
subprojects/laplacian-arch.template.datasource.flyway-migration
subprojects/laplacian-arch.template.service-api.springboot2
subprojects/laplacian.model.metamodel
subprojects/laplacian.project-base.template
subprojects/laplacian.project-doc.content
subprojects/laplacian.project.schema-model
subprojects/laplacian.schema-doc.template
subprojects/laplacian.schema.metamodel
subprojects/laplacian.schema.project
subprojects/laplacian.template.schema
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