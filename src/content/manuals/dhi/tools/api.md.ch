%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Use the DHI API
linktitle: API
description: Query Docker Hardened Images data programmatically using the DHI GraphQL API.
@y
title: Use the DHI API
linktitle: API
description: Query Docker Hardened Images data programmatically using the DHI GraphQL API.
@z

@x
keywords: dhi api, docker hardened images api, graphql api, dhi endpoint, dhi authentication
@y
keywords: dhi api, docker hardened images api, graphql api, dhi endpoint, dhi authentication
@z

@x
The DHI API is a GraphQL API for querying Docker Hardened Images data
programmatically, for use cases like building automation or dashboards on
top of DHI data.
@y
The DHI API is a GraphQL API for querying Docker Hardened Images data
programmatically, for use cases like building automation or dashboards on
top of DHI data.
@z

@x
## Endpoint
@y
## Endpoint
@z

@x
Send requests as `POST` requests to:
@y
Send requests as `POST` requests to:
@z

@x
```text
https://api.dso.docker.com/v1/graphql
```
@y
```text
https://api.dso.docker.com/v1/graphql
```
@z

@x
## Request format
@y
## Request format
@z

@x
The API accepts standard GraphQL requests: a JSON body with a `query` and,
optionally, `variables`.
@y
The API accepts standard GraphQL requests: a JSON body with a `query` and,
optionally, `variables`.
@z

@x
```console
$ curl https://api.dso.docker.com/v1/graphql \
  -H "Authorization: Bearer <token>" \
  -H "Content-Type: application/json" \
  -d '{"query": "...", "variables": { ... }}'
```
@y
```console
$ curl https://api.dso.docker.com/v1/graphql \
  -H "Authorization: Bearer <token>" \
  -H "Content-Type: application/json" \
  -d '{"query": "...", "variables": { ... }}'
```
@z

@x
Every query takes a `Context` argument (conventionally named `ctx` in the
`variables` object) alongside its query-specific arguments:
@y
Every query takes a `Context` argument (conventionally named `ctx` in the
`variables` object) alongside its query-specific arguments:
@z

@x
| Argument | Type | Required | Description |
|---|---|---|---|
| `ctx` | `Context` | Yes | Scopes the request to an organization. |
| `ctx.organization` | `String` | Yes | The Docker organization the token belongs to. |
@y
| Argument | Type | Required | Description |
|---|---|---|---|
| `ctx` | `Context` | Yes | Scopes the request to an organization. |
| `ctx.organization` | `String` | Yes | The Docker organization the token belongs to. |
@z

@x
## Authentication
@y
## Authentication
@z

@x
An [organization access token](/manuals/security/access-tokens/organization-access-tokens.md)
(OAT) or personal access token (PAT) isn't used directly as the bearer
token. Exchange it first for an access token:
@y
An [organization access token](manuals/security/access-tokens/organization-access-tokens.md)
(OAT) or personal access token (PAT) isn't used directly as the bearer
token. Exchange it first for an access token:
@z

@x
```console
$ curl -X POST https://hub.docker.com/v2/auth/token \
  -H "Content-Type: application/json" \
  -d '{"identifier": "<identifier>", "secret": "<token>"}'
```
@y
```console
$ curl -X POST https://hub.docker.com/v2/auth/token \
  -H "Content-Type: application/json" \
  -d '{"identifier": "<identifier>", "secret": "<token>"}'
```
@z

@x
For `identifier`, use your Docker Hub username with a PAT, or the
organization name with an OAT. The response contains the access token:
@y
For `identifier`, use your Docker Hub username with a PAT, or the
organization name with an OAT. The response contains the access token:
@z

@x
```json
{ "access_token": "..." }
```
@y
```json
{ "access_token": "..." }
```
@z

@x
Pass that `access_token` as `Authorization: Bearer <access_token>`. Also set
`ctx.organization` in `variables` to the organization the token belongs to
(see [Request format](#request-format)).
@y
Pass that `access_token` as `Authorization: Bearer <access_token>`. Also set
`ctx.organization` in `variables` to the organization the token belongs to
(see [Request format](#request-format)).
@z

@x
## Response format
@y
## Response format
@z

@x
Responses follow the standard GraphQL envelope:
@y
Responses follow the standard GraphQL envelope:
@z

@x
| Key | Description |
|---|---|
| `data` | The requested fields. A field is `null` if it couldn't be resolved, for example due to an authorization failure. |
| `errors` | Present when a field failed to resolve. Includes a `message` and a `path` identifying which field failed. |
| `extensions` | Metadata such as a `correlation_id`, useful when reporting an issue. |
@y
| Key | Description |
|---|---|
| `data` | The requested fields. A field is `null` if it couldn't be resolved, for example due to an authorization failure. |
| `errors` | Present when a field failed to resolve. Includes a `message` and a `path` identifying which field failed. |
| `extensions` | Metadata such as a `correlation_id`, useful when reporting an issue. |
@z

@x
For example, an unauthenticated request, or a request for data your token
can't access, returns a `null` result under `data` alongside an authorization
error in `errors`, rather than an HTTP-level failure:
@y
For example, an unauthenticated request, or a request for data your token
can't access, returns a `null` result under `data` alongside an authorization
error in `errors`, rather than an HTTP-level failure:
@z

@x
```json
{
  "errors": [
    {
      "message": "You are not allowed to read data for this team",
      "path": ["someQuery"],
      "extensions": { "code": "DOWNSTREAM_SERVICE_ERROR", "status": 403 }
    }
  ],
  "data": { "someQuery": null },
  "extensions": { "correlation_id": "..." }
}
```
@y
```json
{
  "errors": [
    {
      "message": "You are not allowed to read data for this team",
      "path": ["someQuery"],
      "extensions": { "code": "DOWNSTREAM_SERVICE_ERROR", "status": 403 }
    }
  ],
  "data": { "someQuery": null },
  "extensions": { "correlation_id": "..." }
}
```
@z

@x
## Queries
@y
## Queries
@z

@x
### `imagePackagesForImageCoords`
@y
### `imagePackagesForImageCoords`
@z

@x
Fetches every package in an image, every CVE reported against it, and
whether Docker suppresses that CVE, by digest. See [Query VEX for a Docker
Hardened Image](/manuals/dhi/how-to/vex-api.md) for a guided example.
@y
Fetches every package in an image, every CVE reported against it, and
whether Docker suppresses that CVE, by digest. See [Query VEX for a Docker
Hardened Image](manuals/dhi/how-to/vex-api.md) for a guided example.
@z

@x
| Argument | Type | Required | Description |
|---|---|---|---|
| `digest` | `String` | Yes | The image's platform manifest digest, not the multi-arch index digest. |
| `hostName` | `String` | Yes | `hub.docker.com` or `docker.io`. |
| `repoName` | `String` | Yes | Repository name, with or without the namespace prefix. |
| `includeExcepted` | `Boolean` | No | Include suppressed CVEs in the response alongside the reason for suppression. Without it, the response only shows the netted list, with no visibility into what was suppressed. |
| `includeNodsa` | `Boolean` | No | Include Debian NODSA exclusions, which make up most suppressions on a Debian-based image. |
| `includePublic` | `Boolean` | No | Also include public images when `ctx.organization` scopes the request to an organization. Not needed for a typical lookup. |
@y
| Argument | Type | Required | Description |
|---|---|---|---|
| `digest` | `String` | Yes | The image's platform manifest digest, not the multi-arch index digest. |
| `hostName` | `String` | Yes | `hub.docker.com` or `docker.io`. |
| `repoName` | `String` | Yes | Repository name, with or without the namespace prefix. |
| `includeExcepted` | `Boolean` | No | Include suppressed CVEs in the response alongside the reason for suppression. Without it, the response only shows the netted list, with no visibility into what was suppressed. |
| `includeNodsa` | `Boolean` | No | Include Debian NODSA exclusions, which make up most suppressions on a Debian-based image. |
| `includePublic` | `Boolean` | No | Also include public images when `ctx.organization` scopes the request to an organization. Not needed for a typical lookup. |
@z

@x
Keep the requested response fields limited to what you plan to render.
Fields such as `locations`, `description`, `vulnerableRange`, and `epss`
increase response size substantially and aren't needed for a CVE-count or
suppressed-CVE view.
@y
Keep the requested response fields limited to what you plan to render.
Fields such as `locations`, `description`, `vulnerableRange`, and `epss`
increase response size substantially and aren't needed for a CVE-count or
suppressed-CVE view.
@z

@x
#### Response fields
@y
#### Response fields
@z

@x
`vulnerabilityExceptions` only contains records that actually suppress a
CVE, so it always lines up with `isExcepted`: an empty array means the CVE
is live. Use `isExcepted` as your filter for "is this CVE suppressed."
@y
`vulnerabilityExceptions` only contains records that actually suppress a
CVE, so it always lines up with `isExcepted`: an empty array means the CVE
is live. Use `isExcepted` as your filter for "is this CVE suppressed."
@z

@x
| Field | Meaning |
|---|---|
| `isExcepted` | Docker suppresses this CVE for this image. Use this to filter. |
| `sourceType` | `EXTERNAL` (Debian NODSA), `MANUAL_EXCEPTION` (Docker analyst exception), or `VEX_STATEMENT` (an ingested VEX document). |
| `type` | `FALSE_POSITIVE` and `ACCEPTED_RISK` suppress the CVE. `UNDER_INVESTIGATION` and `AFFECTED` don't. |
| `justification` | The OpenVEX justification value. Always `null` for NODSA exclusions. |
| `additionalDetails` | Free-text rationale for the suppression. |
| `isDhiStatement` | Whether the statement is inherited from the DHI base image. |
| `id` | Stable identifier for the statement. |
@y
| Field | Meaning |
|---|---|
| `isExcepted` | Docker suppresses this CVE for this image. Use this to filter. |
| `sourceType` | `EXTERNAL` (Debian NODSA), `MANUAL_EXCEPTION` (Docker analyst exception), or `VEX_STATEMENT` (an ingested VEX document). |
| `type` | `FALSE_POSITIVE` and `ACCEPTED_RISK` suppress the CVE. `UNDER_INVESTIGATION` and `AFFECTED` don't. |
| `justification` | The OpenVEX justification value. Always `null` for NODSA exclusions. |
| `additionalDetails` | Free-text rationale for the suppression. |
| `isDhiStatement` | Whether the statement is inherited from the DHI base image. |
| `id` | Stable identifier for the statement. |
@z

@x
#### Mapping to OpenVEX
@y
#### Mapping to OpenVEX
@z

@x
If your pipeline consumes OpenVEX documents (for example, Trivy's `--vex`
flag), each suppressed record maps as follows:
@y
If your pipeline consumes OpenVEX documents (for example, Trivy's `--vex`
flag), each suppressed record maps as follows:
@z

@x
| OpenVEX field | Source |
|---|---|
| `vulnerability.name` | `sourceId` |
| `products[].@id` | The parent package's `purl` |
| `status` | `not_affected` (from `type: FALSE_POSITIVE`) |
| `justification` | `justification`, defaulting to `vulnerable_code_cannot_be_controlled_by_adversary` for NODSA exclusions |
| `status_notes` | `additionalDetails` |
| `@id` | `id` |
@y
| OpenVEX field | Source |
|---|---|
| `vulnerability.name` | `sourceId` |
| `products[].@id` | The parent package's `purl` |
| `status` | `not_affected` (from `type: FALSE_POSITIVE`) |
| `justification` | `justification`, defaulting to `vulnerable_code_cannot_be_controlled_by_adversary` for NODSA exclusions |
| `status_notes` | `additionalDetails` |
| `@id` | `id` |
@z
