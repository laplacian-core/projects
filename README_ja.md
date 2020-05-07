<!-- @head-content@ -->
# laplacian/projects

The core modules for the Laplacian generator.


*Read this in other languages*: [[English](README.md)] [[简体中文](README_zh.md)]
<!-- @head-content@ -->

<!-- @toc@ -->
## Table of contents
- [インデックス](#インデックス)

  * [プロジェクト一覧](#プロジェクト一覧)

  * [スクリプト一覧](#スクリプト一覧)

  * [ソースコード一覧](#ソースコード一覧)

- [概要](#概要)

  * [プロジェクト依存関係](#プロジェクト依存関係)

- [使用方法](#使用方法)



<!-- @toc@ -->

<!-- @main-content@ -->
## インデックス


### プロジェクト一覧


{{#each project.subprojects as |subproject| ~}}
- [**{{lookup subproject.title lang.code}}**](<subproject.source_repository.url>)

{{#each (lookup entity.description lang.code) as |line| ~}}
> {{line}}
{{/each}}
### スクリプト一覧


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
- [src/project/subprojects/laplacian.project-group.document-template.yaml](<./src/project/subprojects/laplacian.project-group.document-template.yaml>)
- [src/project/subprojects/laplacian.project.project-types.yaml](<./src/project/subprojects/laplacian.project.project-types.yaml>)
- [src/project/subprojects/laplacian.project.schema-model.yaml](<./src/project/subprojects/laplacian.project.schema-model.yaml>)
- [src/project/subprojects/laplacian.project.schema-plugin.yaml](<./src/project/subprojects/laplacian.project.schema-plugin.yaml>)
- [src/project/subprojects/laplacian.schema.plugin-template.yaml](<./src/project/subprojects/laplacian.schema.plugin-template.yaml>)

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
$ ./script/generate --dry-run

```



<!-- @main-content@ -->