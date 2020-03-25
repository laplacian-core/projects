#!/usr/bin/env bash
set -e
SCRIPT_BASE_DIR=$(cd $"${BASH_SOURCE%/*}" && pwd)
PROJECT_BASE_DIR=$(cd $SCRIPT_BASE_DIR && cd .. && pwd)

${PROJECT_BASE_DIR}/./generated-projects/laplacian.template.entity.kotlin/scripts/laplacian-template-entity-kotlin-publish.sh