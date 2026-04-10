%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Troubleshooting
@y
title: Troubleshooting
@z

@x
description: Resolve common issues when using Docker Sandboxes.
@y
description: Resolve common issues when using Docker Sandboxes.
@z

@x
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@z

@x
## Resetting sandboxes
@y
## Resetting sandboxes
@z

@x
If you hit persistent issues or corrupted state, run
[`sbx reset`](/reference/cli/sbx/reset/) to stop all VMs and delete all sandbox
data. Create fresh sandboxes afterwards.
@y
If you hit persistent issues or corrupted state, run
[`sbx reset`](__SUBDIR__/reference/cli/sbx/reset/) to stop all VMs and delete all sandbox
data. Create fresh sandboxes afterwards.
@z

@x
## Agent can't install packages or reach an API
@y
## Agent can't install packages or reach an API
@z

@x
Sandboxes use a [deny-by-default network policy](security/policy.md).
If the agent fails to install packages or call an external API, the target
domain is likely not in the allow list. Check which requests are being blocked:
@y
Sandboxes use a [deny-by-default network policy](security/policy.md).
If the agent fails to install packages or call an external API, the target
domain is likely not in the allow list. Check which requests are being blocked:
@z

@x
```console
$ sbx policy log
```
@y
```console
$ sbx policy log
```
@z

@x
Then allow the domains your workflow needs:
@y
Then allow the domains your workflow needs:
@z

@x
```console
$ sbx policy allow network "*.npmjs.org,*.pypi.org,files.pythonhosted.org"
```
@y
```console
$ sbx policy allow network "*.npmjs.org,*.pypi.org,files.pythonhosted.org"
```
@z

@x
To allow all outbound traffic instead:
@y
To allow all outbound traffic instead:
@z

@x
```console
$ sbx policy allow network "**"
```
@y
```console
$ sbx policy allow network "**"
```
@z

@x
## Can't reach a service running on the host
@y
## Can't reach a service running on the host
@z

@x
If a request to `127.0.0.1` or a local network IP returns "connection refused"
from inside a sandbox, the address is not routable from within the sandbox VM.
See [Accessing host services from a sandbox](usage.md#accessing-host-services-from-a-sandbox).
@y
If a request to `127.0.0.1` or a local network IP returns "connection refused"
from inside a sandbox, the address is not routable from within the sandbox VM.
See [Accessing host services from a sandbox](usage.md#accessing-host-services-from-a-sandbox).
@z

@x
## Docker authentication failure
@y
## Docker authentication failure
@z

@x
If you see a message like `You are not authenticated to Docker`, your login
session has expired. In an interactive terminal, the CLI prompts you to sign in
again. In non-interactive environments such as scripts or CI, run `sbx login`
to re-authenticate.
@y
If you see a message like `You are not authenticated to Docker`, your login
session has expired. In an interactive terminal, the CLI prompts you to sign in
again. In non-interactive environments such as scripts or CI, run `sbx login`
to re-authenticate.
@z

@x
## Agent authentication failure
@y
## Agent authentication failure
@z

@x
If the agent can't reach its model provider or you see API key errors, the key
is likely invalid, expired, or not configured. Verify it's set in your shell
configuration file and that you sourced it or opened a new terminal.
@y
If the agent can't reach its model provider or you see API key errors, the key
is likely invalid, expired, or not configured. Verify it's set in your shell
configuration file and that you sourced it or opened a new terminal.
@z

@x
For agents that use the [credential proxy](security/credentials.md), make sure
you haven't set the API key to an invalid value inside the sandbox — the proxy
injects credentials automatically on outbound requests.
@y
For agents that use the [credential proxy](security/credentials.md), make sure
you haven't set the API key to an invalid value inside the sandbox — the proxy
injects credentials automatically on outbound requests.
@z

@x
If credentials are configured correctly but API calls still fail, check
`sbx policy log` and look at the **PROXY** column. Requests routed through
the `transparent` proxy don't get credential injection. This can happen when a
client inside the sandbox (such as a process in a Docker container) isn't
configured to use the forward proxy. See
[Monitoring network activity](security/policy.md#monitoring)
for details.
@y
If credentials are configured correctly but API calls still fail, check
`sbx policy log` and look at the **PROXY** column. Requests routed through
the `transparent` proxy don't get credential injection. This can happen when a
client inside the sandbox (such as a process in a Docker container) isn't
configured to use the forward proxy. See
[Monitoring network activity](security/policy.md#monitoring)
for details.
@z

@x
## Docker build export fails with "lchown: operation not permitted"
@y
## Docker build export fails with "lchown: operation not permitted"
@z

@x
Running `docker build` with the local exporter (`--output=type=local` or `-o
<path>`) inside a sandbox fails because the exporter tries to `lchown` output
files to preserve ownership from the build. Processes inside the sandbox run as
an unprivileged user without `CAP_CHOWN`, so the operation is denied.
@y
Running `docker build` with the local exporter (`--output=type=local` or `-o
<path>`) inside a sandbox fails because the exporter tries to `lchown` output
files to preserve ownership from the build. Processes inside the sandbox run as
an unprivileged user without `CAP_CHOWN`, so the operation is denied.
@z

@x
Use the tar exporter and extract the archive instead:
@y
Use the tar exporter and extract the archive instead:
@z

@x
```console
$ mkdir -p ./result
$ docker build --output type=tar,dest=- . | tar xf - -C ./result
```
@y
```console
$ mkdir -p ./result
$ docker build --output type=tar,dest=- . | tar xf - -C ./result
```
@z

@x
Extracting the tar archive as the current user avoids the `chown` call.
@y
Extracting the tar archive as the current user avoids the `chown` call.
@z

@x
## Stale Git worktree after removing a sandbox
@y
## Stale Git worktree after removing a sandbox
@z

@x
If you used `--branch`, worktree cleanup during `sbx rm` is best-effort. If
it fails, the sandbox is removed but the branch and worktree are left behind.
If `git worktree list` shows a stale worktree in `.sbx/` after removing a
sandbox, clean it up manually:
@y
If you used `--branch`, worktree cleanup during `sbx rm` is best-effort. If
it fails, the sandbox is removed but the branch and worktree are left behind.
If `git worktree list` shows a stale worktree in `.sbx/` after removing a
sandbox, clean it up manually:
@z

@x
```console
$ git worktree remove .sbx/<sandbox-name>-worktrees/<branch-name>
$ git branch -D <branch-name>
```
@y
```console
$ git worktree remove .sbx/<sandbox-name>-worktrees/<branch-name>
$ git branch -D <branch-name>
```
@z

@x
## Signed Git commits
@y
## Signed Git commits
@z

@x
Agents inside a sandbox can't sign commits because signing keys (GPG, SSH)
aren't available in the sandbox environment. Commits created by an agent are
unsigned.
@y
Agents inside a sandbox can't sign commits because signing keys (GPG, SSH)
aren't available in the sandbox environment. Commits created by an agent are
unsigned.
@z

@x
If your repository or organization requires signed commits, use one of these
workarounds:
@y
If your repository or organization requires signed commits, use one of these
workarounds:
@z

@x
- **Commit outside the sandbox.** Let the agent make changes without
  committing, then commit and sign from your host terminal.
@y
- **Commit outside the sandbox.** Let the agent make changes without
  committing, then commit and sign from your host terminal.
@z

@x
- **Sign after the fact.** Let the agent commit inside the sandbox, then
  re-sign the commits on your host:
@y
- **Sign after the fact.** Let the agent commit inside the sandbox, then
  re-sign the commits on your host:
@z

@x
  ```console
  $ git rebase --exec 'git commit --amend --no-edit -S' origin/main
  ```
@y
  ```console
  $ git rebase --exec 'git commit --amend --no-edit -S' origin/main
  ```
@z

@x
  This replays each commit on the branch and re-signs it with your local
  signing key.
@y
  This replays each commit on the branch and re-signs it with your local
  signing key.
@z

@x
## Clock drift after sleep/wake
@y
## Clock drift after sleep/wake
@z

@x
If your laptop sleeps and wakes while a sandbox is running, the VM clock can
fall behind the host clock. This causes problems such as:
@y
If your laptop sleeps and wakes while a sandbox is running, the VM clock can
fall behind the host clock. This causes problems such as:
@z

@x
- External API calls failing because of timestamp validation.
- Git commits with incorrect timestamps.
- TLS certificate errors due to time mismatches.
@y
- External API calls failing because of timestamp validation.
- Git commits with incorrect timestamps.
- TLS certificate errors due to time mismatches.
@z

@x
To fix the issue, stop and restart the sandbox:
@y
To fix the issue, stop and restart the sandbox:
@z

@x
```console
$ sbx stop <sandbox-name>
$ sbx run <sandbox-name>
```
@y
```console
$ sbx stop <sandbox-name>
$ sbx run <sandbox-name>
```
@z

@x
Restarting the sandbox re-syncs the VM clock with the host.
@y
Restarting the sandbox re-syncs the VM clock with the host.
@z

@x
## Removing all state
@y
## Removing all state
@z

@x
As a last resort, if `sbx reset` doesn't resolve your issue, you can remove the
`sbx` state directory entirely. This deletes all sandbox data, configuration, and
cached images. Stop all running sandboxes first with `sbx reset`.
@y
As a last resort, if `sbx reset` doesn't resolve your issue, you can remove the
`sbx` state directory entirely. This deletes all sandbox data, configuration, and
cached images. Stop all running sandboxes first with `sbx reset`.
@z

@x
macOS:
@y
macOS:
@z

@x
```console
$ rm -rf ~/Library/Application\ Support/com.docker.sandboxes/
```
@y
```console
$ rm -rf ~/Library/Application\ Support/com.docker.sandboxes/
```
@z

@x
Windows:
@y
Windows:
@z

@x
```powershell
> Remove-Item -Recurse -Force "$env:LOCALAPPDATA\DockerSandboxes"
```
@y
```powershell
> Remove-Item -Recurse -Force "$env:LOCALAPPDATA\DockerSandboxes"
```
@z

@x
## Report an issue
@y
## Report an issue
@z

@x
If you've exhausted the steps above and the problem persists, file a GitHub
issue at [github.com/docker/sbx-releases/issues](https://github.com/docker/sbx-releases/issues).
@y
If you've exhausted the steps above and the problem persists, file a GitHub
issue at [github.com/docker/sbx-releases/issues](https://github.com/docker/sbx-releases/issues).
@z
