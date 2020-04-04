#!/usr/bin/env bash
set -e
SCRIPT_BASE_DIR=$(cd $"${BASH_SOURCE%/*}" && pwd)
PROJECT_BASE_DIR=$(cd $SCRIPT_BASE_DIR && cd .. && pwd)
LOG_FILE="./update-subprojects-$(date +%Y-%m-%dT%H%M%S).log"
SUBPROJECTS='laplacian-arch-model-datasource
laplacian-arch-schema-datasource
laplacian-arch-template-datasource-flyway-migration
laplacian-model-metamodel
laplacian-model-project
laplacian-schema-metamodel
laplacian-schema-project
laplacian-template-project-base
laplacian-template-schema
'

for subproject in $SUBPROJECTS
do
  UPDATE_SCRIPT="./scripts/$subproject/update-project.sh"
  if [[ -f $UPDATE_SCRIPT ]]
  echo "Updating $subproject..."
  then
    $UPDATE_SCRIPT > $LOG_FILE
  fi
  echo "...Done"
done