%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Dockerfile release notes
description: Release notes for Dockerfile frontend
keywords: build, dockerfile, frontend, release notes
tags: [Release notes]
@y
title: Dockerfile release notes
description: Release notes for Dockerfile frontend
keywords: build, dockerfile, frontend, release notes
tags: [Release notes]
@z

@x
This page contains information about the new features, improvements, known
issues, and bug fixes in [Dockerfile reference](/reference/dockerfile.md).
@y
This page contains information about the new features, improvements, known
issues, and bug fixes in [Dockerfile reference](reference/dockerfile.md).
@z

@x
For usage, see the [Dockerfile frontend syntax](frontend.md) page.
@y
For usage, see the [Dockerfile frontend syntax](frontend.md) page.
@z

@x
## 1.11.0
@y
## 1.11.0
@z

@x
{{< release-date date="2024-10-30" >}}
@y
{{< release-date date="2024-10-30" >}}
@z

@x
The full release note for this release is available
[on GitHub](https://github.com/moby/buildkit/releases/tag/dockerfile%2F1.11.0).
@y
The full release note for this release is available
[on GitHub](https://github.com/moby/buildkit/releases/tag/dockerfile%2F1.11.0).
@z

@x
```dockerfile
# syntax=docker/dockerfile:1.11.0
```
@y
```dockerfile
# syntax=docker/dockerfile:1.11.0
```
@z

@x
- The [`ONBUILD` instruction](/reference/dockerfile.md#onbuild) now supports commands that refer to other stages or images with `from`, such as `COPY --from` or `RUN mount=from=...`. [moby/buildkit#5357]
- The [`SecretsUsedInArgOrEnv`](/reference/build-checks/secrets-used-in-arg-or-env.md) build check has been improved to reduce false positives. [moby/buildkit#5208]
- A new [`InvalidDefinitionDescription`](/reference/build-checks/invalid-definition-description.md) build check recommends formatting comments for build arguments and stages descriptions. This is an [experimental check](/manuals/build/checks.md#experimental-checks). [moby/buildkit#5208], [moby/buildkit#5414]
- Multiple fixes for the `ONBUILD` instruction's progress and error handling. [moby/buildkit#5397]
- Improved error reporting for missing flag errors. [moby/buildkit#5369]
- Enhanced progress output for secret values mounted as environment variables. [moby/buildkit#5336]
- Added built-in build argument `TARGETSTAGE` to expose the name of the (final) target stage for the current build. [moby/buildkit#5431]
@y
- The [`ONBUILD` instruction](reference/dockerfile.md#onbuild) now supports commands that refer to other stages or images with `from`, such as `COPY --from` or `RUN mount=from=...`. [moby/buildkit#5357]
- The [`SecretsUsedInArgOrEnv`](reference/build-checks/secrets-used-in-arg-or-env.md) build check has been improved to reduce false positives. [moby/buildkit#5208]
- A new [`InvalidDefinitionDescription`](reference/build-checks/invalid-definition-description.md) build check recommends formatting comments for build arguments and stages descriptions. This is an [experimental check](manuals/build/checks.md#experimental-checks). [moby/buildkit#5208], [moby/buildkit#5414]
- Multiple fixes for the `ONBUILD` instruction's progress and error handling. [moby/buildkit#5397]
- Improved error reporting for missing flag errors. [moby/buildkit#5369]
- Enhanced progress output for secret values mounted as environment variables. [moby/buildkit#5336]
- Added built-in build argument `TARGETSTAGE` to expose the name of the (final) target stage for the current build. [moby/buildkit#5431]
@z

@x
### 1.11.0-labs
@y
### 1.11.0-labs
@z

@x
- `COPY --chmod` now supports non-octal values. [moby/buildkit#5380]
@y
- `COPY --chmod` now supports non-octal values. [moby/buildkit#5380]
@z

@x
[moby/buildkit#5357]: https://github.com/moby/buildkit/pull/5357
[moby/buildkit#5208]: https://github.com/moby/buildkit/pull/5208
[moby/buildkit#5414]: https://github.com/moby/buildkit/pull/5414
[moby/buildkit#5397]: https://github.com/moby/buildkit/pull/5397
[moby/buildkit#5369]: https://github.com/moby/buildkit/pull/5369
[moby/buildkit#5336]: https://github.com/moby/buildkit/pull/5336
[moby/buildkit#5431]: https://github.com/moby/buildkit/pull/5431
[moby/buildkit#5380]: https://github.com/moby/buildkit/pull/5380
@y
[moby/buildkit#5357]: https://github.com/moby/buildkit/pull/5357
[moby/buildkit#5208]: https://github.com/moby/buildkit/pull/5208
[moby/buildkit#5414]: https://github.com/moby/buildkit/pull/5414
[moby/buildkit#5397]: https://github.com/moby/buildkit/pull/5397
[moby/buildkit#5369]: https://github.com/moby/buildkit/pull/5369
[moby/buildkit#5336]: https://github.com/moby/buildkit/pull/5336
[moby/buildkit#5431]: https://github.com/moby/buildkit/pull/5431
[moby/buildkit#5380]: https://github.com/moby/buildkit/pull/5380
@z

@x
## 1.10.0
@y
## 1.10.0
@z

@x
{{< release-date date="2024-09-10" >}}
@y
{{< release-date date="2024-09-10" >}}
@z

@x
The full release note for this release is available
[on GitHub](https://github.com/moby/buildkit/releases/tag/dockerfile%2F1.10.0).
@y
The full release note for this release is available
[on GitHub](https://github.com/moby/buildkit/releases/tag/dockerfile%2F1.10.0).
@z

@x
```dockerfile
# syntax=docker/dockerfile:1.10.0
```
@y
```dockerfile
# syntax=docker/dockerfile:1.10.0
```
@z

@x
- [Build secrets](/manuals/build/building/secrets.md#target) can now be mounted as environment variables using the `env=VARIABLE` option. [moby/buildkit#5215]
- The [`# check` directive](/reference/dockerfile.md#check) now allows new experimental attribute for enabling experimental validation rules like `CopyIgnoredFile`. [moby/buildkit#5213]
- Improve validation of unsupported modifiers for variable substitution. [moby/buildkit#5146]
- `ADD` and `COPY` instructions now support variable interpolation for build arguments for the `--chmod` option values. [moby/buildkit#5151]
- Improve validation of the `--chmod` option for `COPY` and `ADD` instructions. [moby/buildkit#5148]
- Fix missing completions for size and destination attributes on mounts. [moby/buildkit#5245]
- OCI annotations are now set to the Dockerfile frontend release image. [moby/buildkit#5197]
@y
- [Build secrets](manuals/build/building/secrets.md#target) can now be mounted as environment variables using the `env=VARIABLE` option. [moby/buildkit#5215]
- The [`# check` directive](reference/dockerfile.md#check) now allows new experimental attribute for enabling experimental validation rules like `CopyIgnoredFile`. [moby/buildkit#5213]
- Improve validation of unsupported modifiers for variable substitution. [moby/buildkit#5146]
- `ADD` and `COPY` instructions now support variable interpolation for build arguments for the `--chmod` option values. [moby/buildkit#5151]
- Improve validation of the `--chmod` option for `COPY` and `ADD` instructions. [moby/buildkit#5148]
- Fix missing completions for size and destination attributes on mounts. [moby/buildkit#5245]
- OCI annotations are now set to the Dockerfile frontend release image. [moby/buildkit#5197]
@z

@x
[moby/buildkit#5215]: https://github.com/moby/buildkit/pull/5215
[moby/buildkit#5213]: https://github.com/moby/buildkit/pull/5213
[moby/buildkit#5146]: https://github.com/moby/buildkit/pull/5146
[moby/buildkit#5151]: https://github.com/moby/buildkit/pull/5151
[moby/buildkit#5148]: https://github.com/moby/buildkit/pull/5148
[moby/buildkit#5245]: https://github.com/moby/buildkit/pull/5245
[moby/buildkit#5197]: https://github.com/moby/buildkit/pull/5197
@y
[moby/buildkit#5215]: https://github.com/moby/buildkit/pull/5215
[moby/buildkit#5213]: https://github.com/moby/buildkit/pull/5213
[moby/buildkit#5146]: https://github.com/moby/buildkit/pull/5146
[moby/buildkit#5151]: https://github.com/moby/buildkit/pull/5151
[moby/buildkit#5148]: https://github.com/moby/buildkit/pull/5148
[moby/buildkit#5245]: https://github.com/moby/buildkit/pull/5245
[moby/buildkit#5197]: https://github.com/moby/buildkit/pull/5197
@z

@x
## 1.9.0
@y
## 1.9.0
@z

@x
{{< release-date date="2024-07-11" >}}
@y
{{< release-date date="2024-07-11" >}}
@z

@x
The full release note for this release is available
[on GitHub](https://github.com/moby/buildkit/releases/tag/dockerfile%2F1.9.0).
@y
The full release note for this release is available
[on GitHub](https://github.com/moby/buildkit/releases/tag/dockerfile%2F1.9.0).
@z

@x
```dockerfile
# syntax=docker/dockerfile:1.9.0
```
@y
```dockerfile
# syntax=docker/dockerfile:1.9.0
```
@z

@x
- Add new validation rules:
  - `SecretsUsedInArgOrEnv`
  - `InvalidDefaultArgInFrom`
  - `RedundantTargetPlatform`
  - `CopyIgnoredFile` (experimental)
  - `FromPlatformFlagConstDisallowed`
- Many performance improvements for working with big Dockerfiles. [moby/buildkit#5067](https://github.com/moby/buildkit/pull/5067/), [moby/buildkit#5029](https://github.com/moby/buildkit/pull/5029/)
- Fix possible panic when building Dockerfile without defined stages. [moby/buildkit#5150](https://github.com/moby/buildkit/pull/5150/)
- Fix incorrect JSON parsing that could cause some incorrect JSON values to pass without producing an error. [moby/buildkit#5107](https://github.com/moby/buildkit/pull/5107/)
- Fix a regression where `COPY --link` with a destination path of `.` could fail. [moby/buildkit#5080](https://github.com/moby/buildkit/pull/5080/)
- Fix validation of `ADD --checksum` when used with a Git URL. [moby/buildkit#5085](https://github.com/moby/buildkit/pull/5085/)
@y
- Add new validation rules:
  - `SecretsUsedInArgOrEnv`
  - `InvalidDefaultArgInFrom`
  - `RedundantTargetPlatform`
  - `CopyIgnoredFile` (experimental)
  - `FromPlatformFlagConstDisallowed`
- Many performance improvements for working with big Dockerfiles. [moby/buildkit#5067](https://github.com/moby/buildkit/pull/5067/), [moby/buildkit#5029](https://github.com/moby/buildkit/pull/5029/)
- Fix possible panic when building Dockerfile without defined stages. [moby/buildkit#5150](https://github.com/moby/buildkit/pull/5150/)
- Fix incorrect JSON parsing that could cause some incorrect JSON values to pass without producing an error. [moby/buildkit#5107](https://github.com/moby/buildkit/pull/5107/)
- Fix a regression where `COPY --link` with a destination path of `.` could fail. [moby/buildkit#5080](https://github.com/moby/buildkit/pull/5080/)
- Fix validation of `ADD --checksum` when used with a Git URL. [moby/buildkit#5085](https://github.com/moby/buildkit/pull/5085/)
@z

@x
## 1.8.1
@y
## 1.8.1
@z

@x
{{< release-date date="2024-06-18" >}}
@y
{{< release-date date="2024-06-18" >}}
@z

@x
The full release note for this release is available
[on GitHub](https://github.com/moby/buildkit/releases/tag/dockerfile%2F1.8.1).
@y
The full release note for this release is available
[on GitHub](https://github.com/moby/buildkit/releases/tag/dockerfile%2F1.8.1).
@z

@x
```dockerfile
# syntax=docker/dockerfile:1.8.1
```
@y
```dockerfile
# syntax=docker/dockerfile:1.8.1
```
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Fix handling of empty strings on variable expansion. [moby/buildkit#5052](https://github.com/moby/buildkit/pull/5052/)
- Improve formatting of build warnings. [moby/buildkit#5037](https://github.com/moby/buildkit/pull/5037/), [moby/buildkit#5045](https://github.com/moby/buildkit/pull/5045/), [moby/buildkit#5046](https://github.com/moby/buildkit/pull/5046/)
- Fix possible invalid output for `UndeclaredVariable` warning for multi-stage builds. [moby/buildkit#5048](https://github.com/moby/buildkit/pull/5048/)
@y
- Fix handling of empty strings on variable expansion. [moby/buildkit#5052](https://github.com/moby/buildkit/pull/5052/)
- Improve formatting of build warnings. [moby/buildkit#5037](https://github.com/moby/buildkit/pull/5037/), [moby/buildkit#5045](https://github.com/moby/buildkit/pull/5045/), [moby/buildkit#5046](https://github.com/moby/buildkit/pull/5046/)
- Fix possible invalid output for `UndeclaredVariable` warning for multi-stage builds. [moby/buildkit#5048](https://github.com/moby/buildkit/pull/5048/)
@z

@x
## 1.8.0
@y
## 1.8.0
@z

@x
{{< release-date date="2024-06-11" >}}
@y
{{< release-date date="2024-06-11" >}}
@z

@x
The full release note for this release is available
[on GitHub](https://github.com/moby/buildkit/releases/tag/dockerfile%2F1.8.0).
@y
The full release note for this release is available
[on GitHub](https://github.com/moby/buildkit/releases/tag/dockerfile%2F1.8.0).
@z

@x
```dockerfile
# syntax=docker/dockerfile:1.8.0
```
@y
```dockerfile
# syntax=docker/dockerfile:1.8.0
```
@z

@x
- Many new validation rules have been added to verify that your Dockerfile is using best practices. These rules are validated during build and new `check` frontend method can be used to only trigger validation without completing the whole build.
- New directive `#check` and build argument `BUILDKIT_DOCKERFILE_CHECK` lets you control the behavior or build checks. [moby/buildkit#4962](https://github.com/moby/buildkit/pull/4962/)
- Using a single-platform base image that does not match your expected platform is now validated. [moby/buildkit#4924](https://github.com/moby/buildkit/pull/4924/)
- Errors from the expansion of `ARG` definitions in global scope are now handled properly. [moby/buildkit#4856](https://github.com/moby/buildkit/pull/4856/)
- Expansion of the default value of `ARG` now only happens if it is not overwritten by the user. Previously, expansion was completed and value was later ignored, which could result in an unexpected expansion error. [moby/buildkit#4856](https://github.com/moby/buildkit/pull/4856/)
- Performance of parsing huge Dockerfiles with many stages has been improved. [moby/buildkit#4970](https://github.com/moby/buildkit/pull/4970/)
- Fix some Windows path handling consistency errors. [moby/buildkit#4825](https://github.com/moby/buildkit/pull/4825/)
@y
- Many new validation rules have been added to verify that your Dockerfile is using best practices. These rules are validated during build and new `check` frontend method can be used to only trigger validation without completing the whole build.
- New directive `#check` and build argument `BUILDKIT_DOCKERFILE_CHECK` lets you control the behavior or build checks. [moby/buildkit#4962](https://github.com/moby/buildkit/pull/4962/)
- Using a single-platform base image that does not match your expected platform is now validated. [moby/buildkit#4924](https://github.com/moby/buildkit/pull/4924/)
- Errors from the expansion of `ARG` definitions in global scope are now handled properly. [moby/buildkit#4856](https://github.com/moby/buildkit/pull/4856/)
- Expansion of the default value of `ARG` now only happens if it is not overwritten by the user. Previously, expansion was completed and value was later ignored, which could result in an unexpected expansion error. [moby/buildkit#4856](https://github.com/moby/buildkit/pull/4856/)
- Performance of parsing huge Dockerfiles with many stages has been improved. [moby/buildkit#4970](https://github.com/moby/buildkit/pull/4970/)
- Fix some Windows path handling consistency errors. [moby/buildkit#4825](https://github.com/moby/buildkit/pull/4825/)
@z

@x
## 1.7.0
@y
## 1.7.0
@z

@x
{{< release-date date="2024-03-06" >}}
@y
{{< release-date date="2024-03-06" >}}
@z

@x
### Stable
@y
### Stable
@z

@x
```dockerfile
# syntax=docker/dockerfile:1.7
```
@y
```dockerfile
# syntax=docker/dockerfile:1.7
```
@z

@x
- Variable expansion now allows string substitutions and trimming.
  [moby/buildkit#4427](https://github.com/moby/buildkit/pull/4427),
  [moby/buildkit#4287](https://github.com/moby/buildkit/pull/4287)
- Named contexts with local sources now correctly transfer only the files used in the Dockerfile instead of the full source directory.
  [moby/buildkit#4161](https://github.com/moby/buildkit/pull/4161)
- Dockerfile now better validates the order of stages and returns nice errors with stack traces if stages are in incorrect order.
  [moby/buildkit#4568](https://github.com/moby/buildkit/pull/4568),
  [moby/buildkit#4567](https://github.com/moby/buildkit/pull/4567)
- History commit messages now contain flags used with `COPY` and `ADD`.
  [moby/buildkit#4597](https://github.com/moby/buildkit/pull/4597)
- Progress messages for `ADD` commands from Git and HTTP sources have been improved.
  [moby/buildkit#4408](https://github.com/moby/buildkit/pull/4408)
@y
- Variable expansion now allows string substitutions and trimming.
  [moby/buildkit#4427](https://github.com/moby/buildkit/pull/4427),
  [moby/buildkit#4287](https://github.com/moby/buildkit/pull/4287)
- Named contexts with local sources now correctly transfer only the files used in the Dockerfile instead of the full source directory.
  [moby/buildkit#4161](https://github.com/moby/buildkit/pull/4161)
- Dockerfile now better validates the order of stages and returns nice errors with stack traces if stages are in incorrect order.
  [moby/buildkit#4568](https://github.com/moby/buildkit/pull/4568),
  [moby/buildkit#4567](https://github.com/moby/buildkit/pull/4567)
- History commit messages now contain flags used with `COPY` and `ADD`.
  [moby/buildkit#4597](https://github.com/moby/buildkit/pull/4597)
- Progress messages for `ADD` commands from Git and HTTP sources have been improved.
  [moby/buildkit#4408](https://github.com/moby/buildkit/pull/4408)
@z

@x
### Labs
@y
### Labs
@z

@x
```dockerfile
# syntax=docker/dockerfile:1.7-labs
```
@y
```dockerfile
# syntax=docker/dockerfile:1.7-labs
```
@z

@x
- New `--parents` flag has been added to `COPY` for copying files while keeping the parent directory structure.
  [moby/buildkit#4598](https://github.com/moby/buildkit/pull/4598),
  [moby/buildkit#3001](https://github.com/moby/buildkit/pull/3001),
  [moby/buildkit#4720](https://github.com/moby/buildkit/pull/4720),
  [moby/buildkit#4728](https://github.com/moby/buildkit/pull/4728),
  [docs](/reference/dockerfile.md#copy---parents)
- New `--exclude` flag can be used in `COPY` and `ADD` commands to apply filter to copied files.
  [moby/buildkit#4561](https://github.com/moby/buildkit/pull/4561),
  [docs](/reference/dockerfile.md#copy---exclude)
@y
- New `--parents` flag has been added to `COPY` for copying files while keeping the parent directory structure.
  [moby/buildkit#4598](https://github.com/moby/buildkit/pull/4598),
  [moby/buildkit#3001](https://github.com/moby/buildkit/pull/3001),
  [moby/buildkit#4720](https://github.com/moby/buildkit/pull/4720),
  [moby/buildkit#4728](https://github.com/moby/buildkit/pull/4728),
  [docs](reference/dockerfile.md#copy---parents)
- New `--exclude` flag can be used in `COPY` and `ADD` commands to apply filter to copied files.
  [moby/buildkit#4561](https://github.com/moby/buildkit/pull/4561),
  [docs](reference/dockerfile.md#copy---exclude)
@z

@x
## 1.6.0
@y
## 1.6.0
@z

@x
{{< release-date date="2023-06-13" >}}
@y
{{< release-date date="2023-06-13" >}}
@z

@x
### New
@y
### New
@z

@x
- Add `--start-interval` flag to the
  [`HEALTHCHECK` instruction](/reference/dockerfile.md#healthcheck).
@y
- Add `--start-interval` flag to the
  [`HEALTHCHECK` instruction](reference/dockerfile.md#healthcheck).
@z

@x
The following features have graduated from the labs channel to stable:
@y
The following features have graduated from the labs channel to stable:
@z

@x
- The `ADD` instruction can now [import files directly from Git URLs](/reference/dockerfile.md#adding-a-git-repository-add-git-ref-dir)
- The `ADD` instruction now supports [`--checksum` flag](/reference/dockerfile.md#verifying-a-remote-file-checksum-add---checksumchecksum-http-src-dest)
  to validate the contents of the remote URL contents
@y
- The `ADD` instruction can now [import files directly from Git URLs](reference/dockerfile.md#adding-a-git-repository-add-git-ref-dir)
- The `ADD` instruction now supports [`--checksum` flag](reference/dockerfile.md#verifying-a-remote-file-checksum-add---checksumchecksum-http-src-dest)
  to validate the contents of the remote URL contents
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Variable substitution now supports additional POSIX compatible variants without `:`.
  [moby/buildkit#3611](https://github.com/moby/buildkit/pull/3611)
- Exported Windows images now contain OSVersion and OSFeatures values from base image.
  [moby/buildkit#3619](https://github.com/moby/buildkit/pull/3619)
- Changed the permissions for Heredocs to 0644.
  [moby/buildkit#3992](https://github.com/moby/buildkit/pull/3992)
@y
- Variable substitution now supports additional POSIX compatible variants without `:`.
  [moby/buildkit#3611](https://github.com/moby/buildkit/pull/3611)
- Exported Windows images now contain OSVersion and OSFeatures values from base image.
  [moby/buildkit#3619](https://github.com/moby/buildkit/pull/3619)
- Changed the permissions for Heredocs to 0644.
  [moby/buildkit#3992](https://github.com/moby/buildkit/pull/3992)
@z

@x
## 1.5.2
@y
## 1.5.2
@z

@x
{{< release-date date="2023-02-14" >}}
@y
{{< release-date date="2023-02-14" >}}
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Fix building from Git reference that is missing branch name but contains a
  subdir
- 386 platform image is now included in the release
@y
- Fix building from Git reference that is missing branch name but contains a
  subdir
- 386 platform image is now included in the release
@z

@x
## 1.5.1
@y
## 1.5.1
@z

@x
{{< release-date date="2023-01-18" >}}
@y
{{< release-date date="2023-01-18" >}}
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Fix possible panic when warning conditions appear in multi-platform builds
@y
- Fix possible panic when warning conditions appear in multi-platform builds
@z

@x
## 1.5.0 (labs)
@y
## 1.5.0 (labs)
@z

@x
{{< release-date date="2023-01-10" >}}
@y
{{< release-date date="2023-01-10" >}}
@z

@x
{{< include "dockerfile-labs-channel.md" >}}
@y
{{< include "dockerfile-labs-channel.md" >}}
@z

@x
### New
@y
### New
@z

@x
- `ADD` command now supports [`--checksum` flag](/reference/dockerfile.md#verifying-a-remote-file-checksum-add---checksumchecksum-http-src-dest)
  to validate the contents of the remote URL contents
@y
- `ADD` command now supports [`--checksum` flag](reference/dockerfile.md#verifying-a-remote-file-checksum-add---checksumchecksum-http-src-dest)
  to validate the contents of the remote URL contents
@z

@x
## 1.5.0
@y
## 1.5.0
@z

@x
{{< release-date date="2023-01-10" >}}
@y
{{< release-date date="2023-01-10" >}}
@z

@x
### New
@y
### New
@z

@x
- `ADD` command can now [import files directly from Git URLs](/reference/dockerfile.md#adding-a-git-repository-add-git-ref-dir)
@y
- `ADD` command can now [import files directly from Git URLs](reference/dockerfile.md#adding-a-git-repository-add-git-ref-dir)
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Named contexts now support `oci-layout://` protocol for including images from
  local OCI layout structure
- Dockerfile now supports secondary requests for listing all build targets or
  printing outline of accepted parameters for a specific build target
- Dockerfile `#syntax` directive that redirects to an external frontend image
  now allows the directive to be also set with `//` comments or JSON. The file
  may also contain a shebang header
- Named context can now be initialized with an empty scratch image
- Named contexts can now be initialized with an SSH Git URL
- Fix handling of `ONBUILD` when importing Schema1 images
@y
- Named contexts now support `oci-layout://` protocol for including images from
  local OCI layout structure
- Dockerfile now supports secondary requests for listing all build targets or
  printing outline of accepted parameters for a specific build target
- Dockerfile `#syntax` directive that redirects to an external frontend image
  now allows the directive to be also set with `//` comments or JSON. The file
  may also contain a shebang header
- Named context can now be initialized with an empty scratch image
- Named contexts can now be initialized with an SSH Git URL
- Fix handling of `ONBUILD` when importing Schema1 images
@z

@x
## 1.4.3
@y
## 1.4.3
@z

@x
{{< release-date date="2022-08-23" >}}
@y
{{< release-date date="2022-08-23" >}}
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Fix creation timestamp not getting reset when building image from
  `docker-image://` named context
- Fix passing `--platform` flag of `FROM` command when loading
  `docker-image://` named context
@y
- Fix creation timestamp not getting reset when building image from
  `docker-image://` named context
- Fix passing `--platform` flag of `FROM` command when loading
  `docker-image://` named context
@z

@x
## 1.4.2
@y
## 1.4.2
@z

@x
{{< release-date date="2022-05-06" >}}
@y
{{< release-date date="2022-05-06" >}}
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Fix loading certain environment variables from an image passed with built
  context
@y
- Fix loading certain environment variables from an image passed with built
  context
@z

@x
## 1.4.1
@y
## 1.4.1
@z

@x
{{< release-date date="2022-04-08" >}}
@y
{{< release-date date="2022-04-08" >}}
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Fix named context resolution for cross-compilation cases from input when input
  is built for a different platform
@y
- Fix named context resolution for cross-compilation cases from input when input
  is built for a different platform
@z

@x
## 1.4.0
@y
## 1.4.0
@z

@x
{{< release-date date="2022-03-09" >}}
@y
{{< release-date date="2022-03-09" >}}
@z

@x
### New
@y
### New
@z

@x
- [`COPY --link` and `ADD --link`](/reference/dockerfile.md#copy---link)
  allow copying files with increased cache efficiency and rebase images without
  requiring them to be rebuilt. `--link` copies files to a separate layer and
  then uses new LLB MergeOp implementation to chain independent layers together
- [Heredocs](/reference/dockerfile.md#here-documents) support have
  been promoted from labs channel to stable. This feature allows writing
  multiline inline scripts and files
- Additional [named build contexts](/reference/cli/docker/buildx/build.md#build-context)
  can be passed to build to add or overwrite a stage or an image inside the
  build. A source for the context can be a local source, image, Git, or HTTP URL
- [`BUILDKIT_SANDBOX_HOSTNAME` build-arg](/reference/dockerfile.md#buildkit-built-in-build-args)
  can be used to set the default hostname for the `RUN` steps
@y
- [`COPY --link` and `ADD --link`](reference/dockerfile.md#copy---link)
  allow copying files with increased cache efficiency and rebase images without
  requiring them to be rebuilt. `--link` copies files to a separate layer and
  then uses new LLB MergeOp implementation to chain independent layers together
- [Heredocs](reference/dockerfile.md#here-documents) support have
  been promoted from labs channel to stable. This feature allows writing
  multiline inline scripts and files
- Additional [named build contexts](reference/cli/docker/buildx/build.md#build-context)
  can be passed to build to add or overwrite a stage or an image inside the
  build. A source for the context can be a local source, image, Git, or HTTP URL
- [`BUILDKIT_SANDBOX_HOSTNAME` build-arg](reference/dockerfile.md#buildkit-built-in-build-args)
  can be used to set the default hostname for the `RUN` steps
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- When using a cross-compilation stage, the target platform for a step is now
  seen on progress output
- Fix some cases where Heredocs incorrectly removed quotes from content
@y
- When using a cross-compilation stage, the target platform for a step is now
  seen on progress output
- Fix some cases where Heredocs incorrectly removed quotes from content
@z

@x
## 1.3.1
@y
## 1.3.1
@z

@x
{{< release-date date="2021-10-04" >}}
@y
{{< release-date date="2021-10-04" >}}
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Fix parsing "required" mount key without a value
@y
- Fix parsing "required" mount key without a value
@z

@x
## 1.3.0 (labs)
@y
## 1.3.0 (labs)
@z

@x
{{< release-date date="2021-07-16" >}}
@y
{{< release-date date="2021-07-16" >}}
@z

@x
{{< include "dockerfile-labs-channel.md" >}}
@y
{{< include "dockerfile-labs-channel.md" >}}
@z

@x
### New
@y
### New
@z

@x
- `RUN` and `COPY` commands now support [Here-document syntax](/reference/dockerfile.md#here-documents)
  allowing writing multiline inline scripts and files
@y
- `RUN` and `COPY` commands now support [Here-document syntax](reference/dockerfile.md#here-documents)
  allowing writing multiline inline scripts and files
@z

@x
## 1.3.0
@y
## 1.3.0
@z

@x
{{< release-date date="2021-07-16" >}}
@y
{{< release-date date="2021-07-16" >}}
@z

@x
### New
@y
### New
@z

@x
- `RUN` command allows [`--network` flag](/reference/dockerfile.md#run---network)
  for requesting a specific type of network conditions. `--network=host`
  requires allowing `network.host` entitlement. This feature was previously
  only available on labs channel
@y
- `RUN` command allows [`--network` flag](reference/dockerfile.md#run---network)
  for requesting a specific type of network conditions. `--network=host`
  requires allowing `network.host` entitlement. This feature was previously
  only available on labs channel
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- `ADD` command with a remote URL input now correctly handles the `--chmod` flag
- Values for [`RUN --mount` flag](/reference/dockerfile.md#run---mount)
  now support variable expansion, except for the `from` field
- Allow [`BUILDKIT_MULTI_PLATFORM` build arg](/reference/dockerfile.md#buildkit-built-in-build-args)
  to force always creating multi-platform image, even if only contains single
  platform
@y
- `ADD` command with a remote URL input now correctly handles the `--chmod` flag
- Values for [`RUN --mount` flag](reference/dockerfile.md#run---mount)
  now support variable expansion, except for the `from` field
- Allow [`BUILDKIT_MULTI_PLATFORM` build arg](reference/dockerfile.md#buildkit-built-in-build-args)
  to force always creating multi-platform image, even if only contains single
  platform
@z

@x
## 1.2.1 (labs)
@y
## 1.2.1 (labs)
@z

@x
{{< release-date date="2020-12-12" >}}
@y
{{< release-date date="2020-12-12" >}}
@z

@x
{{< include "dockerfile-labs-channel.md" >}}
@y
{{< include "dockerfile-labs-channel.md" >}}
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- `RUN` command allows [`--network` flag](/reference/dockerfile.md#run---network)
  for requesting a specific type of network conditions. `--network=host`
  requires allowing `network.host` entitlement
@y
- `RUN` command allows [`--network` flag](reference/dockerfile.md#run---network)
  for requesting a specific type of network conditions. `--network=host`
  requires allowing `network.host` entitlement
@z

@x
## 1.2.1
@y
## 1.2.1
@z

@x
{{< release-date date="2020-12-12" >}}
@y
{{< release-date date="2020-12-12" >}}
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Revert "Ensure ENTRYPOINT command has at least one argument"
- Optimize processing `COPY` calls on multi-platform cross-compilation builds
@y
- Revert "Ensure ENTRYPOINT command has at least one argument"
- Optimize processing `COPY` calls on multi-platform cross-compilation builds
@z

@x
## 1.2.0 (labs)
@y
## 1.2.0 (labs)
@z

@x
{{< release-date date="2020-12-03" >}}
@y
{{< release-date date="2020-12-03" >}}
@z

@x
{{< include "dockerfile-labs-channel.md" >}}
@y
{{< include "dockerfile-labs-channel.md" >}}
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Experimental channel has been renamed to _labs_
@y
- Experimental channel has been renamed to _labs_
@z

@x
## 1.2.0
@y
## 1.2.0
@z

@x
{{< release-date date="2020-12-03" >}}
@y
{{< release-date date="2020-12-03" >}}
@z

@x
### New
@y
### New
@z

@x
- [`RUN --mount` syntax](/reference/dockerfile.md#run---mount) for
  creating secret, ssh, bind, and cache mounts have been moved to mainline
  channel
- [`ARG` command](/reference/dockerfile.md#arg) now supports defining
  multiple build args on the same line similarly to `ENV`
@y
- [`RUN --mount` syntax](reference/dockerfile.md#run---mount) for
  creating secret, ssh, bind, and cache mounts have been moved to mainline
  channel
- [`ARG` command](reference/dockerfile.md#arg) now supports defining
  multiple build args on the same line similarly to `ENV`
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Metadata load errors are now handled as fatal to avoid incorrect build results
- Allow lowercase Dockerfile name
- `--chown` flag in `ADD` now allows parameter expansion
- `ENTRYPOINT` requires at least one argument to avoid creating broken images
@y
- Metadata load errors are now handled as fatal to avoid incorrect build results
- Allow lowercase Dockerfile name
- `--chown` flag in `ADD` now allows parameter expansion
- `ENTRYPOINT` requires at least one argument to avoid creating broken images
@z

@x
## 1.1.7
@y
## 1.1.7
@z

@x
{{< release-date date="2020-04-18" >}}
@y
{{< release-date date="2020-04-18" >}}
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Forward `FrontendInputs` to the gateway
@y
- Forward `FrontendInputs` to the gateway
@z

@x
## 1.1.2 (experimental)
@y
## 1.1.2 (experimental)
@z

@x
{{< release-date date="2019-07-31" >}}
@y
{{< release-date date="2019-07-31" >}}
@z

@x
{{< include "dockerfile-labs-channel.md" >}}
@y
{{< include "dockerfile-labs-channel.md" >}}
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Allow setting security mode for a process with `RUN --security=sandbox|insecure`
- Allow setting uid/gid for [cache mounts](/reference/dockerfile.md#run---mounttypecache)
- Avoid requesting internally linked paths to be pulled to build context
- Ensure missing cache IDs default to target paths
- Allow setting namespace for cache mounts with [`BUILDKIT_CACHE_MOUNT_NS` build arg](/reference/dockerfile.md#buildkit-built-in-build-args)
@y
- Allow setting security mode for a process with `RUN --security=sandbox|insecure`
- Allow setting uid/gid for [cache mounts](reference/dockerfile.md#run---mounttypecache)
- Avoid requesting internally linked paths to be pulled to build context
- Ensure missing cache IDs default to target paths
- Allow setting namespace for cache mounts with [`BUILDKIT_CACHE_MOUNT_NS` build arg](reference/dockerfile.md#buildkit-built-in-build-args)
@z

@x
## 1.1.2
@y
## 1.1.2
@z

@x
{{< release-date date="2019-07-31" >}}
@y
{{< release-date date="2019-07-31" >}}
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Fix workdir creation with correct user and don't reset custom ownership
- Fix handling empty build args also used as `ENV`
- Detect circular dependencies
@y
- Fix workdir creation with correct user and don't reset custom ownership
- Fix handling empty build args also used as `ENV`
- Detect circular dependencies
@z

@x
## 1.1.0
@y
## 1.1.0
@z

@x
{{< release-date date="2019-04-27" >}}
@y
{{< release-date date="2019-04-27" >}}
@z

@x
### New
@y
### New
@z

@x
- `ADD/COPY` commands now support implementation based on `llb.FileOp` and do
  not require helper image if builtin file operations support is available
- `--chown` flag for `COPY` command now supports variable expansion
@y
- `ADD/COPY` commands now support implementation based on `llb.FileOp` and do
  not require helper image if builtin file operations support is available
- `--chown` flag for `COPY` command now supports variable expansion
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- To find the files ignored from the build context Dockerfile frontend will
  first look for a file `<path/to/Dockerfile>.dockerignore` and if it is not
  found `.dockerignore` file will be looked up from the root of the build
  context. This allows projects with multiple Dockerfiles to use different
  `.dockerignore` definitions
@y
- To find the files ignored from the build context Dockerfile frontend will
  first look for a file `<path/to/Dockerfile>.dockerignore` and if it is not
  found `.dockerignore` file will be looked up from the root of the build
  context. This allows projects with multiple Dockerfiles to use different
  `.dockerignore` definitions
@z
