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
## Output
@z

@x
```text
'as' and 'FROM' keywords' casing do not match
```
@y
```text
'as' and 'FROM' keywords' casing do not match
```
@z

@x
## Description
@y
## Description
@z

@x
While Dockerfile keywords can be either uppercase or lowercase, mixing case
styles is not recommended for readability. This rule reports violations where
mixed case style occurs for a `FROM` instruction with an `AS` keyword declaring
a stage name.
@y
While Dockerfile keywords can be either uppercase or lowercase, mixing case
styles is not recommended for readability. This rule reports violations where
mixed case style occurs for a `FROM` instruction with an `AS` keyword declaring
a stage name.
@z

@x
## Examples
@y
## Examples
@z

@x
❌ Bad: `FROM` is uppercase, `AS` is lowercase.
@y
❌ Bad: `FROM` is uppercase, `AS` is lowercase.
@z

@x
```dockerfile
FROM debian:latest as builder
```
@y
```dockerfile
FROM debian:latest as builder
```
@z

@x
✅ Good: `FROM` and `AS` are both uppercase
@y
✅ Good: `FROM` and `AS` are both uppercase
@z

@x
```dockerfile
FROM debian:latest AS deb-builder
```
@y
```dockerfile
FROM debian:latest AS deb-builder
```
@z

@x
✅ Good: `FROM` and `AS` are both lowercase.
@y
✅ Good: `FROM` and `AS` are both lowercase.
@z

@x
```dockerfile
from debian:latest as deb-builder
```
@y
```dockerfile
from debian:latest as deb-builder
```
@z

@x
## Related errors
@y
## Related errors
@z

@x
- [`FileConsistentCommandCasing`](./consistent-instruction-casing.md)
@y
- [`FileConsistentCommandCasing`](./consistent-instruction-casing.md)
@z
