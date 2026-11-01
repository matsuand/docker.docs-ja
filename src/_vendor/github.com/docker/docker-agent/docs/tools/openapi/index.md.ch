%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "OpenAPI Tool"
description: "Automatically generate tools from an OpenAPI specification."
keywords: docker agent, ai agents, tools, toolsets, openapi tool
linkTitle: "OpenAPI"
@y
title: "OpenAPI Tool"
description: "Automatically generate tools from an OpenAPI specification."
keywords: docker agent, ai agents, tools, toolsets, openapi tool
linkTitle: "OpenAPI"
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/tools/openapi/
@y
canonical: __SUBDIR__/ai/docker-agent/tools/openapi/
@z

@x
_Automatically generate tools from an OpenAPI specification._
@y
_Automatically generate tools from an OpenAPI specification._
@z

@x
## Overview
@y
## Overview
@z

@x
The OpenAPI tool fetches an OpenAPI 3.x specification from a URL and creates one tool per API operation. Each endpoint's parameters, request body, and description are translated into a callable tool that the agent can invoke directly.
@y
The OpenAPI tool fetches an OpenAPI 3.x specification from a URL and creates one tool per API operation. Each endpoint's parameters, request body, and description are translated into a callable tool that the agent can invoke directly.
@z

@x
## Configuration
@y
## Configuration
@z

@x
```yaml
toolsets:
  - type: openapi
    url: "https://petstore3.swagger.io/api/v3/openapi.json"
```
@y
```yaml
toolsets:
  - type: openapi
    url: "https://petstore3.swagger.io/api/v3/openapi.json"
```
@z

@x
### With custom headers
@y
### With custom headers
@z

@x
Pass custom headers to every HTTP request made by the generated tools (for example, for authentication):
@y
Pass custom headers to every HTTP request made by the generated tools (for example, for authentication):
@z

@x
```yaml
toolsets:
  - type: openapi
    url: "https://api.example.com/openapi.json"
    headers:
      Authorization: "Bearer ${env.API_TOKEN}"
      X-Custom-Header: "my-value"
```
@y
```yaml
toolsets:
  - type: openapi
    url: "https://api.example.com/openapi.json"
    headers:
      Authorization: "Bearer ${env.API_TOKEN}"
      X-Custom-Header: "my-value"
```
@z

@x
### Custom timeout
@y
### Custom timeout
@z

@x
Override the default 30-second HTTP timeout (applies both to fetching the spec and to the generated tool calls):
@y
Override the default 30-second HTTP timeout (applies both to fetching the spec and to the generated tool calls):
@z

@x
```yaml
toolsets:
  - type: openapi
    url: "https://api.example.com/openapi.json"
    timeout: 60
```
@y
```yaml
toolsets:
  - type: openapi
    url: "https://api.example.com/openapi.json"
    timeout: 60
```
@z

@x
### Reaching internal services
@y
### Reaching internal services
@z

@x
By default, the OpenAPI tool's **direct path** refuses connections to non-public IP addresses, including a public hostname that resolves to an internal address. Docker Agent does not evaluate PAC, so the dial-time guard applies when Docker Desktop is unavailable or bypassed; egress selected by Docker Desktop — through a proxy or with PAC `DIRECT` — is outside local dial-time enforcement. Opt in with `allow_private_ips` when the spec or its `servers` entries legitimately target localhost or your internal network:
@y
By default, the OpenAPI tool's **direct path** refuses connections to non-public IP addresses, including a public hostname that resolves to an internal address. Docker Agent does not evaluate PAC, so the dial-time guard applies when Docker Desktop is unavailable or bypassed; egress selected by Docker Desktop — through a proxy or with PAC `DIRECT` — is outside local dial-time enforcement. Opt in with `allow_private_ips` when the spec or its `servers` entries legitimately target localhost or your internal network:
@z

@x
```yaml
toolsets:
  - type: openapi
    url: "http://localhost:8080/openapi.json"
    allow_private_ips: true
```
@y
```yaml
toolsets:
  - type: openapi
    url: "http://localhost:8080/openapi.json"
    allow_private_ips: true
```
@z

@x
When Docker Desktop is running, eligible public destinations use its PAC proxy before standard environment-proxy routing. A PAC `DIRECT` response selects Docker Desktop's direct egress. `NO_PROXY` does not bypass Desktop PAC selection; set `DOCKER_AGENT_DISABLE_DESKTOP_PROXY=1` (or `true`, `yes`, or `on`) to bypass only the Desktop adapter per request and restore standard `HTTP_PROXY`, `HTTPS_PROXY`, `ALL_PROXY`, and `NO_PROXY` routing. Loopback always stays direct. For guarded requests, Docker Desktop PAC routing is restricted to Docker-owned hostnames (docker.com and docker.io families); all other hosts use the direct SSRF-guarded path. Within the allowed set, local DNS preflight requires public addresses before Docker Desktop is selected; the lookup is bounded (2 seconds) and, if it times out while the request's own context is still live, resolution falls through to Docker Desktop routing rather than blocking indefinitely. NXDOMAIN, empty results, other resolver errors, and private or mixed answers still stay on the SSRF-protected direct path. This preflight does not validate Docker Desktop-selected egress, whether PAC selects a proxy or `DIRECT`. `allow_private_ips: true` removes that direct-path guard for trusted internal services, but Desktop PAC still takes precedence for eligible non-loopback destinations. See [Docker Desktop proxy](../fetch/index.md#docker-desktop-proxy).
@y
When Docker Desktop is running, eligible public destinations use its PAC proxy before standard environment-proxy routing. A PAC `DIRECT` response selects Docker Desktop's direct egress. `NO_PROXY` does not bypass Desktop PAC selection; set `DOCKER_AGENT_DISABLE_DESKTOP_PROXY=1` (or `true`, `yes`, or `on`) to bypass only the Desktop adapter per request and restore standard `HTTP_PROXY`, `HTTPS_PROXY`, `ALL_PROXY`, and `NO_PROXY` routing. Loopback always stays direct. For guarded requests, Docker Desktop PAC routing is restricted to Docker-owned hostnames (docker.com and docker.io families); all other hosts use the direct SSRF-guarded path. Within the allowed set, local DNS preflight requires public addresses before Docker Desktop is selected; the lookup is bounded (2 seconds) and, if it times out while the request's own context is still live, resolution falls through to Docker Desktop routing rather than blocking indefinitely. NXDOMAIN, empty results, other resolver errors, and private or mixed answers still stay on the SSRF-protected direct path. This preflight does not validate Docker Desktop-selected egress, whether PAC selects a proxy or `DIRECT`. `allow_private_ips: true` removes that direct-path guard for trusted internal services, but Desktop PAC still takes precedence for eligible non-loopback destinations. See [Docker Desktop proxy](../fetch/index.md#docker-desktop-proxy).
@z

@x
## Properties
@y
## Properties
@z

@x
| Property            | Type              | Required | Description                                                                                                                                                                                                                                                       |
| ------------------- | ----------------- | -------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `url`               | string            | ✓        | URL of the OpenAPI specification (JSON or YAML format). Supports `${env.VAR}` interpolation.                                                                                                                                                                              |
| `headers`           | map[string]string | ✗        | Custom HTTP headers sent with every request — both the spec fetch and every generated tool call. Values support `${env.VAR}` and `${headers.NAME}` placeholders (the latter forwards a header from the caller's incoming request when docker agent is exposed as a server). |
| `timeout`           | int               | ✗        | HTTP client timeout in seconds (default: `30`). Applies to both the spec fetch and the generated tools' requests.                                                                                                                                                 |
| `max_output_bytes` | integer | ✗ | Maximum returned response text in bytes. Omit for 30,000; `0` disables this cutoff while retaining the 1 MiB HTTP read cap. |
| `allow_private_ips` | boolean           | ✗        | Opt in to dialling **non-public** IP addresses (loopback, RFC1918, link-local — including the cloud-metadata endpoint at `169.254.169.254` — multicast and the unspecified address). Set to `true` only when the spec or its servers legitimately target internal services. By default such addresses are refused at dial time, after DNS resolution, so DNS rebinding cannot bypass the check. |
@y
| Property            | Type              | Required | Description                                                                                                                                                                                                                                                       |
| ------------------- | ----------------- | -------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `url`               | string            | ✓        | URL of the OpenAPI specification (JSON or YAML format). Supports `${env.VAR}` interpolation.                                                                                                                                                                              |
| `headers`           | map[string]string | ✗        | Custom HTTP headers sent with every request — both the spec fetch and every generated tool call. Values support `${env.VAR}` and `${headers.NAME}` placeholders (the latter forwards a header from the caller's incoming request when docker agent is exposed as a server). |
| `timeout`           | int               | ✗        | HTTP client timeout in seconds (default: `30`). Applies to both the spec fetch and the generated tools' requests.                                                                                                                                                 |
| `max_output_bytes` | integer | ✗ | Maximum returned response text in bytes. Omit for 30,000; `0` disables this cutoff while retaining the 1 MiB HTTP read cap. |
| `allow_private_ips` | boolean           | ✗        | Opt in to dialling **non-public** IP addresses (loopback, RFC1918, link-local — including the cloud-metadata endpoint at `169.254.169.254` — multicast and the unspecified address). Set to `true` only when the spec or its servers legitimately target internal services. By default such addresses are refused at dial time, after DNS resolution, so DNS rebinding cannot bypass the check. |
@z

@x
## How it works
@y
## How it works
@z

@x
1. The spec is fetched from the configured `url` at startup.
2. Each operation (GET, POST, PUT, …) becomes a separate tool named after its `operationId` (or `method_path` when no `operationId` is set).
3. Path and query parameters are exposed as tool parameters. Request body properties are prefixed with `body_`.
4. Read-only operations (GET, HEAD, OPTIONS) are annotated accordingly.
5. Responses are returned as text; errors include the HTTP status code.
@y
1. The spec is fetched from the configured `url` at startup.
2. Each operation (GET, POST, PUT, …) becomes a separate tool named after its `operationId` (or `method_path` when no `operationId` is set).
3. Path and query parameters are exposed as tool parameters. Request body properties are prefixed with `body_`.
4. Read-only operations (GET, HEAD, OPTIONS) are annotated accordingly.
5. Responses are returned as text; errors include the HTTP status code.
@z

@x
## Returned text size
@y
## Returned text size
@z

@x
Generated tools return at most 30,000 bytes of response text by default. Set
`max_output_bytes` to a larger positive limit, or `0` to disable this text cutoff:
@y
Generated tools return at most 30,000 bytes of response text by default. Set
`max_output_bytes` to a larger positive limit, or `0` to disable this text cutoff:
@z

@x
```yaml
toolsets:
  - type: openapi
    url: https://raw.githubusercontent.com/PokeAPI/pokeapi/master/openapi.yml
    tools: [pokemon_retrieve]
    max_output_bytes: 0
```
@y
```yaml
toolsets:
  - type: openapi
    url: https://raw.githubusercontent.com/PokeAPI/pokeapi/master/openapi.yml
    tools: [pokemon_retrieve]
    max_output_bytes: 0
```
@z

@x
The separate **1 MiB HTTP response read cap** still applies. Larger outputs also
remain subject to agent-level `max_tool_result_tokens`, context limits and provider
limits. Fetching more text can increase latency and token cost; a field-filtering
adapter may be preferable when most of a response is irrelevant.
@y
The separate **1 MiB HTTP response read cap** still applies. Larger outputs also
remain subject to agent-level `max_tool_result_tokens`, context limits and provider
limits. Fetching more text can increase latency and token cost; a field-filtering
adapter may be preferable when most of a response is irrelevant.
@z

@x
## Limits
@y
## Limits
@z

@x
- The OpenAPI spec must be **10 MB or less**.
- Individual API responses are truncated at **1 MB**.
@y
- The OpenAPI spec must be **10 MB or less**.
- Individual API responses are truncated at **1 MB**.
@z

@x
## Example
@y
## Example
@z

@x
See the full [Pet Store example](https://github.com/docker/docker-agent/blob/main/examples/openapi-petstore.yaml) for a working agent configuration.
@y
See the full [Pet Store example](https://github.com/docker/docker-agent/blob/main/examples/openapi-petstore.yaml) for a working agent configuration.
@z
