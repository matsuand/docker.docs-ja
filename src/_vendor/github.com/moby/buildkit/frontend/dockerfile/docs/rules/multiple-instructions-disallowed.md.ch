%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: MultipleInstructionsDisallowed
description: >-
  Multiple instructions of the same type should not be used in the same stage
@y
title: MultipleInstructionsDisallowed
description: >-
  一つのステージ内では同一タイプの命令を複数用いることはできません。
@z

@x
## Output
@y
## 出力 {#output}
@z

@x
```text
Multiple CMD instructions should not be used in the same stage because only the last one will be used
```
@y
```text
Multiple CMD instructions should not be used in the same stage because only the last one will be used
```
(訳： ステージ内に CMD 命令を使用しても最後の一つしか評価されません)
@z

@x
## Description
@y
## 内容説明 {#description}
@z

@x
If you have multiple `CMD`, `HEALTHCHECK`, or `ENTRYPOINT` instructions in your
Dockerfile, only the last occurrence is used. An image can only ever have one
`CMD`, `HEALTHCHECK`, and `ENTRYPOINT`.
@y
Dockerfile 内に `CMD`、`HEALTHCHECK`、`ENTRYPOINT` という命令を複数記述したとしても、最後のものしか評価されません。
一つのイメージに記述する `CMD`、`HEALTHCHECK`、`ENTRYPOINT`は一つだけです。
@z

@x
## Examples
@y
## 例 {#examples}
@z

@x
❌ Bad: Duplicate instructions.
@y
❌ 不可: 命令が重複しています。
@z

@x within code
# Only "Hello, Sweden!" will be printed
@y
# "Hello, Sweden!" だけが出力されます。
@z

@x
✅ Good: only one `ENTRYPOINT` instruction.
@y
✅ 可: `ENTRYPOINT` 命令は一つだけです。
@z

% snip code...

@x
You can have both a regular, top-level `CMD`
and a separate `CMD` for a `HEALTHCHECK` instruction.
@y
通常のトップレベルの `CMD` とは別に、`HEALTHCHECK` 命令内に別レベル `CMD` を記述することは可能です。
@z

@x
✅ Good: only one top-level `CMD` instruction.
@y
✅ 可: トップレベルの `CMD` 命令は一つだけです。
@z

% snip code...
