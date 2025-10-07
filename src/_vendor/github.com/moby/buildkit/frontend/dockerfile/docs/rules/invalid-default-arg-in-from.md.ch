%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: InvalidDefaultArgInFrom
description: >-
  Default value for global ARG results in an empty or invalid base image name
@y
title: InvalidDefaultArgInFrom
description: >-
  グローバルな ARG のデフォルト値によっては、ベースイメージ名が空か不適切なものになります
@z

@x
## Output
@y
## 出力 {#output}
@z

@x
```text
Using the global ARGs with default values should produce a valid build.
```
@y
```text
Using the global ARGs with default values should produce a valid build.
```
(訳： グローバルな ARG にデフォルト値を設定していれば、適正なビルドが実現できます)
@z

@x
## Description
@y
## 内容説明 {#description}
@z

@x
An `ARG` used in an image reference should be valid when no build arguments are used. An image build should not require `--build-arg` to be used to produce a valid build.
@y
イメージ参照を行うような `ARG` においては、ビルド引数が与えられなくてもその参照が適正でなければなりません。
イメージビルドは `--build-arg` がなくても、適正なビルドができなければなりません。
@z

@x
## Examples
@y
## 例 {#examples}
@z

@x
❌ Bad: don't rely on an ARG being set for an image reference to be valid
@y
❌ 不可: イメージ参照を妥当なものとするため、ARG が設定されていることを前提にしてはいけません。
@z

% snip code...

@x
✅ Good: include a default for the ARG
@y
✅ 可: ARG のデフォルト値が設定されています。
@z

% snip code...

@x
✅ Good: ARG can be empty if the image would be valid with it empty
@y
✅ 可: ARG が空であってもイメージ名が妥当であれば ARG は空になってもかまいません。
@z

% snip code...

@x
✅ Good: Use a default value if the build arg is not present
@y
✅ 可: ビルド引数が存在しなかった場合のデフォルト値が設定されています。
@z

% snip code...
