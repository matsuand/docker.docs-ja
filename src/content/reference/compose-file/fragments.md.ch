%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Fragments
description: Reuse configuration with YAML anchors and fragments
keywords: compose, compose specification, fragments, compose file reference
@y
title: フラグメント
description: Reuse configuration with YAML anchors and fragments
keywords: compose, compose specification, fragments, compose file reference
@z

@x
{{% include "compose/fragments.md" %}}
@y
{{% include "compose/fragments.md" %}}
@z

@x
Anchors are created using the `&` sign. The sign is followed by an alias name. You can use this alias with the `*` sign later to reference the value following the anchor. Make sure there is no space between the `&` and the `*` characters and the following alias name. 
@y
アンカー (anchor) とは `&` 記号を使うものです。
この記号に続けてエイリアス名を記述します。
このエイリアスをその後の記述場面において `*` 記号を使うことで、アンカーに続けて設定した値を参照できるようになります。
`&` や `*` という記号とエイリアス名の間に空白文字を含めないように留意してください。
@z

@x
You can use more than one anchor and alias in a single Compose file.
@y
一つの Compose ファイル内では、アンカーおよびエイリアスをいくつでも利用できます。
@z

@x
## Example 1
@y
## 例１ {#example-1}
@z

% snip code...

@x
In the example above, a `default-volume` anchor is created based on the `db-data` volume. It is later reused by the alias `*default-volume` to define the `metrics` volume. 
@y
上の例においてはボリューム `db-data` においてアンカー `default-volume` が生成されています。
そして後段においてエイリアス `*default-volume` が再利用されていて、ボリューム `metrics` を定義しています。
@z

@x
Anchor resolution takes place before [variables interpolation](interpolation.md), so variables can't be used to set anchors or aliases.
@y
アンカーの名前解決は [変数の補間](interpolation.md) 前に行われます。
したがってアンカーやエイリアスの指定の際に変数を用いることはできません。
@z

@x
## Example 2
@y
## 例２ {#example-2}
@z

% snip code...

@x
If you have an anchor that you want to use in more than one service, use it in conjunction with an [extension](extension.md) to make your Compose file easier to maintain.
@y
2 個以上のサービスに対して 1 つのアンカーを利用したい場合、[エクステンション](extension.md) と組み合わせて利用すれば Compose ファイルをより保守しやすい形として実現できます。
@z

@x
## Example 3
@y
## 例３ {#example-3}
@z

@x
You may want to partially override values. Compose follows the rule outlined by [YAML merge type](https://yaml.org/type/merge.html). 
@y
設定値を上書きして利用したい場合があります。
Compose では [YAML マージタイプ](https://yaml.org/type/merge.html) に説明されているルールに基づいて実現可能です。
@z

@x
In the following example, `metrics` volume specification uses alias
to avoid repetition but overrides `name` attribute:
@y
以下の例ではボリューム `metrics` の設定においてエイリアスが利用されています。
これによって繰り返しの記述を回避しつつ `name` 属性の上書き設定を行っています。
@z

% snip code...

@x
## Example 4
@y
## 例４ {#example-4}
@z

@x
You can also extend the anchor to add additional values.
@y
アンカーは値の追加設定を通じて拡張することもできます。
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
In example above, the environment variables must be declared using the `FOO: BAR` mapping syntax, while the sequence syntax `- FOO=BAR` is only valid when no fragments are involved. 
@y
上の例において環境変数は `FOO: BAR` というマッピング形式の文法を使って宣言しなければなりません。
つまりシーケンス形式の文法 `- FOO=BAR` を使った場合に、フラグメントを含めてしまうと不正な記述となります。
@z
