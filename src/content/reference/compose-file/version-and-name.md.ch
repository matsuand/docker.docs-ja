%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Version and name top-level elements
description: Understand when and if to set the version and name top-level element
keywords: compose, compose specification, services, compose file reference
@y
title: トップレベル項目 version と name
description: Understand when and if to set the version and name top-level element
keywords: compose, compose specification, services, compose file reference
@z

@x
## Version top-level element (obsolete)
@y
## トップレベル項目 version (廃止予定) {#version-top-level-element-obsolete}
@z

@x
> [!IMPORTANT]
>
> The top-level `version` property is defined by the Compose Specification for backward compatibility. It is only informative and you'll receive a warning message that it is obsolete if used. 
@y
> [!IMPORTANT]
>
> トップレベルの `version` プロパティは Compose 仕様において後方互換のために定義されています。
> これは単に情報を書き示すだけのものであり、これを利用した場合は警告メッセージが出力されます。
@z

@x
Compose always uses the most recent schema to validate the Compose file, regardless of the `version` field.
@y
Compose は `version` による指定内容には関係なく、もっとも最新のスキーマを使って Compose ファイルを検証します。
@z

@x
Compose validates whether it can fully parse the Compose file. If some fields are unknown, typically
because the Compose file was written with fields defined by a newer version of the Specification, you'll receive a warning message. 
@y
Compose は Compose ファイルが完全に解析可能であるかどうかを検証します。
指定項目に不明のものがあった場合、それはつまり、より最新の仕様バージョンにおいて定義された項目を Compose ファイル内に使用していた場合が考えられますが、その場合は警告メッセージが出力されます。
@z

@x
## Name top-level element
@y
## トップレベル項目 name {#name-top-level-element}
@z

@x
The top-level `name` property is defined by the Compose Specification as the project name to be used if you don't set one explicitly.
@y
トップレベルの `name` プロパティは Compose 仕様において、プロジェクト名を明示的に指定しなかった場合に用いられる名前です。
@z

@x
Compose offers a way for you to override this name, and sets a
default project name to be used if the top-level `name` element is not set.
@y
Compose においてプロジェクト名を上書き設定するために指定する方法であり、トップレベルのこの `name` 項目が設定されなかった場合は、デフォルトのプロジェクト名が採用されます。
@z

@x
Whenever a project name is defined by top-level `name` or by some custom mechanism, it is exposed for
[interpolation](interpolation.md) and environment variable resolution as `COMPOSE_PROJECT_NAME`
@y
プロジェクト名がトップレベルの `name` やカスタム機能により設定されると、環境変数 `COMPOSE_PROJECT_NAME` やその [補間](interpolation.md) を通じて利用されます。
@z

% snip code...

@x
For more information on other ways to name Compose projects, see [Specify a project name](/manuals/compose/how-tos/project-name.md).
@y
Compose プロジェクトへの名前づけに関する方法については [プロジェクト名の設定](manuals/compose/how-tos/project-name.md) を参照してください。
@z
