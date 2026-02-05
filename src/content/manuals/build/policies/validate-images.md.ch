%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Validating image inputs
linkTitle: Image validation
description: Write policies to validate container images used in your builds
keywords: build policies, image validation, docker images, provenance, attestations, signatures
@y
title: Validating image inputs
linkTitle: Image validation
description: Write policies to validate container images used in your builds
keywords: build policies, image validation, docker images, provenance, attestations, signatures
@z

@x
Container images are the most common build inputs. Every `FROM` instruction
pulls an image, and `COPY --from` references pull additional images. Validating
these images protects your build supply chain from compromised registries,
unexpected updates, and unauthorized base images.
@y
Container images are the most common build inputs. Every `FROM` instruction
pulls an image, and `COPY --from` references pull additional images. Validating
these images protects your build supply chain from compromised registries,
unexpected updates, and unauthorized base images.
@z

@x
This guide teaches you to write policies that validate image inputs,
progressing from basic allowlisting to advanced attestation checks.
@y
This guide teaches you to write policies that validate image inputs,
progressing from basic allowlisting to advanced attestation checks.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
You should understand the policy basics from the [Introduction](./intro.md):
creating policy files, basic Rego syntax, and how policies evaluate during
builds.
@y
You should understand the policy basics from the [Introduction](./intro.md):
creating policy files, basic Rego syntax, and how policies evaluate during
builds.
@z

@x
## What are image inputs?
@y
## What are image inputs?
@z

@x
Image inputs come from two Dockerfile instructions:
@y
Image inputs come from two Dockerfile instructions:
@z

@x
```dockerfile
# FROM instructions
FROM alpine:3.22
FROM golang:1.25-alpine AS builder
@y
```dockerfile
# FROM instructions
FROM alpine:3.22
FROM golang:1.25-alpine AS builder
@z

@x
# COPY --from references
COPY --from=builder /app /app
COPY --from=nginx:latest /etc/nginx/nginx.conf /nginx.conf
```
@y
# COPY --from references
COPY --from=builder /app /app
COPY --from=nginx:latest /etc/nginx/nginx.conf /nginx.conf
```
@z

@x
Each of these references triggers a policy evaluation. Your policy can inspect
image metadata, verify attestations, and enforce constraints before the build
proceeds.
@y
Each of these references triggers a policy evaluation. Your policy can inspect
image metadata, verify attestations, and enforce constraints before the build
proceeds.
@z

@x
## Allowlist specific repositories
@y
## Allowlist specific repositories
@z

@x
The simplest image policy restricts which repositories can be used. This
prevents developers from using arbitrary images that haven't been vetted.
@y
The simplest image policy restricts which repositories can be used. This
prevents developers from using arbitrary images that haven't been vetted.
@z

@x
Create a policy that only allows Alpine:
@y
Create a policy that only allows Alpine:
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
allow if input.local
@y
allow if input.local
@z

@x
allow if {
  input.image.repo == "alpine"
}
@y
allow if {
  input.image.repo == "alpine"
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
This policy:
@y
This policy:
@z

@x
- Denies all inputs by default
- Allows local build context
- Allows any image from the `alpine` repository (any tag or digest)
@y
- Denies all inputs by default
- Allows local build context
- Allows any image from the `alpine` repository (any tag or digest)
@z

@x
Test it with a Dockerfile:
@y
Test it with a Dockerfile:
@z

@x
```dockerfile {title="Dockerfile"}
FROM alpine
RUN echo "hello"
```
@y
```dockerfile {title="Dockerfile"}
FROM alpine
RUN echo "hello"
```
@z

@x
```console
$ docker build .
```
@y
```console
$ docker build .
```
@z

@x
The build succeeds. Try changing to `FROM ubuntu`:
@y
The build succeeds. Try changing to `FROM ubuntu`:
@z

@x
```console
$ docker build .
```
@y
```console
$ docker build .
```
@z

@x
The build fails because `ubuntu` doesn't match the allowed repository.
@y
The build fails because `ubuntu` doesn't match the allowed repository.
@z

@x
## Compare semantic versions
@y
## Compare semantic versions
@z

@x
Restrict images to specific version ranges using Rego's `semver` functions:
@y
Restrict images to specific version ranges using Rego's `semver` functions:
@z

@x
```rego
package docker
@y
```rego
package docker
@z

@x
default allow := false
@y
default allow := false
@z

@x
allow if input.local
@y
allow if input.local
@z

@x
# Allow Go 1.21 or newer
allow if {
  input.image.repo == "golang"
  semver.is_valid(input.image.tag)
  semver.compare(input.image.tag, "1.21.0") >= 0
}
@y
# Allow Go 1.21 or newer
allow if {
  input.image.repo == "golang"
  semver.is_valid(input.image.tag)
  semver.compare(input.image.tag, "1.21.0") >= 0
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
The `semver.compare(a, b)` function compares semantic versions and returns:
@y
The `semver.compare(a, b)` function compares semantic versions and returns:
@z

@x
- `-1` if version `a` is less than `b`
- `0` if versions are equal
- `1` if version `a` is greater than `b`
@y
- `-1` if version `a` is less than `b`
- `0` if versions are equal
- `1` if version `a` is greater than `b`
@z

@x
Use `semver.is_valid()` to check if a tag is a valid semantic version before
comparing.
@y
Use `semver.is_valid()` to check if a tag is a valid semantic version before
comparing.
@z

@x
Restrict to specific version ranges:
@y
Restrict to specific version ranges:
@z

@x
```rego
allow if {
  input.image.repo == "node"
  version := input.image.tag
  semver.is_valid(version)
  semver.compare(version, "20.0.0") >= 0  # 20.0.0 or newer
  semver.compare(version, "21.0.0") < 0   # older than 21.0.0
}
```
@y
```rego
allow if {
  input.image.repo == "node"
  version := input.image.tag
  semver.is_valid(version)
  semver.compare(version, "20.0.0") >= 0  # 20.0.0 or newer
  semver.compare(version, "21.0.0") < 0   # older than 21.0.0
}
```
@z

@x
This allows only Node.js 20.x versions. The pattern works for any image using
semantic versioning.
@y
This allows only Node.js 20.x versions. The pattern works for any image using
semantic versioning.
@z

@x
These `semver` functions are standard Rego built-ins documented in the [OPA
policy
reference](https://www.openpolicyagent.org/docs/latest/policy-reference/#semver).
@y
These `semver` functions are standard Rego built-ins documented in the [OPA
policy
reference](https://www.openpolicyagent.org/docs/latest/policy-reference/#semver).
@z

@x
## Require digest references
@y
## Require digest references
@z

@x
Tags like `alpine:3.22` can change - someone could push a new image with the
same tag. Digests like `alpine@sha256:abc123...` are immutable.
@y
Tags like `alpine:3.22` can change - someone could push a new image with the
same tag. Digests like `alpine@sha256:abc123...` are immutable.
@z

@x
### Requiring users to provide digests
@y
### Requiring users to provide digests
@z

@x
You can require that users always specify digests in their Dockerfiles:
@y
You can require that users always specify digests in their Dockerfiles:
@z

@x
```rego
package docker
@y
```rego
package docker
@z

@x
default allow := false
@y
default allow := false
@z

@x
allow if input.local
@y
allow if input.local
@z

@x
allow if {
  input.image.isCanonical
}
@y
allow if {
  input.image.isCanonical
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
The `isCanonical` field is `true` when the user's reference includes a digest.
This policy would allow:
@y
The `isCanonical` field is `true` when the user's reference includes a digest.
This policy would allow:
@z

@x
```dockerfile
FROM alpine@sha256:4b7ce07002c69e8f3d704a9c5d6fd3053be500b7f1c69fc0d80990c2ad8dd412
```
@y
```dockerfile
FROM alpine@sha256:4b7ce07002c69e8f3d704a9c5d6fd3053be500b7f1c69fc0d80990c2ad8dd412
```
@z

@x
But reject tag-only references like `FROM alpine:3.22`.
@y
But reject tag-only references like `FROM alpine:3.22`.
@z

@x
### Pinning to specific digests
@y
### Pinning to specific digests
@z

@x
Alternatively (or additionally), you can validate that an image's actual digest
matches a specific value, regardless of how the user wrote the reference:
@y
Alternatively (or additionally), you can validate that an image's actual digest
matches a specific value, regardless of how the user wrote the reference:
@z

@x
```rego
allow if {
  input.image.repo == "alpine"
  input.image.checksum == "sha256:4b7ce07002c69e8f3d704a9c5d6fd3053be500b7f1c69fc0d80990c2ad8dd412"
}
@y
```rego
allow if {
  input.image.repo == "alpine"
  input.image.checksum == "sha256:4b7ce07002c69e8f3d704a9c5d6fd3053be500b7f1c69fc0d80990c2ad8dd412"
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
This checks the actual content digest of the pulled image. It would allow both:
@y
This checks the actual content digest of the pulled image. It would allow both:
@z

@x
```dockerfile
FROM alpine:3.22
FROM alpine@sha256:4b7ce...
```
@y
```dockerfile
FROM alpine:3.22
FROM alpine@sha256:4b7ce...
```
@z

@x
As long as the resolved image has the specified digest. This is useful for
pinning critical base images to known-good versions.
@y
As long as the resolved image has the specified digest. This is useful for
pinning critical base images to known-good versions.
@z

@x
## Restrict registries
@y
## Restrict registries
@z

@x
Control which registries your builds can pull from. This helps enforce
corporate policies or restrict to trusted sources.
@y
Control which registries your builds can pull from. This helps enforce
corporate policies or restrict to trusted sources.
@z

@x
```rego
package docker
@y
```rego
package docker
@z

@x
default allow := false
@y
default allow := false
@z

@x
allow if input.local
@y
allow if input.local
@z

@x
# Allow Docker Hub images
allow if {
  input.image.host == "docker.io"  # Docker Hub
  input.image.repo == "alpine"
}
@y
# Allow Docker Hub images
allow if {
  input.image.host == "docker.io"  # Docker Hub
  input.image.repo == "alpine"
}
@z

@x
# Allow images from internal registry
allow if {
  input.image.host == "registry.company.com"
}
@y
# Allow images from internal registry
allow if {
  input.image.host == "registry.company.com"
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
The `host` field contains the registry hostname. Docker Hub images use
`"docker.io"` as the host value. Test with:
@y
The `host` field contains the registry hostname. Docker Hub images use
`"docker.io"` as the host value. Test with:
@z

@x
```dockerfile
FROM alpine                                    # Allowed (Docker Hub)
FROM registry.company.com/myapp:latest         # Allowed (company registry)
FROM ghcr.io/someorg/image:latest              # Denied (wrong registry)
```
@y
```dockerfile
FROM alpine                                    # Allowed (Docker Hub)
FROM registry.company.com/myapp:latest         # Allowed (company registry)
FROM ghcr.io/someorg/image:latest              # Denied (wrong registry)
```
@z

@x
Use `fullRepo` when you need the complete path including registry:
@y
Use `fullRepo` when you need the complete path including registry:
@z

@x
```rego
allow if {
  input.image.fullRepo == "docker.io/library/alpine"
}
```
@y
```rego
allow if {
  input.image.fullRepo == "docker.io/library/alpine"
}
```
@z

@x
## Validate platform constraints
@y
## Validate platform constraints
@z

@x
Multi-architecture images support different operating systems and CPU
architectures. You can restrict builds to specific platforms:
@y
Multi-architecture images support different operating systems and CPU
architectures. You can restrict builds to specific platforms:
@z

@x
```rego
package docker
@y
```rego
package docker
@z

@x
default allow := false
@y
default allow := false
@z

@x
allow if input.local
@y
allow if input.local
@z

@x
allow if {
  input.image.os == "linux"
  input.image.arch in ["amd64", "arm64"]
}
@y
allow if {
  input.image.os == "linux"
  input.image.arch in ["amd64", "arm64"]
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
This policy:
@y
This policy:
@z

@x
- Defines supported architectures in a list
- Checks `input.image.os` matches Linux
- Verifies `input.image.arch` is in the supported list
@y
- Defines supported architectures in a list
- Checks `input.image.os` matches Linux
- Verifies `input.image.arch` is in the supported list
@z

@x
The `os` and `arch` fields come from the image manifest, reflecting the actual
image platform. This works with Docker's automatic platform selection -
policies validate what Buildx resolves, not what you specify.
@y
The `os` and `arch` fields come from the image manifest, reflecting the actual
image platform. This works with Docker's automatic platform selection -
policies validate what Buildx resolves, not what you specify.
@z

@x
## Inspect image metadata
@y
## Inspect image metadata
@z

@x
Images contain metadata like environment variables, labels, and working
directories. You can validate these to ensure images meet requirements.
@y
Images contain metadata like environment variables, labels, and working
directories. You can validate these to ensure images meet requirements.
@z

@x
Check for specific environment variables:
@y
Check for specific environment variables:
@z

@x
```rego
package docker
@y
```rego
package docker
@z

@x
default allow := false
@y
default allow := false
@z

@x
allow if input.local
@y
allow if input.local
@z

@x
allow if {
  input.image.repo == "golang"
  input.image.workingDir == "/go"
  some ver in input.image.env
  startswith(ver, "GOLANG_VERSION=")
  some toolchain in input.image.env
  toolchain == "GOTOOLCHAIN=local"
}
@y
allow if {
  input.image.repo == "golang"
  input.image.workingDir == "/go"
  some ver in input.image.env
  startswith(ver, "GOLANG_VERSION=")
  some toolchain in input.image.env
  toolchain == "GOTOOLCHAIN=local"
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
This policy validates the official Go image by checking:
@y
This policy validates the official Go image by checking:
@z

@x
- The working directory is `/go`
- The environment has `GOLANG_VERSION` set
- The environment includes `GOTOOLCHAIN=local`
@y
- The working directory is `/go`
- The environment has `GOLANG_VERSION` set
- The environment includes `GOTOOLCHAIN=local`
@z

@x
The `input.image.env` field is an array of strings in `KEY=VALUE` format.
Use Rego's `some` iteration to search the array.
@y
The `input.image.env` field is an array of strings in `KEY=VALUE` format.
Use Rego's `some` iteration to search the array.
@z

@x
Check image labels:
@y
Check image labels:
@z

@x
```rego
allow if {
  input.image.labels["org.opencontainers.image.vendor"] == "Example Corp"
  input.image.labels["org.opencontainers.image.version"] != ""
}
```
@y
```rego
allow if {
  input.image.labels["org.opencontainers.image.vendor"] == "Example Corp"
  input.image.labels["org.opencontainers.image.version"] != ""
}
```
@z

@x
The `labels` field is a map, so you access values with bracket notation.
@y
The `labels` field is a map, so you access values with bracket notation.
@z

@x
## Require attestations and provenance
@y
## Require attestations and provenance
@z

@x
Modern images include [attestations](/build/metadata/attestations/):
machine-readable metadata about how the image was built.
[Provenance](/build/metadata/attestations/slsa-provenance/) attestations
describe the build process, and [SBOMs](/build/metadata/attestations/sbom/)
list the software inside.
@y
Modern images include [attestations](__SUBDIR__/build/metadata/attestations/):
machine-readable metadata about how the image was built.
[Provenance](__SUBDIR__/build/metadata/attestations/slsa-provenance/) attestations
describe the build process, and [SBOMs](__SUBDIR__/build/metadata/attestations/sbom/)
list the software inside.
@z

@x
Require provenance:
@y
Require provenance:
@z

@x
```rego
package docker
@y
```rego
package docker
@z

@x
default allow := false
@y
default allow := false
@z

@x
allow if input.local
@y
allow if input.local
@z

@x
allow if {
  input.image.hasProvenance
}
@y
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
The `hasProvenance` field is `true` when the image has provenance or SBOM
[attestations](../metadata/attestations/_index.md).
@y
The `hasProvenance` field is `true` when the image has provenance or SBOM
[attestations](../metadata/attestations/_index.md).
@z

@x
## Verify GitHub Actions signatures
@y
## Verify GitHub Actions signatures
@z

@x
For images built with GitHub Actions, verify they came from trusted workflows by
inspecting signature metadata:
@y
For images built with GitHub Actions, verify they came from trusted workflows by
inspecting signature metadata:
@z

@x
```rego
allow if {
  input.image.repo == "myapp"
  input.image.hasProvenance
  some sig in input.image.signatures
  valid_github_signature(sig)
}
@y
```rego
allow if {
  input.image.repo == "myapp"
  input.image.hasProvenance
  some sig in input.image.signatures
  valid_github_signature(sig)
}
@z

@x
# Helper to validate GitHub Actions signature
valid_github_signature(sig) if {
  sig.signer.certificateIssuer == "CN=sigstore-intermediate,O=sigstore.dev"
  sig.signer.issuer == "https://token.actions.githubusercontent.com"
  startswith(sig.signer.buildSignerURI, "https://github.com/myorg/")
  sig.signer.runnerEnvironment == "github-hosted"
}
@y
# Helper to validate GitHub Actions signature
valid_github_signature(sig) if {
  sig.signer.certificateIssuer == "CN=sigstore-intermediate,O=sigstore.dev"
  sig.signer.issuer == "https://token.actions.githubusercontent.com"
  startswith(sig.signer.buildSignerURI, "https://github.com/myorg/")
  sig.signer.runnerEnvironment == "github-hosted"
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
This pattern works with any GitHub Actions workflow using Sigstore keyless
signing. The signature metadata provides cryptographic proof of the build's
origin. For complete signature verification examples, see [Example
policies](./examples.md).
@y
This pattern works with any GitHub Actions workflow using Sigstore keyless
signing. The signature metadata provides cryptographic proof of the build's
origin. For complete signature verification examples, see [Example
policies](./examples.md).
@z

@x
## Combine multiple checks
@y
## Combine multiple checks
@z

@x
Real policies often combine several checks. Multiple conditions in one `allow`
rule means AND - all must be true:
@y
Real policies often combine several checks. Multiple conditions in one `allow`
rule means AND - all must be true:
@z

@x
```rego
package docker
@y
```rego
package docker
@z

@x
default allow := false
@y
default allow := false
@z

@x
allow if input.local
@y
allow if input.local
@z

@x
# Production images need everything
allow if {
  input.image.repo == "alpine"
  input.image.isCanonical
  input.image.hasProvenance
}
@y
# Production images need everything
allow if {
  input.image.repo == "alpine"
  input.image.isCanonical
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
Multiple `allow` rules means OR - any rule can match:
@y
Multiple `allow` rules means OR - any rule can match:
@z

@x
```rego
package docker
@y
```rego
package docker
@z

@x
default allow := false
@y
default allow := false
@z

@x
allow if input.local
@y
allow if input.local
@z

@x
# Allow Alpine with strict checks
allow if {
  input.image.repo == "alpine"
  input.image.isCanonical
}
@y
# Allow Alpine with strict checks
allow if {
  input.image.repo == "alpine"
  input.image.isCanonical
}
@z

@x
# Allow Go with different checks
allow if {
  input.image.repo == "golang"
  input.image.workingDir == "/go"
}
@y
# Allow Go with different checks
allow if {
  input.image.repo == "golang"
  input.image.workingDir == "/go"
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
Use this pattern to apply different requirements to different base images.
@y
Use this pattern to apply different requirements to different base images.
@z

@x
## Next steps
@y
## Next steps
@z

@x
You now understand how to validate container images in build policies. To
continue learning:
@y
You now understand how to validate container images in build policies. To
continue learning:
@z

@x
- Learn [Git repository validation](./validate-git.md) for source code inputs
- Browse [Example policies](./examples.md) for complete policy patterns
- Read [Built-in functions](./built-ins.md) for signature verification and
  attestation checking
- Check the [Input reference](./inputs.md) for all available image fields
@y
- Learn [Git repository validation](./validate-git.md) for source code inputs
- Browse [Example policies](./examples.md) for complete policy patterns
- Read [Built-in functions](./built-ins.md) for signature verification and
  attestation checking
- Check the [Input reference](./inputs.md) for all available image fields
@z
