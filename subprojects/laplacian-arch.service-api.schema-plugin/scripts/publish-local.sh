#!/usr/bin/env bash
set -e
SCRIPT_BASE_DIR=$(cd $"${BASH_SOURCE%/*}" && pwd)
PROJECT_BASE_DIR=$(cd $SCRIPT_BASE_DIR && cd .. && pwd)

GRADLE_DIR=${SCRIPT_BASE_DIR}/build/laplacian
GRADLE_BUILD_FILE="$GRADLE_DIR/build.gradle"
GRADLE_SETTINGS_FILE="$GRADLE_DIR/settings.gradle"

REMOTE_REPO_PATH='https://raw.github.com/nabla-squared/mvn-repo/master/'
LOCAL_REPO_PATH="$PROJECT_BASE_DIR/../mvn-repo"
if [[ -d "$PROJECT_BASE_DIR/subprojects/mvn-repo" ]]
then
  LOCAL_REPO_PATH="$PROJECT_BASE_DIR/subprojects/mvn-repo"
fi

DEST_DIR="$PROJECT_BASE_DIR/dest"

main() {
  generate
  publish

}

## @generate-function@ ##
generate() {
  $SCRIPT_BASE_DIR/generate.sh
}
## @generate-function@ ##

## @publish-function@ ##
publish() {
    (cd $DEST_DIR
      ./gradlew publish
    )
}
## @publish-function@ ##

main