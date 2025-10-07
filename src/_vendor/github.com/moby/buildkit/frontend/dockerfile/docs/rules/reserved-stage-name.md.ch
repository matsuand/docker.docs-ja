%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: ReservedStageName
description: >-
  Reserved words should not be used as stage names
@y
title: ReservedStageName
description: >-
  予約語はステージ名として用いることはできません。
@z

@x
## Output
@y
## 出力 {#output}
@z

@x
```text
'scratch' is reserved and should not be used as a stage name
```
@y
```text
'scratch' is reserved and should not be used as a stage name
```
(訳： 'scratch' は予約語であるためステージ名として用いることはできません)
@z

@x
## Description
@y
## 内容説明 {#description}
@z

@x
Reserved words should not be used as names for stages in multi-stage builds.
The reserved words are:
@y
マルチステージビルドにおけるステージ名に予約語を用いることはできません。
予約語とは以下のものです。
@z

@x
- `context`
- `scratch`
@y
- `context`
- `scratch`
@z

@x
## Examples
@y
## 例 {#examples}
@z

@x
❌ Bad: `scratch` and `context` are reserved names.
@y
❌ 不可: `scratch` と `context` は予約語です。
@z

% snip code...

@x
✅ Good: the stage name `builder` is not reserved.
@y
✅ Good: ステージ名 `builder` は予約語ではありません。
@z

% snip code...
