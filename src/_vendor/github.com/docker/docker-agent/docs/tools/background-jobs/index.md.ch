%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Background Jobs Tool"
description: "Run and manage long-running shell commands."
keywords: docker agent, ai agents, tools, toolsets, background jobs, shell
linkTitle: "Background Jobs"
@y
title: "Background Jobs Tool"
description: "Run and manage long-running shell commands."
keywords: docker agent, ai agents, tools, toolsets, background jobs, shell
linkTitle: "Background Jobs"
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/tools/background-jobs/
@y
canonical: __SUBDIR__/ai/docker-agent/tools/background-jobs/
@z

@x
_Run and manage long-running shell commands._
@y
_Run and manage long-running shell commands._
@z

@x
## Overview
@y
## Overview
@z

@x
The `background_jobs` toolset starts shell commands that should keep running while the agent continues with other work, such as local servers, file watchers, long builds, or test suites. It returns a job ID immediately, captures combined stdout/stderr up to 10 MB per job, and terminates all running jobs when the agent session ends.
@y
The `background_jobs` toolset starts shell commands that should keep running while the agent continues with other work, such as local servers, file watchers, long builds, or test suites. It returns a job ID immediately, captures combined stdout/stderr up to 10 MB per job, and terminates all running jobs when the agent session ends.
@z

@x
Use the [`shell`](../shell/index.md) toolset for short synchronous commands. Add both toolsets when an agent needs both synchronous commands and long-running processes.
@y
Use the [`shell`](../shell/index.md) toolset for short synchronous commands. Add both toolsets when an agent needs both synchronous commands and long-running processes.
@z

@x
## Configuration
@y
## Configuration
@z

@x
```yaml
toolsets:
  - type: shell
  - type: background_jobs
```
@y
```yaml
toolsets:
  - type: shell
  - type: background_jobs
```
@z

@x
### Options
@y
### Options
@z

@x
| Property       | Type    | Description                                                                                                                                          |
| -------------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| `env`    | object  | Environment variables to set for all background job commands.                                                                                        |
| `recall` | boolean | Let `run_background_job` expose a `recall` parameter so jobs can steer the agent when they finish (see [Background job recall](#background-job-recall)). Default `false`. |
@y
| Property       | Type    | Description                                                                                                                                          |
| -------------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| `env`    | object  | Environment variables to set for all background job commands.                                                                                        |
| `recall` | boolean | Let `run_background_job` expose a `recall` parameter so jobs can steer the agent when they finish (see [Background job recall](#background-job-recall)). Default `false`. |
@z

@x
### Custom Environment Variables
@y
### Custom Environment Variables
@z

@x
```yaml
toolsets:
  - type: background_jobs
    env:
      MY_VAR: "value"
      PATH: "${env.PATH}:/custom/bin"
```
@y
```yaml
toolsets:
  - type: background_jobs
    env:
      MY_VAR: "value"
      PATH: "${env.PATH}:/custom/bin"
```
@z

@x
### Background job recall
@y
### Background job recall
@z

@x
Set `recall: true` to let the `run_background_job` tool expose a `recall` boolean parameter:
@y
Set `recall: true` to let the `run_background_job` tool expose a `recall` boolean parameter:
@z

@x
```yaml
toolsets:
  - type: background_jobs
    recall: true
```
@y
```yaml
toolsets:
  - type: background_jobs
    recall: true
```
@z

@x
When the agent starts a background job with `recall: true`, Docker Agent sends a steering message back into the running agent loop after the job finishes. The message contains a short completion sentence and the job output, so the agent can react without polling `view_background_job`.
@y
When the agent starts a background job with `recall: true`, Docker Agent sends a steering message back into the running agent loop after the job finishes. The message contains a short completion sentence and the job output, so the agent can react without polling `view_background_job`.
@z

@x
Use recall for finite background work where completion matters (for example, a long build or test suite). Avoid it for servers and watchers that are expected to run until stopped. See [`examples/shell_recall.yaml`](https://github.com/docker/docker-agent/blob/main/examples/shell_recall.yaml) for a complete configuration.
@y
Use recall for finite background work where completion matters (for example, a long build or test suite). Avoid it for servers and watchers that are expected to run until stopped. See [`examples/shell_recall.yaml`](https://github.com/docker/docker-agent/blob/main/examples/shell_recall.yaml) for a complete configuration.
@z

@x
## Available Tools
@y
## Available Tools
@z

@x
The background jobs toolset exposes five tools:
@y
The background jobs toolset exposes five tools:
@z

@x
| Tool Name              | Description                                                                                    |
| ---------------------- | ---------------------------------------------------------------------------------------------- |
| `run_background_job`   | Start a command asynchronously and return a job ID immediately. Use for servers/watchers/etc. |
| `list_background_jobs` | List all background jobs with their status, runtime, and metadata.                             |
| `view_background_job`  | View the buffered output and status of a specific background job by ID.                        |
| `stop_background_job`  | Stop a running background job. Child processes are terminated too.                             |
| `wait_background_job`  | Block until a job finishes and return its exit code and output. Safe on already-finished jobs. |
@y
| Tool Name              | Description                                                                                    |
| ---------------------- | ---------------------------------------------------------------------------------------------- |
| `run_background_job`   | Start a command asynchronously and return a job ID immediately. Use for servers/watchers/etc. |
| `list_background_jobs` | List all background jobs with their status, runtime, and metadata.                             |
| `view_background_job`  | View the buffered output and status of a specific background job by ID.                        |
| `stop_background_job`  | Stop a running background job. Child processes are terminated too.                             |
| `wait_background_job`  | Block until a job finishes and return its exit code and output. Safe on already-finished jobs. |
@z

@x
### `run_background_job` parameters
@y
### `run_background_job` parameters
@z

@x
| Parameter | Type    | Required | Description                                                                                                                                 |
| --------- | ------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `cmd`     | string  | ✓        | The shell command to execute in the background.                                                                                             |
| `cwd`     | string  | ✗        | Working directory to run the command in (default: `.`).                                                                                     |
| `recall`  | boolean | ✗        | Only available when the `background_jobs` toolset has `recall: true`. When true, send a steering message with the job output when it finishes. |
@y
| Parameter | Type    | Required | Description                                                                                                                                 |
| --------- | ------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `cmd`     | string  | ✓        | The shell command to execute in the background.                                                                                             |
| `cwd`     | string  | ✗        | Working directory to run the command in (default: `.`).                                                                                     |
| `recall`  | boolean | ✗        | Only available when the `background_jobs` toolset has `recall: true`. When true, send a steering message with the job output when it finishes. |
@z

@x
`view_background_job` and `stop_background_job` each take a single required `job_id` string returned by `run_background_job` or `list_background_jobs`.
@y
`view_background_job` and `stop_background_job` each take a single required `job_id` string returned by `run_background_job` or `list_background_jobs`.
@z

@x
### `wait_background_job` parameters
@y
### `wait_background_job` parameters
@z

@x
| Parameter | Type    | Required | Description                                                                                                    |
| --------- | ------- | -------- | -------------------------------------------------------------------------------------------------------------- |
| `job_id`  | string  | ✓        | Job ID returned by `run_background_job` or `list_background_jobs`.                                             |
| `timeout` | integer | ✗        | Maximum seconds to wait (default: `60`). If the job is still running when the limit fires, the tool returns the current output with a notice and the job continues in the background. |
@y
| Parameter | Type    | Required | Description                                                                                                    |
| --------- | ------- | -------- | -------------------------------------------------------------------------------------------------------------- |
| `job_id`  | string  | ✓        | Job ID returned by `run_background_job` or `list_background_jobs`.                                             |
| `timeout` | integer | ✗        | Maximum seconds to wait (default: `60`). If the job is still running when the limit fires, the tool returns the current output with a notice and the job continues in the background. |
@z

@x
> [!WARNING]
> **Safety**
>
> Background jobs run shell commands with the same access as the agent process. Stop servers and watchers when they are no longer needed, and use [Sandbox Mode](../../configuration/sandbox/index.md) for additional isolation.
@y
> [!WARNING]
> **Safety**
>
> Background jobs run shell commands with the same access as the agent process. Stop servers and watchers when they are no longer needed, and use [Sandbox Mode](../../configuration/sandbox/index.md) for additional isolation.
@z
