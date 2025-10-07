%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: MaintainerDeprecated
description: >-
  The MAINTAINER instruction is deprecated, use a label instead to define an image author
@y
title: MaintainerDeprecated
description: >-
  MAINTAINER 命令は廃止予定であり, イメージ作者の定義には label の使用が推奨されます。
@z

@x
## Output
@y
## 出力 {#output}
@z

@x
```text
MAINTAINER instruction is deprecated in favor of using label
```
@y
```text
MAINTAINER instruction is deprecated in favor of using label
```
(訳： MAINTAINER 命令は廃止予定であり label の使用が推奨されます)
@z

@x
## Description
@y
## 内容説明 {#description}
@z

@x
The `MAINTAINER` instruction, used historically for specifying the author of
the Dockerfile, is deprecated. To set author metadata for an image, use the
`org.opencontainers.image.authors` [OCI label](https://github.com/opencontainers/image-spec/blob/main/annotations.md#pre-defined-annotation-keys).
@y
`MAINTAINER` 命令はこれまで Dockerfile の作者の指定に用いられてきましたが、現在は廃止予定となっています。
イメージ作者のメタデータを設定する場合は `org.opencontainers.image.authors` [OCI ラベル](https://github.com/opencontainers/image-spec/blob/main/annotations.md#pre-defined-annotation-keys) を用いてください。
@z

@x
## Examples
@y
## 例 {#examples}
@z

@x
❌ Bad: don't use the `MAINTAINER` instruction
@y
❌ 不可: `MAINTAINER` 命令は使わないでください。
@z

% snip code...

@x
✅ Good: specify the author using the `org.opencontainers.image.authors` label
@y
✅ 可: ラベル `org.opencontainers.image.authors` を使って作者を指定しています。
@z

% snip code...
