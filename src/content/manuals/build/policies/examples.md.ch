%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Policy templates and examples
linkTitle: Templates & examples
description: Browse policy examples from quick-start configs to production-grade security templates
keywords: build policies, policy examples, rego examples, docker security, registry allowlist, policy templates
@y
title: Policy templates and examples
linkTitle: Templates & examples
description: Browse policy examples from quick-start configs to production-grade security templates
keywords: build policies, policy examples, rego examples, docker security, registry allowlist, policy templates
@z

@x
This page provides complete, working policy examples you can copy and adapt.
The examples are organized into two sections: getting started policies for
quick adoption, and production templates for comprehensive security.
@y
This page provides complete, working policy examples you can copy and adapt.
The examples are organized into two sections: getting started policies for
quick adoption, and production templates for comprehensive security.
@z

@x
If you're new to policies, start with the tutorials:
[Introduction](./intro.md), [Image validation](./validate-images.md), and [Git
validation](./validate-git.md). Those pages teach individual techniques. This
page shows complete policies combining those techniques.
@y
If you're new to policies, start with the tutorials:
[Introduction](./intro.md), [Image validation](./validate-images.md), and [Git
validation](./validate-git.md). Those pages teach individual techniques. This
page shows complete policies combining those techniques.
@z

@x
## How to use these examples
@y
## How to use these examples
@z

@x
1. Copy the policy code into a `Dockerfile.rego` file next to your
   Dockerfile
2. Customize any todo comments with your specific values
3. Test by running `docker build .` and verifying the policy works as
   expected
4. Refine based on your team's needs
@y
1. Copy the policy code into a `Dockerfile.rego` file next to your
   Dockerfile
2. Customize any todo comments with your specific values
3. Test by running `docker build .` and verifying the policy works as
   expected
4. Refine based on your team's needs
@z

@x
### Using examples with bake
@y
### Using examples with bake
@z

@x
These policies work with both `docker buildx build` and `docker buildx bake`.
For bake, place the policy alongside your Dockerfile and it loads
automatically. To use additional policies:
@y
These policies work with both `docker buildx build` and `docker buildx bake`.
For bake, place the policy alongside your Dockerfile and it loads
automatically. To use additional policies:
@z

@x
```hcl
target "default" {
  dockerfile = "Dockerfile"
  policy = ["extra.rego"]
}
```
@y
```hcl
target "default" {
  dockerfile = "Dockerfile"
  policy = ["extra.rego"]
}
```
@z

@x
See the [Usage guide](./usage.md) for complete bake integration details.
@y
See the [Usage guide](./usage.md) for complete bake integration details.
@z

@x
## Getting started
@y
## Getting started
@z

@x
These policies work immediately with minimal or no customization. Use them to
adopt policies quickly and demonstrate value to your team.
@y
These policies work immediately with minimal or no customization. Use them to
adopt policies quickly and demonstrate value to your team.
@z

@x
### Development-friendly baseline
@y
### Development-friendly baseline
@z

@x
A permissive policy that allows typical development workflows while blocking
obvious security issues.
@y
A permissive policy that allows typical development workflows while blocking
obvious security issues.
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
allow if input.git
@y
allow if input.local
allow if input.git
@z

@x
# Allow common public registries
allow if {
  input.image.host == "docker.io"  # Docker Hub
}
@y
# Allow common public registries
allow if {
  input.image.host == "docker.io"  # Docker Hub
}
@z

@x
allow if {
  input.image.host == "ghcr.io"  # GitHub Container Registry
}
@y
allow if {
  input.image.host == "ghcr.io"  # GitHub Container Registry
}
@z

@x
allow if {
  input.image.host == "dhi.io"  # Docker Hardened Images
}
@y
allow if {
  input.image.host == "dhi.io"  # Docker Hardened Images
}
@z

@x
# Require HTTPS for all downloads
allow if {
  input.http.schema == "https"
}
@y
# Require HTTPS for all downloads
allow if {
  input.http.schema == "https"
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
This policy allows local and Git contexts, images from Docker Hub, GitHub
Container Registry, and [Docker Hardened Images](/dhi/), and `ADD` downloads
over HTTPS. It blocks HTTP downloads and non-standard registries.
@y
This policy allows local and Git contexts, images from Docker Hub, GitHub
Container Registry, and [Docker Hardened Images](__SUBDIR__/dhi/), and `ADD` downloads
over HTTPS. It blocks HTTP downloads and non-standard registries.
@z

@x
When to use: Starting point for teams new to policies. Provides basic security
without disrupting development workflows.
@y
When to use: Starting point for teams new to policies. Provides basic security
without disrupting development workflows.
@z

@x
### Registry allowlist
@y
### Registry allowlist
@z

@x
Control which registries your builds can pull images from.
@y
Control which registries your builds can pull images from.
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
# TODO: Add your internal registry hostname
allowed_registries := ["docker.io", "ghcr.io", "dhi.io", "registry.company.com"]
@y
# TODO: Add your internal registry hostname
allowed_registries := ["docker.io", "ghcr.io", "dhi.io", "registry.company.com"]
@z

@x
allow if {
  input.image.host in allowed_registries
}
@y
allow if {
  input.image.host in allowed_registries
}
@z

@x
# Allow mirrored DHI images from Docker Hub (DHI Enterprise users)
# TODO: Replace with your organization namespace
allow if {
  input.image.host == "docker.io"
  startswith(input.image.repo, "myorg/dhi-")
}
@y
# Allow mirrored DHI images from Docker Hub (DHI Enterprise users)
# TODO: Replace with your organization namespace
allow if {
  input.image.host == "docker.io"
  startswith(input.image.repo, "myorg/dhi-")
}
@z

@x
deny_msg contains msg if {
  not allow
  input.image
  msg := sprintf("registry %s is not in the allowlist", [input.image.host])
}
@y
deny_msg contains msg if {
  not allow
  input.image
  msg := sprintf("registry %s is not in the allowlist", [input.image.host])
}
@z

@x
decision := {"allow": allow, "deny_msg": deny_msg}
```
@y
decision := {"allow": allow, "deny_msg": deny_msg}
```
@z

@x
This policy restricts image pulls to approved registries. Customize and add
your internal registry to the list. If you have a DHI Enterprise subscription
and have mirrored Docker Hardened Images to Docker Hub, add a rule to allow
images from your organization's namespace.
@y
This policy restricts image pulls to approved registries. Customize and add
your internal registry to the list. If you have a DHI Enterprise subscription
and have mirrored Docker Hardened Images to Docker Hub, add a rule to allow
images from your organization's namespace.
@z

@x
When to use: Enforce corporate policies about approved image sources. Prevents
developers from using arbitrary public registries.
@y
When to use: Enforce corporate policies about approved image sources. Prevents
developers from using arbitrary public registries.
@z

@x
### Pin base images to digests
@y
### Pin base images to digests
@z

@x
Require digest references for reproducible builds.
@y
Require digest references for reproducible builds.
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
# Require digest references for all images
allow if {
  input.image.isCanonical
}
@y
# Require digest references for all images
allow if {
  input.image.isCanonical
}
@z

@x
deny_msg contains msg if {
  not allow
  input.image
  msg := sprintf("image %s must use digest reference (e.g., @sha256:...)", [input.image.ref])
}
@y
deny_msg contains msg if {
  not allow
  input.image
  msg := sprintf("image %s must use digest reference (e.g., @sha256:...)", [input.image.ref])
}
@z

@x
decision := {"allow": allow, "deny_msg": deny_msg}
```
@y
decision := {"allow": allow, "deny_msg": deny_msg}
```
@z

@x
This policy requires images use digest references like
`alpine@sha256:abc123...` instead of tags like `alpine:3.19`. Digests are
immutable - the same digest always resolves to the same image content.
@y
This policy requires images use digest references like
`alpine@sha256:abc123...` instead of tags like `alpine:3.19`. Digests are
immutable - the same digest always resolves to the same image content.
@z

@x
When to use: Ensure build reproducibility. Prevents builds from breaking when
upstream tags are updated. Required for compliance in some environments.
@y
When to use: Ensure build reproducibility. Prevents builds from breaking when
upstream tags are updated. Required for compliance in some environments.
@z

@x
### Control external dependencies
@y
### Control external dependencies
@z

@x
Pin specific versions of dependencies downloaded during builds.
@y
Pin specific versions of dependencies downloaded during builds.
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
# Allow any image (add restrictions as needed)
allow if input.image
@y
# Allow any image (add restrictions as needed)
allow if input.image
@z

@x
# TODO: Add your allowed Git repositories and tags
allowed_repos := {
  "https://github.com/moby/buildkit.git": ["v0.26.1", "v0.27.0"],
}
# Only allow Git input from allowed_repos
allow if {
  some repo, versions in allowed_repos
  input.git.remote == repo
  input.git.tagName in versions
}
@y
# TODO: Add your allowed Git repositories and tags
allowed_repos := {
  "https://github.com/moby/buildkit.git": ["v0.26.1", "v0.27.0"],
}
# Only allow Git input from allowed_repos
allow if {
  some repo, versions in allowed_repos
  input.git.remote == repo
  input.git.tagName in versions
}
@z

@x
# TODO: Add your allowed downloads
allow if {
  input.http.url == "https://example.com/app-v1.0.tar.gz"
}
@y
# TODO: Add your allowed downloads
allow if {
  input.http.url == "https://example.com/app-v1.0.tar.gz"
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
This policy creates allowlists for external dependencies. Add your Git
repositories with approved version tags, and URLs.
@y
This policy creates allowlists for external dependencies. Add your Git
repositories with approved version tags, and URLs.
@z

@x
When to use: Control which external dependencies can be used in builds.
Prevents builds from pulling arbitrary versions or unverified downloads.
@y
When to use: Control which external dependencies can be used in builds.
Prevents builds from pulling arbitrary versions or unverified downloads.
@z

@x
## Production templates
@y
## Production templates
@z

@x
These templates demonstrate comprehensive security patterns. They require
customization but show best practices for production environments.
@y
These templates demonstrate comprehensive security patterns. They require
customization but show best practices for production environments.
@z

@x
### Image attestation and provenance
@y
### Image attestation and provenance
@z

@x
Require images have provenance attestations from trusted builders.
@y
Require images have provenance attestations from trusted builders.
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
# TODO: Add your repository names
allowed_repos := ["myorg/backend", "myorg/frontend", "myorg/worker"]
@y
# TODO: Add your repository names
allowed_repos := ["myorg/backend", "myorg/frontend", "myorg/worker"]
@z

@x
# Production images need full attestations
allow if {
  some repo in allowed_repos
  input.image.repo == repo
  input.image.hasProvenance
  some sig in input.image.signatures
  trusted_github_builder(sig, repo)
}
@y
# Production images need full attestations
allow if {
  some repo in allowed_repos
  input.image.repo == repo
  input.image.hasProvenance
  some sig in input.image.signatures
  trusted_github_builder(sig, repo)
}
@z

@x
# Helper to validate GitHub Actions build from main branch
trusted_github_builder(sig, repo) if {
  sig.signer.certificateIssuer == "CN=sigstore-intermediate,O=sigstore.dev"
  sig.signer.issuer == "https://token.actions.githubusercontent.com"
  startswith(sig.signer.buildSignerURI, sprintf("https://github.com/myorg/%s/.github/workflows/", [repo]))
  sig.signer.sourceRepositoryRef == "refs/heads/main"
  sig.signer.runnerEnvironment == "github-hosted"
}
@y
# Helper to validate GitHub Actions build from main branch
trusted_github_builder(sig, repo) if {
  sig.signer.certificateIssuer == "CN=sigstore-intermediate,O=sigstore.dev"
  sig.signer.issuer == "https://token.actions.githubusercontent.com"
  startswith(sig.signer.buildSignerURI, sprintf("https://github.com/myorg/%s/.github/workflows/", [repo]))
  sig.signer.sourceRepositoryRef == "refs/heads/main"
  sig.signer.runnerEnvironment == "github-hosted"
}
@z

@x
# Allow Docker Hardened Images with built-in attestations
allow if {
  input.image.host == "dhi.io"
  input.image.isCanonical
  input.image.hasProvenance
}
@y
# Allow Docker Hardened Images with built-in attestations
allow if {
  input.image.host == "dhi.io"
  input.image.isCanonical
  input.image.hasProvenance
}
@z

@x
# Allow official base images with digests
allow if {
  input.image.repo == "alpine"
  input.image.host == "docker.io"
  input.image.isCanonical
}
@y
# Allow official base images with digests
allow if {
  input.image.repo == "alpine"
  input.image.host == "docker.io"
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
This template validates that your application images have provenance
attestations, and were built by GitHub Actions from your main branch. Docker
Hardened Images are allowed when using digests since they include comprehensive
attestations by default. Other base images must use digests.
@y
This template validates that your application images have provenance
attestations, and were built by GitHub Actions from your main branch. Docker
Hardened Images are allowed when using digests since they include comprehensive
attestations by default. Other base images must use digests.
@z

@x
Customize:
@y
Customize:
@z

@x
- Replace `allowed_repos` with your image names
- Update the organization name in `trusted_github_builder()`
- Add rules for other base images you use
@y
- Replace `allowed_repos` with your image names
- Update the organization name in `trusted_github_builder()`
- Add rules for other base images you use
@z

@x
When to use: Enforce supply chain security for production deployments. Ensures
images are built by trusted CI/CD pipelines with auditable provenance.
@y
When to use: Enforce supply chain security for production deployments. Ensures
images are built by trusted CI/CD pipelines with auditable provenance.
@z

@x
### Signed Git releases
@y
### Signed Git releases
@z

@x
Enforce signed tags from trusted maintainers for Git dependencies.
@y
Enforce signed tags from trusted maintainers for Git dependencies.
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
allow if input.image
@y
allow if input.image
@z

@x
# TODO: Replace with your repository URL
is_buildkit if {
    input.git.remote == "https://github.com/moby/buildkit.git"
}
@y
# TODO: Replace with your repository URL
is_buildkit if {
    input.git.remote == "https://github.com/moby/buildkit.git"
}
@z

@x
is_version_tag if {
    is_buildkit
    regex.match(`^v[0-9]+\.[0-9]+\.[0-9]+$`, input.git.tagName)
}
@y
is_version_tag if {
    is_buildkit
    regex.match(`^v[0-9]+\.[0-9]+\.[0-9]+$`, input.git.tagName)
}
@z

@x
# Version tags must be signed
allow if {
    is_version_tag
    input.git.tagName != ""
    verify_git_signature(input.git.tag, "maintainers.asc")
}
@y
# Version tags must be signed
allow if {
    is_version_tag
    input.git.tagName != ""
    verify_git_signature(input.git.tag, "maintainers.asc")
}
@z

@x
# Allow unsigned refs for development
allow if {
    is_buildkit
    not is_version_tag
}
@y
# Allow unsigned refs for development
allow if {
    is_buildkit
    not is_version_tag
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
This template requires production release tags to be signed by trusted
maintainers. Development branches and commits can be unsigned.
@y
This template requires production release tags to be signed by trusted
maintainers. Development branches and commits can be unsigned.
@z

@x
Setup:
@y
Setup:
@z

@x
1. Export maintainer PGP public keys to `maintainers.asc`:
   ```console
   $ gpg --export --armor user1@example.com user2@example.com > maintainers.asc
   ```
2. Place `maintainers.asc` in the same directory as your policy file
@y
1. Export maintainer PGP public keys to `maintainers.asc`:
   ```console
   $ gpg --export --armor user1@example.com user2@example.com > maintainers.asc
   ```
2. Place `maintainers.asc` in the same directory as your policy file
@z

@x
Customize:
@y
Customize:
@z

@x
- Replace the repository URL in `is_buildkit`
- Update the maintainers in the PGP keyring file
- Adjust the version tag regex pattern if needed
@y
- Replace the repository URL in `is_buildkit`
- Update the maintainers in the PGP keyring file
- Adjust the version tag regex pattern if needed
@z

@x
When to use: Validate that production dependencies come from signed releases.
Protects against compromised releases or unauthorized updates.
@y
When to use: Validate that production dependencies come from signed releases.
Protects against compromised releases or unauthorized updates.
@z

@x
### Multi-registry policy
@y
### Multi-registry policy
@z

@x
Apply different validation rules for internal and external registries.
@y
Apply different validation rules for internal and external registries.
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
# TODO: Replace with your internal registry hostname
internal_registry := "registry.company.com"
@y
# TODO: Replace with your internal registry hostname
internal_registry := "registry.company.com"
@z

@x
# Internal registry: basic validation
allow if {
  input.image.host == internal_registry
}
@y
# Internal registry: basic validation
allow if {
  input.image.host == internal_registry
}
@z

@x
# External registries: strict validation
allow if {
  input.image.host != internal_registry
  input.image.host != ""
  input.image.isCanonical
  input.image.hasProvenance
}
@y
# External registries: strict validation
allow if {
  input.image.host != internal_registry
  input.image.host != ""
  input.image.isCanonical
  input.image.hasProvenance
}
@z

@x
# Docker Hub: allowlist specific images
allow if {
  input.image.host == "docker.io"
  # TODO: Add your approved base images
  input.image.repo in ["alpine", "golang", "node"]
  input.image.isCanonical
}
@y
# Docker Hub: allowlist specific images
allow if {
  input.image.host == "docker.io"
  # TODO: Add your approved base images
  input.image.repo in ["alpine", "golang", "node"]
  input.image.isCanonical
}
@z

@x
# Docker Hardened Images: trusted by default with built-in attestations
allow if {
  input.image.host == "dhi.io"
  input.image.isCanonical
}
@y
# Docker Hardened Images: trusted by default with built-in attestations
allow if {
  input.image.host == "dhi.io"
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
This template defines a trust boundary between internal and external image
sources. Internal images require minimal validation, while external images need
digests and provenance. Docker Hardened Images from `dhi.io` are treated as
trusted since they include comprehensive attestations and security guarantees.
@y
This template defines a trust boundary between internal and external image
sources. Internal images require minimal validation, while external images need
digests and provenance. Docker Hardened Images from `dhi.io` are treated as
trusted since they include comprehensive attestations and security guarantees.
@z

@x
Customize:
@y
Customize:
@z

@x
- Set your internal registry hostname
- Add your approved Docker Hub base images
- Adjust validation requirements based on your security policies
@y
- Set your internal registry hostname
- Add your approved Docker Hub base images
- Adjust validation requirements based on your security policies
@z

@x
When to use: Organizations with internal registries that need different rules
for internal and external sources. Balances security with practical workflow
needs.
@y
When to use: Organizations with internal registries that need different rules
for internal and external sources. Balances security with practical workflow
needs.
@z

@x
### Multi-environment policy
@y
### Multi-environment policy
@z

@x
Apply different rules based on the build target or stage. For example,
@y
Apply different rules based on the build target or stage. For example,
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
# TODO: Define your environment detection logic
is_production if {
  input.env.target == "production"
}
@y
# TODO: Define your environment detection logic
is_production if {
  input.env.target == "production"
}
@z

@x
is_development if {
  input.env.target == "development"
}
@y
is_development if {
  input.env.target == "development"
}
@z

@x
# Production: strict rules - only digest images with provenance
allow if {
  is_production
  input.image.isCanonical
  input.image.hasProvenance
}
@y
# Production: strict rules - only digest images with provenance
allow if {
  is_production
  input.image.isCanonical
  input.image.hasProvenance
}
@z

@x
# Development: permissive rules - any image
allow if {
  is_development
  input.image
}
@y
# Development: permissive rules - any image
allow if {
  is_development
  input.image
}
@z

@x
# Staging inherits production rules (default target detection)
allow if {
  not is_production
  not is_development
  input.image.isCanonical
}
@y
# Staging inherits production rules (default target detection)
allow if {
  not is_production
  not is_development
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
This template uses build targets to apply different validation levels.
Production requires attestations and digests, development is permissive, and
staging uses moderate rules.
@y
This template uses build targets to apply different validation levels.
Production requires attestations and digests, development is permissive, and
staging uses moderate rules.
@z

@x
Customize:
@y
Customize:
@z

@x
- Update environment detection logic (target names, build args, etc.)
- Adjust validation requirements for each environment
- Add more environments as needed
@y
- Update environment detection logic (target names, build args, etc.)
- Adjust validation requirements for each environment
- Add more environments as needed
@z

@x
When to use: Teams with separate build configurations for different deployment
stages. Allows flexibility in development while enforcing strict rules for
production.
@y
When to use: Teams with separate build configurations for different deployment
stages. Allows flexibility in development while enforcing strict rules for
production.
@z

@x
### Complete dependency pinning
@y
### Complete dependency pinning
@z

@x
Pin all external dependencies to specific versions across all input types.
@y
Pin all external dependencies to specific versions across all input types.
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
# TODO: Add your pinned images with exact digests
# Docker Hub images use docker.io as host
allowed_dockerhub := {
  "alpine": "sha256:4b7ce07002c69e8f3d704a9c5d6fd3053be500b7f1c69fc0d80990c2ad8dd412",
  "golang": "sha256:abc123...",
}
@y
# TODO: Add your pinned images with exact digests
# Docker Hub images use docker.io as host
allowed_dockerhub := {
  "alpine": "sha256:4b7ce07002c69e8f3d704a9c5d6fd3053be500b7f1c69fc0d80990c2ad8dd412",
  "golang": "sha256:abc123...",
}
@z

@x
allow if {
  input.image.host == "docker.io"
  some repo, digest in allowed_dockerhub
  input.image.repo == repo
  input.image.checksum == digest
}
@y
allow if {
  input.image.host == "docker.io"
  some repo, digest in allowed_dockerhub
  input.image.repo == repo
  input.image.checksum == digest
}
@z

@x
# TODO: Add your pinned DHI images
allowed_dhi := {
  "python": "sha256:def456...",
  "node": "sha256:ghi789...",
}
@y
# TODO: Add your pinned DHI images
allowed_dhi := {
  "python": "sha256:def456...",
  "node": "sha256:ghi789...",
}
@z

@x
allow if {
  input.image.host == "dhi.io"
  some repo, digest in allowed_dhi
  input.image.repo == repo
  input.image.checksum == digest
}
@y
allow if {
  input.image.host == "dhi.io"
  some repo, digest in allowed_dhi
  input.image.repo == repo
  input.image.checksum == digest
}
@z

@x
# TODO: Add your pinned Git dependencies
allowed_git := {
  "https://github.com/moby/buildkit.git": {
    "tag": "v0.26.1",
    "commit": "abc123...",
  },
}
@y
# TODO: Add your pinned Git dependencies
allowed_git := {
  "https://github.com/moby/buildkit.git": {
    "tag": "v0.26.1",
    "commit": "abc123...",
  },
}
@z

@x
allow if {
  some url, version in allowed_git
  input.git.remote == url
  input.git.tagName == version.tag
  input.git.commitChecksum == version.commit
}
@y
allow if {
  some url, version in allowed_git
  input.git.remote == url
  input.git.tagName == version.tag
  input.git.commitChecksum == version.commit
}
@z

@x
# TODO: Add your pinned HTTP downloads
allowed_downloads := {
  "https://releases.example.com/app-v1.0.tar.gz": "sha256:def456...",
}
@y
# TODO: Add your pinned HTTP downloads
allowed_downloads := {
  "https://releases.example.com/app-v1.0.tar.gz": "sha256:def456...",
}
@z

@x
allow if {
  some url, checksum in allowed_downloads
  input.http.url == url
  input.http.checksum == checksum
}
@y
allow if {
  some url, checksum in allowed_downloads
  input.http.url == url
  input.http.checksum == checksum
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
This template pins every external dependency to exact versions with cryptographic
verification. Images use digests, Git repos use commit SHAs, and downloads use
checksums.
@y
This template pins every external dependency to exact versions with cryptographic
verification. Images use digests, Git repos use commit SHAs, and downloads use
checksums.
@z

@x
Customize:
@y
Customize:
@z

@x
- Add all your dependencies with exact versions/checksums
- Maintain this file when updating dependencies
- Consider automating updates through CI/CD
@y
- Add all your dependencies with exact versions/checksums
- Maintain this file when updating dependencies
- Consider automating updates through CI/CD
@z

@x
When to use: Maximum reproducibility and security. Ensures builds always use
exact versions of all dependencies. Required for high-security or regulated
environments.
@y
When to use: Maximum reproducibility and security. Ensures builds always use
exact versions of all dependencies. Required for high-security or regulated
environments.
@z

@x
### Manual signature verification
@y
### Manual signature verification
@z

@x
Verify image signatures by inspecting signature metadata fields.
@y
Verify image signatures by inspecting signature metadata fields.
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
# Require valid GitHub Actions signatures
allow if {
    input.image
    input.image.hasProvenance
    some sig in input.image.signatures
    valid_github_signature(sig)
}
@y
# Require valid GitHub Actions signatures
allow if {
    input.image
    input.image.hasProvenance
    some sig in input.image.signatures
    valid_github_signature(sig)
}
@z

@x
# Helper function to validate GitHub Actions signature
valid_github_signature(sig) if {
    # Sigstore keyless signing
    sig.signer.certificateIssuer == "CN=sigstore-intermediate,O=sigstore.dev"
    sig.signer.issuer == "https://token.actions.githubusercontent.com"
@y
# Helper function to validate GitHub Actions signature
valid_github_signature(sig) if {
    # Sigstore keyless signing
    sig.signer.certificateIssuer == "CN=sigstore-intermediate,O=sigstore.dev"
    sig.signer.issuer == "https://token.actions.githubusercontent.com"
@z

@x
    # TODO: Replace with your organization
    startswith(sig.signer.buildSignerURI, "https://github.com/myorg/.github/workflows/")
    startswith(sig.signer.sourceRepositoryURI, "https://github.com/myorg/")
@y
    # TODO: Replace with your organization
    startswith(sig.signer.buildSignerURI, "https://github.com/myorg/.github/workflows/")
    startswith(sig.signer.sourceRepositoryURI, "https://github.com/myorg/")
@z

@x
    # Verify GitHub hosted runner
    sig.signer.runnerEnvironment == "github-hosted"
@y
    # Verify GitHub hosted runner
    sig.signer.runnerEnvironment == "github-hosted"
@z

@x
    # Require timestamp
    count(sig.timestamps) > 0
}
@y
    # Require timestamp
    count(sig.timestamps) > 0
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
This policy validates that images were built by GitHub Actions using Sigstore
keyless signing.
@y
This policy validates that images were built by GitHub Actions using Sigstore
keyless signing.
@z

@x
Customize:
@y
Customize:
@z

@x
- Replace `myorg` with your GitHub organization
- Adjust workflow path restrictions
- Add additional signature field checks as needed
@y
- Replace `myorg` with your GitHub organization
- Adjust workflow path restrictions
- Add additional signature field checks as needed
@z

@x
When to use: Enforce that images are built by CI/CD with verifiable signatures,
not manually pushed by developers.
@y
When to use: Enforce that images are built by CI/CD with verifiable signatures,
not manually pushed by developers.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- Write unit tests for your policies: [Test build policies](./testing.md)
- Review [Built-in functions](./built-ins.md) for signature verification and
  attestation checking
- Check the [Input reference](./inputs.md) for all available fields you can
  validate
- Read the tutorials for detailed explanations:
  [Introduction](./intro.md), [Image validation](./validate-images.md), [Git
  validation](./validate-git.md)
@y
- Write unit tests for your policies: [Test build policies](./testing.md)
- Review [Built-in functions](./built-ins.md) for signature verification and
  attestation checking
- Check the [Input reference](./inputs.md) for all available fields you can
  validate
- Read the tutorials for detailed explanations:
  [Introduction](./intro.md), [Image validation](./validate-images.md), [Git
  validation](./validate-git.md)
@z
