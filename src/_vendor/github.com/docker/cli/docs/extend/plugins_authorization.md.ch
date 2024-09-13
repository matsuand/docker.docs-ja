%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Access authorization plugin
description: "How to create authorization plugins to manage access control to your Docker daemon."
keywords: "security, authorization, authentication, docker, documentation, plugin, extend"
aliases:
- "/engine/extend/authorization/"
---
@y
---
title: Access authorization plugin
description: "How to create authorization plugins to manage access control to your Docker daemon."
keywords: "security, authorization, authentication, docker, documentation, plugin, extend"
aliases:
- "/engine/extend/authorization/"
---
@z

@x
This document describes the Docker Engine plugins available in Docker
Engine. To view information on plugins managed by Docker Engine,
refer to [Docker Engine plugin system](_index.md).
@y
This document describes the Docker Engine plugins available in Docker
Engine. To view information on plugins managed by Docker Engine,
refer to [Docker Engine plugin system](_index.md).
@z

@x
Docker's out-of-the-box authorization model is all or nothing. Any user with
permission to access the Docker daemon can run any Docker client command. The
same is true for callers using Docker's Engine API to contact the daemon. If you
require greater access control, you can create authorization plugins and add
them to your Docker daemon configuration. Using an authorization plugin, a
Docker administrator can configure granular access policies for managing access
to the Docker daemon.
@y
Docker's out-of-the-box authorization model is all or nothing. Any user with
permission to access the Docker daemon can run any Docker client command. The
same is true for callers using Docker's Engine API to contact the daemon. If you
require greater access control, you can create authorization plugins and add
them to your Docker daemon configuration. Using an authorization plugin, a
Docker administrator can configure granular access policies for managing access
to the Docker daemon.
@z

@x
Anyone with the appropriate skills can develop an authorization plugin. These
skills, at their most basic, are knowledge of Docker, understanding of REST, and
sound programming knowledge. This document describes the architecture, state,
and methods information available to an authorization plugin developer.
@y
Anyone with the appropriate skills can develop an authorization plugin. These
skills, at their most basic, are knowledge of Docker, understanding of REST, and
sound programming knowledge. This document describes the architecture, state,
and methods information available to an authorization plugin developer.
@z

@x
## Basic principles
@y
## Basic principles
@z

@x
Docker's [plugin infrastructure](plugin_api.md) enables
extending Docker by loading, removing and communicating with
third-party components using a generic API. The access authorization subsystem
was built using this mechanism.
@y
Docker's [plugin infrastructure](plugin_api.md) enables
extending Docker by loading, removing and communicating with
third-party components using a generic API. The access authorization subsystem
was built using this mechanism.
@z

@x
Using this subsystem, you don't need to rebuild the Docker daemon to add an
authorization plugin. You can add a plugin to an installed Docker daemon. You do
need to restart the Docker daemon to add a new plugin.
@y
Using this subsystem, you don't need to rebuild the Docker daemon to add an
authorization plugin. You can add a plugin to an installed Docker daemon. You do
need to restart the Docker daemon to add a new plugin.
@z

@x
An authorization plugin approves or denies requests to the Docker daemon based
on both the current authentication context and the command context. The
authentication context contains all user details and the authentication method.
The command context contains all the relevant request data.
@y
An authorization plugin approves or denies requests to the Docker daemon based
on both the current authentication context and the command context. The
authentication context contains all user details and the authentication method.
The command context contains all the relevant request data.
@z

@x
Authorization plugins must follow the rules described in [Docker Plugin API](plugin_api.md).
Each plugin must reside within directories described under the
[Plugin discovery](plugin_api.md#plugin-discovery) section.
@y
Authorization plugins must follow the rules described in [Docker Plugin API](plugin_api.md).
Each plugin must reside within directories described under the
[Plugin discovery](plugin_api.md#plugin-discovery) section.
@z

@x
> [!NOTE]
> The abbreviations `AuthZ` and `AuthN` mean authorization and authentication
> respectively.
@y
> [!NOTE]
> The abbreviations `AuthZ` and `AuthN` mean authorization and authentication
> respectively.
@z

@x
## Default user authorization mechanism
@y
## Default user authorization mechanism
@z

@x
If TLS is enabled in the [Docker daemon](https://docs.docker.com/engine/security/https/), the default user authorization flow extracts the user details from the certificate subject name.
That is, the `User` field is set to the client certificate subject common name, and the `AuthenticationMethod` field is set to `TLS`.
@y
If TLS is enabled in the [Docker daemon](https://docs.docker.com/engine/security/https/), the default user authorization flow extracts the user details from the certificate subject name.
That is, the `User` field is set to the client certificate subject common name, and the `AuthenticationMethod` field is set to `TLS`.
@z

@x
## Basic architecture
@y
## Basic architecture
@z

@x
You are responsible for registering your plugin as part of the Docker daemon
startup. You can install multiple plugins and chain them together. This chain
can be ordered. Each request to the daemon passes in order through the chain.
Only when all the plugins grant access to the resource, is the access granted.
@y
You are responsible for registering your plugin as part of the Docker daemon
startup. You can install multiple plugins and chain them together. This chain
can be ordered. Each request to the daemon passes in order through the chain.
Only when all the plugins grant access to the resource, is the access granted.
@z

@x
When an HTTP request is made to the Docker daemon through the CLI or via the
Engine API, the authentication subsystem passes the request to the installed
authentication plugin(s). The request contains the user (caller) and command
context. The plugin is responsible for deciding whether to allow or deny the
request.
@y
When an HTTP request is made to the Docker daemon through the CLI or via the
Engine API, the authentication subsystem passes the request to the installed
authentication plugin(s). The request contains the user (caller) and command
context. The plugin is responsible for deciding whether to allow or deny the
request.
@z

@x
The sequence diagrams below depict an allow and deny authorization flow:
@y
The sequence diagrams below depict an allow and deny authorization flow:
@z

@x
![Authorization Allow flow](images/authz_allow.png)
@y
![Authorization Allow flow](images/authz_allow.png)
@z

@x
![Authorization Deny flow](images/authz_deny.png)
@y
![Authorization Deny flow](images/authz_deny.png)
@z

@x
Each request sent to the plugin includes the authenticated user, the HTTP
headers, and the request/response body. Only the user name and the
authentication method used are passed to the plugin. Most importantly, no user
credentials or tokens are passed. Finally, not all request/response bodies
are sent to the authorization plugin. Only those request/response bodies where
the `Content-Type` is either `text/*` or `application/json` are sent.
@y
Each request sent to the plugin includes the authenticated user, the HTTP
headers, and the request/response body. Only the user name and the
authentication method used are passed to the plugin. Most importantly, no user
credentials or tokens are passed. Finally, not all request/response bodies
are sent to the authorization plugin. Only those request/response bodies where
the `Content-Type` is either `text/*` or `application/json` are sent.
@z

@x
For commands that can potentially hijack the HTTP connection (`HTTP
Upgrade`), such as `exec`, the authorization plugin is only called for the
initial HTTP requests. Once the plugin approves the command, authorization is
not applied to the rest of the flow. Specifically, the streaming data is not
passed to the authorization plugins. For commands that return chunked HTTP
response, such as `logs` and `events`, only the HTTP request is sent to the
authorization plugins.
@y
For commands that can potentially hijack the HTTP connection (`HTTP
Upgrade`), such as `exec`, the authorization plugin is only called for the
initial HTTP requests. Once the plugin approves the command, authorization is
not applied to the rest of the flow. Specifically, the streaming data is not
passed to the authorization plugins. For commands that return chunked HTTP
response, such as `logs` and `events`, only the HTTP request is sent to the
authorization plugins.
@z

@x
During request/response processing, some authorization flows might
need to do additional queries to the Docker daemon. To complete such flows,
plugins can call the daemon API similar to a regular user. To enable these
additional queries, the plugin must provide the means for an administrator to
configure proper authentication and security policies.
@y
During request/response processing, some authorization flows might
need to do additional queries to the Docker daemon. To complete such flows,
plugins can call the daemon API similar to a regular user. To enable these
additional queries, the plugin must provide the means for an administrator to
configure proper authentication and security policies.
@z

@x
## Docker client flows
@y
## Docker client flows
@z

@x
To enable and configure the authorization plugin, the plugin developer must
support the Docker client interactions detailed in this section.
@y
To enable and configure the authorization plugin, the plugin developer must
support the Docker client interactions detailed in this section.
@z

@x
### Setting up Docker daemon
@y
### Setting up Docker daemon
@z

@x
Enable the authorization plugin with a dedicated command line flag in the
`--authorization-plugin=PLUGIN_ID` format. The flag supplies a `PLUGIN_ID`
value. This value can be the plugin’s socket or a path to a specification file.
Authorization plugins can be loaded without restarting the daemon. Refer
to the [`dockerd` documentation](https://docs.docker.com/reference/cli/dockerd/#configuration-reload-behavior) for more information.
@y
Enable the authorization plugin with a dedicated command line flag in the
`--authorization-plugin=PLUGIN_ID` format. The flag supplies a `PLUGIN_ID`
value. This value can be the plugin’s socket or a path to a specification file.
Authorization plugins can be loaded without restarting the daemon. Refer
to the [`dockerd` documentation](https://docs.docker.com/reference/cli/dockerd/#configuration-reload-behavior) for more information.
@z

@x
```console
$ dockerd --authorization-plugin=plugin1 --authorization-plugin=plugin2,...
```
@y
```console
$ dockerd --authorization-plugin=plugin1 --authorization-plugin=plugin2,...
```
@z

@x
Docker's authorization subsystem supports multiple `--authorization-plugin` parameters.
@y
Docker's authorization subsystem supports multiple `--authorization-plugin` parameters.
@z

@x
### Calling authorized command (allow)
@y
### Calling authorized command (allow)
@z

@x
```console
$ docker pull centos
<...>
f1b10cd84249: Pull complete
<...>
```
@y
```console
$ docker pull centos
<...>
f1b10cd84249: Pull complete
<...>
```
@z

@x
### Calling unauthorized command (deny)
@y
### Calling unauthorized command (deny)
@z

@x
```console
$ docker pull centos
<...>
docker: Error response from daemon: authorization denied by plugin PLUGIN_NAME: volumes are not allowed.
```
@y
```console
$ docker pull centos
<...>
docker: Error response from daemon: authorization denied by plugin PLUGIN_NAME: volumes are not allowed.
```
@z

@x
### Error from plugins
@y
### Error from plugins
@z

@x
```console
$ docker pull centos
<...>
docker: Error response from daemon: plugin PLUGIN_NAME failed with error: AuthZPlugin.AuthZReq: Cannot connect to the Docker daemon. Is the docker daemon running on this host?.
```
@y
```console
$ docker pull centos
<...>
docker: Error response from daemon: plugin PLUGIN_NAME failed with error: AuthZPlugin.AuthZReq: Cannot connect to the Docker daemon. Is the docker daemon running on this host?.
```
@z

@x
## API schema and implementation
@y
## API schema and implementation
@z

@x
In addition to Docker's standard plugin registration method, each plugin
should implement the following two methods:
@y
In addition to Docker's standard plugin registration method, each plugin
should implement the following two methods:
@z

@x
* `/AuthZPlugin.AuthZReq` This authorize request method is called before the Docker daemon processes the client request.
@y
* `/AuthZPlugin.AuthZReq` This authorize request method is called before the Docker daemon processes the client request.
@z

@x
* `/AuthZPlugin.AuthZRes` This authorize response method is called before the response is returned from Docker daemon to the client.
@y
* `/AuthZPlugin.AuthZRes` This authorize response method is called before the response is returned from Docker daemon to the client.
@z

@x
#### /AuthZPlugin.AuthZReq
@y
#### /AuthZPlugin.AuthZReq
@z

@x
Request
@y
Request
@z

@x
```json
{
    "User":              "The user identification",
    "UserAuthNMethod":   "The authentication method used",
    "RequestMethod":     "The HTTP method",
    "RequestURI":        "The HTTP request URI",
    "RequestBody":       "Byte array containing the raw HTTP request body",
    "RequestHeader":     "Byte array containing the raw HTTP request header as a map[string][]string "
}
```
@y
```json
{
    "User":              "The user identification",
    "UserAuthNMethod":   "The authentication method used",
    "RequestMethod":     "The HTTP method",
    "RequestURI":        "The HTTP request URI",
    "RequestBody":       "Byte array containing the raw HTTP request body",
    "RequestHeader":     "Byte array containing the raw HTTP request header as a map[string][]string "
}
```
@z

@x
Response
@y
Response
@z

@x
```json
{
    "Allow": "Determined whether the user is allowed or not",
    "Msg":   "The authorization message",
    "Err":   "The error message if things go wrong"
}
```
@y
```json
{
    "Allow": "Determined whether the user is allowed or not",
    "Msg":   "The authorization message",
    "Err":   "The error message if things go wrong"
}
```
@z

@x
#### /AuthZPlugin.AuthZRes
@y
#### /AuthZPlugin.AuthZRes
@z

@x
Request:
@y
Request:
@z

@x
```json
{
    "User":              "The user identification",
    "UserAuthNMethod":   "The authentication method used",
    "RequestMethod":     "The HTTP method",
    "RequestURI":        "The HTTP request URI",
    "RequestBody":       "Byte array containing the raw HTTP request body",
    "RequestHeader":     "Byte array containing the raw HTTP request header as a map[string][]string",
    "ResponseBody":      "Byte array containing the raw HTTP response body",
    "ResponseHeader":    "Byte array containing the raw HTTP response header as a map[string][]string",
    "ResponseStatusCode":"Response status code"
}
```
@y
```json
{
    "User":              "The user identification",
    "UserAuthNMethod":   "The authentication method used",
    "RequestMethod":     "The HTTP method",
    "RequestURI":        "The HTTP request URI",
    "RequestBody":       "Byte array containing the raw HTTP request body",
    "RequestHeader":     "Byte array containing the raw HTTP request header as a map[string][]string",
    "ResponseBody":      "Byte array containing the raw HTTP response body",
    "ResponseHeader":    "Byte array containing the raw HTTP response header as a map[string][]string",
    "ResponseStatusCode":"Response status code"
}
```
@z

@x
Response:
@y
Response:
@z

@x
```json
{
   "Allow":              "Determined whether the user is allowed or not",
   "Msg":                "The authorization message",
   "Err":                "The error message if things go wrong"
}
```
@y
```json
{
   "Allow":              "Determined whether the user is allowed or not",
   "Msg":                "The authorization message",
   "Err":                "The error message if things go wrong"
}
```
@z

@x
### Request authorization
@y
### Request authorization
@z

@x
Each plugin must support two request authorization messages formats, one from the daemon to the plugin and then from the plugin to the daemon. The tables below detail the content expected in each message.
@y
Each plugin must support two request authorization messages formats, one from the daemon to the plugin and then from the plugin to the daemon. The tables below detail the content expected in each message.
@z

@x
#### Daemon -> Plugin
@y
#### Daemon -> Plugin
@z

@x
Name                   | Type              | Description
-----------------------|-------------------|-------------------------------------------------------
User                   | string            | The user identification
Authentication method  | string            | The authentication method used
Request method         | enum              | The HTTP method (GET/DELETE/POST)
Request URI            | string            | The HTTP request URI including API version (e.g., v.1.17/containers/json)
Request headers        | map[string]string | Request headers as key value pairs (without the authorization header)
Request body           | []byte            | Raw request body
@y
Name                   | Type              | Description
-----------------------|-------------------|-------------------------------------------------------
User                   | string            | The user identification
Authentication method  | string            | The authentication method used
Request method         | enum              | The HTTP method (GET/DELETE/POST)
Request URI            | string            | The HTTP request URI including API version (e.g., v.1.17/containers/json)
Request headers        | map[string]string | Request headers as key value pairs (without the authorization header)
Request body           | []byte            | Raw request body
@z

@x
#### Plugin -> Daemon
@y
#### Plugin -> Daemon
@z

@x
Name    | Type   | Description
--------|--------|----------------------------------------------------------------------------------
Allow   | bool   | Boolean value indicating whether the request is allowed or denied
Msg     | string | Authorization message (will be returned to the client in case the access is denied)
Err     | string | Error message (will be returned to the client in case the plugin encounter an error. The string value supplied may appear in logs, so should not include confidential information)
@y
Name    | Type   | Description
--------|--------|----------------------------------------------------------------------------------
Allow   | bool   | Boolean value indicating whether the request is allowed or denied
Msg     | string | Authorization message (will be returned to the client in case the access is denied)
Err     | string | Error message (will be returned to the client in case the plugin encounter an error. The string value supplied may appear in logs, so should not include confidential information)
@z

@x
### Response authorization
@y
### Response authorization
@z

@x
The plugin must support two authorization messages formats, one from the daemon to the plugin and then from the plugin to the daemon. The tables below detail the content expected in each message.
@y
The plugin must support two authorization messages formats, one from the daemon to the plugin and then from the plugin to the daemon. The tables below detail the content expected in each message.
@z

@x
#### Daemon -> Plugin
@y
#### Daemon -> Plugin
@z

@x
Name                    | Type              | Description
----------------------- |------------------ |----------------------------------------------------
User                    | string            | The user identification
Authentication method   | string            | The authentication method used
Request method          | string            | The HTTP method (GET/DELETE/POST)
Request URI             | string            | The HTTP request URI including API version (e.g., v.1.17/containers/json)
Request headers         | map[string]string | Request headers as key value pairs (without the authorization header)
Request body            | []byte            | Raw request body
Response status code    | int               | Status code from the Docker daemon
Response headers        | map[string]string | Response headers as key value pairs
Response body           | []byte            | Raw Docker daemon response body
@y
Name                    | Type              | Description
----------------------- |------------------ |----------------------------------------------------
User                    | string            | The user identification
Authentication method   | string            | The authentication method used
Request method          | string            | The HTTP method (GET/DELETE/POST)
Request URI             | string            | The HTTP request URI including API version (e.g., v.1.17/containers/json)
Request headers         | map[string]string | Request headers as key value pairs (without the authorization header)
Request body            | []byte            | Raw request body
Response status code    | int               | Status code from the Docker daemon
Response headers        | map[string]string | Response headers as key value pairs
Response body           | []byte            | Raw Docker daemon response body
@z

@x
#### Plugin -> Daemon
@y
#### Plugin -> Daemon
@z

@x
Name    | Type   | Description
--------|--------|----------------------------------------------------------------------------------
Allow   | bool   | Boolean value indicating whether the response is allowed or denied
Msg     | string | Authorization message (will be returned to the client in case the access is denied)
Err     | string | Error message (will be returned to the client in case the plugin encounter an error. The string value supplied may appear in logs, so should not include confidential information)
@y
Name    | Type   | Description
--------|--------|----------------------------------------------------------------------------------
Allow   | bool   | Boolean value indicating whether the response is allowed or denied
Msg     | string | Authorization message (will be returned to the client in case the access is denied)
Err     | string | Error message (will be returned to the client in case the plugin encounter an error. The string value supplied may appear in logs, so should not include confidential information)
@z
