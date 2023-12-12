%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Overview
description: Explainer on the ways to set, use and manage environment variables in
  Compose
keywords: compose, orchestration, environment, env file
---
@y
---
title: Overview
description: Explainer on the ways to set, use and manage environment variables in
  Compose
keywords: compose, orchestration, environment, env file
---
@z

@x
{{< include "compose-eol.md" >}}
@y
{{< include "compose-eol.md" >}}
@z

@x
Use environment variables to pass configuration information to containers at runtime. 
@y
Use environment variables to pass configuration information to containers at runtime. 
@z

@x
Environment variables are key-value pairs that contain data that can be used by processes running inside a Docker container. They are often used to configure application settings and other parameters that may vary between different environments, such as development, testing, and production.  
@y
Environment variables are key-value pairs that contain data that can be used by processes running inside a Docker container. They are often used to configure application settings and other parameters that may vary between different environments, such as development, testing, and production.  
@z

@x
> **Tip**
>
> Before using environment variables, read through all of the information first to get a full picture of environment variables in Docker Compose.
{ .tip }
@y
> **Tip**
>
> Before using environment variables, read through all of the information first to get a full picture of environment variables in Docker Compose.
{ .tip }
@z

@x
This section covers:
- The various ways you can [set environment variables with Compose](set-environment-variables.md).
- [How environment variable precedence works](envvars-precedence.md).
- The correct syntax for an [environment file](env-file.md).
- Changing pre-defined [environment variables](envvars.md).
- Some [best practices](best-practices.md).
@y
This section covers:
- The various ways you can [set environment variables with Compose](set-environment-variables.md).
- [How environment variable precedence works](envvars-precedence.md).
- The correct syntax for an [environment file](env-file.md).
- Changing pre-defined [environment variables](envvars.md).
- Some [best practices](best-practices.md).
@z
