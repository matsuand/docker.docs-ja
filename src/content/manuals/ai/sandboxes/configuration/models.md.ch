%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Use local and hosted models
linkTitle: Models
@y
title: Use local and hosted models
linkTitle: Models
@z

@x
description: Choose a local model, hosted provider, or custom inference endpoint for Claude Code, Codex, or OpenCode in Docker Sandboxes.
keywords: docker sandboxes, sbx, models, providers, llmman, ollama, inference, local models
@y
description: Choose a local model, hosted provider, or custom inference endpoint for Claude Code, Codex, or OpenCode in Docker Sandboxes.
keywords: docker sandboxes, sbx, models, providers, llmman, ollama, inference, local models
@z

@x
Use `sbx run --model` to choose the model and service that answer your agent's
requests. The agent runs inside a local sandbox. The model can run on your
host, at a hosted provider, or at an inference endpoint you configure.
@y
Use `sbx run --model` to choose the model and service that answer your agent's
requests. The agent runs inside a local sandbox. The model can run on your
host, at a hosted provider, or at an inference endpoint you configure.
@z

@x
This page covers the built-in `claude`, `codex`, and `opencode` agents. Choose
a model that supports the tool calls and context length your agent needs.
`--model` isn't supported with cloud sandboxes or v3 kits.
@y
This page covers the built-in `claude`, `codex`, and `opencode` agents. Choose
a model that supports the tool calls and context length your agent needs.
`--model` isn't supported with cloud sandboxes or v3 kits.
@z

@x
> [!NOTE]
> Model selection is experimental. Enable it before following these examples.
@y
> [!NOTE]
> Model selection is experimental. Enable it before following these examples.
@z

@x
## Bundled model service
@y
## Bundled model service
@z

@x
Docker Sandboxes includes `llmman`, a model management tool installed alongside
`sbx`. It serves local models and forwards requests to hosted providers or
custom endpoints. You don't need to install it separately.
@y
Docker Sandboxes includes `llmman`, a model management tool installed alongside
`sbx`. It serves local models and forwards requests to hosted providers or
custom endpoints. You don't need to install it separately.
@z

@x
The Docker Sandboxes daemon starts `llmman` on your host and stops it when
the daemon stops. At startup, `llmman` downloads its llama.cpp runtime if
needed, so the first startup requires network access for that download. The service starts even if you haven't used `--model`.
@y
The Docker Sandboxes daemon starts `llmman` on your host and stops it when
the daemon stops. At startup, `llmman` downloads its llama.cpp runtime if
needed, so the first startup requires network access for that download. The service starts even if you haven't used `--model`.
@z

@x
The service keeps running after a sandbox or CLI exits. Sandboxes share its
model store and loaded models.
@y
The service keeps running after a sandbox or CLI exits. Sandboxes share its
model store and loaded models.
@z

@x
On Linux, `llmman` first tries Docker or Podman to run the inference server
in a container. If neither is usable, it tries a downloaded binary, then
`llama-server` on the host's `PATH`.
@y
On Linux, `llmman` first tries Docker or Podman to run the inference server
in a container. If neither is usable, it tries a downloaded binary, then
`llama-server` on the host's `PATH`.
@z

@x
## Enable model selection
@y
## Enable model selection
@z

@x
Run these commands on your host:
@y
Run these commands on your host:
@z

@x
```console
$ sbx settings set platform.allowExperimentalFeatures true
$ sbx settings set feature.model true
```
@y
```console
$ sbx settings set platform.allowExperimentalFeatures true
$ sbx settings set feature.model true
```
@z

@x
The `--provider` flag selects where the model runs:
@y
The `--provider` flag selects where the model runs:
@z

@x
| Provider | Model destination |
| --- | --- |
| Omitted, or `llmman` | A local model managed by `llmman` |
| `ollama` | An existing Ollama installation on your host |
| A hosted provider ID | A provider supported by `llmman`, such as `openai` or `anthropic` |
| An ID from `model.providers` | An endpoint you configure |
@y
| Provider | Model destination |
| --- | --- |
| Omitted, or `llmman` | A local model managed by `llmman` |
| `ollama` | An existing Ollama installation on your host |
| A hosted provider ID | A provider supported by `llmman`, such as `openai` or `anthropic` |
| An ID from `model.providers` | An endpoint you configure |
@z

@x
## Run a local model
@y
## Run a local model
@z

@x
Pass a GGUF model reference or short name to `--model`:
@y
Pass a GGUF model reference or short name to `--model`:
@z

@x
```console
$ sbx run --model gemma4 claude
```
@y
```console
$ sbx run --model gemma4 claude
```
@z

@x
Docker Sandboxes downloads the model if needed. The model runs on the host,
so its memory and compute requirements are separate from the sandbox's
resource limits. Replace `claude` with `codex` or `opencode` to use another
agent with the same model.
@y
Docker Sandboxes downloads the model if needed. The model runs on the host,
so its memory and compute requirements are separate from the sandbox's
resource limits. Replace `claude` with `codex` or `opencode` to use another
agent with the same model.
@z

@x
### Use Ollama
@y
### Use Ollama
@z

@x
Install and start Ollama on your host, then select it with `--provider`:
@y
Install and start Ollama on your host, then select it with `--provider`:
@z

@x
```console
$ sbx run --model gemma4 --provider ollama claude
```
@y
```console
$ sbx run --model gemma4 --provider ollama claude
```
@z

@x
Docker Sandboxes connects to Ollama at `localhost:11434`. It doesn't install,
start, or manage the Ollama process.
@y
Docker Sandboxes connects to Ollama at `localhost:11434`. It doesn't install,
start, or manage the Ollama process.
@z

@x
For Docker Model Runner, see
[Run Claude Code in a Docker Sandbox with Docker Model Runner](/guides/claude-code-sandbox-model-runner/).
@y
For Docker Model Runner, see
[Run Claude Code in a Docker Sandbox with Docker Model Runner](__SUBDIR__/guides/claude-code-sandbox-model-runner/).
@z

@x
## Use a hosted provider
@y
## Use a hosted provider
@z

@x
Select a provider supported by `llmman` and a model available from that
provider. For example, store your OpenAI API key on the host, then run Codex
with an OpenAI model:
@y
Select a provider supported by `llmman` and a model available from that
provider. For example, store your OpenAI API key on the host, then run Codex
with an OpenAI model:
@z

@x
```console
$ sbx secret set openai
$ sbx run --provider openai --model gpt-5-nano codex
```
@y
```console
$ sbx secret set openai
$ sbx run --provider openai --model gpt-5-nano codex
```
@z

@x
The host's `llmman` service forwards requests to the provider. It doesn't
download or run the hosted model. For available providers and their API-key
variable names, see the [llmman provider documentation](https://github.com/llmmanorg/llmman/blob/main/docs/providers.md).
@y
The host's `llmman` service forwards requests to the provider. It doesn't
download or run the hosted model. For available providers and their API-key
variable names, see the [llmman provider documentation](https://github.com/llmmanorg/llmman/blob/main/docs/providers.md).
@z

@x
### Provider authentication
@y
### Provider authentication
@z

@x
Store the API key with `sbx secret set <PROVIDER_ID>`, using the same ID as
`--provider` or `--overflow-provider`. This also works for a custom provider
ID defined in `model.providers`. Sandbox-scoped secrets take precedence over
global secrets.
@y
Store the API key with `sbx secret set <PROVIDER_ID>`, using the same ID as
`--provider` or `--overflow-provider`. This also works for a custom provider
ID defined in `model.providers`. Sandbox-scoped secrets take precedence over
global secrets.
@z

@x
The sandbox sends a placeholder in place of the key. The host proxy replaces
it with the stored key only in authentication headers on requests to the host's
`llmman` service. That service uses the key to authenticate requests to the
selected provider. The real key stays outside the sandbox.
@y
The sandbox sends a placeholder in place of the key. The host proxy replaces
it with the stored key only in authentication headers on requests to the host's
`llmman` service. That service uses the key to authenticate requests to the
selected provider. The real key stays outside the sandbox.
@z

@x
Docker Sandboxes configures this injection automatically when you select the
provider. You don't need `sbx secret set-custom` or domain injection rules for
this workflow.
@y
Docker Sandboxes configures this injection automatically when you select the
provider. You don't need `sbx secret set-custom` or domain injection rules for
this workflow.
@z

@x
> [!WARNING]
> Model-provider credentials are protected differently from other sandbox
> credentials. For other credentials, the proxy restricts injection to their
> configured domains. For model providers, it supplies the key to the host's
> `llmman` service instead. That service can forward the key to other endpoints
> it supports; selecting `--provider` does not restrict the key to that
> provider's endpoint.
@y
> [!WARNING]
> Model-provider credentials are protected differently from other sandbox
> credentials. For other credentials, the proxy restricts injection to their
> configured domains. For model providers, it supplies the key to the host's
> `llmman` service instead. That service can forward the key to other endpoints
> it supports; selecting `--provider` does not restrict the key to that
> provider's endpoint.
@z

@x
If no stored secret is available, make the key available in the host shell
that starts the daemon. For a custom endpoint, choose the variable name with
[`apiKeyEnv`](#connect-a-custom-endpoint).
@y
If no stored secret is available, make the key available in the host shell
that starts the daemon. For a custom endpoint, choose the variable name with
[`apiKeyEnv`](#connect-a-custom-endpoint).
@z

@x
`llmman` inherits the daemon's environment. After setting or changing a key
in that environment, run `sbx daemon restart` from the shell containing the
updated variable.
This restarts the model service and interrupts model requests from sandboxes
using it. Setting a variable only in the shell where you run `sbx run --model`
doesn't update an already-running service.
@y
`llmman` inherits the daemon's environment. After setting or changing a key
in that environment, run `sbx daemon restart` from the shell containing the
updated variable.
This restarts the model service and interrupts model requests from sandboxes
using it. Setting a variable only in the shell where you run `sbx run --model`
doesn't update an already-running service.
@z

@x
Using a stored secret avoids restarting the daemon to load a key from its
environment. For the agents' default authentication flows, see
[Manage credentials](credentials.md).
@y
Using a stored secret avoids restarting the daemon to load a key from its
environment. For the agents' default authentication flows, see
[Manage credentials](credentials.md).
@z

@x
## Connect a custom endpoint
@y
## Connect a custom endpoint
@z

@x
Use `model.providers` to connect to an OpenAI- or Anthropic-compatible
inference endpoint, such as an internal GPU server. The endpoint must be
reachable from your host.
@y
Use `model.providers` to connect to an OpenAI- or Anthropic-compatible
inference endpoint, such as an internal GPU server. The endpoint must be
reachable from your host.
@z

@x
The setting is a JSON object keyed by provider ID. Check its existing value
before changing it:
@y
The setting is a JSON object keyed by provider ID. Check its existing value
before changing it:
@z

@x
```console
$ sbx settings get model.providers
```
@y
```console
$ sbx settings get model.providers
```
@z

@x
For an OpenAI-compatible endpoint, define a provider named `company`:
@y
For an OpenAI-compatible endpoint, define a provider named `company`:
@z

@x
```console
$ sbx settings set model.providers '{"company":{"url":"https://inference.example.com/v1","wire":"openai"}}'
```
@y
```console
$ sbx settings set model.providers '{"company":{"url":"https://inference.example.com/v1","wire":"openai"}}'
```
@z

@x
Replace the URL with your endpoint's base URL. Setting `model.providers`
replaces the whole object, so include any existing providers you want to keep.
@y
Replace the URL with your endpoint's base URL. Setting `model.providers`
replaces the whole object, so include any existing providers you want to keep.
@z

@x
| Field | Description |
| --- | --- |
| `url` | Required HTTP or HTTPS base URL, usually ending in `/v1`. Use the base URL, without `/chat/completions` or `/messages`. |
| `wire` | The endpoint's API format: `openai` (default) or `anthropic`. This describes the endpoint, regardless of which agent you run. |
| `apiKeyEnv` | Name of an optional host environment variable containing the API key. Used as a fallback when no stored provider secret is available. |
| `name` | Optional display name. Defaults to the provider ID. |
@y
| Field | Description |
| --- | --- |
| `url` | Required HTTP or HTTPS base URL, usually ending in `/v1`. Use the base URL, without `/chat/completions` or `/messages`. |
| `wire` | The endpoint's API format: `openai` (default) or `anthropic`. This describes the endpoint, regardless of which agent you run. |
| `apiKeyEnv` | Name of an optional host environment variable containing the API key. Used as a fallback when no stored provider secret is available. |
| `name` | Optional display name. Defaults to the provider ID. |
@z

@x
If the endpoint requires an API key, store it using the provider ID
(`company`). Docker Sandboxes configures authentication when you select that
provider with `--provider`:
@y
If the endpoint requires an API key, store it using the provider ID
(`company`). Docker Sandboxes configures authentication when you select that
provider with `--provider`:
@z

@x
```console
$ sbx secret set company
$ sbx run --provider company --model <MODEL_NAME> claude
```
@y
```console
$ sbx secret set company
$ sbx run --provider company --model <MODEL_NAME> claude
```
@z

@x
Docker Sandboxes applies the provider configuration when you run with
`--model`. You can use the same provider with `codex` or `opencode`.
@y
Docker Sandboxes applies the provider configuration when you run with
`--model`. You can use the same provider with `codex` or `opencode`.
@z

@x
## Change an existing sandbox's model
@y
## Change an existing sandbox's model
@z

@x
Pass the sandbox name and your model selection:
@y
Pass the sandbox name and your model selection:
@z

@x
```console
$ sbx run --name <SANDBOX_NAME> --model <MODEL_NAME> --provider <PROVIDER_ID>
```
@y
```console
$ sbx run --name <SANDBOX_NAME> --model <MODEL_NAME> --provider <PROVIDER_ID>
```
@z

@x
Changing the model recreates the sandbox container. The workspace and
kit-owned volumes persist. Omit `--provider` to select a local model managed
by `llmman`.
@y
Changing the model recreates the sandbox container. The workspace and
kit-owned volumes persist. Omit `--provider` to select a local model managed
by `llmman`.
@z

@x
## Choose a reasoning level
@y
## Choose a reasoning level
@z

@x
Use `--variant` with `--model` to select a reasoning level supported by your
model. For example, replace `<MODEL_NAME>` with an OpenAI model that supports
`high` reasoning effort to start Codex at that level:
@y
Use `--variant` with `--model` to select a reasoning level supported by your
model. For example, replace `<MODEL_NAME>` with an OpenAI model that supports
`high` reasoning effort to start Codex at that level:
@z

@x
```console
$ sbx run --provider openai --model <MODEL_NAME> --variant high codex
```
@y
```console
$ sbx run --provider openai --model <MODEL_NAME> --variant high codex
```
@z

@x
Available values depend on the model and agent. Reasoning levels are `minimal`,
`low`, `medium`, `high`, `xhigh`, and `max`. Some models support `none` to disable
thinking or `thinking` to enable it. Omit `--variant` to use the default.
@y
Available values depend on the model and agent. Reasoning levels are `minimal`,
`low`, `medium`, `high`, `xhigh`, and `max`. Some models support `none` to disable
thinking or `thinking` to enable it. Omit `--variant` to use the default.
@z

@x
Claude Code doesn't support `none` or `minimal`. For Claude Code and Codex,
`--variant` requires an attached session and can't be combined with `--detach`.
In OpenCode, it selects the initial variant, which you can change inside
OpenCode.
@y
Claude Code doesn't support `none` or `minimal`. For Claude Code and Codex,
`--variant` requires an attached session and can't be combined with `--detach`.
In OpenCode, it selects the initial variant, which you can change inside
OpenCode.
@z

@x
## Use another provider for larger requests
@y
## Use another provider for larger requests
@z

@x
Pair a local model with another provider to handle requests that exceed the
local model's context capacity:
@y
Pair a local model with another provider to handle requests that exceed the
local model's context capacity:
@z

@x
```console
$ sbx run --model gemma4 \
    --overflow-provider openai --overflow-model gpt-5-nano claude
```
@y
```console
$ sbx run --model gemma4 \
    --overflow-provider openai --overflow-model gpt-5-nano claude
```
@z

@x
Configure [provider authentication](#provider-authentication) before starting
the model service. You can also use a provider defined in `model.providers`.
Both overflow flags are required, and the local model must use the default
`llmman` provider. This option can't be combined with `--provider ollama` or
a hosted provider selected with `--provider`.
@y
Configure [provider authentication](#provider-authentication) before starting
the model service. You can also use a provider defined in `model.providers`.
Both overflow flags are required, and the local model must use the default
`llmman` provider. This option can't be combined with `--provider ollama` or
a hosted provider selected with `--provider`.
@z

@x
Requests that fit the local model stay local. Requests routed to the overflow
provider send their contents to that endpoint and can incur provider charges.
@y
Requests that fit the local model stay local. Requests routed to the overflow
provider send their contents to that endpoint and can incur provider charges.
@z
