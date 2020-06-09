#!/usr/bin/env bash

SUBPROJECTS='subprojects/common-model
subprojects/domain-model-plugin-project-template
subprojects/domain-model-project-template
subprojects/generator-project-template
subprojects/metamodel
subprojects/project-group-project-template
subprojects/project-domain-model
subprojects/project-project-types
'

main() {
  for subproject in $SUBPROJECTS
  do
    local path="$PROJECT_BASE_DIR/$subproject"
    if [[ -d "$path/.git" ]]
    then
      echo "
      === $subproject ===
      "
      (cd $path
        git $ARGS
      )
    fi
  done
}