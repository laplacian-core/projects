#!/usr/bin/env bash
set -e
SCRIPT_BASE_DIR=$(cd $"${BASH_SOURCE%/*}" && pwd)
PROJECT_BASE_DIR=$(cd $SCRIPT_BASE_DIR && cd .. && pwd)
LOG_FILE="./update-subprojects-$(date +%Y-%m-%dT%H%M%S).log"
SUBPROJECTS='laplacian-arch-datasource-flyway-migration-template
laplacian-arch-datasource-schema-model
laplacian-arch-datasource-schema-plugin
laplacian-arch-model-service-api
laplacian-arch-schema-service-api
laplacian-arch-template-service-api-springboot2
laplacian-metamodel-plugin
laplacian-metamodel
laplacian-project-base-template
laplacian-project-document-content
laplacian-project-schema-model
laplacian-project-schema-plugin
laplacian-schema-document-template
laplacian-schema-plugin-template
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