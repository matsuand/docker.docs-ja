%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Debugging build policies
linkTitle: Debugging
description: Debug policies during development with inspection and testing tools
keywords: build policies, debugging, policy troubleshooting, log-level, policy eval, rego debugging
@y
title: Debugging build policies
linkTitle: Debugging
description: Debug policies during development with inspection and testing tools
keywords: build policies, debugging, policy troubleshooting, log-level, policy eval, rego debugging
@z

@x
When policies don't work as expected, use the tools available to inspect policy
evaluation and understand what's happening. This guide covers the debugging
techniques and common gotchas.
@y
When policies don't work as expected, use the tools available to inspect policy
evaluation and understand what's happening. This guide covers the debugging
techniques and common gotchas.
@z

@x
## Quick reference
@y
## Quick reference
@z

@x
Essential debugging commands:
@y
Essential debugging commands:
@z

@x
```console
# See complete input data during builds (recommended)
$ docker buildx build --progress=plain --policy log-level=debug .
@y
```console
# See complete input data during builds (recommended)
$ docker buildx build --progress=plain --policy log-level=debug .
@z

@x
# See policy checks and decisions
$ docker buildx build --progress=plain .
@y
# See policy checks and decisions
$ docker buildx build --progress=plain .
@z

@x
# Explore input structure for different sources
$ docker buildx policy eval --print .
$ docker buildx policy eval --print https://github.com/org/repo.git
$ docker buildx policy eval --print docker-image://alpine:3.19
@y
# Explore input structure for different sources
$ docker buildx policy eval --print .
$ docker buildx policy eval --print https://github.com/org/repo.git
$ docker buildx policy eval --print docker-image://alpine:3.19
@z

@x
# Test if policy allows a source
$ docker buildx policy eval .
```
@y
# Test if policy allows a source
$ docker buildx policy eval .
```
@z

@x
## Policy output with `--progress=plain`
@y
## Policy output with `--progress=plain`
@z

@x
To see policy evaluation during builds, use `--progress=plain`:
@y
To see policy evaluation during builds, use `--progress=plain`:
@z

@x
```console
$ docker buildx build --progress=plain .
```
@y
```console
$ docker buildx build --progress=plain .
```
@z

@x
This shows all policy checks, decisions, and `print()` output. Without
`--progress=plain`, policy evaluation is silent unless there's an error.
@y
This shows all policy checks, decisions, and `print()` output. Without
`--progress=plain`, policy evaluation is silent unless there's an error.
@z

@x
```plaintext
#1 loading policies Dockerfile.rego
#1 0.010 checking policy for source docker-image://alpine:3.19 (linux/arm64)
#1 0.011 Dockerfile.rego:8: image: {"ref":"alpine:3.19","repo":"alpine","tag":"3.19"}
#1 0.012 policy decision for source docker-image://alpine:3.19: ALLOW
```
@y
```plaintext
#1 loading policies Dockerfile.rego
#1 0.010 checking policy for source docker-image://alpine:3.19 (linux/arm64)
#1 0.011 Dockerfile.rego:8: image: {"ref":"alpine:3.19","repo":"alpine","tag":"3.19"}
#1 0.012 policy decision for source docker-image://alpine:3.19: ALLOW
```
@z

@x
If a policy denies a source, you'll see:
@y
If a policy denies a source, you'll see:
@z

@x
```text
#1 0.012 policy decision for source docker-image://nginx:latest: DENY
ERROR: source "docker-image://nginx:latest" not allowed by policy
```
@y
```text
#1 0.012 policy decision for source docker-image://nginx:latest: DENY
ERROR: source "docker-image://nginx:latest" not allowed by policy
```
@z

@x
## Debug logging
@y
## Debug logging
@z

@x
For detailed debugging, add `--policy log-level=debug` to see the full input
JSON, unresolved fields, and policy responses:
@y
For detailed debugging, add `--policy log-level=debug` to see the full input
JSON, unresolved fields, and policy responses:
@z

@x
```console
$ docker buildx build --progress=plain --policy log-level=debug .
```
@y
```console
$ docker buildx build --progress=plain --policy log-level=debug .
```
@z

@x
This shows significantly more information than the default level, including the
complete input structure for each source without needing `print()` statements
in your policy.
@y
This shows significantly more information than the default level, including the
complete input structure for each source without needing `print()` statements
in your policy.
@z

@x
Complete input JSON:
@y
Complete input JSON:
@z

@x
```text
#1 0.007 policy input: {
#1 0.007   "env": {
#1 0.007     "filename": "."
#1 0.007   },
#1 0.007   "image": {
#1 0.007     "ref": "docker.io/library/alpine:3.19",
#1 0.007     "host": "docker.io",
#1 0.007     "repo": "alpine",
#1 0.007     "fullRepo": "docker.io/library/alpine",
#1 0.007     "tag": "3.19",
#1 0.007     "platform": "linux/arm64",
#1 0.007     "os": "linux",
#1 0.007     "arch": "arm64"
#1 0.007   }
#1 0.007 }
```
@y
```text
#1 0.007 policy input: {
#1 0.007   "env": {
#1 0.007     "filename": "."
#1 0.007   },
#1 0.007   "image": {
#1 0.007     "ref": "docker.io/library/alpine:3.19",
#1 0.007     "host": "docker.io",
#1 0.007     "repo": "alpine",
#1 0.007     "fullRepo": "docker.io/library/alpine",
#1 0.007     "tag": "3.19",
#1 0.007     "platform": "linux/arm64",
#1 0.007     "os": "linux",
#1 0.007     "arch": "arm64"
#1 0.007   }
#1 0.007 }
```
@z

@x
Unresolved fields:
@y
Unresolved fields:
@z

@x
```text
#1 0.007 unknowns for policy evaluation: [input.image.checksum input.image.labels input.image.user input.image.volumes input.image.workingDir input.image.env input.image.hasProvenance input.image.signatures]
```
@y
```text
#1 0.007 unknowns for policy evaluation: [input.image.checksum input.image.labels input.image.user input.image.volumes input.image.workingDir input.image.env input.image.hasProvenance input.image.signatures]
```
@z

@x
Policy response:
@y
Policy response:
@z

@x
```text
#1 0.008 policy response: map[allow:true]
```
@y
```text
#1 0.008 policy response: map[allow:true]
```
@z

@x
This detailed output is invaluable for understanding exactly what data your
policy receives and which fields are not yet resolved. Use debug logging when
developing policies to avoid needing extensive `print()` statements.
@y
This detailed output is invaluable for understanding exactly what data your
policy receives and which fields are not yet resolved. Use debug logging when
developing policies to avoid needing extensive `print()` statements.
@z

@x
## Conditional debugging with print()
@y
## Conditional debugging with print()
@z

@x
While `--policy log-level=debug` shows all input data automatically, the
`print()` function is useful for debugging specific rule logic and conditional
flows:
@y
While `--policy log-level=debug` shows all input data automatically, the
`print()` function is useful for debugging specific rule logic and conditional
flows:
@z

@x
```rego
allow if {
    input.image
    print("Checking image:", input.image.repo, "isCanonical:", input.image.isCanonical)
    input.image.repo == "alpine"
    input.image.isCanonical
}
```
@y
```rego
allow if {
    input.image
    print("Checking image:", input.image.repo, "isCanonical:", input.image.isCanonical)
    input.image.repo == "alpine"
    input.image.isCanonical
}
```
@z

@x
Use `print()` to debug conditional logic within rules or track which rules are
evaluating. For general input inspection during development, use `--policy
log-level=debug` instead - it requires no policy modifications.
@y
Use `print()` to debug conditional logic within rules or track which rules are
evaluating. For general input inspection during development, use `--policy
log-level=debug` instead - it requires no policy modifications.
@z

@x
> [!NOTE]
> Print statements only execute when their containing rule evaluates. A rule
> like `allow if { input.image; print(...) }` only prints for image inputs,
> not for Git repos, HTTP downloads, or local files.
@y
> [!NOTE]
> Print statements only execute when their containing rule evaluates. A rule
> like `allow if { input.image; print(...) }` only prints for image inputs,
> not for Git repos, HTTP downloads, or local files.
@z

@x
## Common issues
@y
## Common issues
@z

@x
### Full repository path or repository name
@y
### Full repository path or repository name
@z

@x
Symptom: Policy checking repository names doesn't match as expected.
@y
Symptom: Policy checking repository names doesn't match as expected.
@z

@x
Cause: Docker Hub images use `input.image.repo` for the short name
(`"alpine"`) but `input.image.fullRepo` includes the full path
(`"docker.io/library/alpine"`).
@y
Cause: Docker Hub images use `input.image.repo` for the short name
(`"alpine"`) but `input.image.fullRepo` includes the full path
(`"docker.io/library/alpine"`).
@z

@x
Solution:
@y
Solution:
@z

@x
```rego
# Match just the repo name (works for Docker Hub and other registries)
allow if {
    input.image
    input.image.repo == "alpine"
}
@y
```rego
# Match just the repo name (works for Docker Hub and other registries)
allow if {
    input.image
    input.image.repo == "alpine"
}
@z

@x
# Or match the full repository path
allow if {
    input.image
    input.image.fullRepo == "docker.io/library/alpine"
}
```
@y
# Or match the full repository path
allow if {
    input.image
    input.image.fullRepo == "docker.io/library/alpine"
}
```
@z

@x
### Policy evaluation happens multiple times
@y
### Policy evaluation happens multiple times
@z

@x
Symptom: Build output shows the same source evaluated multiple times.
@y
Symptom: Build output shows the same source evaluated multiple times.
@z

@x
Cause: BuildKit may evaluate policies at different stages (reference
resolution, actual pull) or for different platforms.
@y
Cause: BuildKit may evaluate policies at different stages (reference
resolution, actual pull) or for different platforms.
@z

@x
This is normal behavior. Policies should be idempotent (produce same result
each time for the same input).
@y
This is normal behavior. Policies should be idempotent (produce same result
each time for the same input).
@z

@x
### Fields missing with `policy eval --print`
@y
### Fields missing with `policy eval --print`
@z

@x
Symptom: `docker buildx policy eval --print` doesn't show expected fields
like `hasProvenance`, `labels`, or `checksum`.
@y
Symptom: `docker buildx policy eval --print` doesn't show expected fields
like `hasProvenance`, `labels`, or `checksum`.
@z

@x
Cause: `--print` shows only reference information by default, without
fetching from registries.
@y
Cause: `--print` shows only reference information by default, without
fetching from registries.
@z

@x
Solution: Use `--fields` to fetch specific metadata fields:
@y
Solution: Use `--fields` to fetch specific metadata fields:
@z

@x
```console
$ docker buildx policy eval --print --fields image.labels docker-image://alpine:3.19
```
@y
```console
$ docker buildx policy eval --print --fields image.labels docker-image://alpine:3.19
```
@z

@x
See [Using build policies](./usage.md#testing-policies-with-policy-eval) for
details.
@y
See [Using build policies](./usage.md#testing-policies-with-policy-eval) for
details.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- See complete field reference: [Input reference](./inputs.md)
- Review example policies: [Examples](./examples.md)
- Learn policy usage patterns: [Using build policies](./usage.md)
@y
- See complete field reference: [Input reference](./inputs.md)
- Review example policies: [Examples](./examples.md)
- Learn policy usage patterns: [Using build policies](./usage.md)
@z
