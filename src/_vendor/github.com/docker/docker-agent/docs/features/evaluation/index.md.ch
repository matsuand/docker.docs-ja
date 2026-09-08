%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Evaluation"
description: "Measure agent quality with automated evaluations — tool call accuracy, response relevance, output size, and more."
keywords: docker agent, ai agents, features, evaluation
@y
title: "Evaluation"
description: "Measure agent quality with automated evaluations — tool call accuracy, response relevance, output size, and more."
keywords: docker agent, ai agents, features, evaluation
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/features/evaluation/
@y
canonical: __SUBDIR__/ai/docker-agent/features/evaluation/
@z

@x
_Measure agent quality with automated evaluations — tool call accuracy, response relevance, output size, and more._
@y
_Measure agent quality with automated evaluations — tool call accuracy, response relevance, output size, and more._
@z

@x
## Overview
@y
## Overview
@z

@x
The `docker agent eval` command runs your agent against a set of recorded sessions and scores the results. Each eval session captures a user question, the expected tool calls, and criteria the response must satisfy. Docker Agent replays the question, compares the agent's behavior to expectations, and produces a report.
@y
The `docker agent eval` command runs your agent against a set of recorded sessions and scores the results. Each eval session captures a user question, the expected tool calls, and criteria the response must satisfy. Docker Agent replays the question, compares the agent's behavior to expectations, and produces a report.
@z

@x
> [!NOTE]
> **Container runtime required**
>
> Evaluations run inside containers for isolation. Each eval gets a clean environment with optional setup scripts. A running Docker-compatible container CLI/runtime is required: Docker Desktop or Docker Engine by default, or another Docker-compatible runtime such as Podman selected with `--container-runtime`.
@y
> [!NOTE]
> **Container runtime required**
>
> Evaluations run inside containers for isolation. Each eval gets a clean environment with optional setup scripts. A running Docker-compatible container CLI/runtime is required: Docker Desktop or Docker Engine by default, or another Docker-compatible runtime such as Podman selected with `--container-runtime`.
@z

@x
## Quick Start
@y
## Quick Start
@z

@x
```bash
# Run evaluations for an agent
$ docker agent eval agent.yaml
@y
```bash
# Run evaluations for an agent
$ docker agent eval agent.yaml
@z

@x
# Specify a custom evals directory
$ docker agent eval agent.yaml ./my-evals
@y
# Specify a custom evals directory
$ docker agent eval agent.yaml ./my-evals
@z

@x
# Run with 8 concurrent evaluations
$ docker agent eval agent.yaml -c 8
@y
# Run with 8 concurrent evaluations
$ docker agent eval agent.yaml -c 8
@z

@x
# Only run evals matching a pattern
$ docker agent eval agent.yaml --only "auth*"
@y
# Only run evals matching a pattern
$ docker agent eval agent.yaml --only "auth*"
@z

@x
# Repeat each eval 5 times to compute a baseline
$ docker agent eval agent.yaml --repeat 5
@y
# Repeat each eval 5 times to compute a baseline
$ docker agent eval agent.yaml --repeat 5
@z

@x
# Repeat a specific eval 5 times
$ docker agent eval agent.yaml --only "auth*" --repeat 5
@y
# Repeat a specific eval 5 times
$ docker agent eval agent.yaml --only "auth*" --repeat 5
@z

@x
# Use a Docker-compatible runtime such as Podman
$ docker agent eval agent.yaml --container-runtime podman
```
@y
# Use a Docker-compatible runtime such as Podman
$ docker agent eval agent.yaml --container-runtime podman
```
@z

@x
## Eval Directory Structure
@y
## Eval Directory Structure
@z

@x
By default, Docker Agent looks for eval sessions in an `evals/` directory next to your agent config:
@y
By default, Docker Agent looks for eval sessions in an `evals/` directory next to your agent config:
@z

@x
```bash
my-agent/
├── agent.yaml
└── evals/
    ├── 41b179a2-....json          # Eval session 1
    ├── 5d83e247-....json          # Eval session 2
    └── results/                   # Output (auto-created)
        ├── adjective-noun-1234.json
        ├── adjective-noun-1234.log
        ├── adjective-noun-1234.db
        └── adjective-noun-1234-sessions.json
```
@y
```bash
my-agent/
├── agent.yaml
└── evals/
    ├── 41b179a2-....json          # Eval session 1
    ├── 5d83e247-....json          # Eval session 2
    └── results/                   # Output (auto-created)
        ├── adjective-noun-1234.json
        ├── adjective-noun-1234.log
        ├── adjective-noun-1234.db
        └── adjective-noun-1234-sessions.json
```
@z

@x
## Eval Session Format
@y
## Eval Session Format
@z

@x
Each eval file is a JSON session that captures a complete conversation. The key fields for evaluation are the user message, the expected tool calls (recorded from a real session), and optional eval criteria:
@y
Each eval file is a JSON session that captures a complete conversation. The key fields for evaluation are the user message, the expected tool calls (recorded from a real session), and optional eval criteria:
@z

@x
```json
{
  "id": "41b179a2-ed19-4ae2-a45d-95775aaa90f7",
  "title": "Counting Files in Local Folder",
  "messages": [
    {
      "message": {
        "message": {
          "role": "user",
          "content": "How many files in the local folder?"
        }
      }
    },
    {
      "message": {
        "agent_name": "root",
        "message": {
          "role": "assistant",
          "tool_calls": [
            {
              "id": "call_abc123",
              "type": "function",
              "function": {
                "name": "list_directory",
                "arguments": "{\"path\":\"./\"}"
              }
            }
          ]
        }
      }
    },
    {
      "message": {
        "agent_name": "root",
        "message": {
          "role": "assistant",
          "content": "There are 2 files in the local folder..."
        }
      }
    }
  ],
  "evals": {
    "relevance": [
      "The response mentions exactly 2 files",
      "The response lists README.md and agent.yaml"
    ],
    "size": "S",
    "working_dir": "my-project",
    "setup": "echo 'hello' > test.txt"
  }
}
```
@y
```json
{
  "id": "41b179a2-ed19-4ae2-a45d-95775aaa90f7",
  "title": "Counting Files in Local Folder",
  "messages": [
    {
      "message": {
        "message": {
          "role": "user",
          "content": "How many files in the local folder?"
        }
      }
    },
    {
      "message": {
        "agent_name": "root",
        "message": {
          "role": "assistant",
          "tool_calls": [
            {
              "id": "call_abc123",
              "type": "function",
              "function": {
                "name": "list_directory",
                "arguments": "{\"path\":\"./\"}"
              }
            }
          ]
        }
      }
    },
    {
      "message": {
        "agent_name": "root",
        "message": {
          "role": "assistant",
          "content": "There are 2 files in the local folder..."
        }
      }
    }
  ],
  "evals": {
    "relevance": [
      "The response mentions exactly 2 files",
      "The response lists README.md and agent.yaml"
    ],
    "size": "S",
    "working_dir": "my-project",
    "setup": "echo 'hello' > test.txt"
  }
}
```
@z

@x
## Eval Criteria
@y
## Eval Criteria
@z

@x
The `evals` object inside each session controls what gets scored:
@y
The `evals` object inside each session controls what gets scored:
@z

@x
| Field         | Type     | Description                                                                               |
| ------------- | -------- | ----------------------------------------------------------------------------------------- |
| `relevance`   | string[] | Statements that must be true about the agent's response. Scored by an LLM judge.          |
| `size`        | string   | Expected response size: `S`, `M`, `L`, or `XL`. Compared against actual output length.    |
| `working_dir` | string   | Subdirectory under `evals/working_dirs/` to mount as the container's working directory.   |
| `setup`       | string   | Shell script to run in the container before the agent executes (e.g., create test files). |
@y
| Field         | Type     | Description                                                                               |
| ------------- | -------- | ----------------------------------------------------------------------------------------- |
| `relevance`   | string[] | Statements that must be true about the agent's response. Scored by an LLM judge.          |
| `size`        | string   | Expected response size: `S`, `M`, `L`, or `XL`. Compared against actual output length.    |
| `working_dir` | string   | Subdirectory under `evals/working_dirs/` to mount as the container's working directory.   |
| `setup`       | string   | Shell script to run in the container before the agent executes (e.g., create test files). |
@z

@x
## Scoring Metrics
@y
## Scoring Metrics
@z

@x
Docker Agent evaluates agents across three dimensions:
@y
Docker Agent evaluates agents across three dimensions:
@z

@x
| Metric              | How It's Measured                                                                                                         |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| **Tool Calls (F1)** | F1 score between the expected tool call sequence (from the recorded session) and the actual tool calls made by the agent. |
| **Relevance**       | An LLM judge (configurable via `--judge-model`) evaluates whether each relevance statement is satisfied by the response.  |
| **Size**            | Whether the response length matches the expected size category (S/M/L/XL).                                                |
@y
| Metric              | How It's Measured                                                                                                         |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| **Tool Calls (F1)** | F1 score between the expected tool call sequence (from the recorded session) and the actual tool calls made by the agent. |
| **Relevance**       | An LLM judge (configurable via `--judge-model`) evaluates whether each relevance statement is satisfied by the response.  |
| **Size**            | Whether the response length matches the expected size category (S/M/L/XL).                                                |
@z

@x
## Serve-safety verification and rollback
@y
## Serve-safety verification and rollback
@z

@x
When changing an agent served over MCP HTTP, chat, or A2A, add an evaluation that attempts an approval-requiring tool call and verifies the resolved safety policy and authentication behavior. Run the evaluation with the same explicit `--safety` setting used in deployment. If a rollout must be reversed, stop the affected listener, restore the prior agent configuration and explicit safety flag, then restart only after confirming non-loopback listeners still require authentication. Do not restore an unauthenticated network listener as a rollback shortcut.
@y
When changing an agent served over MCP HTTP, chat, or A2A, add an evaluation that attempts an approval-requiring tool call and verifies the resolved safety policy and authentication behavior. Run the evaluation with the same explicit `--safety` setting used in deployment. If a rollout must be reversed, stop the affected listener, restore the prior agent configuration and explicit safety flag, then restart only after confirming non-loopback listeners still require authentication. Do not restore an unauthenticated network listener as a rollback shortcut.
@z

@x
## Creating Eval Sessions
@y
## Creating Eval Sessions
@z

@x
The easiest way to create eval sessions is from real conversations:
@y
The easiest way to create eval sessions is from real conversations:
@z

@x
1. Run your agent interactively: `docker agent run agent.yaml`
2. Have a conversation that tests the behavior you care about
3. Use the `/eval` slash command in the TUI to save the session as an eval file
4. Edit the generated JSON to add `evals` criteria (relevance, size, etc.)
@y
1. Run your agent interactively: `docker agent run agent.yaml`
2. Have a conversation that tests the behavior you care about
3. Use the `/eval` slash command in the TUI to save the session as an eval file
4. Edit the generated JSON to add `evals` criteria (relevance, size, etc.)
@z

@x
> [!TIP]
> Start with tool call scoring (automatic from recorded sessions), then add relevance criteria for the responses you care most about.
@y
> [!TIP]
> Start with tool call scoring (automatic from recorded sessions), then add relevance criteria for the responses you care most about.
@z

@x
## CLI Flags
@y
## CLI Flags
@z

@x
```bash
$ docker agent eval <agent-file>|<registry-ref> [<eval-dir>|./evals]
```
@y
```bash
$ docker agent eval <agent-file>|<registry-ref> [<eval-dir>|./evals]
```
@z

@x
| Flag                | Default                     | Description                                                       |
| ------------------- | --------------------------- | ----------------------------------------------------------------- |
| `-c, --concurrency` | num CPUs                    | Number of concurrent evaluation runs                              |
| `--judge-model`     | `anthropic/claude-opus-5` | Model for LLM-as-a-judge relevance scoring                        |
| `--output`          | `<eval-dir>/results`  | Directory for results, logs, and session databases                |
| `--only`            | (all)                       | Only run evals with file names matching these patterns            |
| `--base-image`      | (default)                   | Custom base image for eval containers (see [Custom Base Images](#custom-base-images)) |
| `--container-runtime` | `docker`                  | Container runtime executable for building and running evaluations (e.g. `podman`) |
| `--keep-containers` | `false`                     | Keep containers after evaluation (don't remove with `--rm`)       |
| `-e, --env`         | (none)                      | Environment variables to pass to container (`KEY` or `KEY=VALUE`) |
| `--repeat`          | `1`                         | Number of times to repeat each evaluation (useful for computing baselines) |
| `--baseline`        | (none)                      | Compare against a previously saved run JSON and exit non-zero on regression (see [Regression gate](#regression-gate)) |
| `--regression-tolerance` | `0`                    | How far an aggregate quality rate may fall before `--baseline` reports a regression (0–1) |
@y
| Flag                | Default                     | Description                                                       |
| ------------------- | --------------------------- | ----------------------------------------------------------------- |
| `-c, --concurrency` | num CPUs                    | Number of concurrent evaluation runs                              |
| `--judge-model`     | `anthropic/claude-opus-5` | Model for LLM-as-a-judge relevance scoring                        |
| `--output`          | `<eval-dir>/results`  | Directory for results, logs, and session databases                |
| `--only`            | (all)                       | Only run evals with file names matching these patterns            |
| `--base-image`      | (default)                   | Custom base image for eval containers (see [Custom Base Images](#custom-base-images)) |
| `--container-runtime` | `docker`                  | Container runtime executable for building and running evaluations (e.g. `podman`) |
| `--keep-containers` | `false`                     | Keep containers after evaluation (don't remove with `--rm`)       |
| `-e, --env`         | (none)                      | Environment variables to pass to container (`KEY` or `KEY=VALUE`) |
| `--repeat`          | `1`                         | Number of times to repeat each evaluation (useful for computing baselines) |
| `--baseline`        | (none)                      | Compare against a previously saved run JSON and exit non-zero on regression (see [Regression gate](#regression-gate)) |
| `--regression-tolerance` | `0`                    | How far an aggregate quality rate may fall before `--baseline` reports a regression (0–1) |
@z

@x
### Regression gate
@y
### Regression gate
@z

@x
`--baseline` compares the run against a previous one and exits non-zero when
quality regressed, so an eval suite can gate CI:
@y
`--baseline` compares the run against a previous one and exits non-zero when
quality regressed, so an eval suite can gate CI:
@z

@x
```console
$ docker agent eval ./agent.yaml --baseline results/2026-08-01-run.json
```
@y
```console
$ docker agent eval ./agent.yaml --baseline results/2026-08-01-run.json
```
@z

@x
The baseline is the run JSON written by a previous invocation —
`<output>/<run-name>.json` — so there is no separate artifact to produce.
@y
The baseline is the run JSON written by a previous invocation —
`<output>/<run-name>.json` — so there is no separate artifact to produce.
@z

@x
Four rules decide the verdict, and they are worth knowing before wiring this
into CI:
@y
Four rules decide the verdict, and they are worth knowing before wiring this
into CI:
@z

@x
- **The tolerance governs aggregate rates only.** An LLM judge does not return
  the same score twice, so without a tolerance the gate flaps. `--regression-tolerance 0.05`
  lets an aggregate rate fall five points before it counts.
- **An evaluation that passed and now fails always gates**, regardless of the
  tolerance. That transition is the signal the gate exists to catch, so it is
  never absorbed.
- **Cost is reported but never gates.** A provider price change is not a quality
  regression.
- **An added *failing* evaluation gates** via the aggregate rate, even though no
  existing evaluation regressed. A suite that got worse should say so — but it
  means committing a known-failing eval needs a tolerance bump or a fix.
@y
- **The tolerance governs aggregate rates only.** An LLM judge does not return
  the same score twice, so without a tolerance the gate flaps. `--regression-tolerance 0.05`
  lets an aggregate rate fall five points before it counts.
- **An evaluation that passed and now fails always gates**, regardless of the
  tolerance. That transition is the signal the gate exists to catch, so it is
  never absorbed.
- **Cost is reported but never gates.** A provider price change is not a quality
  regression.
- **An added *failing* evaluation gates** via the aggregate rate, even though no
  existing evaluation regressed. A suite that got worse should say so — but it
  means committing a known-failing eval needs a tolerance bump or a fix.
@z

@x
A baseline that carries no evaluations, or a run that produced none (an
`--only` pattern that matched nothing), is rejected rather than reported as
passing: a gate that cannot fail is worse than no gate.
@y
A baseline that carries no evaluations, or a run that produced none (an
`--only` pattern that matched nothing), is rejected rather than reported as
passing: a gate that cannot fail is worse than no gate.
@z

@x
### Provider Credentials
@y
### Provider Credentials
@z

@x
Eval containers are isolated from your host environment. Dedicated model
provider API keys (for example `ANTHROPIC_API_KEY` or `OPENAI_API_KEY`) are
forwarded into eval containers automatically, so most provider setups work
without extra flags.
@y
Eval containers are isolated from your host environment. Dedicated model
provider API keys (for example `ANTHROPIC_API_KEY` or `OPENAI_API_KEY`) are
forwarded into eval containers automatically, so most provider setups work
without extra flags.
@z

@x
> [!WARNING]
> **`GITHUB_TOKEN` and `GH_TOKEN` are not forwarded automatically**
>
> GitHub tokens are broad credentials (git, `gh`, CI, packages), not dedicated
> model API keys, so for security reasons Docker Agent does not forward them
> into eval containers — even when they are set in your shell or in
> `~/.config/cagent/.env`. If your agent uses the `github-copilot` provider,
> pass the token explicitly by name:
>
> ```bash
> docker agent eval agent.yaml ./evals -e GITHUB_TOKEN
> ```
>
> When using a custom env file, both flags are required:
>
> ```bash
> docker agent eval agent.yaml ./evals \
>   --env-from-file /path/to/secrets.env \
>   -e GITHUB_TOKEN
> ```
@y
> [!WARNING]
> **`GITHUB_TOKEN` and `GH_TOKEN` are not forwarded automatically**
>
> GitHub tokens are broad credentials (git, `gh`, CI, packages), not dedicated
> model API keys, so for security reasons Docker Agent does not forward them
> into eval containers — even when they are set in your shell or in
> `~/.config/cagent/.env`. If your agent uses the `github-copilot` provider,
> pass the token explicitly by name:
>
> ```bash
> docker agent eval agent.yaml ./evals -e GITHUB_TOKEN
> ```
>
> When using a custom env file, both flags are required:
>
> ```bash
> docker agent eval agent.yaml ./evals \
>   --env-from-file /path/to/secrets.env \
>   -e GITHUB_TOKEN
> ```
@z

@x
Note that the LLM judge runs on the host, not inside the eval container. If
the token is not forwarded, judge validation can succeed while every
evaluated agent run fails to authenticate.
@y
Note that the LLM judge runs on the host, not inside the eval container. If
the token is not forwarded, judge validation can succeed while every
evaluated agent run fails to authenticate.
@z

@x
### Custom Base Images
@y
### Custom Base Images
@z

@x
When `--base-image` is set, the eval harness builds a derived image on top of your base image at evaluation time. Two things happen automatically:
@y
When `--base-image` is set, the eval harness builds a derived image on top of your base image at evaluation time. Two things happen automatically:
@z

@x
1. **The docker-agent binary is injected** — it is copied from `docker/docker-agent:edge` into the derived image at build time, so you don't need to include it in your base image.
2. **The entrypoint is overridden** — Docker Agent replaces your base image's entrypoint with its own `/run.sh` wrapper.
@y
1. **The docker-agent binary is injected** — it is copied from `docker/docker-agent:edge` into the derived image at build time, so you don't need to include it in your base image.
2. **The entrypoint is overridden** — Docker Agent replaces your base image's entrypoint with its own `/run.sh` wrapper.
@z

@x
Your base image therefore only needs to provide the runtime environment: language runtimes, installed dependencies, test fixtures, the appropriate working directory, and so on. Any `ENTRYPOINT` or `CMD` defined in your base image is ignored.
@y
Your base image therefore only needs to provide the runtime environment: language runtimes, installed dependencies, test fixtures, the appropriate working directory, and so on. Any `ENTRYPOINT` or `CMD` defined in your base image is ignored.
@z

@x
## Output
@y
## Output
@z

@x
After a run completes, Docker Agent produces:
@y
After a run completes, Docker Agent produces:
@z

@x
- **Console summary** — Pass/fail status per eval with metric breakdowns
- **JSON results** — Full structured results for programmatic analysis
- **SQLite database** — Complete sessions for detailed investigation and debugging
- **Sessions JSON** — Exported session data for analysis
- **Log file** — Debug-level log of the entire evaluation run
@y
- **Console summary** — Pass/fail status per eval with metric breakdowns
- **JSON results** — Full structured results for programmatic analysis
- **SQLite database** — Complete sessions for detailed investigation and debugging
- **Sessions JSON** — Exported session data for analysis
- **Log file** — Debug-level log of the entire evaluation run
@z

@x
> [!TIP]
> **Debugging Failed Evals**
>
> Use `--keep-containers` to preserve containers after evaluation. You can then inspect them with your selected runtime's `exec` command (`docker exec` by default, `podman exec` with `--container-runtime podman`) to understand why an eval failed. The session database (`.db` file) contains the full conversation history for each eval.
@y
> [!TIP]
> **Debugging Failed Evals**
>
> Use `--keep-containers` to preserve containers after evaluation. You can then inspect them with your selected runtime's `exec` command (`docker exec` by default, `podman exec` with `--container-runtime podman`) to understand why an eval failed. The session database (`.db` file) contains the full conversation history for each eval.
@z

@x
```bash
$ docker agent eval demo.yaml ./evals
@y
```bash
$ docker agent eval demo.yaml ./evals
@z

@x
  ✓ Counting Files in Local Folder
    ✓ tool calls  ✓ relevance 2/2
  ✓ Checking the Content of README.md File
    ✓ tool calls  ✓ relevance 1/1
@y
  ✓ Counting Files in Local Folder
    ✓ tool calls  ✓ relevance 2/2
  ✓ Checking the Content of README.md File
    ✓ tool calls  ✓ relevance 1/1
@z

@x
✅     Tool Calls: 100.0% avg F1 (2 evals)
✅      Relevance: 3/3 passed (100.0%)
@y
✅     Tool Calls: 100.0% avg F1 (2 evals)
✅      Relevance: 3/3 passed (100.0%)
@z

@x
Total Cost: $0.012345
Total Time: 12s
@y
Total Cost: $0.012345
Total Time: 12s
@z

@x
Sessions DB: ./evals/results/happy-panda-1234.db
Sessions JSON: ./evals/results/happy-panda-1234-sessions.json
Log: ./evals/results/happy-panda-1234.log
```
@y
Sessions DB: ./evals/results/happy-panda-1234.db
Sessions JSON: ./evals/results/happy-panda-1234-sessions.json
Log: ./evals/results/happy-panda-1234.log
```
@z

@x
## Example
@y
## Example
@z

@x
Here's a minimal evaluation setup:
@y
Here's a minimal evaluation setup:
@z

@x
```yaml
# agent.yaml
agents:
  root:
    model: openai/gpt-4o
    description: Test agent
    instruction: You know how to read/write and list files.
    toolsets:
      - type: filesystem
```
@y
```yaml
# agent.yaml
agents:
  root:
    model: openai/gpt-4o
    description: Test agent
    instruction: You know how to read/write and list files.
    toolsets:
      - type: filesystem
```
@z

@x
```bash
# Create evals from interactive sessions
$ docker agent run agent.yaml
# ... have conversations, then use /eval to save them
@y
```bash
# Create evals from interactive sessions
$ docker agent run agent.yaml
# ... have conversations, then use /eval to save them
@z

@x
# Run the evaluations
$ docker agent eval agent.yaml ./evals
```
@y
# Run the evaluations
$ docker agent eval agent.yaml ./evals
```
@z

@x
> [!NOTE]
> **See also**
>
> Use `/eval` in the [TUI](../tui/index.md) to create eval sessions from conversations. See the [CLI Reference](../cli/index.md) for all `docker agent eval` flags. Example eval configs are in [examples/eval](https://github.com/docker/docker-agent/tree/main/examples/eval) on GitHub.
@y
> [!NOTE]
> **See also**
>
> Use `/eval` in the [TUI](../tui/index.md) to create eval sessions from conversations. See the [CLI Reference](../cli/index.md) for all `docker agent eval` flags. Example eval configs are in [examples/eval](https://github.com/docker/docker-agent/tree/main/examples/eval) on GitHub.
@z
