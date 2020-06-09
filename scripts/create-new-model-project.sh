#!/usr/bin/env bash
set -e
PROJECT_BASE_DIR=$(cd $"${BASH_SOURCE%/*}/../" && pwd)

SCRIPT_BASE_DIR="$PROJECT_BASE_DIR/scripts"


OPT_NAMES='hv-:'

ARGS=
HELP=
VERBOSE=
PROJECT_NAME=model
PROJECT_VERSION=0.0.1
NAMESPACE=laplacian


run_create_new_model_project() {
  parse_args "$@"
  read_user_input
  ! [ -z $VERBOSE ] && set -x
  ! [ -z $HELP ] && show_usage && exit 0

  source $SCRIPT_BASE_DIR/.create-new-model-project/main.sh
  main
}

parse_args() {
  while getopts $OPT_NAMES OPTION;
  do
    case $OPTION in
    -)
      case $OPTARG in
      help)
        HELP='yes';;
      verbose)
        VERBOSE='yes';;
      project-name)
        PROJECT_NAME=("${!OPTIND}"); OPTIND=$(($OPTIND+1));;
      project-version)
        PROJECT_VERSION=("${!OPTIND}"); OPTIND=$(($OPTIND+1));;
      namespace)
        NAMESPACE=("${!OPTIND}"); OPTIND=$(($OPTIND+1));;
      *)
        echo "ERROR: Unknown OPTION --$OPTARG" >&2
        exit 1
      esac
      ;;
    h) HELP='yes';;
    v) VERBOSE='yes';;
    esac
  done
  ARGS=$@
}

read_user_input() {
  local input=
  read -p "Enter project-name${PROJECT_NAME:+$(printf ' [%s]' $PROJECT_NAME)}: " input
  PROJECT_NAME=${input:-"$PROJECT_NAME"}
  read -p "Enter project-version${PROJECT_VERSION:+$(printf ' [%s]' $PROJECT_VERSION)}: " input
  PROJECT_VERSION=${input:-"$PROJECT_VERSION"}
  read -p "Enter namespace${NAMESPACE:+$(printf ' [%s]' $NAMESPACE)}: " input
  NAMESPACE=${input:-"$NAMESPACE"}
}

show_usage () {
cat << 'END'
Usage: ./scripts/create-new-model-project.sh [OPTION]...
  -h, --help
    Displays how to use this command.
  -v, --verbose
    Displays more detailed command execution information.
  --project-name [VALUE]
    New project's name (Default: model)
  --project-version [VALUE]
    The initial version number (Default: 0.0.1)
  --namespace [VALUE]
    Namespace (Default: laplacian)
END
}

run_create_new_model_project "$@"