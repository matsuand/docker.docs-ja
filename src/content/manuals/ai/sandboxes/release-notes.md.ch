%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Docker Sandboxes release notes
linkTitle: Release notes
description: New features, bug fixes, and changes in Docker Sandboxes
keywords: docker sandboxes, sbx, release notes, changelog
@y
title: Docker Sandboxes release notes
linkTitle: Release notes
description: New features, bug fixes, and changes in Docker Sandboxes
keywords: docker sandboxes, sbx, release notes, changelog
@z

@x
This page lists changes in recent stable releases of Docker Sandboxes. For
the full release history, including pre-releases and downloads, see the
[Docker Sandboxes releases on GitHub](https://github.com/docker/sbx-releases/releases).
@y
This page lists changes in recent stable releases of Docker Sandboxes. For
the full release history, including pre-releases and downloads, see the
[Docker Sandboxes releases on GitHub](https://github.com/docker/sbx-releases/releases).
@z

@x
<!-- BEGIN GENERATED RELEASES -->
@y
<!-- BEGIN GENERATED RELEASES -->
@z

@x
## 0.51.0
@y
## 0.51.0
@z

@x
{{< release-date date="2026-11-03" >}}
@y
{{< release-date date="2026-11-03" >}}
@z

@x
[GitHub release](https://github.com/docker/sbx-releases/releases/tag/v0.51.0)
@y
[GitHub release](https://github.com/docker/sbx-releases/releases/tag/v0.51.0)
@z

@x
### Highlights
@y
### Highlights
@z

@x
Docker Sandboxes v0.51.0 runs built-in agents from published kits and adds custom mount targets for additional workspaces, environment launch command defaults, and more controls for automation. It also strengthens workspace-copy and credential protections and improves network, MCP, and sandbox startup reliability.
@y
Docker Sandboxes v0.51.0 runs built-in agents from published kits and adds custom mount targets for additional workspaces, environment launch command defaults, and more controls for automation. It also strengthens workspace-copy and credential protections and improves network, MCP, and sandbox startup reliability.
@z

@x
### Breaking changes
@y
### Breaking changes
@z

@x
#### Built-in agents and shell images
@y
#### Built-in agents and shell images
@z

@x
Built-in agent names now resolve to published kits at `docker.io/sbx/<name>:latest`. This applies to Claude, Codex, Cursor, Devin, Docker Agent, OpenCode, Kiro, Copilot, and Droid. `sbx run sbx/<kit>` also accepts published kits, including kits named after built-in agents. The `kit.allowExtractedAgents` setting is removed.
@y
Built-in agent names now resolve to published kits at `docker.io/sbx/<name>:latest`. This applies to Claude, Codex, Cursor, Devin, Docker Agent, OpenCode, Kiro, Copilot, and Droid. `sbx run sbx/<kit>` also accepts published kits, including kits named after built-in agents. The `kit.allowExtractedAgents` setting is removed.
@z

@x
- Sandboxes created by earlier releases from embedded Claude or Codex specifications keep running, but must be recreated before using `sbx kit add`, `sbx run --model`, or `sbx move`. Save files and unpushed commits before removing a sandbox.
- The shell agent now uses a published Debian 13 v3 kit. First use requires registry access. To provide shell sandboxes with provider credentials, add the `shell-credentials` mixin. Existing shell sandboxes keep running.
- V1 and v2 kits cannot be combined with v3 kits. Upgrade older mixins to v3 before combining them with the new built-in kits.
- The `docker/sandbox-templates` images for `codex`, `cursor-agent`, `devin`, `docker-agent`, and `opencode`, including their `-docker` variants, are no longer published.
- The `docker/sandbox-templates:shell` and `:shell-docker` images are no longer refreshed. For custom workloads, use `docker.io/sbx/shell-image` and `docker.io/sbx/shell-docker-image`.
@y
- Sandboxes created by earlier releases from embedded Claude or Codex specifications keep running, but must be recreated before using `sbx kit add`, `sbx run --model`, or `sbx move`. Save files and unpushed commits before removing a sandbox.
- The shell agent now uses a published Debian 13 v3 kit. First use requires registry access. To provide shell sandboxes with provider credentials, add the `shell-credentials` mixin. Existing shell sandboxes keep running.
- V1 and v2 kits cannot be combined with v3 kits. Upgrade older mixins to v3 before combining them with the new built-in kits.
- The `docker/sandbox-templates` images for `codex`, `cursor-agent`, `devin`, `docker-agent`, and `opencode`, including their `-docker` variants, are no longer published.
- The `docker/sandbox-templates:shell` and `:shell-docker` images are no longer refreshed. For custom workloads, use `docker.io/sbx/shell-image` and `docker.io/sbx/shell-docker-image`.
@z

@x
#### Clipboard access and custom secrets
@y
#### Clipboard access and custom secrets
@z

@x
- Copying text from a local sandbox to the host clipboard now requires opting in with the `clipboard.textCopy` setting. Native clients such as Codex are supported.
- Custom secrets without destination hosts no longer substitute credentials. Repair existing mappings by adding explicit destination hosts while preserving their placeholders and other settings.
@y
- Copying text from a local sandbox to the host clipboard now requires opting in with the `clipboard.textCopy` setting. Native clients such as Codex are supported.
- Custom secrets without destination hosts no longer substitute credentials. Repair existing mappings by adding explicit destination hosts while preserving their placeholders and other settings.
@z

@x
### What's new
@y
### What's new
@z

@x
#### Security
@y
#### Security
@z

@x
- `sbx cp` blocks symbolic links in mounted directories from escaping onto other host paths. On Windows, it also blocks workspace escapes through substituted drives.
- Unix clients verify that daemon sockets belong to the same account before sending requests.
- `sbx kit sign` no longer runs configured Git filter drivers while checking signed file contents. Its recovery guidance preserves committed bytes even when repository attributes request line-ending conversion.
- Files replaced by Sandboxes on Windows retain their existing access control lists.
- Network policy commands reject empty `--sandbox` values instead of applying changes globally.
@y
- `sbx cp` blocks symbolic links in mounted directories from escaping onto other host paths. On Windows, it also blocks workspace escapes through substituted drives.
- Unix clients verify that daemon sockets belong to the same account before sending requests.
- `sbx kit sign` no longer runs configured Git filter drivers while checking signed file contents. Its recovery guidance preserves committed bytes even when repository attributes request line-ending conversion.
- Files replaced by Sandboxes on Windows retain their existing access control lists.
- Network policy commands reject empty `--sandbox` values instead of applying changes globally.
@z

@x
#### Kits and agents
@y
#### Kits and agents
@z

@x
- `sbx kit add` installs added image content in all-v3 sandboxes while preserving filesystem changes. `sbx run --model` generates a v3 model kit when the base uses v3.
- `sbx kit inspect --resolved` shows the kit with its `extends` parent merged in.
- Kit installation logs are saved inside the sandbox at `/var/log/sbx-kits/<kit>/install-<n>.log`. Progress shows command descriptions, and debug mode streams successful installation output and the startup log. Failed startup commands produce a warning with the log tail instead of failing `sbx run`.
- Kits can request publication of a host-loopback port when granted the required permission. Each request requires user approval and expires after 45 seconds.
- Kits declaring `agent-context@2` guidance work with local and cloud sandboxes, including when they also offer `agent-context@1`.
- Optional kit credentials no longer prevent creation when absent. Kit changes after a daemon restart preserve stored Bedrock profiles, and recovery after a failed kit change preserves access to shared skills.
- Shell kits support custom templates, and v3 kits load correctly when their descriptor is named `spec.yaml`.
- Docker Hardened Images (DHI) kits are accepted by the default kit source allow list.
- GitHub Copilot authentication works when the GitHub secret is stored with `--command` or as a reference.
@y
- `sbx kit add` installs added image content in all-v3 sandboxes while preserving filesystem changes. `sbx run --model` generates a v3 model kit when the base uses v3.
- `sbx kit inspect --resolved` shows the kit with its `extends` parent merged in.
- Kit installation logs are saved inside the sandbox at `/var/log/sbx-kits/<kit>/install-<n>.log`. Progress shows command descriptions, and debug mode streams successful installation output and the startup log. Failed startup commands produce a warning with the log tail instead of failing `sbx run`.
- Kits can request publication of a host-loopback port when granted the required permission. Each request requires user approval and expires after 45 seconds.
- Kits declaring `agent-context@2` guidance work with local and cloud sandboxes, including when they also offer `agent-context@1`.
- Optional kit credentials no longer prevent creation when absent. Kit changes after a daemon restart preserve stored Bedrock profiles, and recovery after a failed kit change preserves access to shared skills.
- Shell kits support custom templates, and v3 kits load correctly when their descriptor is named `spec.yaml`.
- Docker Hardened Images (DHI) kits are accepted by the default kit source allow list.
- GitHub Copilot authentication works when the GitHub secret is stored with `--command` or as a reference.
@z

@x
#### Sandbox lifecycle and workspaces
@y
#### Sandbox lifecycle and workspaces
@z

@x
- Additional workspaces accept `PATH:TARGET[:ro]` with `sbx create` and `sbx run`. Environment files support the same custom targets through `additionalWorkspaces[].target`.
- `sbx run --workdir` starts the agent in a directory inside the workspace, including when reattaching to an existing sandbox.
- Environment files support `entrypoint` and `cmd` defaults for `sbx env run`. Command-line arguments can replace the default command. `sandboxOptions` also accepts `rootSize`, `dockerSize`, and `clonedWorkspaceSize`.
- Interactive `sbx env exec` offers to create a missing environment sandbox. Interactive `sbx env run` can adopt a matching existing sandbox when its environment records have been lost, after confirmation.
- New local sandboxes support FUSE filesystems, controlled through `sandbox.fuse` and the environment option `sandboxOptions.fuse`.
- Sandbox memory limits can be set up to the host's total memory, with a warning above 75%.
- Workspace, clone, kit-volume, and mount targets that would hide the shared skills store are rejected before creation or modification. Startup also explains how to recover when a file occupies the shared skills directory.
- `sbx inspect` shows the Sandboxes version that created a sandbox, for sandboxes created with this release onward. `sbx ls`, `sbx inspect`, and `sbx prune --dry-run` JSON include configured host bind mounts, including workspace, kit, and skills mounts. List and prune output also indicate missing mount sources. Existing workspace fields remain available.
- `sbx ls` reports unreadable sandbox state instead of silently omitting the sandbox. Clone failures include Git's underlying reason, such as dubious ownership.
- Resizing an interactive terminal during startup or shutdown no longer produces spurious errors. On Windows, Ctrl+Z no longer ends input forwarding, and automatically started daemons are less likely to stop when the launching command exits.
@y
- Additional workspaces accept `PATH:TARGET[:ro]` with `sbx create` and `sbx run`. Environment files support the same custom targets through `additionalWorkspaces[].target`.
- `sbx run --workdir` starts the agent in a directory inside the workspace, including when reattaching to an existing sandbox.
- Environment files support `entrypoint` and `cmd` defaults for `sbx env run`. Command-line arguments can replace the default command. `sandboxOptions` also accepts `rootSize`, `dockerSize`, and `clonedWorkspaceSize`.
- Interactive `sbx env exec` offers to create a missing environment sandbox. Interactive `sbx env run` can adopt a matching existing sandbox when its environment records have been lost, after confirmation.
- New local sandboxes support FUSE filesystems, controlled through `sandbox.fuse` and the environment option `sandboxOptions.fuse`.
- Sandbox memory limits can be set up to the host's total memory, with a warning above 75%.
- Workspace, clone, kit-volume, and mount targets that would hide the shared skills store are rejected before creation or modification. Startup also explains how to recover when a file occupies the shared skills directory.
- `sbx inspect` shows the Sandboxes version that created a sandbox, for sandboxes created with this release onward. `sbx ls`, `sbx inspect`, and `sbx prune --dry-run` JSON include configured host bind mounts, including workspace, kit, and skills mounts. List and prune output also indicate missing mount sources. Existing workspace fields remain available.
- `sbx ls` reports unreadable sandbox state instead of silently omitting the sandbox. Clone failures include Git's underlying reason, such as dubious ownership.
- Resizing an interactive terminal during startup or shutdown no longer produces spurious errors. On Windows, Ctrl+Z no longer ends input forwarding, and automatically started daemons are less likely to stop when the launching command exits.
@z

@x
#### Networking and policy
@y
#### Networking and policy
@z

@x
- Linux hosts using split-horizon DNS, including VPN configurations with corporate nameservers, can reach internal HTTPS hosts through the sandbox proxy and retrieve proxy auto-configuration files from them.
- The proxy reuses upstream connections when injecting credentials, improving parallel downloads such as package installations.
- Bursts of outbound connections no longer crash the daemon when the host network stalls.
- Failed upstream connections for inspected HTTPS requests return a 502 response identifying the host and reason instead of an empty reply.
- `sbx policy check http` checks HTTP governance policy behavior.
- Policy listings keep the implicit default-deny fallback visible and distinguish it from explicit deny rules. Policy setup correctly identifies the local preset, and Gordon preserves HTTP rule restrictions.
- The policy TUI shows setup guidance after a reset, warns about stale rules, and resumes updates after setup. Storage failures report a server error instead of incorrectly requesting policy initialization.
- `sbx reset` reports how many user-added and approval-granted network rules it will remove, including with `--force`, and points to `sbx policy init` afterward.
- `sbx ports` accepts `-p` for `--publish` and identifies the destination sandbox port when a host port is already published.
@y
- Linux hosts using split-horizon DNS, including VPN configurations with corporate nameservers, can reach internal HTTPS hosts through the sandbox proxy and retrieve proxy auto-configuration files from them.
- The proxy reuses upstream connections when injecting credentials, improving parallel downloads such as package installations.
- Bursts of outbound connections no longer crash the daemon when the host network stalls.
- Failed upstream connections for inspected HTTPS requests return a 502 response identifying the host and reason instead of an empty reply.
- `sbx policy check http` checks HTTP governance policy behavior.
- Policy listings keep the implicit default-deny fallback visible and distinguish it from explicit deny rules. Policy setup correctly identifies the local preset, and Gordon preserves HTTP rule restrictions.
- The policy TUI shows setup guidance after a reset, warns about stale rules, and resumes updates after setup. Storage failures report a server error instead of incorrectly requesting policy initialization.
- `sbx reset` reports how many user-added and approval-granted network rules it will remove, including with `--force`, and points to `sbx policy init` afterward.
- `sbx ports` accepts `-p` for `--publish` and identifies the destination sandbox port when a host port is already published.
@z

@x
#### Authentication, MCP, and models
@y
#### Authentication, MCP, and models
@z

@x
- `sbx secret set-custom --value-stdin` reads a secret from standard input, avoiding secret values in command arguments.
- Daemon image pulls use the `sbx login` session and stored registry credentials. Published agent kits can be fetched through authenticated registry mirrors.
- Enable `mcp.useServerNamePrefixes` to prefix MCP tool names with their server name.
- `sbx create` and `sbx run` accept `--static-mcp none` to use static MCP mode without attaching servers.
- Approval-gated MCP calls proceed after approval, including with newer MCP clients. Server tools ending in `-authorize` or `-revoke-auth` are available again.
- MCP servers have more time to initialize, reducing startup timeouts. Code-mode sessions cancel in-flight tool calls on exit and handle parallel requests more reliably.
- `sbx mcp auth` and `sbx mcp add` suggest `--client-id` when a server refuses dynamic client registration.
- Set `model.server.enabled` to `false`, then run `sbx daemon restart`, to disable the bundled model server and its inference-runtime download.
@y
- `sbx secret set-custom --value-stdin` reads a secret from standard input, avoiding secret values in command arguments.
- Daemon image pulls use the `sbx login` session and stored registry credentials. Published agent kits can be fetched through authenticated registry mirrors.
- Enable `mcp.useServerNamePrefixes` to prefix MCP tool names with their server name.
- `sbx create` and `sbx run` accept `--static-mcp none` to use static MCP mode without attaching servers.
- Approval-gated MCP calls proceed after approval, including with newer MCP clients. Server tools ending in `-authorize` or `-revoke-auth` are available again.
- MCP servers have more time to initialize, reducing startup timeouts. Code-mode sessions cancel in-flight tool calls on exit and handle parallel requests more reliably.
- `sbx mcp auth` and `sbx mcp add` suggest `--client-id` when a server refuses dynamic client registration.
- Set `model.server.enabled` to `false`, then run `sbx daemon restart`, to disable the bundled model server and its inference-runtime download.
@z

@x
#### Cloud sandboxes
@y
#### Cloud sandboxes
@z

@x
- Kit updates no longer fail with “Template has N running sandboxes” while sandboxes using an earlier version are running.
- Building source kits uses less temporary disk space during upload.
- Volume names tolerate surrounding whitespace and reject whitespace-only values. Cloud launches reject local-only model overflow flags instead of silently ignoring them.
- Port listings include the reported protocol in JSON and YAML output. `sbx move --ttl` accepts case-insensitive duration units.
- Help and shell completion identify supported cloud options and explain file-transfer limitations for symbolic links and empty directories.
@y
- Kit updates no longer fail with “Template has N running sandboxes” while sandboxes using an earlier version are running.
- Building source kits uses less temporary disk space during upload.
- Volume names tolerate surrounding whitespace and reject whitespace-only values. Cloud launches reject local-only model overflow flags instead of silently ignoring them.
- Port listings include the reported protocol in JSON and YAML output. `sbx move --ttl` accepts case-insensitive duration units.
- Help and shell completion identify supported cloud options and explain file-transfer limitations for symbolic links and empty directories.
@z

@x
#### CLI, settings, and diagnostics
@y
#### CLI, settings, and diagnostics
@z

@x
- `--no-input` prevents interactive prompts, including Docker sign-in, and reports the command needed to continue.
- `sbx run --no-progress` suppresses creation progress while retaining command results. `sbx create --no-progress` still prompts for cloud network-policy confirmation when needed.
- `sbx --version` prints the client version without starting the daemon. Canceled sandbox and environment creation exits with status 130 and a clear message.
- Persistently disable local CLI and daemon telemetry with `sbx settings set telemetry.disabled true`. The next CLI invocation uses the preference; run `sbx daemon restart` to apply it to a running daemon.
- Compatibility errors and stale engine tasks identify `sbx daemon restart` as the recovery command. Daemon startup failures show only the current attempt's error output, preserving line breaks.
- Windows SSH configuration works with both native OpenSSH and Git Bash OpenSSH. `sbx diagnose` detects missing Windows shell support for Claude Desktop SSH connections and warns when the state directory uses eCryptfs, which can cause image-pull I/O errors.
- Command help and empty-list hints provide clearer next steps for secrets, MCP servers, skills, cloud sandboxes, and template recovery.
@y
- `--no-input` prevents interactive prompts, including Docker sign-in, and reports the command needed to continue.
- `sbx run --no-progress` suppresses creation progress while retaining command results. `sbx create --no-progress` still prompts for cloud network-policy confirmation when needed.
- `sbx --version` prints the client version without starting the daemon. Canceled sandbox and environment creation exits with status 130 and a clear message.
- Persistently disable local CLI and daemon telemetry with `sbx settings set telemetry.disabled true`. The next CLI invocation uses the preference; run `sbx daemon restart` to apply it to a running daemon.
- Compatibility errors and stale engine tasks identify `sbx daemon restart` as the recovery command. Daemon startup failures show only the current attempt's error output, preserving line breaks.
- Windows SSH configuration works with both native OpenSSH and Git Bash OpenSSH. `sbx diagnose` detects missing Windows shell support for Claude Desktop SSH connections and warns when the state directory uses eCryptfs, which can cause image-pull I/O errors.
- Command help and empty-list hints provide clearer next steps for secrets, MCP servers, skills, cloud sandboxes, and template recovery.
@z

@x
## 0.50.1
@y
## 0.50.1
@z

@x
{{< release-date date="2026-10-28" >}}
@y
{{< release-date date="2026-10-28" >}}
@z

@x
[GitHub release](https://github.com/docker/sbx-releases/releases/tag/v0.50.1)
@y
[GitHub release](https://github.com/docker/sbx-releases/releases/tag/v0.50.1)
@z

@x
- fixes an issue that prevented sandboxes from starting
@y
- fixes an issue that prevented sandboxes from starting
@z

@x
## 0.50.0
@y
## 0.50.0
@z

@x
{{< release-date date="2026-10-26" >}}
@y
{{< release-date date="2026-10-26" >}}
@z

@x
[GitHub release](https://github.com/docker/sbx-releases/releases/tag/v0.50.0)
@y
[GitHub release](https://github.com/docker/sbx-releases/releases/tag/v0.50.0)
@z

@x
### Highlights
@y
### Highlights
@z

@x
Docker Sandboxes v0.50.0 adds configurable kit host mounts, preserves persistent kit volumes across updates and sandbox recreation, and adds cloud sandbox inspection. It also strengthens host-execution, credential, and workspace-copy protections.
@y
Docker Sandboxes v0.50.0 adds configurable kit host mounts, preserves persistent kit volumes across updates and sandbox recreation, and adds cloud sandbox inspection. It also strengthens host-execution, credential, and workspace-copy protections.
@z

@x
### What's new
@y
### What's new
@z

@x
#### Security
@y
#### Security
@z

@x
- `sbx cp` rejects symbolic links that escape a sandbox workspace when the workspace is reached through an alternate host path, including a symlink or junction, macOS `/private/tmp`, or a Linux bind mount of a workspace subdirectory.
- Host Git commands no longer run programs configured by a sandbox through the workspace repository's `.git` directory.
- Browser, clipboard, and self-update helpers run only from trusted system locations, preventing sandbox-writable directories on `PATH` from supplying those programs.
- Local source kits are reused and composed only when their digests match recorded local builds. Each local source kit rebuilds once after upgrading.
- Git kit references reject ambiguous paths, non-ASCII hostnames, and SSH transport syntax. Use IDNA ASCII labels for internationalized hostnames. HTTPS source restrictions are checked against the parsed URL host.
- MCP OAuth requests block cross-origin credential redirects. Rejected silent refreshes preserve saved credentials without opening a browser.
- Browser-open logs omit URL query strings and fragments, keeping OAuth parameters and tokens in those components out of daemon logs and diagnostic bundles.
- Windows clients verify that the daemon's named pipes belong to the same Windows user. Before using the updated CLI, older elevated daemons may need to be stopped with the previous CLI or Task Manager.
- Environment MCP commands require approval to execute on the host, remain scoped to their sandbox, and are disabled by `--skip-host-commands`. Approval notices explain that executable paths are pinned, but file contents are not. Keep executables and scripts outside writable sandbox mounts.
- Gordon clears **Approve all** and **Always allow** grants when a conversation resumes, requiring approval before running tools again.
@y
- `sbx cp` rejects symbolic links that escape a sandbox workspace when the workspace is reached through an alternate host path, including a symlink or junction, macOS `/private/tmp`, or a Linux bind mount of a workspace subdirectory.
- Host Git commands no longer run programs configured by a sandbox through the workspace repository's `.git` directory.
- Browser, clipboard, and self-update helpers run only from trusted system locations, preventing sandbox-writable directories on `PATH` from supplying those programs.
- Local source kits are reused and composed only when their digests match recorded local builds. Each local source kit rebuilds once after upgrading.
- Git kit references reject ambiguous paths, non-ASCII hostnames, and SSH transport syntax. Use IDNA ASCII labels for internationalized hostnames. HTTPS source restrictions are checked against the parsed URL host.
- MCP OAuth requests block cross-origin credential redirects. Rejected silent refreshes preserve saved credentials without opening a browser.
- Browser-open logs omit URL query strings and fragments, keeping OAuth parameters and tokens in those components out of daemon logs and diagnostic bundles.
- Windows clients verify that the daemon's named pipes belong to the same Windows user. Before using the updated CLI, older elevated daemons may need to be stopped with the previous CLI or Task Manager.
- Environment MCP commands require approval to execute on the host, remain scoped to their sandbox, and are disabled by `--skip-host-commands`. Approval notices explain that executable paths are pinned, but file contents are not. Keep executables and scripts outside writable sandbox mounts.
- Gordon clears **Approve all** and **Always allow** grants when a conversation resumes, requiring approval before running tools again.
@z

@x
#### Kits
@y
#### Kits
@z

@x
- When creating a sandbox, use `--mount HOST:SANDBOX_PATH` with `sbx create` or `sbx run` to select a host directory for a kit-declared host mount. The sandbox target must exactly match the `path` of a `host-mount@1` capability declared by a kit in the resolved kit set. Environment files support the same bindings through `mounts`, mapping sandbox target paths to host directories. These options cannot add undeclared mount targets.
- Persistent kit volumes retain data across kit updates and sandbox removal and recreation with the same name. This applies to sandboxes created with this version; existing sandbox records retain their previous storage behavior.
- Creating a sandbox from a v3 kit set without a workload kit reports a clear explanation instead of "the kit set is not coherent."
@y
- When creating a sandbox, use `--mount HOST:SANDBOX_PATH` with `sbx create` or `sbx run` to select a host directory for a kit-declared host mount. The sandbox target must exactly match the `path` of a `host-mount@1` capability declared by a kit in the resolved kit set. Environment files support the same bindings through `mounts`, mapping sandbox target paths to host directories. These options cannot add undeclared mount targets.
- Persistent kit volumes retain data across kit updates and sandbox removal and recreation with the same name. This applies to sandboxes created with this version; existing sandbox records retain their previous storage behavior.
- Creating a sandbox from a v3 kit set without a workload kit reports a clear explanation instead of "the kit set is not coherent."
@z

@x
#### Sandbox lifecycle and workspaces
@y
#### Sandbox lifecycle and workspaces
@z

@x
- Host Git identity is copied into sandboxes for repositories that use the reftable ref format.
- Sandboxes created with `--clone` preserve kit-provided workspace files and report clone initialization failures.
- Canceling clone remote configuration preserves the cancellation error even if stopping Git also fails.
@y
- Host Git identity is copied into sandboxes for repositories that use the reftable ref format.
- Sandboxes created with `--clone` preserve kit-provided workspace files and report clone initialization failures.
- Canceling clone remote configuration preserves the cancellation error even if stopping Git also fails.
@z

@x
#### Authentication and agents
@y
#### Authentication and agents
@z

@x
- Kiro IDE AWS IAM Identity Center sign-in callbacks reach the sandbox even when the callback port hasn't been published.
- Claude sandboxes using subscription OAuth are provisioned without the API-key helper.
@y
- Kiro IDE AWS IAM Identity Center sign-in callbacks reach the sandbox even when the callback port hasn't been published.
- Claude sandboxes using subscription OAuth are provisioned without the API-key helper.
@z

@x
#### Networking and policy
@y
#### Networking and policy
@z

@x
- HTTP network rules support query-parameter restrictions. Repeat `--query name=value` to require multiple parameters.
@y
- HTTP network rules support query-parameter restrictions. Repeat `--query name=value` to require multiple parameters.
@z

@x
#### Cloud sandboxes
@y
#### Cloud sandboxes
@z

@x
- `sbx --cloud inspect <id|name>` shows details for a single cloud sandbox, including published port URLs. Use `--format json` or `--format yaml` for scripting.
- Running `sbx --cloud run --name <name>` without an agent suggests the correct form: `sbx --cloud run <agent> --name <name>`.
@y
- `sbx --cloud inspect <id|name>` shows details for a single cloud sandbox, including published port URLs. Use `--format json` or `--format yaml` for scripting.
- Running `sbx --cloud run --name <name>` without an agent suggests the correct form: `sbx --cloud run <agent> --name <name>`.
@z

@x
#### CLI and diagnostics
@y
#### CLI and diagnostics
@z

@x
- `sbx exec` returns exit status 125 when it cannot run the command, such as when the sandbox doesn't exist.
- On macOS and Windows, `sbx diagnose` and daemon logs warn when `SSL_CERT_FILE` or `SSL_CERT_DIR` replaces the system trust store and can cause HTTPS certificate verification failures.
@y
- `sbx exec` returns exit status 125 when it cannot run the command, such as when the sandbox doesn't exist.
- On macOS and Windows, `sbx diagnose` and daemon logs warn when `SSL_CERT_FILE` or `SSL_CERT_DIR` replaces the system trust store and can cause HTTPS certificate verification failures.
@z

@x
#### Experimental Runtime backend
@y
#### Experimental Runtime backend
@z

@x
- Workloads have network access.
- Startup stops waiting and cleans up when a workload exits or fails before becoming ready.
@y
- Workloads have network access.
- Startup stops waiting and cleans up when a workload exits or fails before becoming ready.
@z

@x
## 0.49.2
@y
## 0.49.2
@z

@x
{{< release-date date="2026-10-21" >}}
@y
{{< release-date date="2026-10-21" >}}
@z

@x
[GitHub release](https://github.com/docker/sbx-releases/releases/tag/v0.49.2)
@y
[GitHub release](https://github.com/docker/sbx-releases/releases/tag/v0.49.2)
@z

@x
### Highlights
@y
### Highlights
@z

@x
Docker Sandboxes 0.49.2 updates Go and bundled dependencies as part of Docker’s response to the [eMudhra certificate authority compromise](https://docs.docker.com/security/security-announcements/#docker-sandboxes-response-to-emudhra-ca-compromise).
@y
Docker Sandboxes 0.49.2 updates Go and bundled dependencies as part of Docker’s response to the [eMudhra certificate authority compromise](https://docs.docker.com/security/security-announcements/#docker-sandboxes-response-to-emudhra-ca-compromise).
@z

@x
### Security updates
@y
### Security updates
@z

@x
- Updated Go to 1.27.3.
- Updated bundled llmman to 0.1.571.
@y
- Updated Go to 1.27.3.
- Updated bundled llmman to 0.1.571.
@z

@x
### Recommended actions
@y
### Recommended actions
@z

@x
Updating the `sbx` CLI alone does not update existing sandboxes. Docker has also rebuilt the built-in template images with updated CA certificates.
@y
Updating the `sbx` CLI alone does not update existing sandboxes. Docker has also rebuilt the built-in template images with updated CA certificates.
@z

@x
Follow one of the documented mitigation paths:
@y
Follow one of the documented mitigation paths:
@z

@x
- [Recreate sandboxes with refreshed images](https://docs.docker.com/security/security-announcements/#recreate-sandboxes-with-updated-images), using `--pull always`. Save any files and unpushed commits before removing a sandbox.
- [Update CA certificates in existing sandboxes](https://docs.docker.com/security/security-announcements/#update-ca-certificates-in-existing-sandboxes), then restart applications. Tools that bundle their own CA certificates may require separate updates.
@y
- [Recreate sandboxes with refreshed images](https://docs.docker.com/security/security-announcements/#recreate-sandboxes-with-updated-images), using `--pull always`. Save any files and unpushed commits before removing a sandbox.
- [Update CA certificates in existing sandboxes](https://docs.docker.com/security/security-announcements/#update-ca-certificates-in-existing-sandboxes), then restart applications. Tools that bundle their own CA certificates may require separate updates.
@z

@x
See the [security advisory](https://docs.docker.com/security/security-announcements/#docker-sandboxes-response-to-emudhra-ca-compromise) for commands and guidance for custom templates.
@y
See the [security advisory](https://docs.docker.com/security/security-announcements/#docker-sandboxes-response-to-emudhra-ca-compromise) for commands and guidance for custom templates.
@z

@x
## 0.49.1
@y
## 0.49.1
@z

@x
{{< release-date date="2026-10-20" >}}
@y
{{< release-date date="2026-10-20" >}}
@z

@x
[GitHub release](https://github.com/docker/sbx-releases/releases/tag/v0.49.1)
@y
[GitHub release](https://github.com/docker/sbx-releases/releases/tag/v0.49.1)
@z

@x
### Highlights
@y
### Highlights
@z

@x
Docker Sandboxes v0.49.1 improves kit compatibility, proxy support for cloud connections, and sandbox shutdown reliability.
@y
Docker Sandboxes v0.49.1 improves kit compatibility, proxy support for cloud connections, and sandbox shutdown reliability.
@z

@x
> [!NOTE]
> v0.49.0 was skipped. These release notes cover all changes since v0.48.0.
@y
> [!NOTE]
> v0.49.0 was skipped. These release notes cover all changes since v0.48.0.
@z

@x
### What's new
@y
### What's new
@z

@x
#### Kits
@y
#### Kits
@z

@x
- `sbx kit validate` and `sbx kit inspect` accept `--offline` to check a local directory or ZIP kit without starting the daemon or signing in.
- Creating sandboxes from local or Git v3 kits honors build-time `--kit-arg` values, including scoped overrides.
- Sandboxes combining multiple agent kits, such as Claude and Codex, start successfully and receive guidance in each agent's context file.
- On Windows, sandboxes can combine workload and mixin kits, including kits loaded through Windows junctions.
- Kits declaring multiple OAuth credentials authenticate every declared service.
- `sbx kit sign` warns when Git would change the signed file contents and invalidate signatures for `git+` references.
- Reading a kit directory rejects unsupported entries, such as named pipes and device nodes, instead of hanging. `sbx kit pack` rejects symlinks that would produce an archive Sandboxes cannot load.
@y
- `sbx kit validate` and `sbx kit inspect` accept `--offline` to check a local directory or ZIP kit without starting the daemon or signing in.
- Creating sandboxes from local or Git v3 kits honors build-time `--kit-arg` values, including scoped overrides.
- Sandboxes combining multiple agent kits, such as Claude and Codex, start successfully and receive guidance in each agent's context file.
- On Windows, sandboxes can combine workload and mixin kits, including kits loaded through Windows junctions.
- Kits declaring multiple OAuth credentials authenticate every declared service.
- `sbx kit sign` warns when Git would change the signed file contents and invalidate signatures for `git+` references.
- Reading a kit directory rejects unsupported entries, such as named pipes and device nodes, instead of hanging. `sbx kit pack` rejects symlinks that would produce an archive Sandboxes cannot load.
@z

@x
#### Sandbox lifecycle and workspaces
@y
#### Sandbox lifecycle and workspaces
@z

@x
- SSH sessions start in the sandbox workspace, matching `sbx exec`.
- SSH-agent access granted by a kit continues working in running sandboxes after the daemon restarts.
- In newly created local sandboxes, Git preserves the host's ignore decisions for paths already present in the primary workspace. This applies to primary workspaces mounted at a Git repository root.
- Sandbox startup waits for Docker to become ready without launching competing Docker daemons.
- Daemon shutdown and sandbox reset no longer hang indefinitely when Docker is unresponsive or a kit registry operation stalls.
- Sandbox reset handles concurrent operations more reliably, avoids false cleanup warnings, and identifies sandboxes it could not fully remove.
- Port changes fail cleanly during sandbox creation or deletion, avoiding stale host bindings.
- SSH connection attempts fail cleanly when the daemon is shutting down.
- Cursor sandboxes no longer show an unexpected Workspace Trust prompt for workspace paths containing characters such as `.` or `_`.
@y
- SSH sessions start in the sandbox workspace, matching `sbx exec`.
- SSH-agent access granted by a kit continues working in running sandboxes after the daemon restarts.
- In newly created local sandboxes, Git preserves the host's ignore decisions for paths already present in the primary workspace. This applies to primary workspaces mounted at a Git repository root.
- Sandbox startup waits for Docker to become ready without launching competing Docker daemons.
- Daemon shutdown and sandbox reset no longer hang indefinitely when Docker is unresponsive or a kit registry operation stalls.
- Sandbox reset handles concurrent operations more reliably, avoids false cleanup warnings, and identifies sandboxes it could not fully remove.
- Port changes fail cleanly during sandbox creation or deletion, avoiding stale host bindings.
- SSH connection attempts fail cleanly when the daemon is shutting down.
- Cursor sandboxes no longer show an unexpected Workspace Trust prompt for workspace paths containing characters such as `.` or `_`.
@z

@x
#### Networking and cloud sandboxes
@y
#### Networking and cloud sandboxes
@z

@x
- Explicit CIDR deny rules take precedence over matching domain allow rules when Sandboxes resolves the destination address.
- Cloud commands, `sbx move`, the TUI, and cloud SSH honor configured proxies, including system and PAC proxies. Set `proxy.sshDirect` to `true` to connect cloud SSH directly on networks that permit direct SSH connections.
- `sbx mcp add` completes OAuth discovery on networks that require an HTTP proxy, without needing `--skip-ssrf-check`.
- Fixed uploads stalling while waiting for HTTP 100 Continue through intercepted HTTPS connections.
- Fixed a Windows system-proxy watcher hang that could prevent the daemon from stopping.
- Image pulls from `public.ecr.aws` work under the `balanced` network policy.
- `sbx policy refresh` immediately refreshes policy, for example after an AI Governance change, instead of waiting for the next polling interval. Existing connections remain open.
- `sbx policy ls` continues showing `default-deny-all` after a kit adds network rules.
- Cloud connection and authentication errors include guidance for resolving the problem.
@y
- Explicit CIDR deny rules take precedence over matching domain allow rules when Sandboxes resolves the destination address.
- Cloud commands, `sbx move`, the TUI, and cloud SSH honor configured proxies, including system and PAC proxies. Set `proxy.sshDirect` to `true` to connect cloud SSH directly on networks that permit direct SSH connections.
- `sbx mcp add` completes OAuth discovery on networks that require an HTTP proxy, without needing `--skip-ssrf-check`.
- Fixed uploads stalling while waiting for HTTP 100 Continue through intercepted HTTPS connections.
- Fixed a Windows system-proxy watcher hang that could prevent the daemon from stopping.
- Image pulls from `public.ecr.aws` work under the `balanced` network policy.
- `sbx policy refresh` immediately refreshes policy, for example after an AI Governance change, instead of waiting for the next polling interval. Existing connections remain open.
- `sbx policy ls` continues showing `default-deny-all` after a kit adds network rules.
- Cloud connection and authentication errors include guidance for resolving the problem.
@z

@x
#### Authentication and MCP
@y
#### Authentication and MCP
@z

@x
- Custom secrets using `OPENAI_API_KEY` or `ANTHROPIC_API_KEY` appear in the sandbox as expected.
- `sbx secret set-custom` warns before replacing a different host or environment-variable mapping under the same placeholder.
- `sbx secret rm` returns an error when no secret matches `--registry`, `--placeholder`, `--host`, or `--env-name`.
- MCP gateway code-mode tools work on Windows hosts.
@y
- Custom secrets using `OPENAI_API_KEY` or `ANTHROPIC_API_KEY` appear in the sandbox as expected.
- `sbx secret set-custom` warns before replacing a different host or environment-variable mapping under the same placeholder.
- `sbx secret rm` returns an error when no secret matches `--registry`, `--placeholder`, `--host`, or `--env-name`.
- MCP gateway code-mode tools work on Windows hosts.
@z

@x
#### CLI, settings, and diagnostics
@y
#### CLI, settings, and diagnostics
@z

@x
- `sbx policy ls`, `sbx settings ls`, and `sbx policy approval ls` accept `-q` to print only rule IDs, setting keys, or approval IDs.
- Configure daemon log size and retention with `sbx settings set` using `daemon.log.maxSizeMB`, `daemon.log.maxBackups`, and `daemon.log.maxAgeDays`.
- The `browser.enabled` setting controls whether sandboxes can open the host browser.
- `sbx env` reports unknown keys and invalid values with their source file, line, column, and field. Invalid values in a base file must be fixed even if a later file overrides them; this also applies to `~/.sbxenv.yaml` and `sbx env rm`.
- `sbx settings set` rejects incorrectly structured values for `kit.allowedSources` and `kit.trustedSigners` before saving them.
- `sbx cp` clearly reports a missing destination directory without extra tar errors.
- `sbx diagnose` reports running CLI and shim processes, warns when global network policy is not initialized, and detects a ZFS setting that can make image builds unusually slow.
@y
- `sbx policy ls`, `sbx settings ls`, and `sbx policy approval ls` accept `-q` to print only rule IDs, setting keys, or approval IDs.
- Configure daemon log size and retention with `sbx settings set` using `daemon.log.maxSizeMB`, `daemon.log.maxBackups`, and `daemon.log.maxAgeDays`.
- The `browser.enabled` setting controls whether sandboxes can open the host browser.
- `sbx env` reports unknown keys and invalid values with their source file, line, column, and field. Invalid values in a base file must be fixed even if a later file overrides them; this also applies to `~/.sbxenv.yaml` and `sbx env rm`.
- `sbx settings set` rejects incorrectly structured values for `kit.allowedSources` and `kit.trustedSigners` before saving them.
- `sbx cp` clearly reports a missing destination directory without extra tar errors.
- `sbx diagnose` reports running CLI and shim processes, warns when global network policy is not initialized, and detects a ZFS setting that can make image builds unusually slow.
@z

@x
#### Templates and installation
@y
#### Templates and installation
@z

@x
- Full templates now include a C/C++ toolchain for compiling native code inside the sandbox.
- The Linux tarball installer works for regular users on systems with AppArmor.
@y
- Full templates now include a C/C++ toolchain for compiling native code inside the sandbox.
- The Linux tarball installer works for regular users on systems with AppArmor.
@z

@x
<!-- END GENERATED RELEASES -->
@y
<!-- END GENERATED RELEASES -->
@z

@x
## Earlier releases
@y
## Earlier releases
@z

@x
For older versions, see the
[Docker Sandboxes releases on GitHub](https://github.com/docker/sbx-releases/releases).
@y
For older versions, see the
[Docker Sandboxes releases on GitHub](https://github.com/docker/sbx-releases/releases).
@z
