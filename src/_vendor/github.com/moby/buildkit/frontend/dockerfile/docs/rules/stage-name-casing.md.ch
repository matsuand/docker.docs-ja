%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: StageNameCasing
description: >-
  Stage names should be lowercase
@y
title: StageNameCasing
description: >-
  Stage names should be lowercase
@z

@x
## Output
@y
## 出力 {#output}
@z

@x
```text
Stage name 'BuilderBase' should be lowercase
```
@y
```text
Stage name 'BuilderBase' should be lowercase
```
(訳： ステージ名 `BuilderBase` は英小文字を用いるべきです)
@z

@x
## Description
@y
## 内容説明 {#description}
@z

@x
To help distinguish Dockerfile instruction keywords from identifiers, this rule
forces names of stages in a multi-stage Dockerfile to be all lowercase.
@y
Dockerfile の命令語と識別子を区別するため、このルールではマルチステージを実現する Dockerfile において、ステージ名はすべて英小文字でなければならないとしています。
@z

@x
## Examples
@y
## 例 {#examples}
@z

@x
❌ Bad: mixing uppercase and lowercase characters in the stage name.
@y
❌ 不可: ステージ名に英字の大文字小文字を混在させています。
@z

% snip code...

@x
✅ Good: stage name is all in lowercase.
@y
✅ 可: ステージ名をすべて英小文字にしています。
@z

% snip code...
