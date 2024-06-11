%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: ConsistentInstructionCasing
description: Instructions should be in consistent casing (all lower or all upper)
aliases:
  - /go/dockerfile/rule/consistent-instruction-casing/
---
@y
---
title: ConsistentInstructionCasing
description: Instructions should be in consistent casing (all lower or all upper)
aliases:
  - /go/dockerfile/rule/consistent-instruction-casing/
---
@z

@x
## Output
@y
## Output
@z

@x
```text
Command 'EntryPoint' should be consistently cased
```
@y
```text
Command 'EntryPoint' should be consistently cased
```
@z

@x
## Description
@y
## Description
@z

@x
Instruction keywords should use consistent casing (all lowercase or all
uppercase). Using a case that mixes uppercase and lowercase, such as
`PascalCase` or `snakeCase`, letters result in poor readability.
@y
Instruction keywords should use consistent casing (all lowercase or all
uppercase). Using a case that mixes uppercase and lowercase, such as
`PascalCase` or `snakeCase`, letters result in poor readability.
@z

@x
## Examples
@y
## Examples
@z

@x
❌ Bad: don't mix uppercase and lowercase.
@y
❌ Bad: don't mix uppercase and lowercase.
@z

@x
```dockerfile
From alpine
Run echo hello > /greeting.txt
EntRYpOiNT ["cat", "/greeting.txt"]
```
@y
```dockerfile
From alpine
Run echo hello > /greeting.txt
EntRYpOiNT ["cat", "/greeting.txt"]
```
@z

@x
✅ Good: all uppercase.
@y
✅ Good: all uppercase.
@z

@x
```dockerfile
FROM alpine
RUN echo hello > /greeting.txt
ENTRYPOINT ["cat", "/greeting.txt"]
```
@y
```dockerfile
FROM alpine
RUN echo hello > /greeting.txt
ENTRYPOINT ["cat", "/greeting.txt"]
```
@z

@x
✅ Good: all lowercase.
@y
✅ Good: all lowercase.
@z

@x
```dockerfile
from alpine
run echo hello > /greeting.txt
entrypoint ["cat", "/greeting.txt"]
```
@y
```dockerfile
from alpine
run echo hello > /greeting.txt
entrypoint ["cat", "/greeting.txt"]
```
@z
