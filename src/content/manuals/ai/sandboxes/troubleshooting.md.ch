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
## Run diagnostics
@y
## Run diagnostics
@z

@x
Before digging into a specific issue, run
[`sbx diagnose`](/reference/cli/sbx/diagnose/) to check for common problems
with your installation, such as a missing CLI binary, daemon reachability
problems, a CLI/daemon version mismatch, missing storage directories, or
broken authentication.
@y
Before digging into a specific issue, run
[`sbx diagnose`](__SUBDIR__/reference/cli/sbx/diagnose/) to check for common problems
with your installation, such as a missing CLI binary, daemon reachability
problems, a CLI/daemon version mismatch, missing storage directories, or
broken authentication.
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
## Restart the sandbox daemon
@y
## Restart the sandbox daemon
@z

@x
If sandbox commands hang, fail to connect to the daemon, or keep returning
daemon errors, restart the sandbox daemon before resetting sandbox state:
@y
If sandbox commands hang, fail to connect to the daemon, or keep returning
daemon errors, restart the sandbox daemon before resetting sandbox state:
@z

@x
```console
$ sbx daemon restart
```
@y
```console
$ sbx daemon restart
```
@z

@x
Then retry the command that failed. Restarting the daemon doesn't delete
sandbox data. If the issue persists or state is corrupted, use
[`sbx reset`](/reference/cli/sbx/reset/).
@y
Then retry the command that failed. Restarting the daemon doesn't delete
sandbox data. If the issue persists or state is corrupted, use
[`sbx reset`](__SUBDIR__/reference/cli/sbx/reset/).
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
## Sandbox doesn't contain my project files
@y
## Sandbox doesn't contain my project files
@z

@x
Starting with `sbx` version 0.42.0, the workspace path is optional for
`sbx create`. When you omit it, the command creates a mountless sandbox. For
example, these commands create and attach to a sandbox without mounting your
host project files:
@y
Starting with `sbx` version 0.42.0, the workspace path is optional for
`sbx create`. When you omit it, the command creates a mountless sandbox. For
example, these commands create and attach to a sandbox without mounting your
host project files:
@z

@x
```console
$ sbx create --name <sandbox-name> <agent>
$ sbx run --name <sandbox-name>
```
@y
```console
$ sbx create --name <sandbox-name> <agent>
$ sbx run --name <sandbox-name>
```
@z

@x
By contrast, `sbx run` mounts the current directory when you don't pass a
workspace path:
@y
By contrast, `sbx run` mounts the current directory when you don't pass a
workspace path:
@z

@x
```console
$ sbx run <agent>
```
@y
```console
$ sbx run <agent>
```
@z

@x
A sandbox's workspace configuration is fixed when the sandbox is created. To
reuse the name of an existing mountless sandbox, first
[copy out any files you want to keep](usage.md#copy-files-between-host-and-sandbox),
then remove and recreate it with a workspace path:
@y
A sandbox's workspace configuration is fixed when the sandbox is created. To
reuse the name of an existing mountless sandbox, first
[copy out any files you want to keep](usage.md#copy-files-between-host-and-sandbox),
then remove and recreate it with a workspace path:
@z

@x
```console
$ sbx rm <sandbox-name>
$ sbx run --name <sandbox-name> <agent>
```
@y
```console
$ sbx rm <sandbox-name>
$ sbx run --name <sandbox-name> <agent>
```
@z

@x
See [Choose a workspace](usage.md#choose-a-workspace) for mountless, direct,
and clone-mode behavior.
@y
See [Choose a workspace](usage.md#choose-a-workspace) for mountless, direct,
and clone-mode behavior.
@z

@x
## Agent can't install packages or reach an API
@y
## Agent can't install packages or reach an API
@z

@x
Sandboxes use [network access rules](governance/access-controls/network.md) to
control outbound traffic.
If the agent fails to install packages or call an external API, the target
domain is likely not in the allow list. Check which requests are being blocked:
@y
Sandboxes use [network access rules](governance/access-controls/network.md) to
control outbound traffic.
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
If `sbx policy allow` doesn't unblock the request, your organization may
manage sandbox policies centrally and take precedence over local rules. See
[Organization policies](governance/access-controls/organization.md).
@y
If `sbx policy allow` doesn't unblock the request, your organization may
manage sandbox policies centrally and take precedence over local rules. See
[Organization policies](governance/access-controls/organization.md).
@z

@x
## Kit fails to install: source not in allowlist
@y
## Kit fails to install: source not in allowlist
@z

@x
If loading a kit fails with a message like its source is not in your
allowlist:
@y
If loading a kit fails with a message like its source is not in your
allowlist:
@z

@x
```console
$ sbx run claude --kit "git+https://github.com/docker/sbx-kits-contrib.git#dir=vale"
ERROR: resolve kits: kit "git+https://github.com/docker/sbx-kits-contrib.git#dir=vale" cannot be installed — its source is not in your allowlist.
```
@y
```console
$ sbx run claude --kit "git+https://github.com/docker/sbx-kits-contrib.git#dir=vale"
ERROR: resolve kits: kit "git+https://github.com/docker/sbx-kits-contrib.git#dir=vale" cannot be installed — its source is not in your allowlist.
```
@z

@x
`sbx` restricts kit installs to an allowlist of sources, which defaults to
Docker Hub (`docker.io/`) only. Add the kit's publisher to the
[`kit.allowedSources`](configuration/settings.md#kitallowedsources) setting,
keeping the entries you want to retain:
@y
`sbx` restricts kit installs to an allowlist of sources, which defaults to
Docker Hub (`docker.io/`) only. Add the kit's publisher to the
[`kit.allowedSources`](configuration/settings.md#kitallowedsources) setting,
keeping the entries you want to retain:
@z

@x
```console
$ sbx settings set kit.allowedSources '["docker.io/","github.com/docker/"]'
```
@y
```console
$ sbx settings set kit.allowedSources '["docker.io/","github.com/docker/"]'
```
@z

@x
Then run the command again. For details, including how to allow local kits or
any remote source, see [Restrict kit sources](customize/kits.md#restrict-kit-sources).
@y
Then run the command again. For details, including how to allow local kits or
any remote source, see [Restrict kit sources](customize/kits.md#restrict-kit-sources).
@z

@x
## SSH and other non-HTTP connections fail
@y
## SSH and other non-HTTP connections fail
@z

@x
Non-HTTP TCP connections such as SSH can be allowed by adding a policy rule for
the destination. Hostname rules work for these connections because the sandbox
recovers the hostname from its DNS resolver when the protocol doesn't include
one:
@y
Non-HTTP TCP connections such as SSH can be allowed by adding a policy rule for
the destination. Hostname rules work for these connections because the sandbox
recovers the hostname from its DNS resolver when the protocol doesn't include
one:
@z

@x
```console
$ sbx policy allow network "myhost:22"
```
@y
```console
$ sbx policy allow network "myhost:22"
```
@z

@x
If the destination is reached by IP address without a DNS lookup, the hostname
can't be recovered. Use an address-based rule in that case:
@y
If the destination is reached by IP address without a DNS lookup, the hostname
can't be recovered. Use an address-based rule in that case:
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
UDP and ICMP traffic is blocked at the network layer and can't be unblocked
with policy rules.
@y
UDP and ICMP traffic is blocked at the network layer and can't be unblocked
with policy rules.
@z

@x
For Git operations over SSH, you can either add an allow rule for the Git
server's hostname or IP address, or use HTTPS URLs instead:
@y
For Git operations over SSH, you can either add an allow rule for the Git
server's hostname or IP address, or use HTTPS URLs instead:
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
See [Accessing host services from a sandbox](workflows/development.md#accessing-host-services-from-a-sandbox).
@y
If a request to `127.0.0.1` or a local network IP returns "connection refused"
from inside a sandbox, the address is not reachable from within the sandbox VM.
See [Accessing host services from a sandbox](workflows/development.md#accessing-host-services-from-a-sandbox).
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
For agents that use the [credential proxy](configuration/credentials.md), make sure
you haven't set the API key to an invalid value inside the sandbox — the proxy
injects credentials automatically on outbound requests.
@y
For agents that use the [credential proxy](configuration/credentials.md), make sure
you haven't set the API key to an invalid value inside the sandbox — the proxy
injects credentials automatically on outbound requests.
@z

@x
If credentials are configured correctly but API calls still fail, check
`sbx policy log` and look at the **PROXY** column. Requests routed through
the `transparent` proxy don't get credential injection. This can happen when a
client inside the sandbox (such as a process in a Docker container) isn't
configured to use the forward proxy. See
[Monitoring network activity](governance/monitor-and-enforce/monitoring.md)
for details.
@y
If credentials are configured correctly but API calls still fail, check
`sbx policy log` and look at the **PROXY** column. Requests routed through
the `transparent` proxy don't get credential injection. This can happen when a
client inside the sandbox (such as a process in a Docker container) isn't
configured to use the forward proxy. See
[Monitoring network activity](governance/monitor-and-enforce/monitoring.md)
for details.
@z

@x
## API calls fail with a certificate error
@y
## API calls fail with a certificate error
@z

@x
If your organization uses a proxy that inspects HTTPS traffic, agent requests
can fail with a certificate error such as
`SSL certificate problem: self-signed certificate in certificate chain`. Install
your organization's internal root CA inside the sandbox so the agent and its
SDKs trust certificates signed by the proxy. Certificate errors can stop a
request before the credential proxy can inject credentials.
@y
If your organization uses a proxy that inspects HTTPS traffic, agent requests
can fail with a certificate error such as
`SSL certificate problem: self-signed certificate in certificate chain`. Install
your organization's internal root CA inside the sandbox so the agent and its
SDKs trust certificates signed by the proxy. Certificate errors can stop a
request before the credential proxy can inject credentials.
@z

@x
For repeatable setup, create a [sandbox kit](customize/kits.md) that installs
the CA when the sandbox is created. See
[Install an internal CA certificate](customize/kit-examples.md#install-an-internal-ca-certificate)
for an example kit.
@y
For repeatable setup, create a [sandbox kit](customize/kits.md) that installs
the CA when the sandbox is created. See
[Install an internal CA certificate](customize/kit-examples.md#install-an-internal-ca-certificate)
for an example kit.
@z

@x
Use a PEM-encoded certificate with a `.crt` extension. If traffic can be signed
by more than one internal proxy, install each proxy's root CA before running
`update-ca-certificates`.
@y
Use a PEM-encoded certificate with a `.crt` extension. If traffic can be signed
by more than one internal proxy, install each proxy's root CA before running
`update-ca-certificates`.
@z

@x
Create a sandbox with the kit:
@y
Create a sandbox with the kit:
@z

@x
```console
$ sbx run claude --kit ./internal-ca/
```
@y
```console
$ sbx run claude --kit ./internal-ca/
```
@z

@x
To update an existing sandbox, copy the certificate into the sandbox and update
the trust store:
@y
To update an existing sandbox, copy the certificate into the sandbox and update
the trust store:
@z

@x
```console
$ sbx cp ./internal-ca.crt <sandbox-name>:/tmp/internal-ca.crt
$ sbx exec <sandbox-name> -- sudo install -m 0644 /tmp/internal-ca.crt /usr/local/share/ca-certificates/internal-ca.crt
$ sbx exec <sandbox-name> -- sudo update-ca-certificates
```
@y
```console
$ sbx cp ./internal-ca.crt <sandbox-name>:/tmp/internal-ca.crt
$ sbx exec <sandbox-name> -- sudo install -m 0644 /tmp/internal-ca.crt /usr/local/share/ca-certificates/internal-ca.crt
$ sbx exec <sandbox-name> -- sudo update-ca-certificates
```
@z

@x
> [!IMPORTANT]
> Install the CA into the system trust store with `update-ca-certificates`, as
> shown above. Don't override the sandbox's TLS trust variables (such as
> `SSL_CERT_FILE`) to point at only your internal CA. Doing so replaces the
> system bundle
> and breaks the trust the credential proxy depends on, so requests on the
> `forward` egress path fail.
@y
> [!IMPORTANT]
> Install the CA into the system trust store with `update-ca-certificates`, as
> shown above. Don't override the sandbox's TLS trust variables (such as
> `SSL_CERT_FILE`) to point at only your internal CA. Doing so replaces the
> system bundle
> and breaks the trust the credential proxy depends on, so requests on the
> `forward` egress path fail.
@z

@x
If API calls still fail after installing the CA, run `sbx policy log` and check
the egress path in the **PROXY** column:
@y
If API calls still fail after installing the CA, run `sbx policy log` and check
the egress path in the **PROXY** column:
@z

@x
- `forward`: the credential proxy terminates TLS and presents its own
  certificate, which the sandbox already trusts. Requests on this path don't
  need the internal CA, and overriding the sandbox's trust variables breaks
  them, as described above.
- `forward-bypass` and `transparent`: the proxy forwards packets to the
  upstream proxy without terminating TLS, so the sandbox sees your
  organization's certificate directly. These paths are where installing the
  internal CA applies. The only difference between them is whether the client
  knows it's talking to a proxy.
@y
- `forward`: the credential proxy terminates TLS and presents its own
  certificate, which the sandbox already trusts. Requests on this path don't
  need the internal CA, and overriding the sandbox's trust variables breaks
  them, as described above.
- `forward-bypass` and `transparent`: the proxy forwards packets to the
  upstream proxy without terminating TLS, so the sandbox sees your
  organization's certificate directly. These paths are where installing the
  internal CA applies. The only difference between them is whether the client
  knows it's talking to a proxy.
@z

@x
## Sandbox runs out of disk space
@y
## Sandbox runs out of disk space
@z

@x
The sandbox root (`/`) filesystem defaults to 20 GB. To increase it, set
`DOCKER_SANDBOXES_ROOT_SIZE` before creating the sandbox:
@y
The sandbox root (`/`) filesystem defaults to 20 GB. To increase it, set
`DOCKER_SANDBOXES_ROOT_SIZE` before creating the sandbox:
@z

@x
```console
$ DOCKER_SANDBOXES_ROOT_SIZE=40g sbx run claude
```
@y
```console
$ DOCKER_SANDBOXES_ROOT_SIZE=40g sbx run claude
```
@z

@x
`DOCKER_SANDBOXES_ROOT_SIZE` controls the root filesystem size. The Docker data
disk at `/var/lib/docker` is independent and defaults to 10 GB. To change the
Docker data disk size for a sandbox, set `DOCKER_SANDBOXES_DOCKER_SIZE` when you
create it:
@y
`DOCKER_SANDBOXES_ROOT_SIZE` controls the root filesystem size. The Docker data
disk at `/var/lib/docker` is independent and defaults to 10 GB. To change the
Docker data disk size for a sandbox, set `DOCKER_SANDBOXES_DOCKER_SIZE` when you
create it:
@z

@x
```console
$ DOCKER_SANDBOXES_DOCKER_SIZE=20g sbx run claude
```
@y
```console
$ DOCKER_SANDBOXES_DOCKER_SIZE=20g sbx run claude
```
@z

@x
The Docker data disk must be at least 512 MiB. The environment variable doesn't
resize existing volumes.
@y
The Docker data disk must be at least 512 MiB. The environment variable doesn't
resize existing volumes.
@z

@x
For a [clone-mode sandbox](usage.md#clone-mode), set
`DOCKER_SANDBOXES_CLONED_WORKSPACE_SIZE` before creating the sandbox to
configure the cloned workspace volume capacity. The variable accepts
human-readable size strings such as `100g`:
@y
For a [clone-mode sandbox](usage.md#clone-mode), set
`DOCKER_SANDBOXES_CLONED_WORKSPACE_SIZE` before creating the sandbox to
configure the cloned workspace volume capacity. The variable accepts
human-readable size strings such as `100g`:
@z

@x
```console
$ DOCKER_SANDBOXES_CLONED_WORKSPACE_SIZE=100g sbx run --clone claude .
```
@y
```console
$ DOCKER_SANDBOXES_CLONED_WORKSPACE_SIZE=100g sbx run --clone claude .
```
@z

@x
## Filesystem operations are slow in large repositories
@y
## Filesystem operations are slow in large repositories
@z

@x
Filesystem operations such as `git status`, `git log`, or directory scans can
be noticeably slow when you pass a workspace path and use direct mode.
Virtiofs caching speeds up these workloads. Clone-mode sandboxes always enable
it, so this tuning applies only to direct mode.
@y
Filesystem operations such as `git status`, `git log`, or directory scans can
be noticeably slow when you pass a workspace path and use direct mode.
Virtiofs caching speeds up these workloads. Clone-mode sandboxes always enable
it, so this tuning applies only to direct mode.
@z

@x
Virtiofs caching is enabled by default on all operating systems. If you
experience Git index corruption or unexpected file content, disable caching
with the kill switch and recreate the sandbox:
@y
Virtiofs caching is enabled by default on all operating systems. If you
experience Git index corruption or unexpected file content, disable caching
with the kill switch and recreate the sandbox:
@z

@x
```console
$ DOCKER_SANDBOXES_ENABLE_VIRTIOFS_CACHE=0 sbx run <agent>
```
@y
```console
$ DOCKER_SANDBOXES_ENABLE_VIRTIOFS_CACHE=0 sbx run <agent>
```
@z

@x
## Clone mode reports "not in a Git repository" on WSL
@y
## Clone mode reports "not in a Git repository" on WSL
@z

@x
On Windows, running [`sbx run --clone`](usage.md#clone-mode) against a
repository on a WSL filesystem (a `\\wsl.localhost\...` path) can fail even
though the directory is a valid Git repository:
@y
On Windows, running [`sbx run --clone`](usage.md#clone-mode) against a
repository on a WSL filesystem (a `\\wsl.localhost\...` path) can fail even
though the directory is a valid Git repository:
@z

@x
```console
> sbx run --clone claude \\wsl.localhost\Ubuntu\home\you\repo
ERROR: --clone requires a Git repository, but \\wsl.localhost\Ubuntu\home\you\repo is not in a Git repository
```
@y
```console
> sbx run --clone claude \\wsl.localhost\Ubuntu\home\you\repo
ERROR: --clone requires a Git repository, but \\wsl.localhost\Ubuntu\home\you\repo is not in a Git repository
```
@z

@x
The cause is Git's dubious ownership check. When Git on Windows accesses a
repository owned by a different user across the WSL boundary, it refuses to
operate on it, so the underlying repository detection fails:
@y
The cause is Git's dubious ownership check. When Git on Windows accesses a
repository owned by a different user across the WSL boundary, it refuses to
operate on it, so the underlying repository detection fails:
@z

@x
```console
> git -C \\wsl.localhost\Ubuntu\home\you\repo rev-parse --show-toplevel
fatal: detected dubious ownership in repository at '//wsl.localhost/Ubuntu/home/you/repo'
```
@y
```console
> git -C \\wsl.localhost\Ubuntu\home\you\repo rev-parse --show-toplevel
fatal: detected dubious ownership in repository at '//wsl.localhost/Ubuntu/home/you/repo'
```
@z

@x
Add the repository to Git's `safe.directory` list to allow access, then run
the command again:
@y
Add the repository to Git's `safe.directory` list to allow access, then run
the command again:
@z

@x
```console
> git config --global --add safe.directory '%(prefix)///wsl.localhost/Ubuntu/home/you/repo'
> sbx run --clone claude \\wsl.localhost\Ubuntu\home\you\repo
✓ Git repository detected: \\wsl.localhost\Ubuntu\home\you\repo
```
@y
```console
> git config --global --add safe.directory '%(prefix)///wsl.localhost/Ubuntu/home/you/repo'
> sbx run --clone claude \\wsl.localhost\Ubuntu\home\you\repo
✓ Git repository detected: \\wsl.localhost\Ubuntu\home\you\repo
```
@z

@x
## Sandbox commits aren't signed
@y
## Sandbox commits aren't signed
@z

@x
Docker Sandboxes can sign Git commits with SSH keys from your host agent.
For setup steps, see [Commit signing](workflows/git.md#commit-signing).
@y
Docker Sandboxes can sign Git commits with SSH keys from your host agent.
For setup steps, see [Commit signing](workflows/git.md#commit-signing).
@z

@x
Forwarding is enabled by default. Check
[`ssh.agentForwardingEnabled`](configuration/settings.md#sshagentforwardingenabled)
and [`ssh.agentSocketPath`](configuration/settings.md#sshagentsocketpath) to
confirm that forwarding is enabled and inspect the socket selection:
@y
Forwarding is enabled by default. Check
[`ssh.agentForwardingEnabled`](configuration/settings.md#sshagentforwardingenabled)
and [`ssh.agentSocketPath`](configuration/settings.md#sshagentsocketpath) to
confirm that forwarding is enabled and inspect the socket selection:
@z

@x
```console
$ sbx settings get ssh.agentForwardingEnabled
$ sbx settings get ssh.agentSocketPath
```
@y
```console
$ sbx settings get ssh.agentForwardingEnabled
$ sbx settings get ssh.agentSocketPath
```
@z

@x
If you use each client's current `SSH_AUTH_SOCK`, reconnect from a shell where
it points to the intended agent. If `ssh.agentSocketPath` returns a path,
confirm that it points to an active host agent. After changing forwarding or
the socket selection, run `sbx daemon restart`.
@y
If you use each client's current `SSH_AUTH_SOCK`, reconnect from a shell where
it points to the intended agent. If `ssh.agentSocketPath` returns a path,
confirm that it points to an active host agent. After changing forwarding or
the socket selection, run `sbx daemon restart`.
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
## Daemon fails to start after downgrading
@y
## Daemon fails to start after downgrading
@z

@x
If you downgrade `sbx` to a version older than the one that last managed your
local state, the daemon may fail to start with a database version mismatch:
@y
If you downgrade `sbx` to a version older than the one that last managed your
local state, the daemon may fail to start with a database version mismatch:
@z

@x
```text
ERROR: failed to start backend in-process: start backend: creating containerd
server: ... database is at major version 6, but this binary only supports up
to major version 1
```
@y
```text
ERROR: failed to start backend in-process: start backend: creating containerd
server: ... database is at major version 6, but this binary only supports up
to major version 1
```
@z

@x
A newer version of `sbx` upgraded the local database to a schema that older
binaries don't understand. To recover, reset all sandbox state:
@y
A newer version of `sbx` upgraded the local database to a schema that older
binaries don't understand. To recover, reset all sandbox state:
@z

@x
```console
$ sbx reset --preserve-secrets
```
@y
```console
$ sbx reset --preserve-secrets
```
@z

@x
This stops all VMs and deletes all sandbox data. You'll need to create new
sandboxes afterwards. The `--preserve-secrets` flag keeps any secrets you've
set so you don't have to reconfigure them.
@y
This stops all VMs and deletes all sandbox data. You'll need to create new
sandboxes afterwards. The `--preserve-secrets` flag keeps any secrets you've
set so you don't have to reconfigure them.
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
## Enable automatic diagnostics uploads
@y
## Enable automatic diagnostics uploads
@z

@x
To opt in to automatic diagnostics uploads after certain daemon errors, set
[`diagnostics.autoUpload`](configuration/settings.md#diagnosticsautoupload) to
`yes`:
@y
To opt in to automatic diagnostics uploads after certain daemon errors, set
[`diagnostics.autoUpload`](configuration/settings.md#diagnosticsautoupload) to
`yes`:
@z

@x
```console
$ sbx settings set diagnostics.autoUpload yes
```
@y
```console
$ sbx settings set diagnostics.autoUpload yes
```
@z

@x
Automatic bundles include basic system information and client, daemon, crash,
and MCP logs. Docker Sandboxes redacts recognized identity values and
credential patterns, but collected logs can still contain user content. Failed
uploads remain in a local queue for a later retry.
@y
Automatic bundles include basic system information and client, daemon, crash,
and MCP logs. Docker Sandboxes redacts recognized identity values and
credential patterns, but collected logs can still contain user content. Failed
uploads remain in a local queue for a later retry.
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
