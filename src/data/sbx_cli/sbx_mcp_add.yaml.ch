%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx mcp add
synopsis: Register an MCP server
description: |-
    Register an MCP server by name. The server is validated and its
    specification is stored for use with sbx create/run --static-mcp.
@y
name: sbx mcp add
synopsis: Register an MCP server
description: |-
    Register an MCP server by name. The server is validated and its
    specification is stored for use with sbx create/run --static-mcp.
@z

@x
    This command only registers the server. To attach an already-registered
    server to a running sandbox, use 'sbx mcp load'.
@y
    This command only registers the server. To attach an already-registered
    server to a running sandbox, use 'sbx mcp load'.
@z

@x
    The --url flag accepts four input formats; the type is auto-detected:
@y
    The --url flag accepts four input formats; the type is auto-detected:
@z

@x
      - Remote MCP endpoint URL (https://host/mcp — talks MCP at the URL;
        OAuth metadata is discovered via RFC 9728/8414).
      - MCP community-registry URL (https://registry.modelcontextprotocol.io/v0/servers/<name>...)
        — fetches the registry envelope and resolves the OCI image.
      - Server-manifest URL (any URL returning a server.json or server.yaml
        body shaped like the MCP community-registry schema — GitHub raw URLs,
        internal HTTP servers, ad-hoc CDN links all work).
      - Docker Hardened Images (DHI) image ref (dhi.io/<name>:<tag> or
        dhi.io/<name>@sha256:... — the server.json manifest is extracted
        from the image's in-toto attestation via the OCI Referrers API).
@y
      - Remote MCP endpoint URL (https://host/mcp — talks MCP at the URL;
        OAuth metadata is discovered via RFC 9728/8414).
      - MCP community-registry URL (https://registry.modelcontextprotocol.io/v0/servers/<name>...)
        — fetches the registry envelope and resolves the OCI image.
      - Server-manifest URL (any URL returning a server.json or server.yaml
        body shaped like the MCP community-registry schema — GitHub raw URLs,
        internal HTTP servers, ad-hoc CDN links all work).
      - Docker Hardened Images (DHI) image ref (dhi.io/<name>:<tag> or
        dhi.io/<name>@sha256:... — the server.json manifest is extracted
        from the image's in-toto attestation via the OCI Referrers API).
@z

@x
    Other image refs (inputs without "://" that are not dhi.io, e.g.
    docker.io/foo:tag) are no longer accepted. Use a server manifest instead.
@y
    Other image refs (inputs without "://" that are not dhi.io, e.g.
    docker.io/foo:tag) are no longer accepted. Use a server manifest instead.
@z

@x
    SSRF guard and --skip-ssrf-check:
      A --url whose host resolves to a private/RFC1918, loopback, link-local, or
      cloud-metadata address is fetched anyway, but flagged: the add proceeds and
      a warning naming the resolved address is printed (this protects against
      manifest URLs that reach internal services, cloud metadata, or
      DNS-rebinding targets by making them visible, not by blocking them). Some
      legitimate servers live on private networks (split-horizon DNS, internal
      load balancers, VPN-only endpoints, PrivateLink), so their public hostname
      resolves to a private address and the warning is expected noise for them.
      OAuth authorization-server metadata has a separate SSRF guard that blocks
      disallowed addresses. Pass --skip-ssrf-check to disable both checks for this
      add, including OAuth metadata redirects, when you trust the provider and
      its discovery destinations; use it only for URLs you control.
@y
    SSRF guard and --skip-ssrf-check:
      A --url whose host resolves to a private/RFC1918, loopback, link-local, or
      cloud-metadata address is fetched anyway, but flagged: the add proceeds and
      a warning naming the resolved address is printed (this protects against
      manifest URLs that reach internal services, cloud metadata, or
      DNS-rebinding targets by making them visible, not by blocking them). Some
      legitimate servers live on private networks (split-horizon DNS, internal
      load balancers, VPN-only endpoints, PrivateLink), so their public hostname
      resolves to a private address and the warning is expected noise for them.
      OAuth authorization-server metadata has a separate SSRF guard that blocks
      disallowed addresses. Pass --skip-ssrf-check to disable both checks for this
      add, including OAuth metadata redirects, when you trust the provider and
      its discovery destinations; use it only for URLs you control.
@z

@x
    OAuth for remote endpoints (--oauth-authorization-server / --client-id):
      Two related options configure OAuth for a remote --url server (both are
      only valid with --url):
@y
    OAuth for remote endpoints (--oauth-authorization-server / --client-id):
      Two related options configure OAuth for a remote --url server (both are
      only valid with --url):
@z

@x
      --oauth-authorization-server hand-supplies the authorization-server
      metadata for a server that publishes no well-known RFC 9728/8414 metadata
      (e.g. Gmail). It is a local file path or an http(s) URL to a JSON document
      conforming to the RFC 8414 oauth-authorization-server shape
      (authorization_endpoint and token_endpoint are required). --client-id is
      required alongside it UNLESS the metadata document itself advertises a
      registration_endpoint, in which case a client is registered dynamically
      (RFC 7591) and --client-id may be omitted.
@y
      --oauth-authorization-server hand-supplies the authorization-server
      metadata for a server that publishes no well-known RFC 9728/8414 metadata
      (e.g. Gmail). It is a local file path or an http(s) URL to a JSON document
      conforming to the RFC 8414 oauth-authorization-server shape
      (authorization_endpoint and token_endpoint are required). --client-id is
      required alongside it UNLESS the metadata document itself advertises a
      registration_endpoint, in which case a client is registered dynamically
      (RFC 7591) and --client-id may be omitted.
@z

@x
      --client-id supplies a PRE-REGISTERED OAuth client. It may be given WITHOUT
      --oauth-authorization-server: the server's authorization metadata is then
      discovered normally and the supplied client is attached to it. This is the
      right mode for a server whose discoverable metadata exposes no
      registration_endpoint (so Dynamic Client Registration is impossible) but
      which accepts a client id the operator registered ahead of time.
@y
      --client-id supplies a PRE-REGISTERED OAuth client. It may be given WITHOUT
      --oauth-authorization-server: the server's authorization metadata is then
      discovered normally and the supplied client is attached to it. This is the
      right mode for a server whose discoverable metadata exposes no
      registration_endpoint (so Dynamic Client Registration is impossible) but
      which accepts a client id the operator registered ahead of time.
@z

@x
      Client secrets (confidential clients):
        There is no --client-secret flag. The secret for a confidential client
        lives in the secret store in the global scope under the
        service name "mcp:<server>:client_secret", and is read from there
        whenever the server is used:
@y
      Client secrets (confidential clients):
        There is no --client-secret flag. The secret for a confidential client
        lives in the secret store in the global scope under the
        service name "mcp:<server>:client_secret", and is read from there
        whenever the server is used:
@z

@x
          sbx secret set mcp:<server>:client_secret
@y
          sbx secret set mcp:<server>:client_secret
@z

@x
        Run it with no -t so the value is read from stdin instead of landing in
        your shell history. The secret is never written to the MCP registration
        on disk. Remove it later with 'sbx secret rm mcp:<server>:client_secret'.
@y
        Run it with no -t so the value is read from stdin instead of landing in
        your shell history. The secret is never written to the MCP registration
        on disk. Remove it later with 'sbx secret rm mcp:<server>:client_secret'.
@z

@x
        The stored secret is bound to the OAuth identity (client id, issuer and
        token endpoint) that first used it. Re-registering the same server name
        against a different client or authorization server therefore does NOT
        reuse it — store the secret again for the new client. To let a new
        identity claim the existing secret, drop the recorded binding with
        'sbx secret rm mcp:<server>:client_secret:identity'.
@y
        The stored secret is bound to the OAuth identity (client id, issuer and
        token endpoint) that first used it. Re-registering the same server name
        against a different client or authorization server therefore does NOT
        reuse it — store the secret again for the new client. To let a new
        identity claim the existing secret, drop the recorded binding with
        'sbx secret rm mcp:<server>:client_secret:identity'.
@z

@x
      Two rules apply on the discovered path (they do not affect a server that
      advertises a registration_endpoint, the hand-supplied
      --oauth-authorization-server path, or --command servers):
@y
      Two rules apply on the discovered path (they do not affect a server that
      advertises a registration_endpoint, the hand-supplied
      --oauth-authorization-server path, or --command servers):
@z

@x
        - If the discovered authorization metadata has NO registration_endpoint,
          Dynamic Client Registration is impossible, so --client-id is REQUIRED;
          the add fails without it. This is the Slack shape (discoverable metadata,
          no DCR, a pre-registered client).
        - A stored client secret is REQUIRED when the server's advertised
          token_endpoint_auth_methods_supported (RFC 8414) does NOT include "none"
          — i.e. it accepts only confidential clients (client_secret_basic /
          client_secret_post). Registration still succeeds without one, but the
          add-time authorization is skipped; store the secret and run
          'sbx mcp auth <server>' to finish. When the list includes "none" a
          public/PKCE client is allowed and --client-id alone is enough. If the
          server advertises no token_endpoint_auth_methods_supported at all (the
          field is optional in RFC 8414), the requirement cannot be determined and
          the add proceeds as usual.
@y
        - If the discovered authorization metadata has NO registration_endpoint,
          Dynamic Client Registration is impossible, so --client-id is REQUIRED;
          the add fails without it. This is the Slack shape (discoverable metadata,
          no DCR, a pre-registered client).
        - A stored client secret is REQUIRED when the server's advertised
          token_endpoint_auth_methods_supported (RFC 8414) does NOT include "none"
          — i.e. it accepts only confidential clients (client_secret_basic /
          client_secret_post). Registration still succeeds without one, but the
          add-time authorization is skipped; store the secret and run
          'sbx mcp auth <server>' to finish. When the list includes "none" a
          public/PKCE client is allowed and --client-id alone is enough. If the
          server advertises no token_endpoint_auth_methods_supported at all (the
          field is optional in RFC 8414), the requirement cannot be determined and
          the add proceeds as usual.
@z

@x
    Default OAuth scopes (--scope / --no-scope):
      --scope records the DEFAULT set of scopes to request at consent time for a
      remote --url OAuth server (repeatable). Precedence at authorization time is
      --no-scope > an explicit 'sbx mcp auth --scope' > the set recorded here > the
      scope set the RESOURCE itself says it requires (from its RFC 9728
      protected-resource metadata or its WWW-Authenticate challenge) > whichever of
      openid, email, profile, and offline_access are advertised. Other advertised
      scopes are excluded from this fallback. If no scopes are selected, the scope
      parameter is omitted so the authorization server can apply its own default
      grant (RFC 6749 §3.3).
@y
    Default OAuth scopes (--scope / --no-scope):
      --scope records the DEFAULT set of scopes to request at consent time for a
      remote --url OAuth server (repeatable). Precedence at authorization time is
      --no-scope > an explicit 'sbx mcp auth --scope' > the set recorded here > the
      scope set the RESOURCE itself says it requires (from its RFC 9728
      protected-resource metadata or its WWW-Authenticate challenge) > whichever of
      openid, email, profile, and offline_access are advertised. Other advertised
      scopes are excluded from this fallback. If no scopes are selected, the scope
      parameter is omitted so the authorization server can apply its own default
      grant (RFC 6749 §3.3).
@z

@x
      A resource that publishes a required set therefore gets it requested with no
      flag at all, and the consent block marks that set as derived rather than
      chosen. --no-scope suppresses all scope fallbacks and requests the server's
      default grant.
@y
      A resource that publishes a required set therefore gets it requested with no
      flag at all, and the consent block marks that set as derived rather than
      chosen. --no-scope suppresses all scope fallbacks and requests the server's
      default grant.
@z

@x
      Scopes you name are checked against the union of two documents a server can
      publish: the authorization server's RFC 8414 scopes_supported and the
      resource's own RFC 9728 protected-resource metadata (some servers, e.g.
      GitHub, document their real scopes on the resource and advertise almost
      nothing over RFC 8414). A scope in neither prints a warning naming the
      offender but is still requested — a mismatch is often the server's own
      documentation gap, not a typo, and either document is allowed to be
      non-exhaustive. This is a recognition check, not a promise: a recognized
      scope can still be refused at consent time.
@y
      Scopes you name are checked against the union of two documents a server can
      publish: the authorization server's RFC 8414 scopes_supported and the
      resource's own RFC 9728 protected-resource metadata (some servers, e.g.
      GitHub, document their real scopes on the resource and advertise almost
      nothing over RFC 8414). A scope in neither prints a warning naming the
      offender but is still requested — a mismatch is often the server's own
      documentation gap, not a typo, and either document is allowed to be
      non-exhaustive. This is a recognition check, not a promise: a recognized
      scope can still be refused at consent time.
@z

@x
      Scope values may be URN-shaped (urn:ietf:params:oauth:scope:mail) or
      URL-shaped (https://www.fastmail.com/dev/mcp). Neither needs quoting — a scope
      token cannot contain a space or a quote — and both are percent-encoded
      normally on the wire. --scope applies both to a hand-supplied override and to
      a plain --url server whose OAuth metadata is discovered.
@y
      Scope values may be URN-shaped (urn:ietf:params:oauth:scope:mail) or
      URL-shaped (https://www.fastmail.com/dev/mcp). Neither needs quoting — a scope
      token cannot contain a space or a quote — and both are percent-encoded
      normally on the wire. --scope applies both to a hand-supplied override and to
      a plain --url server whose OAuth metadata is discovered.
@z

@x
    RFC 8707 resource indicator (--resource):
      Every authorization request, code exchange and token refresh names the server
      the token is for, in the 'resource' parameter the MCP authorization
      specification requires (RFC 8707). That value is normally DERIVED, and you do
      not need this flag: it comes from the server's own RFC 9728 protected-resource
      metadata when it publishes some, and otherwise from the --url endpoint
      (lowercased scheme/host, path kept, fragment dropped).
@y
    RFC 8707 resource indicator (--resource):
      Every authorization request, code exchange and token refresh names the server
      the token is for, in the 'resource' parameter the MCP authorization
      specification requires (RFC 8707). That value is normally DERIVED, and you do
      not need this flag: it comes from the server's own RFC 9728 protected-resource
      metadata when it publishes some, and otherwise from the --url endpoint
      (lowercased scheme/host, path kept, fragment dropped).
@z

@x
      --resource replaces that derivation with a value you supply. Use it when the
      derived one is wrong — most often a server whose published identifier is its
      bare origin (https://api.example.com) while its endpoint has a path
      (https://api.example.com/mcp), which is indistinguishable from publishing
      nothing, so the endpoint URL is what gets sent. An authorization server
      entitled to reject an unknown target answers 'invalid_target'.
@y
      --resource replaces that derivation with a value you supply. Use it when the
      derived one is wrong — most often a server whose published identifier is its
      bare origin (https://api.example.com) while its endpoint has a path
      (https://api.example.com/mcp), which is indistinguishable from publishing
      nothing, so the endpoint URL is what gets sent. An authorization server
      entitled to reject an unknown target answers 'invalid_target'.
@z

@x
      The value must be an absolute URI with a scheme and a host, and RFC 8707 §2
      forbids a fragment; a bad value fails the add rather than being repaired or
      dropped later. It is sent VERBATIM — nothing is lowercased and no path or
      trailing slash is adjusted, because the string names a server and changing it
      could name a different one. Only one value is accepted: a gateway backend
      connects to exactly one MCP endpoint.
@y
      The value must be an absolute URI with a scheme and a host, and RFC 8707 §2
      forbids a fragment; a bad value fails the add rather than being repaired or
      dropped later. It is sent VERBATIM — nothing is lowercased and no path or
      trailing slash is adjusted, because the string names a server and changing it
      could name a different one. Only one value is accepted: a gateway backend
      connects to exactly one MCP endpoint.
@z

@x
      It outranks both the published value and the URL derivation, and also an
      authorization server advertising resource_indicators_supported=false (the add
      says so when that happens). It is recorded on the registration, so there is no
      'sbx mcp auth --resource': one value is used by the add-time authorization,
      every later 'sbx mcp auth', and every token refresh — a resource that differed
      between them is the audience mismatch this parameter exists to prevent. To
      change it, 'sbx mcp rm' the server and add it again; the existing token was
      minted for the old resource anyway.
@y
      It outranks both the published value and the URL derivation, and also an
      authorization server advertising resource_indicators_supported=false (the add
      says so when that happens). It is recorded on the registration, so there is no
      'sbx mcp auth --resource': one value is used by the add-time authorization,
      every later 'sbx mcp auth', and every token refresh — a resource that differed
      between them is the audience mismatch this parameter exists to prevent. To
      change it, 'sbx mcp rm' the server and add it again; the existing token was
      minted for the old resource anyway.
@z

@x
      Not 'audience': RFC 8707 'resource' is what the MCP specification requires, and
      an 'audience' parameter on an authorization-code request is an Auth0/Okta
      vendor extension that sbx does not send. See 'sbx mcp inspect <name>' for the
      effective value and where it came from.
@y
      Not 'audience': RFC 8707 'resource' is what the MCP specification requires, and
      an 'audience' parameter on an authorization-code request is an Auth0/Okta
      vendor extension that sbx does not send. See 'sbx mcp inspect <name>' for the
      effective value and where it came from.
@z

@x
      Scope limit: this governs the OAuth flow sbx itself runs — a local data plane
      (SBX_MCP_URL=none), and any server registered with
      --oauth-authorization-server/--client-id. For a plain remote in hosted mode the
      control-plane gateway is the OAuth client and does not carry the field yet, so
      the value is recorded and the add warns that it is not sent for that server.
@y
      Scope limit: this governs the OAuth flow sbx itself runs — a local data plane
      (SBX_MCP_URL=none), and any server registered with
      --oauth-authorization-server/--client-id. For a plain remote in hosted mode the
      control-plane gateway is the OAuth client and does not carry the field yet, so
      the value is recorded and the add warns that it is not sent for that server.
@z

@x
    Custom request headers for remote endpoints (--header):
      --header adds an HTTP header to every request sent to a remote --url
      endpoint, written in the curl convention 'Header-Name: header value'.
      Repeat the flag for more headers; each header name may be given once.
      Headers the transport owns (Host, Content-Length, Connection, Proxy-*, …)
      are rejected.
@y
    Custom request headers for remote endpoints (--header):
      --header adds an HTTP header to every request sent to a remote --url
      endpoint, written in the curl convention 'Header-Name: header value'.
      Repeat the flag for more headers; each header name may be given once.
      Headers the transport owns (Host, Content-Length, Connection, Proxy-*, …)
      are rejected.
@z

@x
      Only a remote endpoint can carry them: --header is refused with --command
      and --local, and an add whose --url resolves to a stdio server (a registry
      or manifest URL naming an OCI image) fails rather than dropping them.
@y
      Only a remote endpoint can carry them: --header is refused with --command
      and --local, and an add whose --url resolves to a stdio server (a registry
      or manifest URL naming an OCI image) fails rather than dropping them.
@z

@x
      A header value may reference a secret with ${placeholder}. The placeholder is
      stored in the registration exactly as typed and the secret itself never is;
      the value is read from the encrypted secret store and substituted when a
      sandbox connects to the server. Store it with:
@y
      A header value may reference a secret with ${placeholder}. The placeholder is
      stored in the registration exactly as typed and the secret itself never is;
      the value is read from the encrypted secret store and substituted when a
      sandbox connects to the server. Store it with:
@z

@x
        sbx secret set mcp:<server>:<placeholder>
@y
        sbx secret set mcp:<server>:<placeholder>
@z

@x
      For example:
@y
      For example:
@z

@x
        sbx mcp add acme --url https://mcp.acme.com/mcp --header 'Authorization: Bearer ${api-key}'
        sbx secret set mcp:acme:api-key
@y
        sbx mcp add acme --url https://mcp.acme.com/mcp --header 'Authorization: Bearer ${api-key}'
        sbx secret set mcp:acme:api-key
@z

@x
      On an OAuth-protected server an explicit Authorization header takes
      precedence over the OAuth access token.
@y
      On an OAuth-protected server an explicit Authorization header takes
      precedence over the OAuth access token.
@z

@x
      Header secrets are read from the LOCAL secret store, so a header-bearing
      server only works where this host connects it. Adding one while your MCP
      gateway is the hosted (SaaS) one is rejected rather than registered with
      headers that would be silently dropped — unless the server carries a
      hand-supplied OAuth override (--oauth-authorization-server), which this
      host connects directly in every gateway mode.
@y
      Header secrets are read from the LOCAL secret store, so a header-bearing
      server only works where this host connects it. Adding one while your MCP
      gateway is the hosted (SaaS) one is rejected rather than registered with
      headers that would be silently dropped — unless the server carries a
      hand-supplied OAuth override (--oauth-authorization-server), which this
      host connects directly in every gateway mode.
@z

@x
    Alternative input — local stdio command (--command + --args):
      The command runs as a subprocess on the HOST, outside the sandbox.
@y
    Alternative input — local stdio command (--command + --args):
      The command runs as a subprocess on the HOST, outside the sandbox.
@z

@x
      WARNING: Local servers are for ad-hoc development only. They have
      no identity, no verifiable supply chain, and no sandboxing. The
      process runs with your host user's full permissions — it can read
      your filesystem, access your network, and call any API your user
      can. Do not use --command with untrusted executables.
@y
      WARNING: Local servers are for ad-hoc development only. They have
      no identity, no verifiable supply chain, and no sandboxing. The
      process runs with your host user's full permissions — it can read
      your filesystem, access your network, and call any API your user
      can. Do not use --command with untrusted executables.
@z

@x
usage: sbx mcp add <name> (--url <url> | --command <cmd>) [flags]
@y
usage: sbx mcp add <name> (--url <url> | --command <cmd>) [flags]
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

@x cloud-api-url
      usage: |
        Cloud Sandboxes API base URL; only used with --cloud. Defaults to prod (https://api.sandboxes-cloud.docker.com). Set DOCKER_CLOUD_API_URL or pass this flag to override; a legacy value ending in /v1 is accepted.
@y
      usage: |
        Cloud Sandboxes API base URL; only used with --cloud. Defaults to prod (https://api.sandboxes-cloud.docker.com). Set DOCKER_CLOUD_API_URL or pass this flag to override; a legacy value ending in /v1 is accepted.
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
