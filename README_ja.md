<!-- @head-content@ -->
# laplacian/projects

The core modules for the Laplacian generator.


*Read this in other languages*: [[English](README.md)] [[简体中文](README_zh.md)]
<!-- @head-content@ -->

<!-- @toc@ -->
## Table of contents
1. [使用方法](#使用方法)
1. [インデックス](#インデックス)


<!-- @toc@ -->

<!-- @main-content@ -->
## 使用方法

この modelモジュールを適用するには、プロジェクト定義に以下のエントリを追加してください。
```yaml
project:
  models:
  - group: laplacian
    name: projects
    version: 1.0.0
```

下記のコマンドを実行すると、このモジュールの適用によって影響を受ける資源の一覧とその内容を確認できます。

```console
$ ./script/generate --dry-run

diff --color -r PROJECT_HOME/.NEXT/somewhere/something.md PROJECT_HOME/somewhere/something.md
1,26c1,10
< content: OLD CONTENT
---
> content: NEW CONTENT
```

内容に問題が無ければ、下記コマンドを実行して変更を反映してください。

```console
$ ./script/generate --dry-run

```


## インデックス


### ソースコード一覧


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