%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx mcp add
synopsis: Register an MCP server
description: |-
    Register an MCP server for use with sbx create/run --static-mcp.
    To attach a registered server to a running sandbox, use sbx mcp load.
@y
name: sbx mcp add
synopsis: Register an MCP server
description: |-
    Register an MCP server for use with sbx create/run --static-mcp.
    To attach a registered server to a running sandbox, use sbx mcp load.
@z

@x
    Use --url for a remote MCP endpoint, a community-registry or server-manifest
    URL, or a Docker Hardened Image reference. Other image references are unsupported.
    Use --command for a local stdio server. Local servers run on the host with your
    full permissions; use only trusted executables.
@y
    Use --url for a remote MCP endpoint, a community-registry or server-manifest
    URL, or a Docker Hardened Image reference. Other image references are unsupported.
    Use --command for a local stdio server. Local servers run on the host with your
    full permissions; use only trusted executables.
@z

@x
    OAuth metadata is discovered automatically for remote endpoints. Use --client-id
    for a pre-registered client, or --oauth-authorization-server when the server
    publishes no discovery metadata. Confidential clients need a secret stored as
    mcp:NAME:client_secret; use sbx secret set without -t to read it from stdin.
@y
    OAuth metadata is discovered automatically for remote endpoints. Use --client-id
    for a pre-registered client, or --oauth-authorization-server when the server
    publishes no discovery metadata. Confidential clients need a secret stored as
    mcp:NAME:client_secret; use sbx secret set without -t to read it from stdin.
@z

@x
    Use --header for custom headers on remote endpoints. Header values can reference
    stored secrets; see the examples below. Header secrets come from this host's
    secret store and require a locally connected server.
@y
    Use --header for custom headers on remote endpoints. Header values can reference
    stored secrets; see the examples below. Header secrets come from this host's
    secret store and require a locally connected server.
@z

@x
    For registration and authorization workflows, see:
    https://docs.docker.com/ai/sandboxes/mcp-gateway/
@y
    For registration and authorization workflows, see:
    https://docs.docker.com/ai/sandboxes/mcp-gateway/
@z

@x
usage: sbx mcp add NAME (--url URL | --command COMMAND) [flags]
@y
usage: sbx mcp add NAME (--url URL | --command COMMAND) [flags]
@z

% options:

@x args
      usage: Command-line arguments for the command
@y
      usage: Command-line arguments for the command
@z

@x callback-port
      usage: |
        Local port to bind the OAuth callback listener to during add-time authorization (default: OS-assigned ephemeral port). Useful when the port must be pre-registered in an OAuth app's allowed redirect URIs. Applies to --url remote OAuth servers; ignored with a warning if the server turns out not to need OAuth.
@y
      usage: |
        Local port to bind the OAuth callback listener to during add-time authorization (default: OS-assigned ephemeral port). Useful when the port must be pre-registered in an OAuth app's allowed redirect URIs. Applies to --url remote OAuth servers; ignored with a warning if the server turns out not to need OAuth.
@z

@x client-id
      usage: |
        OAuth client id for a pre-registered client (with --url; may be used with or without --oauth-authorization-server). A confidential client's secret comes from 'sbx secret set mcp:<server>:client_secret'
@y
      usage: |
        OAuth client id for a pre-registered client (with --url; may be used with or without --oauth-authorization-server). A confidential client's secret comes from 'sbx secret set mcp:<server>:client_secret'
@z

@x command
      usage: Executable to run for a local stdio server
@y
      usage: Executable to run for a local stdio server
@z

@x dir
      usage: Working directory (cwd) for a --command host server
@y
      usage: Working directory (cwd) for a --command host server
@z

@x disable-http2
      usage: |
        Do not negotiate HTTP/2 for this remote server, leaving HTTP/1.1. Applies to --url servers.
@y
      usage: |
        Do not negotiate HTTP/2 for this remote server, leaving HTTP/1.1. Applies to --url servers.
@z

@x header
      usage: |
        Custom HTTP header to send to a remote --url endpoint, in curl form 'Name: value' (repeatable). A ${placeholder} in the value is substituted at connect time from 'sbx secret set mcp:<server>:<placeholder>'
@y
      usage: |
        Custom HTTP header to send to a remote --url endpoint, in curl form 'Name: value' (repeatable). A ${placeholder} in the value is substituted at connect time from 'sbx secret set mcp:<server>:<placeholder>'
@z

@x help
      usage: help for add
@y
      usage: help for add
@z

@x local
      usage: Run registry OCI server locally via docker run
@y
      usage: Run registry OCI server locally via docker run
@z

@x no-scope
      usage: |
        Request no scopes during add-time authorization, so the authorization server applies its own default grant. Suppresses required and OIDC fallback scopes; cannot be combined with --scope. Applies to --url remote OAuth servers.
@y
      usage: |
        Request no scopes during add-time authorization, so the authorization server applies its own default grant. Suppresses required and OIDC fallback scopes; cannot be combined with --scope. Applies to --url remote OAuth servers.
@z

@x oauth-authorization-server
      usage: |
        Path or http(s) URL to an RFC 8414 oauth-authorization-server metadata JSON document
@y
      usage: |
        Path or http(s) URL to an RFC 8414 oauth-authorization-server metadata JSON document
@z

@x resource
      usage: |
        RFC 8707 resource indicator to send during OAuth: an absolute URI (scheme and host, no fragment) naming the server the token is for. Overrides the value the server publishes in its RFC 9728 metadata and the one derived from --url; set it only when that derived value is wrong. Not honoured by the hosted gateway for a plain remote yet. Applies to --url remote OAuth servers.
@y
      usage: |
        RFC 8707 resource indicator to send during OAuth: an absolute URI (scheme and host, no fragment) naming the server the token is for. Overrides the value the server publishes in its RFC 9728 metadata and the one derived from --url; set it only when that derived value is wrong. Not honoured by the hosted gateway for a plain remote yet. Applies to --url remote OAuth servers.
@z

@x scope
      usage: |
        Default OAuth scope to request at consent time (repeatable; a scope the server's advertised metadata does not recognize prints a warning but is still requested, since advertising a scope never promised the server would grant it either). With no --scope, the scope set the resource itself requires is requested; with neither, whichever of openid, email, profile, and offline_access are advertised are requested; other advertised scopes are excluded from this fallback. Applies to --url remote OAuth servers.
@y
      usage: |
        Default OAuth scope to request at consent time (repeatable; a scope the server's advertised metadata does not recognize prints a warning but is still requested, since advertising a scope never promised the server would grant it either). With no --scope, the scope set the resource itself requires is requested; with neither, whichever of openid, email, profile, and offline_access are advertised are requested; other advertised scopes are excluded from this fallback. Applies to --url remote OAuth servers.
@z

@x skip-auth
      usage: |
        Register an OAuth server without starting the hosted OAuth flow
@y
      usage: |
        Register an OAuth server without starting the hosted OAuth flow
@z

@x skip-ssrf-check
      usage: |
        Skip SSRF checks for this add, including OAuth authorization-server metadata and redirects (operator asserts the provider is trusted)
@y
      usage: |
        Skip SSRF checks for this add, including OAuth authorization-server metadata and redirects (operator asserts the provider is trusted)
@z

@x url
      usage: |
        MCP server manifest URL, remote endpoint URL, or dhi.io image ref
@y
      usage: |
        MCP server manifest URL, remote endpoint URL, or dhi.io image ref
@z

% inherited_options:

@x cloud
      usage: |
        Dispatch to Docker Cloud Sandboxes API instead of local sandboxd (supported by a growing set of verbs — run 'sbx --cloud --help' for the current list)
@y
      usage: |
        Dispatch to Docker Cloud Sandboxes API instead of local sandboxd (supported by a growing set of verbs — run 'sbx --cloud --help' for the current list)
@z

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

@x
example: |4-
      # Remote MCP endpoint (OAuth auto-detected)
      sbx mcp add notion --url https://mcp.notion.com/mcp
      sbx mcp add linear --url https://mcp.linear.app/mcp
@y
example: |4-
      # Remote MCP endpoint (OAuth auto-detected)
      sbx mcp add notion --url https://mcp.notion.com/mcp
      sbx mcp add linear --url https://mcp.linear.app/mcp
@z

@x
      # MCP community-registry URL
      sbx mcp add fetch --url https://registry.modelcontextprotocol.io/v0/servers/fetch-mcp/versions/latest
@y
      # MCP community-registry URL
      sbx mcp add fetch --url https://registry.modelcontextprotocol.io/v0/servers/fetch-mcp/versions/latest
@z

@x
      # Plain server-manifest URL (server.json / server.yaml)
      sbx mcp add opine --url https://example.com/mcp/opine/server.yaml
@y
      # Plain server-manifest URL (server.json / server.yaml)
      sbx mcp add opine --url https://example.com/mcp/opine/server.yaml
@z

@x
      # Docker Hardened Image (manifest is extracted from the image attestation)
      sbx mcp add fetch --url dhi.io/fetch-mcp:latest
@y
      # Docker Hardened Image (manifest is extracted from the image attestation)
      sbx mcp add fetch --url dhi.io/fetch-mcp:latest
@z

@x
      # Registry URL, local mode (runs on host via docker run; stdio packages only)
      sbx mcp add fetch --local --url https://registry.modelcontextprotocol.io/v0/servers/fetch-mcp/versions/latest
@y
      # Registry URL, local mode (runs on host via docker run; stdio packages only)
      sbx mcp add fetch --local --url https://registry.modelcontextprotocol.io/v0/servers/fetch-mcp/versions/latest
@z

@x
      # Private-network endpoint (host resolves to a private address) — opt out of the SSRF guard
      sbx mcp add internal --url https://private.example.com/mcp --skip-ssrf-check
@y
      # Private-network endpoint (host resolves to a private address) — opt out of the SSRF guard
      sbx mcp add internal --url https://private.example.com/mcp --skip-ssrf-check
@z

@x
      # Remote endpoint with a hand-supplied OAuth override (server publishes no
      # well-known OAuth metadata): --oauth-authorization-server is a path or
      # http(s) URL to an RFC 8414 metadata document, --client-id the OAuth client id
      sbx mcp add acme --url https://mcp.acme.com/mcp --oauth-authorization-server ./acme-as.json --client-id my-client
@y
      # Remote endpoint with a hand-supplied OAuth override (server publishes no
      # well-known OAuth metadata): --oauth-authorization-server is a path or
      # http(s) URL to an RFC 8414 metadata document, --client-id the OAuth client id
      sbx mcp add acme --url https://mcp.acme.com/mcp --oauth-authorization-server ./acme-as.json --client-id my-client
@z

@x
      # Pre-registered client on a DISCOVERABLE server that has no registration
      # endpoint — no --oauth-authorization-server needed (metadata is discovered)
      sbx mcp add slack --url https://slack.example.com/mcp --client-id my-preregistered-client
@y
      # Pre-registered client on a DISCOVERABLE server that has no registration
      # endpoint — no --oauth-authorization-server needed (metadata is discovered)
      sbx mcp add slack --url https://slack.example.com/mcp --client-id my-preregistered-client
@z

@x
      # Confidential client — store the secret first (prompted, never in argv or
      # shell history), then register; the secret is read from the secret store
      sbx secret set mcp:slack:client_secret
      sbx mcp add slack --url https://slack.example.com/mcp --client-id my-preregistered-client
@y
      # Confidential client — store the secret first (prompted, never in argv or
      # shell history), then register; the secret is read from the secret store
      sbx secret set mcp:slack:client_secret
      sbx mcp add slack --url https://slack.example.com/mcp --client-id my-preregistered-client
@z

@x
      # Record default OAuth scopes to request at consent time (a scope the
      # server's authorization metadata does not advertise warns but is still
      # requested; repeat --scope for each one)
      sbx mcp add acme --url https://mcp.acme.com/mcp --scope read --scope write
@y
      # Record default OAuth scopes to request at consent time (a scope the
      # server's authorization metadata does not advertise warns but is still
      # requested; repeat --scope for each one)
      sbx mcp add acme --url https://mcp.acme.com/mcp --scope read --scope write
@z

@x
      # URN- and URL-shaped scope values are ordinary scopes and need no quoting
      sbx mcp add fastmail --url https://api.fastmail.com/mcp --scope https://www.fastmail.com/dev/mcp --scope offline_access
@y
      # URN- and URL-shaped scope values are ordinary scopes and need no quoting
      sbx mcp add fastmail --url https://api.fastmail.com/mcp --scope https://www.fastmail.com/dev/mcp --scope offline_access
@z

@x
      # Correct the RFC 8707 'resource' indicator when the derived one is wrong (a
      # server whose published identifier is not its endpoint URL)
      sbx mcp add acme --url https://mcp.acme.com/mcp --resource https://api.acme.com/mcp
@y
      # Correct the RFC 8707 'resource' indicator when the derived one is wrong (a
      # server whose published identifier is not its endpoint URL)
      sbx mcp add acme --url https://mcp.acme.com/mcp --resource https://api.acme.com/mcp
@z

@x
      # Remote endpoint with custom headers (curl convention; repeatable). The
      # ${api-key} value is read from the secret store when a sandbox connects
      sbx mcp add acme --url https://mcp.acme.com/mcp --header 'Authorization: Bearer ${api-key}' --header 'Accept: application/json, text/event-stream'
      sbx secret set mcp:acme:api-key
@y
      # Remote endpoint with custom headers (curl convention; repeatable). The
      # ${api-key} value is read from the secret store when a sandbox connects
      sbx mcp add acme --url https://mcp.acme.com/mcp --header 'Authorization: Bearer ${api-key}' --header 'Accept: application/json, text/event-stream'
      sbx secret set mcp:acme:api-key
@z

@x
      # Local stdio command (runs on host — development only)
      sbx mcp add github --command npx --args @modelcontextprotocol/server-github
      sbx mcp add postgres --command docker --args "run,-i,--rm,mcp/postgres"
@y
      # Local stdio command (runs on host — development only)
      sbx mcp add github --command npx --args @modelcontextprotocol/server-github
      sbx mcp add postgres --command docker --args "run,-i,--rm,mcp/postgres"
@z

@x
      # Local stdio command with a working directory (cwd) for the host process
      sbx mcp add local-fs --command node --args server.js --dir /srv/data
@y
      # Local stdio command with a working directory (cwd) for the host process
      sbx mcp add local-fs --command node --args server.js --dir /srv/data
@z

% see_also:

@x
    - sbx mcp - Manage MCP servers
@y
    - sbx mcp - Manage MCP servers
@z
