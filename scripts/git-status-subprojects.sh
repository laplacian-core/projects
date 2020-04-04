#!/usr/bin/env bash
set -e
SCRIPT_BASE_DIR=$(cd $"${BASH_SOURCE%/*}" && pwd)
PROJECT_BASE_DIR=$(cd $SCRIPT_BASE_DIR && cd .. && pwd)
LOCAL_REPO_PATH='../mvn-repo'
SUBPROJECTS='subprojects/laplacian.template.project.base
subprojects/laplacian-arch.template.datasource.flyway-migration
subprojects/laplacian.schema.metamodel
subprojects/laplacian.model.project
subprojects/laplacian-arch.model.datasource
subprojects/laplacian.model.metamodel
subprojects/laplacian.schema.project
subprojects/laplacian.template.metamodel.document
subprojects/laplacian-arch.schema.datasource
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