%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Interpolation
description: Learn about interpolation
keywords: compose, compose specification, interpolation, compose file reference
---
@y
---
title: Interpolation
description: Learn about interpolation
keywords: compose, compose specification, interpolation, compose file reference
---
@z

@x
Values in a Compose file can be set by variables and interpolated at runtime. Compose files use a Bash-like
syntax `${VARIABLE}`.
@y
Values in a Compose file can be set by variables and interpolated at runtime. Compose files use a Bash-like
syntax `${VARIABLE}`.
@z

@x
Both `$VARIABLE` and `${VARIABLE}` syntax is supported. Default values can be defined inline using typical shell syntax:
@y
Both `$VARIABLE` and `${VARIABLE}` syntax is supported. Default values can be defined inline using typical shell syntax:
@z

@x
- `${VARIABLE:-default}` evaluates to `default` if `VARIABLE` is unset or
  empty in the environment.
- `${VARIABLE-default}` evaluates to `default` only if `VARIABLE` is unset
  in the environment.
@y
- `${VARIABLE:-default}` evaluates to `default` if `VARIABLE` is unset or
  empty in the environment.
- `${VARIABLE-default}` evaluates to `default` only if `VARIABLE` is unset
  in the environment.
@z

@x
Similarly, the following syntax allows you to specify mandatory variables:
@y
Similarly, the following syntax allows you to specify mandatory variables:
@z

@x
- `${VARIABLE:?err}` exits with an error message containing `err` if
  `VARIABLE` is unset or empty in the environment.
- `${VARIABLE?err}` exits with an error message containing `err` only if
  `VARIABLE` is unset in the environment.
@y
- `${VARIABLE:?err}` exits with an error message containing `err` if
  `VARIABLE` is unset or empty in the environment.
- `${VARIABLE?err}` exits with an error message containing `err` only if
  `VARIABLE` is unset in the environment.
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
user-defined strings, such as [labels](05-services.md#labels) or [environment](05-services.md#environment), an alternate equal sign syntax
must be used for interpolation to apply. For example:
@y
Interpolation applies only to YAML values, not to keys. For the few places where keys are actually arbitrary
user-defined strings, such as [labels](05-services.md#labels) or [environment](05-services.md#environment), an alternate equal sign syntax
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
