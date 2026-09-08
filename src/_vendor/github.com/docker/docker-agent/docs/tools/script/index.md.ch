%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Script Tool"
description: "Define custom shell scripts as named tools with typed parameters."
keywords: docker agent, ai agents, tools, toolsets, script tool
linkTitle: "Script"
@y
title: "Script Tool"
description: "Define custom shell scripts as named tools with typed parameters."
keywords: docker agent, ai agents, tools, toolsets, script tool
linkTitle: "Script"
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/tools/script/
@y
canonical: __SUBDIR__/ai/docker-agent/tools/script/
@z

@x
_Define custom shell scripts as named tools with typed parameters._
@y
_Define custom shell scripts as named tools with typed parameters._
@z

@x
## Overview
@y
## Overview
@z

@x
The script tool lets you define custom shell scripts as named tools. Unlike the generic [shell tool](../shell/index.md) where the agent writes the command, script tools execute predefined commands — ideal for exposing safe, well-scoped operations with descriptive names.
@y
The script tool lets you define custom shell scripts as named tools. Unlike the generic [shell tool](../shell/index.md) where the agent writes the command, script tools execute predefined commands — ideal for exposing safe, well-scoped operations with descriptive names.
@z

@x
## Configuration
@y
## Configuration
@z

@x
### Simple Scripts
@y
### Simple Scripts
@z

@x
```yaml
toolsets:
  - type: script
    shell:
      run_tests:
        cmd: task test
        description: Run the project test suite
      lint:
        cmd: task lint
        description: Run the linter
```
@y
```yaml
toolsets:
  - type: script
    shell:
      run_tests:
        cmd: task test
        description: Run the project test suite
      lint:
        cmd: task lint
        description: Run the linter
```
@z

@x
### Scripts with Parameters
@y
### Scripts with Parameters
@z

@x
Use `${param}` interpolation and JSON Schema to define typed arguments:
@y
Use `${param}` interpolation and JSON Schema to define typed arguments:
@z

@x
```yaml
toolsets:
  - type: script
    shell:
      deploy:
        cmd: ./scripts/deploy.sh ${env}
        description: Deploy to an environment
        args:
          env:
            type: string
            enum: [staging, production]
        required: [env]
```
@y
```yaml
toolsets:
  - type: script
    shell:
      deploy:
        cmd: ./scripts/deploy.sh ${env}
        description: Deploy to an environment
        args:
          env:
            type: string
            enum: [staging, production]
        required: [env]
```
@z

@x
## Properties
@y
## Properties
@z

@x
| Property                          | Type   | Description                                                |
| --------------------------------- | ------ | ---------------------------------------------------------- |
| `shell.<name>.cmd`                | string | Shell command to execute (supports `${arg}` interpolation) |
| `shell.<name>.description`        | string | Description shown to the model                             |
| `shell.<name>.args`               | object | Parameter definitions (JSON Schema properties)             |
| `shell.<name>.required`           | array  | Required parameter names                                   |
| `shell.<name>.env`                | object | Environment variables for this script                      |
| `shell.<name>.working_dir`        | string | Working directory for script execution                     |
@y
| Property                          | Type   | Description                                                |
| --------------------------------- | ------ | ---------------------------------------------------------- |
| `shell.<name>.cmd`                | string | Shell command to execute (supports `${arg}` interpolation) |
| `shell.<name>.description`        | string | Description shown to the model                             |
| `shell.<name>.args`               | object | Parameter definitions (JSON Schema properties)             |
| `shell.<name>.required`           | array  | Required parameter names                                   |
| `shell.<name>.env`                | object | Environment variables for this script                      |
| `shell.<name>.working_dir`        | string | Working directory for script execution                     |
@z

@x
> [!TIP]
> **Script vs. Shell**
>
> Use the [shell tool](../shell/index.md) when the agent needs to run arbitrary commands. Use the script tool when you want to expose specific, predefined operations with clear names and typed parameters — giving the agent less freedom but more safety.
@y
> [!TIP]
> **Script vs. Shell**
>
> Use the [shell tool](../shell/index.md) when the agent needs to run arbitrary commands. Use the script tool when you want to expose specific, predefined operations with clear names and typed parameters — giving the agent less freedom but more safety.
@z
