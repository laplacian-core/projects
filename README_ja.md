<!-- @head-content@ -->
# laplacian/projects

The core modules for the Laplacian generator.


*Read this in other languages*: [[English](README.md)] [[简体中文](README_zh.md)]
<!-- @head-content@ -->

<!-- @toc@ -->
## Table of contents
- [概要](#概要)

  * [プロジェクト依存関係](#プロジェクト依存関係)

- [使用方法](#使用方法)

- [インデックス](#インデックス)

  * [プロジェクト一覧](#プロジェクト一覧)

  * [スクリプト一覧](#スクリプト一覧)

  * [ソースコード一覧](#ソースコード一覧)



<!-- @toc@ -->

<!-- @main-content@ -->
## 概要


### プロジェクト依存関係


以下の図は、各プロジェクト間の依存関係を表したグラフです。
![](./doc/image/project-dependency-graph.svg)

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
$ ./script/generate

```


## インデックス


### プロジェクト一覧


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

> ドメインモデルプラグインプロジェクトのテンプレートです。
> 
- [**laplacian/domain-model.project-template**](<https://github.com/nabla-squared/laplacian.domain-model.project-template.git>)

> ドメインモデルプロジェクトのディレクトリ構成、開発用スクリプト、各種ドキュメントを生成するテンプレートモジュールです。
> 
- [**laplacian/generator.project-template**](<https://github.com/nabla-squared/laplacian.generator.project-template.git>)

> このテンプレートモジュールは、Laplacianプロジェクトにおける標準的なディレクトリ構成と、
> ビルドおよびローカルリポジトリへの公開を行う共通的なスクリプトを生成します。
> 
- [**laplacian/metamodel-plugin**](<>)

> A model which expresses the logical structure of laplacian-based projects and modules.
> 
- [**laplacian/metamodel**](<https://github.com/nabla-squared/laplacian.metamodel.git>)

> A model that expresses the structure of relational model with aggregation support.
> This model is used to define models from which templates generate resources such as source code or document.
> 
- [**laplacian/project-group.document-template**](<https://github.com/nabla-squared/laplacian.project-group.document-template.git>)

> プロジェクトグループに関するドキュメントを生成するテンプレートです。
> 
- [**laplacian/project.domain-model**](<https://github.com/nabla-squared/laplacian.project.domain-model.git>)

> このモデルは*Laplacian*プロジェクトの論理構造を表します。
> 
- [**laplacian/project.project-types**](<https://github.com/nabla-squared/laplacian.project.project-types.git>)

> The basic project types used in the Laplacian project.
> 
### スクリプト一覧


- [./script/do-each-subproject.sh](<./scripts/do-each-subproject.sh>)

  各サブプロジェクトに対して、引数で指定されたコマンドを一括で実行します。

  使用例:
  ```console
  $ ./scripts/null -c git status
  ```

  > Usage: do-each-subproject.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
  > -c, --continue-on-error
  >
  >   途中のサブプロジェクトで与えられたコマンドが失敗しても、残りのサブプロジェクトに対してコマンドを実行します。
  >   
- [./script/generate-all.sh](<./scripts/generate-all.sh>)

  サブプロジェクトを含むプロジェクト内の資源を自動生成します。

  > Usage: generate-all.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
  > -c, --continue-on-error
  >
  >   途中のサブプロジェクトで与えられたコマンドが失敗しても、残りのサブプロジェクトに対してコマンドを実行します。
  >   
- [./script/generate-laplacian-arch-architecture-document-template.sh](<./scripts/generate-laplacian-arch-architecture-document-template.sh>)

  [laplacian-arch/architecture-document-template](<https://github.com/nabla-squared/laplacian-arch.architecture-document-template.git>)プロジェクトをサブプロジェクトとして下記のディレクトリに生成します。
  ```
  subprojects/laplacian-arch.architecture-document-template
  ```
  すでにそのサブプロジェクトが存在する場合はその内容を更新します。

  > Usage: generate-laplacian-arch-architecture-document-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
  > -c, --clean
  >
  >   サブプロジェクトのローカルにある資源を全て削除してから再生成します。
  >   
- [./script/generate-laplacian-arch-datasource-flyway-migration-template.sh](<./scripts/generate-laplacian-arch-datasource-flyway-migration-template.sh>)

  [laplacian-arch/datasource.flyway-migration-template](<https://github.com/nabla-squared/laplacian-arch.datasource.flyway-migration-template.git>)プロジェクトをサブプロジェクトとして下記のディレクトリに生成します。
  ```
  subprojects/laplacian-arch.datasource.flyway-migration-template
  ```
  すでにそのサブプロジェクトが存在する場合はその内容を更新します。

  > Usage: generate-laplacian-arch-datasource-flyway-migration-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
  > -c, --clean
  >
  >   サブプロジェクトのローカルにある資源を全て削除してから再生成します。
  >   
- [./script/generate-laplacian-arch-datasource-schema-model.sh](<./scripts/generate-laplacian-arch-datasource-schema-model.sh>)

  [laplacian-arch/datasource.schema-model](<https://github.com/nabla-squared/laplacian-arch.model.datasource.git>)プロジェクトをサブプロジェクトとして下記のディレクトリに生成します。
  ```
  subprojects/laplacian-arch.datasource.schema-model
  ```
  すでにそのサブプロジェクトが存在する場合はその内容を更新します。

  > Usage: generate-laplacian-arch-datasource-schema-model.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
  > -c, --clean
  >
  >   サブプロジェクトのローカルにある資源を全て削除してから再生成します。
  >   
- [./script/generate-laplacian-arch-datasource-schema-plugin.sh](<./scripts/generate-laplacian-arch-datasource-schema-plugin.sh>)

  [laplacian-arch/datasource.schema-plugin](<null>)プロジェクトをサブプロジェクトとして下記のディレクトリに生成します。
  ```
  subprojects/laplacian-arch.datasource.schema-plugin
  ```
  すでにそのサブプロジェクトが存在する場合はその内容を更新します。

  > Usage: generate-laplacian-arch-datasource-schema-plugin.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
  > -c, --clean
  >
  >   サブプロジェクトのローカルにある資源を全て削除してから再生成します。
  >   
- [./script/generate-laplacian-arch-service-api-schema-model.sh](<./scripts/generate-laplacian-arch-service-api-schema-model.sh>)

  [laplacian-arch/service-api.schema-model](<https://github.com/nabla-squared/laplacian-arch.service-api-schema-model.git>)プロジェクトをサブプロジェクトとして下記のディレクトリに生成します。
  ```
  subprojects/laplacian-arch.service-api.schema-model
  ```
  すでにそのサブプロジェクトが存在する場合はその内容を更新します。

  > Usage: generate-laplacian-arch-service-api-schema-model.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
  > -c, --clean
  >
  >   サブプロジェクトのローカルにある資源を全て削除してから再生成します。
  >   
- [./script/generate-laplacian-arch-service-api-schema-plugin.sh](<./scripts/generate-laplacian-arch-service-api-schema-plugin.sh>)

  [laplacian-arch/service-api.schema-plugin](<null>)プロジェクトをサブプロジェクトとして下記のディレクトリに生成します。
  ```
  subprojects/laplacian-arch.service-api.schema-plugin
  ```
  すでにそのサブプロジェクトが存在する場合はその内容を更新します。

  > Usage: generate-laplacian-arch-service-api-schema-plugin.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
  > -c, --clean
  >
  >   サブプロジェクトのローカルにある資源を全て削除してから再生成します。
  >   
- [./script/generate-laplacian-arch-service-api-springboot2-template.sh](<./scripts/generate-laplacian-arch-service-api-springboot2-template.sh>)

  [laplacian-arch/service-api.springboot2-template](<https://github.com/nabla-squared/laplacian-arch.service-api.springboot2-template.git>)プロジェクトをサブプロジェクトとして下記のディレクトリに生成します。
  ```
  subprojects/laplacian-arch.service-api.springboot2-template
  ```
  すでにそのサブプロジェクトが存在する場合はその内容を更新します。

  > Usage: generate-laplacian-arch-service-api-springboot2-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
  > -c, --clean
  >
  >   サブプロジェクトのローカルにある資源を全て削除してから再生成します。
  >   
- [./script/generate-laplacian-common-model-plugin.sh](<./scripts/generate-laplacian-common-model-plugin.sh>)

  [laplacian/common-model-plugin](<null>)プロジェクトをサブプロジェクトとして下記のディレクトリに生成します。
  ```
  subprojects/laplacian.common-model-plugin
  ```
  すでにそのサブプロジェクトが存在する場合はその内容を更新します。

  > Usage: generate-laplacian-common-model-plugin.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
  > -c, --clean
  >
  >   サブプロジェクトのローカルにある資源を全て削除してから再生成します。
  >   
- [./script/generate-laplacian-common-model.sh](<./scripts/generate-laplacian-common-model.sh>)

  [laplacian/common-model](<https://github.com/nabla-squared/laplacian.common-model.git>)プロジェクトをサブプロジェクトとして下記のディレクトリに生成します。
  ```
  subprojects/laplacian.common-model
  ```
  すでにそのサブプロジェクトが存在する場合はその内容を更新します。

  > Usage: generate-laplacian-common-model.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
  > -c, --clean
  >
  >   サブプロジェクトのローカルにある資源を全て削除してから再生成します。
  >   
- [./script/generate-laplacian-domain-model-plugin-project-template.sh](<./scripts/generate-laplacian-domain-model-plugin-project-template.sh>)

  [laplacian/domain-model-plugin.project-template](<https://github.com/nabla-squared/laplacian.domain-model-plugin.project-template.git>)プロジェクトをサブプロジェクトとして下記のディレクトリに生成します。
  ```
  subprojects/laplacian.domain-model-plugin.project-template
  ```
  すでにそのサブプロジェクトが存在する場合はその内容を更新します。

  > Usage: generate-laplacian-domain-model-plugin-project-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
  > -c, --clean
  >
  >   サブプロジェクトのローカルにある資源を全て削除してから再生成します。
  >   
- [./script/generate-laplacian-domain-model-project-template.sh](<./scripts/generate-laplacian-domain-model-project-template.sh>)

  [laplacian/domain-model.project-template](<https://github.com/nabla-squared/laplacian.domain-model.project-template.git>)プロジェクトをサブプロジェクトとして下記のディレクトリに生成します。
  ```
  subprojects/laplacian.domain-model.project-template
  ```
  すでにそのサブプロジェクトが存在する場合はその内容を更新します。

  > Usage: generate-laplacian-domain-model-project-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
  > -c, --clean
  >
  >   サブプロジェクトのローカルにある資源を全て削除してから再生成します。
  >   
- [./script/generate-laplacian-generator-project-template.sh](<./scripts/generate-laplacian-generator-project-template.sh>)

  [laplacian/generator.project-template](<https://github.com/nabla-squared/laplacian.generator.project-template.git>)プロジェクトをサブプロジェクトとして下記のディレクトリに生成します。
  ```
  subprojects/laplacian.generator.project-template
  ```
  すでにそのサブプロジェクトが存在する場合はその内容を更新します。

  > Usage: generate-laplacian-generator-project-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
  > -c, --clean
  >
  >   サブプロジェクトのローカルにある資源を全て削除してから再生成します。
  >   
- [./script/generate-laplacian-metamodel-plugin.sh](<./scripts/generate-laplacian-metamodel-plugin.sh>)

  [laplacian/metamodel-plugin](<null>)プロジェクトをサブプロジェクトとして下記のディレクトリに生成します。
  ```
  subprojects/laplacian.metamodel-plugin
  ```
  すでにそのサブプロジェクトが存在する場合はその内容を更新します。

  > Usage: generate-laplacian-metamodel-plugin.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
  > -c, --clean
  >
  >   サブプロジェクトのローカルにある資源を全て削除してから再生成します。
  >   
- [./script/generate-laplacian-metamodel.sh](<./scripts/generate-laplacian-metamodel.sh>)

  [laplacian/metamodel](<https://github.com/nabla-squared/laplacian.metamodel.git>)プロジェクトをサブプロジェクトとして下記のディレクトリに生成します。
  ```
  subprojects/laplacian.metamodel
  ```
  すでにそのサブプロジェクトが存在する場合はその内容を更新します。

  > Usage: generate-laplacian-metamodel.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
  > -c, --clean
  >
  >   サブプロジェクトのローカルにある資源を全て削除してから再生成します。
  >   
- [./script/generate-laplacian-project-domain-model.sh](<./scripts/generate-laplacian-project-domain-model.sh>)

  [laplacian/project.domain-model](<https://github.com/nabla-squared/laplacian.project.domain-model.git>)プロジェクトをサブプロジェクトとして下記のディレクトリに生成します。
  ```
  subprojects/laplacian.project.domain-model
  ```
  すでにそのサブプロジェクトが存在する場合はその内容を更新します。

  > Usage: generate-laplacian-project-domain-model.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
  > -c, --clean
  >
  >   サブプロジェクトのローカルにある資源を全て削除してから再生成します。
  >   
- [./script/generate-laplacian-project-group-document-template.sh](<./scripts/generate-laplacian-project-group-document-template.sh>)

  [laplacian/project-group.document-template](<https://github.com/nabla-squared/laplacian.project-group.document-template.git>)プロジェクトをサブプロジェクトとして下記のディレクトリに生成します。
  ```
  subprojects/laplacian.project-group.document-template
  ```
  すでにそのサブプロジェクトが存在する場合はその内容を更新します。

  > Usage: generate-laplacian-project-group-document-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
  > -c, --clean
  >
  >   サブプロジェクトのローカルにある資源を全て削除してから再生成します。
  >   
- [./script/generate-laplacian-project-project-types.sh](<./scripts/generate-laplacian-project-project-types.sh>)

  [laplacian/project.project-types](<https://github.com/nabla-squared/laplacian.project.project-types.git>)プロジェクトをサブプロジェクトとして下記のディレクトリに生成します。
  ```
  subprojects/laplacian.project.project-types
  ```
  すでにそのサブプロジェクトが存在する場合はその内容を更新します。

  > Usage: generate-laplacian-project-project-types.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
  > -c, --clean
  >
  >   サブプロジェクトのローカルにある資源を全て削除してから再生成します。
  >   
- [./script/generate.sh](<./scripts/generate.sh>)

  このプロジェクト内の資源を自動生成します。
  `src/` `model/` `template/` の各ディレクトリに格納された資源をもとに自動生成を行い、その結果を`dest/` `doc/` `script/` の各ディレクトリに反映します。

  *自動生成入力ファイル*

  - `src/`
    自動生成の対象とならない静的な資源を格納します。
    このディレクトリの内容は `dest/` 配下にそのままコピーされます。

  - `model/`
    自動生成で使用されるYAMLもしくはJSON形式で記述された静的なモデルデータを格納します。

  - `template/`
    自動生成で使用されるテンプレートファイルを格納します。ファイル拡張子に `.hbs` を含むファイルがテンプレートして扱われます。
    それ以外のファイルはそのままコピーされます。

    - `template/dest` `template/doc` `template/scripts`
      これらのディレクトリはそれぞれ、`dest/` `doc/` `scripts`の各ディレクトリに出力される資源のテンプレートを格納します。

    - `template/model` `template/template`
      自動生成で使用される`template/` `model/`の内容を更新するためのテンプレートを格納します。
      自動生成の結果、`template/` `model/` の内容が更新された場合は、自動生成処理を再帰的に実行します。
      なお、上記処理中に発生した`template/` `model/`への変更は、中間状態として扱われるため、処理完了後は失われます。
      これらの中間ファイルを確認するためには *--dry-run* オプションを使用してください。

  *自動生成結果ファイル*

  - `dest/`
    自動生成の結果作成されるアプリケーションやモジュールのソースファイル等を出力します。

  - `doc/`
    プロジェクトのドキュメントを出力します。

  - `scripts/`
    開発・運用で使用する各種スクリプトを出力します。

  > Usage: generate.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
  > -d, --dry-run
  >
  >   自動生成処理を実行後、生成されたファイルを`dest/` `doc/` `scripts/`の各フォルダに反映せずに、`.NEXT`ディレクトリに出力します。
  >   また、`.NEXT`ディレクトリの内容と現在のファイルの差異を出力します。
  >   このディレクトリには自動生成中に作成された中間ファイルも含まれます。
  >   
  > -r, --max-recursion [VALUE]
  >
  >   自動生成処理中に`model/` `template/`ディレクトリの内容が更新された場合に、
  >   再帰的に自動生成処理を実行する回数の上限。
  >    (Default: 10)
- [./script/publish-local.sh](<./scripts/publish-local.sh>)

  プロジェクト内の資源を自動生成した後、ディレクトリにある資源をモデルモジュールとしてビルドし、
  ローカルリポジトリに登録します。

  > Usage: publish-local.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
  > -r, --max-recursion [VALUE]
  >
  >   [generate.sh](<./scripts/generate.sh>)の同名のオプションと同じものです。
  >    (Default: 10)
  > , --skip-generation
  >
  >   自動生成処理を行わずに、ビルドおよびローカルリポジトリへの登録を行います。
  >   
- [./script/publish-local-laplacian-arch-architecture-document-template.sh](<./scripts/publish-local-laplacian-arch-architecture-document-template.sh>)

  [laplacian-arch/architecture-document-template](<https://github.com/nabla-squared/laplacian-arch.architecture-document-template.git>)サブプロジェクトの資源を自動生成します。

  > Usage: publish-local-laplacian-arch-architecture-document-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
- [./script/publish-local-laplacian-arch-datasource-flyway-migration-template.sh](<./scripts/publish-local-laplacian-arch-datasource-flyway-migration-template.sh>)

  [laplacian-arch/datasource.flyway-migration-template](<https://github.com/nabla-squared/laplacian-arch.datasource.flyway-migration-template.git>)サブプロジェクトの資源を自動生成します。

  > Usage: publish-local-laplacian-arch-datasource-flyway-migration-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
- [./script/publish-local-laplacian-arch-datasource-schema-model.sh](<./scripts/publish-local-laplacian-arch-datasource-schema-model.sh>)

  [laplacian-arch/datasource.schema-model](<https://github.com/nabla-squared/laplacian-arch.model.datasource.git>)サブプロジェクトの資源を自動生成します。

  > Usage: publish-local-laplacian-arch-datasource-schema-model.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
- [./script/publish-local-laplacian-arch-datasource-schema-plugin.sh](<./scripts/publish-local-laplacian-arch-datasource-schema-plugin.sh>)

  [laplacian-arch/datasource.schema-plugin](<null>)サブプロジェクトの資源を自動生成します。

  > Usage: publish-local-laplacian-arch-datasource-schema-plugin.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
- [./script/publish-local-laplacian-arch-service-api-schema-model.sh](<./scripts/publish-local-laplacian-arch-service-api-schema-model.sh>)

  [laplacian-arch/service-api.schema-model](<https://github.com/nabla-squared/laplacian-arch.service-api-schema-model.git>)サブプロジェクトの資源を自動生成します。

  > Usage: publish-local-laplacian-arch-service-api-schema-model.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
- [./script/publish-local-laplacian-arch-service-api-schema-plugin.sh](<./scripts/publish-local-laplacian-arch-service-api-schema-plugin.sh>)

  [laplacian-arch/service-api.schema-plugin](<null>)サブプロジェクトの資源を自動生成します。

  > Usage: publish-local-laplacian-arch-service-api-schema-plugin.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
- [./script/publish-local-laplacian-arch-service-api-springboot2-template.sh](<./scripts/publish-local-laplacian-arch-service-api-springboot2-template.sh>)

  [laplacian-arch/service-api.springboot2-template](<https://github.com/nabla-squared/laplacian-arch.service-api.springboot2-template.git>)サブプロジェクトの資源を自動生成します。

  > Usage: publish-local-laplacian-arch-service-api-springboot2-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
- [./script/publish-local-laplacian-common-model-plugin.sh](<./scripts/publish-local-laplacian-common-model-plugin.sh>)

  [laplacian/common-model-plugin](<null>)サブプロジェクトの資源を自動生成します。

  > Usage: publish-local-laplacian-common-model-plugin.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
- [./script/publish-local-laplacian-common-model.sh](<./scripts/publish-local-laplacian-common-model.sh>)

  [laplacian/common-model](<https://github.com/nabla-squared/laplacian.common-model.git>)サブプロジェクトの資源を自動生成します。

  > Usage: publish-local-laplacian-common-model.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
- [./script/publish-local-laplacian-domain-model-plugin-project-template.sh](<./scripts/publish-local-laplacian-domain-model-plugin-project-template.sh>)

  [laplacian/domain-model-plugin.project-template](<https://github.com/nabla-squared/laplacian.domain-model-plugin.project-template.git>)サブプロジェクトの資源を自動生成します。

  > Usage: publish-local-laplacian-domain-model-plugin-project-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
- [./script/publish-local-laplacian-domain-model-project-template.sh](<./scripts/publish-local-laplacian-domain-model-project-template.sh>)

  [laplacian/domain-model.project-template](<https://github.com/nabla-squared/laplacian.domain-model.project-template.git>)サブプロジェクトの資源を自動生成します。

  > Usage: publish-local-laplacian-domain-model-project-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
- [./script/publish-local-laplacian-generator-project-template.sh](<./scripts/publish-local-laplacian-generator-project-template.sh>)

  [laplacian/generator.project-template](<https://github.com/nabla-squared/laplacian.generator.project-template.git>)サブプロジェクトの資源を自動生成します。

  > Usage: publish-local-laplacian-generator-project-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
- [./script/publish-local-laplacian-metamodel-plugin.sh](<./scripts/publish-local-laplacian-metamodel-plugin.sh>)

  [laplacian/metamodel-plugin](<null>)サブプロジェクトの資源を自動生成します。

  > Usage: publish-local-laplacian-metamodel-plugin.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
- [./script/publish-local-laplacian-metamodel.sh](<./scripts/publish-local-laplacian-metamodel.sh>)

  [laplacian/metamodel](<https://github.com/nabla-squared/laplacian.metamodel.git>)サブプロジェクトの資源を自動生成します。

  > Usage: publish-local-laplacian-metamodel.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
- [./script/publish-local-laplacian-project-domain-model.sh](<./scripts/publish-local-laplacian-project-domain-model.sh>)

  [laplacian/project.domain-model](<https://github.com/nabla-squared/laplacian.project.domain-model.git>)サブプロジェクトの資源を自動生成します。

  > Usage: publish-local-laplacian-project-domain-model.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
- [./script/publish-local-laplacian-project-group-document-template.sh](<./scripts/publish-local-laplacian-project-group-document-template.sh>)

  [laplacian/project-group.document-template](<https://github.com/nabla-squared/laplacian.project-group.document-template.git>)サブプロジェクトの資源を自動生成します。

  > Usage: publish-local-laplacian-project-group-document-template.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
- [./script/publish-local-laplacian-project-project-types.sh](<./scripts/publish-local-laplacian-project-project-types.sh>)

  [laplacian/project.project-types](<https://github.com/nabla-squared/laplacian.project.project-types.git>)サブプロジェクトの資源を自動生成します。

  > Usage: publish-local-laplacian-project-project-types.sh [OPTION]...
  >
  > -h, --help
  >
  >   このコマンドの使用方法を表示します。
  >   
  > -v, --verbose
  >
  >   より詳細なコマンドの実行情報を表示します。
  >   
### ソースコード一覧


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