%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Kit authoring patterns
linkTitle: Authoring patterns
description: Build reusable kits that carry the access their tools need, prepare certificates and storage during setup, and offer useful options to your team.
keywords: sandboxes, sbx, kits, patterns, mixins, lifecycle, certificates
@y
title: Kit authoring patterns
linkTitle: Authoring patterns
description: Build reusable kits that carry the access their tools need, prepare certificates and storage during setup, and offer useful options to your team.
keywords: sandboxes, sbx, kits, patterns, mixins, lifecycle, certificates
@z

@x
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@z

@x
When you package a tool as a kit, aim to make it work wherever you add it.
These patterns show how to include the access it needs, prepare it for each
sandbox, and give your team useful options without asking them to assemble
the environment themselves.
@y
When you package a tool as a kit, aim to make it work wherever you add it.
These patterns show how to include the access it needs, prepare it for each
sandbox, and give your team useful options without asking them to assemble
the environment themselves.
@z

@x
## Keep runtime access with the tool
@y
## Keep runtime access with the tool
@z

@x
Keep a tool's network rules and credential request in the mixin that installs
it. For example, a Claude Code mixin can package the executable, allow access
to the Anthropic API, and request the API key. Those requirements follow the
tool when you add it to another workload.
@y
Keep a tool's network rules and credential request in the mixin that installs
it. For example, a Claude Code mixin can package the executable, allow access
to the Anthropic API, and request the API key. Those requirements follow the
tool when you add it to another workload.
@z

@x
The user still needs to supply the credential and approve access. See
[Build a tool mixin](/manuals/ai/sandboxes/customize/author/tool-mixins.md)
for a complete example.
@y
The user still needs to supply the credential and approve access. See
[Build a tool mixin](manuals/ai/sandboxes/customize/author/tool-mixins.md)
for a complete example.
@z

@x
## Leave build tools out of the mixin
@y
## Leave build tools out of the mixin
@z

@x
Build a tool in one Dockerfile stage, then copy the executable into an empty
stage. Each sandbox gets the tool without also getting its compiler and
source code:
@y
Build a tool in one Dockerfile stage, then copy the executable into an empty
stage. Each sandbox gets the tool without also getting its compiler and
source code:
@z

@x
```yaml {title="gojq/gojq.yaml"}
# syntax=docker/sandbox-kit:3
schemaVersion: "3"
kind: mixin
provides: ["gojq@0.12.17"]
@y
```yaml {title="gojq/gojq.yaml"}
# syntax=docker/sandbox-kit:3
schemaVersion: "3"
kind: mixin
provides: ["gojq@0.12.17"]
@z

@x
build: |
  FROM golang:1.25 AS build
  RUN CGO_ENABLED=0 go install github.com/itchyny/gojq/cmd/gojq@v0.12.17
@y
build: |
  FROM golang:1.25 AS build
  RUN CGO_ENABLED=0 go install github.com/itchyny/gojq/cmd/gojq@v0.12.17
@z

@x
  FROM scratch
  COPY --from=build /go/bin/gojq /usr/local/bin/gojq
```
@y
  FROM scratch
  COPY --from=build /go/bin/gojq /usr/local/bin/gojq
```
@z

@x
`CGO_ENABLED=0` builds gojq without a dependency on the workload's C libraries.
`FROM scratch` starts the final stage empty, so it contains only the binary
you copy. The `provides` entry tells other kits which gojq version this mixin
installs.
@y
`CGO_ENABLED=0` builds gojq without a dependency on the workload's C libraries.
`FROM scratch` starts the final stage empty, so it contains only the binary
you copy. The `provides` entry tells other kits which gojq version this mixin
installs.
@z

@x
## Run setup after combining kits
@y
## Run setup after combining kits
@z

@x
Some setup needs tools or files from the workload. Package what you can in the
mixin, then use an install hook to finish setup once all the kits' files are
in place. For example, bring an internal certificate authority (CA) certificate
in the mixin and register it in the workload's trust store:
@y
Some setup needs tools or files from the workload. Package what you can in the
mixin, then use an install hook to finish setup once all the kits' files are
in place. For example, bring an internal certificate authority (CA) certificate
in the mixin and register it in the workload's trust store:
@z

@x
```yaml {title="internal-ca/internal-ca.yaml"}
# syntax=docker/sandbox-kit:3
schemaVersion: "3"
kind: mixin
@y
```yaml {title="internal-ca/internal-ca.yaml"}
# syntax=docker/sandbox-kit:3
schemaVersion: "3"
kind: mixin
@z

@x
build: |
  FROM scratch
  COPY internal-ca.crt /usr/local/share/ca-certificates/team-internal-ca.crt
@y
build: |
  FROM scratch
  COPY internal-ca.crt /usr/local/share/ca-certificates/team-internal-ca.crt
@z

@x
capabilities:
  - type: com.docker.sandbox/lifecycle@1
    config:
      install:
        - command: update-ca-certificates
          user: "0"
```
@y
capabilities:
  - type: com.docker.sandbox/lifecycle@1
    config:
      install:
        - command: update-ca-certificates
          user: "0"
```
@z

@x
Save your PEM-encoded CA as `internal-ca.crt` beside the descriptor and use the
mixin with a workload that supplies `update-ca-certificates`, such as Docker's
shell kit. The hook updates the workload's trust store as root, after all kit
files are present and before the agent launches.
@y
Save your PEM-encoded CA as `internal-ca.crt` beside the descriptor and use the
mixin with a workload that supplies `update-ca-certificates`, such as Docker's
shell kit. The hook updates the workload's trust store as root, after all kit
files are present and before the agent launches.
@z

@x
```console
$ sbx run docker.io/docker/sbx-kit-shell:1.0.0 --kit ./internal-ca
```
@y
```console
$ sbx run docker.io/docker/sbx-kit-shell:1.0.0 --kit ./internal-ca
```
@z

@x
## Seed storage after it is mounted
@y
## Seed storage after it is mounted
@z

@x
Mounting storage at a path hides any files the image already has there. To
give a tool some initial data, keep that data elsewhere in the image and
copy it to the mounted directory in an install hook. Check whether the
destination file exists first so you preserve any changes the user has made:
@y
Mounting storage at a path hides any files the image already has there. To
give a tool some initial data, keep that data elsewhere in the image and
copy it to the mounted directory in an install hook. Check whether the
destination file exists first so you preserve any changes the user has made:
@z

@x
```yaml {title="tool-state/tool-state.yaml"}
# syntax=docker/sandbox-kit:3
schemaVersion: "3"
kind: mixin
@y
```yaml {title="tool-state/tool-state.yaml"}
# syntax=docker/sandbox-kit:3
schemaVersion: "3"
kind: mixin
@z

@x
build: |
  FROM scratch
  COPY defaults.json /usr/share/company-cli/defaults.json
@y
build: |
  FROM scratch
  COPY defaults.json /usr/share/company-cli/defaults.json
@z

@x
capabilities:
  - type: com.docker.sandbox/volume@1
    config:
      path: /home/agent/.company-cli
      size: 1g
  - type: com.docker.sandbox/lifecycle@1
    config:
      install:
        - command: |
            set -eu
            chown 1000:1000 /home/agent/.company-cli
            if [ ! -e /home/agent/.company-cli/config.json ]; then
              install -o 1000 -g 1000 -m 0644 /usr/share/company-cli/defaults.json /home/agent/.company-cli/config.json
            fi
          user: "0"
```
@y
capabilities:
  - type: com.docker.sandbox/volume@1
    config:
      path: /home/agent/.company-cli
      size: 1g
  - type: com.docker.sandbox/lifecycle@1
    config:
      install:
        - command: |
            set -eu
            chown 1000:1000 /home/agent/.company-cli
            if [ ! -e /home/agent/.company-cli/config.json ]; then
              install -o 1000 -g 1000 -m 0644 /usr/share/company-cli/defaults.json /home/agent/.company-cli/config.json
            fi
          user: "0"
```
@z

@x
Save your tool's initial configuration as `defaults.json` beside the descriptor.
Use a workload with `chown` and `install`, such as Docker's shell kit. The hook
makes the directory and configuration file writable by the agent. If the
volume already has a configuration file, the hook leaves its contents intact.
@y
Save your tool's initial configuration as `defaults.json` beside the descriptor.
Use a workload with `chown` and `install`, such as Docker's shell kit. The hook
makes the directory and configuration file writable by the agent. If the
volume already has a configuration file, the hook leaves its contents intact.
@z

@x
### Configure the volume
@y
### Configure the volume
@z

@x
The volume keeps the tool's data across sandbox restarts. A replacement
sandbox gets its own volume. This example allocates `1g` of space. If you
omit `size`, `sbx` allocates `512m`.
@y
The volume keeps the tool's data across sandbox restarts. A replacement
sandbox gets its own volume. This example allocates `1g` of space. If you
omit `size`, `sbx` allocates `512m`.
@z

@x
Use an install hook to set ownership and permissions for persistent volumes,
as this example does. The volume capability's `mode` setting applies only
to tmpfs mounts. See the upstream
[volume definition](https://github.com/docker/sandbox-kit-spec/blob/main/docs/spec/capabilities/com.docker.sandbox/volume@1.md)
for storage options.
@y
Use an install hook to set ownership and permissions for persistent volumes,
as this example does. The volume capability's `mode` setting applies only
to tmpfs mounts. See the upstream
[volume definition](https://github.com/docker/sandbox-kit-spec/blob/main/docs/spec/capabilities/com.docker.sandbox/volume@1.md)
for storage options.
@z

@x
To copy initial files into a mounted workspace instead, use
`WORKSPACE_DIR` as the destination and
[declare it in the hook's environment](/manuals/ai/sandboxes/customize/author/_index.md#choose-when-setup-runs).
@y
To copy initial files into a mounted workspace instead, use
`WORKSPACE_DIR` as the destination and
[declare it in the hook's environment](manuals/ai/sandboxes/customize/author/_index.md#choose-when-setup-runs).
@z

@x
## Publish fixed components with configurable options
@y
## Publish fixed components with configurable options
@z

@x
Choose compatible agent and tool versions for your team, then publish them
as a set. Expose arguments for settings users can change without replacing
those components, such as a model or linter mode. Keep version choices fixed
in the published images.
@y
Choose compatible agent and tool versions for your team, then publish them
as a set. Expose arguments for settings users can change without replacing
those components, such as a model or linter mode. Keep version choices fixed
in the published images.
@z

@x
For the argument syntax and constraints, see
[Configure component arguments](/manuals/ai/sandboxes/customize/author/kit-sets.md#configure-component-arguments).
@y
For the argument syntax and constraints, see
[Configure component arguments](manuals/ai/sandboxes/customize/author/kit-sets.md#configure-component-arguments).
@z
