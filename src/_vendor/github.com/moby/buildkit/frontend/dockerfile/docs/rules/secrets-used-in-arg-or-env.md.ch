%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: SecretsUsedInArgOrEnv
description: Sensitive data should not be used in the ARG or ENV commands
aliases:
  - /go/dockerfile/rule/secrets-used-in-arg-or-env/
---
@y
---
title: SecretsUsedInArgOrEnv
description: Sensitive data should not be used in the ARG or ENV commands
aliases:
  - /go/dockerfile/rule/secrets-used-in-arg-or-env/
---
@z

@x
## Output
@y
## Output
@z

@x
```text
Potentially sensitive data should not be used in the ARG or ENV commands
```
@y
```text
Potentially sensitive data should not be used in the ARG or ENV commands
```
@z

@x
## Description
@y
## Description
@z

@x
While it is common to pass secrets to running processes
through environment variables during local development,
setting secrets in a Dockerfile using `ENV` or `ARG`
is insecure because they persist in the final image.
This rule reports violations where `ENV` and `ARG` keys
indicate that they contain sensitive data.
@y
While it is common to pass secrets to running processes
through environment variables during local development,
setting secrets in a Dockerfile using `ENV` or `ARG`
is insecure because they persist in the final image.
This rule reports violations where `ENV` and `ARG` keys
indicate that they contain sensitive data.
@z

@x
Instead of `ARG` or `ENV`, you should use secret mounts,
which expose secrets to your builds in a secure manner,
and do not persist in the final image or its metadata.
See [Build secrets](https://docs.docker.com/build/building/secrets/).
@y
Instead of `ARG` or `ENV`, you should use secret mounts,
which expose secrets to your builds in a secure manner,
and do not persist in the final image or its metadata.
See [Build secrets](https://docs.docker.com/build/building/secrets/).
@z

@x
## Examples
@y
## Examples
@z

@x
❌ Bad: `AWS_SECRET_ACCESS_KEY` is a secret value.
@y
❌ Bad: `AWS_SECRET_ACCESS_KEY` is a secret value.
@z

@x
```dockerfile
FROM scratch
ARG AWS_SECRET_ACCESS_KEY
```
@y
```dockerfile
FROM scratch
ARG AWS_SECRET_ACCESS_KEY
```
@z
