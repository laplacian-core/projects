#!/usr/bin/env bash
set -e
SCRIPT_BASE_DIR=$(cd $"${BASH_SOURCE%/*}" && pwd)
PROJECT_BASE_DIR=$(cd $SCRIPT_BASE_DIR && cd .. && pwd)

LOCAL_REPO_PATH="$PROJECT_BASE_DIR/../mvn-repo"

#
# Generate resources for projects project.
#
${SCRIPT_BASE_DIR}/laplacian-generate.sh \
  --schema 'laplacian:laplacian.schema.project:1.0.0' \
  --template 'laplacian:laplacian.template.project.document:1.0.0' \
  --model-files './model/project.yaml' \
  --model-files $(normalize_path 'model/project.yaml') \
  --target-dir ./ \
  --local-repo "$LOCAL_REPO_PATH"