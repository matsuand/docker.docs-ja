%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx mcp auth
synopsis: Authorize MCP servers
description: |-
    Authorize registered MCP servers with OAuth.
@y
name: sbx mcp auth
synopsis: Authorize MCP servers
description: |-
    Authorize registered MCP servers with OAuth.
@z

@x
    With a local gateway or an OAuth override in the server registration, credentials
    are stored locally. Otherwise, the hosted MCP control plane manages them.
@y
    With a local gateway or an OAuth override in the server registration, credentials
    are stored locally. Otherwise, the hosted MCP control plane manages them.
@z

@x
    Hosted operations use the Docker Hub account from 'sbx login'. The control plane
    derives user and tenant identity; they are not sent in the request body.
@y
    Hosted operations use the Docker Hub account from 'sbx login'. The control plane
    derives user and tenant identity; they are not sent in the request body.
@z

@x
    Running 'sbx mcp auth <server>' authorizes or reauthorizes one server, even if it
    already has stored credentials.
@y
    Running 'sbx mcp auth <server>' authorizes or reauthorizes one server, even if it
    already has stored credentials.
@z

@x
    Use 'sbx mcp auth status' to inspect credential status without starting OAuth,
    and 'sbx mcp auth rm' to remove credentials without removing local MCP server
    registrations.
@y
    Use 'sbx mcp auth status' to inspect credential status without starting OAuth,
    and 'sbx mcp auth rm' to remove credentials without removing local MCP server
    registrations.
@z

@x
    Pass --scope (repeatable) to authorize a specific set of scopes for this run,
    overriding the default recorded at 'sbx mcp add' time. Precedence is --no-scope >
    an explicit --scope > the recorded default > the scope set the RESOURCE says it
    requires (from its RFC 9728 metadata or its WWW-Authenticate challenge) > whichever
    of openid, email, profile, and offline_access are advertised. Other advertised
    scopes are excluded from this fallback. If no scopes are selected, the scope
    parameter is omitted so the authorization server can apply its own default grant.
@y
    Pass --scope (repeatable) to authorize a specific set of scopes for this run,
    overriding the default recorded at 'sbx mcp add' time. Precedence is --no-scope >
    an explicit --scope > the recorded default > the scope set the RESOURCE says it
    requires (from its RFC 9728 metadata or its WWW-Authenticate challenge) > whichever
    of openid, email, profile, and offline_access are advertised. Other advertised
    scopes are excluded from this fallback. If no scopes are selected, the scope
    parameter is omitted so the authorization server can apply its own default grant.
@z

@x
    A resource that publishes a required set therefore gets it requested without any
    flag, and the consent block marks that set as derived rather than chosen. Pass
    --no-scope to suppress all scope fallbacks and request the server's default grant.
@y
    A resource that publishes a required set therefore gets it requested without any
    flag, and the consent block marks that set as derived rather than chosen. Pass
    --no-scope to suppress all scope fallbacks and request the server's default grant.
@z

@x
    When using recorded defaults or resource scopes, sbx also requests offline_access
    if the authorization server advertises it, allowing refresh tokens. An explicit
    --scope on this command requests exactly that set, without adding offline_access.
@y
    When using recorded defaults or resource scopes, sbx also requests offline_access
    if the authorization server advertises it, allowing refresh tokens. An explicit
    --scope on this command requests exactly that set, without adding offline_access.
@z

@x
    Scopes you choose are checked against both the authorization server's RFC 8414
    scopes_supported and the resource's RFC 9728 metadata. A scope present in neither
    prints a warning but is still requested. If neither document publishes scopes,
    the request is accepted as given.
    Membership is not a promise: scopes_supported is what the server SUPPORTS, not
    what it will grant this client, so an advertised scope can still be refused at
    consent time. In local data-plane mode a refusal prints the requested set, the
    advertised set, the scopes the server named, and a narrower retry command; the
    hosted control plane reports only that authorization failed or timed out.
@y
    Scopes you choose are checked against both the authorization server's RFC 8414
    scopes_supported and the resource's RFC 9728 metadata. A scope present in neither
    prints a warning but is still requested. If neither document publishes scopes,
    the request is accepted as given.
    Membership is not a promise: scopes_supported is what the server SUPPORTS, not
    what it will grant this client, so an advertised scope can still be refused at
    consent time. In local data-plane mode a refusal prints the requested set, the
    advertised set, the scopes the server named, and a narrower retry command; the
    hosted control plane reports only that authorization failed or timed out.
@z

@x
    For an existing or freshly completed authorization, the GRANTED set — what the
    authorization server actually handed over — is reported alongside the status. An
    authorization server may grant less than was asked for; when it restates no set
    at all, RFC 6749 §5.1 makes that the set that was requested.
@y
    For an existing or freshly completed authorization, the GRANTED set — what the
    authorization server actually handed over — is reported alongside the status. An
    authorization server may grant less than was asked for; when it restates no set
    at all, RFC 6749 §5.1 makes that the set that was requested.
@z

@x
    Scope values may be URN-shaped (urn:ietf:params:oauth:scope:mail) or URL-shaped
    (https://www.fastmail.com/dev/mcp); neither needs quoting.
@y
    Scope values may be URN-shaped (urn:ietf:params:oauth:scope:mail) or URL-shaped
    (https://www.fastmail.com/dev/mcp); neither needs quoting.
@z

@x
usage: sbx mcp auth [SERVER] [flags]
@y
usage: sbx mcp auth [SERVER] [flags]
@z

% options:

@x all
      usage: Apply to all registered OAuth servers
@y
      usage: Apply to all registered OAuth servers
@z

@x format
      usage: 'Output format: "text" or "json"'
@y
      usage: 'Output format: "text" or "json"'
@z

@x help
      usage: help for auth
@y
      usage: help for auth
@z

@x json
      usage: Output in JSON format
@y
      usage: Output in JSON format
@z

@x no-scope
      usage: |
        Request no scopes at all for this run, so the authorization server applies its own default grant. Suppresses recorded, required, and OIDC fallback scopes; cannot be combined with --scope
@y
      usage: |
        Request no scopes at all for this run, so the authorization server applies its own default grant. Suppresses recorded, required, and OIDC fallback scopes; cannot be combined with --scope
@z

@x scope
      usage: |
        OAuth scope to authorize for this run (repeatable; overrides the recorded default; unrecognized scopes warn but are still requested). With no --scope and no recorded default, the scope set the resource itself requires is requested; with none of those, whichever of openid, email, profile, and offline_access are advertised are requested; other advertised scopes are excluded from this fallback
@y
      usage: |
        OAuth scope to authorize for this run (repeatable; overrides the recorded default; unrecognized scopes warn but are still requested). With no --scope and no recorded default, the scope set the resource itself requires is requested; with none of those, whichever of openid, email, profile, and offline_access are advertised are requested; other advertised scopes are excluded from this fallback
@z

@x verbose
      usage: Print authorization polling progress
@y
      usage: Print authorization polling progress
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

@x no-input
      usage: |
        Never prompt; commands that need an answer fail with the command to run instead
@y
      usage: |
        Never prompt; commands that need an answer fail with the command to run instead
@z

@x
example: |4-
      sbx mcp auth status --all
      sbx mcp auth status notion
      sbx mcp auth rm --all
      sbx mcp auth rm notion
      sbx mcp auth --all
      sbx mcp auth notion
      sbx mcp auth notion --scope read --scope write
      sbx mcp auth notion --no-scope
@y
example: |4-
      sbx mcp auth status --all
      sbx mcp auth status notion
      sbx mcp auth rm --all
      sbx mcp auth rm notion
      sbx mcp auth --all
      sbx mcp auth notion
      sbx mcp auth notion --scope read --scope write
      sbx mcp auth notion --no-scope
@z

% see_also:

@x
    - sbx mcp - Manage MCP servers
    - sbx mcp auth rm - Remove MCP server OAuth credentials
    - sbx mcp auth status - Show MCP server OAuth status
@y
    - sbx mcp - Manage MCP servers
    - sbx mcp auth rm - Remove MCP server OAuth credentials
    - sbx mcp auth status - Show MCP server OAuth status
@z
