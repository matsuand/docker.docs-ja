%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Dockerfile release notes
description: Release notes for Dockerfile frontend
keywords: build, dockerfile, frontend, release notes
toc_max: 2
---
@y
---
title: Dockerfile release notes
description: Release notes for Dockerfile frontend
keywords: build, dockerfile, frontend, release notes
toc_max: 2
---
@z

@x
This page contains information about the new features, improvements, known
issues, and bug fixes in [Dockerfile reference](../../reference/dockerfile.md).
@y
This page contains information about the new features, improvements, known
issues, and bug fixes in [Dockerfile reference](../../reference/dockerfile.md).
@z

@x
For usage, see the [Dockerfile frontend syntax](frontend.md) page.
@y
For usage, see the [Dockerfile frontend syntax](frontend.md) page.
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
  [`HEALTHCHECK` instruction](../../reference/dockerfile.md#healthcheck).
@y
- Add `--start-interval` flag to the
  [`HEALTHCHECK` instruction](../../reference/dockerfile.md#healthcheck).
@z

@x
The following features have graduated from the labs channel to stable:
@y
The following features have graduated from the labs channel to stable:
@z

@x
- The `ADD` instruction can now [import files directly from Git URLs](../../reference/dockerfile.md#adding-a-git-repository-add-git-ref-dir)
- The `ADD` instruction now supports [`--checksum` flag](../../reference/dockerfile.md#verifying-a-remote-file-checksum-add---checksumchecksum-http-src-dest)
  to validate the contents of the remote URL contents
@y
- The `ADD` instruction can now [import files directly from Git URLs](../../reference/dockerfile.md#adding-a-git-repository-add-git-ref-dir)
- The `ADD` instruction now supports [`--checksum` flag](../../reference/dockerfile.md#verifying-a-remote-file-checksum-add---checksumchecksum-http-src-dest)
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
- `ADD` command now supports [`--checksum` flag](../../reference/dockerfile.md#verifying-a-remote-file-checksum-add---checksumchecksum-http-src-dest)
  to validate the contents of the remote URL contents
@y
- `ADD` command now supports [`--checksum` flag](../../reference/dockerfile.md#verifying-a-remote-file-checksum-add---checksumchecksum-http-src-dest)
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
- `ADD` command can now [import files directly from Git URLs](../../reference/dockerfile.md#adding-a-git-repository-add-git-ref-dir)
@y
- `ADD` command can now [import files directly from Git URLs](../../reference/dockerfile.md#adding-a-git-repository-add-git-ref-dir)
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
- [`COPY --link` and `ADD --link`](../../reference/dockerfile.md#copy---link)
  allow copying files with increased cache efficiency and rebase images without
  requiring them to be rebuilt. `--link` copies files to a separate layer and
  then uses new LLB MergeOp implementation to chain independent layers together
- [Heredocs](../../reference/dockerfile.md#here-documents) support have
  been promoted from labs channel to stable. This feature allows writing
  multiline inline scripts and files
- Additional [named build contexts](../../reference/cli/docker/buildx/build.md#build-context)
  can be passed to build to add or overwrite a stage or an image inside the
  build. A source for the context can be a local source, image, Git, or HTTP URL
- [`BUILDKIT_SANDBOX_HOSTNAME` build-arg](../../reference/dockerfile.md#buildkit-built-in-build-args)
  can be used to set the default hostname for the `RUN` steps
@y
- [`COPY --link` and `ADD --link`](../../reference/dockerfile.md#copy---link)
  allow copying files with increased cache efficiency and rebase images without
  requiring them to be rebuilt. `--link` copies files to a separate layer and
  then uses new LLB MergeOp implementation to chain independent layers together
- [Heredocs](../../reference/dockerfile.md#here-documents) support have
  been promoted from labs channel to stable. This feature allows writing
  multiline inline scripts and files
- Additional [named build contexts](../../reference/cli/docker/buildx/build.md#build-context)
  can be passed to build to add or overwrite a stage or an image inside the
  build. A source for the context can be a local source, image, Git, or HTTP URL
- [`BUILDKIT_SANDBOX_HOSTNAME` build-arg](../../reference/dockerfile.md#buildkit-built-in-build-args)
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
- `RUN` and `COPY` commands now support [Here-document syntax](../../reference/dockerfile.md#here-documents)
  allowing writing multiline inline scripts and files
@y
- `RUN` and `COPY` commands now support [Here-document syntax](../../reference/dockerfile.md#here-documents)
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
- `RUN` command allows [`--network` flag](../../reference/dockerfile.md#run---network)
  for requesting a specific type of network conditions. `--network=host`
  requires allowing `network.host` entitlement. This feature was previously
  only available on labs channel
@y
- `RUN` command allows [`--network` flag](../../reference/dockerfile.md#run---network)
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
- Values for [`RUN --mount` flag](../../reference/dockerfile.md#run---mount)
  now support variable expansion, except for the `from` field
- Allow [`BUILDKIT_MULTI_PLATFORM` build arg](../../reference/dockerfile.md#buildkit-built-in-build-args)
  to force always creating multi-platform image, even if only contains single
  platform
@y
- `ADD` command with a remote URL input now correctly handles the `--chmod` flag
- Values for [`RUN --mount` flag](../../reference/dockerfile.md#run---mount)
  now support variable expansion, except for the `from` field
- Allow [`BUILDKIT_MULTI_PLATFORM` build arg](../../reference/dockerfile.md#buildkit-built-in-build-args)
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
- `RUN` command allows [`--network` flag](../../reference/dockerfile.md#run---network)
  for requesting a specific type of network conditions. `--network=host`
  requires allowing `network.host` entitlement
@y
- `RUN` command allows [`--network` flag](../../reference/dockerfile.md#run---network)
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
- [`RUN --mount` syntax](../../reference/dockerfile.md#run---mount) for
  creating secret, ssh, bind, and cache mounts have been moved to mainline
  channel
- [`ARG` command](../../reference/dockerfile.md#arg) now supports defining
  multiple build args on the same line similarly to `ENV`
@y
- [`RUN --mount` syntax](../../reference/dockerfile.md#run---mount) for
  creating secret, ssh, bind, and cache mounts have been moved to mainline
  channel
- [`ARG` command](../../reference/dockerfile.md#arg) now supports defining
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
- Allow setting uid/gid for [cache mounts](../../reference/dockerfile.md#run---mounttypecache)
- Avoid requesting internally linked paths to be pulled to build context
- Ensure missing cache IDs default to target paths
- Allow setting namespace for cache mounts with [`BUILDKIT_CACHE_MOUNT_NS` build arg](../../reference/dockerfile.md#buildkit-built-in-build-args)
@y
- Allow setting security mode for a process with `RUN --security=sandbox|insecure`
- Allow setting uid/gid for [cache mounts](../../reference/dockerfile.md#run---mounttypecache)
- Avoid requesting internally linked paths to be pulled to build context
- Ensure missing cache IDs default to target paths
- Allow setting namespace for cache mounts with [`BUILDKIT_CACHE_MOUNT_NS` build arg](../../reference/dockerfile.md#buildkit-built-in-build-args)
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
