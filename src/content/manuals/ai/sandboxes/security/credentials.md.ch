%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Credentials
@y
title: Credentials
@z

@x
description: How Docker Sandboxes handle API keys and authentication credentials for sandboxed agents.
keywords: docker sandboxes, credentials, api keys, authentication, proxy, ssh agent, secrets
@y
description: How Docker Sandboxes handle API keys and authentication credentials for sandboxed agents.
keywords: docker sandboxes, credentials, api keys, authentication, proxy, ssh agent, secrets
@z

@x
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@z

@x
Most agents need an API key for their model provider. An HTTP/HTTPS proxy on
your host intercepts outbound requests from the sandbox, looks up the matching
credential on the host, and overwrites the auth header before forwarding. The
real credential stays on the host; the sandbox sees only a sentinel value. For
the security model behind this, see
[Credential isolation](isolation.md#credential-isolation).
@y
Most agents need an API key for their model provider. An HTTP/HTTPS proxy on
your host intercepts outbound requests from the sandbox, looks up the matching
credential on the host, and overwrites the auth header before forwarding. The
real credential stays on the host; the sandbox sees only a sentinel value. For
the security model behind this, see
[Credential isolation](isolation.md#credential-isolation).
@z

@x
## How credential injection works
@y
## How credential injection works
@z

@x
The proxy needs three things to inject a credential: which outbound traffic to
match, what header to write, and what value to use. The kit (or built-in agent
definition) declares the first two. You provide the value on the host.
@y
The proxy needs three things to inject a credential: which outbound traffic to
match, what header to write, and what value to use. The kit (or built-in agent
definition) declares the first two. You provide the value on the host.
@z

@x
There are two host-side stores, plus a host shell fallback:
@y
There are two host-side stores, plus a host shell fallback:
@z

@x
- Stored secrets, keyed on a service identifier: built-in agents declare
  service identifiers (`anthropic`, `openai`, `github`, etc.) in their kit
  specs; custom kits can declare their own. `sbx secret set` stores a value
  keyed on that identifier. When a sandboxed request matches a service's
  domain, the proxy reads the stored value and writes the configured header.
  Inside the sandbox, the environment variable holds a sentinel like
  `proxy-managed`, so SDKs that read the variable see something non-empty
  without seeing the real secret. See [Stored secrets](#stored-secrets).
@y
- Stored secrets, keyed on a service identifier: built-in agents declare
  service identifiers (`anthropic`, `openai`, `github`, etc.) in their kit
  specs; custom kits can declare their own. `sbx secret set` stores a value
  keyed on that identifier. When a sandboxed request matches a service's
  domain, the proxy reads the stored value and writes the configured header.
  Inside the sandbox, the environment variable holds a sentinel like
  `proxy-managed`, so SDKs that read the variable see something non-empty
  without seeing the real secret. See [Stored secrets](#stored-secrets).
@z

@x
- Stored secrets, keyed on a target domain and environment variable name:
  `sbx secret set-custom` stores a value alongside a target domain, an
  environment variable name, and an optional placeholder. The sandbox sees
  the placeholder; the proxy substitutes it with the real value anywhere it
  appears in outbound traffic to that domain. Use this when the
  service-identifier model doesn't fit — for example, when the agent
  validates the variable format at boot, or when the credential lands in a
  request body. See [Custom secrets](#custom-secrets).
@y
- Stored secrets, keyed on a target domain and environment variable name:
  `sbx secret set-custom` stores a value alongside a target domain, an
  environment variable name, and an optional placeholder. The sandbox sees
  the placeholder; the proxy substitutes it with the real value anywhere it
  appears in outbound traffic to that domain. Use this when the
  service-identifier model doesn't fit — for example, when the agent
  validates the variable format at boot, or when the credential lands in a
  request body. See [Custom secrets](#custom-secrets).
@z

@x
- Host shell environment variables: as a fallback, the proxy reads from your
  shell environment. Useful for one-off testing or development; stored
  secrets are preferred because shell environment variables are plaintext
  and visible to other processes running as your user. See
  [Environment variables](#environment-variables).
@y
- Host shell environment variables: as a fallback, the proxy reads from your
  shell environment. Useful for one-off testing or development; stored
  secrets are preferred because shell environment variables are plaintext
  and visible to other processes running as your user. See
  [Environment variables](#environment-variables).
@z

@x
If both a stored secret and a host environment variable are set for the same
service, the stored secret takes precedence. For multi-provider agents
(OpenCode, Docker Agent), the proxy selects credentials based on the API
endpoint being called. See individual [agent pages](../agents/) for
provider-specific details.
@y
If both a stored secret and a host environment variable are set for the same
service, the stored secret takes precedence. For multi-provider agents
(OpenCode, Docker Agent), the proxy selects credentials based on the API
endpoint being called. See individual [agent pages](../agents/) for
provider-specific details.
@z

@x
## Stored secrets
@y
## Stored secrets
@z

@x
`sbx secret set` stores credentials in your OS keychain, keyed on a service
identifier. Built-in agents declare a fixed set of services. Custom kits can
declare their own. The same `sbx secret set` flow works for both.
@y
`sbx secret set` stores credentials in your OS keychain, keyed on a service
identifier. Built-in agents declare a fixed set of services. Custom kits can
declare their own. The same `sbx secret set` flow works for both.
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
### Built-in services
@y
### Built-in services
@z

@x
Each built-in service name maps to a set of environment variables the proxy
checks and the API domains it authenticates requests to:
@y
Each built-in service name maps to a set of environment variables the proxy
checks and the API domains it authenticates requests to:
@z

@x
| Service     | Environment variables              | API domains                         |
| ----------- | ---------------------------------- | ----------------------------------- |
| `anthropic` | `ANTHROPIC_API_KEY`                | `api.anthropic.com`                 |
| `aws`       | `AWS_ACCESS_KEY_ID`                | AWS Bedrock endpoints               |
| `github`    | `GH_TOKEN`, `GITHUB_TOKEN`         | `api.github.com`, `github.com`      |
| `google`    | `GEMINI_API_KEY`, `GOOGLE_API_KEY` | `generativelanguage.googleapis.com` |
| `groq`      | `GROQ_API_KEY`                     | `api.groq.com`                      |
| `mistral`   | `MISTRAL_API_KEY`                  | `api.mistral.ai`                    |
| `nebius`    | `NEBIUS_API_KEY`                   | `api.studio.nebius.ai`              |
| `openai`    | `OPENAI_API_KEY`                   | `api.openai.com`                    |
| `xai`       | `XAI_API_KEY`                      | `api.x.ai`                          |
@y
| Service     | Environment variables              | API domains                         |
| ----------- | ---------------------------------- | ----------------------------------- |
| `anthropic` | `ANTHROPIC_API_KEY`                | `api.anthropic.com`                 |
| `aws`       | `AWS_ACCESS_KEY_ID`                | AWS Bedrock endpoints               |
| `github`    | `GH_TOKEN`, `GITHUB_TOKEN`         | `api.github.com`, `github.com`      |
| `google`    | `GEMINI_API_KEY`, `GOOGLE_API_KEY` | `generativelanguage.googleapis.com` |
| `groq`      | `GROQ_API_KEY`                     | `api.groq.com`                      |
| `mistral`   | `MISTRAL_API_KEY`                  | `api.mistral.ai`                    |
| `nebius`    | `NEBIUS_API_KEY`                   | `api.studio.nebius.ai`              |
| `openai`    | `OPENAI_API_KEY`                   | `api.openai.com`                    |
| `xai`       | `XAI_API_KEY`                      | `api.x.ai`                          |
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
### Services declared by kits
@y
### Services declared by kits
@z

@x
Custom kits can declare their own service identifiers in `spec.yaml` —
they're not limited to the table above. To provide a credential for a
kit-declared service, run `sbx secret set` with the same identifier the kit
declares under `credentials.sources`:
@y
Custom kits can declare their own service identifiers in `spec.yaml` —
they're not limited to the table above. To provide a credential for a
kit-declared service, run `sbx secret set` with the same identifier the kit
declares under `credentials.sources`:
@z

@x
```console
$ sbx secret set -g my-service
```
@y
```console
$ sbx secret set -g my-service
```
@z

@x
There's no separate registration step; the keychain entry is keyed on the
identifier the kit already uses. See
[Authenticate to external services](../customize/kits.md#authenticate-to-external-services)
for the kit-side wiring.
@y
There's no separate registration step; the keychain entry is keyed on the
identifier the kit already uses. See
[Authenticate to external services](../customize/kits.md#authenticate-to-external-services)
for the kit-side wiring.
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
### SSH agent
@y
### SSH agent
@z

@x
If your host has an SSH agent and `SSH_AUTH_SOCK` is set, Docker Sandboxes
forwards the agent into the sandbox and sets `SSH_AUTH_SOCK` there. The
private keys stay on your host. Processes inside the sandbox can request
signatures from the forwarded agent, but they can't read or copy the private
key.
@y
If your host has an SSH agent and `SSH_AUTH_SOCK` is set, Docker Sandboxes
forwards the agent into the sandbox and sets `SSH_AUTH_SOCK` there. The
private keys stay on your host. Processes inside the sandbox can request
signatures from the forwarded agent, but they can't read or copy the private
key.
@z

@x
Use SSH agent forwarding for Git operations over SSH and SSH-based commit
signing. The signing key must be loaded in the host SSH agent for sandboxed
commit signing to work. Outbound SSH connections are still subject to sandbox
network policy. For details, see
[Signed commits](../usage.md#signed-commits).
@y
Use SSH agent forwarding for Git operations over SSH and SSH-based commit
signing. The signing key must be loaded in the host SSH agent for sandboxed
commit signing to work. Outbound SSH connections are still subject to sandbox
network policy. For details, see
[Signed commits](../usage.md#signed-commits).
@z

@x
## Custom secrets
@y
## Custom secrets
@z

@x
> [!IMPORTANT]
> Custom secrets are experimental. The `set-custom` command is hidden
> from `sbx --help`, and behavior, flags, and the placeholder format may
> change.
@y
> [!IMPORTANT]
> Custom secrets are experimental. The `set-custom` command is hidden
> from `sbx --help`, and behavior, flags, and the placeholder format may
> change.
@z

@x
For credentials that don't fit the service-identifier model — for example,
when an agent validates the environment variable format at boot, or when the
credential lands in a request body rather than a header — use
`sbx secret set-custom`. The secret is keyed on a target domain, an
environment variable name, and an optional placeholder string, instead of a
service identifier.
@y
For credentials that don't fit the service-identifier model — for example,
when an agent validates the environment variable format at boot, or when the
credential lands in a request body rather than a header — use
`sbx secret set-custom`. The secret is keyed on a target domain, an
environment variable name, and an optional placeholder string, instead of a
service identifier.
@z

@x
```console
$ sbx secret set-custom -g \
    --host api.example.com \
    --env API_KEY \
    --value <secret>
```
@y
```console
$ sbx secret set-custom -g \
    --host api.example.com \
    --env API_KEY \
    --value <secret>
```
@z

@x
> [!WARNING]
> Passing the secret as `--value <secret>` records it in your shell history
> and exposes it to other processes running as your user. Avoid pasting
> real credentials inline — read the value from a variable that's already
> in your environment, and clear shell history if a real secret was passed
> on the command line.
@y
> [!WARNING]
> Passing the secret as `--value <secret>` records it in your shell history
> and exposes it to other processes running as your user. Avoid pasting
> real credentials inline — read the value from a variable that's already
> in your environment, and clear shell history if a real secret was passed
> on the command line.
@z

@x
Inside the sandbox, `API_KEY` is set to a generated placeholder (for example,
`sbx-cs-<rand>`). When a sandboxed process sends a request to
`api.example.com` and the placeholder appears anywhere in the request, the
proxy replaces it with the real value. The agent never sees the real secret.
@y
Inside the sandbox, `API_KEY` is set to a generated placeholder (for example,
`sbx-cs-<rand>`). When a sandboxed process sends a request to
`api.example.com` and the placeholder appears anywhere in the request, the
proxy replaces it with the real value. The agent never sees the real secret.
@z

@x
Prefer the [service-based flow](#stored-secrets) whenever it's an option —
the kit handles the wiring; you only provide the value.
@y
Prefer the [service-based flow](#stored-secrets) whenever it's an option —
the kit handles the wiring; you only provide the value.
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
> [built-in service](#built-in-services), see
> [Setting custom environment variables](../faq.md#how-do-i-set-custom-environment-variables-inside-a-sandbox).
@y
> [!NOTE]
> These environment variables are set on your host, not inside the sandbox.
> Sandbox agents are pre-configured to use credentials managed by the
> host-side proxy. For custom environment variables not tied to a
> [built-in service](#built-in-services), see
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
