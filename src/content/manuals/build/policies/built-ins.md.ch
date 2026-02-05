%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Built-in functions
linkTitle: Built-in functions
description: Buildx includes built-in helper functions to make writing policies easier
keywords: build policies, built-in functions, rego functions, signature verification, policy helpers
@y
title: Built-in functions
linkTitle: Built-in functions
description: Buildx includes built-in helper functions to make writing policies easier
keywords: build policies, built-in functions, rego functions, signature verification, policy helpers
@z

@x
Buildx provides built-in functions, in addition to the [Rego
built-ins](#rego-built-in-functions), to extend Rego policies with
Docker-specific operations like loading local files, verifying Git signatures,
and pinning image digests.
@y
Buildx provides built-in functions, in addition to the [Rego
built-ins](#rego-built-in-functions), to extend Rego policies with
Docker-specific operations like loading local files, verifying Git signatures,
and pinning image digests.
@z

@x
## Rego built-in functions
@y
## Rego built-in functions
@z

@x
The functions [documented on this page](#buildx-built-in-functions) are
Buildx-specific functions, distinct from [Rego's standard built-in
functions](https://www.openpolicyagent.org/docs/policy-language#built-in-functions)
@y
The functions [documented on this page](#buildx-built-in-functions) are
Buildx-specific functions, distinct from [Rego's standard built-in
functions](https://www.openpolicyagent.org/docs/policy-language#built-in-functions)
@z

@x
Buildx also supports standard Rego built-in functions, but only a subset. To
see the exact list of supported functions, refer to the Buildx [source
code](https://github.com/docker/buildx/blob/master/policy/builtins.go).
@y
Buildx also supports standard Rego built-in functions, but only a subset. To
see the exact list of supported functions, refer to the Buildx [source
code](https://github.com/docker/buildx/blob/master/policy/builtins.go).
@z

@x
## Buildx built-in functions
@y
## Buildx built-in functions
@z

@x
Buildx provides the following custom built-in functions for policy development:
@y
Buildx provides the following custom built-in functions for policy development:
@z

@x
- [`print`](#print)
- [`load_json`](#load_json)
- [`verify_git_signature`](#verify_git_signature)
- [`pin_image`](#pin_image)
@y
- [`print`](#print)
- [`load_json`](#load_json)
- [`verify_git_signature`](#verify_git_signature)
- [`pin_image`](#pin_image)
@z

@x
### `print`
@y
### `print`
@z

@x
Outputs debug information during policy evaluation.
@y
Outputs debug information during policy evaluation.
@z

@x
Parameters:
@y
Parameters:
@z

@x
- Any number of values to print
@y
- Any number of values to print
@z

@x
Returns: The values (pass-through)
@y
Returns: The values (pass-through)
@z

@x
Example:
@y
Example:
@z

@x
```rego
allow if {
    input.image.repo == "alpine"
    print("Allowing alpine image:", input.image.tag)
}
```
@y
```rego
allow if {
    input.image.repo == "alpine"
    print("Allowing alpine image:", input.image.tag)
}
```
@z

@x
Debug output appears when building with `--progress=plain`.
@y
Debug output appears when building with `--progress=plain`.
@z

@x
### `load_json`
@y
### `load_json`
@z

@x
Loads and parses JSON data from local files in the build context.
@y
Loads and parses JSON data from local files in the build context.
@z

@x
Parameters:
@y
Parameters:
@z

@x
- `filename` (string) - Path to JSON file relative to policy directory
@y
- `filename` (string) - Path to JSON file relative to policy directory
@z

@x
Returns: Parsed JSON data as Rego value
@y
Returns: Parsed JSON data as Rego value
@z

@x
Example:
@y
Example:
@z

@x
```rego
# Load approved versions from external file
approved_versions = load_json("versions.json")
@y
```rego
# Load approved versions from external file
approved_versions = load_json("versions.json")
@z

@x
allow if {
    input.image.repo == "alpine"
    some version in approved_versions.alpine
    input.image.tag == version
}
```
@y
allow if {
    input.image.repo == "alpine"
    some version in approved_versions.alpine
    input.image.tag == version
}
```
@z

@x
File structure:
@y
File structure:
@z

@x
```text
project/
├── Dockerfile
├── Dockerfile.rego
└── versions.json
```
@y
```text
project/
├── Dockerfile
├── Dockerfile.rego
└── versions.json
```
@z

@x
versions.json:
@y
versions.json:
@z

@x
```json
{
  "alpine": ["3.19", "3.20"],
  "golang": ["1.21", "1.22"]
}
```
@y
```json
{
  "alpine": ["3.19", "3.20"],
  "golang": ["1.21", "1.22"]
}
```
@z

@x
The JSON file must be in the same directory as the policy or in a
subdirectory accessible from the policy location.
@y
The JSON file must be in the same directory as the policy or in a
subdirectory accessible from the policy location.
@z

@x
### `verify_git_signature`
@y
### `verify_git_signature`
@z

@x
Verifies PGP signatures on Git commits or tags.
@y
Verifies PGP signatures on Git commits or tags.
@z

@x
Parameters:
@y
Parameters:
@z

@x
- `git_object` (object) - Either `input.git.commit` or `input.git.tag`
- `keyfile` (string) - Path to PGP public key file (relative to policy
  directory)
@y
- `git_object` (object) - Either `input.git.commit` or `input.git.tag`
- `keyfile` (string) - Path to PGP public key file (relative to policy
  directory)
@z

@x
Returns: Boolean - `true` if signature is valid, `false` otherwise
@y
Returns: Boolean - `true` if signature is valid, `false` otherwise
@z

@x
Example:
@y
Example:
@z

@x
```rego
# Require signed Git tags
allow if {
    input.git.tagName != ""
    verify_git_signature(input.git.tag, "maintainer.asc")
}
@y
```rego
# Require signed Git tags
allow if {
    input.git.tagName != ""
    verify_git_signature(input.git.tag, "maintainer.asc")
}
@z

@x
# Require signed commits
allow if {
    input.git.commit
    verify_git_signature(input.git.commit, "keys/team.asc")
}
```
@y
# Require signed commits
allow if {
    input.git.commit
    verify_git_signature(input.git.commit, "keys/team.asc")
}
```
@z

@x
Directory structure:
@y
Directory structure:
@z

@x
```text
project/
├── Dockerfile.rego
└── maintainer.asc          # PGP public key
```
@y
```text
project/
├── Dockerfile.rego
└── maintainer.asc          # PGP public key
```
@z

@x
Or with subdirectory:
@y
Or with subdirectory:
@z

@x
```text
project/
├── Dockerfile.rego
└── keys/
    ├── maintainer.asc
    └── team.asc
```
@y
```text
project/
├── Dockerfile.rego
└── keys/
    ├── maintainer.asc
    └── team.asc
```
@z

@x
Obtaining public keys:
@y
Obtaining public keys:
@z

@x
```console
$ gpg --export --armor user@example.com > maintainer.asc
```
@y
```console
$ gpg --export --armor user@example.com > maintainer.asc
```
@z

@x
### `pin_image`
@y
### `pin_image`
@z

@x
Pins an image to a specific digest, overriding the tag-based reference. Use
this to force builds to use specific image versions.
@y
Pins an image to a specific digest, overriding the tag-based reference. Use
this to force builds to use specific image versions.
@z

@x
Parameters:
@y
Parameters:
@z

@x
- `image_object` (object) - Must be `input.image` (the current image being
  evaluated)
- `digest` (string) - Target digest in format `sha256:...`
@y
- `image_object` (object) - Must be `input.image` (the current image being
  evaluated)
- `digest` (string) - Target digest in format `sha256:...`
@z

@x
Returns: Boolean - `true` if pinning succeeds
@y
Returns: Boolean - `true` if pinning succeeds
@z

@x
Example:
@y
Example:
@z

@x
```rego
# Pin alpine 3.19 to specific digest
alpine_3_19_digest = "sha256:4b7ce07002c69e8f3d704a9c5d6fd3053be500b7f1c69fc0d80990c2ad8dd412"
@y
```rego
# Pin alpine 3.19 to specific digest
alpine_3_19_digest = "sha256:4b7ce07002c69e8f3d704a9c5d6fd3053be500b7f1c69fc0d80990c2ad8dd412"
@z

@x
allow if {
    input.image.repo == "alpine"
    input.image.tag == "3.19"
    pin_image(input.image, alpine_3_19_digest)
}
```
@y
allow if {
    input.image.repo == "alpine"
    input.image.tag == "3.19"
    pin_image(input.image, alpine_3_19_digest)
}
```
@z

@x
Automatic digest replacement:
@y
Automatic digest replacement:
@z

@x
```rego
# Replace old digests with patched versions
replace_map = {
  "3.22.0": "3.22.2",
  "3.22.1": "3.22.2",
}
@y
```rego
# Replace old digests with patched versions
replace_map = {
  "3.22.0": "3.22.2",
  "3.22.1": "3.22.2",
}
@z

@x
alpine_digests = {
  "3.22.0": "sha256:8a1f59ffb675680d47db6337b49d22281a139e9d709335b492be023728e11715",
  "3.22.2": "sha256:4b7ce07002c69e8f3d704a9c5d6fd3053be500b7f1c69fc0d80990c2ad8dd412",
}
@y
alpine_digests = {
  "3.22.0": "sha256:8a1f59ffb675680d47db6337b49d22281a139e9d709335b492be023728e11715",
  "3.22.2": "sha256:4b7ce07002c69e8f3d704a9c5d6fd3053be500b7f1c69fc0d80990c2ad8dd412",
}
@z

@x
allow if {
    input.image.repo == "alpine"
    some old_version, new_version in replace_map
    input.image.checksum == alpine_digests[old_version]
    print("Replacing", old_version, "with", new_version)
    pin_image(input.image, alpine_digests[new_version])
}
```
@y
allow if {
    input.image.repo == "alpine"
    some old_version, new_version in replace_map
    input.image.checksum == alpine_digests[old_version]
    print("Replacing", old_version, "with", new_version)
    pin_image(input.image, alpine_digests[new_version])
}
```
@z

@x
This pattern automatically upgrades old image versions to patched releases.
@y
This pattern automatically upgrades old image versions to patched releases.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- Browse complete examples: [Example policies](./examples.md)
- Learn policy development workflow: [Using build policies](./usage.md)
- Reference input fields: [Input reference](./inputs.md)
@y
- Browse complete examples: [Example policies](./examples.md)
- Learn policy development workflow: [Using build policies](./usage.md)
- Reference input fields: [Input reference](./inputs.md)
@z
