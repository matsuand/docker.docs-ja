%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Editor and app integrations
linkTitle: Integrations
@y
title: Editor and app integrations
linkTitle: Integrations
@z

@x
description: Connect editors and desktop apps to a Docker Sandbox over SSH.
keywords: docker sandboxes, ssh, integrations, vs code, cursor, remote development, sbx
@y
description: Connect editors and desktop apps to a Docker Sandbox over SSH.
keywords: docker sandboxes, ssh, integrations, vs code, cursor, remote development, sbx
@z

@x
{{< summary-bar feature_name="Docker Sandboxes SSH" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes SSH" >}}
@z

@x
You can connect an external editor or desktop app to a running sandbox over
SSH. This lets you use the tools you already know — VS Code, Cursor, Claude
Desktop, and others — while your code runs, builds, and executes inside the
isolated sandbox instead of on your host.
@y
You can connect an external editor or desktop app to a running sandbox over
SSH. This lets you use the tools you already know — VS Code, Cursor, Claude
Desktop, and others — while your code runs, builds, and executes inside the
isolated sandbox instead of on your host.
@z

@x
Each sandbox is reachable at `<name>.sbx`, where `<name>` is the sandbox name.
Once SSH is set up, `<name>.sbx` behaves like any other SSH host, so any tool
that supports remote development over SSH can connect to it.
@y
Each sandbox is reachable at `<name>.sbx`, where `<name>` is the sandbox name.
Once SSH is set up, `<name>.sbx` behaves like any other SSH host, so any tool
that supports remote development over SSH can connect to it.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- The `sbx` CLI installed and signed in. See [Get started](../get-started.md).
- An SSH client. macOS and most Linux distributions include OpenSSH. On
  Windows, install the OpenSSH client.
- The editor or app you want to connect, with its remote-over-SSH support
  installed.
@y
- The `sbx` CLI installed and signed in. See [Get started](../get-started.md).
- An SSH client. macOS and most Linux distributions include OpenSSH. On
  Windows, install the OpenSSH client.
- The editor or app you want to connect, with its remote-over-SSH support
  installed.
@z

@x
## Enable SSH access
@y
## Enable SSH access
@z

@x
Run the SSH setup command once:
@y
Run the SSH setup command once:
@z

@x
```console
$ sbx setup ssh
```
@y
```console
$ sbx setup ssh
```
@z

@x
The command starts the Docker Sandboxes daemon if needed and configures your
SSH client. You can re-run it at any time.
@y
The command starts the Docker Sandboxes daemon if needed and configures your
SSH client. You can re-run it at any time.
@z

@x
## Create or identify a sandbox
@y
## Create or identify a sandbox
@z

@x
SSH connections require an existing sandbox. To create a named shell sandbox
for the current directory:
@y
SSH connections require an existing sandbox. To create a named shell sandbox
for the current directory:
@z

@x
```console
$ sbx create --name demo shell .
```
@y
```console
$ sbx create --name demo shell .
```
@z

@x
To identify an existing sandbox, list your sandboxes:
@y
To identify an existing sandbox, list your sandboxes:
@z

@x
```console
$ sbx ls
```
@y
```console
$ sbx ls
```
@z

@x
## Connect to a sandbox over SSH
@y
## Connect to a sandbox over SSH
@z

@x
Use the sandbox name with the `.sbx` suffix. For example, to connect to a
sandbox named `demo`:
@y
Use the sandbox name with the `.sbx` suffix. For example, to connect to a
sandbox named `demo`:
@z

@x
```console
$ ssh demo.sbx
```
@y
```console
$ ssh demo.sbx
```
@z

@x
## Select the workspace folder
@y
## Select the workspace folder
@z

@x
Connecting an app to a sandbox selects the remote environment, but it might not
open the mounted workspace automatically. Use the app's remote folder picker to
select the workspace when you configure the connection or start a session.
@y
Connecting an app to a sandbox selects the remote environment, but it might not
open the mounted workspace automatically. Use the app's remote folder picker to
select the workspace when you configure the connection or start a session.
@z

@x
The folder picker might open at the sandbox user's home directory, typically
`/home/agent`. Workspaces retain their absolute host paths inside the sandbox.
For example, if you mount `/Users/bob/src/my-project`, select
`/Users/bob/src/my-project` in the remote folder picker.
@y
The folder picker might open at the sandbox user's home directory, typically
`/home/agent`. Workspaces retain their absolute host paths inside the sandbox.
For example, if you mount `/Users/bob/src/my-project`, select
`/Users/bob/src/my-project` in the remote folder picker.
@z

@x
## Connect a specific tool
@y
## Connect a specific tool
@z

@x
- [VS Code](vscode.md)
- [Cursor](cursor.md)
- [Claude Desktop](claude-desktop.md)
- [ChatGPT](chatgpt.md)
- [T3 Code](t3-code.md)
@y
- [VS Code](vscode.md)
- [Cursor](cursor.md)
- [Claude Desktop](claude-desktop.md)
- [ChatGPT](chatgpt.md)
- [T3 Code](t3-code.md)
@z

@x
## How SSH connections work
@y
## How SSH connections work
@z

@x
### Managed SSH configuration
@y
### Managed SSH configuration
@z

@x
`sbx setup ssh` writes a managed block to your SSH config: `~/.ssh/config` on
macOS and Linux, or `%USERPROFILE%\.ssh\config` on Windows. The block is similar
to the following:
@y
`sbx setup ssh` writes a managed block to your SSH config: `~/.ssh/config` on
macOS and Linux, or `%USERPROFILE%\.ssh\config` on Windows. The block is similar
to the following:
@z

@x
```text
# >>> docker sandboxes (managed) >>>
Host *.sbx
    User _default_user_
    ProxyCommand "sbx" ssh proxy %n
    IdentityAgent none
    IdentityFile /dev/null
    IdentitiesOnly yes
    ControlMaster no
    ControlPath none
    UserKnownHostsFile "~/.ssh/sbx_known_hosts"
    KnownHostsCommand "sbx" ssh known-hosts %H
    StrictHostKeyChecking yes
# <<< docker sandboxes (managed) <<<
```
@y
```text
# >>> docker sandboxes (managed) >>>
Host *.sbx
    User _default_user_
    ProxyCommand "sbx" ssh proxy %n
    IdentityAgent none
    IdentityFile /dev/null
    IdentitiesOnly yes
    ControlMaster no
    ControlPath none
    UserKnownHostsFile "~/.ssh/sbx_known_hosts"
    KnownHostsCommand "sbx" ssh known-hosts %H
    StrictHostKeyChecking yes
# <<< docker sandboxes (managed) <<<
```
@z

@x
You don't edit this block by hand. Its key entries work as follows:
@y
You don't edit this block by hand. Its key entries work as follows:
@z

@x
- `Host *.sbx` maps sandbox hostnames to the sandbox daemon. Application host
  pickers don't discover individual sandbox names from this wildcard, so enter
  the hostname, such as `demo.sbx`, manually when you configure an integration.
- `User _default_user_` tells the daemon to use the sandbox image's default
  user, so your host username is never sent.
@y
- `Host *.sbx` maps sandbox hostnames to the sandbox daemon. Application host
  pickers don't discover individual sandbox names from this wildcard, so enter
  the hostname, such as `demo.sbx`, manually when you configure an integration.
- `User _default_user_` tells the daemon to use the sandbox image's default
  user, so your host username is never sent.
@z

@x
### Connection and authentication
@y
### Connection and authentication
@z

@x
Connections don't use a network port or an SSH key:
@y
Connections don't use a network port or an SSH key:
@z

@x
- A `ProxyCommand` relays the SSH stream to the daemon over its local socket
  (a Unix domain socket on macOS and Linux, a named pipe on Windows).
- The daemon accepts the connection only while you have an active Docker login.
  Authentication is tied to your login, not to a stored key.
- The host key is verified on every connection, so a rotated daemon key never
  triggers a host-key mismatch.
@y
- A `ProxyCommand` relays the SSH stream to the daemon over its local socket
  (a Unix domain socket on macOS and Linux, a named pipe on Windows).
- The daemon accepts the connection only while you have an active Docker login.
  Authentication is tied to your login, not to a stored key.
- The host key is verified on every connection, so a rotated daemon key never
  triggers a host-key mismatch.
@z

@x
Because SSH terminates at the daemon, no SSH server runs inside the sandbox.
The sandbox must already be created. If it is stopped, connecting to
`<name>.sbx` starts it automatically.
@y
Because SSH terminates at the daemon, no SSH server runs inside the sandbox.
The sandbox must already be created. If it is stopped, connecting to
`<name>.sbx` starts it automatically.
@z

@x
### Environment variables
@y
### Environment variables
@z

@x
SSH connections don't forward client environment variables into the sandbox.
The daemon acknowledges SSH environment requests for compatibility but ignores
their names and values.
@y
SSH connections don't forward client environment variables into the sandbox.
The daemon acknowledges SSH environment requests for compatibility but ignores
their names and values.
@z

@x
### Port forwarding
@y
### Port forwarding
@z

@x
SSH clients can use local port forwarding to make a service listening on the
sandbox's loopback interface available on the host. For example, a remote
development client can map `127.0.0.1:4321` in the sandbox to
`127.0.0.1:55565` on the host, choosing an available host port automatically.
Traffic passes through the SSH connection instead of a published Docker port.
@y
SSH clients can use local port forwarding to make a service listening on the
sandbox's loopback interface available on the host. For example, a remote
development client can map `127.0.0.1:4321` in the sandbox to
`127.0.0.1:55565` on the host, choosing an available host port automatically.
Traffic passes through the SSH connection instead of a published Docker port.
@z

@x
The sandbox daemon accepts forwarded connections only to loopback addresses in
the sandbox, including `localhost`, `127.0.0.0/8`, and `::1`. The SSH client
chooses the bind address for the listener on the host. A listener bound to
`127.0.0.1` or `::1` is reachable only from the host. A client configured to
bind to a non-loopback address can make the forwarded service reachable from
other machines, subject to the host's network and firewall configuration.
@y
The sandbox daemon accepts forwarded connections only to loopback addresses in
the sandbox, including `localhost`, `127.0.0.0/8`, and `::1`. The SSH client
chooses the bind address for the listener on the host. A listener bound to
`127.0.0.1` or `::1` is reachable only from the host. A client configured to
bind to a non-loopback address can make the forwarded service reachable from
other machines, subject to the host's network and firewall configuration.
@z
