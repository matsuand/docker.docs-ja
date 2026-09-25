%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Docker Sandboxes settings
linkTitle: Settings
description: Configure Docker Sandboxes with sbx settings. View effective values, manage persistent overrides, and use environment variables for supported settings.
keywords: docker sandboxes, sbx, settings, configuration, environment variables, overrides
@y
title: Docker Sandboxes settings
linkTitle: Settings
description: Configure Docker Sandboxes with sbx settings. View effective values, manage persistent overrides, and use environment variables for supported settings.
keywords: docker sandboxes, sbx, settings, configuration, environment variables, overrides
@z

@x
Use `sbx settings` to configure Docker Sandboxes on your host, including
clipboard access, kit sources, and defaults for sandbox creation. Settings
apply across your local sandboxes. For project-specific configuration, use
[environment files](environment-files.md).
@y
Use `sbx settings` to configure Docker Sandboxes on your host, including
clipboard access, kit sources, and defaults for sandbox creation. Settings
apply across your local sandboxes. For project-specific configuration, use
[environment files](environment-files.md).
@z

@x
The commands read and write settings through the local daemon, starting it if
necessary. Overrides persist across CLI invocations and daemon restarts.
@y
The commands read and write settings through the local daemon, starting it if
necessary. Overrides persist across CLI invocations and daemon restarts.
@z

@x
## View settings
@y
## View settings
@z

@x
List settings with their effective value, type, source, and description:
@y
List settings with their effective value, type, source, and description:
@z

@x
```console
$ sbx settings list
```
@y
```console
$ sbx settings list
```
@z

@x
Long values and descriptions are truncated in the table. Use
`sbx settings list --no-trunc` for complete text, or `sbx settings list --json`
for JSON output. The JSON records also include defaults and environment
variable names where available.
@y
Long values and descriptions are truncated in the table. Use
`sbx settings list --no-trunc` for complete text, or `sbx settings list --json`
for JSON output. The JSON records also include defaults and environment
variable names where available.
@z

@x
To inspect one setting:
@y
To inspect one setting:
@z

@x
```console
$ sbx settings get clipboard.imagePaste
false
$ sbx settings get clipboard.imagePaste --json
```
@y
```console
$ sbx settings get clipboard.imagePaste
false
$ sbx settings get clipboard.imagePaste --json
```
@z

@x
Without `--json`, `get` prints only the effective value. With `--json`, it
prints the complete setting record, including the source and default.
@y
Without `--json`, `get` prints only the effective value. With `--json`, it
prints the complete setting record, including the source and default.
@z

@x
## Change a setting
@y
## Change a setting
@z

@x
Set an override by passing the setting key and a value of the required type.
For example, allow sandboxed agents to read images from your host clipboard:
@y
Set an override by passing the setting key and a value of the required type.
For example, allow sandboxed agents to read images from your host clipboard:
@z

@x
```console
$ sbx settings set clipboard.imagePaste true
```
@y
```console
$ sbx settings set clipboard.imagePaste true
```
@z

@x
For JSON values, quote the argument so your shell passes it intact. This
example permits kits from Docker Hub and your organization's GitHub repositories:
@y
For JSON values, quote the argument so your shell passes it intact. This
example permits kits from Docker Hub and your organization's GitHub repositories:
@z

@x
```console
$ sbx settings set kit.allowedSources '["docker.io/","github.com/myorg/"]'
```
@y
```console
$ sbx settings set kit.allowedSources '["docker.io/","github.com/myorg/"]'
```
@z

@x
JSON arrays and objects replace the whole value. Include any entries you want
to keep.
@y
JSON arrays and objects replace the whole value. Include any entries you want
to keep.
@z

@x
Remove an override with `unset`:
@y
Remove an override with `unset`:
@z

@x
```console
$ sbx settings unset clipboard.imagePaste
```
@y
```console
$ sbx settings unset clipboard.imagePaste
```
@z

@x
The setting falls back to its environment variable, if set, or its default.
Setting a value equal to its built-in default also removes the stored override.
@y
The setting falls back to its environment variable, if set, or its default.
Setting a value equal to its built-in default also removes the stored override.
@z

@x
### Value precedence
@y
### Value precedence
@z

@x
For each setting, the first available value wins:
@y
For each setting, the first available value wins:
@z

@x
1. The setting's environment variable, if it has one
2. A user override written with `sbx settings set`
3. The built-in default
@y
1. The setting's environment variable, if it has one
2. A user override written with `sbx settings set`
3. The built-in default
@z

@x
The `SOURCE` column in `sbx settings list` identifies the selected source as
`envvar`, `override`, or `default`. If an environment variable takes precedence,
`set` still updates the stored override and reports why the effective value
hasn't changed. `unset` removes only the stored override, not the environment
variable.
@y
The `SOURCE` column in `sbx settings list` identifies the selected source as
`envvar`, `override`, or `default`. If an environment variable takes precedence,
`set` still updates the stored override and reports why the effective value
hasn't changed. `unset` removes only the stored override, not the environment
variable.
@z

@x
### When changes take effect
@y
### When changes take effect
@z

@x
Most changes take effect within about five seconds. Settings marked `yes` in
the `RESTART` column require a daemon restart for existing daemon-side consumers:
@y
Most changes take effect within about five seconds. Settings marked `yes` in
the `RESTART` column require a daemon restart for existing daemon-side consumers:
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
The `set` and `unset` commands print a restart reminder when needed. Some
settings apply only when creating a sandbox: changing a template default or disk
size doesn't update existing sandboxes. Proxy settings have separate timing for
CLI requests, daemon traffic, and sandbox traffic. See
[When proxy changes take effect](upstream-proxy.md#when-changes-take-effect).
@y
The `set` and `unset` commands print a restart reminder when needed. Some
settings apply only when creating a sandbox: changing a template default or disk
size doesn't update existing sandboxes. Proxy settings have separate timing for
CLI requests, daemon traffic, and sandbox traffic. See
[When proxy changes take effect](upstream-proxy.md#when-changes-take-effect).
@z

@x
## Environment variables
@y
## Environment variables
@z

@x
Some settings have an environment variable equivalent, listed in the reference
entries below. These variables configure Docker Sandboxes on the host. They
don't set environment variables inside a sandbox.
@y
Some settings have an environment variable equivalent, listed in the reference
entries below. These variables configure Docker Sandboxes on the host. They
don't set environment variables inside a sandbox.
@z

@x
The daemon inherits environment variables when it starts. Export a variable
before the first `sbx` command, or restart an existing daemon from the shell
where you set it. For example:
@y
The daemon inherits environment variables when it starts. Export a variable
before the first `sbx` command, or restart an existing daemon from the shell
where you set it. For example:
@z

@x
```console
$ export DOCKER_SANDBOXES_CLIPBOARD_IMAGE_PASTE=true
$ sbx daemon restart
$ sbx settings get clipboard.imagePaste
true
```
@y
```console
$ export DOCKER_SANDBOXES_CLIPBOARD_IMAGE_PASTE=true
$ sbx daemon restart
$ sbx settings get clipboard.imagePaste
true
```
@z

@x
Changing your shell environment doesn't change the environment of a running
daemon, even for settings that normally take effect without a restart. To
return to a stored override or default, remove the variable and restart:
@y
Changing your shell environment doesn't change the environment of a running
daemon, even for settings that normally take effect without a restart. To
return to a stored override or default, remove the variable and restart:
@z

@x
```console
$ unset DOCKER_SANDBOXES_CLIPBOARD_IMAGE_PASTE
$ sbx daemon restart
```
@y
```console
$ unset DOCKER_SANDBOXES_CLIPBOARD_IMAGE_PASTE
$ sbx daemon restart
```
@z

@x
CLI operations that read settings locally use their own environment on each
invocation. Keep the CLI and daemon environments consistent when using these
variables. A persistent override with `sbx settings set` avoids needing to
export a variable in each shell.
@y
CLI operations that read settings locally use their own environment on each
invocation. Keep the CLI and daemon environments consistent when using these
variables. A persistent override with `sbx settings set` avoids needing to
export a variable in each shell.
@z

@x
## Settings reference
@y
## Settings reference
@z

@x
Each entry lists its built-in default, before overrides. An environment
variable appears only when the setting has a direct equivalent. Use
`sbx settings list` to inspect the values supported by your installed version.
@y
Each entry lists its built-in default, before overrides. An environment
variable appears only when the setting has a direct equivalent. Use
`sbx settings list` to inspect the values supported by your installed version.
@z

@x
### Agents and host access
@y
### Agents and host access
@z

@x
#### clipboard.imagePaste {.wrap-anywhere}
@y
#### clipboard.imagePaste {.wrap-anywhere}
@z

@x
{{< setting-metadata type="boolean" default="false"
  env="DOCKER_SANDBOXES_CLIPBOARD_IMAGE_PASTE" >}}
@y
{{< setting-metadata type="boolean" default="false"
  env="DOCKER_SANDBOXES_CLIPBOARD_IMAGE_PASTE" >}}
@z

@x
Turn this on to paste screenshots and other host clipboard images into agents
such as Claude Code and Codex with `Ctrl+V`. Text paste doesn't need this setting.
@y
Turn this on to paste screenshots and other host clipboard images into agents
such as Claude Code and Codex with `Ctrl+V`. Text paste doesn't need this setting.
@z

@x
```console
$ sbx settings set clipboard.imagePaste true
```
@y
```console
$ sbx settings set clipboard.imagePaste true
```
@z

@x
This grants sandboxed processes access to host clipboard images. The change
applies to running sandboxes without recreating them. Set it to `false` to
withdraw that access. See [image paste](../faq.md#can-i-paste-images-into-an-agent)
for supported behavior.
@y
This grants sandboxed processes access to host clipboard images. The change
applies to running sandboxes without recreating them. Set it to `false` to
withdraw that access. See [image paste](../faq.md#can-i-paste-images-into-an-agent)
for supported behavior.
@z

@x
#### claude.remoteControl {.wrap-anywhere}
@y
#### claude.remoteControl {.wrap-anywhere}
@z

@x
{{< setting-metadata type="boolean" default="false"
  env="DOCKER_SANDBOXES_CLAUDE_REMOTE_CONTROL" >}}
@y
{{< setting-metadata type="boolean" default="false"
  env="DOCKER_SANDBOXES_CLAUDE_REMOTE_CONTROL" >}}
@z

@x
Turn this on before using Claude Code's `/remote-control` command inside a
sandbox:
@y
Turn this on before using Claude Code's `/remote-control` command inside a
sandbox:
@z

@x
```console
$ sbx settings set claude.remoteControl true
```
@y
```console
$ sbx settings set claude.remoteControl true
```
@z

@x
The remote-control connection must authenticate with its own session token.
This setting lets it do so instead of having the sandbox proxy replace that
token with the host credential. Set it to `false` to restore credential
replacement on that connection. Changes apply to requests from running
sandboxes. See [Claude Code remote control](../agents/claude-code.md#remote-control).
@y
The remote-control connection must authenticate with its own session token.
This setting lets it do so instead of having the sandbox proxy replace that
token with the host credential. Set it to `false` to restore credential
replacement on that connection. Changes apply to requests from running
sandboxes. See [Claude Code remote control](../agents/claude-code.md#remote-control).
@z

@x
#### env.rememberHostCommands {.wrap-anywhere}
@y
#### env.rememberHostCommands {.wrap-anywhere}
@z

@x
{{< setting-metadata type="boolean" default="false" >}}
@y
{{< setting-metadata type="boolean" default="false" >}}
@z

@x
Use this when you repeatedly run a trusted environment file and want to
approve its host commands once, until those commands change:
@y
Use this when you repeatedly run a trusted environment file and want to
approve its host commands once, until those commands change:
@z

@x
```console
$ sbx settings set env.rememberHostCommands true
```
@y
```console
$ sbx settings set env.rememberHostCommands true
```
@z

@x
The first approval is still required. Commands run on your host with your
permissions, outside the sandbox. Leave the setting at `false` to require
approval on every invocation, or use `--auto-approve` to approve only one
invocation. See [environment lifecycle commands](environment-files.md#lifecycle).
@y
The first approval is still required. Commands run on your host with your
permissions, outside the sandbox. Leave the setting at `false` to require
approval on every invocation, or use `--auto-approve` to approve only one
invocation. See [environment lifecycle commands](environment-files.md#lifecycle).
@z

@x
#### ssh.agentForwardingEnabled {.wrap-anywhere}
@y
#### ssh.agentForwardingEnabled {.wrap-anywhere}
@z

@x
{{< setting-metadata type="boolean" default="true" >}}
@y
{{< setting-metadata type="boolean" default="true" >}}
@z

@x
Set this to `false` when sandboxes should not be able to request signatures
from your host SSH agent, including for Git authentication and commit signing:
@y
Set this to `false` when sandboxes should not be able to request signatures
from your host SSH agent, including for Git authentication and commit signing:
@z

@x
```console
$ sbx settings set ssh.agentForwardingEnabled false
$ sbx daemon restart
```
@y
```console
$ sbx settings set ssh.agentForwardingEnabled false
$ sbx daemon restart
```
@z

@x
Restarting the daemon applies the change to existing forwarders. When forwarding
is enabled, the private keys remain on the host, but sandboxed processes can
ask the agent to use them. See [SSH agent credentials](credentials.md#ssh-agent).
@y
Restarting the daemon applies the change to existing forwarders. When forwarding
is enabled, the private keys remain on the host, but sandboxed processes can
ask the agent to use them. See [SSH agent credentials](credentials.md#ssh-agent).
@z

@x
#### ssh.agentSocketPath {.wrap-anywhere}
@y
#### ssh.agentSocketPath {.wrap-anywhere}
@z

@x
{{< setting-metadata type="string" default="Empty string" >}}
@y
{{< setting-metadata type="string" default="Empty string" >}}
@z

@x
Use a fixed path when every sandbox should use the same host SSH agent, such
as a password manager's agent, regardless of which shell starts the sandbox:
@y
Use a fixed path when every sandbox should use the same host SSH agent, such
as a password manager's agent, regardless of which shell starts the sandbox:
@z

@x
```console
$ sbx settings set ssh.agentSocketPath "$SSH_AUTH_SOCK"
$ sbx daemon restart
```
@y
```console
$ sbx settings set ssh.agentSocketPath "$SSH_AUTH_SOCK"
$ sbx daemon restart
```
@z

@x
Run this from a shell whose `SSH_AUTH_SOCK` points to the intended agent. The
command stores that path, not a reference to the variable. With an empty value,
Docker Sandboxes uses the socket supplied by each client instead. Remove the
fixed path with `sbx settings unset ssh.agentSocketPath` and restart the daemon
to update existing forwarders.
@y
Run this from a shell whose `SSH_AUTH_SOCK` points to the intended agent. The
command stores that path, not a reference to the variable. With an empty value,
Docker Sandboxes uses the socket supplied by each client instead. Remove the
fixed path with `sbx settings unset ssh.agentSocketPath` and restart the daemon
to update existing forwarders.
@z

@x
### Images and storage
@y
### Images and storage
@z

@x
#### platform.images.registryMirror {.wrap-anywhere}
@y
#### platform.images.registryMirror {.wrap-anywhere}
@z

@x
{{< setting-metadata type="string" default="Empty string" >}}
@y
{{< setting-metadata type="string" default="Empty string" >}}
@z

@x
Use this when your organization routes Docker Hub pulls through a registry
mirror. Specify a host, optionally with a port and path prefix, without a URL
scheme:
@y
Use this when your organization routes Docker Hub pulls through a registry
mirror. Specify a host, optionally with a port and path prefix, without a URL
scheme:
@z

@x
```console
$ sbx settings set platform.images.registryMirror registry.example.com/docker-remote
```
@y
```console
$ sbx settings set platform.images.registryMirror registry.example.com/docker-remote
```
@z

@x
The mirror applies to template and kit references that resolve to Docker Hub.
References to other registries stay unchanged. An empty value disables
mirroring.
@y
The mirror applies to template and kit references that resolve to Docker Hub.
References to other registries stay unchanged. An empty value disables
mirroring.
@z

@x
A bare, non-loopback host can also configure Docker pulls inside sandboxes
created after the change. A mirror with a path prefix doesn't configure those
pulls. See [registry mirrors](registry-mirror.md) for authentication, certificate
requirements, and how to apply changes to existing sandboxes.
@y
A bare, non-loopback host can also configure Docker pulls inside sandboxes
created after the change. A mirror with a path prefix doesn't configure those
pulls. See [registry mirrors](registry-mirror.md) for authentication, certificate
requirements, and how to apply changes to existing sandboxes.
@z

@x
#### platform.images.useDHI {.wrap-anywhere}
@y
#### platform.images.useDHI {.wrap-anywhere}
@z

@x
{{< setting-metadata type="boolean" default="false"
  env="DOCKER_SANDBOXES_USE_DHI" >}}
@y
{{< setting-metadata type="boolean" default="false"
  env="DOCKER_SANDBOXES_USE_DHI" >}}
@z

@x
Turn this on to use Docker Hardened Image variants when creating sandboxes
with default agent templates:
@y
Turn this on to use Docker Hardened Image variants when creating sandboxes
with default agent templates:
@z

@x
```console
$ sbx settings set platform.images.useDHI true
```
@y
```console
$ sbx settings set platform.images.useDHI true
```
@z

@x
For example, the default template `docker/sandbox-templates:claude-code-docker`
becomes `dhi/sbx-templates:claude-code-docker`. The image tag stays the same.
An explicit `--template` or a custom kit image takes precedence.
@y
For example, the default template `docker/sandbox-templates:claude-code-docker`
becomes `dhi/sbx-templates:claude-code-docker`. The image tag stays the same.
An explicit `--template` or a custom kit image takes precedence.
@z

@x
Existing sandboxes keep their template. Create a sandbox after changing the
setting to use the selected image variant.
@y
Existing sandboxes keep their template. Create a sandbox after changing the
setting to use the selected image variant.
@z

@x
#### sandbox.disk.dockerVolume {.wrap-anywhere}
@y
#### sandbox.disk.dockerVolume {.wrap-anywhere}
@z

@x
{{< setting-metadata type="string" default="10g" >}}
@y
{{< setting-metadata type="string" default="10g" >}}
@z

@x
Increase this default if sandboxes need more room for Docker images,
containers, and volumes under `/var/lib/docker`. The minimum is 512 MiB:
@y
Increase this default if sandboxes need more room for Docker images,
containers, and volumes under `/var/lib/docker`. The minimum is 512 MiB:
@z

@x
```console
$ sbx settings set sandbox.disk.dockerVolume 20g
```
@y
```console
$ sbx settings set sandbox.disk.dockerVolume 20g
```
@z

@x
The size applies when creating a sandbox. It doesn't resize existing volumes
or increase the size of the sandbox workspace.
@y
The size applies when creating a sandbox. It doesn't resize existing volumes
or increase the size of the sandbox workspace.
@z

@x
To choose a size for one sandbox without changing the default:
@y
To choose a size for one sandbox without changing the default:
@z

@x
```console
$ DOCKER_SANDBOXES_DOCKER_SIZE=30g sbx create claude ~/my-project
```
@y
```console
$ DOCKER_SANDBOXES_DOCKER_SIZE=30g sbx create claude ~/my-project
```
@z

@x
This variable applies to that creation command. It doesn't change the value
reported by `sbx settings get sandbox.disk.dockerVolume`.
@y
This variable applies to that creation command. It doesn't change the value
reported by `sbx settings get sandbox.disk.dockerVolume`.
@z

@x
### Kits
@y
### Kits
@z

@x
#### kit.allowedSources {.wrap-anywhere}
@y
#### kit.allowedSources {.wrap-anywhere}
@z

@x
{{< setting-metadata type="JSON" default="[\"docker.io/\"]"
  env="DOCKER_SANDBOXES_KIT_ALLOWED_SOURCES" >}}
@y
{{< setting-metadata type="JSON" default="[\"docker.io/\"]"
  env="DOCKER_SANDBOXES_KIT_ALLOWED_SOURCES" >}}
@z

@x
Add a publisher here before installing its kits from a remote registry or Git
repository. The value replaces the entire allowlist, so retain any sources you
still need:
@y
Add a publisher here before installing its kits from a remote registry or Git
repository. The value replaces the entire allowlist, so retain any sources you
still need:
@z

@x
```console
$ sbx settings set kit.allowedSources '["docker.io/","github.com/myorg/"]'
```
@y
```console
$ sbx settings set kit.allowedSources '["docker.io/","github.com/myorg/"]'
```
@z

@x
Prefixes match on a path-segment boundary: `github.com/myorg/` permits that
organization's repositories, but not `github.com/myorg-other/`. The value
`["*"]` permits any remote source. Local directories and ZIP files are controlled
by [kit.allowLocalKits](#kitallowlocalkits), and pinned agent kits have the
[kit.allowExtractedAgents](#kitallowextractedagents) exception.
@y
Prefixes match on a path-segment boundary: `github.com/myorg/` permits that
organization's repositories, but not `github.com/myorg-other/`. The value
`["*"]` permits any remote source. Local directories and ZIP files are controlled
by [kit.allowLocalKits](#kitallowlocalkits), and pinned agent kits have the
[kit.allowExtractedAgents](#kitallowextractedagents) exception.
@z

@x
See [restrict kit sources](../customize/use-kits.md#restrict-kit-sources) for source
formats and examples.
@y
See [restrict kit sources](../customize/use-kits.md#restrict-kit-sources) for source
formats and examples.
@z

@x
#### kit.allowLocalKits {.wrap-anywhere}
@y
#### kit.allowLocalKits {.wrap-anywhere}
@z

@x
{{< setting-metadata type="boolean" default="true"
  env="DOCKER_SANDBOXES_KIT_ALLOW_LOCAL" >}}
@y
{{< setting-metadata type="boolean" default="true"
  env="DOCKER_SANDBOXES_KIT_ALLOW_LOCAL" >}}
@z

@x
Set this to `false` to require kits to come from a remote source instead of a
local directory or ZIP file:
@y
Set this to `false` to require kits to come from a remote source instead of a
local directory or ZIP file:
@z

@x
```console
$ sbx settings set kit.allowLocalKits false
```
@y
```console
$ sbx settings set kit.allowLocalKits false
```
@z

@x
Remote sources must still satisfy [kit.allowedSources](#kitallowedsources).
Keep this enabled while developing kits locally. Allowing local kits doesn't
exempt them from signature requirements when
[kit.requireSignature](#kitrequiresignature) is enabled.
@y
Remote sources must still satisfy [kit.allowedSources](#kitallowedsources).
Keep this enabled while developing kits locally. Allowing local kits doesn't
exempt them from signature requirements when
[kit.requireSignature](#kitrequiresignature) is enabled.
@z

@x
#### kit.allowExtractedAgents {.wrap-anywhere}
@y
#### kit.allowExtractedAgents {.wrap-anywhere}
@z

@x
{{< setting-metadata type="boolean" default="true"
  env="DOCKER_SANDBOXES_KIT_ALLOW_EXTRACTED_AGENTS" >}}
@y
{{< setting-metadata type="boolean" default="true"
  env="DOCKER_SANDBOXES_KIT_ALLOW_EXTRACTED_AGENTS" >}}
@z

@x
Some agents that previously shipped inside Docker Sandboxes are distributed
as kits. By default, Docker Sandboxes permits the exact pinned references it
uses for those agents even if their sources aren't in `kit.allowedSources`,
and exempts them from `kit.requireSignature`.
@y
Some agents that previously shipped inside Docker Sandboxes are distributed
as kits. By default, Docker Sandboxes permits the exact pinned references it
uses for those agents even if their sources aren't in `kit.allowedSources`,
and exempts them from `kit.requireSignature`.
@z

@x
To apply your source and signature requirements to those kits too:
@y
To apply your source and signature requirements to those kits too:
@z

@x
```console
$ sbx settings set kit.allowExtractedAgents false
```
@y
```console
$ sbx settings set kit.allowExtractedAgents false
```
@z

@x
After this change, launching one of those agents can fail unless you allow its
source and, when signatures are required, it has a signature from a trusted
signer. The default exception applies only to the pinned references, not to
other kits from the same publisher.
@y
After this change, launching one of those agents can fail unless you allow its
source and, when signatures are required, it has a signature from a trusted
signer. The default exception applies only to the pinned references, not to
other kits from the same publisher.
@z

@x
#### kit.requireSignature {.wrap-anywhere}
@y
#### kit.requireSignature {.wrap-anywhere}
@z

@x
{{< setting-metadata type="boolean" default="false"
  env="DOCKER_SANDBOXES_KIT_REQUIRE_SIGNATURE" >}}
@y
{{< setting-metadata type="boolean" default="false"
  env="DOCKER_SANDBOXES_KIT_REQUIRE_SIGNATURE" >}}
@z

@x
Turn this on to reject unsigned kits and kits whose signatures don't match
your trusted signers. Configure [kit.trustedSigners](#kittrustedsigners) first,
then require signatures:
@y
Turn this on to reject unsigned kits and kits whose signatures don't match
your trusted signers. Configure [kit.trustedSigners](#kittrustedsigners) first,
then require signatures:
@z

@x
```console
$ sbx settings set kit.requireSignature true
```
@y
```console
$ sbx settings set kit.requireSignature true
```
@z

@x
The check applies when installing kits from local directories, Git, or OCI
registries. ZIP kits can't carry verifiable signatures and are rejected.
Pinned agent kits remain exempt while
[kit.allowExtractedAgents](#kitallowextractedagents) is `true`.
@y
The check applies when installing kits from local directories, Git, or OCI
registries. ZIP kits can't carry verifiable signatures and are rejected.
Pinned agent kits remain exempt while
[kit.allowExtractedAgents](#kitallowextractedagents) is `true`.
@z

@x
A signature covers the kit's `spec.yaml` and `files/` content. It doesn't pin
image tags or verify downloads performed by the kit's commands. See
[sign and verify kits](../customize/kits-v2.md#sign-and-verify-kits).
@y
A signature covers the kit's `spec.yaml` and `files/` content. It doesn't pin
image tags or verify downloads performed by the kit's commands. See
[sign and verify kits](../customize/kits-v2.md#sign-and-verify-kits).
@z

@x
#### kit.trustedSigners {.wrap-anywhere}
@y
#### kit.trustedSigners {.wrap-anywhere}
@z

@x
{{< setting-metadata type="JSON" default="Docker employee identities"
  env="DOCKER_SANDBOXES_KIT_TRUSTED_SIGNERS" >}}
@y
{{< setting-metadata type="JSON" default="Docker employee identities"
  env="DOCKER_SANDBOXES_KIT_TRUSTED_SIGNERS" >}}
@z

@x
Set the identities or public keys whose kit signatures you trust. The value is
a JSON array. Each entry describes either a keyless signer or a public key, and
a signature can match any entry.
@y
Set the identities or public keys whose kit signatures you trust. The value is
a JSON array. Each entry describes either a keyless signer or a public key, and
a signature can match any entry.
@z

@x
For a keyless signer, specify both the identity and its OpenID Connect issuer:
@y
For a keyless signer, specify both the identity and its OpenID Connect issuer:
@z

@x
```console
$ sbx settings set kit.trustedSigners \
    '[{"identity":"release-bot@example.com","issuer":"https://accounts.google.com"}]'
```
@y
```console
$ sbx settings set kit.trustedSigners \
    '[{"identity":"release-bot@example.com","issuer":"https://accounts.google.com"}]'
```
@z

@x
For a public key:
@y
For a public key:
@z

@x
```console
$ sbx settings set kit.trustedSigners '[{"key":"/path/to/cosign.pub"}]'
```
@y
```console
$ sbx settings set kit.trustedSigners '[{"key":"/path/to/cosign.pub"}]'
```
@z

@x
Each command replaces the whole list. To trust both, include both objects in
one array. The default policy trusts Docker employee identities ending in
`@docker.com`, attested by Google's issuer. Setting trusted signers alone
doesn't require signatures: also enable
[kit.requireSignature](#kitrequiresignature).
@y
Each command replaces the whole list. To trust both, include both objects in
one array. The default policy trusts Docker employee identities ending in
`@docker.com`, attested by Google's issuer. Setting trusted signers alone
doesn't require signatures: also enable
[kit.requireSignature](#kitrequiresignature).
@z

@x
#### kit.ignoreTransparencyLog {.wrap-anywhere}
@y
#### kit.ignoreTransparencyLog {.wrap-anywhere}
@z

@x
{{< setting-metadata type="boolean" default="false"
  env="DOCKER_SANDBOXES_KIT_IGNORE_TLOG" >}}
@y
{{< setting-metadata type="boolean" default="false"
  env="DOCKER_SANDBOXES_KIT_IGNORE_TLOG" >}}
@z

@x
Use this for private kits whose keyless signatures were created with
`--tlog-upload=false`, so verification doesn't require a public Rekor
transparency log entry:
@y
Use this for private kits whose keyless signatures were created with
`--tlog-upload=false`, so verification doesn't require a public Rekor
transparency log entry:
@z

@x
```console
$ sbx settings set kit.ignoreTransparencyLog true
```
@y
```console
$ sbx settings set kit.ignoreTransparencyLog true
```
@z

@x
Signature and signer verification still apply. These signatures must provide a
timestamp from a timestamp authority instead of a transparency log timestamp.
Leave this at `false` when your signing workflow uses the public transparency
log. It has no effect on signatures verified with a public key.
@y
Signature and signer verification still apply. These signatures must provide a
timestamp from a timestamp authority instead of a transparency log timestamp.
Leave this at `false` when your signing workflow uses the public transparency
log. It has no effect on signatures verified with a public key.
@z

@x
### MCP gateway
@y
### MCP gateway
@z

@x
#### mcp.forceLocalGateway {.wrap-anywhere}
@y
#### mcp.forceLocalGateway {.wrap-anywhere}
@z

@x
{{< setting-metadata type="boolean" default="false" >}}
@y
{{< setting-metadata type="boolean" default="false" >}}
@z

@x
Set this to `true` to use the local MCP gateway when your account would
otherwise use the SaaS gateway:
@y
Set this to `true` to use the local MCP gateway when your account would
otherwise use the SaaS gateway:
@z

@x
```console
$ sbx settings set mcp.forceLocalGateway true
$ sbx daemon restart
```
@y
```console
$ sbx settings set mcp.forceLocalGateway true
$ sbx daemon restart
```
@z

@x
The daemon caches its gateway selection, so a restart is required after changing
this setting. It doesn't override a gateway selected by organization governance.
Set it back to `false` and restart to return to automatic selection. See
[MCP gateway](../mcp-gateway.md) for server registration and agent setup.
@y
The daemon caches its gateway selection, so a restart is required after changing
this setting. It doesn't override a gateway selected by organization governance.
Set it back to `false` and restart to return to automatic selection. See
[MCP gateway](../mcp-gateway.md) for server registration and agent setup.
@z

@x
### Diagnostics
@y
### Diagnostics
@z

@x
#### diagnostics.autoUpload {.wrap-anywhere}
@y
#### diagnostics.autoUpload {.wrap-anywhere}
@z

@x
{{< setting-metadata type="string" default="Empty string" >}}
@y
{{< setting-metadata type="string" default="Empty string" >}}
@z

@x
Choose whether Docker Sandboxes may automatically upload diagnostic bundles
after eligible daemon errors:
@y
Choose whether Docker Sandboxes may automatically upload diagnostic bundles
after eligible daemon errors:
@z

@x
- `yes`: Consent to automatic uploads.
- `no`: Decline automatic uploads and suppress further consent prompts.
- Empty string: No recorded decision. Docker Sandboxes may prompt for consent,
  but doesn't automatically upload without it.
@y
- `yes`: Consent to automatic uploads.
- `no`: Decline automatic uploads and suppress further consent prompts.
- Empty string: No recorded decision. Docker Sandboxes may prompt for consent,
  but doesn't automatically upload without it.
@z

@x
For example, decline automatic uploads:
@y
For example, decline automatic uploads:
@z

@x
```console
$ sbx settings set diagnostics.autoUpload no
```
@y
```console
$ sbx settings set diagnostics.autoUpload no
```
@z

@x
Use `sbx settings unset diagnostics.autoUpload` to clear the decision. Read
[automatic diagnostics uploads](../troubleshooting.md#enable-automatic-diagnostics-uploads)
for what bundles contain before opting in. This controls automatic uploads,
not an explicit `sbx diagnose --upload` request.
@y
Use `sbx settings unset diagnostics.autoUpload` to clear the decision. Read
[automatic diagnostics uploads](../troubleshooting.md#enable-automatic-diagnostics-uploads)
for what bundles contain before opting in. This controls automatic uploads,
not an explicit `sbx diagnose --upload` request.
@z

@x
#### diagnostics.autoUploadErrorCooldownInDays {.wrap-anywhere}
@y
#### diagnostics.autoUploadErrorCooldownInDays {.wrap-anywhere}
@z

@x
{{< setting-metadata type="integer" default="1" >}}
@y
{{< setting-metadata type="integer" default="1" >}}
@z

@x
Increase this value to upload automatic diagnostic bundles less frequently.
For example, allow at most one automatic upload per seven days:
@y
Increase this value to upload automatic diagnostic bundles less frequently.
For example, allow at most one automatic upload per seven days:
@z

@x
```console
$ sbx settings set diagnostics.autoUploadErrorCooldownInDays 7
```
@y
```console
$ sbx settings set diagnostics.autoUploadErrorCooldownInDays 7
```
@z

@x
The cooldown applies across all eligible errors, not separately to each error
type. Values below one are treated as one day. This setting doesn't grant
upload consent: [diagnostics.autoUpload](#diagnosticsautoupload) must be `yes`.
@y
The cooldown applies across all eligible errors, not separately to each error
type. Values below one are treated as one day. This setting doesn't grant
upload consent: [diagnostics.autoUpload](#diagnosticsautoupload) must be `yes`.
@z

@x
### Upstream proxies and TLS
@y
### Upstream proxies and TLS
@z

@x
Upstream proxy support is experimental. Use these settings to control how
outbound traffic reaches the network. See [upstream proxies](upstream-proxy.md)
for setup and [when changes take effect](upstream-proxy.md#when-changes-take-effect).
@y
Upstream proxy support is experimental. Use these settings to control how
outbound traffic reaches the network. See [upstream proxies](upstream-proxy.md)
for setup and [when changes take effect](upstream-proxy.md#when-changes-take-effect).
@z

@x
The standard `HTTP_PROXY`, `HTTPS_PROXY`, and `NO_PROXY` variables and their
lowercase forms are fallbacks for proxy selection, not direct overrides of the
`proxy` and `no_proxy` settings.
@y
The standard `HTTP_PROXY`, `HTTPS_PROXY`, and `NO_PROXY` variables and their
lowercase forms are fallbacks for proxy selection, not direct overrides of the
`proxy` and `no_proxy` settings.
@z

@x
#### proxy {.wrap-anywhere}
@y
#### proxy {.wrap-anywhere}
@z

@x
{{< setting-metadata type="string" default="Empty string" >}}
@y
{{< setting-metadata type="string" default="Empty string" >}}
@z

@x
Set a shared upstream proxy when both sandbox traffic and host-side Docker
Sandboxes traffic should pass through it:
@y
Set a shared upstream proxy when both sandbox traffic and host-side Docker
Sandboxes traffic should pass through it:
@z

@x
```console
$ sbx settings set proxy http://proxy.corp:3128
$ sbx daemon restart
```
@y
```console
$ sbx settings set proxy http://proxy.corp:3128
$ sbx daemon restart
```
@z

@x
The value can be an HTTP, HTTPS, or SOCKS5 proxy URL, a PAC source, `system` to
use the operating system's proxy, or `direct` to bypass upstream proxies. An
empty value falls back to the standard proxy environment variables and then the
operating system's proxy settings.
@y
The value can be an HTTP, HTTPS, or SOCKS5 proxy URL, a PAC source, `system` to
use the operating system's proxy, or `direct` to bypass upstream proxies. An
empty value falls back to the standard proxy environment variables and then the
operating system's proxy settings.
@z

@x
The scope-specific settings below take precedence over this shared value.
See [proxy value formats](upstream-proxy.md#set-a-proxy-manually) and
[proxy precedence](upstream-proxy.md#precedence).
@y
The scope-specific settings below take precedence over this shared value.
See [proxy value formats](upstream-proxy.md#set-a-proxy-manually) and
[proxy precedence](upstream-proxy.md#precedence).
@z

@x
#### proxy.sandbox {.wrap-anywhere}
@y
#### proxy.sandbox {.wrap-anywhere}
@z

@x
{{< setting-metadata type="string" default="Empty string"
  env="DOCKER_SANDBOXES_PROXY" >}}
@y
{{< setting-metadata type="string" default="Empty string"
  env="DOCKER_SANDBOXES_PROXY" >}}
@z

@x
Use this when traffic from inside sandboxes needs a different route from the
daemon and CLI. For example, send sandbox traffic through a SOCKS5 proxy:
@y
Use this when traffic from inside sandboxes needs a different route from the
daemon and CLI. For example, send sandbox traffic through a SOCKS5 proxy:
@z

@x
```console
$ sbx settings set proxy.sandbox socks5h://proxy.corp:1080
$ sbx daemon restart
```
@y
```console
$ sbx settings set proxy.sandbox socks5h://proxy.corp:1080
$ sbx daemon restart
```
@z

@x
With `socks5h://`, the proxy resolves destination names. Use `direct` to bypass
the shared proxy for sandbox traffic, or unset this setting to inherit `proxy`.
It doesn't affect daemon traffic. Sandboxes created after the change use the
updated value; existing sandbox proxies require a daemon restart.
@y
With `socks5h://`, the proxy resolves destination names. Use `direct` to bypass
the shared proxy for sandbox traffic, or unset this setting to inherit `proxy`.
It doesn't affect daemon traffic. Sandboxes created after the change use the
updated value; existing sandbox proxies require a daemon restart.
@z

@x
#### proxy.daemon {.wrap-anywhere}
@y
#### proxy.daemon {.wrap-anywhere}
@z

@x
{{< setting-metadata type="string" default="Empty string" >}}
@y
{{< setting-metadata type="string" default="Empty string" >}}
@z

@x
Use this to route the daemon's requests, such as image pulls, separately from
sandbox traffic. Supported host CLI requests, including `sbx login` and
`sbx diagnose --upload`, also use this scope.
@y
Use this to route the daemon's requests, such as image pulls, separately from
sandbox traffic. Supported host CLI requests, including `sbx login` and
`sbx diagnose --upload`, also use this scope.
@z

@x
For example, keep a shared proxy for sandbox traffic while letting the daemon
connect directly:
@y
For example, keep a shared proxy for sandbox traffic while letting the daemon
connect directly:
@z

@x
```console
$ sbx settings set proxy.daemon direct
$ sbx daemon restart
```
@y
```console
$ sbx settings set proxy.daemon direct
$ sbx daemon restart
```
@z

@x
Unset this setting to inherit `proxy`. Supported CLI requests use changes on
the next invocation; the daemon's own requests require a restart.
@y
Unset this setting to inherit `proxy`. Supported CLI requests use changes on
the next invocation; the daemon's own requests require a restart.
@z

@x
#### no_proxy {.wrap-anywhere}
@y
#### no_proxy {.wrap-anywhere}
@z

@x
{{< setting-metadata type="string" default="Empty string" >}}
@y
{{< setting-metadata type="string" default="Empty string" >}}
@z

@x
List destinations that should bypass the selected upstream proxy. Use a
comma-separated string of hosts, domain suffixes, IP addresses, or CIDR ranges:
@y
List destinations that should bypass the selected upstream proxy. Use a
comma-separated string of hosts, domain suffixes, IP addresses, or CIDR ranges:
@z

@x
```console
$ sbx settings set no_proxy "registry.internal,10.0.0.0/8"
$ sbx daemon restart
```
@y
```console
$ sbx settings set no_proxy "registry.internal,10.0.0.0/8"
$ sbx daemon restart
```
@z

@x
This shared list applies to sandbox and daemon traffic unless a scope-specific
list replaces it. A value of `*` bypasses the upstream proxy for all destinations.
Proxy exclusions don't grant network access: sandbox requests must still pass
[network policy](../governance/access-controls/network.md).
@y
This shared list applies to sandbox and daemon traffic unless a scope-specific
list replaces it. A value of `*` bypasses the upstream proxy for all destinations.
Proxy exclusions don't grant network access: sandbox requests must still pass
[network policy](../governance/access-controls/network.md).
@z

@x
#### no_proxy.sandbox {.wrap-anywhere}
@y
#### no_proxy.sandbox {.wrap-anywhere}
@z

@x
{{< setting-metadata type="string" default="Empty string"
  env="DOCKER_SANDBOXES_NO_PROXY" >}}
@y
{{< setting-metadata type="string" default="Empty string"
  env="DOCKER_SANDBOXES_NO_PROXY" >}}
@z

@x
Use this when only sandbox traffic should bypass the upstream proxy for a set
of destinations. For example, connect directly to cluster services:
@y
Use this when only sandbox traffic should bypass the upstream proxy for a set
of destinations. For example, connect directly to cluster services:
@z

@x
```console
$ sbx settings set no_proxy.sandbox "*.svc.cluster.local"
$ sbx daemon restart
```
@y
```console
$ sbx settings set no_proxy.sandbox "*.svc.cluster.local"
$ sbx daemon restart
```
@z

@x
A non-empty value replaces the shared `no_proxy` list for sandbox traffic; it
doesn't append to it. Include any shared exclusions that sandboxes still need.
Unset it to inherit `no_proxy` again. Existing sandbox proxies require a daemon
restart.
@y
A non-empty value replaces the shared `no_proxy` list for sandbox traffic; it
doesn't append to it. Include any shared exclusions that sandboxes still need.
Unset it to inherit `no_proxy` again. Existing sandbox proxies require a daemon
restart.
@z

@x
#### no_proxy.daemon {.wrap-anywhere}
@y
#### no_proxy.daemon {.wrap-anywhere}
@z

@x
{{< setting-metadata type="string" default="Empty string" >}}
@y
{{< setting-metadata type="string" default="Empty string" >}}
@z

@x
Use this when the daemon and supported CLI requests need different proxy
exclusions from sandbox traffic. For example, pull images directly from an
internal registry:
@y
Use this when the daemon and supported CLI requests need different proxy
exclusions from sandbox traffic. For example, pull images directly from an
internal registry:
@z

@x
```console
$ sbx settings set no_proxy.daemon "registry.internal"
$ sbx daemon restart
```
@y
```console
$ sbx settings set no_proxy.daemon "registry.internal"
$ sbx daemon restart
```
@z

@x
A non-empty value replaces the shared `no_proxy` list for this scope. It doesn't
change sandbox exclusions. Unset it to inherit `no_proxy` again. Supported CLI
requests use changes on the next invocation; daemon requests require a restart.
@y
A non-empty value replaces the shared `no_proxy` list for this scope. It doesn't
change sandbox exclusions. Unset it to inherit `no_proxy` again. Supported CLI
requests use changes on the next invocation; daemon requests require a restart.
@z

@x
#### proxy.integratedAuth {.wrap-anywhere}
@y
#### proxy.integratedAuth {.wrap-anywhere}
@z

@x
{{< setting-metadata type="boolean" default="false" >}}
@y
{{< setting-metadata type="boolean" default="false" >}}
@z

@x
Turn this on when a corporate proxy requires NTLM or Kerberos authentication
using your Windows sign-in identity:
@y
Turn this on when a corporate proxy requires NTLM or Kerberos authentication
using your Windows sign-in identity:
@z

@x
```console
$ sbx settings set proxy.integratedAuth true
$ sbx daemon restart
```
@y
```console
$ sbx settings set proxy.integratedAuth true
$ sbx daemon restart
```
@z

@x
It applies to both sandbox and daemon proxy traffic. Authentication happens on
the host, so the Windows credentials don't enter the sandbox. It has no effect
on macOS or Linux. For cross-platform authentication with credentials in a
proxy URL, see [proxy authentication](upstream-proxy.md#authentication).
@y
It applies to both sandbox and daemon proxy traffic. Authentication happens on
the host, so the Windows credentials don't enter the sandbox. It has no effect
on macOS or Linux. For cross-platform authentication with credentials in a
proxy URL, see [proxy authentication](upstream-proxy.md#authentication).
@z

@x
#### tls.allowNegativeSerial {.wrap-anywhere}
@y
#### tls.allowNegativeSerial {.wrap-anywhere}
@z

@x
{{< setting-metadata type="boolean" default="false"
  env="DOCKER_SANDBOXES_TLS_ALLOW_NEGATIVE_SERIAL" >}}
@y
{{< setting-metadata type="boolean" default="false"
  env="DOCKER_SANDBOXES_TLS_ALLOW_NEGATIVE_SERIAL" >}}
@z

@x
Use this compatibility setting when HTTPS requests fail with
`x509: negative serial number` because a TLS-inspecting proxy issues
certificates with negative serial numbers:
@y
Use this compatibility setting when HTTPS requests fail with
`x509: negative serial number` because a TLS-inspecting proxy issues
certificates with negative serial numbers:
@z

@x
```console
$ sbx settings set tls.allowNegativeSerial true
$ sbx daemon restart
```
@y
```console
$ sbx settings set tls.allowNegativeSerial true
$ sbx daemon restart
```
@z

@x
It relaxes certificate validation to accept those serial numbers. It doesn't
make an untrusted certificate authority trusted or resolve other certificate
errors. For an untrusted internal CA, see
[certificate troubleshooting](../troubleshooting.md#api-calls-fail-with-a-certificate-error).
@y
It relaxes certificate validation to accept those serial numbers. It doesn't
make an untrusted certificate authority trusted or resolve other certificate
errors. For an untrusted internal CA, see
[certificate troubleshooting](../troubleshooting.md#api-calls-fail-with-a-certificate-error).
@z

@x
### Shared agent skills
@y
### Shared agent skills
@z

@x
Shared agent skills are experimental.
@y
Shared agent skills are experimental.
@z

@x
#### skills.defaultMode {.wrap-anywhere}
@y
#### skills.defaultMode {.wrap-anywhere}
@z

@x
{{< setting-metadata type="string" default="readonly" >}}
@y
{{< setting-metadata type="string" default="readonly" >}}
@z

@x
Choose how future sandboxes use the shared agent skills store when you omit
`--skills`:
@y
Choose how future sandboxes use the shared agent skills store when you omit
`--skills`:
@z

@x
- `readonly`: Agents can read shared skills but can't change the store.
- `readwrite`: Agents can read and modify skills used by other sandboxes.
- `off`: Don't mount the shared store.
@y
- `readonly`: Agents can read shared skills but can't change the store.
- `readwrite`: Agents can read and modify skills used by other sandboxes.
- `off`: Don't mount the shared store.
@z

@x
For example, omit the shared store by default:
@y
For example, omit the shared store by default:
@z

@x
```console
$ sbx settings set skills.defaultMode off
```
@y
```console
$ sbx settings set skills.defaultMode off
```
@z

@x
An explicit `--skills` value or environment-file `skills` value overrides this
default. Existing sandboxes retain their mounts: recreate them to change their
access mode. See [share agent skills](../workflows/agent-skills.md) for setup
and the consequences of sharing a writable store.
@y
An explicit `--skills` value or environment-file `skills` value overrides this
default. Existing sandboxes retain their mounts: recreate them to change their
access mode. See [share agent skills](../workflows/agent-skills.md) for setup
and the consequences of sharing a writable store.
@z

@x
## Command reference
@y
## Command reference
@z

@x
### sbx settings list
@y
### sbx settings list
@z

@x
List settings. Alias: `sbx settings ls`.
@y
List settings. Alias: `sbx settings ls`.
@z

@x
Use `--json` for complete records as JSON, or `--no-trunc` for full text. These
options are mutually exclusive.
@y
Use `--json` for complete records as JSON, or `--no-trunc` for full text. These
options are mutually exclusive.
@z

@x
### sbx settings get \<KEY\>
@y
### sbx settings get \<KEY\>
@z

@x
Print one effective value.
@y
Print one effective value.
@z

@x
Use `--json` for the complete setting record.
@y
Use `--json` for the complete setting record.
@z

@x
### sbx settings set \<KEY\> \<VALUE\>
@y
### sbx settings set \<KEY\> \<VALUE\>
@z

@x
Write a user override.
@y
Write a user override.
@z

@x
Values are parsed as `bool`, `int`, `float`, `string`, or `json`, according to
the setting's type.
@y
Values are parsed as `bool`, `int`, `float`, `string`, or `json`, according to
the setting's type.
@z

@x
### sbx settings unset \<KEY\>
@y
### sbx settings unset \<KEY\>
@z

@x
Remove a user override.
@y
Remove a user override.
@z

@x
Use `sbx settings <COMMAND> --help` for command help.
@y
Use `sbx settings <COMMAND> --help` for command help.
@z
