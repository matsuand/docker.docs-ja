%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Remote MCP Servers"
description: "Connect Docker Agent to cloud services via remote MCP servers with built-in OAuth authentication."
keywords: docker agent, ai agents, features, remote mcp servers
@y
title: "Remote MCP Servers"
description: "Connect Docker Agent to cloud services via remote MCP servers with built-in OAuth authentication."
keywords: docker agent, ai agents, features, remote mcp servers
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/features/remote-mcp/
@y
canonical: __SUBDIR__/ai/docker-agent/features/remote-mcp/
@z

@x
_Connect Docker Agent to cloud services via remote MCP servers with built-in OAuth authentication._
@y
_Connect Docker Agent to cloud services via remote MCP servers with built-in OAuth authentication._
@z

@x
## Overview
@y
## Overview
@z

@x
Docker Agent supports connecting to remote MCP servers over **Streamable HTTP**, **SSE** (Server-Sent Events), and **Unix domain sockets**. Streamable HTTP is the current recommended transport for most hosted MCP servers. Many popular services offer MCP endpoints with OAuth — Docker Agent handles the authentication flow automatically.
@y
Docker Agent supports connecting to remote MCP servers over **Streamable HTTP**, **SSE** (Server-Sent Events), and **Unix domain sockets**. Streamable HTTP is the current recommended transport for most hosted MCP servers. Many popular services offer MCP endpoints with OAuth — Docker Agent handles the authentication flow automatically.
@z

@x
```yaml
toolsets:
  - type: mcp
    remote:
      url: "https://mcp.linear.app/mcp"
      transport_type: "streamable"
```
@y
```yaml
toolsets:
  - type: mcp
    remote:
      url: "https://mcp.linear.app/mcp"
      transport_type: "streamable"
```
@z

@x
## Unix Domain Sockets
@y
## Unix Domain Sockets
@z

@x
Use a `unix://` URL to connect to an MCP server listening on a local Unix socket. This is useful when running Docker Agent inside a container and exposing an MCP server from the host via a bind-mounted socket:
@y
Use a `unix://` URL to connect to an MCP server listening on a local Unix socket. This is useful when running Docker Agent inside a container and exposing an MCP server from the host via a bind-mounted socket:
@z

@x
```yaml
toolsets:
  - type: mcp
    remote:
      url: "unix:///tmp/mcp-notify.sock"
      transport_type: "streamable"
```
@y
```yaml
toolsets:
  - type: mcp
    remote:
      url: "unix:///tmp/mcp-notify.sock"
      transport_type: "streamable"
```
@z

@x
The path after `unix://` is the absolute path to the socket file. Configured `headers` are forwarded over the socket connection. OAuth discovery is not supported for Unix socket URLs.
@y
The path after `unix://` is the absolute path to the socket file. Configured `headers` are forwarded over the socket connection. OAuth discovery is not supported for Unix socket URLs.
@z

@x
> [!TIP]
> **OAuth flow**
>
> When you connect to a remote MCP server that requires OAuth, Docker Agent opens your browser automatically for authentication. Tokens are cached for subsequent sessions.
@y
> [!TIP]
> **OAuth flow**
>
> When you connect to a remote MCP server that requires OAuth, Docker Agent opens your browser automatically for authentication. Tokens are cached for subsequent sessions.
@z

@x
> [!TIP]
> **Cancelling the authorization dialog**
>
> If you dismiss the OAuth authorization dialog, the request is cancelled cleanly — no repeated prompts appear. The agent will report that authorization was declined. To try again, simply re-enable the server or repeat the request that triggered the flow.
@y
> [!TIP]
> **Cancelling the authorization dialog**
>
> If you dismiss the OAuth authorization dialog, the request is cancelled cleanly — no repeated prompts appear. The agent will report that authorization was declined. To try again, simply re-enable the server or repeat the request that triggered the flow.
@z

@x
## Configuration
@y
## Configuration
@z

@x
```yaml
toolsets:
  - type: mcp
    remote:
      url: "https://mcp.example.com/mcp"
      transport_type: "streamable" # or "sse" for legacy servers
      headers:
        Authorization: "Bearer ${env.MY_TOKEN}" # resolved per request
    # Optional: use only for trusted internal/private MCP or OAuth endpoints.
    allow_private_ips: true
```
@y
```yaml
toolsets:
  - type: mcp
    remote:
      url: "https://mcp.example.com/mcp"
      transport_type: "streamable" # or "sse" for legacy servers
      headers:
        Authorization: "Bearer ${env.MY_TOKEN}" # resolved per request
    # Optional: use only for trusted internal/private MCP or OAuth endpoints.
    allow_private_ips: true
```
@z

@x
For full configuration details, see the [Tool Config](../../configuration/tools/index.md) page.
@y
For full configuration details, see the [Tool Config](../../configuration/tools/index.md) page.
@z

@x
Set `allow_private_ips: true` on a remote MCP toolset only when the MCP server or its OAuth registration/token endpoints intentionally resolve to private, loopback, or link-local addresses. The default blocks those OAuth helper requests to reduce SSRF risk.
@y
Set `allow_private_ips: true` on a remote MCP toolset only when the MCP server or its OAuth registration/token endpoints intentionally resolve to private, loopback, or link-local addresses. The default blocks those OAuth helper requests to reduce SSRF risk.
@z

@x
> [!NOTE]
> **Headers forwarded during OAuth discovery**
>
> Configured `headers` are forwarded to OAuth protected-resource-metadata discovery requests directed at the MCP server's own host — not to third-party authorization servers. This allows services like Grafana Cloud that require a routing header (e.g. `X-Grafana-URL`) on the discovery request to scope the OAuth flow correctly. Headers are never sent to a different host than the one in `remote.url`.
@y
> [!NOTE]
> **Headers forwarded during OAuth discovery**
>
> Configured `headers` are forwarded to OAuth protected-resource-metadata discovery requests directed at the MCP server's own host — not to third-party authorization servers. This allows services like Grafana Cloud that require a routing header (e.g. `X-Grafana-URL`) on the discovery request to scope the OAuth flow correctly. Headers are never sent to a different host than the one in `remote.url`.
@z

@x
> [!NOTE]
> **Per-request header template expansion**
>
> Header values in `remote.headers` support `${env.VAR}` and `${headers.NAME}` placeholders. Both are resolved on every outbound HTTP request (not just once at initialization), so short-lived credentials and forwarded caller headers always reflect the latest values:
>
> - `${env.VAR}` — reads the named environment variable. Useful for credentials stored in a secret manager that rotates them in-process.
> - `${headers.NAME}` — forwards the named header from the caller's incoming HTTP request. Only meaningful when Docker Agent is running as an API server (`docker agent serve api`) and a client passes authentication headers that the upstream MCP server also accepts.
@y
> [!NOTE]
> **Per-request header template expansion**
>
> Header values in `remote.headers` support `${env.VAR}` and `${headers.NAME}` placeholders. Both are resolved on every outbound HTTP request (not just once at initialization), so short-lived credentials and forwarded caller headers always reflect the latest values:
>
> - `${env.VAR}` — reads the named environment variable. Useful for credentials stored in a secret manager that rotates them in-process.
> - `${headers.NAME}` — forwards the named header from the caller's incoming HTTP request. Only meaningful when Docker Agent is running as an API server (`docker agent serve api`) and a client passes authentication headers that the upstream MCP server also accepts.
@z

@x
> [!NOTE]
> **Automatic reconnection after idle timeouts**
>
> Remote MCP connections (Streamable HTTP / SSE) automatically reconnect after the server closes an idle connection — no configuration needed. Services like Notion and Linear close idle connections periodically; Docker Agent detects the clean close and reconnects with exponential backoff. To tune reconnect behaviour or disable reconnection entirely, use the [`lifecycle` block](../../configuration/tools/index.md#toolset-lifecycle).
@y
> [!NOTE]
> **Automatic reconnection after idle timeouts**
>
> Remote MCP connections (Streamable HTTP / SSE) automatically reconnect after the server closes an idle connection — no configuration needed. Services like Notion and Linear close idle connections periodically; Docker Agent detects the clean close and reconnects with exponential backoff. To tune reconnect behaviour or disable reconnection entirely, use the [`lifecycle` block](../../configuration/tools/index.md#toolset-lifecycle).
@z

@x
> [!NOTE]
> **Automatic recovery from revoked or rotated OAuth tokens**
>
> If a remote MCP server rejects the cached token with a `401 invalid_token` error (for example, because the token was revoked or rotated server-side), Docker Agent handles the failure automatically:
>
> - **Silent refresh:** when a refresh token is available, Docker Agent silently exchanges it for a new access token and replays the request — no user interaction required.
> - **Re-authentication prompt:** when the refresh token is absent or has also expired, the toolset transitions to a "needs re-auth" state and surfaces an OAuth prompt on your next message (exactly like the first-time flow).
>
> Either way, the agent never burns 5 reconnect attempts on an auth failure — it fails fast and either refreshes silently or defers to interactive re-auth. If you want to trigger re-auth immediately without waiting for the next message, run `/toolset-restart <name>` from the TUI.
@y
> [!NOTE]
> **Automatic recovery from revoked or rotated OAuth tokens**
>
> If a remote MCP server rejects the cached token with a `401 invalid_token` error (for example, because the token was revoked or rotated server-side), Docker Agent handles the failure automatically:
>
> - **Silent refresh:** when a refresh token is available, Docker Agent silently exchanges it for a new access token and replays the request — no user interaction required.
> - **Re-authentication prompt:** when the refresh token is absent or has also expired, the toolset transitions to a "needs re-auth" state and surfaces an OAuth prompt on your next message (exactly like the first-time flow).
>
> Either way, the agent never burns 5 reconnect attempts on an auth failure — it fails fast and either refreshes silently or defers to interactive re-auth. If you want to trigger re-auth immediately without waiting for the next message, run `/toolset-restart <name>` from the TUI.
@z

@x
### OAuth for servers without Dynamic Client Registration
@y
### OAuth for servers without Dynamic Client Registration
@z

@x
Most remote MCP servers that require OAuth support [Dynamic Client Registration (RFC 7591)](https://datatracker.ietf.org/doc/html/rfc7591) — no configuration is needed, Docker Agent handles the flow for you.
@y
Most remote MCP servers that require OAuth support [Dynamic Client Registration (RFC 7591)](https://datatracker.ietf.org/doc/html/rfc7591) — no configuration is needed, Docker Agent handles the flow for you.
@z

@x
For servers that do **not** support DCR, Docker Agent falls back automatically:
@y
For servers that do **not** support DCR, Docker Agent falls back automatically:
@z

@x
1. **Interactive credential prompt**: Docker Agent presents a dialog asking for your `client_id` (required) and optionally a `client_secret`. This covers servers that require pre-registered app credentials but don't advertise them via DCR.
2. **Explicit `oauth:` block** (recommended when you know the credentials in advance): add the block described below to skip the interactive prompt and supply credentials directly in config.
@y
1. **Interactive credential prompt**: Docker Agent presents a dialog asking for your `client_id` (required) and optionally a `client_secret`. This covers servers that require pre-registered app credentials but don't advertise them via DCR.
2. **Explicit `oauth:` block** (recommended when you know the credentials in advance): add the block described below to skip the interactive prompt and supply credentials directly in config.
@z

@x
```yaml
toolsets:
  - type: mcp
    remote:
      url: "https://mcp.example.com/mcp"
      transport_type: "streamable"
      oauth:
        clientId: "my-app-client-id"
        clientSecret: "my-app-client-secret" # optional (public clients may omit)
        callbackPort: 8765                   # optional; picks a free port otherwise
        scopes:                              # optional; server-specific
          - read
          - write
```
@y
```yaml
toolsets:
  - type: mcp
    remote:
      url: "https://mcp.example.com/mcp"
      transport_type: "streamable"
      oauth:
        clientId: "my-app-client-id"
        clientSecret: "my-app-client-secret" # optional (public clients may omit)
        callbackPort: 8765                   # optional; picks a free port otherwise
        scopes:                              # optional; server-specific
          - read
          - write
```
@z

@x
| Field          | Type            | Required | Description                                                                                      |
| -------------- | --------------- | -------- | ------------------------------------------------------------------------------------------------ |
| `clientId`     | string          | ✗        | OAuth client ID registered with the remote MCP server. When omitted, Docker Agent uses Dynamic Client Registration or prompts interactively. |
| `clientSecret` | string          | ✗        | OAuth client secret. Requires `clientId`. Omit for public clients using PKCE.                    |
| `callbackPort` | integer         | ✗        | Local port to receive the OAuth redirect. If omitted, Docker Agent picks a random free port.    |
| `scopes`       | array[string]   | ✗        | Scopes to request during the authorization step. Values are server-specific.                     |
| `callbackRedirectURL` | string   | ✗        | Custom OAuth redirect URI. Useful when the auth server requires HTTPS or a pre-registered URL. The literal placeholder `${callbackPort}` is replaced with the actual local callback port. See below.            |
@y
| Field          | Type            | Required | Description                                                                                      |
| -------------- | --------------- | -------- | ------------------------------------------------------------------------------------------------ |
| `clientId`     | string          | ✗        | OAuth client ID registered with the remote MCP server. When omitted, Docker Agent uses Dynamic Client Registration or prompts interactively. |
| `clientSecret` | string          | ✗        | OAuth client secret. Requires `clientId`. Omit for public clients using PKCE.                    |
| `callbackPort` | integer         | ✗        | Local port to receive the OAuth redirect. If omitted, Docker Agent picks a random free port.    |
| `scopes`       | array[string]   | ✗        | Scopes to request during the authorization step. Values are server-specific.                     |
| `callbackRedirectURL` | string   | ✗        | Custom OAuth redirect URI. Useful when the auth server requires HTTPS or a pre-registered URL. The literal placeholder `${callbackPort}` is replaced with the actual local callback port. See below.            |
@z

@x
Secrets should be stored in a credential helper or environment variable rather than committed — see [Secrets](../../guides/secrets/index.md) for interpolation patterns.
@y
Secrets should be stored in a credential helper or environment variable rather than committed — see [Secrets](../../guides/secrets/index.md) for interpolation patterns.
@z

@x
> [!TIP]
> The `oauth:` block also works **without** `clientId`. Use it to pin the callback port, request specific scopes, or set a custom redirect URL while still letting Docker Agent obtain the client ID via Dynamic Client Registration (or the interactive prompt).
@y
> [!TIP]
> The `oauth:` block also works **without** `clientId`. Use it to pin the callback port, request specific scopes, or set a custom redirect URL while still letting Docker Agent obtain the client ID via Dynamic Client Registration (or the interactive prompt).
@z

@x
### Custom redirect URI (`callbackRedirectURL`)
@y
### Custom redirect URI (`callbackRedirectURL`)
@z

@x
Some authorization servers require the OAuth `redirect_uri` to be HTTPS or to match a URL that was pre-registered during app creation — neither of which plays nicely with a locally-bound loopback address such as `http://127.0.0.1:8765/callback`.
@y
Some authorization servers require the OAuth `redirect_uri` to be HTTPS or to match a URL that was pre-registered during app creation — neither of which plays nicely with a locally-bound loopback address such as `http://127.0.0.1:8765/callback`.
@z

@x
To work around this, set `callbackRedirectURL` to a public URL that redirects back to the local callback server. The literal placeholder `${callbackPort}` is substituted with the actual port the local callback server is listening on (either `callbackPort` when set, or the randomly-assigned port otherwise).
@y
To work around this, set `callbackRedirectURL` to a public URL that redirects back to the local callback server. The literal placeholder `${callbackPort}` is substituted with the actual port the local callback server is listening on (either `callbackPort` when set, or the randomly-assigned port otherwise).
@z

@x
```yaml
toolsets:
  - type: mcp
    remote:
      url: "https://mcp.example.com/mcp"
      transport_type: "streamable"
      oauth:
        clientId: "my-app-client-id"
        callbackPort: 8765
        # Advertise this URL to the authorization server. The external
        # service at redirect.example.com is expected to 302-redirect the
        # browser to http://127.0.0.1:8765/callback preserving the query
        # string (code, state, …).
        callbackRedirectURL: "https://redirect.example.com/cb?port=${callbackPort}"
```
@y
```yaml
toolsets:
  - type: mcp
    remote:
      url: "https://mcp.example.com/mcp"
      transport_type: "streamable"
      oauth:
        clientId: "my-app-client-id"
        callbackPort: 8765
        # Advertise this URL to the authorization server. The external
        # service at redirect.example.com is expected to 302-redirect the
        # browser to http://127.0.0.1:8765/callback preserving the query
        # string (code, state, …).
        callbackRedirectURL: "https://redirect.example.com/cb?port=${callbackPort}"
```
@z

@x
The local callback server still listens on the loopback interface on `callbackPort`; only the `redirect_uri` advertised to the authorization server changes.
@y
The local callback server still listens on the loopback interface on `callbackPort`; only the `redirect_uri` advertised to the authorization server changes.
@z

@x
**Validation rules:**
@y
**Validation rules:**
@z

@x
- The URL must be absolute (scheme + host) once `${callbackPort}` has been substituted.
- Only `http` and `https` schemes are accepted.
- `http` is only allowed when the host is a loopback address (`127.0.0.1`, `::1`, `localhost`); any other host must use `https` to avoid exposing the authorization `code` on the wire (RFC 8252 §7.3).
@y
- The URL must be absolute (scheme + host) once `${callbackPort}` has been substituted.
- Only `http` and `https` schemes are accepted.
- `http` is only allowed when the host is a loopback address (`127.0.0.1`, `::1`, `localhost`); any other host must use `https` to avoid exposing the authorization `code` on the wire (RFC 8252 §7.3).
@z

@x
### Unmanaged OAuth flow (server mode)
@y
### Unmanaged OAuth flow (server mode)
@z

@x
When running `docker agent serve api` (no local browser, no callback server), the runtime delegates the OAuth dance to the connected client via an MCP elicitation. There are two sub-behaviors, selected by the `--mcp-oauth-redirect-uri` flag:
@y
When running `docker agent serve api` (no local browser, no callback server), the runtime delegates the OAuth dance to the connected client via an MCP elicitation. There are two sub-behaviors, selected by the `--mcp-oauth-redirect-uri` flag:
@z

@x
- **`--mcp-oauth-redirect-uri=<URL>` set** (recommended for hosts like Docker Desktop): the runtime generates `state` + PKCE + (optional) Dynamic Client Registration in-process, builds the full authorize URL, and emits an elicitation whose `Meta` includes:
@y
- **`--mcp-oauth-redirect-uri=<URL>` set** (recommended for hosts like Docker Desktop): the runtime generates `state` + PKCE + (optional) Dynamic Client Registration in-process, builds the full authorize URL, and emits an elicitation whose `Meta` includes:
@z

@x
  | Key                          | Value                                                            |
  | ---------------------------- | ---------------------------------------------------------------- |
  | `docker-agent/type`                | `"oauth_flow"`                                                   |
  | `docker-agent/server_url`          | The MCP server URL (for display / favicon)                       |
  | `docker-agent/authorize_url`       | The full URL the client should open in the user's browser        |
  | `docker-agent/state`               | The `state` value the client must echo back when replying        |
  | `auth_server`                | Issuer of the authorization server                               |
  | `auth_server_metadata`       | RFC 8414 authorization-server metadata document                  |
  | `resource_metadata`          | RFC 9728 protected-resource metadata document                    |
@y
  | Key                          | Value                                                            |
  | ---------------------------- | ---------------------------------------------------------------- |
  | `docker-agent/type`                | `"oauth_flow"`                                                   |
  | `docker-agent/server_url`          | The MCP server URL (for display / favicon)                       |
  | `docker-agent/authorize_url`       | The full URL the client should open in the user's browser        |
  | `docker-agent/state`               | The `state` value the client must echo back when replying        |
  | `auth_server`                | Issuer of the authorization server                               |
  | `auth_server_metadata`       | RFC 8414 authorization-server metadata document                  |
  | `resource_metadata`          | RFC 9728 protected-resource metadata document                    |
@z

@x
  The client opens the browser at the URL provided in the `docker-agent/authorize_url` meta field, receives the OAuth callback at whatever endpoint the configured `redirect_uri` resolves to (typically a host-controlled bouncer that 302s into a deeplink), and replies to the elicitation with `accept` and `Content = {"code": "...", "state": "..."}`. The runtime verifies the `state`, exchanges the `code` at the token endpoint (using the same `redirect_uri` for RFC 6749 §4.1.3 binding), stores the token, and replays the original MCP request with `Authorization: Bearer ...`.
@y
  The client opens the browser at the URL provided in the `docker-agent/authorize_url` meta field, receives the OAuth callback at whatever endpoint the configured `redirect_uri` resolves to (typically a host-controlled bouncer that 302s into a deeplink), and replies to the elicitation with `accept` and `Content = {"code": "...", "state": "..."}`. The runtime verifies the `state`, exchanges the `code` at the token endpoint (using the same `redirect_uri` for RFC 6749 §4.1.3 binding), stores the token, and replays the original MCP request with `Authorization: Bearer ...`.
@z

@x
- **Flag not set** (client-driven): the runtime emits the elicitation meta below and expects the client to drive the OAuth flow itself (PKCE, DCR, token exchange) and reply with `Content = {"access_token": "...", "refresh_token": "...", ...}`:
@y
- **Flag not set** (client-driven): the runtime emits the elicitation meta below and expects the client to drive the OAuth flow itself (PKCE, DCR, token exchange) and reply with `Content = {"access_token": "...", "refresh_token": "...", ...}`:
@z

@x
  | Key                          | Value                                                            |
  | ---------------------------- | ---------------------------------------------------------------- |
  | `docker-agent/type`          | `"oauth_flow"`                                                   |
  | `docker-agent/server_url`    | The MCP server URL (for display / favicon)                       |
  | `auth_server`                | Issuer of the authorization server                               |
  | `auth_server_metadata`       | RFC 8414 authorization-server metadata document                  |
  | `resource_metadata`          | RFC 9728 protected-resource metadata document                    |
@y
  | Key                          | Value                                                            |
  | ---------------------------- | ---------------------------------------------------------------- |
  | `docker-agent/type`          | `"oauth_flow"`                                                   |
  | `docker-agent/server_url`    | The MCP server URL (for display / favicon)                       |
  | `auth_server`                | Issuer of the authorization server                               |
  | `auth_server_metadata`       | RFC 8414 authorization-server metadata document                  |
  | `resource_metadata`          | RFC 9728 protected-resource metadata document                    |
@z

@x
The client-driven `{access_token, ...}` reply shape is still accepted on the `--mcp-oauth-redirect-uri` path too: a client that prefers to do the exchange itself can ignore the `docker-agent/authorize_url`/`docker-agent/state` keys.
@y
The client-driven `{access_token, ...}` reply shape is still accepted on the `--mcp-oauth-redirect-uri` path too: a client that prefers to do the exchange itself can ignore the `docker-agent/authorize_url`/`docker-agent/state` keys.
@z

@x
A per-toolset `callbackRedirectURL` (in the YAML) overrides the runtime-wide `--mcp-oauth-redirect-uri` for that toolset.
@y
A per-toolset `callbackRedirectURL` (in the YAML) overrides the runtime-wide `--mcp-oauth-redirect-uri` for that toolset.
@z

@x
> [!WARNING]
> **Security note**
>
> The `POST /api/mcp-oauth/callback` route is open by default (no auth required) when `--auth-token` is unset. State values are 128-bit opaque tokens, so brute-force is infeasible, but a state value that leaks (e.g. via debug logs or a compromised host) could be exploited by an attacker to inject a code. Set `--auth-token` when `docker agent serve api` listens on a network-reachable interface. When set, `--auth-token` enforces Bearer-token authentication on all API routes including this callback endpoint.
@y
> [!WARNING]
> **Security note**
>
> The `POST /api/mcp-oauth/callback` route is open by default (no auth required) when `--auth-token` is unset. State values are 128-bit opaque tokens, so brute-force is infeasible, but a state value that leaks (e.g. via debug logs or a compromised host) could be exploited by an attacker to inject a code. Set `--auth-token` when `docker agent serve api` listens on a network-reachable interface. When set, `--auth-token` enforces Bearer-token authentication on all API routes including this callback endpoint.
@z

@x
## Project Management &amp; Collaboration
@y
## Project Management &amp; Collaboration
@z

@x
| Service    | URL                                | Transport | Description                           |
| ---------- | ---------------------------------- | --------- | ------------------------------------- |
| Asana      | `https://mcp.asana.com/sse`        | sse       | Task and project management           |
| Atlassian  | `https://mcp.atlassian.com/v1/mcp/authv2` | streamable | Jira, Confluence integration          |
| Linear     | `https://mcp.linear.app/mcp`       | streamable | Issue tracking and project management |
| Monday.com | `https://mcp.monday.com/sse`       | sse       | Work management platform              |
| Intercom   | `https://mcp.intercom.com/sse`     | sse       | Customer communication platform       |
@y
| Service    | URL                                | Transport | Description                           |
| ---------- | ---------------------------------- | --------- | ------------------------------------- |
| Asana      | `https://mcp.asana.com/sse`        | sse       | Task and project management           |
| Atlassian  | `https://mcp.atlassian.com/v1/mcp/authv2` | streamable | Jira, Confluence integration          |
| Linear     | `https://mcp.linear.app/mcp`       | streamable | Issue tracking and project management |
| Monday.com | `https://mcp.monday.com/sse`       | sse       | Work management platform              |
| Intercom   | `https://mcp.intercom.com/sse`     | sse       | Customer communication platform       |
@z

@x
## Development &amp; Infrastructure
@y
## Development &amp; Infrastructure
@z

@x
| Service                  | URL                                            | Transport  | Description                       |
| ------------------------ | ---------------------------------------------- | ---------- | --------------------------------- |
| GitHub                   | `https://api.githubcopilot.com/mcp`            | sse        | Version control and collaboration |
| Buildkite                | `https://mcp.buildkite.com/mcp`                | streamable | CI/CD platform                    |
| Netlify                  | `https://netlify-mcp.netlify.app/mcp`          | streamable | Web hosting and deployment        |
| Vercel                   | `https://mcp.vercel.com/`                      | sse        | Web deployment platform           |
| Cloudflare Bindings      | `https://bindings.mcp.cloudflare.com/sse`      | sse        | Edge computing resources          |
| Cloudflare Observability | `https://observability.mcp.cloudflare.com/sse` | sse        | Monitoring and analytics          |
| Grafbase                 | `https://api.grafbase.com/mcp`                 | streamable | GraphQL backend platform          |
| Neon                     | `https://mcp.neon.tech/sse`                    | sse        | Serverless Postgres database      |
| Prisma                   | `https://mcp.prisma.io/mcp`                    | streamable | Database ORM and toolkit          |
| Sentry                   | `https://mcp.sentry.dev/sse`                   | sse        | Error tracking and monitoring     |
@y
| Service                  | URL                                            | Transport  | Description                       |
| ------------------------ | ---------------------------------------------- | ---------- | --------------------------------- |
| GitHub                   | `https://api.githubcopilot.com/mcp`            | sse        | Version control and collaboration |
| Buildkite                | `https://mcp.buildkite.com/mcp`                | streamable | CI/CD platform                    |
| Netlify                  | `https://netlify-mcp.netlify.app/mcp`          | streamable | Web hosting and deployment        |
| Vercel                   | `https://mcp.vercel.com/`                      | sse        | Web deployment platform           |
| Cloudflare Bindings      | `https://bindings.mcp.cloudflare.com/sse`      | sse        | Edge computing resources          |
| Cloudflare Observability | `https://observability.mcp.cloudflare.com/sse` | sse        | Monitoring and analytics          |
| Grafbase                 | `https://api.grafbase.com/mcp`                 | streamable | GraphQL backend platform          |
| Neon                     | `https://mcp.neon.tech/sse`                    | sse        | Serverless Postgres database      |
| Prisma                   | `https://mcp.prisma.io/mcp`                    | streamable | Database ORM and toolkit          |
| Sentry                   | `https://mcp.sentry.dev/sse`                   | sse        | Error tracking and monitoring     |
@z

@x
## Content &amp; Media
@y
## Content &amp; Media
@z

@x
| Service    | URL                                               | Transport  | Description                       |
| ---------- | ------------------------------------------------- | ---------- | --------------------------------- |
| Canva      | `https://mcp.canva.com/mcp`                       | streamable | Design and graphics platform      |
| Miro       | `https://mcp.miro.com/`                           | streamable | Collaborative whiteboard platform (Enterprise plan required; see [official docs](https://developers.miro.com/docs/miro-mcp)) |
| Cloudinary | `https://asset-management.mcp.cloudinary.com/sse` | sse        | Media management and optimization |
| InVideo    | `https://mcp.invideo.io/sse`                      | sse        | Video creation platform           |
| Webflow    | `https://mcp.webflow.com/sse`                     | sse        | Website builder and CMS           |
| Wix        | `https://mcp.wix.com/sse`                         | sse        | Website builder platform          |
| Notion     | `https://mcp.notion.com/mcp`                      | streamable | Documentation and knowledge base  |
@y
| Service    | URL                                               | Transport  | Description                       |
| ---------- | ------------------------------------------------- | ---------- | --------------------------------- |
| Canva      | `https://mcp.canva.com/mcp`                       | streamable | Design and graphics platform      |
| Miro       | `https://mcp.miro.com/`                           | streamable | Collaborative whiteboard platform (Enterprise plan required; see [official docs](https://developers.miro.com/docs/miro-mcp)) |
| Cloudinary | `https://asset-management.mcp.cloudinary.com/sse` | sse        | Media management and optimization |
| InVideo    | `https://mcp.invideo.io/sse`                      | sse        | Video creation platform           |
| Webflow    | `https://mcp.webflow.com/sse`                     | sse        | Website builder and CMS           |
| Wix        | `https://mcp.wix.com/sse`                         | sse        | Website builder platform          |
| Notion     | `https://mcp.notion.com/mcp`                      | streamable | Documentation and knowledge base  |
@z

@x
## Communication &amp; Voice
@y
## Communication &amp; Voice
@z

@x
| Service     | URL                                 | Transport  | Description                 |
| ----------- | ----------------------------------- | ---------- | --------------------------- |
| Fireflies   | `https://api.fireflies.ai/mcp`      | streamable | Meeting transcription       |
| Listenetic  | `https://mcp.listenetic.com/v1/mcp` | streamable | Audio intelligence platform |
| Carbonvoice | `https://mcp.carbonvoice.app`       | sse        | Voice communication tools   |
| Telnyx      | `https://api.telnyx.com/v2/mcp`     | streamable | Communications platform     |
| Dialer      | `https://getdialer.app/sse`         | sse        | Phone communication tools   |
@y
| Service     | URL                                 | Transport  | Description                 |
| ----------- | ----------------------------------- | ---------- | --------------------------- |
| Fireflies   | `https://api.fireflies.ai/mcp`      | streamable | Meeting transcription       |
| Listenetic  | `https://mcp.listenetic.com/v1/mcp` | streamable | Audio intelligence platform |
| Carbonvoice | `https://mcp.carbonvoice.app`       | sse        | Voice communication tools   |
| Telnyx      | `https://api.telnyx.com/v2/mcp`     | streamable | Communications platform     |
| Dialer      | `https://getdialer.app/sse`         | sse        | Phone communication tools   |
@z

@x
## Storage &amp; File Management
@y
## Storage &amp; File Management
@z

@x
| Service | URL                                 | Transport | Description              |
| ------- | ----------------------------------- | --------- | ------------------------ |
| Box     | `https://mcp.box.com`               | sse       | Cloud content management |
| Egnyte  | `https://mcp-server.egnyte.com/sse` | sse       | Enterprise file sharing  |
@y
| Service | URL                                 | Transport | Description              |
| ------- | ----------------------------------- | --------- | ------------------------ |
| Box     | `https://mcp.box.com`               | sse       | Cloud content management |
| Egnyte  | `https://mcp-server.egnyte.com/sse` | sse       | Enterprise file sharing  |
@z

@x
## Business &amp; Finance
@y
## Business &amp; Finance
@z

@x
| Service       | URL                                       | Transport  | Description                |
| ------------- | ----------------------------------------- | ---------- | -------------------------- |
| PayPal        | `https://mcp.paypal.com/sse`              | sse        | Payment processing         |
| Plaid         | `https://api.dashboard.plaid.com/mcp/sse` | sse        | Financial data integration |
| Square        | `https://mcp.squareup.com/sse`            | sse        | Payment processing         |
| Close         | `https://mcp.close.com/mcp`               | streamable | CRM platform               |
| Dodo Payments | `https://mcp.dodopayments.com/sse`        | sse        | Payment processing         |
@y
| Service       | URL                                       | Transport  | Description                |
| ------------- | ----------------------------------------- | ---------- | -------------------------- |
| PayPal        | `https://mcp.paypal.com/sse`              | sse        | Payment processing         |
| Plaid         | `https://api.dashboard.plaid.com/mcp/sse` | sse        | Financial data integration |
| Square        | `https://mcp.squareup.com/sse`            | sse        | Payment processing         |
| Close         | `https://mcp.close.com/mcp`               | streamable | CRM platform               |
| Dodo Payments | `https://mcp.dodopayments.com/sse`        | sse        | Payment processing         |
@z

@x
## Analytics &amp; Data
@y
## Analytics &amp; Data
@z

@x
| Service     | URL                                     | Transport  | Description                    |
| ----------- | --------------------------------------- | ---------- | ------------------------------ |
| ThoughtSpot | `https://agent.thoughtspot.app/mcp`     | streamable | Analytics and BI platform      |
| Meta Ads    | `https://mcp.pipeboard.co/meta-ads-mcp` | streamable | Facebook advertising analytics |
@y
| Service     | URL                                     | Transport  | Description                    |
| ----------- | --------------------------------------- | ---------- | ------------------------------ |
| ThoughtSpot | `https://agent.thoughtspot.app/mcp`     | streamable | Analytics and BI platform      |
| Meta Ads    | `https://mcp.pipeboard.co/meta-ads-mcp` | streamable | Facebook advertising analytics |
@z

@x
## Utilities &amp; Tools
@y
## Utilities &amp; Tools
@z

@x
| Service       | URL                                | Transport  | Description                     |
| ------------- | ---------------------------------- | ---------- | ------------------------------- |
| Apify         | `https://mcp.apify.com`            | sse        | Web scraping and automation     |
| SimpleScraper | `https://mcp.simplescraper.io/mcp` | streamable | Web scraping tool               |
| GlobalPing    | `https://mcp.globalping.dev/sse`   | sse        | Network diagnostics             |
| Jam           | `https://mcp.jam.dev/mcp`          | streamable | Bug reporting and collaboration |
@y
| Service       | URL                                | Transport  | Description                     |
| ------------- | ---------------------------------- | ---------- | ------------------------------- |
| Apify         | `https://mcp.apify.com`            | sse        | Web scraping and automation     |
| SimpleScraper | `https://mcp.simplescraper.io/mcp` | streamable | Web scraping tool               |
| GlobalPing    | `https://mcp.globalping.dev/sse`   | sse        | Network diagnostics             |
| Jam           | `https://mcp.jam.dev/mcp`          | streamable | Bug reporting and collaboration |
@z

@x
## Example: Multi-Service Agent
@y
## Example: Multi-Service Agent
@z

@x
Combine multiple remote MCP servers in a single agent:
@y
Combine multiple remote MCP servers in a single agent:
@z

@x
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    instruction: |
      You help manage projects and deployments.
    toolsets:
      - type: mcp
        remote:
          url: "https://mcp.linear.app/mcp"
          transport_type: "streamable"
        instruction: Use Linear for issue tracking.
      - type: mcp
        remote:
          url: "https://api.githubcopilot.com/mcp"
          transport_type: "sse"
        instruction: Use GitHub for code and PRs.
      - type: mcp
        remote:
          url: "https://mcp.vercel.com/"
          transport_type: "sse"
        instruction: Use Vercel for deployments.
```
@y
```yaml
agents:
  root:
    model: anthropic/claude-sonnet-4-5
    instruction: |
      You help manage projects and deployments.
    toolsets:
      - type: mcp
        remote:
          url: "https://mcp.linear.app/mcp"
          transport_type: "streamable"
        instruction: Use Linear for issue tracking.
      - type: mcp
        remote:
          url: "https://api.githubcopilot.com/mcp"
          transport_type: "sse"
        instruction: Use GitHub for code and PRs.
      - type: mcp
        remote:
          url: "https://mcp.vercel.com/"
          transport_type: "sse"
        instruction: Use Vercel for deployments.
```
@z

@x
> [!NOTE]
> **Growing list**
>
> This list is updated as more services add MCP support. If a service you use isn't listed, check their documentation — many providers are adding MCP endpoints regularly.
@y
> [!NOTE]
> **Growing list**
>
> This list is updated as more services add MCP support. If a service you use isn't listed, check their documentation — many providers are adding MCP endpoints regularly.
@z
