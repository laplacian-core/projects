#!/usr/bin/env bash
set -e
PROJECT_BASE_DIR=$(cd $"${BASH_SOURCE%/*}/../" && pwd)

SCRIPT_BASE_DIR="$PROJECT_BASE_DIR/scripts"
LOG_FILE="./update-subprojects-$(date +%Y-%m-%dT%H%M%S).log"
SUBPROJECTS='laplacian-arch-architecture-document-template
laplacian-arch-datasource-flyway-migration-template
laplacian-arch-datasource-schema-model
laplacian-arch-datasource-schema-plugin
laplacian-arch-service-api-schema-model
laplacian-arch-service-api-schema-plugin
laplacian-arch-service-api-springboot2-template
laplacian-common-model-plugin
laplacian-common-model
laplacian-domain-model-plugin-project-template
laplacian-domain-model-project-template
laplacian-generator-project-template
laplacian-metamodel-plugin
laplacian-metamodel
laplacian-project-group-document-template
laplacian-project-domain-model
laplacian-project-project-types
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