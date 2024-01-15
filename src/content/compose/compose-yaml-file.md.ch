%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Understand the Compose file
description: Understand the Compose application model with an illustrative example 
keywords: compose, docker compose, compose specification, compose model 
aliases:
- /compose/compose-file/03-compose-file/
---
@y
---
title: Compose ファイルの理解
description: Understand the Compose application model with an illustrative example 
keywords: compose, docker compose, compose specification, compose model 
aliases:
- /compose/compose-file/03-compose-file/
---
@z

@x
The Compose file is a [YAML](http://yaml.org/) file defining:
- [Version](compose-file/04-version-and-name.md) (Optional)
- [Services](compose-file/05-services.md) (Required)
- [Networks](compose-file/06-networks.md)
- [Volumes](compose-file/07-volumes.md)
- [Configs](compose-file/08-configs.md) 
- [Secrets](compose-file/09-secrets.md)
@y
Compose ファイルは [YAML](http://yaml.org/) ファイルです。
そこでは以下が定義されます。
- [Version](compose-file/04-version-and-name.md) (任意)
- [Services](compose-file/05-services.md) (必須)
- [Networks](compose-file/06-networks.md)
- [Volumes](compose-file/07-volumes.md)
- [Configs](compose-file/08-configs.md) 
- [Secrets](compose-file/09-secrets.md)
@z

@x
The default path for a Compose file is `compose.yaml` (preferred) or `compose.yml` that is placed in the working directory.
Compose also supports `docker-compose.yaml` and `docker-compose.yml` for backwards compatibility of earlier versions.
If both files exist, Compose prefers the canonical `compose.yaml`.
@y
Compose ファイルのデフォルトパス名は `compose.yaml` (推奨) または `compose.yml` であり、ワーキングディレクトリに配置します。
旧バージョンとの後方互換のため `docker-compose.yaml` や `docker-compose.yml` もサポートされます。
それらが複数混在した場合、Compose は標準的なファイル `compose.yaml` を参照します。
@z

@x
You can use [fragments](compose-file/10-fragments.md) and [extensions](compose-file/11-extension.md) to keep your Compose file efficient and easy to maintain.
@y
[フラグメント](compose-file/10-fragments.md) (fragment) や [拡張機能](compose-file/11-extension.md) (extension) を利用すると、Compose ファイルを効率よく、保守しやすく維持することができます。
@z

@x
Multiple Compose files can be [merged](13-merge.md) together to define the application model. The combination of YAML files are implemented by appending or overriding YAML elements based on the Compose file order you set. 
Simple attributes and maps get overridden by the highest order Compose file, lists get merged by appending. Relative
paths are resolved based on the first Compose file's parent folder, whenever complimentary files being
merged are hosted in other folders. As some Compose file elements can both be expressed as single strings or complex objects, merges apply to
the expanded form.
@y
複数の Compose ファイルは [マージ](13-merge.md) してアプリケーションモデルを構成することができます。
YAML ファイルを組み合わせると、YAML の定義要素は追加されたり上書きされたりしますが、それは Compose ファイルの合成順によって定まります。
単純な属性やマッピングであれば、最終的な Compose ファイルによって上書きされます。
リストであれば追加されます。
相対パスの指定の場合、一番はじめの Compose ファイルにおける親フォルダーに基づいて決定されます。
たとえその他の Compose ファイルが別フォルダーを意味していたとしても無視されます。
Compose ファイルの定義要素の中には、1 つの文字列かあるいは複雑なオブジェクト形式の双方を許容するものがありますが、その場合は拡張フォームとしてマージされます。
@z

@x
If you want to reuse other Compose files, or factor out parts of you application model into separate Compose files, you can also use [`include`](compose-file/14-include.md). This is useful if your Compose application is dependent on another application which is managed by a different team, or needs to be shared with others.
@y
Compose ファイルを再利用したい、あるいはアプリケーションモデルを一部切り出して別の Compose ファイルにしたいといった場合には [`include`](compose-file/14-include.md) を利用することができます。
これは以下のような場合に有用です。
Compose アプリケーションが他のアプリケーションに依存していて、それが別チームの管理するものであったり、他との共有を必要とするものであるような場合です。
@z
