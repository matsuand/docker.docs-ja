%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Debug a kit
linkTitle: Debug a kit
description: Read the setup progress output, find install and startup logs inside the sandbox, and fix a kit whose install or startup command fails.
keywords: sandboxes, sbx, kits, debug, troubleshooting, install, startup, logs
@y
title: Debug a kit
linkTitle: Debug a kit
description: Read the setup progress output, find install and startup logs inside the sandbox, and fix a kit whose install or startup command fails.
keywords: sandboxes, sbx, kits, debug, troubleshooting, install, startup, logs
@z

@x
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@z

@x
When a kit's install or startup command fails, `sbx` shows you which command
failed, in which kit, and where the full output is. This page shows how to read
that output, find the logs inside the sandbox, and fix the common causes.
@y
When a kit's install or startup command fails, `sbx` shows you which command
failed, in which kit, and where the full output is. This page shows how to read
that output, find the logs inside the sandbox, and fix the common causes.
@z

@x
## Read the progress output
@y
## Read the progress output
@z

@x
During `sbx create` and `sbx run`, the configure agent phase prints one row for
each kit operation: install commands, init files, file copies, environment
variables, and the startup commands it registers. A finished row shows ✓ with
the elapsed time, or ✗ with the exit code.
@y
During `sbx create` and `sbx run`, the configure agent phase prints one row for
each kit operation: install commands, init files, file copies, environment
variables, and the startup commands it registers. A finished row shows ✓ with
the elapsed time, or ✗ with the exit code.
@z

@x
Each command row shows the command's `description` when the kit sets one.
Otherwise it shows the first 60 characters of the command. It also shows the
kit that owns the command (`kit=<name>`) and the user it runs as (`user=<uid>`).
@y
Each command row shows the command's `description` when the kit sets one.
Otherwise it shows the first 60 characters of the command. It also shows the
kit that owns the command (`kit=<name>`) and the user it runs as (`user=<uid>`).
@z

@x
Set `description` on every install and startup command so the row says what the
command is for. Keep it short: a row shows at most 60 characters of it.
@y
Set `description` on every install and startup command so the row says what the
command is for. Keep it short: a row shows at most 60 characters of it.
@z

@x
```yaml {title="my-kit/my-kit.yaml"}
capabilities:
  - type: com.docker.sandbox/lifecycle@1
    config:
      install:
        - command: apt-get update && apt-get install -y ripgrep
          user: "0"
          description: Install ripgrep
      startup:
        - command: rg --version > /tmp/rg-version
          description: Record the ripgrep version
```
@y
```yaml {title="my-kit/my-kit.yaml"}
capabilities:
  - type: com.docker.sandbox/lifecycle@1
    config:
      install:
        - command: apt-get update && apt-get install -y ripgrep
          user: "0"
          description: Install ripgrep
      startup:
        - command: rg --version > /tmp/rg-version
          description: Record the ripgrep version
```
@z

@x
The rows for this kit look like this:
@y
The rows for this kit look like this:
@z

@x
```text
AGENT
    running 1 install command
      ✓ Install ripgrep (kit=my-kit, user=0, 12.4s)
      view install logs: ls /var/log/sbx-kits
    registering 1 startup command, run on every container start
      ○ Record the ripgrep version (kit=my-kit, user=agent)
      view startup log: cat /var/log/sbx-kit-startup.log
```
@y
```text
AGENT
    running 1 install command
      ✓ Install ripgrep (kit=my-kit, user=0, 12.4s)
      view install logs: ls /var/log/sbx-kits
    registering 1 startup command, run on every container start
      ○ Record the ripgrep version (kit=my-kit, user=agent)
      view startup log: cat /var/log/sbx-kit-startup.log
```
@z

@x
## Read a failed install command
@y
## Read a failed install command
@z

@x
A failed install command prints the last 40 lines of its output under the row,
followed by a `docker run` line that runs the same command against the kit's
base image:
@y
A failed install command prints the last 40 lines of its output under the row,
followed by a `docker run` line that runs the same command against the kit's
base image:
@z

@x
```text
  ✗ Install ripgrep (kit=my-kit, user=0, exit 100)
    ── captured output ──
    E: Failed to fetch http://deb.debian.org/debian/dists/bookworm/InRelease  403  Forbidden
    E: Unable to locate package ripgrep
    ──────────────────────
  hint: reproduce locally with:
    docker run --rm -u 0 <base-image> sh -c 'apt-get update && apt-get install -y ripgrep'
```
@y
```text
  ✗ Install ripgrep (kit=my-kit, user=0, exit 100)
    ── captured output ──
    E: Failed to fetch http://deb.debian.org/debian/dists/bookworm/InRelease  403  Forbidden
    E: Unable to locate package ripgrep
    ──────────────────────
  hint: reproduce locally with:
    docker run --rm -u 0 <base-image> sh -c 'apt-get update && apt-get install -y ripgrep'
```
@z

@x
Copy the `docker run` line to iterate on the command without recreating the
sandbox each time. Change the command, run it again, and copy the working
version back into the kit. The reproduction runs in plain Docker, outside the sandbox, so the sandbox's
network policy doesn't apply. If the command works there but fails in the
sandbox, check the kit's network rules first.
@y
Copy the `docker run` line to iterate on the command without recreating the
sandbox each time. Change the command, run it again, and copy the working
version back into the kit. The reproduction runs in plain Docker, outside the sandbox, so the sandbox's
network policy doesn't apply. If the command works there but fails in the
sandbox, check the kit's network rules first.
@z

@x
## Find the logs inside the sandbox
@y
## Find the logs inside the sandbox
@z

@x
The progress output shows only the end of a failed command. The sandbox keeps
the full record:
@y
The progress output shows only the end of a failed command. The sandbox keeps
the full record:
@z

@x
| Log | Contents |
| --- | --- |
| `/var/log/sbx-kits/<kit>/install-<n>.log` | Full output of one install command. `<n>` is the command's position in that kit's `install` list, starting at 0. |
| `/var/log/sbx-kit-startup.log` | Output of every startup command, from every container start. |
@y
| Log | Contents |
| --- | --- |
| `/var/log/sbx-kits/<kit>/install-<n>.log` | Full output of one install command. `<n>` is the command's position in that kit's `install` list, starting at 0. |
| `/var/log/sbx-kit-startup.log` | Output of every startup command, from every container start. |
@z

@x
Read either log with `sbx exec`:
@y
Read either log with `sbx exec`:
@z

@x
```console
$ sbx exec my-sandbox cat /var/log/sbx-kits/my-kit/install-0.log
$ sbx exec my-sandbox cat /var/log/sbx-kit-startup.log
```
@y
```console
$ sbx exec my-sandbox cat /var/log/sbx-kits/my-kit/install-0.log
$ sbx exec my-sandbox cat /var/log/sbx-kit-startup.log
```
@z

@x
Startup commands run on every container start. Each one writes these lines to
the startup log:
@y
Startup commands run on every container start. Each one writes these lines to
the startup log:
@z

@x
```text
> <script>
# <kit>: <description or command>
<the command's output>
ok <script>
```
@y
```text
> <script>
# <kit>: <description or command>
<the command's output>
ok <script>
```
@z

@x
A failing command ends with `fail <script> exit=<code>` instead of `ok`. It
also stops the startup commands after it, and the command that started the
sandbox (`sbx create`, `sbx run`, `sbx exec` after `sbx stop`, or
`sbx kit add`) prints a warning that points at the startup log with its last
lines. The sandbox stays usable.
@y
A failing command ends with `fail <script> exit=<code>` instead of `ok`. It
also stops the startup commands after it, and the command that started the
sandbox (`sbx create`, `sbx run`, `sbx exec` after `sbx stop`, or
`sbx kit add`) prints a warning that points at the startup log with its last
lines. The sandbox stays usable.
@z

@x
After the create phase, the agent takes over the terminal. The logs in the
sandbox are the record you can come back to.
@y
After the create phase, the agent takes over the terminal. The logs in the
sandbox are the record you can come back to.
@z

@x
## Show everything with -D
@y
## Show everything with -D
@z

@x
Pass the global debug flag to `sbx create` or `sbx run`:
@y
Pass the global debug flag to `sbx create` or `sbx run`:
@z

@x
```console
$ sbx -D create --name my-sandbox shell --kit ./my-kit
```
@y
```console
$ sbx -D create --name my-sandbox shell --kit ./my-kit
```
@z

@x
With `-D`, each successful install command also streams its full output under
its row, and `sbx` prints the startup log after the sandbox starts.
@y
With `-D`, each successful install command also streams its full output under
its row, and `sbx` prints the startup log after the sandbox starts.
@z

@x
### What `sbx` redacts
@y
### What `sbx` redacts
@z

@x
Everything a kit command prints reaches your terminal through one filter. It
removes terminal escape sequences and replaces known credential shapes, such as
GitHub, GitLab, OpenAI, Anthropic and AWS tokens, JSON Web Tokens, private keys
and `Authorization` headers, with a placeholder like `<GITHUB_TOKEN>`. The
filter protects you from a command that accidentally echoes your own secrets,
for example a token in `env` output or a key in a configuration dump. It is not
a defence against output written to defeat it, and it does not change a secret
you wrote into the kit's own command text. The install log inside the sandbox
keeps the raw output.
@y
Everything a kit command prints reaches your terminal through one filter. It
removes terminal escape sequences and replaces known credential shapes, such as
GitHub, GitLab, OpenAI, Anthropic and AWS tokens, JSON Web Tokens, private keys
and `Authorization` headers, with a placeholder like `<GITHUB_TOKEN>`. The
filter protects you from a command that accidentally echoes your own secrets,
for example a token in `env` output or a key in a configuration dump. It is not
a defence against output written to defeat it, and it does not change a secret
you wrote into the kit's own command text. The install log inside the sandbox
keeps the raw output.
@z

@x
## Common causes
@y
## Common causes
@z

@x
### The install command can't reach its package source
@y
### The install command can't reach its package source
@z

@x
The log shows names that don't resolve, or HTTP 403 responses from the
sandbox proxy, from `apt`, `pip`, or `npm`. The kit's install-phase network
rules don't include the package mirror. Add it to `install.allow` in the
`com.docker.sandbox/network-policy@1` capability. The `apt` mirrors, for
example, can live on a different host than the one the command names.
@y
The log shows names that don't resolve, or HTTP 403 responses from the
sandbox proxy, from `apt`, `pip`, or `npm`. The kit's install-phase network
rules don't include the package mirror. Add it to `install.allow` in the
`com.docker.sandbox/network-policy@1` capability. The `apt` mirrors, for
example, can live on a different host than the one the command names.
@z

@x
### Two kits run `apt` at the same time
@y
### Two kits run `apt` at the same time
@z

@x
The log shows `Could not get lock /var/lib/dpkg/lock-frontend`. Another
install command, or the base image setup, holds the dpkg lock. Retry the
package command in the kit, for example with `-o DPkg::Lock::Timeout=120`
on `apt-get`.
@y
The log shows `Could not get lock /var/lib/dpkg/lock-frontend`. Another
install command, or the base image setup, holds the dpkg lock. Retry the
package command in the kit, for example with `-o DPkg::Lock::Timeout=120`
on `apt-get`.
@z

@x
### A startup command needs a tool that didn't install
@y
### A startup command needs a tool that didn't install
@z

@x
The startup log shows `exec: <tool>: not found` after an install command for
that tool failed. Fix the install command first. Check its
`install-<n>.log`, then rerun the sandbox.
@y
The startup log shows `exec: <tool>: not found` after an install command for
that tool failed. Fix the install command first. Check its
`install-<n>.log`, then rerun the sandbox.
@z

@x
### The command needs root
@y
### The command needs root
@z

@x
The log shows `Permission denied` when the command writes to a system path or
installs a package, and the row shows `user=1000`. Set `user: "0"` on the
install command, or write to a location the agent user owns.
@y
The log shows `Permission denied` when the command writes to a system path or
installs a package, and the row shows `user=1000`. Set `user: "0"` on the
install command, or write to a location the agent user owns.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [Kit authoring patterns](/manuals/ai/sandboxes/customize/author/patterns.md)
  shows setup commands in context.
- [Sandbox troubleshooting](/manuals/ai/sandboxes/troubleshooting.md) covers
  other sandbox problems.
@y
- [Kit authoring patterns](manuals/ai/sandboxes/customize/author/patterns.md)
  shows setup commands in context.
- [Sandbox troubleshooting](manuals/ai/sandboxes/troubleshooting.md) covers
  other sandbox problems.
@z
