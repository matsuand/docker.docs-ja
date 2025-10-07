%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: DuplicateStageName
description: >-
  Stage names should be unique
@y
title: DuplicateStageName
description: >-
  ステージ名は一意でなければなりません。
@z

@x
## Output
@y
## 出力 {#output}
@z

@x
```text
Duplicate stage name 'foo-base', stage names should be unique
```
@y
```text
Duplicate stage name 'foo-base', stage names should be unique
```
(訳： ステージ名 'foo-base' が重複宣言、ステージ名は一意でなければなりません)
@z

@x
## Description
@y
## 内容説明 {#description}
@z

@x
Defining multiple stages with the same name results in an error because the
builder is unable to uniquely resolve the stage name reference.
@y
複数のステージ名に同一の名称を定義するとエラーになります。
ビルダーがステージ名を参照する際に、一意に特定できなくなるためです。
@z

@x
## Examples
@y
## 例 {#examples}
@z

@x
❌ Bad: `builder` is declared as a stage name twice.
@y
❌ 不可: ステージ名として `builder` が二度宣言されています。
@z

% snip code...

@x
✅ Good: stages have unique names.
@y
✅ 可: ステージ名が一意に定められています。
@z

% snip code...
