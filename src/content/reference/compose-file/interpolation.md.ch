%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Interpolation
description: Learn about interpolation
keywords: compose, compose specification, interpolation, compose file reference
aliases: 
 - /compose/compose-file/12-interpolation/
---
@y
---
title: Interpolation
description: Learn about interpolation
keywords: compose, compose specification, interpolation, compose file reference
aliases: 
 - /compose/compose-file/12-interpolation/
---
@z

@x
{{< include "compose/interpolation.md" >}}
@y
{{< include "compose/interpolation.md" >}}
@z

@x
For braced expressions, the following formats are supported:
- Direct substitution
  - `${VAR}` -> value of `VAR`
- Default value
  - `${VAR:-default}` -> value of `VAR` if set and non-empty, otherwise `default`
  - `${VAR-default}` -> value of `VAR` if set, otherwise `default`
- Required value
  - `${VAR:?error}` -> value of `VAR` if set and non-empty, otherwise exit with error
  - `${VAR?error}` -> value of `VAR` if set, otherwise exit with error
- Alternative value
  - `${VAR:+replacement}` -> `replacement` if `VAR` is set and non-empty, otherwise empty
  - `${VAR+replacement}` -> `replacement` if `VAR` is set, otherwise empty
@y
For braced expressions, the following formats are supported:
- Direct substitution
  - `${VAR}` -> value of `VAR`
- Default value
  - `${VAR:-default}` -> value of `VAR` if set and non-empty, otherwise `default`
  - `${VAR-default}` -> value of `VAR` if set, otherwise `default`
- Required value
  - `${VAR:?error}` -> value of `VAR` if set and non-empty, otherwise exit with error
  - `${VAR?error}` -> value of `VAR` if set, otherwise exit with error
- Alternative value
  - `${VAR:+replacement}` -> `replacement` if `VAR` is set and non-empty, otherwise empty
  - `${VAR+replacement}` -> `replacement` if `VAR` is set, otherwise empty
@z

@x
Interpolation can also be nested:
@y
Interpolation can also be nested:
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
Other extended shell-style features, such as `${VARIABLE/foo/bar}`, are not
supported by Compose.
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

@x
```yml
web:
  build: .
  command: "$$VAR_NOT_INTERPOLATED_BY_COMPOSE"
```
@y
```yml
web:
  build: .
  command: "$$VAR_NOT_INTERPOLATED_BY_COMPOSE"
```
@z

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

@x
```yml
services:
  foo:
    labels:
      "$VAR_NOT_INTERPOLATED_BY_COMPOSE": "BAR"
```
@y
```yml
services:
  foo:
    labels:
      "$VAR_NOT_INTERPOLATED_BY_COMPOSE": "BAR"
```
@z

@x
```yml
services:
  foo:
    labels:
      - "$VAR_INTERPOLATED_BY_COMPOSE=BAR"
```
@y
```yml
services:
  foo:
    labels:
      - "$VAR_INTERPOLATED_BY_COMPOSE=BAR"
```
@z
