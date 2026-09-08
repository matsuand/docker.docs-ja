%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Connect VS Code to a sandbox
linkTitle: VS Code
@y
title: Connect VS Code to a sandbox
linkTitle: VS Code
@z

@x
description: Use VS Code Remote - SSH to develop inside a Docker Sandbox.
keywords: docker sandboxes, vs code, remote ssh, remote development, sbx
@y
description: Use VS Code Remote - SSH to develop inside a Docker Sandbox.
keywords: docker sandboxes, vs code, remote ssh, remote development, sbx
@z

@x
{{< summary-bar feature_name="Docker Sandboxes SSH" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes SSH" >}}
@z

@x
Use the Remote - SSH extension to open a VS Code window that runs inside a
sandbox. Your editor stays on your host while files, terminals, and extensions
run in the isolated sandbox.
@y
Use the Remote - SSH extension to open a VS Code window that runs inside a
sandbox. Your editor stays on your host while files, terminals, and extensions
run in the isolated sandbox.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- SSH access set up. See [Editor and app integrations](_index.md#enable-ssh-access).
- The [Remote - SSH](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh)
  extension (`ms-vscode-remote.remote-ssh`) installed in VS Code.
@y
- SSH access set up. See [Editor and app integrations](_index.md#enable-ssh-access).
- The [Remote - SSH](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh)
  extension (`ms-vscode-remote.remote-ssh`) installed in VS Code.
@z

@x
## Connect
@y
## Connect
@z

@x
Confirm that you can connect to the sandbox from a terminal:
@y
Confirm that you can connect to the sandbox from a terminal:
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
In VS Code, open the Command Palette and run **Remote-SSH: Connect to Host...**.
Enter the sandbox hostname, such as `demo.sbx`, manually. After VS Code
connects, use the remote folder picker to
[select the mounted workspace](_index.md#select-the-workspace-folder).
@y
In VS Code, open the Command Palette and run **Remote-SSH: Connect to Host...**.
Enter the sandbox hostname, such as `demo.sbx`, manually. After VS Code
connects, use the remote folder picker to
[select the mounted workspace](_index.md#select-the-workspace-folder).
@z

@x
For more connection options, see the VS Code instructions to
[connect to a remote host](https://code.visualstudio.com/docs/remote/ssh#_connect-to-a-remote-host).
@y
For more connection options, see the VS Code instructions to
[connect to a remote host](https://code.visualstudio.com/docs/remote/ssh#_connect-to-a-remote-host).
@z

@x
## Notes
@y
## Notes
@z

@x
- The first connection installs the VS Code server inside the sandbox, so it
  can take a moment. Later connections are faster.
@y
- The first connection installs the VS Code server inside the sandbox, so it
  can take a moment. Later connections are faster.
@z

@x
### Reconnect loop on macOS
@y
### Reconnect loop on macOS
@z

@x
Affected versions of VS Code can enter an infinite reconnect loop on macOS. If
this happens, set `remote.SSH.useLocalServer` to `false` in your VS Code user
settings:
@y
Affected versions of VS Code can enter an infinite reconnect loop on macOS. If
this happens, set `remote.SSH.useLocalServer` to `false` in your VS Code user
settings:
@z

@x
```json
{
  "remote.SSH.useLocalServer": false
}
```
@y
```json
{
  "remote.SSH.useLocalServer": false
}
```
@z

@x
For details, see
[microsoft/vscode-remote-release#11672](https://github.com/microsoft/vscode-remote-release/issues/11672).
@y
For details, see
[microsoft/vscode-remote-release#11672](https://github.com/microsoft/vscode-remote-release/issues/11672).
@z

@x
### SSH host key verification fails
@y
### SSH host key verification fails
@z

@x
VS Code can leave duplicate or malformed `Host *.sbx` blocks in your SSH
config after you add an SSH host. If a VS Code connection reports a
`KnownHostsCommand` error or `Host key verification failed`, remove every SSH
config block marked `docker sandboxes (managed)`, including the marker
comments:
@y
VS Code can leave duplicate or malformed `Host *.sbx` blocks in your SSH
config after you add an SSH host. If a VS Code connection reports a
`KnownHostsCommand` error or `Host key verification failed`, remove every SSH
config block marked `docker sandboxes (managed)`, including the marker
comments:
@z

@x
```diff
-# >>> docker sandboxes (managed) >>>
-Host *.sbx
-    User _default_user_
-    ProxyCommand "sbx" ssh proxy %n
-    ...
-    UserKnownHostsFile "~/.ssh/sbx_known_hosts"
-    KnownHostsCommand "sbx" ssh known-hosts %H
-    StrictHostKeyChecking yes
-# <<< docker sandboxes (managed) <<<
```
@y
```diff
-# >>> docker sandboxes (managed) >>>
-Host *.sbx
-    User _default_user_
-    ProxyCommand "sbx" ssh proxy %n
-    ...
-    UserKnownHostsFile "~/.ssh/sbx_known_hosts"
-    KnownHostsCommand "sbx" ssh known-hosts %H
-    StrictHostKeyChecking yes
-# <<< docker sandboxes (managed) <<<
```
@z

@x
Then regenerate the managed block:
@y
Then regenerate the managed block:
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
Reconnect to the sandbox from VS Code.
@y
Reconnect to the sandbox from VS Code.
@z

@x
## Related
@y
## Related
@z

@x
- [Editor and app integrations](_index.md) — how SSH access works and how to
  set it up
@y
- [Editor and app integrations](_index.md) — how SSH access works and how to
  set it up
@z
