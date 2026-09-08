%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Develop and test locally
linkTitle: Local development
@y
title: Develop and test locally
linkTitle: Local development
@z

@x
description: Build, test, and connect to development services in Docker Sandboxes.
keywords: docker sandboxes, sbx, local development, build, test, ports, host services
@y
description: Build, test, and connect to development services in Docker Sandboxes.
keywords: docker sandboxes, sbx, local development, build, test, ports, host services
@z

@x
Use a sandbox's private runtime to build images, run tests, and connect local
tools to development services across the sandbox boundary.
@y
Use a sandbox's private runtime to build images, run tests, and connect local
tools to development services across the sandbox boundary.
@z

@x
## Build and test inside a sandbox
@y
## Build and test inside a sandbox
@z

@x
Agents have sudo access inside the sandbox, so they can install packages,
start databases, run test dependencies, and prepare the environment they need.
Installed packages persist for the sandbox's lifetime. For repeated setup, use
[Customize](../customize/) to package the environment as a template or kit.
@y
Agents have sudo access inside the sandbox, so they can install packages,
start databases, run test dependencies, and prepare the environment they need.
Installed packages persist for the sandbox's lifetime. For repeated setup, use
[Customize](../customize/) to package the environment as a template or kit.
@z

@x
Agents can also build Docker images, run containers, and use
[Compose](/manuals/compose/_index.md). Everything runs inside the sandbox's
private Docker daemon, so containers started by the agent never appear in your
host's `docker ps`. When you remove the sandbox, all images, containers, and
volumes inside it are deleted with it.
@y
Agents can also build Docker images, run containers, and use
[Compose](manuals/compose/_index.md). Everything runs inside the sandbox's
private Docker daemon, so containers started by the agent never appear in your
host's `docker ps`. When you remove the sandbox, all images, containers, and
volumes inside it are deleted with it.
@z

@x
This pattern works well for tasks where the agent needs to run the project's
test suite or inspect a service it started. If you need to reach that service
from your host, publish the port when you create the sandbox, or publish it
later with `sbx ports`.
@y
This pattern works well for tasks where the agent needs to run the project's
test suite or inspect a service it started. If you need to reach that service
from your host, publish the port when you create the sandbox, or publish it
later with `sbx ports`.
@z

@x
## Local services
@y
## Local services
@z

@x
Use this workflow when a sandboxed agent starts a dev server, or when the agent
needs to call a service running on your host.
@y
Use this workflow when a sandboxed agent starts a dev server, or when the agent
needs to call a service running on your host.
@z

@x
### Accessing services in the sandbox
@y
### Accessing services in the sandbox
@z

@x
Sandboxes are [network-isolated](../security/isolation.md) — your browser or local
tools can't reach a server running inside one by default. A port mapping of
`8080:3000` publishes sandbox port 3000 on host port 8080.
@y
Sandboxes are [network-isolated](../security/isolation.md) — your browser or local
tools can't reach a server running inside one by default. A port mapping of
`8080:3000` publishes sandbox port 3000 on host port 8080.
@z

@x
If you know which ports you need, publish them when you create the sandbox:
@y
If you know which ports you need, publish them when you create the sandbox:
@z

@x
```console
$ sbx run --publish 8080:3000 --name my-sandbox claude
```
@y
```console
$ sbx run --publish 8080:3000 --name my-sandbox claude
```
@z

@x
For an existing sandbox, use [`sbx ports`](/reference/cli/sbx/ports/) to
forward traffic from your host.
@y
For an existing sandbox, use [`sbx ports`](__SUBDIR__/reference/cli/sbx/ports/) to
forward traffic from your host.
@z

@x
The common case: an agent has started a dev server or API, and you want to open
it in your browser or run tests against it.
@y
The common case: an agent has started a dev server or API, and you want to open
it in your browser or run tests against it.
@z

@x
```console
$ sbx ports my-sandbox --publish 8080:3000
$ open http://localhost:8080
```
@y
```console
$ sbx ports my-sandbox --publish 8080:3000
$ open http://localhost:8080
```
@z

@x
To let the OS pick a free host port instead of choosing one yourself, specify
only the sandbox port. Then use `sbx ports` to check which host port was
assigned:
@y
To let the OS pick a free host port instead of choosing one yourself, specify
only the sandbox port. Then use `sbx ports` to check which host port was
assigned:
@z

@x
```console
$ sbx ports my-sandbox --publish 3000
$ sbx ports my-sandbox
```
@y
```console
$ sbx ports my-sandbox --publish 3000
$ sbx ports my-sandbox
```
@z

@x
`sbx ls` shows active port mappings alongside each sandbox, and `sbx ports`
lists them in detail:
@y
`sbx ls` shows active port mappings alongside each sandbox, and `sbx ports`
lists them in detail:
@z

@x
```console
$ sbx ls
SANDBOX         AGENT   STATUS   PORTS                    WORKSPACE
my-sandbox      claude  running  127.0.0.1:8080->3000/tcp /home/user/proj
```
@y
```console
$ sbx ls
SANDBOX         AGENT   STATUS   PORTS                    WORKSPACE
my-sandbox      claude  running  127.0.0.1:8080->3000/tcp /home/user/proj
```
@z

@x
To stop forwarding a port:
@y
To stop forwarding a port:
@z

@x
```console
$ sbx ports my-sandbox --unpublish 8080:3000
```
@y
```console
$ sbx ports my-sandbox --unpublish 8080:3000
```
@z

@x
For a service to be reachable, it must listen on all interfaces inside the
sandbox, not only `127.0.0.1`. Bind it to `0.0.0.0` for IPv4 or `[::]` for both
IPv4 and IPv6. Most dev servers need a flag like `--host 0.0.0.0` to do this.
On the host, `--publish` listens on both `127.0.0.1` and `::1`, so a client
resolving `localhost` might pick IPv6 and fail with "connection reset by peer"
if the sandboxed service only listens on IPv4, even when
`http://127.0.0.1:<port>/` works. To fix that, bind the service to `[::]`, or
pin the published port to one family with `--publish 8080:3000/tcp4` or
`/tcp6`.
@y
For a service to be reachable, it must listen on all interfaces inside the
sandbox, not only `127.0.0.1`. Bind it to `0.0.0.0` for IPv4 or `[::]` for both
IPv4 and IPv6. Most dev servers need a flag like `--host 0.0.0.0` to do this.
On the host, `--publish` listens on both `127.0.0.1` and `::1`, so a client
resolving `localhost` might pick IPv6 and fail with "connection reset by peer"
if the sandboxed service only listens on IPv4, even when
`http://127.0.0.1:<port>/` works. To fix that, bind the service to `[::]`, or
pin the published port to one family with `--publish 8080:3000/tcp4` or
`/tcp6`.
@z

@x
Published ports survive restarts: `sbx` re-publishes them when the sandbox or
the daemon restarts. Explicit host ports are reused, while a port published with
an OS-assigned host port, such as `--publish 3000`, gets a different host port
on each start. Check `sbx ports my-sandbox` to find it. If an explicit host port
is already in use at restart, the CLI or the dashboard prompts you to choose
another. Removing the sandbox releases its ports.
@y
Published ports survive restarts: `sbx` re-publishes them when the sandbox or
the daemon restarts. Explicit host ports are reused, while a port published with
an OS-assigned host port, such as `--publish 3000`, gets a different host port
on each start. Check `sbx ports my-sandbox` to find it. If an explicit host port
is already in use at restart, the CLI or the dashboard prompts you to choose
another. Removing the sandbox releases its ports.
@z

@x
When `sbx run` re-attaches to an existing sandbox, it ignores `--publish`. Use
`sbx ports` to publish ports on that sandbox. To stop forwarding,
`--unpublish 8080:3000` removes a single mapping, and `--unpublish 3000`
removes every host port mapped to sandbox port 3000.
@y
When `sbx run` re-attaches to an existing sandbox, it ignores `--publish`. Use
`sbx ports` to publish ports on that sandbox. To stop forwarding,
`--unpublish 8080:3000` removes a single mapping, and `--unpublish 3000`
removes every host port mapped to sandbox port 3000.
@z

@x
### Accessing host services from a sandbox
@y
### Accessing host services from a sandbox
@z

@x
Services running on your host are reachable from inside a sandbox using the
hostname `host.docker.internal`. Use this instead of `127.0.0.1` or your
machine's local network IP address, which are not reachable from inside the
sandbox.
@y
Services running on your host are reachable from inside a sandbox using the
hostname `host.docker.internal`. Use this instead of `127.0.0.1` or your
machine's local network IP address, which are not reachable from inside the
sandbox.
@z

@x
The sandbox proxy translates `host.docker.internal` to `localhost` before
forwarding the request, so you must add the `localhost` address with the
specific port to your network policy allowlist:
@y
The sandbox proxy translates `host.docker.internal` to `localhost` before
forwarding the request, so you must add the `localhost` address with the
specific port to your network policy allowlist:
@z

@x
```console
$ sbx policy allow network localhost:11434
```
@y
```console
$ sbx policy allow network localhost:11434
```
@z

@x
Then use `host.docker.internal` in any configuration or request that points at
the host service. For example, to verify connectivity from a sandbox shell:
@y
Then use `host.docker.internal` in any configuration or request that points at
the host service. For example, to verify connectivity from a sandbox shell:
@z

@x
```console
$ curl http://host.docker.internal:11434
```
@y
```console
$ curl http://host.docker.internal:11434
```
@z
