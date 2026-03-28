%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Use OpenCode with Docker Model Runner
description: Configure OpenCode to use Docker Model Runner so you can code with local models.
summary: |
  Connect OpenCode to Docker Model Runner with an OpenAI-compatible endpoint,
  choose coding models, and package `gpt-oss` with a larger context window.
keywords: ai, opencode, docker model runner, local models, coding assistant
tags: [ai]
@y
@z

@x
  time: 10 minutes
@y
  time: 10 分
@z

@x
This guide shows how to connect OpenCode to Docker Model Runner so OpenCode can
use local models for coding tasks. You'll configure an `opencode.json` file,
verify the API endpoint, and run OpenCode against models served from your local
Docker environment.
@y
This guide shows how to connect OpenCode to Docker Model Runner so OpenCode can
use local models for coding tasks. You'll configure an `opencode.json` file,
verify the API endpoint, and run OpenCode against models served from your local
Docker environment.
@z

@x
> **Acknowledgment**
>
> Docker would like to thank [Pradumna Saraf](https://twitter.com/pradumna_saraf) for his contribution to this guide.
@y
> **Acknowledgment**
>
> Docker would like to thank [Pradumna Saraf](https://twitter.com/pradumna_saraf) for his contribution to this guide.
@z

@x
Unlike the [OpenCode sandbox guide](../manuals/ai/sandboxes/agents/opencode.md),
this guide focuses on using OpenCode as a local coding tool backed by Docker
Model Runner rather than running OpenCode in a containerized sandbox.
@y
Unlike the [OpenCode sandbox guide](../manuals/ai/sandboxes/agents/opencode.md),
this guide focuses on using OpenCode as a local coding tool backed by Docker
Model Runner rather than running OpenCode in a containerized sandbox.
@z

@x
In this guide, you'll learn how to:
@y
In this guide, you'll learn how to:
@z

@x
- Pull coding models for OpenCode
- Configure OpenCode to use Docker Model Runner
- Verify the local API endpoint and start OpenCode
- Package `gpt-oss` with a larger context window when you need it
@y
- Pull coding models for OpenCode
- Configure OpenCode to use Docker Model Runner
- Verify the local API endpoint and start OpenCode
- Package `gpt-oss` with a larger context window when you need it
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Before you start, make sure you have:
@y
Before you start, make sure you have:
@z

@x
- [Docker Desktop](../get-started/get-docker.md) or Docker Engine installed
- [Docker Model Runner enabled](../manuals/ai/model-runner/get-started.md#enable-docker-model-runner)
- [OpenCode installed](https://opencode.ai/docs)
@y
- [Docker Desktop](../get-started/get-docker.md) or Docker Engine installed
- [Docker Model Runner enabled](../manuals/ai/model-runner/get-started.md#enable-docker-model-runner)
- [OpenCode installed](https://opencode.ai/docs)
@z

@x
If you use Docker Desktop, turn on TCP access in **Settings** > **AI**, or run:
@y
If you use Docker Desktop, turn on TCP access in **Settings** > **AI**, or run:
@z

@x
```console
$ docker desktop enable model-runner --tcp 12434
```
@y
```console
$ docker desktop enable model-runner --tcp 12434
```
@z

@x
## Step 1: Pull a coding model
@y
## Step 1: Pull a coding model
@z

@x
Pull one or more models before you configure OpenCode:
@y
Pull one or more models before you configure OpenCode:
@z

@x
```console
$ docker model pull ai/qwen3-coder
$ docker model pull ai/devstral-small-2
```
@y
```console
$ docker model pull ai/qwen3-coder
$ docker model pull ai/devstral-small-2
```
@z

@x
These models are a good fit for coding workflows because they support large
context windows.
@y
These models are a good fit for coding workflows because they support large
context windows.
@z

@x
## Step 2: Create an OpenCode configuration
@y
## Step 2: Create an OpenCode configuration
@z

@x
OpenCode reads configuration from either of these locations:
@y
OpenCode reads configuration from either of these locations:
@z

@x
- `~/.config/opencode/opencode.json` for a global setup
- `opencode.json` in your project root for a project-specific setup
@y
- `~/.config/opencode/opencode.json` for a global setup
- `opencode.json` in your project root for a project-specific setup
@z

@x
Project-level configuration overrides the global file.
@y
Project-level configuration overrides the global file.
@z

@x
Add a provider that points to Docker Model Runner:
@y
Add a provider that points to Docker Model Runner:
@z

@x
```json {title="opencode.json"}
{
  "$schema": "https://opencode.ai/config.json",
  "provider": {
    "dmr": {
      "npm": "@ai-sdk/openai-compatible",
      "name": "Docker Model Runner",
      "options": {
        "baseURL": "http://localhost:12434/v1"
      },
      "models": {
        "qwen3-coder": {
          "name": "ai/qwen3-coder"
        },
        "devstral-small-2": {
          "name": "ai/devstral-small-2"
        }
      }
    }
  }
}
```
@y
```json {title="opencode.json"}
{
  "$schema": "https://opencode.ai/config.json",
  "provider": {
    "dmr": {
      "npm": "@ai-sdk/openai-compatible",
      "name": "Docker Model Runner",
      "options": {
        "baseURL": "http://localhost:12434/v1"
      },
      "models": {
        "qwen3-coder": {
          "name": "ai/qwen3-coder"
        },
        "devstral-small-2": {
          "name": "ai/devstral-small-2"
        }
      }
    }
  }
}
```
@z

@x
This configuration adds Docker Model Runner as an OpenCode provider and exposes
two local models.
@y
This configuration adds Docker Model Runner as an OpenCode provider and exposes
two local models.
@z

@x
> [!NOTE]
>
> If your setup expects the older OpenAI-compatible path, use
> `http://localhost:12434/engines/v1` instead.
@y
> [!NOTE]
>
> If your setup expects the older OpenAI-compatible path, use
> `http://localhost:12434/engines/v1` instead.
@z

@x
## Step 3: Verify the endpoint
@y
## Step 3: Verify the endpoint
@z

@x
Check that Docker Model Runner is reachable before you open OpenCode:
@y
Check that Docker Model Runner is reachable before you open OpenCode:
@z

@x
```console
$ curl http://localhost:12434/v1/models
```
@y
```console
$ curl http://localhost:12434/v1/models
```
@z

@x
If you use the older path, run:
@y
If you use the older path, run:
@z

@x
```console
$ curl http://localhost:12434/engines/v1/models
```
@y
```console
$ curl http://localhost:12434/engines/v1/models
```
@z

@x
The response should list the models available through Docker Model Runner.
@y
The response should list the models available through Docker Model Runner.
@z

@x
## Step 4: Start OpenCode
@y
## Step 4: Start OpenCode
@z

@x
From your project directory, run:
@y
From your project directory, run:
@z

@x
```console
$ opencode
```
@y
```console
$ opencode
```
@z

@x
To switch models from the TUI, run:
@y
To switch models from the TUI, run:
@z

@x
```text
/models
```
@y
```text
/models
```
@z

@x
Then select the model from the `dmr` provider.
@y
Then select the model from the `dmr` provider.
@z

@x
## Step 5: Package `gpt-oss` with a larger context window
@y
## Step 5: Package `gpt-oss` with a larger context window
@z

@x
This step is optional. Use it if you need a larger context window for
repository-scale tasks.
@y
This step is optional. Use it if you need a larger context window for
repository-scale tasks.
@z

@x
`gpt-oss` defaults to a smaller context window than coding-focused models. If
you want to use it for repository-scale tasks, package a larger variant:
@y
`gpt-oss` defaults to a smaller context window than coding-focused models. If
you want to use it for repository-scale tasks, package a larger variant:
@z

@x
```console
$ docker model pull ai/gpt-oss
$ docker model package --from ai/gpt-oss --context-size 128000 gpt-oss:128k
```
@y
```console
$ docker model pull ai/gpt-oss
$ docker model package --from ai/gpt-oss --context-size 128000 gpt-oss:128k
```
@z

@x
Then add it to your OpenCode configuration:
@y
Then add it to your OpenCode configuration:
@z

@x
```json {title="opencode.json"}
{
  "$schema": "https://opencode.ai/config.json",
  "provider": {
    "dmr": {
      "npm": "@ai-sdk/openai-compatible",
      "name": "Docker Model Runner",
      "options": {
        "baseURL": "http://localhost:12434/v1"
      },
      "models": {
        "gpt-oss:128k": {
          "name": "gpt-oss:128k"
        }
      }
    }
  }
}
```
@y
```json {title="opencode.json"}
{
  "$schema": "https://opencode.ai/config.json",
  "provider": {
    "dmr": {
      "npm": "@ai-sdk/openai-compatible",
      "name": "Docker Model Runner",
      "options": {
        "baseURL": "http://localhost:12434/v1"
      },
      "models": {
        "gpt-oss:128k": {
          "name": "gpt-oss:128k"
        }
      }
    }
  }
}
```
@z

@x
## Troubleshooting
@y
## Troubleshooting
@z

@x
If OpenCode can't connect, check Docker Model Runner status:
@y
If OpenCode can't connect, check Docker Model Runner status:
@z

@x
```console
$ docker model status
```
@y
```console
$ docker model status
```
@z

@x
If OpenCode does not show your model, list local models:
@y
If OpenCode does not show your model, list local models:
@z

@x
```console
$ docker model ls
```
@y
```console
$ docker model ls
```
@z

@x
If the model is missing, pull it first and confirm the model name in
`opencode.json` matches the local model you want to use.
@y
If the model is missing, pull it first and confirm the model name in
`opencode.json` matches the local model you want to use.
@z

@x
## Learn more
@y
## Learn more
@z

@x
- [Docker Model Runner overview](../manuals/ai/model-runner/_index.md)
- [Docker Model Runner API reference](../manuals/ai/model-runner/api-reference.md)
- [IDE and tool integrations](../manuals/ai/model-runner/ide-integrations.md)
@y
- [Docker Model Runner overview](../manuals/ai/model-runner/_index.md)
- [Docker Model Runner API reference](../manuals/ai/model-runner/api-reference.md)
- [IDE and tool integrations](../manuals/ai/model-runner/ide-integrations.md)
@z
