%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: RedundantTargetPlatform
description: >-
  Setting platform to predefined $TARGETPLATFORM in FROM is redundant as this is the default behavior
@y
title: RedundantTargetPlatform
description: >-
  FROM において定義済み $TARGETPLATFORM をプラットフォーム指定することは、デフォルト動作であって冗長です。
@z

@x
## Output
@y
## 出力 {#output}
@z

@x
```text
Setting platform to predefined $TARGETPLATFORM in FROM is redundant as this is the default behavior
```
@y
```text
Setting platform to predefined $TARGETPLATFORM in FROM is redundant as this is the default behavior
```
(訳： FROM において定義済み $TARGETPLATFORM をプラットフォーム指定することは、デフォルト動作であって冗長です)
@z

@x
## Description
@y
## 内容説明 {#description}
@z

@x
A custom platform can be used for a base image. The default platform is the
same platform as the target output so setting the platform to `$TARGETPLATFORM`
is redundant and unnecessary.
@y
ベースイメージの指定においてはプラットフォームをカスタマイズすることができます。
デフォルトのプラットフォームは出力ターゲットと同じプラットフォームです。
したがってプラットフォームとして `$TARGETPLATFORM` を指定することは冗長であり必要ありません。
@z

@x
## Examples
@y
## 例 {#examples}
@z

@x
❌ Bad: this usage of `--platform` is redundant since `$TARGETPLATFORM` is the default.
@y
❌ 不可: 以下の `--platform` の使い方は `$TARGETPLATFORM` がデフォルトであるため冗長です。
@z

% snip code...

@x
✅ Good: omit the `--platform` argument.
@y
✅ 可: `--platform` 引数を省略しました。
@z

% snip code...
