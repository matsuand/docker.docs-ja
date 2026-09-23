%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: MCP gateway
description: Register MCP servers, authorize OAuth-backed servers, and connect MCP tools to Docker Sandboxes.
keywords: docker sandboxes, sbx, MCP gateway, Model Context Protocol, MCP servers, sbx mcp, static MCP, OAuth
@y
title: MCP gateway
description: Register MCP servers, authorize OAuth-backed servers, and connect MCP tools to Docker Sandboxes.
keywords: docker sandboxes, sbx, MCP gateway, Model Context Protocol, MCP servers, sbx mcp, static MCP, OAuth
@z

@x
Docker Sandboxes includes an MCP gateway for connecting agents to Model Context
Protocol servers. The gateway gives the agent inside the sandbox one MCP
endpoint, while `sbx` manages the registered servers, OAuth credentials, and
sandbox lifecycle on the host.
@y
Docker Sandboxes includes an MCP gateway for connecting agents to Model Context
Protocol servers. The gateway gives the agent inside the sandbox one MCP
endpoint, while `sbx` manages the registered servers, OAuth credentials, and
sandbox lifecycle on the host.
@z

@x
This is different from configuring an MCP server directly in an agent such as
Claude Code. Direct MCP setup configures that agent's own MCP client. With
Docker Sandboxes, you register MCP servers once on the host, and the sandbox
gateway exposes them to supported agents inside isolated sandboxes. That
host-managed gateway provides a single path for credentials, explicit server
loading, live updates, and organization governance.
@y
This is different from configuring an MCP server directly in an agent such as
Claude Code. Direct MCP setup configures that agent's own MCP client. With
Docker Sandboxes, you register MCP servers once on the host, and the sandbox
gateway exposes them to supported agents inside isolated sandboxes. That
host-managed gateway provides a single path for credentials, explicit server
loading, live updates, and organization governance.
@z

@x
> [!NOTE]
> The Docker Sandboxes MCP gateway is separate from the Docker Desktop MCP
> Toolkit. You don't need the Docker Desktop MCP Toolkit to use `sbx mcp`, and
> MCP Toolkit server settings aren't shared with Docker Sandboxes.
@y
> [!NOTE]
> The Docker Sandboxes MCP gateway is separate from the Docker Desktop MCP
> Toolkit. You don't need the Docker Desktop MCP Toolkit to use `sbx mcp`, and
> MCP Toolkit server settings aren't shared with Docker Sandboxes.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- Sign in with `sbx login`.
- Use an agent integration that configures MCP at startup: Claude Code, Codex,
  Devin, Gemini, Kiro, or OpenCode.
- For remote servers that require OAuth without Dynamic Client Registration,
  register an OAuth client with the server provider.
- For `--local --url` registrations that resolve to OCI packages, use a host
  with Docker installed and running. Docker is also required for explicit
  `--command docker ...` registrations.
@y
- Sign in with `sbx login`.
- Use an agent integration that configures MCP at startup: Claude Code, Codex,
  Devin, Gemini, Kiro, or OpenCode.
- For remote servers that require OAuth without Dynamic Client Registration,
  register an OAuth client with the server provider.
- For `--local --url` registrations that resolve to OCI packages, use a host
  with Docker installed and running. Docker is also required for explicit
  `--command docker ...` registrations.
@z

@x
## Quick start
@y
## Quick start
@z

@x
Start by registering one MCP server on the host:
@y
Start by registering one MCP server on the host:
@z

@x
```console
$ sbx mcp add notion --url https://mcp.notion.com/mcp
```
@y
```console
$ sbx mcp add notion --url https://mcp.notion.com/mcp
```
@z

@x
If the server requires OAuth, `sbx` opens an authorization flow before it stores
the registration. After registration, verify that the server is registered:
@y
If the server requires OAuth, `sbx` opens an authorization flow before it stores
the registration. After registration, verify that the server is registered:
@z

@x
```console
$ sbx mcp ls
NAME                 TYPE     URL/COMMAND
notion               remote   https://mcp.notion.com/mcp
```
@y
```console
$ sbx mcp ls
NAME                 TYPE     URL/COMMAND
notion               remote   https://mcp.notion.com/mcp
```
@z

@x
Then start a sandbox and expose the registered server:
@y
Then start a sandbox and expose the registered server:
@z

@x
```console
$ sbx run claude --name mcp-demo --static-mcp notion
```
@y
```console
$ sbx run claude --name mcp-demo --static-mcp notion
```
@z

@x
The sandbox starts with an MCP gateway and pre-loads the `notion` server. The
registration remains on the host and can be reused by other sandboxes.
@y
The sandbox starts with an MCP gateway and pre-loads the `notion` server. The
registration remains on the host and can be reused by other sandboxes.
@z

@x
## Register an MCP server
@y
## Register an MCP server
@z

@x
`sbx mcp add` registers an MCP server by name. The registration records the
server definition on the host. It doesn't attach the server to a sandbox by
itself. To expose a registered server to a sandbox, pass it with
[`--static-mcp`](#use-static-mode) when you create the
sandbox, or use [`sbx mcp load`](#add-a-server-to-a-running-sandbox) for a
sandbox that's already running.
@y
`sbx mcp add` registers an MCP server by name. The registration records the
server definition on the host. It doesn't attach the server to a sandbox by
itself. To expose a registered server to a sandbox, pass it with
[`--static-mcp`](#use-static-mode) when you create the
sandbox, or use [`sbx mcp load`](#add-a-server-to-a-running-sandbox) for a
sandbox that's already running.
@z

@x
Server names can contain letters, numbers, dots, hyphens, and underscores.
@y
Server names can contain letters, numbers, dots, hyphens, and underscores.
@z

@x
The `--url` flag can point to different kinds of input. The execution location
depends on what you register:
@y
The `--url` flag can point to different kinds of input. The execution location
depends on what you register:
@z

@x
- A remote endpoint URL identifies a running MCP server. The server runs
  remotely, and the sandbox gateway connects to it.
- A metadata URL with `--local` returns a registry entry, `server.json`, or
  `server.yaml` that describes an OCI-packaged stdio server. `sbx` resolves the
  image and runs it on the host with Docker.
- An explicit command runs on the host as a stdio MCP server.
@y
- A remote endpoint URL identifies a running MCP server. The server runs
  remotely, and the sandbox gateway connects to it.
- A metadata URL with `--local` returns a registry entry, `server.json`, or
  `server.yaml` that describes an OCI-packaged stdio server. `sbx` resolves the
  image and runs it on the host with Docker.
- An explicit command runs on the host as a stdio MCP server.
@z

@x
Local stdio servers run on the host, not inside the sandbox. The agent inside
the sandbox connects only to the MCP gateway.
@y
Local stdio servers run on the host, not inside the sandbox. The agent inside
the sandbox connects only to the MCP gateway.
@z

@x
If a `--url` hostname resolves to a private, loopback, link-local, or cloud
metadata address, `sbx` registers the server but warns you about the resolved
address. Register only URLs you trust. Fetching a manifest from an untrusted
URL can expose internal services or cloud metadata, and DNS rebinding can
redirect a hostname after it has been checked.
@y
If a `--url` hostname resolves to a private, loopback, link-local, or cloud
metadata address, `sbx` registers the server but warns you about the resolved
address. Register only URLs you trust. Fetching a manifest from an untrusted
URL can expose internal services or cloud metadata, and DNS rebinding can
redirect a hostname after it has been checked.
@z

@x
OAuth metadata discovery also warns and continues when it encounters these
addresses, including redirect destinations.
For a trusted internal server, pass `--skip-ssrf-check` to skip both the MCP
URL check and the OAuth metadata discovery checks and suppress their warnings.
Use the flag only when you trust the MCP host, OAuth provider, and all metadata
redirect destinations.
@y
OAuth metadata discovery also warns and continues when it encounters these
addresses, including redirect destinations.
For a trusted internal server, pass `--skip-ssrf-check` to skip both the MCP
URL check and the OAuth metadata discovery checks and suppress their warnings.
Use the flag only when you trust the MCP host, OAuth provider, and all metadata
redirect destinations.
@z

@x
### Remote endpoint URL
@y
### Remote endpoint URL
@z

@x
For a remote MCP endpoint, pass the server URL:
@y
For a remote MCP endpoint, pass the server URL:
@z

@x
```console
$ sbx mcp add notion --url https://mcp.notion.com/mcp
$ sbx mcp add linear --url https://mcp.linear.app/mcp
```
@y
```console
$ sbx mcp add notion --url https://mcp.notion.com/mcp
$ sbx mcp add linear --url https://mcp.linear.app/mcp
```
@z

@x
If requests to a remote server stall, see
[MCP server streams stall](troubleshooting.md#mcp-server-streams-stall).
@y
If requests to a remote server stall, see
[MCP server streams stall](troubleshooting.md#mcp-server-streams-stall).
@z

@x
#### Custom request headers
@y
#### Custom request headers
@z

@x
Use `--header 'Name: value'` to send custom HTTP headers to a remote MCP
endpoint, for example to authenticate with an API key. Repeat the flag for
each header, using each header name once:
@y
Use `--header 'Name: value'` to send custom HTTP headers to a remote MCP
endpoint, for example to authenticate with an API key. Repeat the flag for
each header, using each header name once:
@z

@x
```console
$ sbx mcp add acme --url https://mcp.acme.com/mcp \
  --header 'Authorization: Bearer ${api-key}' \
  --header 'Accept: application/json, text/event-stream'
$ sbx secret set mcp:acme:api-key
```
@y
```console
$ sbx mcp add acme --url https://mcp.acme.com/mcp \
  --header 'Authorization: Bearer ${api-key}' \
  --header 'Accept: application/json, text/event-stream'
$ sbx secret set mcp:acme:api-key
```
@z

@x
Replace the example URL with your MCP endpoint. The `sbx secret set` command
prompts for the API key and stores it in the
[host credential store](configuration/credentials.md#where-secrets-are-stored).
The `${api-key}` placeholder stays in the registration. When a sandbox
connects, the gateway reads the secret and substitutes its value in the header.
Use single quotes around header values so your shell preserves placeholders.
Placeholders name stored secrets, not environment variables: `${api-key}`
reads `mcp:acme:api-key`, regardless of your shell environment.
@y
Replace the example URL with your MCP endpoint. The `sbx secret set` command
prompts for the API key and stores it in the
[host credential store](configuration/credentials.md#where-secrets-are-stored).
The `${api-key}` placeholder stays in the registration. When a sandbox
connects, the gateway reads the secret and substitutes its value in the header.
Use single quotes around header values so your shell preserves placeholders.
Placeholders name stored secrets, not environment variables: `${api-key}`
reads `mcp:acme:api-key`, regardless of your shell environment.
@z

@x
Store each placeholder with `sbx secret set mcp:<server>:<placeholder>`.
Credential headers such as `Authorization` must use a secret placeholder.
An explicit `Authorization` header takes precedence over an OAuth access token.
@y
Store each placeholder with `sbx secret set mcp:<server>:<placeholder>`.
Credential headers such as `Authorization` must use a secret placeholder.
An explicit `Authorization` header takes precedence over an OAuth access token.
@z

@x
After storing the secret, expose the server to a sandbox:
@y
After storing the secret, expose the server to a sandbox:
@z

@x
```console
$ sbx run claude --name acme-demo --static-mcp acme
```
@y
```console
$ sbx run claude --name acme-demo --static-mcp acme
```
@z

@x
Custom headers require a remote HTTP endpoint and can't be used with
`--command` or `--local`. They also require the host to connect to the server.
The hosted gateway rejects these registrations unless you supply
`--oauth-authorization-server`, which routes the connection through the host.
@y
Custom headers require a remote HTTP endpoint and can't be used with
`--command` or `--local`. They also require the host to connect to the server.
The hosted gateway rejects these registrations unless you supply
`--oauth-authorization-server`, which routes the connection through the host.
@z

@x
#### Manage header secrets
@y
#### Manage header secrets
@z

@x
Header secrets use the global scope on the host. Set them with
`sbx secret set mcp:<server>:<placeholder>` without `--sandbox`.
Header secrets require a stored value and don't support `--ref` or `--command`
dynamic sources.
To check the header templates and whether their secrets are set, run
`sbx mcp inspect acme`. The command doesn't display resolved secret values.
@y
Header secrets use the global scope on the host. Set them with
`sbx secret set mcp:<server>:<placeholder>` without `--sandbox`.
Header secrets require a stored value and don't support `--ref` or `--command`
dynamic sources.
To check the header templates and whether their secrets are set, run
`sbx mcp inspect acme`. The command doesn't display resolved secret values.
@z

@x
The secret store also contains an automatically managed `:endpoint` record,
such as `mcp:acme:api-key:endpoint`. This metadata binds the secret to the
registered server's URLs so the gateway can detect an endpoint change before
sending the secret. You don't need to set this record yourself. If you change
the server's endpoint, follow the CLI guidance to set the secret again for
that endpoint.
@y
The secret store also contains an automatically managed `:endpoint` record,
such as `mcp:acme:api-key:endpoint`. This metadata binds the secret to the
registered server's URLs so the gateway can detect an endpoint change before
sending the secret. You don't need to set this record yourself. If you change
the server's endpoint, follow the CLI guidance to set the secret again for
that endpoint.
@z

@x
To rotate a header secret, run `sbx secret set` with the same name. After
setting, changing, or removing a header secret, stop and restart the sandbox
or restart `sandboxd` to apply the change to an existing gateway. An existing
connection keeps its previous value, and a server skipped because its secret
was missing isn't retried automatically.
@y
To rotate a header secret, run `sbx secret set` with the same name. After
setting, changing, or removing a header secret, stop and restart the sandbox
or restart `sandboxd` to apply the change to an existing gateway. An existing
connection keeps its previous value, and a server skipped because its secret
was missing isn't retried automatically.
@z

@x
Removing a registration with `sbx mcp rm` keeps its header secrets and prints
commands to remove them. To remove the example secret:
@y
Removing a registration with `sbx mcp rm` keeps its header secrets and prints
commands to remove them. To remove the example secret:
@z

@x
```console
$ sbx secret rm mcp:acme:api-key
```
@y
```console
$ sbx secret rm mcp:acme:api-key
```
@z

@x
### Local stdio server
@y
### Local stdio server
@z

@x
Some MCP servers communicate over stdio instead of exposing a remote HTTP
endpoint. Use a local stdio server when `sbx` should launch the MCP server on
the host. You can provide a metadata URL or an explicit command.
@y
Some MCP servers communicate over stdio instead of exposing a remote HTTP
endpoint. Use a local stdio server when `sbx` should launch the MCP server on
the host. You can provide a metadata URL or an explicit command.
@z

@x
#### From registry or manifest metadata
@y
#### From registry or manifest metadata
@z

@x
Use `--local --url` when you have an MCP community registry URL or a URL that
returns a `server.json` or `server.yaml` document. The registry entry or
manifest must describe an OCI package that uses stdio transport. `sbx` doesn't
launch non-OCI package types, such as `npm`, from metadata. To use those
servers, register an explicit command.
@y
Use `--local --url` when you have an MCP community registry URL or a URL that
returns a `server.json` or `server.yaml` document. The registry entry or
manifest must describe an OCI package that uses stdio transport. `sbx` doesn't
launch non-OCI package types, such as `npm`, from metadata. To use those
servers, register an explicit command.
@z

@x
This path resolves the image from the metadata and starts it on the host with
Docker, so Docker must be installed and running on the host.
@y
This path resolves the image from the metadata and starts it on the host with
Docker, so Docker must be installed and running on the host.
@z

@x
```console
$ sbx mcp add fetch --local \
  --url https://registry.modelcontextprotocol.io/v0/servers/fetch-mcp/versions/latest
```
@y
```console
$ sbx mcp add fetch --local \
  --url https://registry.modelcontextprotocol.io/v0/servers/fetch-mcp/versions/latest
```
@z

@x
If the entry doesn't publish an OCI stdio package, `sbx` rejects the
registration instead of starting it locally.
@y
If the entry doesn't publish an OCI stdio package, `sbx` rejects the
registration instead of starting it locally.
@z

@x
A server manifest describes the MCP server package and how to start it. It can
be hosted on a GitHub raw URL, internal HTTP server, or CDN.
@y
A server manifest describes the MCP server package and how to start it. It can
be hosted on a GitHub raw URL, internal HTTP server, or CDN.
@z

@x
```console
$ sbx mcp add opine --local --url https://example.com/mcp/opine/server.yaml
```
@y
```console
$ sbx mcp add opine --local --url https://example.com/mcp/opine/server.yaml
```
@z

@x
#### From an explicit command
@y
#### From an explicit command
@z

@x
Use `--command` when you already know the executable and arguments, or when you
need custom Docker flags. The command can be a package runner such as `npx` or
a Docker container command:
@y
Use `--command` when you already know the executable and arguments, or when you
need custom Docker flags. The command can be a package runner such as `npx` or
a Docker container command:
@z

@x
```console
$ sbx mcp add playwright --command npx --args @playwright/mcp@latest
$ sbx mcp add local-image-server --command docker \
  --args "run,-i,--rm,your/image"
```
@y
```console
$ sbx mcp add playwright --command npx --args @playwright/mcp@latest
$ sbx mcp add local-image-server --command docker \
  --args "run,-i,--rm,your/image"
```
@z

@x
To set the working directory for the host process, pass `--dir`. This flag is
only valid with `--command`:
@y
To set the working directory for the host process, pass `--dir`. This flag is
only valid with `--command`:
@z

@x
```console
$ sbx mcp add local-fs --command node --args server.js --dir /srv/data
```
@y
```console
$ sbx mcp add local-fs --command node --args server.js --dir /srv/data
```
@z

@x
Use registry or manifest metadata when you have a published server definition
and don't need to customize `docker run`. Use `--command` for local
development, private servers, or custom container flags.
@y
Use registry or manifest metadata when you have a published server definition
and don't need to customize `docker run`. Use `--command` for local
development, private servers, or custom container flags.
@z

@x
> [!WARNING]
> Local stdio servers run on the host, outside sandbox isolation. If the command
> starts a Docker container, that container uses host Docker isolation, not
> sandbox isolation. The process or container can access host files, host
> network resources, and credentials made available to it. Use trusted commands
> and images, and avoid mounting host paths or passing credentials unless the
> server needs them.
@y
> [!WARNING]
> Local stdio servers run on the host, outside sandbox isolation. If the command
> starts a Docker container, that container uses host Docker isolation, not
> sandbox isolation. The process or container can access host files, host
> network resources, and credentials made available to it. Use trusted commands
> and images, and avoid mounting host paths or passing credentials unless the
> server needs them.
@z

@x
## Authorize OAuth-backed servers
@y
## Authorize OAuth-backed servers
@z

@x
If a registered remote server requires OAuth, `sbx mcp add` starts the
authorization flow by default:
@y
If a registered remote server requires OAuth, `sbx mcp add` starts the
authorization flow by default:
@z

@x
```console
$ sbx mcp add notion --url https://mcp.notion.com/mcp
Resolving MCP server "notion"...
Open this URL to authorize MCP server "notion":
https://api.notion.com/v1/oauth/authorize?...
MCP server "notion" authorized
MCP server "notion" registered (type: remote)
```
@y
```console
$ sbx mcp add notion --url https://mcp.notion.com/mcp
Resolving MCP server "notion"...
Open this URL to authorize MCP server "notion":
https://api.notion.com/v1/oauth/authorize?...
MCP server "notion" authorized
MCP server "notion" registered (type: remote)
```
@z

@x
OAuth credentials stay on the host. In local gateway mode, `sbx` stores tokens
in the host operating system's credential store.
@y
OAuth credentials stay on the host. In local gateway mode, `sbx` stores tokens
in the host operating system's credential store.
@z

@x
To register an OAuth-backed server without authorizing it, pass `--skip-auth`:
@y
To register an OAuth-backed server without authorizing it, pass `--skip-auth`:
@z

@x
```console
$ sbx mcp add notion --url https://mcp.notion.com/mcp --skip-auth
```
@y
```console
$ sbx mcp add notion --url https://mcp.notion.com/mcp --skip-auth
```
@z

@x
### Use a pre-registered OAuth client
@y
### Use a pre-registered OAuth client
@z

@x
In local gateway mode, you can register a remote OAuth server that doesn't
support Dynamic Client Registration. If the server publishes OAuth metadata,
pass the client ID that you registered with the server provider:
@y
In local gateway mode, you can register a remote OAuth server that doesn't
support Dynamic Client Registration. If the server publishes OAuth metadata,
pass the client ID that you registered with the server provider:
@z

@x
```console
$ sbx mcp add slack --url https://slack.example.com/mcp \
  --client-id <CLIENT_ID>
```
@y
```console
$ sbx mcp add slack --url https://slack.example.com/mcp \
  --client-id <CLIENT_ID>
```
@z

@x
If the server doesn't publish OAuth metadata, pass
`--oauth-authorization-server` with the client ID. The flag accepts a local
file path or an HTTP or HTTPS URL to an RFC 8414 authorization server metadata
document. The document must define `authorization_endpoint` and
`token_endpoint`:
@y
If the server doesn't publish OAuth metadata, pass
`--oauth-authorization-server` with the client ID. The flag accepts a local
file path or an HTTP or HTTPS URL to an RFC 8414 authorization server metadata
document. The document must define `authorization_endpoint` and
`token_endpoint`:
@z

@x
```console
$ sbx mcp add serverx --url https://mcp.serverx.example/mcp \
  --oauth-authorization-server ./serverx-authorization-server.json \
  --client-id <CLIENT_ID>
```
@y
```console
$ sbx mcp add serverx --url https://mcp.serverx.example/mcp \
  --oauth-authorization-server ./serverx-authorization-server.json \
  --client-id <CLIENT_ID>
```
@z

@x
These flags are only valid with `--url`.
@y
These flags are only valid with `--url`.
@z

@x
For a confidential OAuth client, store the client secret before registering
the server. There is no `--client-secret` flag:
@y
For a confidential OAuth client, store the client secret before registering
the server. There is no `--client-secret` flag:
@z

@x
```console
$ sbx secret set mcp:slack:client_secret
$ sbx mcp add slack --url https://slack.example.com/mcp \
  --client-id <CLIENT_ID>
```
@y
```console
$ sbx secret set mcp:slack:client_secret
$ sbx mcp add slack --url https://slack.example.com/mcp \
  --client-id <CLIENT_ID>
```
@z

@x
The client secret stays in the host credential store and isn't
written to the MCP registration. If the server requires a confidential client
and no secret is stored, registration succeeds but authorization is skipped.
Store the secret, then run `sbx mcp auth <server>`.
@y
The client secret stays in the host credential store and isn't
written to the MCP registration. If the server requires a confidential client
and no secret is stored, registration succeeds but authorization is skipped.
Store the secret, then run `sbx mcp auth <server>`.
@z

@x
MCP OAuth client secrets use the name `mcp:<server>:client_secret`. The store
also maintains a `mcp:<server>:client_secret:identity` record that binds the
secret to the OAuth client. For secrets stored by a version that used
`mcp:<server>.client_secret`, set the secret again using the colon-separated
name.
@y
MCP OAuth client secrets use the name `mcp:<server>:client_secret`. The store
also maintains a `mcp:<server>:client_secret:identity` record that binds the
secret to the OAuth client. For secrets stored by a version that used
`mcp:<server>.client_secret`, set the secret again using the colon-separated
name.
@z

@x
### Set OAuth scopes
@y
### Set OAuth scopes
@z

@x
Use the repeatable `--scope` flag to record the default scopes requested during
authorization:
@y
Use the repeatable `--scope` flag to record the default scopes requested during
authorization:
@z

@x
```console
$ sbx mcp add serverx --url https://mcp.serverx.example/mcp \
  --scope read --scope write
```
@y
```console
$ sbx mcp add serverx --url https://mcp.serverx.example/mcp \
  --scope read --scope write
```
@z

@x
The `sbx mcp auth` command accepts `--scope` to override the recorded defaults
for one authorization:
@y
The `sbx mcp auth` command accepts `--scope` to override the recorded defaults
for one authorization:
@z

@x
```console
$ sbx mcp auth serverx --scope read
```
@y
```console
$ sbx mcp auth serverx --scope read
```
@z

@x
Unless you pass `--no-scope`, `sbx` requests the first available scope set in
the following order:
@y
Unless you pass `--no-scope`, `sbx` requests the first available scope set in
the following order:
@z

@x
1. Scopes passed to `sbx mcp auth --scope`
2. Default scopes recorded by `sbx mcp add --scope`
3. Scopes that the protected resource says it requires
4. Whichever of `openid`, `email`, `profile`, and `offline_access` the
   authorization server advertises
@y
1. Scopes passed to `sbx mcp auth --scope`
2. Default scopes recorded by `sbx mcp add --scope`
3. Scopes that the protected resource says it requires
4. Whichever of `openid`, `email`, `profile`, and `offline_access` the
   authorization server advertises
@z

@x
If none of these provide a scope set, `sbx` omits the OAuth `scope` parameter so
the authorization server applies its default grant. Other advertised scopes
aren't included in the fallback.
@y
If none of these provide a scope set, `sbx` omits the OAuth `scope` parameter so
the authorization server applies its default grant. Other advertised scopes
aren't included in the fallback.
@z

@x
Pass `--no-scope` to suppress the recorded defaults, resource-required scopes,
and advertised scope fallback for one authorization, without changing the
stored defaults:
@y
Pass `--no-scope` to suppress the recorded defaults, resource-required scopes,
and advertised scope fallback for one authorization, without changing the
stored defaults:
@z

@x
```console
$ sbx mcp auth serverx --no-scope
```
@y
```console
$ sbx mcp auth serverx --no-scope
```
@z

@x
You can't combine `--no-scope` with `--scope`. Scopes you choose are checked
against the authorization server's advertised scopes and the resource's
required scopes. If either source publishes scopes, a scope present in neither
produces a warning but is still requested. The authorization server can still
refuse an advertised scope for a particular
client. For a local authorization flow that requested scopes, `sbx` lists the
requested, advertised, and refused scopes and suggests a retry command. If the
server identifies the refused scopes, the command removes them. Otherwise, it
uses `--no-scope`.
`sbx` never retries automatically.
@y
You can't combine `--no-scope` with `--scope`. Scopes you choose are checked
against the authorization server's advertised scopes and the resource's
required scopes. If either source publishes scopes, a scope present in neither
produces a warning but is still requested. The authorization server can still
refuse an advertised scope for a particular
client. For a local authorization flow that requested scopes, `sbx` lists the
requested, advertised, and refused scopes and suggests a retry command. If the
server identifies the refused scopes, the command removes them. Otherwise, it
uses `--no-scope`.
`sbx` never retries automatically.
@z

@x
For each OAuth-backed remote server exposed to a sandbox, the gateway exposes a
helper tool named `<server>-authorize`, such as `notion-authorize`. The agent can
call the tool to authorize or reauthorize the server. If the server isn't
authorized, the helper is the only tool exposed for that server.
@y
For each OAuth-backed remote server exposed to a sandbox, the gateway exposes a
helper tool named `<server>-authorize`, such as `notion-authorize`. The agent can
call the tool to authorize or reauthorize the server. If the server isn't
authorized, the helper is the only tool exposed for that server.
@z

@x
You can manage OAuth credentials from the host:
@y
You can manage OAuth credentials from the host:
@z

@x
```console
$ sbx mcp auth status notion
$ sbx mcp auth notion
$ sbx mcp auth rm notion
```
@y
```console
$ sbx mcp auth status notion
$ sbx mcp auth notion
$ sbx mcp auth rm notion
```
@z

@x
Use `--all` to apply `auth`, `auth status`, or `auth rm` to all registered
OAuth-backed servers. The `auth status` output reports the scopes granted by the
authorization server, the defaults recorded with `sbx mcp add --scope`, and the
scopes the server supports. It collapses duplicate scope names and highlights
granted scopes that weren't requested or are no longer in the supported set.
Use `--json` for machine-readable output:
@y
Use `--all` to apply `auth`, `auth status`, or `auth rm` to all registered
OAuth-backed servers. The `auth status` output reports the scopes granted by the
authorization server, the defaults recorded with `sbx mcp add --scope`, and the
scopes the server supports. It collapses duplicate scope names and highlights
granted scopes that weren't requested or are no longer in the supported set.
Use `--json` for machine-readable output:
@z

@x
```console
$ sbx mcp auth status notion --json
```
@y
```console
$ sbx mcp auth status notion --json
```
@z

@x
## Choose an MCP mode
@y
## Choose an MCP mode
@z

@x
Every sandbox starts an MCP gateway. When the sandbox starts, supported agent
integrations read the gateway URL and register it with the agent.
@y
Every sandbox starts an MCP gateway. When the sandbox starts, supported agent
integrations read the gateway URL and register it with the agent.
@z

@x
Whether you pass `--static-mcp` when you create the sandbox determines its MCP
mode:
@y
Whether you pass `--static-mcp` when you create the sandbox determines its MCP
mode:
@z

@x
- Static mode pre-loads the specified servers and doesn't expose dynamic
  discovery tools to the agent.
- Dynamic mode pre-loads no servers and lets the agent find and attach
  registered servers.
@y
- Static mode pre-loads the specified servers and doesn't expose dynamic
  discovery tools to the agent.
- Dynamic mode pre-loads no servers and lets the agent find and attach
  registered servers.
@z

@x
This choice persists across sandbox restarts.
@y
This choice persists across sandbox restarts.
@z

@x
### Use static mode
@y
### Use static mode
@z

@x
Pass `--static-mcp` to pre-load registered MCP servers:
@y
Pass `--static-mcp` to pre-load registered MCP servers:
@z

@x
```console
$ sbx mcp add notion --url https://mcp.notion.com/mcp
$ sbx mcp add linear --url https://mcp.linear.app/mcp
$ sbx run claude --name my-session --static-mcp notion,linear
```
@y
```console
$ sbx mcp add notion --url https://mcp.notion.com/mcp
$ sbx mcp add linear --url https://mcp.linear.app/mcp
$ sbx run claude --name my-session --static-mcp notion,linear
```
@z

@x
You can pass `--static-mcp` as a comma-separated list or repeat the flag:
@y
You can pass `--static-mcp` as a comma-separated list or repeat the flag:
@z

@x
```console
$ sbx run claude --name my-session \
  --static-mcp notion --static-mcp linear
```
@y
```console
$ sbx run claude --name my-session \
  --static-mcp notion --static-mcp linear
```
@z

@x
Every name in the static set must already be registered with `sbx mcp add`. The
gateway doesn't expose `mcp-find`, `mcp-add`, or `mcp-config-set` to the agent.
@y
Every name in the static set must already be registered with `sbx mcp add`. The
gateway doesn't expose `mcp-find`, `mcp-add`, or `mcp-config-set` to the agent.
@z

@x
You can't replace the initial set by passing `--static-mcp` when reconnecting to
an existing sandbox. To attach another server from the host, use
[`sbx mcp load`](#add-a-server-to-a-running-sandbox).
@y
You can't replace the initial set by passing `--static-mcp` when reconnecting to
an existing sandbox. To attach another server from the host, use
[`sbx mcp load`](#add-a-server-to-a-running-sandbox).
@z

@x
### Use dynamic mode
@y
### Use dynamic mode
@z

@x
Omit `--static-mcp` to use dynamic mode. The gateway pre-loads no servers and
exposes `mcp-find`, `mcp-add`, and `mcp-config-set` to the agent. The agent can
search the registered server catalog and attach servers during the session.
@y
Omit `--static-mcp` to use dynamic mode. The gateway pre-loads no servers and
exposes `mcp-find`, `mcp-add`, and `mcp-config-set` to the agent. The agent can
search the registered server catalog and attach servers during the session.
@z

@x
If you run `sbx mcp add` after a dynamic sandbox starts, its gateway refreshes
the searchable catalog. The agent can then find and attach the new registration
without restarting. The `sbx mcp add` command doesn't attach the server by
itself.
@y
If you run `sbx mcp add` after a dynamic sandbox starts, its gateway refreshes
the searchable catalog. The agent can then find and attach the new registration
without restarting. The `sbx mcp add` command doesn't attach the server by
itself.
@z

@x
## Add a server to a running sandbox
@y
## Add a server to a running sandbox
@z

@x
To attach an already-registered server to a running sandbox, use
`sbx mcp load`. This works in both static and dynamic modes:
@y
To attach an already-registered server to a running sandbox, use
`sbx mcp load`. This works in both static and dynamic modes:
@z

@x
```console
$ sbx mcp add linear --url https://mcp.linear.app/mcp
$ sbx mcp load linear --sandbox my-session
MCP server "linear" loaded into sandbox "my-session" (live)
```
@y
```console
$ sbx mcp add linear --url https://mcp.linear.app/mcp
$ sbx mcp load linear --sandbox my-session
MCP server "linear" loaded into sandbox "my-session" (live)
```
@z

@x
Connected agent sessions receive a tool-list update, so the added tools become
visible without reconnecting. The loaded server remains attached across sandbox
restarts.
@y
Connected agent sessions receive a tool-list update, so the added tools become
visible without reconnecting. The loaded server remains attached across sandbox
restarts.
@z

@x
## Built-in gateway tools
@y
## Built-in gateway tools
@z

@x
The local MCP gateway exposes a small set of built-in tools. These tools belong
to the gateway itself, not to a registered MCP server. Agents can see and call
them on the same MCP connection as server tools, so they can appear in agent
tool lists, logs, policy decisions, audit logs, or approval prompts.
@y
The local MCP gateway exposes a small set of built-in tools. These tools belong
to the gateway itself, not to a registered MCP server. Agents can see and call
them on the same MCP connection as server tools, so they can appear in agent
tool lists, logs, policy decisions, audit logs, or approval prompts.
@z

@x
You don't need to call these tools directly for normal setup. Use `sbx mcp`
commands to register servers and manage credentials from the host. The tools
matter because agents can call them during a session, and admins can govern
them separately from tools provided by registered MCP servers.
@y
You don't need to call these tools directly for normal setup. Use `sbx mcp`
commands to register servers and manage credentials from the host. The tools
matter because agents can call them during a session, and admins can govern
them separately from tools provided by registered MCP servers.
@z

@x
| Tool                 | Description                                                                                |
| -------------------- | ------------------------------------------------------------------------------------------ |
| `mcp-exec`           | Executes a tool by name through the gateway.                                               |
| `code-mode`          | Creates an ephemeral JavaScript tool that can call selected tools through the MCP gateway. |
| `mcp-find`           | Searches the registered server catalog without changing sandbox state. Dynamic mode only.  |
| `mcp-add`            | Attaches a registered server to the sandbox. Dynamic mode only.                            |
| `mcp-config-set`     | Sets per-session configuration overrides for an attached server. Dynamic mode only.        |
| `<server>-authorize` | Starts or restarts OAuth authorization for an exposed OAuth-backed remote server.          |
@y
| Tool                 | Description                                                                                |
| -------------------- | ------------------------------------------------------------------------------------------ |
| `mcp-exec`           | Executes a tool by name through the gateway.                                               |
| `code-mode`          | Creates an ephemeral JavaScript tool that can call selected tools through the MCP gateway. |
| `mcp-find`           | Searches the registered server catalog without changing sandbox state. Dynamic mode only.  |
| `mcp-add`            | Attaches a registered server to the sandbox. Dynamic mode only.                            |
| `mcp-config-set`     | Sets per-session configuration overrides for an attached server. Dynamic mode only.        |
| `<server>-authorize` | Starts or restarts OAuth authorization for an exposed OAuth-backed remote server.          |
@z

@x
Servers attached with `mcp-add` remain attached across sandbox restarts. The
gateway exposes `<server>-authorize` for OAuth-backed remote servers, even when
they already have a valid token. Local stdio servers don't expose this helper.
If `code-mode` creates a generated tool, the tool is shared by clients connected
to the sandbox's gateway and disappears when the gateway is replaced or stops.
@y
Servers attached with `mcp-add` remain attached across sandbox restarts. The
gateway exposes `<server>-authorize` for OAuth-backed remote servers, even when
they already have a valid token. Local stdio servers don't expose this helper.
If `code-mode` creates a generated tool, the tool is shared by clients connected
to the sandbox's gateway and disappears when the gateway is replaced or stops.
@z

@x
In MCP access policies, built-in gateway tools are `MCP::Primordial` resources
and use the `invokePrimordial` action. Tools from registered MCP servers are
`MCP::Tool` resources and use the `invokeTool` action. For details, see the
[MCP policy reference](governance/reference/mcp-policy.md).
@y
In MCP access policies, built-in gateway tools are `MCP::Primordial` resources
and use the `invokePrimordial` action. Tools from registered MCP servers are
`MCP::Tool` resources and use the `invokeTool` action. For details, see the
[MCP policy reference](governance/reference/mcp-policy.md).
@z

@x
## Manage registrations
@y
## Manage registrations
@z

@x
List registered servers:
@y
List registered servers:
@z

@x
```console
$ sbx mcp ls
```
@y
```console
$ sbx mcp ls
```
@z

@x
Inspect a registered server:
@y
Inspect a registered server:
@z

@x
```console
$ sbx mcp inspect notion
```
@y
```console
$ sbx mcp inspect notion
```
@z

@x
Remove a registered server:
@y
Remove a registered server:
@z

@x
```console
$ sbx mcp rm notion
```
@y
```console
$ sbx mcp rm notion
```
@z

@x
For OAuth-backed servers, `sbx mcp rm` removes the OAuth access token before it
removes the server registration. A client secret for a pre-registered OAuth
client and its identity binding remain in the host credential store so you can
reuse them when you re-add the same client. The command prints the
`sbx secret rm` commands for removing them. To remove only the OAuth access
token, use `sbx mcp auth rm`.
@y
For OAuth-backed servers, `sbx mcp rm` removes the OAuth access token before it
removes the server registration. A client secret for a pre-registered OAuth
client and its identity binding remain in the host credential store so you can
reuse them when you re-add the same client. The command prints the
`sbx secret rm` commands for removing them. To remove only the OAuth access
token, use `sbx mcp auth rm`.
@z

@x
## Governance
@y
## Governance
@z

@x
Organizations with AI Governance can use
[MCP access policies](governance/access-controls/mcp.md) to control MCP server
registration, tool calls, gateway meta-tools, resources, prompts, and approval
requirements. MCP access policies are organization policies written in Cedar.
@y
Organizations with AI Governance can use
[MCP access policies](governance/access-controls/mcp.md) to control MCP server
registration, tool calls, gateway meta-tools, resources, prompts, and approval
requirements. MCP access policies are organization policies written in Cedar.
@z
