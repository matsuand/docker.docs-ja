%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Use Claude Code with Docker Model Runner
description: Configure Claude Code to use Docker Model Runner so you can code with local models.
summary: |
  Connect Claude Code to Docker Model Runner with the Anthropic-compatible API,
  package `gpt-oss` with a larger context window, and inspect requests.
keywords: ai, claude code, docker model runner, anthropic, local models, coding assistant
tags: [ai]
@y
title: Use Claude Code with Docker Model Runner
description: Configure Claude Code to use Docker Model Runner so you can code with local models.
summary: |
  Connect Claude Code to Docker Model Runner with the Anthropic-compatible API,
  package `gpt-oss` with a larger context window, and inspect requests.
keywords: ai, claude code, docker model runner, anthropic, local models, coding assistant
tags: [ai]
@z

@x
  time: 10 minutes
@y
  time: 10 分
@z

@x
This guide shows how to run Claude Code with Docker Model Runner as the backend
model provider. You'll point Claude Code at the local Anthropic-compatible API,
run a coding model, and package `gpt-oss` with a larger context window for
longer repository prompts.
@y
This guide shows how to run Claude Code with Docker Model Runner as the backend
model provider. You'll point Claude Code at the local Anthropic-compatible API,
run a coding model, and package `gpt-oss` with a larger context window for
longer repository prompts.
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
In this guide, you'll learn how to:
@y
In this guide, you'll learn how to:
@z

@x
- Pull a coding model and start Claude Code with Docker Model Runner
- Make the endpoint configuration persistent
- Verify the local API endpoint and inspect requests
- Package `gpt-oss` with a larger context window for longer prompts
@y
- Pull a coding model and start Claude Code with Docker Model Runner
- Make the endpoint configuration persistent
- Verify the local API endpoint and inspect requests
- Package `gpt-oss` with a larger context window for longer prompts
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
- [Claude Code installed](https://code.claude.com/docs/en/quickstart)
@y
- [Docker Desktop](../get-started/get-docker.md) or Docker Engine installed
- [Docker Model Runner enabled](../manuals/ai/model-runner/get-started.md#enable-docker-model-runner)
- [Claude Code installed](https://code.claude.com/docs/en/quickstart)
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
Pull a model before you start Claude Code:
@y
Pull a model before you start Claude Code:
@z

@x
```console
$ docker model pull ai/devstral-small-2
```
@y
```console
$ docker model pull ai/devstral-small-2
```
@z

@x
You can also use `ai/qwen3-coder` if you want another coding-focused model with
a large context window.
@y
You can also use `ai/qwen3-coder` if you want another coding-focused model with
a large context window.
@z

@x
## Step 2: Start Claude Code with Docker Model Runner
@y
## Step 2: Start Claude Code with Docker Model Runner
@z

@x
Set `ANTHROPIC_BASE_URL` to your local Docker Model Runner endpoint when you run
Claude Code.
@y
Set `ANTHROPIC_BASE_URL` to your local Docker Model Runner endpoint when you run
Claude Code.
@z

@x
On macOS or Linux:
@y
On macOS or Linux:
@z

@x
```console
$ ANTHROPIC_BASE_URL=http://localhost:12434 claude --model ai/devstral-small-2
```
@y
```console
$ ANTHROPIC_BASE_URL=http://localhost:12434 claude --model ai/devstral-small-2
```
@z

@x
On Windows PowerShell:
@y
On Windows PowerShell:
@z

@x
```powershell
$env:ANTHROPIC_BASE_URL="http://localhost:12434"
claude --model ai/devstral-small-2
```
@y
```powershell
$env:ANTHROPIC_BASE_URL="http://localhost:12434"
claude --model ai/devstral-small-2
```
@z

@x
Claude Code now sends requests to Docker Model Runner instead of Anthropic's
hosted API.
@y
Claude Code now sends requests to Docker Model Runner instead of Anthropic's
hosted API.
@z

@x
## Step 3: Troubleshoot your first launch
@y
## Step 3: Troubleshoot your first launch
@z

@x
If Claude Code can't connect, check Docker Model Runner status:
@y
If Claude Code can't connect, check Docker Model Runner status:
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
If Claude Code can't find the model, list local models:
@y
If Claude Code can't find the model, list local models:
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
If the model is missing, pull it first. If needed, use the fully qualified
model name, such as `ai/devstral-small-2`.
@y
If the model is missing, pull it first. If needed, use the fully qualified
model name, such as `ai/devstral-small-2`.
@z

@x
## Step 4: Make the endpoint persistent
@y
## Step 4: Make the endpoint persistent
@z

@x
To avoid setting the environment variable each time, add it to your shell
profile:
@y
To avoid setting the environment variable each time, add it to your shell
profile:
@z

@x
```bash {title="~/.bashrc or ~/.zshrc"}
export ANTHROPIC_BASE_URL=http://localhost:12434
```
@y
```bash {title="~/.bashrc or ~/.zshrc"}
export ANTHROPIC_BASE_URL=http://localhost:12434
```
@z

@x
On Windows PowerShell, add it to your PowerShell profile:
@y
On Windows PowerShell, add it to your PowerShell profile:
@z

@x
```powershell {title="$PROFILE"}
$env:ANTHROPIC_BASE_URL = "http://localhost:12434"
```
@y
```powershell {title="$PROFILE"}
$env:ANTHROPIC_BASE_URL = "http://localhost:12434"
```
@z

@x
After you reload your shell, you can run Claude Code with only the model flag:
@y
After you reload your shell, you can run Claude Code with only the model flag:
@z

@x
```console
$ claude --model ai/devstral-small-2
```
@y
```console
$ claude --model ai/devstral-small-2
```
@z

@x
## Step 5: Verify the API endpoint
@y
## Step 5: Verify the API endpoint
@z

@x
Send a test request to confirm the Anthropic-compatible API is reachable:
@y
Send a test request to confirm the Anthropic-compatible API is reachable:
@z

@x
```console
$ curl http://localhost:12434/v1/messages \
  -H "Content-Type: application/json" \
  -d '{
    "model": "ai/devstral-small-2",
    "max_tokens": 32,
    "messages": [{"role": "user", "content": "Say hello"}]
  }'
```
@y
```console
$ curl http://localhost:12434/v1/messages \
  -H "Content-Type: application/json" \
  -d '{
    "model": "ai/devstral-small-2",
    "max_tokens": 32,
    "messages": [{"role": "user", "content": "Say hello"}]
  }'
```
@z

@x
For more details about the request format, see the
[Anthropic-compatible API reference](../manuals/ai/model-runner/api-reference.md#anthropic-compatible-api).
@y
For more details about the request format, see the
[Anthropic-compatible API reference](../manuals/ai/model-runner/api-reference.md#anthropic-compatible-api).
@z

@x
## Step 6: Inspect Claude Code requests
@y
## Step 6: Inspect Claude Code requests
@z

@x
To inspect the requests Claude Code sends to Docker Model Runner, run:
@y
To inspect the requests Claude Code sends to Docker Model Runner, run:
@z

@x
```console
$ docker model requests --model ai/devstral-small-2 | jq .
```
@y
```console
$ docker model requests --model ai/devstral-small-2 | jq .
```
@z

@x
This helps you debug prompts, context usage, and compatibility issues.
@y
This helps you debug prompts, context usage, and compatibility issues.
@z

@x
## Step 7: Package `gpt-oss` with a larger context window
@y
## Step 7: Package `gpt-oss` with a larger context window
@z

@x
`ai/gpt-oss` defaults to a smaller context window than coding-focused models. If
you want to use it for repository-scale prompts, package a larger variant:
@y
`ai/gpt-oss` defaults to a smaller context window than coding-focused models. If
you want to use it for repository-scale prompts, package a larger variant:
@z

@x
```console
$ docker model pull ai/gpt-oss
$ docker model package --from ai/gpt-oss --context-size 32000 gpt-oss:32k
```
@y
```console
$ docker model pull ai/gpt-oss
$ docker model package --from ai/gpt-oss --context-size 32000 gpt-oss:32k
```
@z

@x
Then run Claude Code with the packaged model:
@y
Then run Claude Code with the packaged model:
@z

@x
```console
$ ANTHROPIC_BASE_URL=http://localhost:12434 claude --model gpt-oss:32k
```
@y
```console
$ ANTHROPIC_BASE_URL=http://localhost:12434 claude --model gpt-oss:32k
```
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
