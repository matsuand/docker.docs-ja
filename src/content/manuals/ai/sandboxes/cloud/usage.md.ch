%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Use cloud sandboxes
description: Create and manage Docker cloud sandboxes with the sbx CLI, including file transfer, commands, ports, storage, and lifecycle controls.
keywords: docker sandboxes, cloud sandbox, sbx cloud, cloud ports, sandbox ttl
@y
title: Use cloud sandboxes
description: Create and manage Docker cloud sandboxes with the sbx CLI, including file transfer, commands, ports, storage, and lifecycle controls.
keywords: docker sandboxes, cloud sandbox, sbx cloud, cloud ports, sandbox ttl
@z

@x
Use the `--cloud` flag with supported `sbx` commands to create and manage
sandboxes on Docker-managed infrastructure. Cloud operations use cloud IDs,
names, resources, and lifecycle controls rather than the local sandbox daemon.
@y
Use the `--cloud` flag with supported `sbx` commands to create and manage
sandboxes on Docker-managed infrastructure. Cloud operations use cloud IDs,
names, resources, and lifecycle controls rather than the local sandbox daemon.
@z

@x
## Create a sandbox
@y
## Create a sandbox
@z

@x
A cloud sandbox expires after one hour by default. On expiration, the service
stops sandboxes that can be resumed and deletes the rest. See
[Configure expiration](#configure-expiration) to choose the timeout and action
before creating it.
@y
A cloud sandbox expires after one hour by default. On expiration, the service
stops sandboxes that can be resumed and deletes the rest. See
[Configure expiration](#configure-expiration) to choose the timeout and action
before creating it.
@z

@x
Credentials saved for local sandboxes aren't available in cloud sandboxes.
[Configure a cloud credential](credentials.md) before launching an agent.
@y
Credentials saved for local sandboxes aren't available in cloud sandboxes.
[Configure a cloud credential](credentials.md) before launching an agent.
@z

@x
Create a sandbox and attach to its agent, or reuse the named sandbox if it
already exists:
@y
Create a sandbox and attach to its agent, or reuse the named sandbox if it
already exists:
@z

@x
```console
$ sbx --cloud run claude --name cloud-project
```
@y
```console
$ sbx --cloud run claude --name cloud-project
```
@z

@x
Without `--name`, an interactive run offers existing sandboxes for that agent
and an option to create another. Pass `--new` to create a fresh sandbox.
Launches that bake a kit template also create a fresh sandbox.
@y
Without `--name`, an interactive run offers existing sandboxes for that agent
and an option to create another. Pass `--new` to create a fresh sandbox.
Launches that bake a kit template also create a fresh sandbox.
@z

@x
Reusing a sandbox keeps its creation settings. Flags such as `--cpus`,
`--memory`, `--platform`, `--ttl`, `--env`, and `--allow-network` are rejected
when resuming. Use `--new` to create a sandbox with different settings.
@y
Reusing a sandbox keeps its creation settings. Flags such as `--cpus`,
`--memory`, `--platform`, `--ttl`, `--env`, and `--allow-network` are rejected
when resuming. Use `--new` to create a sandbox with different settings.
@z

@x
To create the sandbox without opening an agent session, use `create`:
@y
To create the sandbox without opening an agent session, use `create`:
@z

@x
```console
$ sbx --cloud create --name cloud-project claude
```
@y
```console
$ sbx --cloud create --name cloud-project claude
```
@z

@x
The command prints the cloud sandbox ID. Attach by ID or name:
@y
The command prints the cloud sandbox ID. Attach by ID or name:
@z

@x
```console
$ sbx --cloud attach cloud-project
```
@y
```console
$ sbx --cloud attach cloud-project
```
@z

@x
Cloud sandbox names must have at least two characters, start with a letter or
number, and contain only letters, numbers, and hyphens. The name `default` is
reserved. Periods accepted in local sandbox names aren't accepted in the cloud.
@y
Cloud sandbox names must have at least two characters, start with a letter or
number, and contain only letters, numbers, and hyphens. The name `default` is
reserved. Periods accepted in local sandbox names aren't accepted in the cloud.
@z

@x
Cloud creation doesn't accept workspace paths. For example,
`sbx --cloud run claude .` returns an error because `.` refers to the local
filesystem.
@y
Cloud creation doesn't accept workspace paths. For example,
`sbx --cloud run claude .` returns an error because `.` refers to the local
filesystem.
@z

@x
### Choose resources and platform
@y
### Choose resources and platform
@z

@x
Without resource flags, a cloud sandbox starts with 2 CPUs and 4 GiB of
memory. Use `--cpus` and `--memory` to select one of these configurations:
@y
Without resource flags, a cloud sandbox starts with 2 CPUs and 4 GiB of
memory. Use `--cpus` and `--memory` to select one of these configurations:
@z

@x
| Size | CPUs | Memory |
| --- | --- | --- |
| micro | 1 | 2 GiB |
| small | 2 | 4 GiB |
| medium | 4 | 8 GiB |
| large | 8 | 16 GiB |
| xl | 16 | 32 GiB |
@y
| Size | CPUs | Memory |
| --- | --- | --- |
| micro | 1 | 2 GiB |
| small | 2 | 4 GiB |
| medium | 4 | 8 GiB |
| large | 8 | 16 GiB |
| xl | 16 | 32 GiB |
@z

@x
For example:
@y
For example:
@z

@x
```console
$ sbx --cloud create --name cloud-project --cpus 4 --memory 8g claude
```
@y
```console
$ sbx --cloud create --name cloud-project --cpus 4 --memory 8g claude
```
@z

@x
If you specify only CPU or memory, the CLI selects the matching value for the
other resource. Unsupported combinations are rejected.
@y
If you specify only CPU or memory, the CLI selects the matching value for the
other resource. Unsupported combinations are rejected.
@z

@x
Use `--platform linux/amd64` or `--platform linux/arm64` to select an
architecture supported by your account. This matters when you plan to
[move the sandbox to your machine](move.md): the architectures must match.
@y
Use `--platform linux/amd64` or `--platform linux/arm64` to select an
architecture supported by your account. This matters when you plan to
[move the sandbox to your machine](move.md): the architectures must match.
@z

@x
## Run without attaching
@y
## Run without attaching
@z

@x
For scripts or terminals without interactive input, start the sandbox without
opening an agent session:
@y
For scripts or terminals without interactive input, start the sandbox without
opening an agent session:
@z

@x
```console
$ sbx --cloud run --detached claude --name cloud-task
```
@y
```console
$ sbx --cloud run --detached claude --name cloud-task
```
@z

@x
A detached run with `--name` reuses the named sandbox and starts it if stopped.
If the sandbox doesn't exist, or you omit `--name`, it creates a sandbox.
Use `sbx --cloud exec` to run commands and `sbx --cloud rm --force` for
unattended cleanup. An interactive agent session requires `run` or `attach`
from a terminal.
@y
A detached run with `--name` reuses the named sandbox and starts it if stopped.
If the sandbox doesn't exist, or you omit `--name`, it creates a sandbox.
Use `sbx --cloud exec` to run commands and `sbx --cloud rm --force` for
unattended cleanup. An interactive agent session requires `run` or `attach`
from a terminal.
@z

@x
To detach from an interactive `run` or `attach` session while leaving the
agent running, press `Ctrl+\`. Reconnect with `sbx --cloud attach <sandbox-name>`.
Reconnecting joins the existing agent session. Use `--detach-keys` with `run`
or `attach` to change the detach gesture, for example `--detach-keys ctrl-x,ctrl-d`.
@y
To detach from an interactive `run` or `attach` session while leaving the
agent running, press `Ctrl+\`. Reconnect with `sbx --cloud attach <sandbox-name>`.
Reconnecting joins the existing agent session. Use `--detach-keys` with `run`
or `attach` to change the detach gesture, for example `--detach-keys ctrl-x,ctrl-d`.
@z

@x
## List and inspect sandboxes
@y
## List and inspect sandboxes
@z

@x
List cloud sandboxes separately from local sandboxes:
@y
List cloud sandboxes separately from local sandboxes:
@z

@x
```console
$ sbx --cloud ls
```
@y
```console
$ sbx --cloud ls
```
@z

@x
Most cloud commands accept either the sandbox name or the `sbx_`-prefixed ID
shown in the output.
@y
Most cloud commands accept either the sandbox name or the `sbx_`-prefixed ID
shown in the output.
@z

@x
## Run commands
@y
## Run commands
@z

@x
Run a command inside a cloud sandbox:
@y
Run a command inside a cloud sandbox:
@z

@x
```console
$ sbx --cloud exec cloud-project pwd
```
@y
```console
$ sbx --cloud exec cloud-project pwd
```
@z

@x
## Connect with SSH
@y
## Connect with SSH
@z

@x
Configure cloud SSH access and connect with your SSH client:
@y
Configure cloud SSH access and connect with your SSH client:
@z

@x
```console
$ sbx --cloud setup ssh
$ ssh sbx_01abc123@sbx_cloud
```
@y
```console
$ sbx --cloud setup ssh
$ ssh sbx_01abc123@sbx_cloud
```
@z

@x
Replace the example with `ssh <sandbox-id>@sbx_cloud`, using the
`sbx_`-prefixed ID from `sbx --cloud ls`.
@y
Replace the example with `ssh <sandbox-id>@sbx_cloud`, using the
`sbx_`-prefixed ID from `sbx --cloud ls`.
@z

@x
## Transfer files
@y
## Transfer files
@z

@x
Use `sbx --cloud cp` to copy files or directories between the client machine
and a cloud sandbox. Use absolute sandbox paths:
@y
Use `sbx --cloud cp` to copy files or directories between the client machine
and a cloud sandbox. Use absolute sandbox paths:
@z

@x
```console
$ sbx --cloud cp ./src cloud-project:/home/agent/workspace/src
$ sbx --cloud cp cloud-project:/home/agent/workspace/result.json ./result.json
```
@y
```console
$ sbx --cloud cp ./src cloud-project:/home/agent/workspace/src
$ sbx --cloud cp cloud-project:/home/agent/workspace/result.json ./result.json
```
@z

@x
Copying creates a point-in-time transfer. It doesn't mount or synchronize the
local path. For source control workflows, you can also clone a remote
repository from inside the sandbox and push changes to the remote. Configure
[cloud credentials](credentials.md) before creating a sandbox that needs access
to a private repository. The [cloud walkthrough](_index.md#get-started) shows a
public repository example.
@y
Copying creates a point-in-time transfer. It doesn't mount or synchronize the
local path. For source control workflows, you can also clone a remote
repository from inside the sandbox and push changes to the remote. Configure
[cloud credentials](credentials.md) before creating a sandbox that needs access
to a private repository. The [cloud walkthrough](_index.md#get-started) shows a
public repository example.
@z

@x
## Expose a port
@y
## Expose a port
@z

@x
Expose a TCP service by specifying its sandbox port:
@y
Expose a TCP service by specifying its sandbox port:
@z

@x
```console
$ sbx --cloud ports cloud-project --publish 8080
```
@y
```console
$ sbx --cloud ports cloud-project --publish 8080
```
@z

@x
The command returns a public HTTPS URL assigned by the cloud control plane.
Cloud mode accepts a sandbox port number with an optional `/tcp` suffix, such
as `8080/tcp`. Host IP addresses, host port bindings, and other protocols are
rejected.
@y
The command returns a public HTTPS URL assigned by the cloud control plane.
Cloud mode accepts a sandbox port number with an optional `/tcp` suffix, such
as `8080/tcp`. Host IP addresses, host port bindings, and other protocols are
rejected.
@z

@x
List or remove exposed ports:
@y
List or remove exposed ports:
@z

@x
```console
$ sbx --cloud ports cloud-project
$ sbx --cloud ports cloud-project --unpublish 8080
```
@y
```console
$ sbx --cloud ports cloud-project
$ sbx --cloud ports cloud-project --unpublish 8080
```
@z

@x
Treat an exposed URL as a public endpoint. Apply authentication in the service
and remove the exposure when you no longer need it.
@y
Treat an exposed URL as a public endpoint. Apply authentication in the service
and remove the exposure when you no longer need it.
@z

@x
## Configure expiration
@y
## Configure expiration
@z

@x
Set the time-to-live and the action taken when it lapses during creation:
@y
Set the time-to-live and the action taken when it lapses during creation:
@z

@x
```console
$ sbx --cloud create --name cloud-project --ttl 2h --on-timeout delete claude
```
@y
```console
$ sbx --cloud create --name cloud-project --ttl 2h --on-timeout delete claude
```
@z

@x
The default time-to-live is one hour. If you omit `--on-timeout`, the server
stops sandboxes that can be resumed and deletes the rest. Choose an action
explicitly when you need a particular outcome:
@y
The default time-to-live is one hour. If you omit `--on-timeout`, the server
stops sandboxes that can be resumed and deletes the rest. Choose an action
explicitly when you need a particular outcome:
@z

@x
- `stop` preserves the sandbox so it can be started again. This requires
  support for stopping the sandbox.
- `restart` stops and immediately starts the sandbox. If you also specify
  `--ttl`, it must be at least one hour.
- `delete` removes the sandbox.
@y
- `stop` preserves the sandbox so it can be started again. This requires
  support for stopping the sandbox.
- `restart` stops and immediately starts the sandbox. If you also specify
  `--ttl`, it must be at least one hour.
- `delete` removes the sandbox.
@z

@x
Volume-backed sandboxes require the `delete` action. Omitting `--ttl` uses
the server default. Setting `--ttl 0` is an error, not a way to disable
expiration.
@y
Volume-backed sandboxes require the `delete` action. Omitting `--ttl` uses
the server default. Setting `--ttl 0` is an error, not a way to disable
expiration.
@z

@x
Inspect or extend the expiration. Extensions cannot move expiration beyond
24 hours from creation:
@y
Inspect or extend the expiration. Extensions cannot move expiration beyond
24 hours from creation:
@z

@x
```console
$ sbx --cloud ttl cloud-project
$ sbx --cloud ttl +30m cloud-project
```
@y
```console
$ sbx --cloud ttl cloud-project
$ sbx --cloud ttl +30m cloud-project
```
@z

@x
## Stop or remove a sandbox
@y
## Stop or remove a sandbox
@z

@x
Stop a cloud sandbox while preserving its memory and filesystem:
@y
Stop a cloud sandbox while preserving its memory and filesystem:
@z

@x
```console
$ sbx --cloud stop cloud-project
```
@y
```console
$ sbx --cloud stop cloud-project
```
@z

@x
The command returns when the stop request is accepted. Check `sbx --cloud ls`
to confirm that the sandbox has stopped. Compute isn't billed while it is
stopped.
@y
The command returns when the stop request is accepted. Check `sbx --cloud ls`
to confirm that the sandbox has stopped. Compute isn't billed while it is
stopped.
@z

@x
To resume the sandbox and connect to its agent:
@y
To resume the sandbox and connect to its agent:
@z

@x
```console
$ sbx --cloud attach cloud-project
```
@y
```console
$ sbx --cloud attach cloud-project
```
@z

@x
You can also use `sbx --cloud run claude --name cloud-project`, or run the agent
without `--name` and select the sandbox when prompted. Add `--detached` to a
named run to resume without attaching.
@y
You can also use `sbx --cloud run claude --name cloud-project`, or run the agent
without `--name` and select the sandbox when prompted. Add `--detached` to a
named run to resume without attaching.
@z

@x
Resuming keeps the sandbox ID and state. Check its expiration with
`sbx --cloud ttl cloud-project` after resuming.
@y
Resuming keeps the sandbox ID and state. Check its expiration with
`sbx --cloud ttl cloud-project` after resuming.
@z

@x
If stop or resume reports that an existing sandbox was not found, the operation
may be disabled for your account.
@y
If stop or resume reports that an existing sandbox was not found, the operation
may be disabled for your account.
@z

@x
Volume-backed sandboxes can't be stopped. Remove a volume-backed sandbox to end
it and save the volume snapshot.
@y
Volume-backed sandboxes can't be stopped. Remove a volume-backed sandbox to end
it and save the volume snapshot.
@z

@x
Remove a sandbox when you no longer need its state:
@y
Remove a sandbox when you no longer need its state:
@z

@x
```console
$ sbx --cloud rm cloud-project
```
@y
```console
$ sbx --cloud rm cloud-project
```
@z

@x
Removal asks for confirmation, deletes the cloud sandbox, and can't be undone.
Use `--force` to skip the prompt in scripts.
@y
Removal asks for confirmation, deletes the cloud sandbox, and can't be undone.
Use `--force` to skip the prompt in scripts.
@z

@x
## Use persistent volumes
@y
## Use persistent volumes
@z

@x
Cloud volumes are experimental and preserve data independently of a sandbox.
Create a volume, then attach it at sandbox creation:
@y
Cloud volumes are experimental and preserve data independently of a sandbox.
Create a volume, then attach it at sandbox creation:
@z

@x
```console
$ sbx --cloud volume create dependency-cache
$ sbx --cloud create --name cloud-project \
    --volume dependency-cache:/workspace/cache claude
```
@y
```console
$ sbx --cloud volume create dependency-cache
$ sbx --cloud create --name cloud-project \
    --volume dependency-cache:/workspace/cache claude
```
@z

@x
The root directory of a newly created volume is owned by `root`. Change its
ownership after attaching it so the agent can write to it:
@y
The root directory of a newly created volume is owned by `root`. Change its
ownership after attaching it so the agent can write to it:
@z

@x
```console
$ sbx --cloud exec cloud-project \
    sudo chown agent:agent /workspace/cache
```
@y
```console
$ sbx --cloud exec cloud-project \
    sudo chown agent:agent /workspace/cache
```
@z

@x
Volume data is saved as a snapshot when a sandbox exits, not continuously. If
multiple sandboxes mount the same volume at the same time, the last sandbox to
exit overwrites the stored snapshot.
@y
Volume data is saved as a snapshot when a sandbox exits, not continuously. If
multiple sandboxes mount the same volume at the same time, the last sandbox to
exit overwrites the stored snapshot.
@z

@x
## Customize a cloud sandbox
@y
## Customize a cloud sandbox
@z

@x
Cloud templates have their own store. A local template is not available to
`sbx --cloud` until you transfer it. To capture a running cloud sandbox and
create another sandbox from that template:
@y
Cloud templates have their own store. A local template is not available to
`sbx --cloud` until you transfer it. To capture a running cloud sandbox and
create another sandbox from that template:
@z

@x
```console
$ sbx --cloud template save cloud-project cloud-template
$ sbx --cloud create --name cloud-copy --template cloud-template
```
@y
```console
$ sbx --cloud template save cloud-project cloud-template
$ sbx --cloud create --name cloud-copy --template cloud-template
```
@z

@x
The template supplies its CPU and memory configuration. Do not combine
`--template` with an agent name, `--cpus`, or `--memory`. To launch an OCI image
directly instead, use `--image-ref` with explicit CPU and memory values.
@y
The template supplies its CPU and memory configuration. Do not combine
`--template` with an agent name, `--cpus`, or `--memory`. To launch an OCI image
directly instead, use `--image-ref` with explicit CPU and memory values.
@z

@x
Snapshots include credentials written to the sandbox filesystem. Remove those
credentials before saving a template. Managed cloud secrets stay in the secret
store. See [Authenticate cloud agents](credentials.md).
@y
Snapshots include credentials written to the sandbox filesystem. Remove those
credentials before saving a template. Managed cloud secrets stay in the secret
store. See [Authenticate cloud agents](credentials.md).
@z

@x
Cloud sandboxes also support sandbox kits and `--kit` mixins. See
[Kits](../customize/_index.md) for customization and
[Local and cloud differences](local-vs-cloud.md) for host-dependent features.
Configure [cloud credentials](credentials.md) before adapting a local kit.
@y
Cloud sandboxes also support sandbox kits and `--kit` mixins. See
[Kits](../customize/_index.md) for customization and
[Local and cloud differences](local-vs-cloud.md) for host-dependent features.
Configure [cloud credentials](credentials.md) before adapting a local kit.
@z

@x
To declare reusable cloud configuration in a file, see
[Use a cloud environment](../configuration/environment-files.md#use-a-cloud-environment).
@y
To declare reusable cloud configuration in a file, see
[Use a cloud environment](../configuration/environment-files.md#use-a-cloud-environment).
@z

@x
## Load an MCP server
@y
## Load an MCP server
@z

@x
[Connect an MCP server in Docker Agentic Platform](/manuals/agentic-platform/mcp.md)
before loading it into a cloud sandbox. Use the same Docker account you use
with `sbx`.
@y
[Connect an MCP server in Docker Agentic Platform](manuals/agentic-platform/mcp.md)
before loading it into a cloud sandbox. Use the same Docker account you use
with `sbx`.
@z

@x
Load the connected server into a running cloud sandbox, using its name from
the console:
@y
Load the connected server into a running cloud sandbox, using its name from
the console:
@z

@x
```console
$ sbx --cloud mcp load <server-name> --sandbox cloud-project
```
@y
```console
$ sbx --cloud mcp load <server-name> --sandbox cloud-project
```
@z

@x
The server name is resolved by the MCP gateway associated with your Docker
Agentic Platform account. Cloud sandboxes don't use servers registered in the
local MCP store with `sbx mcp add`.
@y
The server name is resolved by the MCP gateway associated with your Docker
Agentic Platform account. Cloud sandboxes don't use servers registered in the
local MCP store with `sbx mcp add`.
@z

@x
List servers reported by existing cloud sandbox gateways, or inspect one
sandbox's gateway:
@y
List servers reported by existing cloud sandbox gateways, or inspect one
sandbox's gateway:
@z

@x
```console
$ sbx --cloud mcp ls
$ sbx --cloud mcp ls cloud-project
```
@y
```console
$ sbx --cloud mcp ls
$ sbx --cloud mcp ls cloud-project
```
@z

@x
The account listing shows servers reported by gateways, with the sandboxes
that use them. It omits unused server configurations and servers skipped by
a gateway. The sandbox view includes skipped servers.
@y
The account listing shows servers reported by gateways, with the sandboxes
that use them. It omits unused server configurations and servers skipped by
a gateway. The sandbox view includes skipped servers.
@z

@x
## Diagnose cloud access
@y
## Diagnose cloud access
@z

@x
Check the CLI, Docker sign-in, cloud API connectivity, and account access:
@y
Check the CLI, Docker sign-in, cloud API connectivity, and account access:
@z

@x
```console
$ sbx --cloud diagnose
```
@y
```console
$ sbx --cloud diagnose
```
@z

@x
These checks don't require a local sandbox daemon. For local diagnostics,
see [Troubleshooting](../troubleshooting.md).
@y
These checks don't require a local sandbox daemon. For local diagnostics,
see [Troubleshooting](../troubleshooting.md).
@z

@x
## Known limitations
@y
## Known limitations
@z

@x
### Docker exec and healthchecks
@y
### Docker exec and healthchecks
@z

@x
When running Docker inside a cloud sandbox, `docker exec` can access the
sandbox VM filesystem instead of the target container's filesystem. This also
affects `docker compose exec` and Docker healthchecks, which use the same
execution path.
@y
When running Docker inside a cloud sandbox, `docker exec` can access the
sandbox VM filesystem instead of the target container's filesystem. This also
affects `docker compose exec` and Docker healthchecks, which use the same
execution path.
@z

@x
Commands can fail because application files, binaries, or mounted data aren't
found. They can also succeed while reading or writing the wrong files. A
successful exit status doesn't confirm that the command used the target
container's filesystem.
@y
Commands can fail because application files, binaries, or mounted data aren't
found. They can also succeed while reading or writing the wrong files. A
successful exit status doesn't confirm that the command used the target
container's filesystem.
@z

@x
Healthchecks can report incorrect results. Compose services that depend on
`condition: service_healthy` can remain blocked even when the service they
need is running.
@y
Healthchecks can report incorrect results. Compose services that depend on
`condition: service_healthy` can remain blocked even when the service they
need is running.
@z

@x
A container's main process, started by `docker run`, uses the correct
filesystem. Where your workflow supports it, run setup or readiness checks
as a container's main command. This avoids the affected exec path for that
command but doesn't restore exec behavior or ongoing health monitoring.
@y
A container's main process, started by `docker run`, uses the correct
filesystem. Where your workflow supports it, run setup or readiness checks
as a container's main command. This avoids the affected exec path for that
command but doesn't restore exec behavior or ongoing health monitoring.
@z
