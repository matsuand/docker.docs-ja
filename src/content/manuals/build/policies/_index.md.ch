%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Validating build inputs with policies
linkTitle: Validating builds
description: Secure your Docker builds by validating images, Git repositories, and dependencies with build policies
keywords: build policies, opa, rego, docker security, supply chain, attestations
@y
title: Validating build inputs with policies
linkTitle: Validating builds
description: Secure your Docker builds by validating images, Git repositories, and dependencies with build policies
keywords: build policies, opa, rego, docker security, supply chain, attestations
@z

@x
      text: Experimental
@y
      text: 試験的
@z

@x
Building with Docker often involves downloading remote resources. These
external dependencies, such as Docker images, Git repositories, remote files,
and other artifacts, are called build inputs.
@y
Building with Docker often involves downloading remote resources. These
external dependencies, such as Docker images, Git repositories, remote files,
and other artifacts, are called build inputs.
@z

@x
For example:
@y
For example:
@z

@x
- Pulling images from a registry
- Cloning a source code repository
- Fetching files from a server over HTTPS
@y
- Pulling images from a registry
- Cloning a source code repository
- Fetching files from a server over HTTPS
@z

@x
When consuming build inputs, it's a good idea to verify the contents are what
you expect them to be. One way to do this is to use the `--checksum` option for
the `ADD` Dockerfile instruction. This lets you verify the SHA256 checksum of a
remote resource when pulling it into a build:
@y
When consuming build inputs, it's a good idea to verify the contents are what
you expect them to be. One way to do this is to use the `--checksum` option for
the `ADD` Dockerfile instruction. This lets you verify the SHA256 checksum of a
remote resource when pulling it into a build:
@z

@x
```dockerfile
ADD --checksum=sha256:c0ff3312345… https://example.com/archive.tar.gz /
```
@y
```dockerfile
ADD --checksum=sha256:c0ff3312345… https://example.com/archive.tar.gz /
```
@z

@x
If the remote `archive.tar.gz` file does not match the checksum that the
Dockerfile expects, the build fails.
@y
If the remote `archive.tar.gz` file does not match the checksum that the
Dockerfile expects, the build fails.
@z

@x
Checksums verify that content matches what you expect, but only for the `ADD`
instruction. They don't tell you anything about where the content came from or
how it was produced. You can't use checksums to enforce constraints like
"images must be signed" or "dependencies must come from approved sources."
@y
Checksums verify that content matches what you expect, but only for the `ADD`
instruction. They don't tell you anything about where the content came from or
how it was produced. You can't use checksums to enforce constraints like
"images must be signed" or "dependencies must come from approved sources."
@z

@x
Build policies solve this problem. They let you define rules that validate all
your build inputs, enforcing requirements like provenance attestations,
approved registries, and signed Git tags across your entire build process.
@y
Build policies solve this problem. They let you define rules that validate all
your build inputs, enforcing requirements like provenance attestations,
approved registries, and signed Git tags across your entire build process.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Build policies is currently an experimental feature. To try it out, you'll
need:
@y
Build policies is currently an experimental feature. To try it out, you'll
need:
@z

@x
- Buildx 0.31.0 or later - Check your version: `docker buildx version`
- BuildKit 0.27.0 or later - Verify with: `docker buildx inspect --bootstrap`
@y
- Buildx 0.31.0 or later - Check your version: `docker buildx version`
- BuildKit 0.27.0 or later - Verify with: `docker buildx inspect --bootstrap`
@z

@x
If you're using Docker Desktop, ensure you're on a version that includes these
updates.
@y
If you're using Docker Desktop, ensure you're on a version that includes these
updates.
@z

@x
## Build policies
@y
## Build policies
@z

@x
Buildx version 0.31.0 added support for build policies. Build policies are
rules for securing your Docker build supply chain, and help protect against
upstream compromises, malicious dependencies, and unauthorized modifications to
your build inputs.
@y
Buildx version 0.31.0 added support for build policies. Build policies are
rules for securing your Docker build supply chain, and help protect against
upstream compromises, malicious dependencies, and unauthorized modifications to
your build inputs.
@z

@x
Build policies let you enforce extended verifications on inputs used to build
your projects, such as:
@y
Build policies let you enforce extended verifications on inputs used to build
your projects, such as:
@z

@x
- Docker images must use digest references (not tags alone)
- Images must have provenance attestations and cosign signatures
- Git tags are signed by maintainers with a PGP public key
- All remote artifacts must use HTTPS and include a checksum for verification
@y
- Docker images must use digest references (not tags alone)
- Images must have provenance attestations and cosign signatures
- Git tags are signed by maintainers with a PGP public key
- All remote artifacts must use HTTPS and include a checksum for verification
@z

@x
Build policies are defined in a declarative policy language, called Rego,
created for the [Open Policy Agent (OPA)](https://www.openpolicyagent.org/).
The following example shows a minimal build policy in Rego.
@y
Build policies are defined in a declarative policy language, called Rego,
created for the [Open Policy Agent (OPA)](https://www.openpolicyagent.org/).
The following example shows a minimal build policy in Rego.
@z

@x
```rego {title="Dockerfile.rego"}
package docker
@y
```rego {title="Dockerfile.rego"}
package docker
@z

@x
default allow := false
@y
default allow := false
@z

@x
# Allow any local inputs for this build
# For example: a local build context, or a local Dockerfile
allow if input.local
@y
# Allow any local inputs for this build
# For example: a local build context, or a local Dockerfile
allow if input.local
@z

@x
# Allow images, but only if they have provenance attestations
allow if {
    input.image.hasProvenance
}
@y
# Allow images, but only if they have provenance attestations
allow if {
    input.image.hasProvenance
}
@z

@x
decision := {"allow": allow}
```
@y
decision := {"allow": allow}
```
@z

@x
If the Dockerfile associated with this policy references an image with no
provenance attestation in a `FROM` instruction, the policy would be violated
and the build would fail.
@y
If the Dockerfile associated with this policy references an image with no
provenance attestation in a `FROM` instruction, the policy would be violated
and the build would fail.
@z

@x
## How policies work
@y
## How policies work
@z

@x
When you run `docker buildx build`, Buildx:
@y
When you run `docker buildx build`, Buildx:
@z

@x
1. Resolves all build inputs (images, Git repos, HTTP downloads)
2. Looks for a policy file matching your Dockerfile name (e.g.,
   `Dockerfile.rego`)
3. Evaluates each input against the policy before the build starts
4. Allows the build to proceed only if all inputs pass the policy
@y
1. Resolves all build inputs (images, Git repos, HTTP downloads)
2. Looks for a policy file matching your Dockerfile name (e.g.,
   `Dockerfile.rego`)
3. Evaluates each input against the policy before the build starts
4. Allows the build to proceed only if all inputs pass the policy
@z

@x
Policies are written in Rego (Open Policy Agent's policy language). You don't
need to be a Rego expert - the [Introduction](./intro.md) tutorial teaches you
everything needed.
@y
Policies are written in Rego (Open Policy Agent's policy language). You don't
need to be a Rego expert - the [Introduction](./intro.md) tutorial teaches you
everything needed.
@z

@x
Policy files live alongside your Dockerfile:
@y
Policy files live alongside your Dockerfile:
@z

@x
```text
project/
├── Dockerfile
├── Dockerfile.rego
└── src/
```
@y
```text
project/
├── Dockerfile
├── Dockerfile.rego
└── src/
```
@z

@x
No additional configuration is needed - Buildx automatically finds and loads
the policy when you build.
@y
No additional configuration is needed - Buildx automatically finds and loads
the policy when you build.
@z

@x
## Use cases
@y
## Use cases
@z

@x
Build policies help you enforce security and compliance requirements on your
Docker builds. Common scenarios where policies provide value:
@y
Build policies help you enforce security and compliance requirements on your
Docker builds. Common scenarios where policies provide value:
@z

@x
### Enforce base image standards
@y
### Enforce base image standards
@z

@x
Require all production Dockerfiles to use specific, approved base images with
digest references. Prevent developers from using arbitrary images that haven't
been vetted by your security team.
@y
Require all production Dockerfiles to use specific, approved base images with
digest references. Prevent developers from using arbitrary images that haven't
been vetted by your security team.
@z

@x
### Validate third-party dependencies
@y
### Validate third-party dependencies
@z

@x
When your build downloads files, libraries, or tools from the internet, verify
they come from trusted sources and match expected checksums or signatures. This
protects against supply chain attacks where an upstream dependency is
compromised.
@y
When your build downloads files, libraries, or tools from the internet, verify
they come from trusted sources and match expected checksums or signatures. This
protects against supply chain attacks where an upstream dependency is
compromised.
@z

@x
### Ensure signed releases
@y
### Ensure signed releases
@z

@x
Require that all dependencies have valid signatures from trusted parties.
@y
Require that all dependencies have valid signatures from trusted parties.
@z

@x
- Check GPG signatures for Git repositories you clone in your builds
- Verify provenance attestation signatures with Sigstore
@y
- Check GPG signatures for Git repositories you clone in your builds
- Verify provenance attestation signatures with Sigstore
@z

@x
### Meet compliance requirements
@y
### Meet compliance requirements
@z

@x
Some regulatory frameworks require evidence that you validate your build
inputs. Build policies give you an auditable, declarative way to demonstrate
you're checking dependencies against security standards.
@y
Some regulatory frameworks require evidence that you validate your build
inputs. Build policies give you an auditable, declarative way to demonstrate
you're checking dependencies against security standards.
@z

@x
### Separate development and production rules
@y
### Separate development and production rules
@z

@x
Apply stricter validation for production builds while allowing more flexibility
during development. The same policy file can contain conditional rules based on
build context or target.
@y
Apply stricter validation for production builds while allowing more flexibility
during development. The same policy file can contain conditional rules based on
build context or target.
@z

@x
## Get started
@y
## Get started
@z

@x
Ready to start writing policies? The [Introduction](./intro.md) tutorial walks
you through creating your first policy and teaches the Rego basics you need.
@y
Ready to start writing policies? The [Introduction](./intro.md) tutorial walks
you through creating your first policy and teaches the Rego basics you need.
@z

@x
For practical usage guidance, see [Using build policies](./usage.md).
@y
For practical usage guidance, see [Using build policies](./usage.md).
@z

@x
For practical examples you can copy and adapt, see the [Example
policies](./examples.md) library.
@y
For practical examples you can copy and adapt, see the [Example
policies](./examples.md) library.
@z
