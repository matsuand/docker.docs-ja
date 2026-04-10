%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Trust model for Compose files
@y
title: Trust model for Compose files
@z

@x
description: Learn how Docker Compose treats Compose files as trusted input and what this means when using files you did not author.
keywords: compose, security, trust model, oci, remote, registry, include, extends, supply chain, trust, best practices
@y
description: Learn how Docker Compose treats Compose files as trusted input and what this means when using files you did not author.
keywords: compose, security, trust model, oci, remote, registry, include, extends, supply chain, trust, best practices
@z

@x
Docker Compose treats every Compose file as trusted input. When a Compose file
requests elevated privileges, host filesystem access, or any other
configuration, Compose applies it as written. This is the same behavior as
passing flags directly to `docker run`.
@y
Docker Compose treats every Compose file as trusted input. When a Compose file
requests elevated privileges, host filesystem access, or any other
configuration, Compose applies it as written. This is the same behavior as
passing flags directly to `docker run`.
@z

@x
This means that any Compose file you run, whether it lives on your local
filesystem, in a Git repository, or in an OCI registry, has full control over
how containers interact with your host. The security boundary is not where the file comes from but whether you trust the author.
@y
This means that any Compose file you run, whether it lives on your local
filesystem, in a Git repository, or in an OCI registry, has full control over
how containers interact with your host. The security boundary is not where the file comes from but whether you trust the author.
@z

@x
Evaluating trust means asking: do you know who authored this file, can you verify it hasn't changed since you last reviewed it, and do you understand every privilege it requests?
@y
Evaluating trust means asking: do you know who authored this file, can you verify it hasn't changed since you last reviewed it, and do you understand every privilege it requests?
@z

@x
## The dependency chain
@y
## The dependency chain
@z

@x
A Compose application can be assembled from multiple sources. The
[`include`](/reference/compose-file/include.md) directive imports entire Compose
files, while [`extends`](/reference/compose-file/services.md#extends) inherits
configuration from a specific service in another file. Both support remote
references and can be chained:
@y
A Compose application can be assembled from multiple sources. The
[`include`](reference/compose-file/include.md) directive imports entire Compose
files, while [`extends`](reference/compose-file/services.md#extends) inherits
configuration from a specific service in another file. Both support remote
references and can be chained:
@z

@x
```text
Your command
  └─ compose.yaml                                    (local or remote)
       ├─ services, volumes, networks                (direct config)
       ├─ include:
       │    └─ oci://registry.example.com/base:v2   (remote dependency)
       │         └─ services, volumes, networks      (indirect config)
       └─ services:
            └─ app:
                 └─ extends:
                      └─ file: oci://registry.example.com/templates:v1
                           └─ service: webapp        (inherited config)
```
@y
```text
Your command
  └─ compose.yaml                                    (local or remote)
       ├─ services, volumes, networks                (direct config)
       ├─ include:
       │    └─ oci://registry.example.com/base:v2   (remote dependency)
       │         └─ services, volumes, networks      (indirect config)
       └─ services:
            └─ app:
                 └─ extends:
                      └─ file: oci://registry.example.com/templates:v1
                           └─ service: webapp        (inherited config)
```
@z

@x
Each level has the same capabilities. The top-level file you inspect may appear
safe while a nested `include` or `extends` introduces services with elevated
privileges, host bind mounts, or untrusted images. These dependencies can also
change independently. Risky settings can be introduced by a nested dependency that you never
see unless you inspect the fully resolved output.
@y
Each level has the same capabilities. The top-level file you inspect may appear
safe while a nested `include` or `extends` introduces services with elevated
privileges, host bind mounts, or untrusted images. These dependencies can also
change independently. Risky settings can be introduced by a nested dependency that you never
see unless you inspect the fully resolved output.
@z

@x
> [!IMPORTANT]
>
> Compose warns you when a configuration references remote sources. Do not
> accept this without understanding every reference in the chain.
@y
> [!IMPORTANT]
>
> Compose warns you when a configuration references remote sources. Do not
> accept this without understanding every reference in the chain.
@z

@x
## Best practices
@y
## Best practices
@z

@x
### Inspect the full configuration
@y
### Inspect the full configuration
@z

@x
To see exactly what Compose applies, including all resolved `includes`,
`extends`, merged overrides, and interpolated variables, use:
@y
To see exactly what Compose applies, including all resolved `includes`,
`extends`, merged overrides, and interpolated variables, use:
@z

@x
```console
$ docker compose config
```
@y
```console
$ docker compose config
```
@z

@x
For remote references:
@y
For remote references:
@z

@x
```console
$ docker compose -f oci://registry.example.com/myapp:latest config
```
@y
```console
$ docker compose -f oci://registry.example.com/myapp:latest config
```
@z

@x
Review this output before running `up` or `create`, especially when the
configuration comes from a source you have not audited.
@y
Review this output before running `up` or `create`, especially when the
configuration comes from a source you have not audited.
@z

@x
#### Fields to look out for
@y
#### Fields to look out for
@z

@x
A Compose configuration has broad control over how containers interact with the
host. The following is a non-exhaustive list of fields that carry security
implications when set by an untrusted author:
@y
A Compose configuration has broad control over how containers interact with the
host. The following is a non-exhaustive list of fields that carry security
implications when set by an untrusted author:
@z

@x
| Field | Effect |
|-------|--------|
| `privileged` | Grants the container full access to the host |
| `cap_add` | Adds Linux capabilities such as `SYS_ADMIN` or `NET_RAW` |
| `security_opt` | Configures security profiles including seccomp and AppArmor |
| `volumes` / bind mounts | Mounts host directories into the container |
| `network_mode: host` | Shares the host network stack |
| `pid: host` | Shares the host PID namespace |
| `devices` | Exposes host devices to the container |
| `image` | Pulls and runs an arbitrary container image |
@y
| Field | Effect |
|-------|--------|
| `privileged` | Grants the container full access to the host |
| `cap_add` | Adds Linux capabilities such as `SYS_ADMIN` or `NET_RAW` |
| `security_opt` | Configures security profiles including seccomp and AppArmor |
| `volumes` / bind mounts | Mounts host directories into the container |
| `network_mode: host` | Shares the host network stack |
| `pid: host` | Shares the host PID namespace |
| `devices` | Exposes host devices to the container |
| `image` | Pulls and runs an arbitrary container image |
@z

@x
When in doubt, look up the effect of any unfamiliar field before running the configuration.
@y
When in doubt, look up the effect of any unfamiliar field before running the configuration.
@z

@x
### CI/CD environments
@y
### CI/CD environments
@z

@x
Automated pipelines are particularly sensitive because they often run with
access to credentials, cloud provider tokens, or Docker sockets.
@y
Automated pipelines are particularly sensitive because they often run with
access to credentials, cloud provider tokens, or Docker sockets.
@z

@x
- Avoid referencing public or unverified Compose configurations in automated
  pipelines.
- Gate updates behind your normal code review process.
- Use read-only Docker socket mounts where possible to limit your risk.
@y
- Avoid referencing public or unverified Compose configurations in automated
  pipelines.
- Gate updates behind your normal code review process.
- Use read-only Docker socket mounts where possible to limit your risk.
@z

@x
### Pin remote references to digests
@y
### Pin remote references to digests
@z

@x
Tags are mutable meaning anyone with push access to a registry can overwrite a tag silently, so a reference you reviewed last week may point to different content today.
@y
Tags are mutable meaning anyone with push access to a registry can overwrite a tag silently, so a reference you reviewed last week may point to different content today.
@z

@x
Digests are immutable. Instead of referencing by tag, pin to the digest. 
@y
Digests are immutable. Instead of referencing by tag, pin to the digest. 
@z

@x
```yaml
include:
  - oci://registry.example.com/base@sha256:a1b2c3d4...
```
@y
```yaml
include:
  - oci://registry.example.com/base@sha256:a1b2c3d4...
```
@z

@x
Treat any update to a pinned digest as a code change. Make sure you review the new content before updating the reference.
@y
Treat any update to a pinned digest as a code change. Make sure you review the new content before updating the reference.
@z

@x
### Other
@y
### Other
@z

@x
- Use a private registry: Host OCI artifacts on a registry your
  organization controls. Restrict who can push to it.
- Audit transitive dependencies: Check every remote `include` and `extends`
  reference in the chain, not just the top-level file.
- Review all Compose confirmation prompts: When loading remote Compose files,
  Compose displays confirmation prompts for interpolation variables, environment
  values, and remote includes. Review these before accepting.
@y
- Use a private registry: Host OCI artifacts on a registry your
  organization controls. Restrict who can push to it.
- Audit transitive dependencies: Check every remote `include` and `extends`
  reference in the chain, not just the top-level file.
- Review all Compose confirmation prompts: When loading remote Compose files,
  Compose displays confirmation prompts for interpolation variables, environment
  values, and remote includes. Review these before accepting.
@z

@x
## Further reading
@y
## Further reading
@z

@x
- [OCI artifact applications](/manuals/compose/how-tos/oci-artifact.md)
- [Use Compose in production](/manuals/compose/how-tos/production.md)
- [`include` reference](/reference/compose-file/include.md)
- [`extends` reference](/reference/compose-file/services.md#extends)
- [Manage secrets in Compose](/manuals/compose/how-tos/use-secrets.md)
@y
- [OCI artifact applications](manuals/compose/how-tos/oci-artifact.md)
- [Use Compose in production](manuals/compose/how-tos/production.md)
- [`include` reference](reference/compose-file/include.md)
- [`extends` reference](reference/compose-file/services.md#extends)
- [Manage secrets in Compose](manuals/compose/how-tos/use-secrets.md)
@z
