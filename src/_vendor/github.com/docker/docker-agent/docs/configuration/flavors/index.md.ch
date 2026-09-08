%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Flavors"
description: "Ship one agent file with named variants, enabled at run time as YAML patches."
keywords: docker agent, ai agents, configuration, yaml, flavors, patch, variants, overrides
@y
title: "Flavors"
description: "Ship one agent file with named variants, enabled at run time as YAML patches."
keywords: docker agent, ai agents, configuration, yaml, flavors, patch, variants, overrides
@z

@x
canonical: https://docs.docker.com/ai/docker-agent/configuration/flavors/
@y
canonical: __SUBDIR__/ai/docker-agent/configuration/flavors/
@z

@x
_Ship one agent file with named variants, enabled at run time as YAML patches._
@y
_Ship one agent file with named variants, enabled at run time as YAML patches._
@z

@x
## Overview
@y
## Overview
@z

@x
A flavor is a named YAML patch declared in the agent file itself, under the
top-level `flavors` section. Enabling a flavor applies its patch on top of the
rest of the document before the config is parsed, so one file can carry
several variants — a cheaper model for local runs, extra tools for CI, a more
verbose instruction for debugging — without duplicating the whole config.
@y
A flavor is a named YAML patch declared in the agent file itself, under the
top-level `flavors` section. Enabling a flavor applies its patch on top of the
rest of the document before the config is parsed, so one file can carry
several variants — a cheaper model for local runs, extra tools for CI, a more
verbose instruction for debugging — without duplicating the whole config.
@z

@x
```yaml
agents:
  root:
    model: claude
    instruction: You are a helpful assistant.
@y
```yaml
agents:
  root:
    model: claude
    instruction: You are a helpful assistant.
@z

@x
models:
  claude:
    provider: anthropic
    model: claude-sonnet-4-5
@y
models:
  claude:
    provider: anthropic
    model: claude-sonnet-4-5
@z

@x
flavors:
  cheap:
    models:
      claude:
        model: claude-3-5-haiku-latest
```
@y
flavors:
  cheap:
    models:
      claude:
        model: claude-3-5-haiku-latest
```
@z

@x
Enable flavors with the repeatable `--flavor` flag:
@y
Enable flavors with the repeatable `--flavor` flag:
@z

@x
```bash
$ docker agent run agent.yaml --flavor cheap
```
@y
```bash
$ docker agent run agent.yaml --flavor cheap
```
@z

@x
The flag works on every command that runs an agent — `run`, `chat`, `eval`,
`serve api`, `serve a2a`, `serve mcp` — and order matters: patches apply in
the order the flavors are requested, each on top of the previous result.
@y
The flag works on every command that runs an agent — `run`, `chat`, `eval`,
`serve api`, `serve a2a`, `serve mcp` — and order matters: patches apply in
the order the flavors are requested, each on top of the previous result.
@z

@x
```bash
$ docker agent run agent.yaml --flavor cheap --flavor verbose
```
@y
```bash
$ docker agent run agent.yaml --flavor cheap --flavor verbose
```
@z

@x
Flavors the file does not define are ignored (with a debug log), so you can
enable the same flavor set across a fleet of agents and each file only reacts
to the names it declares. External sub-agents loaded from OCI or URL
references receive the same enabled flavors.
@y
Flavors the file does not define are ignored (with a debug log), so you can
enable the same flavor set across a fleet of agents and each file only reacts
to the names it declares. External sub-agents loaded from OCI or URL
references receive the same enabled flavors.
@z

@x
## Merge Semantics
@y
## Merge Semantics
@z

@x
Patches follow [JSON Merge Patch](https://www.rfc-editor.org/rfc/rfc7386)
semantics, with two extensions for arrays:
@y
Patches follow [JSON Merge Patch](https://www.rfc-editor.org/rfc/rfc7386)
semantics, with two extensions for arrays:
@z

@x
| Patch value | Effect |
| --- | --- |
| Object | Merged recursively into the existing object. |
| Scalar or array | Replaces the existing value. |
| `null` | Deletes the key. |
| Key ending in `+` | Appends the items to the existing array. |
| Key ending in `-` | Removes matching entries from an array or object. |
@y
| Patch value | Effect |
| --- | --- |
| Object | Merged recursively into the existing object. |
| Scalar or array | Replaces the existing value. |
| `null` | Deletes the key. |
| Key ending in `+` | Appends the items to the existing array. |
| Key ending in `-` | Removes matching entries from an array or object. |
@z

@x
### Merging and replacing
@y
### Merging and replacing
@z

@x
An object patch only touches the keys it names — siblings survive:
@y
An object patch only touches the keys it names — siblings survive:
@z

@x
```yaml
flavors:
  verbose:
    agents:
      root:
        instruction: Explain your reasoning in detail.  # model, tools, ... unchanged
```
@y
```yaml
flavors:
  verbose:
    agents:
      root:
        instruction: Explain your reasoning in detail.  # model, tools, ... unchanged
```
@z

@x
### Deleting a key
@y
### Deleting a key
@z

@x
Set it to `null`:
@y
Set it to `null`:
@z

@x
```yaml
flavors:
  no-limit:
    models:
      claude:
        max_tokens: null
```
@y
```yaml
flavors:
  no-limit:
    models:
      claude:
        max_tokens: null
```
@z

@x
### Appending to an array
@y
### Appending to an array
@z

@x
Plain arrays replace wholesale. To add entries instead, suffix the key
with `+`:
@y
Plain arrays replace wholesale. To add entries instead, suffix the key
with `+`:
@z

@x
```yaml
agents:
  root:
    toolsets:
      - type: think
@y
```yaml
agents:
  root:
    toolsets:
      - type: think
@z

@x
flavors:
  with-shell:
    agents:
      root:
        toolsets+:
          - type: shell
```
@y
flavors:
  with-shell:
    agents:
      root:
        toolsets+:
          - type: shell
```
@z

@x
With `--flavor with-shell` the root agent gets both `think` and `shell`.
@y
With `--flavor with-shell` the root agent gets both `think` and `shell`.
@z

@x
### Removing entries
@y
### Removing entries
@z

@x
Suffix the key with `-`. Each item in the patch value selects what to remove:
@y
Suffix the key with `-`. Each item in the patch value selects what to remove:
@z

@x
- From an **array**: a scalar removes equal elements; an object removes every
  element it partially matches (all of the matcher's keys must be present
  with matching values).
- From an **object**: items are key names to drop.
@y
- From an **array**: a scalar removes equal elements; an object removes every
  element it partially matches (all of the matcher's keys must be present
  with matching values).
- From an **object**: items are key names to drop.
@z

@x
```yaml
flavors:
  slim:
    agents:
      root:
        toolsets-:
          - type: shell   # drop every shell toolset, however configured
        sub_agents-:
          - checker       # drop by value
    models-:
      - spare             # drop the named model definition
```
@y
```yaml
flavors:
  slim:
    agents:
      root:
        toolsets-:
          - type: shell   # drop every shell toolset, however configured
        sub_agents-:
          - checker       # drop by value
    models-:
      - spare             # drop the named model definition
```
@z

@x
> [!NOTE]
> The `+` and `-` suffixes are reserved inside flavor patches: a patch cannot
> set a literal key ending in either character. Base documents are unaffected.
@y
> [!NOTE]
> The `+` and `-` suffixes are reserved inside flavor patches: a patch cannot
> set a literal key ending in either character. Base documents are unaffected.
@z

@x
## Inspecting the Result
@y
## Inspecting the Result
@z

@x
`docker agent debug config` prints the config exactly as the runtime sees it,
flavors applied:
@y
`docker agent debug config` prints the config exactly as the runtime sees it,
flavors applied:
@z

@x
```bash
$ docker agent debug config agent.yaml --flavor cheap --flavor with-shell
```
@y
```bash
$ docker agent debug config agent.yaml --flavor cheap --flavor with-shell
```
@z

@x
## HCL
@y
## HCL
@z

@x
Flavors work in [HCL configs](../hcl/index.md) too, as labeled blocks. The
append/remove operators need quoted attribute names inside object
expressions:
@y
Flavors work in [HCL configs](../hcl/index.md) too, as labeled blocks. The
append/remove operators need quoted attribute names inside object
expressions:
@z

@x
```hcl
flavors "with-shell" {
  agents = {
    root = {
      "toolsets+" = [{ type = "shell" }]
    }
  }
}
```
@y
```hcl
flavors "with-shell" {
  agents = {
    root = {
      "toolsets+" = [{ type = "shell" }]
    }
  }
}
```
@z

@x
## Notes
@y
## Notes
@z

@x
- Flavors require config schema version 13 or later; older versions reject
  the `flavors` key with a hint to bump the top-level `version` field.
- Patches apply before validation, so a flavored config is validated exactly
  like a hand-written one.
- `docker agent push` publishes the raw document, `flavors` section included,
  so consumers of a pushed agent can enable its flavors too.
@y
- Flavors require config schema version 13 or later; older versions reject
  the `flavors` key with a hint to bump the top-level `version` field.
- Patches apply before validation, so a flavored config is validated exactly
  like a hand-written one.
- `docker agent push` publishes the raw document, `flavors` section included,
  so consumers of a pushed agent can enable its flavors too.
@z
