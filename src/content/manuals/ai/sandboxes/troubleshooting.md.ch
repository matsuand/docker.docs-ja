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
keywords: docker sandboxes, sbx, troubleshooting, diagnostics, reset, network policy, git, ssh
@y
description: Resolve common issues when using Docker Sandboxes.
keywords: docker sandboxes, sbx, troubleshooting, diagnostics, reset, network policy, git, ssh
@z

@x
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@z

@x
## Run diagnostics
@y
## Run diagnostics
@z

@x
Before digging into a specific issue, run
[`sbx diagnose`](/reference/cli/sbx/diagnose/) to check for common problems
with your installation, such as a missing CLI binary, an unresponsive daemon,
a CLI/daemon version mismatch, missing storage directories, or broken
authentication.
@y
Before digging into a specific issue, run
[`sbx diagnose`](__SUBDIR__/reference/cli/sbx/diagnose/) to check for common problems
with your installation, such as a missing CLI binary, an unresponsive daemon,
a CLI/daemon version mismatch, missing storage directories, or broken
authentication.
@z

@x
```console
$ sbx diagnose
```
@y
```console
$ sbx diagnose
```
@z

@x
The command prints a summary of checks that passed, warned, or failed, along
with suggested fixes. Use `--output json` to get machine-readable output, or
`--output github-issue` to generate a Markdown snippet suitable for pasting
into a GitHub issue.
@y
The command prints a summary of checks that passed, warned, or failed, along
with suggested fixes. Use `--output json` to get machine-readable output, or
`--output github-issue` to generate a Markdown snippet suitable for pasting
into a GitHub issue.
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
## SSH and other non-HTTP connections fail
@y
## SSH and other non-HTTP connections fail
@z

@x
Non-HTTP TCP connections like SSH can be allowed by adding a policy rule for
the destination IP address and port. For example, to allow SSH to a specific
host:
@y
Non-HTTP TCP connections like SSH can be allowed by adding a policy rule for
the destination IP address and port. For example, to allow SSH to a specific
host:
@z

@x
```console
$ sbx policy allow network "10.1.2.3:22"
```
@y
```console
$ sbx policy allow network "10.1.2.3:22"
```
@z

@x
Hostname-based rules (for example, `myhost:22`) don't work for non-HTTP
connections because the proxy can't resolve the hostname to an IP address in
this context. Use the IP address directly.
@y
Hostname-based rules (for example, `myhost:22`) don't work for non-HTTP
connections because the proxy can't resolve the hostname to an IP address in
this context. Use the IP address directly.
@z

@x
UDP and ICMP traffic is blocked at the network layer and can't be unblocked
with policy rules.
@y
UDP and ICMP traffic is blocked at the network layer and can't be unblocked
with policy rules.
@z

@x
For Git operations over SSH, you can either add an allow rule for the Git
server's IP address or use HTTPS URLs instead:
@y
For Git operations over SSH, you can either add an allow rule for the Git
server's IP address or use HTTPS URLs instead:
@z

@x
```console
$ git clone https://github.com/owner/repo.git
```
@y
```console
$ git clone https://github.com/owner/repo.git
```
@z

@x
## Can't reach a service running on the host
@y
## Can't reach a service running on the host
@z

@x
If a request to `127.0.0.1` or a local network IP returns "connection refused"
from inside a sandbox, the address is not reachable from within the sandbox VM.
See [Accessing host services from a sandbox](usage.md#accessing-host-services-from-a-sandbox).
@y
If a request to `127.0.0.1` or a local network IP returns "connection refused"
from inside a sandbox, the address is not reachable from within the sandbox VM.
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
## Docker build export fails with an ownership error
@y
## Docker build export fails with an ownership error
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
## Sandbox commits aren't signed
@y
## Sandbox commits aren't signed
@z

@x
Docker Sandboxes can sign Git commits with SSH keys from your host agent.
For setup steps, see [Signed commits](usage.md#signed-commits).
@y
Docker Sandboxes can sign Git commits with SSH keys from your host agent.
For setup steps, see [Signed commits](usage.md#signed-commits).
@z

@x
If `ssh-add -L` prints `The agent has no identities.`, the sandbox can reach
the forwarded agent, but the host agent doesn't have a loaded key. Load the
signing key into your host SSH agent:
@y
If `ssh-add -L` prints `The agent has no identities.`, the sandbox can reach
the forwarded agent, but the host agent doesn't have a loaded key. Load the
signing key into your host SSH agent:
@z

@x
```console
$ ssh-add ~/.ssh/id_ed25519
```
@y
```console
$ ssh-add ~/.ssh/id_ed25519
```
@z

@x
If commit signing works on the host but fails in a sandbox, check whether Git
is configured to sign with a host file path such as
`/Users/me/.ssh/id_ed25519.pub`. The sandbox uses the forwarded SSH agent, not
the host key file path. Use the inline public key form instead:
@y
If commit signing works on the host but fails in a sandbox, check whether Git
is configured to sign with a host file path such as
`/Users/me/.ssh/id_ed25519.pub`. The sandbox uses the forwarded SSH agent, not
the host key file path. Use the inline public key form instead:
@z

@x
```console
$ git config --global gpg.format ssh
$ git config --global user.signingkey "key::$(ssh-add -L | head -n 1)"
```
@y
```console
$ git config --global gpg.format ssh
$ git config --global user.signingkey "key::$(ssh-add -L | head -n 1)"
```
@z

@x
If Git reports that `ssh-keygen` is missing, use a sandbox template that
includes OpenSSH client tools.
@y
If Git reports that `ssh-keygen` is missing, use a sandbox template that
includes OpenSSH client tools.
@z

@x
If `git log --show-signature` reports that `gpg.ssh.allowedSignersFile` needs
to be configured, Git can't verify the SSH signature locally. This verification
config isn't required to create signed commits. GitHub uses the SSH signing
keys configured in your GitHub account to verify commits.
@y
If `git log --show-signature` reports that `gpg.ssh.allowedSignersFile` needs
to be configured, Git can't verify the SSH signature locally. This verification
config isn't required to create signed commits. GitHub uses the SSH signing
keys configured in your GitHub account to verify commits.
@z

@x
GPG and S/MIME signing keys aren't available inside the sandbox. If your
repository or organization requires GPG or S/MIME signatures, or if SSH signing
isn't configured, use one of these workarounds:
@y
GPG and S/MIME signing keys aren't available inside the sandbox. If your
repository or organization requires GPG or S/MIME signatures, or if SSH signing
isn't configured, use one of these workarounds:
@z

@x
- Commit outside the sandbox. Let the agent make changes without committing,
  then commit and sign from your host terminal.
@y
- Commit outside the sandbox. Let the agent make changes without committing,
  then commit and sign from your host terminal.
@z

@x
- Sign after the fact. Let the agent commit inside the sandbox, then re-sign
  the commits on your host:
@y
- Sign after the fact. Let the agent commit inside the sandbox, then re-sign
  the commits on your host:
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
{{< tabs >}}
{{< tab name="macOS" >}}
@y
{{< tabs >}}
{{< tab name="macOS" >}}
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
{{< /tab >}}
{{< tab name="Windows" >}}
@y
{{< /tab >}}
{{< tab name="Windows" >}}
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
{{< /tab >}}
{{< tab name="Linux" >}}
@y
{{< /tab >}}
{{< tab name="Linux" >}}
@z

@x
Sandbox state on Linux follows the XDG Base Directory specification and is
spread across three directories:
@y
Sandbox state on Linux follows the XDG Base Directory specification and is
spread across three directories:
@z

@x
```console
$ rm -rf ~/.local/state/sandboxes/
$ rm -rf ~/.cache/sandboxes/
$ rm -rf ~/.config/sandboxes/
```
@y
```console
$ rm -rf ~/.local/state/sandboxes/
$ rm -rf ~/.cache/sandboxes/
$ rm -rf ~/.config/sandboxes/
```
@z

@x
If you have set custom `XDG_STATE_HOME`, `XDG_CACHE_HOME`, or
`XDG_CONFIG_HOME` environment variables, replace `~/.local/state`,
`~/.cache`, and `~/.config` with the corresponding values.
@y
If you have set custom `XDG_STATE_HOME`, `XDG_CACHE_HOME`, or
`XDG_CONFIG_HOME` environment variables, replace `~/.local/state`,
`~/.cache`, and `~/.config` with the corresponding values.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
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

@x
To help Docker investigate, generate a diagnostics bundle and share it when
reporting the issue:
@y
To help Docker investigate, generate a diagnostics bundle and share it when
reporting the issue:
@z

@x
```console
$ sbx diagnose --upload
```
@y
```console
$ sbx diagnose --upload
```
@z

@x
The bundle contains daemon logs, diagnostic check results, and basic system
information. When `--upload` is confirmed, the bundle is uploaded to Docker
support and the command prints a diagnostics ID. Include this ID in your
issue so the team can correlate it with the uploaded bundle.
@y
The bundle contains daemon logs, diagnostic check results, and basic system
information. When `--upload` is confirmed, the bundle is uploaded to Docker
support and the command prints a diagnostics ID. Include this ID in your
issue so the team can correlate it with the uploaded bundle.
@z
