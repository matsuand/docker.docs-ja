%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
title: Using build policies
linkTitle: Usage
description: Apply policies to builds and develop policies iteratively
keywords: build policies, policy eval, docker buildx, policy development, debugging
@y
title: Using build policies
linkTitle: Usage
description: Apply policies to builds and develop policies iteratively
keywords: build policies, policy eval, docker buildx, policy development, debugging
@z

@x
Build policies validate inputs before builds execute. This guide covers how to
develop policies iteratively and apply them to real builds with `docker buildx
build` and `docker buildx bake`.
@y
Build policies validate inputs before builds execute. This guide covers how to
develop policies iteratively and apply them to real builds with `docker buildx
build` and `docker buildx bake`.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- Buildx 0.31.0 or later - Check your version: `docker buildx version`
- BuildKit 0.26.0 or later - Verify with: `docker buildx inspect
  --bootstrap`
@y
- Buildx 0.31.0 or later - Check your version: `docker buildx version`
- BuildKit 0.26.0 or later - Verify with: `docker buildx inspect
  --bootstrap`
@z

@x
If you're using Docker Desktop, ensure you're on a version that includes these
updates.
@y
If you're using Docker Desktop, ensure you're on a version that includes these
updates.
@z

@x
## Policy development workflow
@y
## Policy development workflow
@z

@x
Buildx automatically loads policies that match your Dockerfile name. When you
build with `Dockerfile`, Buildx looks for `Dockerfile.rego` in the same
directory. For a file named `app.Dockerfile`, it looks for
`app.Dockerfile.rego`. See the [Advanced: Policy configuration](#advanced-policy-configuration)
section for configuration options and manual policy loading.
@y
Buildx automatically loads policies that match your Dockerfile name. When you
build with `Dockerfile`, Buildx looks for `Dockerfile.rego` in the same
directory. For a file named `app.Dockerfile`, it looks for
`app.Dockerfile.rego`. See the [Advanced: Policy configuration](#advanced-policy-configuration)
section for configuration options and manual policy loading.
@z

@x
Writing policies is an iterative process:
@y
Writing policies is an iterative process:
@z

@x
1. Start with a basic deny-all policy.
2. Build with debug logging to see what inputs your Dockerfile uses.
3. Add rules to allow specific sources based on the debug output.
4. Test and refine.
@y
1. Start with a basic deny-all policy.
2. Build with debug logging to see what inputs your Dockerfile uses.
3. Add rules to allow specific sources based on the debug output.
4. Test and refine.
@z

@x
### Viewing inputs from your Dockerfile
@y
### Viewing inputs from your Dockerfile
@z

@x
To see the inputs that your Dockerfile references (images, Git repos, HTTP
downloads), build with debug logging:
@y
To see the inputs that your Dockerfile references (images, Git repos, HTTP
downloads), build with debug logging:
@z

% snip command...

@x
Example output for an image source:
@y
Example output for an image source:
@z

% snip output...

@x
This shows the complete input structure, which fields are unresolved, and the
policy decision for each source. See [Input reference](./inputs.md) for all
available fields.
@y
This shows the complete input structure, which fields are unresolved, and the
policy decision for each source. See [Input reference](./inputs.md) for all
available fields.
@z

@x
### Testing policies with policy eval
@y
### Testing policies with policy eval
@z

@x
Use [`docker buildx policy eval`](/reference/cli/docker/buildx/policy/eval/) to
test whether your policy allows a specific source without running a full build.
@y
Use [`docker buildx policy eval`](__SUBDIR__/reference/cli/docker/buildx/policy/eval/) to
test whether your policy allows a specific source without running a full build.
@z

@x
Note: `docker buildx policy eval` tests the source specified as the argument.
It doesn't parse your Dockerfile to evaluate all inputs - for that, [build with
--progress=plain](#viewing-inputs-from-your-dockerfile).
@y
Note: `docker buildx policy eval` tests the source specified as the argument.
It doesn't parse your Dockerfile to evaluate all inputs - for that, [build with
--progress=plain](#viewing-inputs-from-your-dockerfile).
@z

@x
Test if your policy allows the local context:
@y
Test if your policy allows the local context:
@z

% snip command...

@x
No output means the policy allowed the source. If denied, you see:
@y
No output means the policy allowed the source. If denied, you see:
@z

% snip output...

@x
Test other sources:
@y
Test other sources:
@z

@x
```console
$ docker buildx policy eval https://example.com              # Test HTTP
$ docker buildx policy eval https://github.com/org/repo.git  # Test Git
```
@y
```console
$ docker buildx policy eval https://example.com              # Test HTTP
$ docker buildx policy eval https://github.com/org/repo.git  # Test Git
```
@z

@x
By default, `--print` shows reference information parsed from the source string
(like `repo`, `tag`, `host`) without fetching from registries. To inspect
metadata that requires fetching the source (like `labels`, `checksum`, or
`hasProvenance`), specify which fields to fetch with `--fields`:
@y
By default, `--print` shows reference information parsed from the source string
(like `repo`, `tag`, `host`) without fetching from registries. To inspect
metadata that requires fetching the source (like `labels`, `checksum`, or
`hasProvenance`), specify which fields to fetch with `--fields`:
@z

% snip command...

@x
Multiple fields can be specified as a comma-separated list.
@y
Multiple fields can be specified as a comma-separated list.
@z

@x
### Iterative development example
@y
### Iterative development example
@z

@x
Here's a practical workflow for developing policies:
@y
Here's a practical workflow for developing policies:
@z

@x
1. Start with basic deny-all policy:
@y
1. Start with basic deny-all policy:
@z

% snip code...

@x
2. Build with debug logging to see what inputs your Dockerfile uses:
@y
2. Build with debug logging to see what inputs your Dockerfile uses:
@z

% snip command...

@x
   The output shows the denied image and its input structure:
@y
   The output shows the denied image and its input structure:
@z

% snip output...

@x
3. Add a rule allowing the alpine image:
@y
3. Add a rule allowing the alpine image:
@z

% snip code...

@x
4. Build again to verify the policy works:
@y
4. Build again to verify the policy works:
@z

% snip command...

@x
If it fails, see [Debugging](./debugging.md) for troubleshooting guidance.
@y
If it fails, see [Debugging](./debugging.md) for troubleshooting guidance.
@z

@x
## Using policies with `docker build`
@y
## Using policies with `docker build`
@z

@x
Once you've developed and tested your policy, apply it to real builds.
@y
Once you've developed and tested your policy, apply it to real builds.
@z

@x
### Basic usage
@y
### Basic usage
@z

@x
Create a policy alongside your Dockerfile:
@y
Create a policy alongside your Dockerfile:
@z

% snip code...

@x
Build normally:
@y
Build normally:
@z

% snip command...

@x
Buildx loads the policy automatically and validates the `alpine:3.19` image
before building.
@y
Buildx loads the policy automatically and validates the `alpine:3.19` image
before building.
@z

@x
### Build with different Dockerfile names
@y
### Build with different Dockerfile names
@z

@x
Specify the Dockerfile with `-f`:
@y
Specify the Dockerfile with `-f`:
@z

% snip command...

@x
Buildx looks for `app.Dockerfile.rego` in the same directory.
@y
Buildx looks for `app.Dockerfile.rego` in the same directory.
@z

@x
### Build with manual policy
@y
### Build with manual policy
@z

@x
Add an extra policy to the automatic one:
@y
Add an extra policy to the automatic one:
@z

% snip command...

@x
Both `Dockerfile.rego` (automatic) and `extra-checks.rego` (manual) must pass.
@y
Both `Dockerfile.rego` (automatic) and `extra-checks.rego` (manual) must pass.
@z

@x
### Build without automatic policy
@y
### Build without automatic policy
@z

@x
Use only your specified policy:
@y
Use only your specified policy:
@z

% snip command...

@x
## Using policies with bake
@y
## Using policies with bake
@z

@x
[Bake](/build/bake/) supports automatic policy loading just like `docker buildx
build`. Place `Dockerfile.rego` alongside your Dockerfile and run:
@y
[Bake](__SUBDIR__/build/bake/) supports automatic policy loading just like `docker buildx
build`. Place `Dockerfile.rego` alongside your Dockerfile and run:
@z

% snip command...

@x
### Manual policy in bake files
@y
### Manual policy in bake files
@z

@x
Specify additional policies in your `docker-bake.hcl`:
@y
Specify additional policies in your `docker-bake.hcl`:
@z

% snip code...

@x
The `policy` attribute takes a list of policy files. Bake loads these in
addition to the automatic `Dockerfile.rego` (if it exists).
@y
The `policy` attribute takes a list of policy files. Bake loads these in
addition to the automatic `Dockerfile.rego` (if it exists).
@z

@x
### Multiple policies in bake
@y
### Multiple policies in bake
@z

% snip code...

@x
All policies must pass for the target to build successfully.
@y
All policies must pass for the target to build successfully.
@z

@x
### Different policies per target
@y
### Different policies per target
@z

@x
Apply different validation rules to different targets:
@y
Apply different validation rules to different targets:
@z

% snip code...

@x
Build with the appropriate target:
@y
Build with the appropriate target:
@z

% snip command...

@x
### Bake with policy options
@y
### Bake with policy options
@z

@x
Currently, bake doesn't support policy options (reset, strict, disabled) in the
HCL file. Use command-line flags instead:
@y
Currently, bake doesn't support policy options (reset, strict, disabled) in the
HCL file. Use command-line flags instead:
@z

% snip command...

@x
## Testing in CI/CD
@y
## Testing in CI/CD
@z

@x
Validate policies in continuous integration by running builds with the `--policy` flag. For unit testing policies before running builds, see [Test build policies](./testing.md).
@y
Validate policies in continuous integration by running builds with the `--policy` flag. For unit testing policies before running builds, see [Test build policies](./testing.md).
@z

@x
Test policies during CI builds:
@y
Test policies during CI builds:
@z

% snip code...

@x
This ensures policy changes don't break builds and that new rules work as
intended. The `strict=true` flag fails the build if policies aren't loaded (for
example, if the BuildKit instance used by the build is too old and doesn't
support policies).
@y
This ensures policy changes don't break builds and that new rules work as
intended. The `strict=true` flag fails the build if policies aren't loaded (for
example, if the BuildKit instance used by the build is too old and doesn't
support policies).
@z

@x
## Advanced: Policy configuration
@y
## Advanced: Policy configuration
@z

@x
This section covers advanced policy loading mechanisms and configuration
options.
@y
This section covers advanced policy loading mechanisms and configuration
options.
@z

@x
### Automatic policy loading
@y
### Automatic policy loading
@z

@x
Buildx automatically loads policies that match your Dockerfile name. When you
build with `Dockerfile`, Buildx looks for `Dockerfile.rego` in the same
directory. For a file named `app.Dockerfile`, it looks for
`app.Dockerfile.rego`.
@y
Buildx automatically loads policies that match your Dockerfile name. When you
build with `Dockerfile`, Buildx looks for `Dockerfile.rego` in the same
directory. For a file named `app.Dockerfile`, it looks for
`app.Dockerfile.rego`.
@z

@x within text
├── Dockerfile.rego          # Loaded automatically for Dockerfile
@y
├── Dockerfile.rego          # Loaded automatically for Dockerfile
@z
@x
├── app.Dockerfile.rego      # Loaded automatically for app.Dockerfile
@y
├── app.Dockerfile.rego      # Loaded automatically for app.Dockerfile
@z

@x
This automatic loading means you don't need command-line flags in most cases.
Create the policy file alongside your Dockerfile and build:
@y
This automatic loading means you don't need command-line flags in most cases.
Create the policy file alongside your Dockerfile and build:
@z

% snip command...

@x
Buildx detects `Dockerfile.rego` and evaluates it before running the build.
@y
Buildx detects `Dockerfile.rego` and evaluates it before running the build.
@z

@x
> [!NOTE]
> Policy files must be in the same directory as the Dockerfile they validate.
> Buildx doesn't search parent directories or subdirectories.
@y
> [!NOTE]
> Policy files must be in the same directory as the Dockerfile they validate.
> Buildx doesn't search parent directories or subdirectories.
@z

@x
### When policies don't load
@y
### When policies don't load
@z

@x
If buildx can't find a matching `.rego` file, the build proceeds without policy
evaluation. To require policies and fail if none are found, use strict mode:
@y
If buildx can't find a matching `.rego` file, the build proceeds without policy
evaluation. To require policies and fail if none are found, use strict mode:
@z

% snip command...

@x
This fails the build if no policy loads or if the BuildKit daemon doesn't
support policies.
@y
This fails the build if no policy loads or if the BuildKit daemon doesn't
support policies.
@z

@x
### Manual policy configuration
@y
### Manual policy configuration
@z

@x
The `--policy` flag lets you specify additional policies, override automatic
loading, or control policy behavior.
@y
The `--policy` flag lets you specify additional policies, override automatic
loading, or control policy behavior.
@z

@x
Basic syntax:
@y
Basic syntax:
@z

% snip command...

@x
This loads `custom.rego` in addition to the automatic `Dockerfile.rego` (if it
exists).
@y
This loads `custom.rego` in addition to the automatic `Dockerfile.rego` (if it
exists).
@z

@x
Multiple policies:
@y
Multiple policies:
@z

% snip command...

@x
All policies must pass for the build to succeed. Use this to enforce layered
requirements (base policy + project-specific rules).
@y
All policies must pass for the build to succeed. Use this to enforce layered
requirements (base policy + project-specific rules).
@z

@x
Available options:
@y
Available options:
@z

@x
| Option              | Description                                             | Example                       |
| ------------------- | ------------------------------------------------------- | ----------------------------- |
| `filename=<path>`   | Load policy from specified file                         | `filename=custom.rego`        |
| `reset=true`        | Ignore automatic policies, use only specified ones      | `reset=true`                  |
| `disabled=true`     | Disable all policy evaluation                           | `disabled=true`               |
| `strict=true`       | Fail if BuildKit doesn't support policies               | `strict=true`                 |
| `log-level=<level>` | Control policy logging (error, warn, info, debug, none). Use `debug` to see complete input JSON and unresolved fields | `log-level=debug`             |
@y
| Option              | Description                                             | Example                       |
| ------------------- | ------------------------------------------------------- | ----------------------------- |
| `filename=<path>`   | Load policy from specified file                         | `filename=custom.rego`        |
| `reset=true`        | Ignore automatic policies, use only specified ones      | `reset=true`                  |
| `disabled=true`     | Disable all policy evaluation                           | `disabled=true`               |
| `strict=true`       | Fail if BuildKit doesn't support policies               | `strict=true`                 |
| `log-level=<level>` | Control policy logging (error, warn, info, debug, none). Use `debug` to see complete input JSON and unresolved fields | `log-level=debug`             |
@z

@x
Combine options with commas:
@y
Combine options with commas:
@z

% snip command...

@x
### Exploring sources with policy eval
@y
### Exploring sources with policy eval
@z

@x
The `docker buildx policy eval` command lets you quickly explore and test
sources without running a build.
@y
The `docker buildx policy eval` command lets you quickly explore and test
sources without running a build.
@z

@x
#### Inspect input structure with --print
@y
#### Inspect input structure with --print
@z

@x
Use `--print` to see the input structure for any source without running policy
evaluation:
@y
Use `--print` to see the input structure for any source without running policy
evaluation:
@z

% snip command...
% snip code...

@x
Test different source types:
@y
Test different source types:
@z

@x within command
# HTTP downloads
@y
# HTTP downloads
@z
@x
# Images (requires docker-image:// prefix)
@y
# Images (requires docker-image:// prefix)
@z
@x
# Local context
@y
# Local context
@z

@x
Shows information parsed from the source without fetching. Use `--fields` to
fetch specific metadata (see [above](#testing-policies-with-policy-eval)).
@y
Shows information parsed from the source without fetching. Use `--fields` to
fetch specific metadata (see [above](#testing-policies-with-policy-eval)).
@z

@x
#### Test with specific policy files
@y
#### Test with specific policy files
@z

@x
The `--filename` flag specifies which policy file to load by providing the base
Dockerfile name (without the `.rego` extension). This is useful for testing
sources against policies associated with different Dockerfiles.
@y
The `--filename` flag specifies which policy file to load by providing the base
Dockerfile name (without the `.rego` extension). This is useful for testing
sources against policies associated with different Dockerfiles.
@z

@x
For example, to test a source against the policy for `app.Dockerfile`:
@y
For example, to test a source against the policy for `app.Dockerfile`:
@z

% snip command...

@x
This loads `app.Dockerfile.rego` and tests whether it allows the source `.`
(the local directory). The flag defaults to `Dockerfile` if not specified.
@y
This loads `app.Dockerfile.rego` and tests whether it allows the source `.`
(the local directory). The flag defaults to `Dockerfile` if not specified.
@z

@x
Test different sources against your policy:
@y
Test different sources against your policy:
@z

% snip command...

@x
### Reset automatic loading
@y
### Reset automatic loading
@z

@x
To use only your specified policies and ignore automatic `.rego` files:
@y
To use only your specified policies and ignore automatic `.rego` files:
@z

% snip command...

@x
This skips `Dockerfile.rego` and loads only `custom.rego`.
@y
This skips `Dockerfile.rego` and loads only `custom.rego`.
@z

@x
### Disable policies temporarily
@y
### Disable policies temporarily
@z

@x
Disable policy evaluation for testing or emergencies:
@y
Disable policy evaluation for testing or emergencies:
@z

% snip command...

@x
The build proceeds without any policy checks. Use this carefully - you're
bypassing security controls.
@y
The build proceeds without any policy checks. Use this carefully - you're
bypassing security controls.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- Write unit tests for your policies: [Test build policies](./testing.md)
- Debug policy failures: [Debugging](./debugging.md)
- Browse working examples: [Example policies](./examples.md)
- Reference all input fields: [Input reference](./inputs.md)
@y
- Write unit tests for your policies: [Test build policies](./testing.md)
- Debug policy failures: [Debugging](./debugging.md)
- Browse working examples: [Example policies](./examples.md)
- Reference all input fields: [Input reference](./inputs.md)
@z
