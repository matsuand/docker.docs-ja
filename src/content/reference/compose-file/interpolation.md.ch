%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Interpolation
description: Substitute environment variables in Docker Compose files using interpolation syntax.
keywords: compose, compose specification, interpolation, compose file reference
@y
title: 補間
description: Substitute environment variables in Docker Compose files using interpolation syntax.
keywords: compose, compose specification, interpolation, compose file reference
@z

@x
{{% include "compose/interpolation.md" %}}
@y
{{% include "compose/interpolation.md" %}}
@z

@x
For braced expressions, the following formats are supported:
@y
ブレース (波カッコ) 表現は以下の書式がサポートされています。
@z

@x
- Direct substitution
  - `${VAR}` -> value of `VAR`
@y
- 単純な置き換え
  - `${VAR}` -> `VAR` の値
@z

@x
- Default value
  - `${VAR:-default}` -> value of `VAR` if set and non-empty, otherwise `default`
  - `${VAR-default}` -> value of `VAR` if set, otherwise `default`
@y
- デフォルト値の指定
  - `${VAR:-default}` -> `VAR` が設定済または空でないならその値、それ以外は `default`
  - `${VAR-default}` -> `VAR` が設定済ならその値、それ以外は `default`
@z

@x
- Required value
  - `${VAR:?error}` -> value of `VAR` if set and non-empty, otherwise exit with error
  - `${VAR?error}` -> value of `VAR` if set, otherwise exit with error
@y
- 値指定の必須
  - `${VAR:?error}` -> `VAR` が設定済または空でないならその値、それ以外はエラー終了
  - `${VAR?error}` -> `VAR` が設定済ならその値、それ以外はエラー終了
@z

@x
- Alternative value
  - `${VAR:+replacement}` -> `replacement` if `VAR` is set and non-empty, otherwise empty
  - `${VAR+replacement}` -> `replacement` if `VAR` is set, otherwise empty
@y
- 別の指定値
  - `${VAR:+replacement}` -> `VAR` が設定済または空でないなら `replacement`、そうでないなら空
  - `${VAR+replacement}` -> `VAR` が設定済なら `replacement`、そうでないなら空
@z

@x
Interpolation can also be nested:
@y
補間表現はネスト化することもできます。
@z

@x
- `${VARIABLE:-${FOO}}`
- `${VARIABLE?$FOO}`
- `${VARIABLE:-${FOO:-default}}`
@y
- `${VARIABLE:-${FOO}}`
- `${VARIABLE?$FOO}`
- `${VARIABLE:-${FOO:-default}}`
@z

@x
Other extended shell-style features, such as `${VARIABLE/foo/bar}`, are not
supported by Compose.
@y
これ以外にシェル形式の機能にある `${VARIABLE/foo/bar}` といったものは Compose ではサポートされていません。
@z

@x
You can use a `$$` (double-dollar sign) when your configuration needs a literal
dollar sign. This also prevents Compose from interpolating a value, so a `$$`
allows you to refer to environment variables that you don't want processed by
Compose.
@y
You can use a `$$` (double-dollar sign) when your configuration needs a literal
dollar sign. This also prevents Compose from interpolating a value, so a `$$`
allows you to refer to environment variables that you don't want processed by
Compose.
@z

% snip code...

@x
If Compose can't resolve a substituted variable and no default value is defined, it displays a warning and substitutes the variable with an empty string.
@y
If Compose can't resolve a substituted variable and no default value is defined, it displays a warning and substitutes the variable with an empty string.
@z

@x
As any values in a Compose file can be interpolated with variable substitution, including compact string notation
for complex elements, interpolation is applied before a merge on a per-file basis.
@y
As any values in a Compose file can be interpolated with variable substitution, including compact string notation
for complex elements, interpolation is applied before a merge on a per-file basis.
@z

@x
Interpolation applies only to YAML values, not to keys. For the few places where keys are actually arbitrary
user-defined strings, such as [labels](services.md#labels) or [environment](services.md#environment), an alternate equal sign syntax
must be used for interpolation to apply. For example:
@y
Interpolation applies only to YAML values, not to keys. For the few places where keys are actually arbitrary
user-defined strings, such as [labels](services.md#labels) or [environment](services.md#environment), an alternate equal sign syntax
must be used for interpolation to apply. For example:
@z

% snip code...
