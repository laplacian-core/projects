#!/usr/bin/env bash

SCRIPTS='generate-laplacian-arch-architecture-document-template
generate-laplacian-arch-datasource-flyway-migration-template
generate-laplacian-arch-datasource-schema-model
generate-laplacian-arch-datasource-schema-plugin
generate-laplacian-arch-service-api-schema-model
generate-laplacian-arch-service-api-schema-plugin
generate-laplacian-arch-service-api-springboot2-template
generate-laplacian-common-model-plugin
generate-laplacian-common-model
generate-laplacian-domain-model-plugin-project-template
generate-laplacian-domain-model-project-template
generate-laplacian-generator-project-template
generate-laplacian-metamodel-plugin
generate-laplacian-metamodel
generate-laplacian-project-group-document-template
generate-laplacian-project-domain-model
generate-laplacian-project-project-types
'

main() {
  $PROJECT_BASE_DIR/scripts/generate
  for script in $SCRIPTS
  do
    echo "
    === $script ===
    "
    $PROJECT_BASE_DIR/scripts/$script
  done
}