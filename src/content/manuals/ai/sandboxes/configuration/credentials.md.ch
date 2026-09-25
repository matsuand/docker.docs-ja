%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Manage credentials
linkTitle: Credentials
@y
title: Manage credentials
linkTitle: Credentials
@z

@x
description: How Docker Sandboxes handle API keys and authentication credentials for sandboxed agents.
keywords: docker sandboxes, credentials, api keys, authentication, proxy, ssh agent, secrets
@y
description: How Docker Sandboxes handle API keys and authentication credentials for sandboxed agents.
keywords: docker sandboxes, credentials, api keys, authentication, proxy, ssh agent, secrets
@z

@x
These credential stores and authentication flows apply to local sandboxes.
Cloud credentials require separate setup: see
[Authenticate cloud agents](../cloud/credentials.md).
@y
These credential stores and authentication flows apply to local sandboxes.
Cloud credentials require separate setup: see
[Authenticate cloud agents](../cloud/credentials.md).
@z

@x
Most agents need an API key for their model provider. An HTTP/HTTPS proxy on
your host intercepts outbound requests from the sandbox, looks up the matching
credential on the host, and overwrites the auth header before forwarding. The
real credential stays on the host when proxy management is active; the sandbox
sees only a sentinel value. See
[Trust boundaries](../security/_index.md#trust-boundaries) for how credential isolation
fits into the broader sandbox security model.
@y
Most agents need an API key for their model provider. An HTTP/HTTPS proxy on
your host intercepts outbound requests from the sandbox, looks up the matching
credential on the host, and overwrites the auth header before forwarding. The
real credential stays on the host when proxy management is active; the sandbox
sees only a sentinel value. See
[Trust boundaries](../security/_index.md#trust-boundaries) for how credential isolation
fits into the broader sandbox security model.
@z

@x
## How credential injection works
@y
## How credential injection works
@z

@x
When a sandbox makes an outbound request, the host-side proxy decides three
things: whether the request **matches** a service the kit (or built-in agent)
declares, what **header** to write, and what **value** to inject. The kit
declares the match and the header; you provide the value on the host. For
proxy-managed credentials, the real value never enters the sandbox — the agent
sees only a sentinel like `proxy-managed`.
@y
When a sandbox makes an outbound request, the host-side proxy decides three
things: whether the request **matches** a service the kit (or built-in agent)
declares, what **header** to write, and what **value** to inject. The kit
declares the match and the header; you provide the value on the host. For
proxy-managed credentials, the real value never enters the sandbox — the agent
sees only a sentinel like `proxy-managed`.
@z

@x
A kit can set OAuth `passthrough: true` to opt out of sentinel masking. This
sends the real token response into the sandbox and reduces credential isolation.
See the [`oauth` kit fields](https://github.com/docker/sandbox-kit-spec/blob/main/docs/spec/capabilities/com.docker.sandbox/credential@1.md).
@y
A kit can set OAuth `passthrough: true` to opt out of sentinel masking. This
sends the real token response into the sandbox and reduces credential isolation.
See the [`oauth` kit fields](https://github.com/docker/sandbox-kit-spec/blob/main/docs/spec/capabilities/com.docker.sandbox/credential@1.md).
@z

@x
There are several ways to provide that value. When more than one source has a
value for the same service, the stored secret takes precedence.
@y
There are several ways to provide that value. When more than one source has a
value for the same service, the stored secret takes precedence.
@z

@x
| Form                                                                        | What it is                                                   | Use it when                                                                                                      |
| --------------------------------------------------------------------------- | ------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------- |
| [Stored secrets](#stored-secrets) (`sbx secret set`)                        | A value or dynamic source in your OS keychain, keyed by service | The default for any built-in or kit-declared service                                                          |
| [Custom secrets](#custom-secrets) (`sbx secret set-custom`)                 | A value keyed to a domain and environment variable           | The service model doesn't fit — the agent validates the variable's format, or the secret rides in a request body |
| OAuth                                                                       | A host-side sign-in flow; the token never enters the sandbox | The agent supports it, such as Claude Code, Codex, Cursor, or Droid                                              |
| [Registry credentials](#registry-credentials) (`sbx secret set --registry`) | Authentication for pulling images and kits                   | Pulling templates or kits from a private registry                                                                |
@y
| Form                                                                        | What it is                                                   | Use it when                                                                                                      |
| --------------------------------------------------------------------------- | ------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------- |
| [Stored secrets](#stored-secrets) (`sbx secret set`)                        | A value or dynamic source in your OS keychain, keyed by service | The default for any built-in or kit-declared service                                                          |
| [Custom secrets](#custom-secrets) (`sbx secret set-custom`)                 | A value keyed to a domain and environment variable           | The service model doesn't fit — the agent validates the variable's format, or the secret rides in a request body |
| OAuth                                                                       | A host-side sign-in flow; the token never enters the sandbox | The agent supports it, such as Claude Code, Codex, Cursor, or Droid                                              |
| [Registry credentials](#registry-credentials) (`sbx secret set --registry`) | Authentication for pulling images and kits                   | Pulling templates or kits from a private registry                                                                |
@z

@x
Providing a value and approving its use are separate steps.
[Credential bindings](#credential-bindings) record which mechanisms and domains
you authorize a kit to use. They don't store the credential value.
@y
Providing a value and approving its use are separate steps.
[Credential bindings](#credential-bindings) record which mechanisms and domains
you authorize a kit to use. They don't store the credential value.
@z

@x
For multi-provider agents (OpenCode, Docker Agent), the proxy selects
credentials based on the API endpoint being called. See individual
[agent pages](../agents/) for provider-specific details.
@y
For multi-provider agents (OpenCode, Docker Agent), the proxy selects
credentials based on the API endpoint being called. See individual
[agent pages](../agents/) for provider-specific details.
@z

@x
## Stored secrets
@y
## Stored secrets
@z

@x
`sbx secret set` stores credential values or dynamic secret sources in your OS
keychain, keyed on a service identifier. Built-in agents declare a fixed set of
services. Custom kits can declare their own. The same `sbx secret set` flow
works for both.
@y
`sbx secret set` stores credential values or dynamic secret sources in your OS
keychain, keyed on a service identifier. Built-in agents declare a fixed set of
services. Custom kits can declare their own. The same `sbx secret set` flow
works for both.
@z

@x
Secrets whose names start with `mcp:` are reserved for the host's
[MCP gateway](../mcp-gateway.md). See [MCP secrets](#mcp-secrets) for how
these differ from agent and provider credentials.
@y
Secrets whose names start with `mcp:` are reserved for the host's
[MCP gateway](../mcp-gateway.md). See [MCP secrets](#mcp-secrets) for how
these differ from agent and provider credentials.
@z

@x
### Where secrets are stored
@y
### Where secrets are stored
@z

@x
The store backing `sbx secret set` depends on your operating system:
@y
The store backing `sbx secret set` depends on your operating system:
@z

@x
- macOS: the system Keychain.
- Windows: the Windows Credential Manager.
- Linux: the Secret Service exposed by your desktop keyring, such as GNOME
  Keyring or KDE Wallet.
@y
- macOS: the system Keychain.
- Windows: the Windows Credential Manager.
- Linux: the Secret Service exposed by your desktop keyring, such as GNOME
  Keyring or KDE Wallet.
@z

@x
The Ubuntu package depends on GNOME Keyring, so a standard desktop install
needs no extra setup.
@y
The Ubuntu package depends on GNOME Keyring, so a standard desktop install
needs no extra setup.
@z

@x
On Linux hosts without a running Secret Service — headless servers and some WSL
setups — `sbx` falls back to a file under your user config directory
`$XDG_CONFIG_HOME/com.docker.sandboxes`, which defaults to
`~/.config/com.docker.sandboxes` when `$XDG_CONFIG_HOME` is unset. The fallback
is automatic and needs no configuration. When you store a secret this way,
`sbx` prints a notice:
@y
On Linux hosts without a running Secret Service — headless servers and some WSL
setups — `sbx` falls back to a file under your user config directory
`$XDG_CONFIG_HOME/com.docker.sandboxes`, which defaults to
`~/.config/com.docker.sandboxes` when `$XDG_CONFIG_HOME` is unset. The fallback
is automatic and needs no configuration. When you store a secret this way,
`sbx` prints a notice:
@z

@x
```text
No keychain detected - this secret will be stored on disk, protected by file permissions rather than a password
```
@y
```text
No keychain detected - this secret will be stored on disk, protected by file permissions rather than a password
```
@z

@x
`sbx` stores the file in a directory with `0700` permissions, the same
file-permission model used for `~/.docker/config.json`. Any user or process that
can read the file can retrieve the stored credentials, so treat the directory as
sensitive. Where available, prefer a keychain, which mediates access per
application.
@y
`sbx` stores the file in a directory with `0700` permissions, the same
file-permission model used for `~/.docker/config.json`. Any user or process that
can read the file can retrieve the stored credentials, so treat the directory as
sensitive. Where available, prefer a keychain, which mediates access per
application.
@z

@x
If you start a Secret Service on the host later, `sbx` stores new secrets in the
keychain again. For more on running sandboxes without a desktop keyring, see
[Can I use Docker Sandboxes on headless Linux?](../faq.md#can-i-use-docker-sandboxes-on-headless-linux)
@y
If you start a Secret Service on the host later, `sbx` stores new secrets in the
keychain again. For more on running sandboxes without a desktop keyring, see
[Can I use Docker Sandboxes on headless Linux?](../faq.md#can-i-use-docker-sandboxes-on-headless-linux)
@z

@x
### Store a secret
@y
### Store a secret
@z

@x
```console
$ sbx secret set anthropic
```
@y
```console
$ sbx secret set anthropic
```
@z

@x
This prompts you for the secret value interactively. Service secrets are
global by default, so the secret is available to all sandboxes. To scope a
secret to a specific sandbox instead:
@y
This prompts you for the secret value interactively. Service secrets are
global by default, so the secret is available to all sandboxes. To scope a
secret to a specific sandbox instead:
@z

@x
```console
$ sbx secret set openai --sandbox my-sandbox
```
@y
```console
$ sbx secret set openai --sandbox my-sandbox
```
@z

@x
Adding, updating, or removing a service secret takes effect in existing local
sandboxes without a restart, including secrets configured with `--command` or
`--ref`. Sandbox-scoped secrets take precedence over global secrets.
@y
Adding, updating, or removing a service secret takes effect in existing local
sandboxes without a restart, including secrets configured with `--command` or
`--ref`. Sandbox-scoped secrets take precedence over global secrets.
@z

@x
### MCP secrets
@y
### MCP secrets
@z

@x
The MCP gateway uses the same host credential store for OAuth client secrets
and custom request header secrets. These records have names starting with
`mcp:` and appear in `sbx secret ls`. They stay on the host and aren't injected
into sandboxes. The gateway uses them to authenticate connections to MCP
servers on behalf of sandboxed agents.
@y
The MCP gateway uses the same host credential store for OAuth client secrets
and custom request header secrets. These records have names starting with
`mcp:` and appear in `sbx secret ls`. They stay on the host and aren't injected
into sandboxes. The gateway uses them to authenticate connections to MCP
servers on behalf of sandboxed agents.
@z

@x
For setup instructions, see
[OAuth client secrets](../mcp-gateway.md#use-a-pre-registered-oauth-client) and
[custom request headers](../mcp-gateway.md#custom-request-headers). Header
secrets use the global scope and have their own
[restart requirements](../mcp-gateway.md#manage-header-secrets).
@y
For setup instructions, see
[OAuth client secrets](../mcp-gateway.md#use-a-pre-registered-oauth-client) and
[custom request headers](../mcp-gateway.md#custom-request-headers). Header
secrets use the global scope and have their own
[restart requirements](../mcp-gateway.md#manage-header-secrets).
@z

@x
### Use a dynamic secret source
@y
### Use a dynamic secret source
@z

@x
Dynamic secret sources let `sbx` retrieve a credential from an authenticated
host tool when the proxy needs it. The secret store contains the reference or
command instead of the credential value. Resolution and caching happen on the
host, and the sandbox still receives only the proxy-managed placeholder.
@y
Dynamic secret sources let `sbx` retrieve a credential from an authenticated
host tool when the proxy needs it. The secret store contains the reference or
command instead of the credential value. Resolution and caching happen on the
host, and the sandbox still receives only the proxy-managed placeholder.
@z

@x
Use `--ref` with a 1Password secret reference or an AWS Secrets Manager ARN:
@y
Use `--ref` with a 1Password secret reference or an AWS Secrets Manager ARN:
@z

@x
```console
$ sbx secret set anthropic --ref 'op://Work/Anthropic/credential'
$ sbx secret set openai \
    --ref 'arn:aws:secretsmanager:us-west-2:123456789012:secret:openai-api-key'
```
@y
```console
$ sbx secret set anthropic --ref 'op://Work/Anthropic/credential'
$ sbx secret set openai \
    --ref 'arn:aws:secretsmanager:us-west-2:123456789012:secret:openai-api-key'
```
@z

@x
The corresponding `op` or `aws` CLI must be installed and authenticated on the
host.
@y
The corresponding `op` or `aws` CLI must be installed and authenticated on the
host.
@z

@x
> [!NOTE]
> To resolve a reference with a specific 1Password account or AWS profile, set
> `OP_ACCOUNT` or `AWS_PROFILE` when you run `sbx secret set`. `sbx` uses that
> account or profile whenever it resolves the secret. If neither variable is
> set, the provider CLI uses its default.
@y
> [!NOTE]
> To resolve a reference with a specific 1Password account or AWS profile, set
> `OP_ACCOUNT` or `AWS_PROFILE` when you run `sbx secret set`. `sbx` uses that
> account or profile whenever it resolves the secret. If neither variable is
> set, the provider CLI uses its default.
@z

@x
Use `--command` for another host tool that prints a secret to standard output:
@y
Use `--command` for another host tool that prints a secret to standard output:
@z

@x
```console
$ sbx secret set github --command 'gh auth token'
```
@y
```console
$ sbx secret set github --command 'gh auth token'
```
@z

@x
`sbx` runs the command through the host shell and trims its output. The command
text is stored and replayed by the daemon. Don't embed a secret directly in the
command because the text can appear in shell history and process listings.
@y
`sbx` runs the command through the host shell and trims its output. The command
text is stored and replayed by the daemon. Don't embed a secret directly in the
command because the text can appear in shell history and process listings.
@z

@x
By default, `sbx` verifies the source when you register it and reports an error
without exposing the resolver's standard error. Use `--no-verify` to store a
source that can't be resolved during registration. To troubleshoot an initial
verification failure, use `--show-error`. Provider error output can contain
sensitive information. You can't combine `--show-error` with `--no-verify`.
@y
By default, `sbx` verifies the source when you register it and reports an error
without exposing the resolver's standard error. Use `--no-verify` to store a
source that can't be resolved during registration. To troubleshoot an initial
verification failure, use `--show-error`. Provider error output can contain
sensitive information. You can't combine `--show-error` with `--no-verify`.
@z

@x
Resolved service secrets are cached for 55 minutes by default. To change the
cache duration, use `--refresh <duration>`. To resolve the source for every
credential use instead of caching it, pass `--refresh on-demand`:
@y
Resolved service secrets are cached for 55 minutes by default. To change the
cache duration, use `--refresh <duration>`. To resolve the source for every
credential use instead of caching it, pass `--refresh on-demand`:
@z

@x
```console
$ sbx secret set anthropic \
    --ref 'op://Work/Anthropic/credential' \
    --refresh 30m
$ sbx secret set github --command 'gh auth token' --refresh on-demand
```
@y
```console
$ sbx secret set anthropic \
    --ref 'op://Work/Anthropic/credential' \
    --refresh 30m
$ sbx secret set github --command 'gh auth token' --refresh on-demand
```
@z

@x
`--ref` and `--command` are mutually exclusive. They can't be combined with
`--token`, `--oauth`, or `--registry`.
@y
`--ref` and `--command` are mutually exclusive. They can't be combined with
`--token`, `--oauth`, or `--registry`.
@z

@x
### Import from environment variables
@y
### Import from environment variables
@z

@x
If you already have API keys set in your shell, `sbx secret import` reads them
and stores them in the keychain without typing each value manually:
@y
If you already have API keys set in your shell, `sbx secret import` reads them
and stores them in the keychain without typing each value manually:
@z

@x
```console
$ sbx secret import
```
@y
```console
$ sbx secret import
```
@z

@x
This scans your current session for the environment variables in the
[built-in services table](#built-in-services) below and prompts you to confirm
each one before writing. To import a single service:
@y
This scans your current session for the environment variables in the
[built-in services table](#built-in-services) below and prompts you to confirm
each one before writing. To import a single service:
@z

@x
```console
$ sbx secret import openai
```
@y
```console
$ sbx secret import openai
```
@z

@x
Pass `--all` to import everything without prompting (new entries only; existing
entries are left unchanged), or `--force` to overwrite existing entries:
@y
Pass `--all` to import everything without prompting (new entries only; existing
entries are left unchanged), or `--force` to overwrite existing entries:
@z

@x
```console
$ sbx secret import --all
$ sbx secret import openai --force
```
@y
```console
$ sbx secret import --all
$ sbx secret import openai --force
```
@z

@x
Pass `--dry-run` to preview what would be imported without writing anything.
Run `sbx secret ls` afterwards to confirm what's stored. For setting up
credentials in CI, see [CI and headless use](../workflows/automation.md).
@y
Pass `--dry-run` to preview what would be imported without writing anything.
Run `sbx secret ls` afterwards to confirm what's stored. For setting up
credentials in CI, see [CI and headless use](../workflows/automation.md).
@z

@x
### Built-in services
@y
### Built-in services
@z

@x
Each built-in service name maps to the environment variables `sbx secret import`
reads and the API domains the proxy injects credentials into:
@y
Each built-in service name maps to the environment variables `sbx secret import`
reads and the API domains the proxy injects credentials into:
@z

@x
| Service      | Environment variables              | API domains                                                                                                                   |
| ------------ | ---------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| `anthropic`  | `ANTHROPIC_API_KEY`                | `api.anthropic.com`, `console.anthropic.com`, `claude.ai`, `mcp-proxy.anthropic.com`                                          |
| `cursor`     | `CURSOR_API_KEY`                   | `api2.cursor.sh`, `api3.cursor.sh`, `repo42.cursor.sh`, `cursor.com`                                                          |
| `droid`      | `FACTORY_API_KEY`                  | `api.factory.ai`, `app.factory.ai`, `relay.factory.ai`                                                                        |
| `github`     | `GH_TOKEN`, `GITHUB_TOKEN`         | `api.github.com`, `github.com`, `raw.githubusercontent.com`, `gist.github.com`, `copilot.github.com`, `api.githubcopilot.com` |
| `google`     | `GEMINI_API_KEY`, `GOOGLE_API_KEY` | `generativelanguage.googleapis.com`, `oauth2.googleapis.com`, `aiplatform.googleapis.com`, `vertexai.googleapis.com`          |
| `groq`       | `GROQ_API_KEY`                     | `api.groq.com`                                                                                                                |
| `mistral`    | `MISTRAL_API_KEY`                  | `api.mistral.ai`                                                                                                              |
| `nebius`     | `NEBIUS_API_KEY`                   | `api.studio.nebius.com`, `api.tokenfactory.nebius.com`                                                                        |
| `openai`     | `OPENAI_API_KEY`                   | `api.openai.com`, `openai.com`, `chatgpt.com`, `www.chatgpt.com`                                                              |
| `openrouter` | `OPENROUTER_API_KEY`               | `openrouter.ai`                                                                                                               |
| `xai`        | `XAI_API_KEY`                      | `api.x.ai`                                                                                                                    |
@y
| Service      | Environment variables              | API domains                                                                                                                   |
| ------------ | ---------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| `anthropic`  | `ANTHROPIC_API_KEY`                | `api.anthropic.com`, `console.anthropic.com`, `claude.ai`, `mcp-proxy.anthropic.com`                                          |
| `cursor`     | `CURSOR_API_KEY`                   | `api2.cursor.sh`, `api3.cursor.sh`, `repo42.cursor.sh`, `cursor.com`                                                          |
| `droid`      | `FACTORY_API_KEY`                  | `api.factory.ai`, `app.factory.ai`, `relay.factory.ai`                                                                        |
| `github`     | `GH_TOKEN`, `GITHUB_TOKEN`         | `api.github.com`, `github.com`, `raw.githubusercontent.com`, `gist.github.com`, `copilot.github.com`, `api.githubcopilot.com` |
| `google`     | `GEMINI_API_KEY`, `GOOGLE_API_KEY` | `generativelanguage.googleapis.com`, `oauth2.googleapis.com`, `aiplatform.googleapis.com`, `vertexai.googleapis.com`          |
| `groq`       | `GROQ_API_KEY`                     | `api.groq.com`                                                                                                                |
| `mistral`    | `MISTRAL_API_KEY`                  | `api.mistral.ai`                                                                                                              |
| `nebius`     | `NEBIUS_API_KEY`                   | `api.studio.nebius.com`, `api.tokenfactory.nebius.com`                                                                        |
| `openai`     | `OPENAI_API_KEY`                   | `api.openai.com`, `openai.com`, `chatgpt.com`, `www.chatgpt.com`                                                              |
| `openrouter` | `OPENROUTER_API_KEY`               | `openrouter.ai`                                                                                                               |
| `xai`        | `XAI_API_KEY`                      | `api.x.ai`                                                                                                                    |
@z

@x
When you store a secret with `sbx secret set <service>`, the proxy injects
it into requests to the listed API domains.
@y
When you store a secret with `sbx secret set <service>`, the proxy injects
it into requests to the listed API domains.
@z

@x
### Services declared by kits
@y
### Services declared by kits
@z

@x
Use the service identifier from the kit's documentation when storing its
credential. For a kit that declares `my-service`, run:
@y
Use the service identifier from the kit's documentation when storing its
credential. For a kit that declares `my-service`, run:
@z

@x
```console
$ sbx secret set my-service
```
@y
```console
$ sbx secret set my-service
```
@z

@x
There's no separate registration step. The stored value and the kit's request
use the same identifier. Approve the kit's credential request when prompted.
See [Credential bindings](#credential-bindings).
@y
There's no separate registration step. The stored value and the kit's request
use the same identifier. Approve the kit's credential request when prompted.
See [Credential bindings](#credential-bindings).
@z

@x
When authoring a kit, declare how it uses that service. V3 uses a credential
capability, and v2 uses a top-level `credentials` list. Both examples declare the
service and permit access to its API host:
@y
When authoring a kit, declare how it uses that service. V3 uses a credential
capability, and v2 uses a top-level `credentials` list. Both examples declare the
service and permit access to its API host:
@z

@x
{{< tabs >}}
{{< tab name="v3" >}}
@y
{{< tabs >}}
{{< tab name="v3" >}}
@z

@x
```yaml
capabilities:
  - type: com.docker.sandbox/network-policy@1
    config:
      runtime:
        allow: [api.my-service.com]
  - type: com.docker.sandbox/credential@1
    config:
      service: my-service
      phase: runtime
      apiKey:
        name: MY_SERVICE_TOKEN
        proxyManaged: true
        inject:
          - domain: api.my-service.com
            header: Authorization
            format: "Bearer %s"
```
@y
```yaml
capabilities:
  - type: com.docker.sandbox/network-policy@1
    config:
      runtime:
        allow: [api.my-service.com]
  - type: com.docker.sandbox/credential@1
    config:
      service: my-service
      phase: runtime
      apiKey:
        name: MY_SERVICE_TOKEN
        proxyManaged: true
        inject:
          - domain: api.my-service.com
            header: Authorization
            format: "Bearer %s"
```
@z

@x
For API keys, specify both the HTTP header and its value format, as in this
example. `sbx` doesn't use `apiKey.inject[].scheme` in v3 kits.
@y
For API keys, specify both the HTTP header and its value format, as in this
example. `sbx` doesn't use `apiKey.inject[].scheme` in v3 kits.
@z

@x
For OAuth, use JSON credential files and a provider that returns the refresh
token in `refresh_token`. `sbx` doesn't support TOML credential files or a
different refresh-token field.
@y
For OAuth, use JSON credential files and a provider that returns the refresh
token in `refresh_token`. `sbx` doesn't support TOML credential files or a
different refresh-token field.
@z

@x
Credentials declared for the install phase are available during install hooks.
Add the domains that receive these credentials to the network policy's
`install.allow` list. An entry in `runtime.allow` alone doesn't grant access
during installation. If a hook reads a credential environment variable,
include that name in its `env` list.
@y
Credentials declared for the install phase are available during install hooks.
Add the domains that receive these credentials to the network policy's
`install.allow` list. An entry in `runtime.allow` alone doesn't grant access
during installation. If a hook reads a credential environment variable,
include that name in its `env` list.
@z

@x
In `sbx`, the proxy stops injecting credentials into install-only domains
before the agent launches. A domain remains available for credential injection
if any runtime credential targets it, even under a different service name.
If you declare the same service for both phases, `sbx` uses the runtime
declaration's credential settings in both phases.
@y
In `sbx`, the proxy stops injecting credentials into install-only domains
before the agent launches. A domain remains available for credential injection
if any runtime credential targets it, even under a different service name.
If you declare the same service for both phases, `sbx` uses the runtime
declaration's credential settings in both phases.
@z

@x
{{< /tab >}}
{{< tab name="v2" >}}
@y
{{< /tab >}}
{{< tab name="v2" >}}
@z

@x
```yaml
credentials:
  - service: my-service
    apiKey:
      name: MY_SERVICE_TOKEN
      proxyManaged: true
      inject:
        - domain: api.my-service.com
          scheme: bearer
@y
```yaml
credentials:
  - service: my-service
    apiKey:
      name: MY_SERVICE_TOKEN
      proxyManaged: true
      inject:
        - domain: api.my-service.com
          scheme: bearer
@z

@x
permissions:
  network:
    allow: [api.my-service.com]
```
@y
permissions:
  network:
    allow: [api.my-service.com]
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
Each service declares `apiKey`, `oauth`, or both. When both resolve at runtime,
the API key takes precedence and OAuth acts as the fallback. For complete
kit-side configuration, see
[V3 credential definition](https://github.com/docker/sandbox-kit-spec/blob/main/docs/spec/capabilities/com.docker.sandbox/credential@1.md)
or [V2 credentials](../customize/kits-v2.md#credentials).
@y
Each service declares `apiKey`, `oauth`, or both. When both resolve at runtime,
the API key takes precedence and OAuth acts as the fallback. For complete
kit-side configuration, see
[V3 credential definition](https://github.com/docker/sandbox-kit-spec/blob/main/docs/spec/capabilities/com.docker.sandbox/credential@1.md)
or [V2 credentials](../customize/kits-v2.md#credentials).
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
SCOPE      TYPE      NAME      SECRET
(global)   service   github    gho_GCaw4o****...****43qy
```
@y
```console
$ sbx secret ls
SCOPE      TYPE      NAME      SECRET
(global)   service   github    gho_GCaw4o****...****43qy
```
@z

@x
Remove a secret:
@y
Remove a secret:
@z

@x
```console
$ sbx secret rm github
```
@y
```console
$ sbx secret rm github
```
@z

@x
To remove a sandbox-scoped secret, pass `--sandbox`:
@y
To remove a sandbox-scoped secret, pass `--sandbox`:
@z

@x
```console
$ sbx secret rm github --sandbox my-sandbox
```
@y
```console
$ sbx secret rm github --sandbox my-sandbox
```
@z

@x
Removing a sandbox-scoped secret restores the global secret for that service,
if one is available.
@y
Removing a sandbox-scoped secret restores the global secret for that service,
if one is available.
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
sandbox. Resolve your existing GitHub CLI token on the host:
@y
The `github` service gives the agent access to the `gh` CLI inside the
sandbox. Resolve your existing GitHub CLI token on the host:
@z

@x
```console
$ sbx secret set github --command 'gh auth token'
```
@y
```console
$ sbx secret set github --command 'gh auth token'
```
@z

@x
The daemon refreshes the token from the host command after the default cache
period. This is useful for agents that create pull requests, open issues, or
interact with GitHub APIs on your behalf.
@y
The daemon refreshes the token from the host command after the default cache
period. This is useful for agents that create pull requests, open issues, or
interact with GitHub APIs on your behalf.
@z

@x
### SSH agent
@y
### SSH agent
@z

@x
SSH agent forwarding is enabled by default. When `SSH_AUTH_SOCK` is set,
Docker Sandboxes uses the value from the client that creates, starts, or joins
each sandbox. It forwards that agent into the sandbox and sets `SSH_AUTH_SOCK`
there.
@y
SSH agent forwarding is enabled by default. When `SSH_AUTH_SOCK` is set,
Docker Sandboxes uses the value from the client that creates, starts, or joins
each sandbox. It forwards that agent into the sandbox and sets `SSH_AUTH_SOCK`
there.
@z

@x
If your agent exposes a stable socket path, such as the 1Password SSH agent,
configure that path for every sandbox:
@y
If your agent exposes a stable socket path, such as the 1Password SSH agent,
configure that path for every sandbox:
@z

@x
```console
$ sbx settings set ssh.agentSocketPath "$SSH_AUTH_SOCK"
```
@y
```console
$ sbx settings set ssh.agentSocketPath "$SSH_AUTH_SOCK"
```
@z

@x
An empty [`ssh.agentSocketPath`](settings.md#sshagentsocketpath), which is the
default, uses each client's current `SSH_AUTH_SOCK` instead. Use
[`ssh.agentForwardingEnabled`](settings.md#sshagentforwardingenabled) to turn
forwarding on or off.
@y
An empty [`ssh.agentSocketPath`](settings.md#sshagentsocketpath), which is the
default, uses each client's current `SSH_AUTH_SOCK` instead. Use
[`ssh.agentForwardingEnabled`](settings.md#sshagentforwardingenabled) to turn
forwarding on or off.
@z

@x
After changing forwarding or the socket selection, restart the daemon so
existing sandboxes use the new configuration:
@y
After changing forwarding or the socket selection, restart the daemon so
existing sandboxes use the new configuration:
@z

@x
```console
$ sbx daemon restart
```
@y
```console
$ sbx daemon restart
```
@z

@x
The private keys stay on your host. Processes inside the sandbox can request
signatures from the forwarded agent, but they can't read or copy a private key.
@y
The private keys stay on your host. Processes inside the sandbox can request
signatures from the forwarded agent, but they can't read or copy a private key.
@z

@x
Use SSH agent forwarding for Git operations over SSH and SSH-based commit
signing. The signing key must be loaded in the host SSH agent for sandboxed
commit signing to work. Outbound SSH connections are still subject to sandbox
network policy. For details, see
[Commit signing](../workflows/git.md#commit-signing).
@y
Use SSH agent forwarding for Git operations over SSH and SSH-based commit
signing. The signing key must be loaded in the host SSH agent for sandboxed
commit signing to work. Outbound SSH connections are still subject to sandbox
network policy. For details, see
[Commit signing](../workflows/git.md#commit-signing).
@z

@x
## Custom secrets
@y
## Custom secrets
@z

@x
> [!IMPORTANT]
> Custom secrets are experimental. Behavior, flags, and the placeholder format may
> change without notice.
@y
> [!IMPORTANT]
> Custom secrets are experimental. Behavior, flags, and the placeholder format may
> change without notice.
@z

@x
For credentials that don't fit the service-identifier model — for example,
when an agent validates the environment variable format at boot, or when the
credential lands in a request body rather than a header — use
`sbx secret set-custom`. The secret is keyed on one or more target domains, an
environment variable name, and an optional placeholder string, instead of a
service identifier.
@y
For credentials that don't fit the service-identifier model — for example,
when an agent validates the environment variable format at boot, or when the
credential lands in a request body rather than a header — use
`sbx secret set-custom`. The secret is keyed on one or more target domains, an
environment variable name, and an optional placeholder string, instead of a
service identifier.
@z

@x
Prefer the [service-based flow](#stored-secrets) whenever it's an option —
the kit handles the wiring; you only provide the value.
@y
Prefer the [service-based flow](#stored-secrets) whenever it's an option —
the kit handles the wiring; you only provide the value.
@z

@x
### Set a custom secret
@y
### Set a custom secret
@z

@x
Custom secrets are global by default. Pass `--sandbox` to scope one to a
specific sandbox.
@y
Custom secrets are global by default. Pass `--sandbox` to scope one to a
specific sandbox.
@z

@x
```console
$ sbx secret set-custom \
    --host api.example.com \
    --env API_KEY \
    --value <secret>
```
@y
```console
$ sbx secret set-custom \
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
`sbx-cs-<rand>`). When a sandboxed process sends a request to any of the
configured hosts and the placeholder appears anywhere in the request, the
proxy replaces it with the real value. The agent never sees the real secret.
@y
Inside the sandbox, `API_KEY` is set to a generated placeholder (for example,
`sbx-cs-<rand>`). When a sandboxed process sends a request to any of the
configured hosts and the placeholder appears anywhere in the request, the
proxy replaces it with the real value. The agent never sees the real secret.
@z

@x
### Target multiple hosts
@y
### Target multiple hosts
@z

@x
Repeat `--host` to cover multiple domains with the same secret — useful when
an API is split across related hostnames or when two unrelated endpoints share
a credential:
@y
Repeat `--host` to cover multiple domains with the same secret — useful when
an API is split across related hostnames or when two unrelated endpoints share
a credential:
@z

@x
```console
$ sbx secret set-custom \
    --host api.example.com \
    --host uploads.example.com \
    --env API_KEY \
    --value <secret>
```
@y
```console
$ sbx secret set-custom \
    --host api.example.com \
    --host uploads.example.com \
    --env API_KEY \
    --value <secret>
```
@z

@x
A `--host` value can also use wildcards, with the same syntax as
[network rules](../governance/concepts.md#network-rules): `*` matches a
single label (`*.example.com` covers `api.example.com`) and `**` matches any
number (`**.example.com` covers `api.example.com` and `v2.api.example.com`).
@y
A `--host` value can also use wildcards, with the same syntax as
[network rules](../governance/concepts.md#network-rules): `*` matches a
single label (`*.example.com` covers `api.example.com`) and `**` matches any
number (`**.example.com` covers `api.example.com` and `v2.api.example.com`).
@z

@x
### Resolve custom secrets dynamically
@y
### Resolve custom secrets dynamically
@z

@x
Custom secrets also accept [dynamic secret sources](#use-a-dynamic-secret-source).
Replace `--value` with either `--ref` or `--command`:
@y
Custom secrets also accept [dynamic secret sources](#use-a-dynamic-secret-source).
Replace `--value` with either `--ref` or `--command`:
@z

@x
```console
$ sbx secret set-custom \
    --host api.example.com \
    --env API_KEY \
    --ref 'op://Work/Example/credential'
```
@y
```console
$ sbx secret set-custom \
    --host api.example.com \
    --env API_KEY \
    --ref 'op://Work/Example/credential'
```
@z

@x
Dynamic custom secrets resolve on demand by default. Pass `--refresh` with a
duration to cache the resolved value. The verification and error-output flags
work the same as they do for service secrets. `--ref` and `--command` can't be
combined with `--value` or `--token`.
@y
Dynamic custom secrets resolve on demand by default. Pass `--refresh` with a
duration to cache the resolved value. The verification and error-output flags
work the same as they do for service secrets. `--ref` and `--command` can't be
combined with `--value` or `--token`.
@z

@x
### Install npm packages from GitHub Packages
@y
### Install npm packages from GitHub Packages
@z

@x
The built-in `github` service doesn't inject credentials into requests to
`npm.pkg.github.com`. To install private npm packages from GitHub Packages,
add a custom secret for that host.
@y
The built-in `github` service doesn't inject credentials into requests to
`npm.pkg.github.com`. To install private npm packages from GitHub Packages,
add a custom secret for that host.
@z

@x
On the host, authenticate the GitHub CLI with a token that can read the package.
GitHub documents a personal access token (classic) with at least `read:packages`
scope for this use. See
[Authenticating to GitHub Packages](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-npm-registry#authenticating-to-github-packages).
Then register the token source, replacing `my-sandbox` with your sandbox's name:
@y
On the host, authenticate the GitHub CLI with a token that can read the package.
GitHub documents a personal access token (classic) with at least `read:packages`
scope for this use. See
[Authenticating to GitHub Packages](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-npm-registry#authenticating-to-github-packages).
Then register the token source, replacing `my-sandbox` with your sandbox's name:
@z

@x
```console
$ sbx secret set-custom \
    --sandbox my-sandbox \
    --host npm.pkg.github.com \
    --env NODE_AUTH_TOKEN \
    --command 'gh auth token'
```
@y
```console
$ sbx secret set-custom \
    --sandbox my-sandbox \
    --host npm.pkg.github.com \
    --env NODE_AUTH_TOKEN \
    --command 'gh auth token'
```
@z

@x
The command prints a generated placeholder. For an existing sandbox, set
`NODE_AUTH_TOKEN` to that placeholder using `sbx run -e` for an agent session,
or `/etc/sandbox-persistent.sh` for future sessions. See
[Set environment variables](../usage.md#set-environment-variables).
Use the placeholder, not the actual GitHub token.
@y
The command prints a generated placeholder. For an existing sandbox, set
`NODE_AUTH_TOKEN` to that placeholder using `sbx run -e` for an agent session,
or `/etc/sandbox-persistent.sh` for future sessions. See
[Set environment variables](../usage.md#set-environment-variables).
Use the placeholder, not the actual GitHub token.
@z

@x
Inside the sandbox, add the following entries to your project's `.npmrc`,
replacing `@my-org` with the package's scope. Keep `${NODE_AUTH_TOKEN}` literal
so npm reads the environment variable:
@y
Inside the sandbox, add the following entries to your project's `.npmrc`,
replacing `@my-org` with the package's scope. Keep `${NODE_AUTH_TOKEN}` literal
so npm reads the environment variable:
@z

@x
```ini
@my-org:registry=https://npm.pkg.github.com
//npm.pkg.github.com/:_authToken=${NODE_AUTH_TOKEN}
```
@y
```ini
@my-org:registry=https://npm.pkg.github.com
//npm.pkg.github.com/:_authToken=${NODE_AUTH_TOKEN}
```
@z

@x
Install the package inside the sandbox:
@y
Install the package inside the sandbox:
@z

@x
```console
$ npm install @my-org/my-package
```
@y
```console
$ npm install @my-org/my-package
```
@z

@x
Replace `@my-org/my-package` with your package name. npm sends the placeholder
to `npm.pkg.github.com`, and the proxy replaces it with the token retrieved by
`gh auth token` on the host.
@y
Replace `@my-org/my-package` with your package name. npm sends the placeholder
to `npm.pkg.github.com`, and the proxy replaces it with the token retrieved by
`gh auth token` on the host.
@z

@x
## Credential bindings
@y
## Credential bindings
@z

@x
A credential bindings file records which credential mechanisms and domains
you've approved for each service. It lives at
`~/.config/sbx/credentials.yaml`, or `%APPDATA%\sbx\credentials.yaml` on
Windows.
@y
A credential bindings file records which credential mechanisms and domains
you've approved for each service. It lives at
`~/.config/sbx/credentials.yaml`, or `%APPDATA%\sbx\credentials.yaml` on
Windows.
@z

@x
Third-party kits require an approved binding for each credential they use,
regardless of schema version. `sbx` creates one interactively the first time you
run such a kit (see [First-run approval](#first-run-approval)); you can also
write entries by hand. Credentials requested only by the built-in kits shipped
with `sbx` don't need a binding.
@y
Third-party kits require an approved binding for each credential they use,
regardless of schema version. `sbx` creates one interactively the first time you
run such a kit (see [First-run approval](#first-run-approval)); you can also
write entries by hand. Credentials requested only by the built-in kits shipped
with `sbx` don't need a binding.
@z

@x
Each entry under `bindings` is keyed by a
[service identifier](#built-in-services) and approves one or both credential
mechanisms:
@y
Each entry under `bindings` is keyed by a
[service identifier](#built-in-services) and approves one or both credential
mechanisms:
@z

@x
- `apiKey` — approves injecting the service's stored API key. The value comes
  from the [secret store](#stored-secrets) (`sbx secret set <service>`); the
  binding records approval, it doesn't hold or locate the value.
- `oauth` — approves the OAuth flow for the service. You sign in on the host,
  and the proxy handles token refresh and routing. OAuth domains include the
  token endpoint host and any resource hosts declared by the kit.
@y
- `apiKey` — approves injecting the service's stored API key. The value comes
  from the [secret store](#stored-secrets) (`sbx secret set <service>`); the
  binding records approval, it doesn't hold or locate the value.
- `oauth` — approves the OAuth flow for the service. You sign in on the host,
  and the proxy handles token refresh and routing. OAuth domains include the
  token endpoint host and any resource hosts declared by the kit.
@z

@x
Each mechanism takes a `domains` list that records the domains you approved.
`sbx` asks for approval when a kit requests domains that the existing binding
doesn't cover.
@y
Each mechanism takes a `domains` list that records the domains you approved.
`sbx` asks for approval when a kit requests domains that the existing binding
doesn't cover.
@z

@x
```yaml
bindings:
  anthropic:
    apiKey:
      domains: [api.anthropic.com]
  github:
    apiKey:
      domains: [api.github.com, github.com]
```
@y
```yaml
bindings:
  anthropic:
    apiKey:
      domains: [api.anthropic.com]
  github:
    apiKey:
      domains: [api.github.com, github.com]
```
@z

@x
A binding is only an approval record: the presence of `apiKey` or `oauth`
authorizes that mechanism. Declining a credential writes no entry at all.
The real credential isn't stored in this file.
@y
A binding is only an approval record: the presence of `apiKey` or `oauth`
authorizes that mechanism. Declining a credential writes no entry at all.
The real credential isn't stored in this file.
@z

@x
### First-run approval
@y
### First-run approval
@z

@x
When a third-party kit needs a credential that has no binding, `sbx` walks you
through approving one. For an API key, you can use a value already in the secret
store or enter one at the prompt. For OAuth, you approve the sign-in flow. In
both cases, you approve the domains declared by the kit. `sbx` writes the entry
to `credentials.yaml`.
@y
When a third-party kit needs a credential that has no binding, `sbx` walks you
through approving one. For an API key, you can use a value already in the secret
store or enter one at the prompt. For OAuth, you approve the sign-in flow. In
both cases, you approve the domains declared by the kit. `sbx` writes the entry
to `credentials.yaml`.
@z

@x
In non-interactive contexts (CI or `--detached`), there's no one to answer the
prompt. In `sbx`, the sandbox starts with the credential withheld when no
binding exists. For a required credential, `sbx` prints a warning rather than
failing sandbox creation. This is a limitation of `sbx` enforcement: kit authors
shouldn't rely on a required credential being available merely because the
sandbox started.
@y
In non-interactive contexts (CI or `--detached`), there's no one to answer the
prompt. In `sbx`, the sandbox starts with the credential withheld when no
binding exists. For a required credential, `sbx` prints a warning rather than
failing sandbox creation. This is a limitation of `sbx` enforcement: kit authors
shouldn't rely on a required credential being available merely because the
sandbox started.
@z

@x
Pre-create the binding by running the kit interactively once or by writing
`credentials.yaml` directly before running unattended.
@y
Pre-create the binding by running the kit interactively once or by writing
`credentials.yaml` directly before running unattended.
@z

@x
The bindings file gates whether a third-party kit can use a service
credential. The kit's credential injection rules and network permissions still
constrain which requests can carry the credential.
@y
The bindings file gates whether a third-party kit can use a service
credential. The kit's credential injection rules and network permissions still
constrain which requests can carry the credential.
@z

@x
### Kits that require a binding
@y
### Kits that require a binding
@z

@x
Third-party kits require your approval to use credentials, regardless of
schema version. The built-in kits shipped with `sbx` can use credentials they
request without a binding. If a third-party v2 kit extends a built-in agent,
you must approve its use of the inherited credentials. You must also approve
a third-party kit that requests the same service itself.
@y
Third-party kits require your approval to use credentials, regardless of
schema version. The built-in kits shipped with `sbx` can use credentials they
request without a binding. If a third-party v2 kit extends a built-in agent,
you must approve its use of the inherited credentials. You must also approve
a third-party kit that requests the same service itself.
@z

@x
## Registry credentials
@y
## Registry credentials
@z

@x
Registry credentials authenticate to private OCI registries when pulling
[templates](../usage.md#load-a-template) or [kits](/manuals/ai/sandboxes/customize/_index.md), and can
also let the agent pull and push images from inside the sandbox through the
host-side proxy. Use `sbx secret set --registry <host>` to store them. For
Docker Hub, `sbx` reuses your `sbx login` session — no registry secret needed.
For other registries (GitHub Container Registry, ECR, ACR, self-hosted Nexus,
and so on), store credentials with `sbx secret set --registry`.
@y
Registry credentials authenticate to private OCI registries when pulling
[templates](../usage.md#load-a-template) or [kits](manuals/ai/sandboxes/customize/_index.md), and can
also let the agent pull and push images from inside the sandbox through the
host-side proxy. Use `sbx secret set --registry <host>` to store them. For
Docker Hub, `sbx` reuses your `sbx login` session — no registry secret needed.
For other registries (GitHub Container Registry, ECR, ACR, self-hosted Nexus,
and so on), store credentials with `sbx secret set --registry`.
@z

@x
Choose the scope by adding `--all-sandboxes`, adding `--sandbox SANDBOX`, or
passing neither:
@y
Choose the scope by adding `--all-sandboxes`, adding `--sandbox SANDBOX`, or
passing neither:
@z

@x
```text
sbx secret set [--all-sandboxes | --sandbox SANDBOX] --registry HOST
```
@y
```text
sbx secret set [--all-sandboxes | --sandbox SANDBOX] --registry HOST
```
@z

@x
- **Host-only** (no scope flag): the `sbx` CLI uses it to pull templates
  and kits when creating a sandbox. The credential stays on the host and is
  never available inside the sandbox.
- **All sandboxes** (`--all-sandboxes`): same as host-only, plus the proxy
  authenticates registry login requests from sandboxes. The credential stays
  on the host and is never written to the sandbox filesystem. Use it when
  agents build and publish container images.
- **Sandbox-scoped** (`--sandbox SANDBOX`): same proxy behavior as
  `--all-sandboxes`, but only for the named sandbox. Use it when only one
  sandbox needs registry access.
@y
- **Host-only** (no scope flag): the `sbx` CLI uses it to pull templates
  and kits when creating a sandbox. The credential stays on the host and is
  never available inside the sandbox.
- **All sandboxes** (`--all-sandboxes`): same as host-only, plus the proxy
  authenticates registry login requests from sandboxes. The credential stays
  on the host and is never written to the sandbox filesystem. Use it when
  agents build and publish container images.
- **Sandbox-scoped** (`--sandbox SANDBOX`): same proxy behavior as
  `--all-sandboxes`, but only for the named sandbox. Use it when only one
  sandbox needs registry access.
@z

@x
### Store registry credentials
@y
### Store registry credentials
@z

@x
Pipe a token from stdin and target the registry hostname:
@y
Pipe a token from stdin and target the registry hostname:
@z

@x
```console
$ gh auth token | sbx secret set --registry ghcr.io --password-stdin
```
@y
```console
$ gh auth token | sbx secret set --registry ghcr.io --password-stdin
```
@z

@x
For registries that require a username (for example, ACR with an admin
account), add `--username`:
@y
For registries that require a username (for example, ACR with an admin
account), add `--username`:
@z

@x
```console
$ echo "$ACR_PASSWORD" | sbx secret set \
    --registry myregistry.azurecr.io \
    --username myuser \
    --password-stdin
```
@y
```console
$ echo "$ACR_PASSWORD" | sbx secret set \
    --registry myregistry.azurecr.io \
    --username myuser \
    --password-stdin
```
@z

@x
Add `--all-sandboxes` to make the credential available to every new sandbox:
@y
Add `--all-sandboxes` to make the credential available to every new sandbox:
@z

@x
```console
$ gh auth token | sbx secret set --all-sandboxes --registry ghcr.io --password-stdin
$ sbx run claude
```
@y
```console
$ gh auth token | sbx secret set --all-sandboxes --registry ghcr.io --password-stdin
$ sbx run claude
```
@z

@x
Store all-sandboxes registry credentials before creating a sandbox. Existing
sandboxes don't pick up all-sandboxes registry credentials added later. To add
registry access to an existing sandbox, use a sandbox-scoped credential instead.
@y
Store all-sandboxes registry credentials before creating a sandbox. Existing
sandboxes don't pick up all-sandboxes registry credentials added later. To add
registry access to an existing sandbox, use a sandbox-scoped credential instead.
@z

@x
To scope the credential to a single sandbox, store it under that sandbox's name:
@y
To scope the credential to a single sandbox, store it under that sandbox's name:
@z

@x
```console
$ gh auth token | sbx secret set --sandbox my-app --registry ghcr.io --password-stdin
```
@y
```console
$ gh auth token | sbx secret set --sandbox my-app --registry ghcr.io --password-stdin
```
@z

@x
For v2 kits on Docker Hub, `sbx kit pull` and `sbx kit push` use the session from
`sbx login`. For other registries, both commands use these credentials. Both
commands fall back to the Docker credential store, so credentials from
`docker login` also work. V3 kits are
[published with Docker Buildx](/manuals/ai/sandboxes/customize/author/distribute.md#publish-an-image),
which uses the credentials from `docker login`.
@y
For v2 kits on Docker Hub, `sbx kit pull` and `sbx kit push` use the session from
`sbx login`. For other registries, both commands use these credentials. Both
commands fall back to the Docker credential store, so credentials from
`docker login` also work. V3 kits are
[published with Docker Buildx](manuals/ai/sandboxes/customize/author/distribute.md#publish-an-image),
which uses the credentials from `docker login`.
@z

@x
### Trust a private registry authentication endpoint
@y
### Trust a private registry authentication endpoint
@z

@x
Use `--registry-auth-endpoint` with `--registry` when a self-hosted registry
authenticates sandbox requests through a separate host. For example, a
self-hosted GitLab registry at
`registry.example.com` might advertise `https://gitlab.example.com/jwt/auth`
as the `realm` in its Registry v2 `WWW-Authenticate: Bearer` challenge.
@y
Use `--registry-auth-endpoint` with `--registry` when a self-hosted registry
authenticates sandbox requests through a separate host. For example, a
self-hosted GitLab registry at
`registry.example.com` might advertise `https://gitlab.example.com/jwt/auth`
as the `realm` in its Registry v2 `WWW-Authenticate: Bearer` challenge.
@z

@x
Store the credential and trust that endpoint for a specific sandbox:
@y
Store the credential and trust that endpoint for a specific sandbox:
@z

@x
```console
$ echo "$GITLAB_PAT" | sbx secret set --sandbox my-app \
    --registry registry.example.com \
    --username "$GITLAB_USER" \
    --registry-auth-endpoint https://gitlab.example.com/jwt/auth \
    --password-stdin
```
@y
```console
$ echo "$GITLAB_PAT" | sbx secret set --sandbox my-app \
    --registry registry.example.com \
    --username "$GITLAB_USER" \
    --registry-auth-endpoint https://gitlab.example.com/jwt/auth \
    --password-stdin
```
@z

@x
Replace the example hosts with your registry and authentication hosts, and set
`GITLAB_USER` and `GITLAB_PAT` to your GitLab username and personal access token.
@y
Replace the example hosts with your registry and authentication hosts, and set
`GITLAB_USER` and `GITLAB_PAT` to your GitLab username and personal access token.
@z

@x
This authorizes the proxy to send the stored registry credential to
`https://gitlab.example.com/jwt/auth` to exchange it for a registry token. The
advertised realm must use HTTPS and match the configured host and path exactly.
Other paths on that host, including `/jwt/auth/`, aren't covered. The endpoint
URL must contain no embedded credentials, query string, or fragment. Token
requests can still include protocol parameters such as `service` and `scope`.
@y
This authorizes the proxy to send the stored registry credential to
`https://gitlab.example.com/jwt/auth` to exchange it for a registry token. The
advertised realm must use HTTPS and match the configured host and path exactly.
Other paths on that host, including `/jwt/auth/`, aren't covered. The endpoint
URL must contain no embedded credentials, query string, or fragment. Token
requests can still include protocol parameters such as `service` and `scope`.
@z

@x
Without this flag, the proxy accepts authentication endpoints on the registry's
own host and built-in registry relationships, such as Docker Hub's authentication
host. Other authentication hosts require explicit configuration.
@y
Without this flag, the proxy accepts authentication endpoints on the registry's
own host and built-in registry relationships, such as Docker Hub's authentication
host. Other authentication hosts require explicit configuration.
@z

@x
### Remove registry credentials
@y
### Remove registry credentials
@z

@x
Remove both the host-only and all-sandboxes entries for a registry:
@y
Remove both the host-only and all-sandboxes entries for a registry:
@z

@x
```console
$ sbx secret rm --registry ghcr.io -f
```
@y
```console
$ sbx secret rm --registry ghcr.io -f
```
@z

@x
To remove only the all-sandboxes entry and leave the host-only credential in
place, pass `--all-sandboxes`:
@y
To remove only the all-sandboxes entry and leave the host-only credential in
place, pass `--all-sandboxes`:
@z

@x
```console
$ sbx secret rm --all-sandboxes --registry ghcr.io -f
```
@y
```console
$ sbx secret rm --all-sandboxes --registry ghcr.io -f
```
@z

@x
To remove a sandbox-scoped credential, pass the sandbox name:
@y
To remove a sandbox-scoped credential, pass the sandbox name:
@z

@x
```console
$ sbx secret rm --sandbox my-sandbox --registry ghcr.io -f
```
@y
```console
$ sbx secret rm --sandbox my-sandbox --registry ghcr.io -f
```
@z

@x
## Best practices
@y
## Best practices
@z

@x
- Use [stored secrets](#stored-secrets) to provide credentials. The OS keychain
  protects them at rest; on Linux hosts without a keychain they are held in a
  permission-protected file instead. See
  [Where secrets are stored](#where-secrets-are-stored).
- Don't set API keys manually inside the sandbox. Sandbox agents are
  pre-configured to use proxy-managed credentials.
- Registry credentials stay on the host and are injected by the proxy when a
  sandbox authenticates to the registry. Reserve them for sandboxes that need
  registry access, and prefer sandbox scope over `--all-sandboxes` to limit
  exposure.
- Several agents support OAuth as another secure option: the flow runs on the
  host, so the token is never exposed inside the sandbox. If you haven't stored
  a credential, the agent prompts you to authenticate — Codex prompts on the
  host from `sbx run codex`, while Claude Code, Cursor, and Droid prompt
  interactively inside the sandbox. To authenticate ahead of time, run
  `sbx secret set openai --oauth` for Codex or use `/login` inside Claude
  Code; Cursor and Droid have no ahead-of-time option, so their sign-in prompt
  appears when the agent starts. See the individual [agent pages](../agents/)
  for each agent's flow.
- If you store credentials in 1Password or AWS Secrets Manager, see
  [Sourcing credentials from 1Password](../workflows/authentication.md#source-credentials-from-1password)
  and [Sourcing credentials from AWS Secrets Manager](../workflows/authentication.md#source-credentials-from-aws-secrets-manager).
@y
- Use [stored secrets](#stored-secrets) to provide credentials. The OS keychain
  protects them at rest; on Linux hosts without a keychain they are held in a
  permission-protected file instead. See
  [Where secrets are stored](#where-secrets-are-stored).
- Don't set API keys manually inside the sandbox. Sandbox agents are
  pre-configured to use proxy-managed credentials.
- Registry credentials stay on the host and are injected by the proxy when a
  sandbox authenticates to the registry. Reserve them for sandboxes that need
  registry access, and prefer sandbox scope over `--all-sandboxes` to limit
  exposure.
- Several agents support OAuth as another secure option: the flow runs on the
  host, so the token is never exposed inside the sandbox. If you haven't stored
  a credential, the agent prompts you to authenticate — Codex prompts on the
  host from `sbx run codex`, while Claude Code, Cursor, and Droid prompt
  interactively inside the sandbox. To authenticate ahead of time, run
  `sbx secret set openai --oauth` for Codex or use `/login` inside Claude
  Code; Cursor and Droid have no ahead-of-time option, so their sign-in prompt
  appears when the agent starts. See the individual [agent pages](../agents/)
  for each agent's flow.
- If you store credentials in 1Password or AWS Secrets Manager, see
  [Sourcing credentials from 1Password](../workflows/authentication.md#source-credentials-from-1password)
  and [Sourcing credentials from AWS Secrets Manager](../workflows/authentication.md#source-credentials-from-aws-secrets-manager).
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
