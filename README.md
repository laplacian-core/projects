<!-- @head-content@ -->
# laplacian/projects

The core modules for the Laplacian generator.


*Read this in other languages*: [[日本語](README_ja.md)] [[简体中文](README_zh.md)]
<!-- @head-content@ -->

<!-- @toc@ -->
## Table of contents
- [Overview](#overview)

  * [Project dependencies](#project-dependencies)

- [Usage](#usage)

- [Index](#index)

  * [Project list](#project-list)

  * [Script List](#script-list)

  * [Source code list](#source-code-list)



<!-- @toc@ -->

<!-- @main-content@ -->
## Overview


### Project dependencies


The following graph shows the dependencies between each project.
![](./doc/image/project-dependency-graph.svg)

## Usage

To apply this Model module, add the following entry to your project definition.
```yaml
project:
  models:
  - group: laplacian
    name: projects
    version: 1.0.0
```

You can run the following command to see a list of resources affected by the application of this module and their contents.
```console
$ ./script/generate --dry-run

diff --color -r PROJECT_HOME/.NEXT/somewhere/something.md PROJECT_HOME/somewhere/something.md
1,26c1,10
< content: OLD CONTENT
---
> content: NEW CONTENT
```

If there is no problem, execute the following command to reflect the change.
```console
$ ./script/generate

```


## Index


### Project list


- [**laplacian/common-model**](<https://github.com/nabla-squared/laplacian.common-model.git>)

> Defines the generally applicable models that is not specific to a certain domain.
> 
- [**laplacian/domain-model-plugin.project-template**](<https://github.com/nabla-squared/laplacian.domain-model-plugin.project-template.git>)

> A template for a domain model plugin project.
> 
- [**laplacian/domain-model.project-template**](<https://github.com/nabla-squared/laplacian.domain-model.project-template.git>)

> This is a template module that generates directory structure, development scripts, and relating documents for a domain model project.
> 
- [**laplacian/generator.project-template**](<https://github.com/nabla-squared/laplacian.generator.project-template.git>)

> This template module generates the standard directory structure and common scripts for building and publishing to local repositories in a Laplacian project.
> 
- [**laplacian/metamodel**](<https://github.com/nabla-squared/laplacian.metamodel.git>)

> This model is a model for defining a model, i.e. a metamodel.
> In this model, you can define a model with the following structure
> 
> - attribute
> - relationship
> - aggregation
> - inheritance
> - mixin
> 
- [**laplacian/project-group.project-template**](<https://github.com/nabla-squared/laplacian.project-group.project-template.git>)

> This is a template used by project groups to generate standard project folder structure and scripts for operations and development.
> 
- [**laplacian/project.domain-model**](<https://github.com/nabla-squared/laplacian.project.domain-model.git>)

> This model represents the logical structure of a *Laplacian*-based project.
> 
- [**laplacian/project.project-types**](<https://github.com/nabla-squared/laplacian.project.project-types.git>)

> The model data that defines the content of each project type.
> 
### Script List


- [./script/create-new-domain-model-plugin-project.sh](<./scripts/create-new-domain-model-plugin-project.sh>)

  Adds a new domain-model-plugin project to this project group.

  > Usage: create-new-domain-model-plugin-project.sh [OPTION]...
  >
  > -h, --help
  >
  >   Displays how to use this command.
  >   
  > -v, --verbose
  >
  >   Displays more detailed command execution information.
  >   
  > , --project-name [VALUE]
  >
  >   New project's name
  >    (Default: domain-model-plugin)
  > , --project-version [VALUE]
  >
  >   The initial version number
  >    (Default: 0.0.1)
  > , --namespace [VALUE]
  >
  >   Namespace
  >    (Default: laplacian)
- [./script/create-new-domain-model-project.sh](<./scripts/create-new-domain-model-project.sh>)

  Adds a new domain-model project to this project group.

  > Usage: create-new-domain-model-project.sh [OPTION]...
  >
  > -h, --help
  >
  >   Displays how to use this command.
  >   
  > -v, --verbose
  >
  >   Displays more detailed command execution information.
  >   
  > , --project-name [VALUE]
  >
  >   New project's name
  >    (Default: domain-model)
  > , --project-version [VALUE]
  >
  >   The initial version number
  >    (Default: 0.0.1)
  > , --namespace [VALUE]
  >
  >   Namespace
  >    (Default: laplacian)
- [./script/create-new-generator-project.sh](<./scripts/create-new-generator-project.sh>)

  Adds a new generator project to this project group.

  > Usage: create-new-generator-project.sh [OPTION]...
  >
  > -h, --help
  >
  >   Displays how to use this command.
  >   
  > -v, --verbose
  >
  >   Displays more detailed command execution information.
  >   
  > , --project-name [VALUE]
  >
  >   New project's name
  >    (Default: generator)
  > , --project-version [VALUE]
  >
  >   The initial version number
  >    (Default: 0.0.1)
  > , --namespace [VALUE]
  >
  >   Namespace
  >    (Default: laplacian)
- [./script/create-new-model-project.sh](<./scripts/create-new-model-project.sh>)

  Adds a new model project to this project group.

  > Usage: create-new-model-project.sh [OPTION]...
  >
  > -h, --help
  >
  >   Displays how to use this command.
  >   
  > -v, --verbose
  >
  >   Displays more detailed command execution information.
  >   
  > , --project-name [VALUE]
  >
  >   New project's name
  >    (Default: model)
  > , --project-version [VALUE]
  >
  >   The initial version number
  >    (Default: 0.0.1)
  > , --namespace [VALUE]
  >
  >   Namespace
  >    (Default: laplacian)
- [./script/create-new-plugin-project.sh](<./scripts/create-new-plugin-project.sh>)

  Adds a new plugin project to this project group.

  > Usage: create-new-plugin-project.sh [OPTION]...
  >
  > -h, --help
  >
  >   Displays how to use this command.
  >   
  > -v, --verbose
  >
  >   Displays more detailed command execution information.
  >   
  > , --project-name [VALUE]
  >
  >   New project's name
  >    (Default: plugin)
  > , --project-version [VALUE]
  >
  >   The initial version number
  >    (Default: 0.0.1)
  > , --namespace [VALUE]
  >
  >   Namespace
  >    (Default: laplacian)
- [./script/create-new-project-group-project.sh](<./scripts/create-new-project-group-project.sh>)

  Adds a new project-group project to this project group.

  > Usage: create-new-project-group-project.sh [OPTION]...
  >
  > -h, --help
  >
  >   Displays how to use this command.
  >   
  > -v, --verbose
  >
  >   Displays more detailed command execution information.
  >   
  > , --project-name [VALUE]
  >
  >   New project's name
  >    (Default: project-group)
  > , --project-version [VALUE]
  >
  >   The initial version number
  >    (Default: 0.0.1)
  > , --namespace [VALUE]
  >
  >   Namespace
  >    (Default: laplacian)
- [./script/create-new-project-types-project.sh](<./scripts/create-new-project-types-project.sh>)

  Adds a new project-types project to this project group.

  > Usage: create-new-project-types-project.sh [OPTION]...
  >
  > -h, --help
  >
  >   Displays how to use this command.
  >   
  > -v, --verbose
  >
  >   Displays more detailed command execution information.
  >   
  > , --project-name [VALUE]
  >
  >   New project's name
  >    (Default: project-types)
  > , --project-version [VALUE]
  >
  >   The initial version number
  >    (Default: 0.0.1)
  > , --namespace [VALUE]
  >
  >   Namespace
  >    (Default: laplacian)
- [./script/create-new-template-project.sh](<./scripts/create-new-template-project.sh>)

  Adds a new template project to this project group.

  > Usage: create-new-template-project.sh [OPTION]...
  >
  > -h, --help
  >
  >   Displays how to use this command.
  >   
  > -v, --verbose
  >
  >   Displays more detailed command execution information.
  >   
  > , --project-name [VALUE]
  >
  >   New project's name
  >    (Default: template)
  > , --project-version [VALUE]
  >
  >   The initial version number
  >    (Default: 0.0.1)
  > , --namespace [VALUE]
  >
  >   Namespace
  >    (Default: laplacian)
- [./script/do-each-subproject.sh](<./scripts/do-each-subproject.sh>)

  Executes the command specified by the argument for each subproject.

  Example:
  ```console
  $ ./scripts/null -c git status
  ```

  > Usage: do-each-subproject.sh [OPTION]...
  >
  > -h, --help
  >
  >   Displays how to use this command.
  >   
  > -v, --verbose
  >
  >   Displays more detailed command execution information.
  >   
  > -c, --continue-on-error
  >
  >   Even if the given command fails in a subproject in the middle, executes it for the remaining subprojects.
  >   
- [./script/generate-all.sh](<./scripts/generate-all.sh>)

  Generates resources in the project, including subprojects.

  > Usage: generate-all.sh [OPTION]...
  >
  > -h, --help
  >
  >   Displays how to use this command.
  >   
  > -v, --verbose
  >
  >   Displays more detailed command execution information.
  >   
  > -c, --continue-on-error
  >
  >   Even if the given command fails in a subproject in the middle, executes it for the remaining subprojects.
  >   
- [./script/generate-common-model.sh](<./scripts/generate-common-model.sh>)

  Generates the [laplacian/common-model](<https://github.com/nabla-squared/laplacian.common-model.git>) project as a subproject in the following directory.
  ```
  subprojects/common-model
  ```
  If the subproject already exists, the content of the subproject is updated.

  > Usage: generate-common-model.sh [OPTION]...
  >
  > -h, --help
  >
  >   Displays how to use this command.
  >   
  > -v, --verbose
  >
  >   Displays more detailed command execution information.
  >   
  > -c, --clean
  >
  >   Delete all local resources of the subproject and regenerate them.
  >   
- [./script/generate-domain-model-plugin-project-template.sh](<./scripts/generate-domain-model-plugin-project-template.sh>)

  Generates the [laplacian/domain-model-plugin.project-template](<https://github.com/nabla-squared/laplacian.domain-model-plugin.project-template.git>) project as a subproject in the following directory.
  ```
  subprojects/domain-model-plugin-project-template
  ```
  If the subproject already exists, the content of the subproject is updated.

  > Usage: generate-domain-model-plugin-project-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   Displays how to use this command.
  >   
  > -v, --verbose
  >
  >   Displays more detailed command execution information.
  >   
  > -c, --clean
  >
  >   Delete all local resources of the subproject and regenerate them.
  >   
- [./script/generate-domain-model-project-template.sh](<./scripts/generate-domain-model-project-template.sh>)

  Generates the [laplacian/domain-model.project-template](<https://github.com/nabla-squared/laplacian.domain-model.project-template.git>) project as a subproject in the following directory.
  ```
  subprojects/domain-model-project-template
  ```
  If the subproject already exists, the content of the subproject is updated.

  > Usage: generate-domain-model-project-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   Displays how to use this command.
  >   
  > -v, --verbose
  >
  >   Displays more detailed command execution information.
  >   
  > -c, --clean
  >
  >   Delete all local resources of the subproject and regenerate them.
  >   
- [./script/generate-generator-project-template.sh](<./scripts/generate-generator-project-template.sh>)

  Generates the [laplacian/generator.project-template](<https://github.com/nabla-squared/laplacian.generator.project-template.git>) project as a subproject in the following directory.
  ```
  subprojects/generator-project-template
  ```
  If the subproject already exists, the content of the subproject is updated.

  > Usage: generate-generator-project-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   Displays how to use this command.
  >   
  > -v, --verbose
  >
  >   Displays more detailed command execution information.
  >   
  > -c, --clean
  >
  >   Delete all local resources of the subproject and regenerate them.
  >   
- [./script/generate-metamodel.sh](<./scripts/generate-metamodel.sh>)

  Generates the [laplacian/metamodel](<https://github.com/nabla-squared/laplacian.metamodel.git>) project as a subproject in the following directory.
  ```
  subprojects/metamodel
  ```
  If the subproject already exists, the content of the subproject is updated.

  > Usage: generate-metamodel.sh [OPTION]...
  >
  > -h, --help
  >
  >   Displays how to use this command.
  >   
  > -v, --verbose
  >
  >   Displays more detailed command execution information.
  >   
  > -c, --clean
  >
  >   Delete all local resources of the subproject and regenerate them.
  >   
- [./script/generate-project-domain-model.sh](<./scripts/generate-project-domain-model.sh>)

  Generates the [laplacian/project.domain-model](<https://github.com/nabla-squared/laplacian.project.domain-model.git>) project as a subproject in the following directory.
  ```
  subprojects/project-domain-model
  ```
  If the subproject already exists, the content of the subproject is updated.

  > Usage: generate-project-domain-model.sh [OPTION]...
  >
  > -h, --help
  >
  >   Displays how to use this command.
  >   
  > -v, --verbose
  >
  >   Displays more detailed command execution information.
  >   
  > -c, --clean
  >
  >   Delete all local resources of the subproject and regenerate them.
  >   
- [./script/generate-project-group-project-template.sh](<./scripts/generate-project-group-project-template.sh>)

  Generates the [laplacian/project-group.project-template](<https://github.com/nabla-squared/laplacian.project-group.project-template.git>) project as a subproject in the following directory.
  ```
  subprojects/project-group-project-template
  ```
  If the subproject already exists, the content of the subproject is updated.

  > Usage: generate-project-group-project-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   Displays how to use this command.
  >   
  > -v, --verbose
  >
  >   Displays more detailed command execution information.
  >   
  > -c, --clean
  >
  >   Delete all local resources of the subproject and regenerate them.
  >   
- [./script/generate-project-project-types.sh](<./scripts/generate-project-project-types.sh>)

  Generates the [laplacian/project.project-types](<https://github.com/nabla-squared/laplacian.project.project-types.git>) project as a subproject in the following directory.
  ```
  subprojects/project-project-types
  ```
  If the subproject already exists, the content of the subproject is updated.

  > Usage: generate-project-project-types.sh [OPTION]...
  >
  > -h, --help
  >
  >   Displays how to use this command.
  >   
  > -v, --verbose
  >
  >   Displays more detailed command execution information.
  >   
  > -c, --clean
  >
  >   Delete all local resources of the subproject and regenerate them.
  >   
- [./script/generate.sh](<./scripts/generate.sh>)

  Generates the resources in each directory of `src/` `model/` `template/` in this project.
  The results are reflected in each directory of `dest/` `doc/` `script/`.

  *Generator input files*

  - `src/`
    Stores static resources that are not processed the generator.
    The contents of this directory are copied directly into the `dest/` directory.

  - `model/`
    Stores the static model data files written in *YAML* or *JSON* format used for the generation.

  - `template/`
    This directory contains the template files used for the generation.
    Files with a extension `.hbs` will be handled as templates. All other files are copied as is.

    - `template/dest` `template/doc` `template/scripts`
      Each of these directories contains the template files of the resource to be output
      in the directory `dest/` `doc/` `scripts`.

    - `template/model` `template/template`
      These directories store template files updating the contents of `template/` and `model/` used for the generation.
      If the content of `template/` `model/` is updated as a result of the generation,
      the generation process is executed recursively.
      The changes to `template/` `model/` that occur during the above process are treated as an intermediate state
      and will be lost after the completion of the process.
      Use the *--dry-run* option to check these intermediate files.

  *Generator output files*

  - `dest/`
    Outputs the source files of applications and modules created as the result of
    the generation process.

  - `doc/`
    Outputs the project documentation.

  - `scripts/`
    Outputs various scripts used in development and operation.

  > Usage: generate.sh [OPTION]...
  >
  > -h, --help
  >
  >   Displays how to use this command.
  >   
  > -v, --verbose
  >
  >   Displays more detailed command execution information.
  >   
  > -d, --dry-run
  >
  >   After this command is processed, the generated files are output to the `.NEXT` directory
  >   without reflecting to the folders of `dest/` `doc/` `scripts/`.
  >   In addition, the difference between the contents of the `.NEXT` directory and the current files.
  >   This directory also contains any intermediate files created during the generation.
  >   
  > -r, --max-recursion [VALUE]
  >
  >   The upper limit of the number of times to execute recursively
  >   when the contents of the `model/` `template/` directory are updated
  >   during the generation process.
  >    (Default: 10)
  > , --local-module-repository [VALUE]
  >
  >   The repository path to store locally built modules.
  >   The modules in this repository have the highest priority.
  >   
  > , --updates-scripts-only
  >
  >   Updates script files only.
  >   This option is used to generate the generator script itself
  >   when the project is initially generated.
  >   
- [./script/git-each-subproject.sh](<./scripts/git-each-subproject.sh>)

  Executes the git sub-command specified by the argument for each subproject.

  Example:
  ```console
  $ ./scripts/null -c status
  ```

  > Usage: git-each-subproject.sh [OPTION]...
  >
  > -h, --help
  >
  >   Displays how to use this command.
  >   
  > -v, --verbose
  >
  >   Displays more detailed command execution information.
  >   
  > -c, --continue-on-error
  >
  >   Even if the given command fails in a subproject in the middle, executes it for the remaining subprojects.
  >   
- [./script/publish-local.sh](<./scripts/publish-local.sh>)

  After the resources in the project are generated,
  the resources in the `./dest` directory are built as a model module
  and registered in the local repository.

  > Usage: publish-local.sh [OPTION]...
  >
  > -h, --help
  >
  >   Displays how to use this command.
  >   
  > -v, --verbose
  >
  >   Displays more detailed command execution information.
  >   
  > -r, --max-recursion [VALUE]
  >
  >   This option is the same as the option of the same name in [generate.sh](<./scripts/generate.sh>).
  >    (Default: 10)
  > , --skip-generation
  >
  >   This option is the same as the option of the same name in [generate.sh](<./scripts/generate.sh>).
  >   
  > , --local-module-repository [VALUE]
  >
  >   The path to the local repository where the built module will be stored.
  >   If the repository does not exist in the specified path, it will be created automatically.
  >   
- [./script/publish-local-common-model.sh](<./scripts/publish-local-common-model.sh>)

  Generates resources for the [laplacian/common-model](<https://github.com/nabla-squared/laplacian.common-model.git>) subproject.

  > Usage: publish-local-common-model.sh [OPTION]...
  >
  > -h, --help
  >
  >   Displays how to use this command.
  >   
  > -v, --verbose
  >
  >   Displays more detailed command execution information.
  >   
- [./script/publish-local-domain-model-plugin-project-template.sh](<./scripts/publish-local-domain-model-plugin-project-template.sh>)

  Generates resources for the [laplacian/domain-model-plugin.project-template](<https://github.com/nabla-squared/laplacian.domain-model-plugin.project-template.git>) subproject.

  > Usage: publish-local-domain-model-plugin-project-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   Displays how to use this command.
  >   
  > -v, --verbose
  >
  >   Displays more detailed command execution information.
  >   
- [./script/publish-local-domain-model-project-template.sh](<./scripts/publish-local-domain-model-project-template.sh>)

  Generates resources for the [laplacian/domain-model.project-template](<https://github.com/nabla-squared/laplacian.domain-model.project-template.git>) subproject.

  > Usage: publish-local-domain-model-project-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   Displays how to use this command.
  >   
  > -v, --verbose
  >
  >   Displays more detailed command execution information.
  >   
- [./script/publish-local-generator-project-template.sh](<./scripts/publish-local-generator-project-template.sh>)

  Generates resources for the [laplacian/generator.project-template](<https://github.com/nabla-squared/laplacian.generator.project-template.git>) subproject.

  > Usage: publish-local-generator-project-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   Displays how to use this command.
  >   
  > -v, --verbose
  >
  >   Displays more detailed command execution information.
  >   
- [./script/publish-local-metamodel.sh](<./scripts/publish-local-metamodel.sh>)

  Generates resources for the [laplacian/metamodel](<https://github.com/nabla-squared/laplacian.metamodel.git>) subproject.

  > Usage: publish-local-metamodel.sh [OPTION]...
  >
  > -h, --help
  >
  >   Displays how to use this command.
  >   
  > -v, --verbose
  >
  >   Displays more detailed command execution information.
  >   
- [./script/publish-local-project-domain-model.sh](<./scripts/publish-local-project-domain-model.sh>)

  Generates resources for the [laplacian/project.domain-model](<https://github.com/nabla-squared/laplacian.project.domain-model.git>) subproject.

  > Usage: publish-local-project-domain-model.sh [OPTION]...
  >
  > -h, --help
  >
  >   Displays how to use this command.
  >   
  > -v, --verbose
  >
  >   Displays more detailed command execution information.
  >   
- [./script/publish-local-project-group-project-template.sh](<./scripts/publish-local-project-group-project-template.sh>)

  Generates resources for the [laplacian/project-group.project-template](<https://github.com/nabla-squared/laplacian.project-group.project-template.git>) subproject.

  > Usage: publish-local-project-group-project-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   Displays how to use this command.
  >   
  > -v, --verbose
  >
  >   Displays more detailed command execution information.
  >   
- [./script/publish-local-project-project-types.sh](<./scripts/publish-local-project-project-types.sh>)

  Generates resources for the [laplacian/project.project-types](<https://github.com/nabla-squared/laplacian.project.project-types.git>) subproject.

  > Usage: publish-local-project-project-types.sh [OPTION]...
  >
  > -h, --help
  >
  >   Displays how to use this command.
  >   
  > -v, --verbose
  >
  >   Displays more detailed command execution information.
  >   
### Source code list


- [model/project.yaml](<./model/project.yaml>)
- [src/project/subprojects/laplacian/laplacian.common-model.yaml](<./src/project/subprojects/laplacian/laplacian.common-model.yaml>)
- [src/project/subprojects/laplacian/laplacian.domain-model-plugin.project-template.yaml](<./src/project/subprojects/laplacian/laplacian.domain-model-plugin.project-template.yaml>)
- [src/project/subprojects/laplacian/laplacian.domain-model.project-template.yaml](<./src/project/subprojects/laplacian/laplacian.domain-model.project-template.yaml>)
- [src/project/subprojects/laplacian/laplacian.generator.project-template.yaml](<./src/project/subprojects/laplacian/laplacian.generator.project-template.yaml>)
- [src/project/subprojects/laplacian/laplacian.metamodel.yaml](<./src/project/subprojects/laplacian/laplacian.metamodel.yaml>)
- [src/project/subprojects/laplacian/laplacian.project.domain-model.yaml](<./src/project/subprojects/laplacian/laplacian.project.domain-model.yaml>)
- [src/project/subprojects/laplacian/laplacian.project-group.project-template.yaml](<./src/project/subprojects/laplacian/laplacian.project-group.project-template.yaml>)
- [src/project/subprojects/laplacian/laplacian.project.project-types.yaml](<./src/project/subprojects/laplacian/laplacian.project.project-types.yaml>)


<!-- @main-content@ -->