%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Best practices for working with environment variables in Docker Compose
linkTitle: Best practices
description: Explainer on the best ways to set, use, and manage environment variables in
  Compose
keywords: compose, orchestration, environment, env file, environment variables
tags: [Best practices]
weight: 50
aliases:
- /compose/environment-variables/best-practices/
---
@y
---
title: Best practices for working with environment variables in Docker Compose
linkTitle: Best practices
description: Explainer on the best ways to set, use, and manage environment variables in
  Compose
keywords: compose, orchestration, environment, env file, environment variables
tags: [Best practices]
weight: 50
aliases:
- /compose/environment-variables/best-practices/
---
@z

@x
#### Handle sensitive information securely
@y
#### Handle sensitive information securely
@z

@x
Be cautious about including sensitive data in environment variables. Consider using [Secrets](../use-secrets.md) for managing sensitive information.
@y
Be cautious about including sensitive data in environment variables. Consider using [Secrets](../use-secrets.md) for managing sensitive information.
@z

@x
#### Understand environment variable precedence
@y
#### Understand environment variable precedence
@z

@x
Be aware of how Docker Compose handles the [precedence of environment variables](envvars-precedence.md) from different sources (`.env` files, shell variables, Dockerfiles).
@y
Be aware of how Docker Compose handles the [precedence of environment variables](envvars-precedence.md) from different sources (`.env` files, shell variables, Dockerfiles).
@z

@x
#### Use specific environment files
@y
#### Use specific environment files
@z

@x
Consider how your application adapts to different environments. For example development, testing, production, and use different `.env` files as needed.
@y
Consider how your application adapts to different environments. For example development, testing, production, and use different `.env` files as needed.
@z

@x
#### Know interpolation
@y
#### Know interpolation
@z

@x
Understand how [interpolation](variable-interpolation.md) works within compose files for dynamic configurations.
@y
Understand how [interpolation](variable-interpolation.md) works within compose files for dynamic configurations.
@z

@x
#### Command line overrides
@y
#### Command line overrides
@z

@x
Be aware that you can [override environment variables](set-environment-variables.md#cli) from the command line when starting containers. This is useful for testing or when you have temporary changes.
@y
Be aware that you can [override environment variables](set-environment-variables.md#cli) from the command line when starting containers. This is useful for testing or when you have temporary changes.
@z
