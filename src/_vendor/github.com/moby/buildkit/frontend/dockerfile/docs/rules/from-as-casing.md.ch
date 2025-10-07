%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: FromAsCasing
description: >-
  The 'as' keyword should match the case of the 'from' keyword
@y
title: FromAsCasing
description: >-
  The 'as' keyword should match the case of the 'from' keyword
@z

@x
## Output
@y
## 出力 {#output}
@z

@x
```text
'as' and 'FROM' keywords' casing do not match
```
@y
```text
'as' and 'FROM' keywords' casing do not match
```
(訳： 'as' と 'FROM' の大文字小文字が統一されていません)
@z

@x
## Description
@y
## 内容説明 {#description}
@z

@x
While Dockerfile keywords can be either uppercase or lowercase, mixing case
styles is not recommended for readability. This rule reports violations where
mixed case style occurs for a `FROM` instruction with an `AS` keyword declaring
a stage name.
@y
Dockerfile におけるキーワードは、英字の大文字小文字のどちらを用いてもかまいませんが、両者を混同することは、読みにくくなるため推奨されません。
このルールでは、`FROM` 命令においてステージ名の宣言に用いられる `AS` キーワードに対して、英大文字小文字の混在が発生している場合に、違反であることを報告します。
@z

@x
## Examples
@y
## 例 {#examples}
@z

@x
❌ Bad: `FROM` is uppercase, `AS` is lowercase.
@y
❌ 不可: `FROM` が英大文字であり `AS` が小文字です。
@z

% snip code...

@x
✅ Good: `FROM` and `AS` are both uppercase
@y
✅ 可: `FROM` と `AS` がともに英大文字です。
@z

% snip code...

@x
✅ Good: `FROM` and `AS` are both lowercase.
@y
✅ 可: `FROM` と `AS` がともに英小文字です。
@z

% snip code...

@x
## Related errors
@y
## 関連するエラー {#related-errors}
@z

@x
- [`FileConsistentCommandCasing`](./consistent-instruction-casing.md)
@y
- [`FileConsistentCommandCasing`](./consistent-instruction-casing.md)
@z
