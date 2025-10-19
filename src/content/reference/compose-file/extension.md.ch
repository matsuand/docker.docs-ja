%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Extensions
description: Define and reuse custom fragments with extensions in Docker Compose
keywords: compose, compose specification, extensions, compose file reference
@y
title: エクステンション
description: Define and reuse custom fragments with extensions in Docker Compose
keywords: compose, compose specification, extensions, compose file reference
@z

@x
{{% include "compose/extension.md" %}}
@y
{{% include "compose/extension.md" %}}
@z

@x
Extensions can also be used with [anchors and aliases](fragments.md).
@y
エクステンションは [アンカーおよびエイリアス](fragments.md) と合わせて利用可能です。
@z

@x
They also can be used within any structure in a Compose file where user-defined keys are not expected. 
Compose uses those to enable experimental features, the same way browsers add support for [custom CSS features](https://www.w3.org/TR/2011/REC-CSS2-20110607/syndata.html#vendor-keywords)
@y
They also can be used within any structure in a Compose file where user-defined keys are not expected. 
Compose uses those to enable experimental features, the same way browsers add support for [custom CSS features](https://www.w3.org/TR/2011/REC-CSS2-20110607/syndata.html#vendor-keywords)
@z

@x
## Example 1
@y
## 例１ {#example-1}
@z

% snip code...

@x
## Example 2
@y
## 例２ {#example-2}
@z

% snip code...

@x
In this example, the environment variables do not belong to either of the services. They’ve been lifted out completely into the `x-env` extension field.
This defines a new node which contains the environment field. The `&env` YAML anchor is used so both services can reference the extension field’s value as `*env`.
@y
この例において環境変数はどのサービスにも記述されていません。
`x-env` というエクステンション項目として含まれているだけです。
ここから環境変数のフィールドを含んだ新たなノードが生成されます。
YAML のアンカー形式 `&env` は 2 つのサービス内において、エクステンションの値を参照する `*env` という記述を行っています。
@z

@x
## Example 3
@y
## 例３ {#example-3}
@z

@x within code
 # Node.js gives OS info about the node (Host)
@y
 # Node.js がノード (ホスト) に関する OS 情報を提供
@z
@x
 # Uses `cat` to echo back response, fastest function to execute.
@y
 # エコーバックのために `cat` を利用、実行がより速い関数を採用
@z

@x
The `nodeinfo` and `echoit` services both include the `x-function` extension via the `&function` anchor, then set their specific image and environment. 
@y
サービス `nodeinfo` と `echoit` はともに `x-function` というエクステンションを利用しており、`&function` というアンカーとして参照しています。
その上で特定イメージと環境変数を設定しています。
@z

@x
## Example 4 
@y
## 例４ {#example-4}
@z

@x
Using [YAML merge](https://yaml.org/type/merge.html) it is also possible to use multiple extensions and share
and override additional attributes for specific needs:
@y
[YAML マージ](https://yaml.org/type/merge.html) の記法を用いると、複数のエクステンションを共有することが可能となります。
また必要に応じて追加の属性を上書き指定することもできます。
@z

% snip code...

@x
> [!NOTE]
>
> [YAML merge](https://yaml.org/type/merge.html) only applies to mappings, and can't be used with sequences. 
@y
> [!NOTE]
>
> [YAML マージ](https://yaml.org/type/merge.html) はマッピングに対してのみ適用できるものであり、シーケンスには適用できません。
@z

@x
> In the example above, the environment variables are declared using the `FOO: BAR` mapping syntax, while the sequence syntax `- FOO=BAR` is only valid when no fragments are involved.
@y
> 上の例において環境変数は `FOO: BAR` というマッピング形式の文法を使って宣言しています。
> シーケンス形式の文法 `- FOO=BAR` を使った場合には、フラグメントを含めてしまうと不正な記述となります。
@z

@x
## Informative historical notes
@y
## Informative historical notes
@z

@x
This section is informative. At the time of writing, the following prefixes are known to exist:
@y
This section is informative. At the time of writing, the following prefixes are known to exist:
@z

@x
| Prefix     | Vendor/Organization |
| ---------- | ------------------- |
| docker     | Docker              |
| kubernetes | Kubernetes          |
@y
| Prefix     | Vendor/Organization |
| ---------- | ------------------- |
| docker     | Docker              |
| kubernetes | Kubernetes          |
@z

@x
## Specifying byte values
@y
## Specifying byte values
@z

@x
Values express a byte value as a string in `{amount}{byte unit}` format:
The supported units are `b` (bytes), `k` or `kb` (kilo bytes), `m` or `mb` (mega bytes) and `g` or `gb` (giga bytes).
@y
Values express a byte value as a string in `{amount}{byte unit}` format:
The supported units are `b` (bytes), `k` or `kb` (kilo bytes), `m` or `mb` (mega bytes) and `g` or `gb` (giga bytes).
@z

% snip code...

@x
## Specifying durations
@y
## Specifying durations
@z

@x
Values express a duration as a string in the form of `{value}{unit}`.
The supported units are `us` (microseconds), `ms` (milliseconds), `s` (seconds), `m` (minutes) and `h` (hours).
Values can combine multiple values without separator.
@y
Values express a duration as a string in the form of `{value}{unit}`.
The supported units are `us` (microseconds), `ms` (milliseconds), `s` (seconds), `m` (minutes) and `h` (hours).
Values can combine multiple values without separator.
@z

% snip code...
