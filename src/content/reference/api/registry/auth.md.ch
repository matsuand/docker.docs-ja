%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Registry authentication
description: "Specifies the Docker Registry v2 authentication"
keywords: registry, images, tags, repository, distribution, Bearer authentication, advanced
@y
title: Registry authentication
description: "Specifies the Docker Registry v2 authentication"
keywords: registry, images, tags, repository, distribution, Bearer authentication, advanced
@z

@x
This document outlines the registry authentication scheme:
@y
This document outlines the registry authentication scheme:
@z

@x
![v2 registry auth](./images/v2-registry-auth.png)
@y
![v2 registry auth](./images/v2-registry-auth.png)
@z

@x
1. Attempt to begin a push/pull operation with the registry.
2. If the registry requires authorization it will return a `401 Unauthorized`
   HTTP response with information on how to authenticate.
3. The registry client makes a request to the authorization service for a
   Bearer token.
4. The authorization service returns an opaque Bearer token representing the
   client's authorized access.
5. The client retries the original request with the Bearer token embedded in
   the request's Authorization header.
6. The Registry authorizes the client by validating the Bearer token and the
   claim set embedded within it and begins the push/pull session as usual.
@y
1. Attempt to begin a push/pull operation with the registry.
2. If the registry requires authorization it will return a `401 Unauthorized`
   HTTP response with information on how to authenticate.
3. The registry client makes a request to the authorization service for a
   Bearer token.
4. The authorization service returns an opaque Bearer token representing the
   client's authorized access.
5. The client retries the original request with the Bearer token embedded in
   the request's Authorization header.
6. The Registry authorizes the client by validating the Bearer token and the
   claim set embedded within it and begins the push/pull session as usual.
@z

@x
## Requirements
@y
## Requirements
@z

@x
- Registry clients which can understand and respond to token auth challenges
  returned by the resource server.
- An authorization server capable of managing access controls to their
  resources hosted by any given service (such as repositories in a Docker
  Registry).
- A Docker Registry capable of trusting the authorization server to sign tokens
  which clients can use for authorization and the ability to verify these
  tokens for single use or for use during a sufficiently short period of time.
@y
- Registry clients which can understand and respond to token auth challenges
  returned by the resource server.
- An authorization server capable of managing access controls to their
  resources hosted by any given service (such as repositories in a Docker
  Registry).
- A Docker Registry capable of trusting the authorization server to sign tokens
  which clients can use for authorization and the ability to verify these
  tokens for single use or for use during a sufficiently short period of time.
@z

@x
## Authorization server endpoint descriptions
@y
## Authorization server endpoint descriptions
@z

@x
The described server is meant to serve as a standalone access control manager
for resources hosted by other services which want to authenticate and manage
authorizations using a separate access control manager.
@y
The described server is meant to serve as a standalone access control manager
for resources hosted by other services which want to authenticate and manage
authorizations using a separate access control manager.
@z

@x
A service like this is used by the official Docker Registry to authenticate
clients and verify their authorization to Docker image repositories.
@y
A service like this is used by the official Docker Registry to authenticate
clients and verify their authorization to Docker image repositories.
@z

@x
As of Docker 1.6, the registry client within the Docker Engine has been updated
to handle such an authorization workflow.
@y
As of Docker 1.6, the registry client within the Docker Engine has been updated
to handle such an authorization workflow.
@z

@x
## How to authenticate
@y
## How to authenticate
@z

@x
Registry V1 clients first contact the index to initiate a push or pull. Under
the Registry V2 workflow, clients should contact the registry first. If the
registry server requires authentication it will return a `401 Unauthorized`
response with a `WWW-Authenticate` header detailing how to authenticate to this
registry.
@y
Registry V1 clients first contact the index to initiate a push or pull. Under
the Registry V2 workflow, clients should contact the registry first. If the
registry server requires authentication it will return a `401 Unauthorized`
response with a `WWW-Authenticate` header detailing how to authenticate to this
registry.
@z

@x
For example, say I (username `jlhawn`) am attempting to push an image to the
repository `samalba/my-app`. For the registry to authorize this, I will need
`push` access to the `samalba/my-app` repository. The registry will first
return this response:
@y
For example, say I (username `jlhawn`) am attempting to push an image to the
repository `samalba/my-app`. For the registry to authorize this, I will need
`push` access to the `samalba/my-app` repository. The registry will first
return this response:
@z

@x
```text
HTTP/1.1 401 Unauthorized
Content-Type: application/json; charset=utf-8
Docker-Distribution-Api-Version: registry/2.0
Www-Authenticate: Bearer realm="https://auth.docker.io/token",service="registry.docker.io",scope="repository:samalba/my-app:pull,push"
Date: Thu, 10 Sep 2015 19:32:31 GMT
Content-Length: 235
Strict-Transport-Security: max-age=31536000
@y
```text
HTTP/1.1 401 Unauthorized
Content-Type: application/json; charset=utf-8
Docker-Distribution-Api-Version: registry/2.0
Www-Authenticate: Bearer realm="https://auth.docker.io/token",service="registry.docker.io",scope="repository:samalba/my-app:pull,push"
Date: Thu, 10 Sep 2015 19:32:31 GMT
Content-Length: 235
Strict-Transport-Security: max-age=31536000
@z

@x
{"errors":[{"code":"UNAUTHORIZED","message":"access to the requested resource is not authorized","detail":[{"Type":"repository","Name":"samalba/my-app","Action":"pull"},{"Type":"repository","Name":"samalba/my-app","Action":"push"}]}]}
```
@y
{"errors":[{"code":"UNAUTHORIZED","message":"access to the requested resource is not authorized","detail":[{"Type":"repository","Name":"samalba/my-app","Action":"pull"},{"Type":"repository","Name":"samalba/my-app","Action":"push"}]}]}
```
@z

@x
Note the HTTP Response Header indicating the auth challenge:
@y
Note the HTTP Response Header indicating the auth challenge:
@z

@x
```text
Www-Authenticate: Bearer realm="https://auth.docker.io/token",service="registry.docker.io",scope="repository:samalba/my-app:pull,push"
```
@y
```text
Www-Authenticate: Bearer realm="https://auth.docker.io/token",service="registry.docker.io",scope="repository:samalba/my-app:pull,push"
```
@z

@x
This format is documented in [Section 3 of RFC 6750: The OAuth 2.0 Authorization Framework: Bearer Token Usage](https://tools.ietf.org/html/rfc6750#section-3)
@y
This format is documented in [Section 3 of RFC 6750: The OAuth 2.0 Authorization Framework: Bearer Token Usage](https://tools.ietf.org/html/rfc6750#section-3)
@z

@x
This challenge indicates that the registry requires a token issued by the
specified token server and that the request the client is attempting will
need to include sufficient access entries in its claim set. To respond to this
challenge, the client will need to make a `GET` request to the URL
`https://auth.docker.io/token` using the `service` and `scope` values from the
`WWW-Authenticate` header.
@y
This challenge indicates that the registry requires a token issued by the
specified token server and that the request the client is attempting will
need to include sufficient access entries in its claim set. To respond to this
challenge, the client will need to make a `GET` request to the URL
`https://auth.docker.io/token` using the `service` and `scope` values from the
`WWW-Authenticate` header.
@z

@x
## Requesting a token
@y
## Requesting a token
@z

@x
Defines getting a bearer and refresh token using the token endpoint.
@y
Defines getting a bearer and refresh token using the token endpoint.
@z

@x
### Query parameters
@y
### Query parameters
@z

@x
#### `service`
@y
#### `service`
@z

@x
The name of the service which hosts the resource.
@y
The name of the service which hosts the resource.
@z

@x
#### `offline_token`
@y
#### `offline_token`
@z

@x
Whether to return a refresh token along with the bearer token. A refresh token
is capable of getting additional bearer tokens for the same subject with
different scopes. The refresh token does not have an expiration and should be
considered completely opaque to the client.
@y
Whether to return a refresh token along with the bearer token. A refresh token
is capable of getting additional bearer tokens for the same subject with
different scopes. The refresh token does not have an expiration and should be
considered completely opaque to the client.
@z

@x
#### `client_id`
@y
#### `client_id`
@z

@x
String identifying the client. This `client_id` does not need to be registered
with the authorization server but should be set to a meaningful value in order
to allow auditing keys created by unregistered clients. Accepted syntax is
defined in [RFC6749 Appendix
A.1](https://tools.ietf.org/html/rfc6749#appendix-A.1).
@y
String identifying the client. This `client_id` does not need to be registered
with the authorization server but should be set to a meaningful value in order
to allow auditing keys created by unregistered clients. Accepted syntax is
defined in [RFC6749 Appendix
A.1](https://tools.ietf.org/html/rfc6749#appendix-A.1).
@z

@x
#### `scope`
@y
#### `scope`
@z

@x
The resource in question, formatted as one of the space-delimited entries from
the `scope` parameters from the `WWW-Authenticate` header shown previously. This
query parameter should be specified multiple times if there is more than one
`scope` entry from the `WWW-Authenticate` header. The previous example would be
specified as: `scope=repository:samalba/my-app:push`. The scope field may be
empty to request a refresh token without providing any resource permissions to
the returned bearer token.
@y
The resource in question, formatted as one of the space-delimited entries from
the `scope` parameters from the `WWW-Authenticate` header shown previously. This
query parameter should be specified multiple times if there is more than one
`scope` entry from the `WWW-Authenticate` header. The previous example would be
specified as: `scope=repository:samalba/my-app:push`. The scope field may be
empty to request a refresh token without providing any resource permissions to
the returned bearer token.
@z

@x
### Token response fields
@y
### Token response fields
@z

@x
#### `token`
@y
#### `token`
@z

@x
An opaque `Bearer` token that clients should supply to subsequent
requests in the `Authorization` header.
@y
An opaque `Bearer` token that clients should supply to subsequent
requests in the `Authorization` header.
@z

@x
#### `access_token`
@y
#### `access_token`
@z

@x
For compatibility with OAuth 2.0, the `token` under the name `access_token` is
also accepted. At least one of these fields must be specified, but both may
also appear (for compatibility with older clients). When both are specified,
they should be equivalent; if they differ the client's choice is undefined.
@y
For compatibility with OAuth 2.0, the `token` under the name `access_token` is
also accepted. At least one of these fields must be specified, but both may
also appear (for compatibility with older clients). When both are specified,
they should be equivalent; if they differ the client's choice is undefined.
@z

@x
#### `expires_in`
@y
#### `expires_in`
@z

@x
(Optional) The duration in seconds since the token was issued that it will
remain valid. When omitted, this defaults to 60 seconds. For compatibility
with older clients, a token should never be returned with less than 60 seconds
to live.
@y
(Optional) The duration in seconds since the token was issued that it will
remain valid. When omitted, this defaults to 60 seconds. For compatibility
with older clients, a token should never be returned with less than 60 seconds
to live.
@z

@x
#### `issued_at`
@y
#### `issued_at`
@z

@x
(Optional) The [RFC3339](https://www.ietf.org/rfc/rfc3339.txt)-serialized UTC
standard time at which a given token was issued. If `issued_at` is omitted, the
expiration is from when the token exchange completed.
@y
(Optional) The [RFC3339](https://www.ietf.org/rfc/rfc3339.txt)-serialized UTC
standard time at which a given token was issued. If `issued_at` is omitted, the
expiration is from when the token exchange completed.
@z

@x
#### `refresh_token`
@y
#### `refresh_token`
@z

@x
(Optional) Token which can be used to get additional access tokens for
the same subject with different scopes. This token should be kept secure
by the client and only sent to the authorization server which issues
bearer tokens. This field will only be set when `offline_token=true` is
provided in the request.
@y
(Optional) Token which can be used to get additional access tokens for
the same subject with different scopes. This token should be kept secure
by the client and only sent to the authorization server which issues
bearer tokens. This field will only be set when `offline_token=true` is
provided in the request.
@z

@x
### Example
@y
### Example
@z

@x
For this example, the client makes an HTTP GET request to the following URL:
@y
For this example, the client makes an HTTP GET request to the following URL:
@z

@x
```text
https://auth.docker.io/token?service=registry.docker.io&scope=repository:samalba/my-app:pull,push
```
@y
```text
https://auth.docker.io/token?service=registry.docker.io&scope=repository:samalba/my-app:pull,push
```
@z

@x
The token server should first attempt to authenticate the client using any
authentication credentials provided with the request. From Docker 1.11 the
Docker Engine supports both Basic Authentication and OAuth2 for
getting tokens. Docker 1.10 and before, the registry client in the Docker Engine
only supports Basic Authentication. If an attempt to authenticate to the token
server fails, the token server should return a `401 Unauthorized` response
indicating that the provided credentials are invalid.
@y
The token server should first attempt to authenticate the client using any
authentication credentials provided with the request. From Docker 1.11 the
Docker Engine supports both Basic Authentication and OAuth2 for
getting tokens. Docker 1.10 and before, the registry client in the Docker Engine
only supports Basic Authentication. If an attempt to authenticate to the token
server fails, the token server should return a `401 Unauthorized` response
indicating that the provided credentials are invalid.
@z

@x
Whether the token server requires authentication is up to the policy of that
access control provider. Some requests may require authentication to determine
access (such as pushing or pulling a private repository) while others may not
(such as pulling from a public repository).
@y
Whether the token server requires authentication is up to the policy of that
access control provider. Some requests may require authentication to determine
access (such as pushing or pulling a private repository) while others may not
(such as pulling from a public repository).
@z

@x
After authenticating the client (which may simply be an anonymous client if
no attempt was made to authenticate), the token server must next query its
access control list to determine whether the client has the requested scope. In
this example request, if I have authenticated as user `jlhawn`, the token
server will determine what access I have to the repository `samalba/my-app`
hosted by the entity `registry.docker.io`.
@y
After authenticating the client (which may simply be an anonymous client if
no attempt was made to authenticate), the token server must next query its
access control list to determine whether the client has the requested scope. In
this example request, if I have authenticated as user `jlhawn`, the token
server will determine what access I have to the repository `samalba/my-app`
hosted by the entity `registry.docker.io`.
@z

@x
Once the token server has determined what access the client has to the
resources requested in the `scope` parameter, it will take the intersection of
the set of requested actions on each resource and the set of actions that the
client has in fact been granted. If the client only has a subset of the
requested access **it must not be considered an error** as it is not the
responsibility of the token server to indicate authorization errors as part of
this workflow.
@y
Once the token server has determined what access the client has to the
resources requested in the `scope` parameter, it will take the intersection of
the set of requested actions on each resource and the set of actions that the
client has in fact been granted. If the client only has a subset of the
requested access **it must not be considered an error** as it is not the
responsibility of the token server to indicate authorization errors as part of
this workflow.
@z

@x
Continuing with the example request, the token server will find that the
client's set of granted access to the repository is `[pull, push]` which when
intersected with the requested access `[pull, push]` yields an equal set. If
the granted access set was found only to be `[pull]` then the intersected set
would only be `[pull]`. If the client has no access to the repository then the
intersected set would be empty, `[]`.
@y
Continuing with the example request, the token server will find that the
client's set of granted access to the repository is `[pull, push]` which when
intersected with the requested access `[pull, push]` yields an equal set. If
the granted access set was found only to be `[pull]` then the intersected set
would only be `[pull]`. If the client has no access to the repository then the
intersected set would be empty, `[]`.
@z

@x
It is this intersected set of access which is placed in the returned token.
@y
It is this intersected set of access which is placed in the returned token.
@z

@x
The server then constructs an implementation-specific token with this
intersected set of access, and returns it to the Docker client to use to
authenticate to the audience service (within the indicated window of time):
@y
The server then constructs an implementation-specific token with this
intersected set of access, and returns it to the Docker client to use to
authenticate to the audience service (within the indicated window of time):
@z

@x
```text
HTTP/1.1 200 OK
Content-Type: application/json
@y
```text
HTTP/1.1 200 OK
Content-Type: application/json
@z

@x
{"token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiIsImtpZCI6IlBZWU86VEVXVTpWN0pIOjI2SlY6QVFUWjpMSkMzOlNYVko6WEdIQTozNEYyOjJMQVE6WlJNSzpaN1E2In0.eyJpc3MiOiJhdXRoLmRvY2tlci5jb20iLCJzdWIiOiJqbGhhd24iLCJhdWQiOiJyZWdpc3RyeS5kb2NrZXIuY29tIiwiZXhwIjoxNDE1Mzg3MzE1LCJuYmYiOjE0MTUzODcwMTUsImlhdCI6MTQxNTM4NzAxNSwianRpIjoidFlKQ08xYzZjbnl5N2tBbjBjN3JLUGdiVjFIMWJGd3MiLCJhY2Nlc3MiOlt7InR5cGUiOiJyZXBvc2l0b3J5IiwibmFtZSI6InNhbWFsYmEvbXktYXBwIiwiYWN0aW9ucyI6WyJwdXNoIl19XX0.QhflHPfbd6eVF4lM9bwYpFZIV0PfikbyXuLx959ykRTBpe3CYnzs6YBK8FToVb5R47920PVLrh8zuLzdCr9t3w", "expires_in": 3600,"issued_at": "2009-11-10T23:00:00Z"}
```
@y
{"token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiIsImtpZCI6IlBZWU86VEVXVTpWN0pIOjI2SlY6QVFUWjpMSkMzOlNYVko6WEdIQTozNEYyOjJMQVE6WlJNSzpaN1E2In0.eyJpc3MiOiJhdXRoLmRvY2tlci5jb20iLCJzdWIiOiJqbGhhd24iLCJhdWQiOiJyZWdpc3RyeS5kb2NrZXIuY29tIiwiZXhwIjoxNDE1Mzg3MzE1LCJuYmYiOjE0MTUzODcwMTUsImlhdCI6MTQxNTM4NzAxNSwianRpIjoidFlKQ08xYzZjbnl5N2tBbjBjN3JLUGdiVjFIMWJGd3MiLCJhY2Nlc3MiOlt7InR5cGUiOiJyZXBvc2l0b3J5IiwibmFtZSI6InNhbWFsYmEvbXktYXBwIiwiYWN0aW9ucyI6WyJwdXNoIl19XX0.QhflHPfbd6eVF4lM9bwYpFZIV0PfikbyXuLx959ykRTBpe3CYnzs6YBK8FToVb5R47920PVLrh8zuLzdCr9t3w", "expires_in": 3600,"issued_at": "2009-11-10T23:00:00Z"}
```
@z

@x
## Using the Bearer token
@y
## Using the Bearer token
@z

@x
Once the client has a token, it will try the registry request again with the
token placed in the HTTP `Authorization` header like so:
@y
Once the client has a token, it will try the registry request again with the
token placed in the HTTP `Authorization` header like so:
@z

@x
```text
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiIsImtpZCI6IkJWM0Q6MkFWWjpVQjVaOktJQVA6SU5QTDo1RU42Ok40SjQ6Nk1XTzpEUktFOkJWUUs6M0ZKTDpQT1RMIn0.eyJpc3MiOiJhdXRoLmRvY2tlci5jb20iLCJzdWIiOiJCQ0NZOk9VNlo6UUVKNTpXTjJDOjJBVkM6WTdZRDpBM0xZOjQ1VVc6NE9HRDpLQUxMOkNOSjU6NUlVTCIsImF1ZCI6InJlZ2lzdHJ5LmRvY2tlci5jb20iLCJleHAiOjE0MTUzODczMTUsIm5iZiI6MTQxNTM4NzAxNSwiaWF0IjoxNDE1Mzg3MDE1LCJqdGkiOiJ0WUpDTzFjNmNueXk3a0FuMGM3cktQZ2JWMUgxYkZ3cyIsInNjb3BlIjoiamxoYXduOnJlcG9zaXRvcnk6c2FtYWxiYS9teS1hcHA6cHVzaCxwdWxsIGpsaGF3bjpuYW1lc3BhY2U6c2FtYWxiYTpwdWxsIn0.Y3zZSwaZPqy4y9oRBVRImZyv3m_S9XDHF1tWwN7mL52C_IiA73SJkWVNsvNqpJIn5h7A2F8biv_S2ppQ1lgkbw
```
@y
```text
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiIsImtpZCI6IkJWM0Q6MkFWWjpVQjVaOktJQVA6SU5QTDo1RU42Ok40SjQ6Nk1XTzpEUktFOkJWUUs6M0ZKTDpQT1RMIn0.eyJpc3MiOiJhdXRoLmRvY2tlci5jb20iLCJzdWIiOiJCQ0NZOk9VNlo6UUVKNTpXTjJDOjJBVkM6WTdZRDpBM0xZOjQ1VVc6NE9HRDpLQUxMOkNOSjU6NUlVTCIsImF1ZCI6InJlZ2lzdHJ5LmRvY2tlci5jb20iLCJleHAiOjE0MTUzODczMTUsIm5iZiI6MTQxNTM4NzAxNSwiaWF0IjoxNDE1Mzg3MDE1LCJqdGkiOiJ0WUpDTzFjNmNueXk3a0FuMGM3cktQZ2JWMUgxYkZ3cyIsInNjb3BlIjoiamxoYXduOnJlcG9zaXRvcnk6c2FtYWxiYS9teS1hcHA6cHVzaCxwdWxsIGpsaGF3bjpuYW1lc3BhY2U6c2FtYWxiYTpwdWxsIn0.Y3zZSwaZPqy4y9oRBVRImZyv3m_S9XDHF1tWwN7mL52C_IiA73SJkWVNsvNqpJIn5h7A2F8biv_S2ppQ1lgkbw
```
@z

@x
This is also described in [Section 2.1 of RFC 6750: The OAuth 2.0 Authorization Framework: Bearer Token Usage](https://tools.ietf.org/html/rfc6750#section-2.1)
@y
This is also described in [Section 2.1 of RFC 6750: The OAuth 2.0 Authorization Framework: Bearer Token Usage](https://tools.ietf.org/html/rfc6750#section-2.1)
@z
