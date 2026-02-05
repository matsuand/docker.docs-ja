%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Input reference
linkTitle: Input reference
description: Reference documentation for policy input fields
keywords: build policies, input reference, policy fields, image metadata, git metadata
@y
title: Input reference
linkTitle: Input reference
description: Reference documentation for policy input fields
keywords: build policies, input reference, policy fields, image metadata, git metadata
@z

@x
When Buildx evaluates policies, it provides information about build inputs
through the `input` object. The structure of `input` depends on the type of
resource your Dockerfile references.
@y
When Buildx evaluates policies, it provides information about build inputs
through the `input` object. The structure of `input` depends on the type of
resource your Dockerfile references.
@z

@x
## Input types
@y
## Input types
@z

@x
Build inputs correspond to Dockerfile instructions:
@y
Build inputs correspond to Dockerfile instructions:
@z

@x
| Dockerfile instruction                  | Input type | Access pattern |
| --------------------------------------- | ---------- | -------------- |
| `FROM alpine:latest`                    | Image      | `input.image`  |
| `COPY --from=builder /app /app`         | Image      | `input.image`  |
| `ADD https://example.com/file.tar.gz /` | HTTP       | `input.http`   |
| `ADD git@github.com:user/repo.git /src` | Git        | `input.git`    |
| Build context (`.`)                     | Local      | `input.local`  |
@y
| Dockerfile instruction                  | Input type | Access pattern |
| --------------------------------------- | ---------- | -------------- |
| `FROM alpine:latest`                    | Image      | `input.image`  |
| `COPY --from=builder /app /app`         | Image      | `input.image`  |
| `ADD https://example.com/file.tar.gz /` | HTTP       | `input.http`   |
| `ADD git@github.com:user/repo.git /src` | Git        | `input.git`    |
| Build context (`.`)                     | Local      | `input.local`  |
@z

@x
Each input type has specific fields available for policy evaluation.
@y
Each input type has specific fields available for policy evaluation.
@z

@x
## HTTP inputs
@y
## HTTP inputs
@z

@x
HTTP inputs represent files downloaded over HTTP or HTTPS using the `ADD`
instruction.
@y
HTTP inputs represent files downloaded over HTTP or HTTPS using the `ADD`
instruction.
@z

@x
### Example Dockerfile
@y
### Example Dockerfile
@z

@x
```dockerfile
FROM alpine
ADD --checksum=sha256:abc123... https://example.com/app.tar.gz /app.tar.gz
```
@y
```dockerfile
FROM alpine
ADD --checksum=sha256:abc123... https://example.com/app.tar.gz /app.tar.gz
```
@z

@x
### Available fields
@y
### Available fields
@z

@x
#### `input.http.url`
@y
#### `input.http.url`
@z

@x
The complete URL of the resource.
@y
The complete URL of the resource.
@z

@x
```rego
allow if {
    input.http.url == "https://example.com/app.tar.gz"
}
```
@y
```rego
allow if {
    input.http.url == "https://example.com/app.tar.gz"
}
```
@z

@x
#### `input.http.schema`
@y
#### `input.http.schema`
@z

@x
The URL scheme (`http` or `https`).
@y
The URL scheme (`http` or `https`).
@z

@x
```rego
# Require HTTPS for all downloads
allow if {
    input.http.schema == "https"
}
```
@y
```rego
# Require HTTPS for all downloads
allow if {
    input.http.schema == "https"
}
```
@z

@x
#### `input.http.host`
@y
#### `input.http.host`
@z

@x
The hostname from the URL.
@y
The hostname from the URL.
@z

@x
```rego
# Allow downloads from approved domains
allow if {
    input.http.host == "cdn.example.com"
}
```
@y
```rego
# Allow downloads from approved domains
allow if {
    input.http.host == "cdn.example.com"
}
```
@z

@x
#### `input.http.path`
@y
#### `input.http.path`
@z

@x
The path component of the URL.
@y
The path component of the URL.
@z

@x
```rego
allow if {
    startswith(input.http.path, "/releases/")
}
```
@y
```rego
allow if {
    startswith(input.http.path, "/releases/")
}
```
@z

@x
#### `input.http.checksum`
@y
#### `input.http.checksum`
@z

@x
The checksum specified with `ADD --checksum=...`, if present. Empty string if
no checksum was provided.
@y
The checksum specified with `ADD --checksum=...`, if present. Empty string if
no checksum was provided.
@z

@x
```rego
# Require checksums for all downloads
allow if {
    input.http.checksum != ""
}
```
@y
```rego
# Require checksums for all downloads
allow if {
    input.http.checksum != ""
}
```
@z

@x
#### `input.http.hasAuth`
@y
#### `input.http.hasAuth`
@z

@x
Boolean indicating if the request includes authentication (HTTP basic auth or
bearer token).
@y
Boolean indicating if the request includes authentication (HTTP basic auth or
bearer token).
@z

@x
```rego
# Require authentication for internal servers
allow if {
    input.http.host == "internal.company.com"
    input.http.hasAuth
}
```
@y
```rego
# Require authentication for internal servers
allow if {
    input.http.host == "internal.company.com"
    input.http.hasAuth
}
```
@z

@x
## Image inputs
@y
## Image inputs
@z

@x
Image inputs represent container images from `FROM` instructions or
`COPY --from` references.
@y
Image inputs represent container images from `FROM` instructions or
`COPY --from` references.
@z

@x
### Example Dockerfile
@y
### Example Dockerfile
@z

@x
```dockerfile
FROM alpine:3.19@sha256:abc123...
COPY --from=builder:latest /app /app
```
@y
```dockerfile
FROM alpine:3.19@sha256:abc123...
COPY --from=builder:latest /app /app
```
@z

@x
### Available fields
@y
### Available fields
@z

@x
#### `input.image.ref`
@y
#### `input.image.ref`
@z

@x
The complete image reference as written in the Dockerfile.
@y
The complete image reference as written in the Dockerfile.
@z

@x
```rego
allow if {
    input.image.ref == "alpine:3.19@sha256:abc123..."
}
```
@y
```rego
allow if {
    input.image.ref == "alpine:3.19@sha256:abc123..."
}
```
@z

@x
#### `input.image.host`
@y
#### `input.image.host`
@z

@x
The registry hostname. Docker Hub images use `"docker.io"`.
@y
The registry hostname. Docker Hub images use `"docker.io"`.
@z

@x
```rego
# Only allow Docker Hub images
allow if {
    input.image.host == "docker.io"
}
@y
```rego
# Only allow Docker Hub images
allow if {
    input.image.host == "docker.io"
}
@z

@x
# Only allow images from GitHub Container Registry
allow if {
    input.image.host == "ghcr.io"
}
```
@y
# Only allow images from GitHub Container Registry
allow if {
    input.image.host == "ghcr.io"
}
```
@z

@x
#### `input.image.repo`
@y
#### `input.image.repo`
@z

@x
The repository name without the registry host.
@y
The repository name without the registry host.
@z

@x
```rego
allow if {
    input.image.repo == "library/alpine"
}
```
@y
```rego
allow if {
    input.image.repo == "library/alpine"
}
```
@z

@x
#### `input.image.fullRepo`
@y
#### `input.image.fullRepo`
@z

@x
The full repository path including registry host.
@y
The full repository path including registry host.
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
#### `input.image.tag`
@y
#### `input.image.tag`
@z

@x
The tag portion of the reference. Empty if using a digest reference.
@y
The tag portion of the reference. Empty if using a digest reference.
@z

@x
```rego
# Allow only specific tags
allow if {
    input.image.tag == "3.19"
}
```
@y
```rego
# Allow only specific tags
allow if {
    input.image.tag == "3.19"
}
```
@z

@x
#### `input.image.isCanonical`
@y
#### `input.image.isCanonical`
@z

@x
Boolean indicating if the reference uses a digest (`@sha256:...`).
@y
Boolean indicating if the reference uses a digest (`@sha256:...`).
@z

@x
```rego
# Require digest references
allow if {
    input.image.isCanonical
}
```
@y
```rego
# Require digest references
allow if {
    input.image.isCanonical
}
```
@z

@x
#### `input.image.checksum`
@y
#### `input.image.checksum`
@z

@x
The SHA256 digest of the image manifest.
@y
The SHA256 digest of the image manifest.
@z

@x
```rego
allow if {
    input.image.checksum == "sha256:abc123..."
}
```
@y
```rego
allow if {
    input.image.checksum == "sha256:abc123..."
}
```
@z

@x
#### `input.image.platform`
@y
#### `input.image.platform`
@z

@x
The target platform for multi-platform images.
@y
The target platform for multi-platform images.
@z

@x
```rego
allow if {
    input.image.platform == "linux/amd64"
}
```
@y
```rego
allow if {
    input.image.platform == "linux/amd64"
}
```
@z

@x
#### `input.image.os`
@y
#### `input.image.os`
@z

@x
The operating system from the image configuration.
@y
The operating system from the image configuration.
@z

@x
```rego
allow if {
    input.image.os == "linux"
}
```
@y
```rego
allow if {
    input.image.os == "linux"
}
```
@z

@x
#### `input.image.arch`
@y
#### `input.image.arch`
@z

@x
The CPU architecture from the image configuration.
@y
The CPU architecture from the image configuration.
@z

@x
```rego
allow if {
    input.image.arch == "amd64"
}
```
@y
```rego
allow if {
    input.image.arch == "amd64"
}
```
@z

@x
#### `input.image.hasProvenance`
@y
#### `input.image.hasProvenance`
@z

@x
Boolean indicating if the image has provenance attestations.
@y
Boolean indicating if the image has provenance attestations.
@z

@x
```rego
# Require provenance for production images
allow if {
    input.image.hasProvenance
}
```
@y
```rego
# Require provenance for production images
allow if {
    input.image.hasProvenance
}
```
@z

@x
#### `input.image.labels`
@y
#### `input.image.labels`
@z

@x
A map of image labels from the image configuration.
@y
A map of image labels from the image configuration.
@z

@x
```rego
# Check for specific labels
allow if {
    input.image.labels["org.opencontainers.image.vendor"] == "Example Corp"
}
```
@y
```rego
# Check for specific labels
allow if {
    input.image.labels["org.opencontainers.image.vendor"] == "Example Corp"
}
```
@z

@x
#### `input.image.signatures`
@y
#### `input.image.signatures`
@z

@x
Array of attestation signatures. Each signature in the array has the following
fields:
@y
Array of attestation signatures. Each signature in the array has the following
fields:
@z

@x
- `kind`: Signature kind (e.g., `"docker-github-builder"`, `"self-signed"`)
- `type`: Signature type (e.g., `"bundle-v0.3"`, `"simplesigning-v1"`)
- `timestamps`: Trusted timestamps from transparency logs
- `dockerReference`: Docker image reference
- `isDHI`: Boolean indicating if this is a Docker Hardened Image
- `signer`: Sigstore certificate details
@y
- `kind`: Signature kind (e.g., `"docker-github-builder"`, `"self-signed"`)
- `type`: Signature type (e.g., `"bundle-v0.3"`, `"simplesigning-v1"`)
- `timestamps`: Trusted timestamps from transparency logs
- `dockerReference`: Docker image reference
- `isDHI`: Boolean indicating if this is a Docker Hardened Image
- `signer`: Sigstore certificate details
@z

@x
```rego
# Require at least one signature
allow if {
    count(input.image.signatures) > 0
}
```
@y
```rego
# Require at least one signature
allow if {
    count(input.image.signatures) > 0
}
```
@z

@x
For Sigstore signatures, the `signer` object provides detailed certificate
information from the signing workflow:
@y
For Sigstore signatures, the `signer` object provides detailed certificate
information from the signing workflow:
@z

@x
- `certificateIssuer`: Certificate issuer
- `subjectAlternativeName`: Subject alternative name from certificate
- `buildSignerURI`: URI of the build signer
- `buildSignerDigest`: Digest of the build signer
- `runnerEnvironment`: CI/CD runner environment
- `sourceRepositoryURI`: Source repository URL
- `sourceRepositoryDigest`: Source repository digest
- `sourceRepositoryRef`: Source repository ref (branch/tag)
- `sourceRepositoryIdentifier`: Source repository identifier
- `sourceRepositoryOwnerURI`: Repository owner URI
- `buildConfigURI`: Build configuration URI
- `buildTrigger`: What triggered the build
- `runInvocationURI`: CI/CD run invocation URI
@y
- `certificateIssuer`: Certificate issuer
- `subjectAlternativeName`: Subject alternative name from certificate
- `buildSignerURI`: URI of the build signer
- `buildSignerDigest`: Digest of the build signer
- `runnerEnvironment`: CI/CD runner environment
- `sourceRepositoryURI`: Source repository URL
- `sourceRepositoryDigest`: Source repository digest
- `sourceRepositoryRef`: Source repository ref (branch/tag)
- `sourceRepositoryIdentifier`: Source repository identifier
- `sourceRepositoryOwnerURI`: Repository owner URI
- `buildConfigURI`: Build configuration URI
- `buildTrigger`: What triggered the build
- `runInvocationURI`: CI/CD run invocation URI
@z

@x
```rego
# Require signatures from GitHub Actions
allow if {
    some sig in input.image.signatures
    sig.signer.runnerEnvironment == "github-hosted"
    startswith(sig.signer.sourceRepositoryURI, "https://github.com/myorg/")
}
```
@y
```rego
# Require signatures from GitHub Actions
allow if {
    some sig in input.image.signatures
    sig.signer.runnerEnvironment == "github-hosted"
    startswith(sig.signer.sourceRepositoryURI, "https://github.com/myorg/")
}
```
@z

@x
## Git inputs
@y
## Git inputs
@z

@x
Git inputs represent Git repositories referenced in `ADD` instructions or used
as build context.
@y
Git inputs represent Git repositories referenced in `ADD` instructions or used
as build context.
@z

@x
### Example Dockerfile
@y
### Example Dockerfile
@z

@x
```dockerfile
ADD git@github.com:moby/buildkit.git#v0.12.0 /src
```
@y
```dockerfile
ADD git@github.com:moby/buildkit.git#v0.12.0 /src
```
@z

@x
### Available fields
@y
### Available fields
@z

@x
#### `input.git.schema`
@y
#### `input.git.schema`
@z

@x
The URL scheme (`https`, `http`, `git`, or `ssh`).
@y
The URL scheme (`https`, `http`, `git`, or `ssh`).
@z

@x
```rego
# Require HTTPS for Git clones
allow if {
    input.git.schema == "https"
}
```
@y
```rego
# Require HTTPS for Git clones
allow if {
    input.git.schema == "https"
}
```
@z

@x
#### `input.git.host`
@y
#### `input.git.host`
@z

@x
The Git host (e.g., `github.com`, `gitlab.com`).
@y
The Git host (e.g., `github.com`, `gitlab.com`).
@z

@x
```rego
allow if {
    input.git.host == "github.com"
}
```
@y
```rego
allow if {
    input.git.host == "github.com"
}
```
@z

@x
#### `input.git.remote`
@y
#### `input.git.remote`
@z

@x
The complete Git URL.
@y
The complete Git URL.
@z

@x
```rego
allow if {
    input.git.remote == "https://github.com/moby/buildkit.git"
}
```
@y
```rego
allow if {
    input.git.remote == "https://github.com/moby/buildkit.git"
}
```
@z

@x
#### `input.git.ref`
@y
#### `input.git.ref`
@z

@x
The Git reference.
@y
The Git reference.
@z

@x
```rego
allow if {
    input.git.ref == "refs/heads/master"
}
```
@y
```rego
allow if {
    input.git.ref == "refs/heads/master"
}
```
@z

@x
#### `input.git.tagName`
@y
#### `input.git.tagName`
@z

@x
The tag name if the reference is a tag.
@y
The tag name if the reference is a tag.
@z

@x
```rego
# Only allow version tags
allow if {
    regex.match(`^v[0-9]+\.[0-9]+\.[0-9]+$`, input.git.tagName)
}
```
@y
```rego
# Only allow version tags
allow if {
    regex.match(`^v[0-9]+\.[0-9]+\.[0-9]+$`, input.git.tagName)
}
```
@z

@x
#### `input.git.branch`
@y
#### `input.git.branch`
@z

@x
The branch name if the reference is a branch.
@y
The branch name if the reference is a branch.
@z

@x
```rego
allow if {
    input.git.branch == "main"
}
```
@y
```rego
allow if {
    input.git.branch == "main"
}
```
@z

@x
#### `input.git.subDir`
@y
#### `input.git.subDir`
@z

@x
The subdirectory path within the repository, if specified.
@y
The subdirectory path within the repository, if specified.
@z

@x
```rego
# Ensure clones are from the root
allow if {
    input.git.subDir == ""
}
```
@y
```rego
# Ensure clones are from the root
allow if {
    input.git.subDir == ""
}
```
@z

@x
#### `input.git.isCommitRef`
@y
#### `input.git.isCommitRef`
@z

@x
Boolean indicating if the reference is a commit SHA (as opposed to a branch or
tag name).
@y
Boolean indicating if the reference is a commit SHA (as opposed to a branch or
tag name).
@z

@x
```rego
# Require commit SHAs for production
allow if {
    input.env.target == "production"
    input.git.isCommitRef
}
```
@y
```rego
# Require commit SHAs for production
allow if {
    input.env.target == "production"
    input.git.isCommitRef
}
```
@z

@x
#### `input.git.checksum`
@y
#### `input.git.checksum`
@z

@x
The checksum of the Git reference. For commit references and branches, this is
the commit hash. For annotated tags, this is the tag object hash.
@y
The checksum of the Git reference. For commit references and branches, this is
the commit hash. For annotated tags, this is the tag object hash.
@z

@x
```rego
allow if {
    input.git.checksum == "abc123..."
}
```
@y
```rego
allow if {
    input.git.checksum == "abc123..."
}
```
@z

@x
#### `input.git.commitChecksum`
@y
#### `input.git.commitChecksum`
@z

@x
The commit hash that the reference points to. For annotated tags, this differs
from `checksum` (which is the tag object hash). For commit references and
branches, this is the same as `checksum`.
@y
The commit hash that the reference points to. For annotated tags, this differs
from `checksum` (which is the tag object hash). For commit references and
branches, this is the same as `checksum`.
@z

@x
```rego
allow if {
    input.git.commitChecksum == "abc123..."
}
```
@y
```rego
allow if {
    input.git.commitChecksum == "abc123..."
}
```
@z

@x
#### `input.git.isAnnotatedTag`
@y
#### `input.git.isAnnotatedTag`
@z

@x
Boolean indicating if the reference is an annotated tag (as opposed to a
lightweight tag).
@y
Boolean indicating if the reference is an annotated tag (as opposed to a
lightweight tag).
@z

@x
```rego
# Require annotated tags
allow if {
    input.git.tagName != ""
    input.git.isAnnotatedTag
}
```
@y
```rego
# Require annotated tags
allow if {
    input.git.tagName != ""
    input.git.isAnnotatedTag
}
```
@z

@x
#### `input.git.commit`
@y
#### `input.git.commit`
@z

@x
Object containing commit metadata:
@y
Object containing commit metadata:
@z

@x
- `author`: Author name, email, when
- `committer`: Committer name, email, when
- `message`: Commit message
- `pgpSignature`: PGP signature details if signed
- `sshSignature`: SSH signature details if signed
@y
- `author`: Author name, email, when
- `committer`: Committer name, email, when
- `message`: Commit message
- `pgpSignature`: PGP signature details if signed
- `sshSignature`: SSH signature details if signed
@z

@x
```rego
# Check commit author
allow if {
    input.git.commit.author.email == "maintainer@example.com"
}
```
@y
```rego
# Check commit author
allow if {
    input.git.commit.author.email == "maintainer@example.com"
}
```
@z

@x
#### `input.git.tag`
@y
#### `input.git.tag`
@z

@x
Object containing tag metadata for annotated tags:
@y
Object containing tag metadata for annotated tags:
@z

@x
- `tagger`: Tagger name, email, when
- `message`: Tag message
- `pgpSignature`: PGP signature details if signed
- `sshSignature`: SSH signature details if signed
@y
- `tagger`: Tagger name, email, when
- `message`: Tag message
- `pgpSignature`: PGP signature details if signed
- `sshSignature`: SSH signature details if signed
@z

@x
```rego
# Require signed tags
allow if {
    input.git.tag.pgpSignature != null
}
```
@y
```rego
# Require signed tags
allow if {
    input.git.tag.pgpSignature != null
}
```
@z

@x
## Local inputs
@y
## Local inputs
@z

@x
Local inputs represent the build context directory.
@y
Local inputs represent the build context directory.
@z

@x
### Available fields
@y
### Available fields
@z

@x
#### `input.local.name`
@y
#### `input.local.name`
@z

@x
The name or path of the local context.
@y
The name or path of the local context.
@z

@x
```rego
allow if {
    input.local.name == "."
}
```
@y
```rego
allow if {
    input.local.name == "."
}
```
@z

@x
Local inputs are typically less restricted than remote inputs, but you can
still write policies to enforce context requirements.
@y
Local inputs are typically less restricted than remote inputs, but you can
still write policies to enforce context requirements.
@z

@x
## Environment fields
@y
## Environment fields
@z

@x
The `input.env` object provides build configuration information set by user on
invoking the build, not specific to a resource type.
@y
The `input.env` object provides build configuration information set by user on
invoking the build, not specific to a resource type.
@z

@x
### Available fields
@y
### Available fields
@z

@x
#### `input.env.filename`
@y
#### `input.env.filename`
@z

@x
The name of the Dockerfile being built.
@y
The name of the Dockerfile being built.
@z

@x
```rego
# Stricter rules for production Dockerfile
allow if {
    input.env.filename == "Dockerfile"
    input.image.isCanonical
}
@y
```rego
# Stricter rules for production Dockerfile
allow if {
    input.env.filename == "Dockerfile"
    input.image.isCanonical
}
@z

@x
# Relaxed rules for development
allow if {
    input.env.filename == "Dockerfile.dev"
}
```
@y
# Relaxed rules for development
allow if {
    input.env.filename == "Dockerfile.dev"
}
```
@z

@x
#### `input.env.target`
@y
#### `input.env.target`
@z

@x
The build target from multi-stage builds.
@y
The build target from multi-stage builds.
@z

@x
```rego
# Require signing only for release builds
allow if {
    input.env.target == "release"
    input.git.tagName != ""
    verify_git_signature(input.git.tag, "maintainer.asc")
}
```
@y
```rego
# Require signing only for release builds
allow if {
    input.env.target == "release"
    input.git.tagName != ""
    verify_git_signature(input.git.tag, "maintainer.asc")
}
```
@z

@x
#### `input.env.args`
@y
#### `input.env.args`
@z

@x
Build arguments passed with `--build-arg`. Access specific arguments by key.
@y
Build arguments passed with `--build-arg`. Access specific arguments by key.
@z

@x
```rego
# Check build argument values
allow if {
    input.env.args.ENVIRONMENT == "production"
    input.image.hasProvenance
}
```
@y
```rego
# Check build argument values
allow if {
    input.env.args.ENVIRONMENT == "production"
    input.image.hasProvenance
}
```
@z

@x
## Next steps
@y
## Next steps
@z

@x
- See [Built-in functions](./built-ins.md) for built-in helper functions to
  check and validate input properties
- Browse [Example policies](./examples.md) for common patterns
- Read about [Rego](https://www.openpolicyagent.org/docs/latest/policy-language/)
  for advanced policy logic
@y
- See [Built-in functions](./built-ins.md) for built-in helper functions to
  check and validate input properties
- Browse [Example policies](./examples.md) for common patterns
- Read about [Rego](https://www.openpolicyagent.org/docs/latest/policy-language/)
  for advanced policy logic
@z
