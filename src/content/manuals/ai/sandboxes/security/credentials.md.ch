%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Credentials
@y
title: Credentials
@z

@x
description: How Docker Sandboxes handle API keys and authentication credentials for sandboxed agents.
@y
description: How Docker Sandboxes handle API keys and authentication credentials for sandboxed agents.
@z

@x
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@z

@x
Most agents need an API key for their model provider. An HTTP/HTTPS proxy on
your host intercepts outbound API requests from the sandbox and injects the
appropriate authentication headers before forwarding each request. Your
credentials stay on the host and are never stored inside the sandbox VM. For
how this works as a security layer, see
[Credential isolation](isolation.md#credential-isolation).
@y
Most agents need an API key for their model provider. An HTTP/HTTPS proxy on
your host intercepts outbound API requests from the sandbox and injects the
appropriate authentication headers before forwarding each request. Your
credentials stay on the host and are never stored inside the sandbox VM. For
how this works as a security layer, see
[Credential isolation](isolation.md#credential-isolation).
@z

@x
There are two ways to provide credentials:
@y
There are two ways to provide credentials:
@z

@x
- **Stored secrets** (recommended): saved in your OS keychain, encrypted and
  persistent across sessions.
- **Environment variables:** read from your current shell session. This works
  but is less secure on the host side, since environment variables are visible
  to other processes running as your user.
@y
- **Stored secrets** (recommended): saved in your OS keychain, encrypted and
  persistent across sessions.
- **Environment variables:** read from your current shell session. This works
  but is less secure on the host side, since environment variables are visible
  to other processes running as your user.
@z

@x
If both are set for the same service, the stored secret takes precedence. For
multi-provider agents (OpenCode, Docker Agent), the proxy automatically selects the
correct credentials based on the API endpoint being called. See individual
[agent pages](../agents/) for provider-specific details.
@y
If both are set for the same service, the stored secret takes precedence. For
multi-provider agents (OpenCode, Docker Agent), the proxy automatically selects the
correct credentials based on the API endpoint being called. See individual
[agent pages](../agents/) for provider-specific details.
@z

@x
## Stored secrets
@y
## Stored secrets
@z

@x
The `sbx secret` command stores credentials in your OS keychain so you don't
need to export environment variables in every terminal session. When a sandbox
starts, the proxy looks up stored secrets and uses them to authenticate API
requests on behalf of the agent. The secret is never exposed directly to the
agent.
@y
The `sbx secret` command stores credentials in your OS keychain so you don't
need to export environment variables in every terminal session. When a sandbox
starts, the proxy looks up stored secrets and uses them to authenticate API
requests on behalf of the agent. The secret is never exposed directly to the
agent.
@z

@x
### Store a secret
@y
### Store a secret
@z

@x
```console
$ sbx secret set -g anthropic
```
@y
```console
$ sbx secret set -g anthropic
```
@z

@x
This prompts you for the secret value interactively. The `-g` flag stores the
secret globally so it's available to all sandboxes. To scope a secret to a
specific sandbox instead:
@y
This prompts you for the secret value interactively. The `-g` flag stores the
secret globally so it's available to all sandboxes. To scope a secret to a
specific sandbox instead:
@z

@x
```console
$ sbx secret set my-sandbox openai
```
@y
```console
$ sbx secret set my-sandbox openai
```
@z

@x
> [!NOTE]
> A sandbox-scoped secret takes effect immediately, even if the sandbox is
> running. A global secret (`-g`) only applies when a sandbox is created. If
> you set or change a global secret while a sandbox is running, recreate the
> sandbox for the new value to take effect.
@y
> [!NOTE]
> A sandbox-scoped secret takes effect immediately, even if the sandbox is
> running. A global secret (`-g`) only applies when a sandbox is created. If
> you set or change a global secret while a sandbox is running, recreate the
> sandbox for the new value to take effect.
@z

@x
You can also pipe in a value for non-interactive use:
@y
You can also pipe in a value for non-interactive use:
@z

@x
```console
$ echo "$ANTHROPIC_API_KEY" | sbx secret set -g anthropic
```
@y
```console
$ echo "$ANTHROPIC_API_KEY" | sbx secret set -g anthropic
```
@z

@x
### Supported services
@y
### Supported services
@z

@x
Each service name maps to a set of environment variables the proxy checks and
the API domains it authenticates requests to:
@y
Each service name maps to a set of environment variables the proxy checks and
the API domains it authenticates requests to:
@z

@x
| Service     | Environment variables                        | API domains                         |
| ----------- | -------------------------------------------- | ----------------------------------- |
| `anthropic` | `ANTHROPIC_API_KEY`                          | `api.anthropic.com`                 |
| `aws`       | `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY` | AWS Bedrock endpoints               |
| `github`    | `GH_TOKEN`, `GITHUB_TOKEN`                   | `api.github.com`, `github.com`      |
| `google`    | `GEMINI_API_KEY`, `GOOGLE_API_KEY`           | `generativelanguage.googleapis.com` |
| `groq`      | `GROQ_API_KEY`                               | `api.groq.com`                      |
| `mistral`   | `MISTRAL_API_KEY`                            | `api.mistral.ai`                    |
| `nebius`    | `NEBIUS_API_KEY`                             | `api.studio.nebius.ai`              |
| `openai`    | `OPENAI_API_KEY`                             | `api.openai.com`                    |
| `xai`       | `XAI_API_KEY`                                | `api.x.ai`                          |
@y
| Service     | Environment variables                        | API domains                         |
| ----------- | -------------------------------------------- | ----------------------------------- |
| `anthropic` | `ANTHROPIC_API_KEY`                          | `api.anthropic.com`                 |
| `aws`       | `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY` | AWS Bedrock endpoints               |
| `github`    | `GH_TOKEN`, `GITHUB_TOKEN`                   | `api.github.com`, `github.com`      |
| `google`    | `GEMINI_API_KEY`, `GOOGLE_API_KEY`           | `generativelanguage.googleapis.com` |
| `groq`      | `GROQ_API_KEY`                               | `api.groq.com`                      |
| `mistral`   | `MISTRAL_API_KEY`                            | `api.mistral.ai`                    |
| `nebius`    | `NEBIUS_API_KEY`                             | `api.studio.nebius.ai`              |
| `openai`    | `OPENAI_API_KEY`                             | `api.openai.com`                    |
| `xai`       | `XAI_API_KEY`                                | `api.x.ai`                          |
@z

@x
When you store a secret with `sbx secret set -g <service>`, the proxy uses it
the same way it would use the corresponding environment variable. You don't
need to set both.
@y
When you store a secret with `sbx secret set -g <service>`, the proxy uses it
the same way it would use the corresponding environment variable. You don't
need to set both.
@z

@x
### List and remove secrets
@y
### List and remove secrets
@z

@x
List all stored secrets:
@y
List all stored secrets:
@z

@x
```console
$ sbx secret ls
SCOPE      SERVICE   SECRET
(global)   github    gho_GCaw4o****...****43qy
```
@y
```console
$ sbx secret ls
SCOPE      SERVICE   SECRET
(global)   github    gho_GCaw4o****...****43qy
```
@z

@x
Remove a secret:
@y
Remove a secret:
@z

@x
```console
$ sbx secret rm -g github
```
@y
```console
$ sbx secret rm -g github
```
@z

@x
> [!NOTE]
> Running `sbx reset` deletes all stored secrets along with all sandbox state.
> You'll need to re-add your secrets after a reset.
@y
> [!NOTE]
> Running `sbx reset` deletes all stored secrets along with all sandbox state.
> You'll need to re-add your secrets after a reset.
@z

@x
### GitHub token
@y
### GitHub token
@z

@x
The `github` service gives the agent access to the `gh` CLI inside the
sandbox. Pass your existing GitHub CLI token:
@y
The `github` service gives the agent access to the `gh` CLI inside the
sandbox. Pass your existing GitHub CLI token:
@z

@x
```console
$ echo "$(gh auth token)" | sbx secret set -g github
```
@y
```console
$ echo "$(gh auth token)" | sbx secret set -g github
```
@z

@x
This is useful for agents that create pull requests, open issues, or interact
with GitHub APIs on your behalf.
@y
This is useful for agents that create pull requests, open issues, or interact
with GitHub APIs on your behalf.
@z

@x
## Environment variables
@y
## Environment variables
@z

@x
As an alternative to stored secrets, export the relevant environment variable
in your shell before running a sandbox:
@y
As an alternative to stored secrets, export the relevant environment variable
in your shell before running a sandbox:
@z

@x
```console
$ export ANTHROPIC_API_KEY=sk-ant-api03-xxxxx
$ sbx run claude
```
@y
```console
$ export ANTHROPIC_API_KEY=sk-ant-api03-xxxxx
$ sbx run claude
```
@z

@x
The proxy reads the variable from your terminal session. See individual
[agent pages](../agents/) for the variable names each agent expects.
@y
The proxy reads the variable from your terminal session. See individual
[agent pages](../agents/) for the variable names each agent expects.
@z

@x
> [!NOTE]
> These environment variables are set on your host, not inside the sandbox.
> Sandbox agents are pre-configured to use credentials managed by the
> host-side proxy. For custom environment variables not tied to a
> [supported service](#supported-services), see
> [Setting custom environment variables](../faq.md#how-do-i-set-custom-environment-variables-inside-a-sandbox).
@y
> [!NOTE]
> These environment variables are set on your host, not inside the sandbox.
> Sandbox agents are pre-configured to use credentials managed by the
> host-side proxy. For custom environment variables not tied to a
> [supported service](#supported-services), see
> [Setting custom environment variables](../faq.md#how-do-i-set-custom-environment-variables-inside-a-sandbox).
@z

@x
## Best practices
@y
## Best practices
@z

@x
- Use [stored secrets](#stored-secrets) over environment variables. The OS
  keychain encrypts credentials at rest and controls access, while environment
  variables are plaintext in your shell.
- Don't set API keys manually inside the sandbox. Sandbox agents are
  pre-configured to use proxy-managed credentials.
- For Claude Code and Codex, OAuth is another secure option: the flow runs on
  the host, so the token is never exposed inside the sandbox. For Claude Code,
  use `/login` inside the agent. For Codex, run `sbx secret set -g openai --oauth`.
@y
- Use [stored secrets](#stored-secrets) over environment variables. The OS
  keychain encrypts credentials at rest and controls access, while environment
  variables are plaintext in your shell.
- Don't set API keys manually inside the sandbox. Sandbox agents are
  pre-configured to use proxy-managed credentials.
- For Claude Code and Codex, OAuth is another secure option: the flow runs on
  the host, so the token is never exposed inside the sandbox. For Claude Code,
  use `/login` inside the agent. For Codex, run `sbx secret set -g openai --oauth`.
@z

@x
## Custom templates and placeholder values
@y
## Custom templates and placeholder values
@z

@x
When building custom templates or installing agents manually in a shell
sandbox, some agents require environment variables like `OPENAI_API_KEY` to be
set before they start. Set these to placeholder values (e.g. `proxy-managed`)
if needed. The proxy injects actual credentials regardless of the environment
variable value.
@y
When building custom templates or installing agents manually in a shell
sandbox, some agents require environment variables like `OPENAI_API_KEY` to be
set before they start. Set these to placeholder values (e.g. `proxy-managed`)
if needed. The proxy injects actual credentials regardless of the environment
variable value.
@z
