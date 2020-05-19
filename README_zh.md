<!-- @head-content@ -->
# laplacian/projects

The core modules for the Laplacian generator.


*Read this in other languages*: [[English](README.md)] [[日本語](README_ja.md)]
<!-- @head-content@ -->

<!-- @toc@ -->
## Table of contents
- [概述](#概述)

  * [项目依赖性](#项目依赖性)

- [如何使用](#如何使用)

- [索引](#索引)

  * [项目清单](#项目清单)

  * [命令列表](#命令列表)

  * [源码列表](#源码列表)



<!-- @toc@ -->

<!-- @main-content@ -->
## 概述


### 项目依赖性


下图是每个项目之间的依赖关系。
![](./doc/image/project-dependency-graph.svg)

## 如何使用

要应用此model模块，请在项目定义中加入以下条目

```yaml
project:
  models:
  - group: laplacian
    name: projects
    version: 1.0.0
```

您可以运行以下命令查看受本模块应用影响的资源列表及其内容

```console
$ ./script/generate --dry-run

diff --color -r PROJECT_HOME/.NEXT/somewhere/something.md PROJECT_HOME/somewhere/something.md
1,26c1,10
< content: OLD CONTENT
---
> content: NEW CONTENT
```

如果没有问题，请执行下面的命令来反映变化

```console
$ ./script/generate

```


## 索引


### 项目清单


- [**laplacian-arch/architecture-document-template**](<https://github.com/nabla-squared/laplacian-arch.architecture-document-template.git>)

> This template generates a set of documentation of the system architecture defined by the `laplacian-arch` model.
> 
- [**laplacian-arch/datasource.flyway-migration-template**](<https://github.com/nabla-squared/laplacian-arch.datasource.flyway-migration-template.git>)

> This template generates [flyway](https://flywaydb.org/) database schema migration tasks from datasource models.
> 
- [**laplacian-arch/datasource.schema-model**](<https://github.com/nabla-squared/laplacian-arch.model.datasource.git>)

> This model expresses a view of a data-store (ex:RDBMS, KVS, etc..) from a certain client This model consists of the following entities:
> - The information which is necessary to connect the data-store
> - The entities allowed for clients to access
> - The queries issued by the client
> 
- [**laplacian-arch/datasource.schema-plugin**](<>)

> A schema gradle plugin for the datasource arch model
> 
- [**laplacian-arch/service-api.schema-model**](<https://github.com/nabla-squared/laplacian-arch.service-api-schema-model.git>)

> A model that expresses the logical structure of a service API.
> This model consists of REST api model, GraphQL interface model, and datasource usage model.
> 
- [**laplacian-arch/service-api.schema-plugin**](<>)

> A schema for service-api architecture model.
> 
- [**laplacian-arch/service-api.springboot2-template**](<https://github.com/nabla-squared/laplacian-arch.service-api.springboot2-template.git>)

> This template gives a service api implementation based on the [service-api](https://github.com/nabla-squared/laplacian-arch.service-api.schema-model/) model.
> The architecture stack which is employed in this template is:
>   - Alpine based docker image
>   - OpenJDK8
>   - SpringBoot 2
>   - Java-Graphql
> 
- [**laplacian/common-model-plugin**](<>)

> Plugin module for the laplacian common model.
> 
- [**laplacian/common-model**](<https://github.com/nabla-squared/laplacian.common-model.git>)

> Some value objects and mixins which can be applicable to any domain models.
> 
- [**laplacian/domain-model-plugin.project-template**](<https://github.com/nabla-squared/laplacian.domain-model-plugin.project-template.git>)

> 领域模型插件项目的模板。
> 
- [**laplacian/domain-model.project-template**](<https://github.com/nabla-squared/laplacian.domain-model.project-template.git>)

> 这是一个模板模块、用于生成域模型项目的目录结构、开发脚本和相关文档。
> 
- [**laplacian/generator.project-template**](<https://github.com/nabla-squared/laplacian.generator.project-template.git>)

> 这个模板模块生成标准目录结构和常用脚本，用于在Laplacian项目中构建和发布到本地资源库。
> 
- [**laplacian/metamodel-plugin**](<>)

> A model which expresses the logical structure of laplacian-based projects and modules.
> 
- [**laplacian/metamodel**](<https://github.com/nabla-squared/laplacian.metamodel.git>)

> A model that expresses the structure of relational model with aggregation support.
> This model is used to define models from which templates generate resources such as source code or document.
> 
- [**laplacian/project-group.document-template**](<https://github.com/nabla-squared/laplacian.project-group.document-template.git>)

> 一个模板，用于生成关于项目组的文件。
> 
- [**laplacian/project.domain-model**](<https://github.com/nabla-squared/laplacian.project.domain-model.git>)

> 该模型代表了*Laplacian*项目的逻辑结构。
> 
- [**laplacian/project.project-types**](<https://github.com/nabla-squared/laplacian.project.project-types.git>)

> The basic project types used in the Laplacian project.
> 
### 命令列表


- [./script/do-each-subproject.sh](<./scripts/do-each-subproject.sh>)

  为每个子项目执行参数指定的命令。

  例子:
  ```console
  $ ./scripts/null -c git status
  ```

  > Usage: do-each-subproject.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
  > -c, --continue-on-error
  >
  >   即使给定的命令在中间的一个子项目中失败，对其余的子项目执行该命令。
  >   
- [./script/generate-all.sh](<./scripts/generate-all.sh>)

  生成项目中的资源，包括子项目。

  > Usage: generate-all.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
  > -c, --continue-on-error
  >
  >   即使给定的命令在中间的一个子项目中失败，对其余的子项目执行该命令。
  >   
- [./script/generate-laplacian-arch-architecture-document-template.sh](<./scripts/generate-laplacian-arch-architecture-document-template.sh>)

  在下面的目录中生成[laplacian-arch/architecture-document-template](<https://github.com/nabla-squared/laplacian-arch.architecture-document-template.git>)项目，作为子项目。
  ```
  subprojects/laplacian-arch.architecture-document-template
  ```
  如果子项目已经存在，则更新子项目的内容。

  > Usage: generate-laplacian-arch-architecture-document-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
  > -c, --clean
  >
  >   删除子项目的所有本地资源，并对其进行再生。
  >   
- [./script/generate-laplacian-arch-datasource-flyway-migration-template.sh](<./scripts/generate-laplacian-arch-datasource-flyway-migration-template.sh>)

  在下面的目录中生成[laplacian-arch/datasource.flyway-migration-template](<https://github.com/nabla-squared/laplacian-arch.datasource.flyway-migration-template.git>)项目，作为子项目。
  ```
  subprojects/laplacian-arch.datasource.flyway-migration-template
  ```
  如果子项目已经存在，则更新子项目的内容。

  > Usage: generate-laplacian-arch-datasource-flyway-migration-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
  > -c, --clean
  >
  >   删除子项目的所有本地资源，并对其进行再生。
  >   
- [./script/generate-laplacian-arch-datasource-schema-model.sh](<./scripts/generate-laplacian-arch-datasource-schema-model.sh>)

  在下面的目录中生成[laplacian-arch/datasource.schema-model](<https://github.com/nabla-squared/laplacian-arch.model.datasource.git>)项目，作为子项目。
  ```
  subprojects/laplacian-arch.datasource.schema-model
  ```
  如果子项目已经存在，则更新子项目的内容。

  > Usage: generate-laplacian-arch-datasource-schema-model.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
  > -c, --clean
  >
  >   删除子项目的所有本地资源，并对其进行再生。
  >   
- [./script/generate-laplacian-arch-datasource-schema-plugin.sh](<./scripts/generate-laplacian-arch-datasource-schema-plugin.sh>)

  在下面的目录中生成[laplacian-arch/datasource.schema-plugin](<null>)项目，作为子项目。
  ```
  subprojects/laplacian-arch.datasource.schema-plugin
  ```
  如果子项目已经存在，则更新子项目的内容。

  > Usage: generate-laplacian-arch-datasource-schema-plugin.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
  > -c, --clean
  >
  >   删除子项目的所有本地资源，并对其进行再生。
  >   
- [./script/generate-laplacian-arch-service-api-schema-model.sh](<./scripts/generate-laplacian-arch-service-api-schema-model.sh>)

  在下面的目录中生成[laplacian-arch/service-api.schema-model](<https://github.com/nabla-squared/laplacian-arch.service-api-schema-model.git>)项目，作为子项目。
  ```
  subprojects/laplacian-arch.service-api.schema-model
  ```
  如果子项目已经存在，则更新子项目的内容。

  > Usage: generate-laplacian-arch-service-api-schema-model.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
  > -c, --clean
  >
  >   删除子项目的所有本地资源，并对其进行再生。
  >   
- [./script/generate-laplacian-arch-service-api-schema-plugin.sh](<./scripts/generate-laplacian-arch-service-api-schema-plugin.sh>)

  在下面的目录中生成[laplacian-arch/service-api.schema-plugin](<null>)项目，作为子项目。
  ```
  subprojects/laplacian-arch.service-api.schema-plugin
  ```
  如果子项目已经存在，则更新子项目的内容。

  > Usage: generate-laplacian-arch-service-api-schema-plugin.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
  > -c, --clean
  >
  >   删除子项目的所有本地资源，并对其进行再生。
  >   
- [./script/generate-laplacian-arch-service-api-springboot2-template.sh](<./scripts/generate-laplacian-arch-service-api-springboot2-template.sh>)

  在下面的目录中生成[laplacian-arch/service-api.springboot2-template](<https://github.com/nabla-squared/laplacian-arch.service-api.springboot2-template.git>)项目，作为子项目。
  ```
  subprojects/laplacian-arch.service-api.springboot2-template
  ```
  如果子项目已经存在，则更新子项目的内容。

  > Usage: generate-laplacian-arch-service-api-springboot2-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
  > -c, --clean
  >
  >   删除子项目的所有本地资源，并对其进行再生。
  >   
- [./script/generate-laplacian-common-model-plugin.sh](<./scripts/generate-laplacian-common-model-plugin.sh>)

  在下面的目录中生成[laplacian/common-model-plugin](<null>)项目，作为子项目。
  ```
  subprojects/laplacian.common-model-plugin
  ```
  如果子项目已经存在，则更新子项目的内容。

  > Usage: generate-laplacian-common-model-plugin.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
  > -c, --clean
  >
  >   删除子项目的所有本地资源，并对其进行再生。
  >   
- [./script/generate-laplacian-common-model.sh](<./scripts/generate-laplacian-common-model.sh>)

  在下面的目录中生成[laplacian/common-model](<https://github.com/nabla-squared/laplacian.common-model.git>)项目，作为子项目。
  ```
  subprojects/laplacian.common-model
  ```
  如果子项目已经存在，则更新子项目的内容。

  > Usage: generate-laplacian-common-model.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
  > -c, --clean
  >
  >   删除子项目的所有本地资源，并对其进行再生。
  >   
- [./script/generate-laplacian-domain-model-plugin-project-template.sh](<./scripts/generate-laplacian-domain-model-plugin-project-template.sh>)

  在下面的目录中生成[laplacian/domain-model-plugin.project-template](<https://github.com/nabla-squared/laplacian.domain-model-plugin.project-template.git>)项目，作为子项目。
  ```
  subprojects/laplacian.domain-model-plugin.project-template
  ```
  如果子项目已经存在，则更新子项目的内容。

  > Usage: generate-laplacian-domain-model-plugin-project-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
  > -c, --clean
  >
  >   删除子项目的所有本地资源，并对其进行再生。
  >   
- [./script/generate-laplacian-domain-model-project-template.sh](<./scripts/generate-laplacian-domain-model-project-template.sh>)

  在下面的目录中生成[laplacian/domain-model.project-template](<https://github.com/nabla-squared/laplacian.domain-model.project-template.git>)项目，作为子项目。
  ```
  subprojects/laplacian.domain-model.project-template
  ```
  如果子项目已经存在，则更新子项目的内容。

  > Usage: generate-laplacian-domain-model-project-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
  > -c, --clean
  >
  >   删除子项目的所有本地资源，并对其进行再生。
  >   
- [./script/generate-laplacian-generator-project-template.sh](<./scripts/generate-laplacian-generator-project-template.sh>)

  在下面的目录中生成[laplacian/generator.project-template](<https://github.com/nabla-squared/laplacian.generator.project-template.git>)项目，作为子项目。
  ```
  subprojects/laplacian.generator.project-template
  ```
  如果子项目已经存在，则更新子项目的内容。

  > Usage: generate-laplacian-generator-project-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
  > -c, --clean
  >
  >   删除子项目的所有本地资源，并对其进行再生。
  >   
- [./script/generate-laplacian-metamodel-plugin.sh](<./scripts/generate-laplacian-metamodel-plugin.sh>)

  在下面的目录中生成[laplacian/metamodel-plugin](<null>)项目，作为子项目。
  ```
  subprojects/laplacian.metamodel-plugin
  ```
  如果子项目已经存在，则更新子项目的内容。

  > Usage: generate-laplacian-metamodel-plugin.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
  > -c, --clean
  >
  >   删除子项目的所有本地资源，并对其进行再生。
  >   
- [./script/generate-laplacian-metamodel.sh](<./scripts/generate-laplacian-metamodel.sh>)

  在下面的目录中生成[laplacian/metamodel](<https://github.com/nabla-squared/laplacian.metamodel.git>)项目，作为子项目。
  ```
  subprojects/laplacian.metamodel
  ```
  如果子项目已经存在，则更新子项目的内容。

  > Usage: generate-laplacian-metamodel.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
  > -c, --clean
  >
  >   删除子项目的所有本地资源，并对其进行再生。
  >   
- [./script/generate-laplacian-project-domain-model.sh](<./scripts/generate-laplacian-project-domain-model.sh>)

  在下面的目录中生成[laplacian/project.domain-model](<https://github.com/nabla-squared/laplacian.project.domain-model.git>)项目，作为子项目。
  ```
  subprojects/laplacian.project.domain-model
  ```
  如果子项目已经存在，则更新子项目的内容。

  > Usage: generate-laplacian-project-domain-model.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
  > -c, --clean
  >
  >   删除子项目的所有本地资源，并对其进行再生。
  >   
- [./script/generate-laplacian-project-group-document-template.sh](<./scripts/generate-laplacian-project-group-document-template.sh>)

  在下面的目录中生成[laplacian/project-group.document-template](<https://github.com/nabla-squared/laplacian.project-group.document-template.git>)项目，作为子项目。
  ```
  subprojects/laplacian.project-group.document-template
  ```
  如果子项目已经存在，则更新子项目的内容。

  > Usage: generate-laplacian-project-group-document-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
  > -c, --clean
  >
  >   删除子项目的所有本地资源，并对其进行再生。
  >   
- [./script/generate-laplacian-project-project-types.sh](<./scripts/generate-laplacian-project-project-types.sh>)

  在下面的目录中生成[laplacian/project.project-types](<https://github.com/nabla-squared/laplacian.project.project-types.git>)项目，作为子项目。
  ```
  subprojects/laplacian.project.project-types
  ```
  如果子项目已经存在，则更新子项目的内容。

  > Usage: generate-laplacian-project-project-types.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
  > -c, --clean
  >
  >   删除子项目的所有本地资源，并对其进行再生。
  >   
- [./script/generate.sh](<./scripts/generate.sh>)

  生成本项目中每个`src/` `model/` `template/`目录下的资源。
  结果反映在`dest/` `doc/` `script/`的每个目录中。

  *生成器输入文件*

  - `src/`
    存储未被生成器处理的静态资源。
    这个目录的内容直接复制到`dest/`目录中。

  - `model/`
    存储以 *YAML* 或 *JSON* 格式编写的静态模型数据文件，用于生成。

  - `template/`
    这个目录中包含了用于生成的模板文件。
    扩展名为`.hbs`的文件将作为模板处理。所有其他文件都会被复制。

    - `template/dest` `template/doc` `template/scripts`
      这些目录中的每一个目录都包含要输出的资源的模板文件，其目录为 `dest/`doc/`scripts`。

    - `template/model` `template/template`
      这些目录存储模板文件，更新生成过程中使用的`template/`和`model/`的内容。
      如果在生成过程中更新了 `template/` `model/` 的内容，则生成过程将递归执行。
      在上述过程中发生的对 `template/` `model/` 的变化被视为中间状态，并在过程完成后丢失。
      使用 *--dry-run* 选项来检查这些中间文件。

  *生成器输出文件*

  - `dest/`
    输出作为生成过程的结果的应用程序和模块的源文件。

  - `doc/`
    输出项目文件。

  - `scripts/`
    输出开发和操作中使用的各种脚本。

  > Usage: generate.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
  > -d, --dry-run
  >
  >   该命令处理完毕后，生成的文件将被输出到`.NEXT`目录下。
  >   不反映到`dest/`doc/`doc/`scripts/`文件夹中。
  >   此外，`.NEXT`目录的内容与当前文件之间的差异。
  >   这个目录还包含了在生成过程中创建的任何中间文件。
  >   
  > -r, --max-recursion [VALUE]
  >
  >   当`model/` `template/`目录的内容在生成过程中被更新时，递归执行的次数上限。
  >    (Default: 10)
- [./script/git-each-subproject.sh](<./scripts/git-each-subproject.sh>)

  执行参数为每个子项目指定的git子命令。

  例子:
  ```console
  $ ./scripts/null -c status
  ```

  > Usage: git-each-subproject.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
  > -c, --continue-on-error
  >
  >   即使给定的命令在中间的一个子项目中失败，对其余的子项目执行该命令。
  >   
- [./script/publish-local.sh](<./scripts/publish-local.sh>)

  项目中的资源生成后，在`./dest`目录下的资源作为模型模块建立，并在本地资源库中注册。

  > Usage: publish-local.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
  > -r, --max-recursion [VALUE]
  >
  >   这个选项与[generate.sh](<./scripts/generate.sh>)中的同名选项相同。
  >    (Default: 10)
  > , --skip-generation
  >
  >   这个选项与[generate.sh](<./scripts/generate.sh>)中的同名选项相同。
  >   
- [./script/publish-local-laplacian-arch-architecture-document-template.sh](<./scripts/publish-local-laplacian-arch-architecture-document-template.sh>)

  为[laplacian-arch/architecture-document-template](<https://github.com/nabla-squared/laplacian-arch.architecture-document-template.git>)子项目生成资源。

  > Usage: publish-local-laplacian-arch-architecture-document-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
- [./script/publish-local-laplacian-arch-datasource-flyway-migration-template.sh](<./scripts/publish-local-laplacian-arch-datasource-flyway-migration-template.sh>)

  为[laplacian-arch/datasource.flyway-migration-template](<https://github.com/nabla-squared/laplacian-arch.datasource.flyway-migration-template.git>)子项目生成资源。

  > Usage: publish-local-laplacian-arch-datasource-flyway-migration-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
- [./script/publish-local-laplacian-arch-datasource-schema-model.sh](<./scripts/publish-local-laplacian-arch-datasource-schema-model.sh>)

  为[laplacian-arch/datasource.schema-model](<https://github.com/nabla-squared/laplacian-arch.model.datasource.git>)子项目生成资源。

  > Usage: publish-local-laplacian-arch-datasource-schema-model.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
- [./script/publish-local-laplacian-arch-datasource-schema-plugin.sh](<./scripts/publish-local-laplacian-arch-datasource-schema-plugin.sh>)

  为[laplacian-arch/datasource.schema-plugin](<null>)子项目生成资源。

  > Usage: publish-local-laplacian-arch-datasource-schema-plugin.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
- [./script/publish-local-laplacian-arch-service-api-schema-model.sh](<./scripts/publish-local-laplacian-arch-service-api-schema-model.sh>)

  为[laplacian-arch/service-api.schema-model](<https://github.com/nabla-squared/laplacian-arch.service-api-schema-model.git>)子项目生成资源。

  > Usage: publish-local-laplacian-arch-service-api-schema-model.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
- [./script/publish-local-laplacian-arch-service-api-schema-plugin.sh](<./scripts/publish-local-laplacian-arch-service-api-schema-plugin.sh>)

  为[laplacian-arch/service-api.schema-plugin](<null>)子项目生成资源。

  > Usage: publish-local-laplacian-arch-service-api-schema-plugin.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
- [./script/publish-local-laplacian-arch-service-api-springboot2-template.sh](<./scripts/publish-local-laplacian-arch-service-api-springboot2-template.sh>)

  为[laplacian-arch/service-api.springboot2-template](<https://github.com/nabla-squared/laplacian-arch.service-api.springboot2-template.git>)子项目生成资源。

  > Usage: publish-local-laplacian-arch-service-api-springboot2-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
- [./script/publish-local-laplacian-common-model-plugin.sh](<./scripts/publish-local-laplacian-common-model-plugin.sh>)

  为[laplacian/common-model-plugin](<null>)子项目生成资源。

  > Usage: publish-local-laplacian-common-model-plugin.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
- [./script/publish-local-laplacian-common-model.sh](<./scripts/publish-local-laplacian-common-model.sh>)

  为[laplacian/common-model](<https://github.com/nabla-squared/laplacian.common-model.git>)子项目生成资源。

  > Usage: publish-local-laplacian-common-model.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
- [./script/publish-local-laplacian-domain-model-plugin-project-template.sh](<./scripts/publish-local-laplacian-domain-model-plugin-project-template.sh>)

  为[laplacian/domain-model-plugin.project-template](<https://github.com/nabla-squared/laplacian.domain-model-plugin.project-template.git>)子项目生成资源。

  > Usage: publish-local-laplacian-domain-model-plugin-project-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
- [./script/publish-local-laplacian-domain-model-project-template.sh](<./scripts/publish-local-laplacian-domain-model-project-template.sh>)

  为[laplacian/domain-model.project-template](<https://github.com/nabla-squared/laplacian.domain-model.project-template.git>)子项目生成资源。

  > Usage: publish-local-laplacian-domain-model-project-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
- [./script/publish-local-laplacian-generator-project-template.sh](<./scripts/publish-local-laplacian-generator-project-template.sh>)

  为[laplacian/generator.project-template](<https://github.com/nabla-squared/laplacian.generator.project-template.git>)子项目生成资源。

  > Usage: publish-local-laplacian-generator-project-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
- [./script/publish-local-laplacian-metamodel-plugin.sh](<./scripts/publish-local-laplacian-metamodel-plugin.sh>)

  为[laplacian/metamodel-plugin](<null>)子项目生成资源。

  > Usage: publish-local-laplacian-metamodel-plugin.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
- [./script/publish-local-laplacian-metamodel.sh](<./scripts/publish-local-laplacian-metamodel.sh>)

  为[laplacian/metamodel](<https://github.com/nabla-squared/laplacian.metamodel.git>)子项目生成资源。

  > Usage: publish-local-laplacian-metamodel.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
- [./script/publish-local-laplacian-project-domain-model.sh](<./scripts/publish-local-laplacian-project-domain-model.sh>)

  为[laplacian/project.domain-model](<https://github.com/nabla-squared/laplacian.project.domain-model.git>)子项目生成资源。

  > Usage: publish-local-laplacian-project-domain-model.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
- [./script/publish-local-laplacian-project-group-document-template.sh](<./scripts/publish-local-laplacian-project-group-document-template.sh>)

  为[laplacian/project-group.document-template](<https://github.com/nabla-squared/laplacian.project-group.document-template.git>)子项目生成资源。

  > Usage: publish-local-laplacian-project-group-document-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
- [./script/publish-local-laplacian-project-project-types.sh](<./scripts/publish-local-laplacian-project-project-types.sh>)

  为[laplacian/project.project-types](<https://github.com/nabla-squared/laplacian.project.project-types.git>)子项目生成资源。

  > Usage: publish-local-laplacian-project-project-types.sh [OPTION]...
  >
  > -h, --help
  >
  >   显示如何使用此命令。
  >   
  > -v, --verbose
  >
  >   显示更详细的命令执行信息。
  >   
### 源码列表


- [model/project.yaml](<./model/project.yaml>)
- [src/project/subprojects/laplacian-arch/laplacian-arch.architecture-document-template.yaml](<./src/project/subprojects/laplacian-arch/laplacian-arch.architecture-document-template.yaml>)
- [src/project/subprojects/laplacian-arch/laplacian-arch.datasource.flyway-migration-template.yaml](<./src/project/subprojects/laplacian-arch/laplacian-arch.datasource.flyway-migration-template.yaml>)
- [src/project/subprojects/laplacian-arch/laplacian-arch.datasource.schema-model.yaml](<./src/project/subprojects/laplacian-arch/laplacian-arch.datasource.schema-model.yaml>)
- [src/project/subprojects/laplacian-arch/laplacian-arch.datasource.schema-plugin.yaml](<./src/project/subprojects/laplacian-arch/laplacian-arch.datasource.schema-plugin.yaml>)
- [src/project/subprojects/laplacian-arch/laplacian-arch.service-api.schema-model.yaml](<./src/project/subprojects/laplacian-arch/laplacian-arch.service-api.schema-model.yaml>)
- [src/project/subprojects/laplacian-arch/laplacian-arch.service-api.schema-plugin.yaml](<./src/project/subprojects/laplacian-arch/laplacian-arch.service-api.schema-plugin.yaml>)
- [src/project/subprojects/laplacian-arch/laplacian-arch.service-api.springboot2-template.yaml](<./src/project/subprojects/laplacian-arch/laplacian-arch.service-api.springboot2-template.yaml>)
- [src/project/subprojects/laplacian/laplacian.common-model-plugin.yaml](<./src/project/subprojects/laplacian/laplacian.common-model-plugin.yaml>)
- [src/project/subprojects/laplacian/laplacian.common-model.yaml](<./src/project/subprojects/laplacian/laplacian.common-model.yaml>)
- [src/project/subprojects/laplacian/laplacian.domain-model-plugin.project-template.yaml](<./src/project/subprojects/laplacian/laplacian.domain-model-plugin.project-template.yaml>)
- [src/project/subprojects/laplacian/laplacian.domain-model.project-template.yaml](<./src/project/subprojects/laplacian/laplacian.domain-model.project-template.yaml>)
- [src/project/subprojects/laplacian/laplacian.generator.project-template.yaml](<./src/project/subprojects/laplacian/laplacian.generator.project-template.yaml>)
- [src/project/subprojects/laplacian/laplacian.metamodel-plugin.yaml](<./src/project/subprojects/laplacian/laplacian.metamodel-plugin.yaml>)
- [src/project/subprojects/laplacian/laplacian.metamodel.yaml](<./src/project/subprojects/laplacian/laplacian.metamodel.yaml>)
- [src/project/subprojects/laplacian/laplacian.project.domain-model.yaml](<./src/project/subprojects/laplacian/laplacian.project.domain-model.yaml>)
- [src/project/subprojects/laplacian/laplacian.project-group.document-template.yaml](<./src/project/subprojects/laplacian/laplacian.project-group.document-template.yaml>)
- [src/project/subprojects/laplacian/laplacian.project.project-types.yaml](<./src/project/subprojects/laplacian/laplacian.project.project-types.yaml>)


<!-- @main-content@ -->