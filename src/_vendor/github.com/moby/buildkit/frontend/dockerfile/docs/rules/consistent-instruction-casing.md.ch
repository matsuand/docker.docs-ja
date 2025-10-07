%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: ConsistentInstructionCasing
description: >-
  All commands within the Dockerfile should use the same casing (either upper or lower)
@y
title: ConsistentInstructionCasing
description: >-
  Dockerfile 内のコマンドはすべて英大文字か小文字に統一する必要があります。
@z

@x
## Output
@y
## 出力 {#output}
@z

@x
```text
Command 'EntryPoint' should be consistently cased
```
@y
```text
Command 'EntryPoint' should be consistently cased
```
(訳： コマンド 'EntryPoint' は英大文字小文字が統一されていません)
@z

@x
## Description
@y
## 内容説明 {#description}
@z

@x
Instruction keywords should use consistent casing (all lowercase or all
uppercase). Using a case that mixes uppercase and lowercase, such as
`PascalCase` or `snakeCase`, letters result in poor readability.
@y
命令キーワードは英小文字大文字を統一して記述する必要があります (すべて小文字、あるいはすべて大文字とします)。
大文字小文字を混在させた `PascalCase` や `snakeCase` などは読みにくくなるからです。
@z

@x
## Examples
@y
## 例 {#examples}
@z

@x
❌ Bad: don't mix uppercase and lowercase.
@y
❌ 不可: 大文字小文字を混在させてはいけません。
@z

% snip code...

@x
✅ Good: all uppercase.
@y
✅ 可: すべて大文字です。
@z

% snip code...

@x
✅ Good: all lowercase.
@y
✅ 可: すべて小文字です。
@z

% snip code...
