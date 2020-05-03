<!-- @head-content@ -->
# laplacian/projects

The core modules for the Laplacian generator.


*Read this in other languages*: [[English](README.md)] [[日本語](README_ja.md)]
<!-- @head-content@ -->

<!-- @toc@ -->
## Table of contents
1. [如何使用](#如何使用)
1. [索引](#索引)


<!-- @toc@ -->

<!-- @main-content@ -->
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
$ ./script/generate --dry-run

```


## 索引


### 源码列表


- [model/project.yaml](<./model/project.yaml>)
- [src/project/subprojects/laplacian-arch.architecture-document-template.yaml](<./src/project/subprojects/laplacian-arch.architecture-document-template.yaml>)
- [src/project/subprojects/laplacian-arch.datasource.flyway-migration-template.yaml](<./src/project/subprojects/laplacian-arch.datasource.flyway-migration-template.yaml>)
- [src/project/subprojects/laplacian-arch.datasource.schema-model.yaml](<./src/project/subprojects/laplacian-arch.datasource.schema-model.yaml>)
- [src/project/subprojects/laplacian-arch.datasource.schema-plugin.yaml](<./src/project/subprojects/laplacian-arch.datasource.schema-plugin.yaml>)
- [src/project/subprojects/laplacian-arch.service-api.schema-model.yaml](<./src/project/subprojects/laplacian-arch.service-api.schema-model.yaml>)
- [src/project/subprojects/laplacian-arch.service-api.schema-plugin.yaml](<./src/project/subprojects/laplacian-arch.service-api.schema-plugin.yaml>)
- [src/project/subprojects/laplacian-arch.service-api.springboot2-template.yaml](<./src/project/subprojects/laplacian-arch.service-api.springboot2-template.yaml>)
- [src/project/subprojects/laplacian.common-model-plugin.yaml](<./src/project/subprojects/laplacian.common-model-plugin.yaml>)
- [src/project/subprojects/laplacian.common-model.yaml](<./src/project/subprojects/laplacian.common-model.yaml>)
- [src/project/subprojects/laplacian.domain-model.document-template.yaml](<./src/project/subprojects/laplacian.domain-model.document-template.yaml>)
- [src/project/subprojects/laplacian.metamodel-plugin.yaml](<./src/project/subprojects/laplacian.metamodel-plugin.yaml>)
- [src/project/subprojects/laplacian.metamodel.yaml](<./src/project/subprojects/laplacian.metamodel.yaml>)
- [src/project/subprojects/laplacian.project.base-template.yaml](<./src/project/subprojects/laplacian.project.base-template.yaml>)
- [src/project/subprojects/laplacian.project.document-template.yaml](<./src/project/subprojects/laplacian.project.document-template.yaml>)
- [src/project/subprojects/laplacian.project.project-types.yaml](<./src/project/subprojects/laplacian.project.project-types.yaml>)
- [src/project/subprojects/laplacian.project.schema-model.yaml](<./src/project/subprojects/laplacian.project.schema-model.yaml>)
- [src/project/subprojects/laplacian.project.schema-plugin.yaml](<./src/project/subprojects/laplacian.project.schema-plugin.yaml>)
- [src/project/subprojects/laplacian.schema.plugin-template.yaml](<./src/project/subprojects/laplacian.schema.plugin-template.yaml>)


<!-- @main-content@ -->