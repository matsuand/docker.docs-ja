%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Validating Git repositories
linkTitle: Git validation
description: Write policies to validate Git repositories used in your builds
keywords: build policies, git validation, git signatures, gpg, signed commits, signed tags
@y
title: Validating Git repositories
linkTitle: Git validation
description: Write policies to validate Git repositories used in your builds
keywords: build policies, git validation, git signatures, gpg, signed commits, signed tags
@z

@x
Git repositories often appear in Docker builds as source code inputs. The `ADD`
instruction can clone repositories, and build contexts can reference Git URLs.
Validating these inputs ensures you're building from trusted sources with
verified versions.
@y
Git repositories often appear in Docker builds as source code inputs. The `ADD`
instruction can clone repositories, and build contexts can reference Git URLs.
Validating these inputs ensures you're building from trusted sources with
verified versions.
@z

@x
This guide teaches you to write policies that validate Git inputs, from basic
version pinning to verifying signed commits and tags.
@y
This guide teaches you to write policies that validate Git inputs, from basic
version pinning to verifying signed commits and tags.
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
## What are Git inputs?
@y
## What are Git inputs?
@z

@x
Git inputs come from `ADD` instructions that reference Git repositories:
@y
Git inputs come from `ADD` instructions that reference Git repositories:
@z

@x
```dockerfile
# Clone a specific tag
ADD https://github.com/moby/buildkit.git#v0.26.1 /buildkit
@y
```dockerfile
# Clone a specific tag
ADD https://github.com/moby/buildkit.git#v0.26.1 /buildkit
@z

@x
# Clone a branch
ADD https://github.com/user/repo.git#main /src
@y
# Clone a branch
ADD https://github.com/user/repo.git#main /src
@z

@x
# Clone a commit
ADD https://github.com/user/repo.git#abcde123 /src
```
@y
# Clone a commit
ADD https://github.com/user/repo.git#abcde123 /src
```
@z

@x
The build context can also be a Git repository when you build with:
@y
The build context can also be a Git repository when you build with:
@z

@x
```console
$ docker build https://github.com/user/repo.git#main
```
@y
```console
$ docker build https://github.com/user/repo.git#main
```
@z

@x
Each Git reference triggers a policy evaluation. Your policy can inspect
repository URLs, validate versions, check commit metadata, and verify
signatures.
@y
Each Git reference triggers a policy evaluation. Your policy can inspect
repository URLs, validate versions, check commit metadata, and verify
signatures.
@z

@x
## Match specific repositories
@y
## Match specific repositories
@z

@x
The simplest Git policy restricts which repositories can be used:
@y
The simplest Git policy restricts which repositories can be used:
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
  input.git.host == "github.com"
  input.git.remote == "https://github.com/moby/buildkit.git"
}
@y
allow if {
  input.git.host == "github.com"
  input.git.remote == "https://github.com/moby/buildkit.git"
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
- Allows only the BuildKit repository from GitHub
@y
- Denies all inputs by default
- Allows local build context
- Allows only the BuildKit repository from GitHub
@z

@x
The `host` field contains the Git server hostname, and `remote` contains the
full repository URL. Test it:
@y
The `host` field contains the Git server hostname, and `remote` contains the
full repository URL. Test it:
@z

@x
```dockerfile {title="Dockerfile"}
FROM scratch
ADD https://github.com/moby/buildkit.git#v0.26.1 /
```
@y
```dockerfile {title="Dockerfile"}
FROM scratch
ADD https://github.com/moby/buildkit.git#v0.26.1 /
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
The build succeeds. Try a different repository and it fails.
@y
The build succeeds. Try a different repository and it fails.
@z

@x
You can match multiple repositories with additional rules:
@y
You can match multiple repositories with additional rules:
@z

@x
```rego
allow if {
  input.git.host == "github.com"
  input.git.remote == "https://github.com/moby/buildkit.git"
}
@y
```rego
allow if {
  input.git.host == "github.com"
  input.git.remote == "https://github.com/moby/buildkit.git"
}
@z

@x
allow if {
  input.git.host == "github.com"
  input.git.remote == "https://github.com/docker/cli.git"
}
@y
allow if {
  input.git.host == "github.com"
  input.git.remote == "https://github.com/docker/cli.git"
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
## Pin to specific versions
@y
## Pin to specific versions
@z

@x
Tags and branches can change over time. Pin to specific versions to ensure
reproducible builds:
@y
Tags and branches can change over time. Pin to specific versions to ensure
reproducible builds:
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
  input.git.remote == "https://github.com/moby/buildkit.git"
  input.git.tagName == "v0.26.1"
}
@y
allow if {
  input.git.remote == "https://github.com/moby/buildkit.git"
  input.git.tagName == "v0.26.1"
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
The `tagName` field contains the tag name when the Git reference points to a
tag. Use `branch` for branches:
@y
The `tagName` field contains the tag name when the Git reference points to a
tag. Use `branch` for branches:
@z

@x
```rego
allow if {
  input.git.remote == "https://github.com/user/repo.git"
  input.git.branch == "main"
}
```
@y
```rego
allow if {
  input.git.remote == "https://github.com/user/repo.git"
  input.git.branch == "main"
}
```
@z

@x
Or use `ref` for any type of reference (branch, tag, or commit SHA):
@y
Or use `ref` for any type of reference (branch, tag, or commit SHA):
@z

@x
```rego
allow if {
  input.git.ref == "v0.26.1"
}
```
@y
```rego
allow if {
  input.git.ref == "v0.26.1"
}
```
@z

@x
## Use version allowlists
@y
## Use version allowlists
@z

@x
For repositories you trust but want to control versions, maintain an allowlist:
@y
For repositories you trust but want to control versions, maintain an allowlist:
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
allowed_versions = [
    {"tag": "v0.26.1", "annotated": true, "sha": "abc123"},
]
@y
allowed_versions = [
    {"tag": "v0.26.1", "annotated": true, "sha": "abc123"},
]
@z

@x
is_buildkit if {
    input.git.remote == "https://github.com/moby/buildkit.git"
}
@y
is_buildkit if {
    input.git.remote == "https://github.com/moby/buildkit.git"
}
@z

@x
allow if {
    not is_buildkit
}
@y
allow if {
    not is_buildkit
}
@z

@x
allow if {
    is_buildkit
    some version in allowed_versions
    input.git.tagName == version.tag
    input.git.isAnnotatedTag == version.annotated
    startswith(input.git.commitChecksum, version.sha)
}
@y
allow if {
    is_buildkit
    some version in allowed_versions
    input.git.tagName == version.tag
    input.git.isAnnotatedTag == version.annotated
    startswith(input.git.commitChecksum, version.sha)
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
- Defines an allowlist of approved versions with metadata
- Uses a helper rule (`is_buildkit`) for readability
- Allows all non-BuildKit inputs
- For BuildKit, checks the tag name, whether it's an annotated tag, and the commit SHA against the allowlist
@y
- Defines an allowlist of approved versions with metadata
- Uses a helper rule (`is_buildkit`) for readability
- Allows all non-BuildKit inputs
- For BuildKit, checks the tag name, whether it's an annotated tag, and the commit SHA against the allowlist
@z

@x
The helper rule makes complex policies more maintainable. You can expand the
allowlist as new versions are approved:
@y
The helper rule makes complex policies more maintainable. You can expand the
allowlist as new versions are approved:
@z

@x
```rego
allowed_versions = [
    {"tag": "v0.26.1", "annotated": true, "sha": "abc123"},
    {"tag": "v0.27.0", "annotated": true, "sha": "def456"},
    {"tag": "v0.27.1", "annotated": true, "sha": "789abc"},
]
```
@y
```rego
allowed_versions = [
    {"tag": "v0.26.1", "annotated": true, "sha": "abc123"},
    {"tag": "v0.27.0", "annotated": true, "sha": "def456"},
    {"tag": "v0.27.1", "annotated": true, "sha": "789abc"},
]
```
@z

@x
## Validate with regex patterns
@y
## Validate with regex patterns
@z

@x
Use pattern matching for semantic versioning:
@y
Use pattern matching for semantic versioning:
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
  input.git.remote == "https://github.com/moby/buildkit.git"
  regex.match(`^v[0-9]+\.[0-9]+\.[0-9]+$`, input.git.tagName)
}
@y
allow if {
  input.git.remote == "https://github.com/moby/buildkit.git"
  regex.match(`^v[0-9]+\.[0-9]+\.[0-9]+$`, input.git.tagName)
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
This allows any BuildKit tag matching the pattern `vX.Y.Z` where X, Y, and Z
are numbers. The regex ensures you're using release versions, not pre-release
tags like `v0.26.0-rc1`.
@y
This allows any BuildKit tag matching the pattern `vX.Y.Z` where X, Y, and Z
are numbers. The regex ensures you're using release versions, not pre-release
tags like `v0.26.0-rc1`.
@z

@x
Match major versions:
@y
Match major versions:
@z

@x
```rego
# Only allow v0.x releases
allow if {
  input.git.remote == "https://github.com/moby/buildkit.git"
  regex.match(`^v0\.[0-9]+\.[0-9]+$`, input.git.tagName)
}
```
@y
```rego
# Only allow v0.x releases
allow if {
  input.git.remote == "https://github.com/moby/buildkit.git"
  regex.match(`^v0\.[0-9]+\.[0-9]+$`, input.git.tagName)
}
```
@z

@x
## Inspect commit metadata
@y
## Inspect commit metadata
@z

@x
The `commit` object provides detailed information about commits:
@y
The `commit` object provides detailed information about commits:
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
# Check commit author
allow if {
  input.git.remote == "https://github.com/user/repo.git"
  input.git.commit.author.email == "trusted@example.com"
}
@y
# Check commit author
allow if {
  input.git.remote == "https://github.com/user/repo.git"
  input.git.commit.author.email == "trusted@example.com"
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
The `commit` object includes:
@y
The `commit` object includes:
@z

@x
- `author.name`: Author's name
- `author.email`: Author's email
- `author.when`: When the commit was authored
- `committer.name`: Committer's name
- `committer.email`: Committer's email
- `committer.when`: When the commit was committed
- `message`: Commit message
@y
- `author.name`: Author's name
- `author.email`: Author's email
- `author.when`: When the commit was authored
- `committer.name`: Committer's name
- `committer.email`: Committer's email
- `committer.when`: When the commit was committed
- `message`: Commit message
@z

@x
Validate commit messages:
@y
Validate commit messages:
@z

@x
```rego
allow if {
  input.git.commit
  contains(input.git.commit.message, "Signed-off-by:")
}
```
@y
```rego
allow if {
  input.git.commit
  contains(input.git.commit.message, "Signed-off-by:")
}
```
@z

@x
Pin to specific commit SHA:
@y
Pin to specific commit SHA:
@z

@x
```rego
allow if {
  input.git.commitChecksum == "abc123def456..."
}
```
@y
```rego
allow if {
  input.git.commitChecksum == "abc123def456..."
}
```
@z

@x
## Require signed commits
@y
## Require signed commits
@z

@x
GPG-signed commits prove authenticity. Check for commit signatures:
@y
GPG-signed commits prove authenticity. Check for commit signatures:
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
  input.git.remote == "https://github.com/moby/buildkit.git"
  input.git.commit.pgpSignature != null
}
@y
allow if {
  input.git.remote == "https://github.com/moby/buildkit.git"
  input.git.commit.pgpSignature != null
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
The `pgpSignature` field is `null` for unsigned commits. For signed commits, it
contains signature details.
@y
The `pgpSignature` field is `null` for unsigned commits. For signed commits, it
contains signature details.
@z

@x
SSH signatures work similarly:
@y
SSH signatures work similarly:
@z

@x
```rego
allow if {
  input.git.commit.sshSignature != null
}
```
@y
```rego
allow if {
  input.git.commit.sshSignature != null
}
```
@z

@x
## Require signed tags
@y
## Require signed tags
@z

@x
Annotated tags can be signed, providing a cryptographic guarantee of the
release:
@y
Annotated tags can be signed, providing a cryptographic guarantee of the
release:
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
  input.git.remote == "https://github.com/moby/buildkit.git"
  input.git.tag.pgpSignature != null
}
@y
allow if {
  input.git.remote == "https://github.com/moby/buildkit.git"
  input.git.tag.pgpSignature != null
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
The `tag` object is only available for annotated tags. It includes:
@y
The `tag` object is only available for annotated tags. It includes:
@z

@x
- `tagger.name`: Who created the tag
- `tagger.email`: Tagger's email
- `tagger.when`: When the tag was created
- `message`: Tag message
- `pgpSignature`: GPP signature (if signed)
- `sshSignature`: SSH signature (if signed)
@y
- `tagger.name`: Who created the tag
- `tagger.email`: Tagger's email
- `tagger.when`: When the tag was created
- `message`: Tag message
- `pgpSignature`: GPP signature (if signed)
- `sshSignature`: SSH signature (if signed)
@z

@x
Lightweight tags don't have a `tag` object, so this policy effectively requires
annotated, signed tags.
@y
Lightweight tags don't have a `tag` object, so this policy effectively requires
annotated, signed tags.
@z

@x
## Verify signatures with public keys
@y
## Verify signatures with public keys
@z

@x
Use the `verify_git_signature()` function to cryptographically verify Git
signatures against trusted public keys:
@y
Use the `verify_git_signature()` function to cryptographically verify Git
signatures against trusted public keys:
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
  input.git.remote == "https://github.com/moby/buildkit.git"
  input.git.tagName != ""
  verify_git_signature(input.git.tag, "keys.asc")
}
@y
allow if {
  input.git.remote == "https://github.com/moby/buildkit.git"
  input.git.tagName != ""
  verify_git_signature(input.git.tag, "keys.asc")
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
This verifies that Git tags are signed by keys in the `keys.asc` public
key file. To set this up:
@y
This verifies that Git tags are signed by keys in the `keys.asc` public
key file. To set this up:
@z

@x
1. Export maintainer public keys:
   ```console
   $ curl https://github.com/user.gpg > keys.asc
   ```
2. Place `keys.asc` alongside your policy file
@y
1. Export maintainer public keys:
   ```console
   $ curl https://github.com/user.gpg > keys.asc
   ```
2. Place `keys.asc` alongside your policy file
@z

@x
The function verifies PGP signatures on commits or tags. See [Built-in
functions](./built-ins.md) for more details.
@y
The function verifies PGP signatures on commits or tags. See [Built-in
functions](./built-ins.md) for more details.
@z

@x
## Apply conditional rules
@y
## Apply conditional rules
@z

@x
Use different rules for different contexts. Allow unsigned refs during
development but require signing for production:
@y
Use different rules for different contexts. Allow unsigned refs during
development but require signing for production:
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
is_buildkit if {
    input.git.remote == "https://github.com/moby/buildkit.git"
}
@y
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
    verify_git_signature(input.git.tag, "keys.asc")
}
@y
# Version tags must be signed
allow if {
    is_version_tag
    input.git.tagName != ""
    verify_git_signature(input.git.tag, "keys.asc")
}
@z

@x
# Non-version refs allowed in development
allow if {
    is_buildkit
    not is_version_tag
    input.env.target != "release"
}
@y
# Non-version refs allowed in development
allow if {
    is_buildkit
    not is_version_tag
    input.env.target != "release"
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
- Defines helper rules for readability
- Requires signed version tags from maintainers
- Allows unsigned refs (branches, commits) unless building the release target
- Uses `input.env.target` to detect the build target
@y
- Defines helper rules for readability
- Requires signed version tags from maintainers
- Allows unsigned refs (branches, commits) unless building the release target
- Uses `input.env.target` to detect the build target
@z

@x
Build a development target without signatures:
@y
Build a development target without signatures:
@z

@x
```console
$ docker buildx build --target=dev .
```
@y
```console
$ docker buildx build --target=dev .
```
@z

@x
Build the release target, and signing is enforced:
@y
Build the release target, and signing is enforced:
@z

@x
```console
$ docker buildx build --target=release .
```
@y
```console
$ docker buildx build --target=release .
```
@z

@x
## Next steps
@y
## Next steps
@z

@x
You now understand how to validate Git repositories in build policies. To
continue learning:
@y
You now understand how to validate Git repositories in build policies. To
continue learning:
@z

@x
- Browse [Example policies](./examples.md) for complete policy patterns
- Read [Built-in functions](./built-ins.md) for Git signature verification
  functions
- Check the [Input reference](./inputs.md) for all available Git fields
@y
- Browse [Example policies](./examples.md) for complete policy patterns
- Read [Built-in functions](./built-ins.md) for Git signature verification
  functions
- Check the [Input reference](./inputs.md) for all available Git fields
@z
