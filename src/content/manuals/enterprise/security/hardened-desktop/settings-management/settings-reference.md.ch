%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応
% snip 対応

@x
title: Settings reference
linkTitle: Settings reference
description: Complete reference for all Docker Desktop settings and configuration options
keywords: docker desktop settings, configuration reference, admin controls, settings management
@y
title: Settings reference
linkTitle: Settings reference
description: Complete reference for all Docker Desktop settings and configuration options
keywords: docker desktop settings, configuration reference, admin controls, settings management
@z

@x
This reference documents all Docker Desktop settings and configuration options. Use this to understand setting behavior across different configuration methods and platforms. It is organized to match the Docker Desktop GUI structure.
@y
This reference documents all Docker Desktop settings and configuration options. Use this to understand setting behavior across different configuration methods and platforms. It is organized to match the Docker Desktop GUI structure.
@z

@x
Each setting includes:
@y
Each setting includes:
@z

@x
- Default and accepted values
- Platform compatibility
- Configuration methods (Docker Desktop GUI, Admin Console, `admin-settings.json` file, or CLI)
- Enterprise security recommendations where applicable
@y
- Default and accepted values
- Platform compatibility
- Configuration methods (Docker Desktop GUI, Admin Console, `admin-settings.json` file, or CLI)
- Enterprise security recommendations where applicable
@z

@x
## General settings
@y
## General settings
@z

@x
### Start Docker Desktop when you sign in to your computer
@y
### Start Docker Desktop when you sign in to your computer
@z

@x
| Default value | Accepted values | Format |
|---------------|-----------------|--------|
| `false`       | `true`, `false` | Boolean |
@y
| Default value | Accepted values | Format |
|---------------|-----------------|--------|
| `false`       | `true`, `false` | Boolean |
@z

@x
- **Description:** Automatic startup of Docker Desktop when the user logs in to their computer.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Ensure Docker Desktop is always available after system boot.
- **Configure this setting with:**
    - **General** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** Automatic startup of Docker Desktop when the user logs in to their computer.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Ensure Docker Desktop is always available after system boot.
- **Configure this setting with:**
    - **General** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
### Open Docker Dashboard when Docker Desktop starts
@y
### Open Docker Dashboard when Docker Desktop starts
@z

@x
| Default value | Accepted values            | Format |
|---------------|----------------------------|--------|
| `false`      | `true`, `false`  | Boolean   |
@y
| Default value | Accepted values            | Format |
|---------------|----------------------------|--------|
| `false`      | `true`, `false`  | Boolean   |
@z

@x
- **Description:** Whether the Docker Dashboard opens automatically when Docker Desktop launches.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Provide immediate access to containers, images, and volumes after startup.
- **Configure this setting with:**
    - **General** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** Whether the Docker Dashboard opens automatically when Docker Desktop launches.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Provide immediate access to containers, images, and volumes after startup.
- **Configure this setting with:**
    - **General** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
### Choose theme for Docker Desktop
@y
### Choose theme for Docker Desktop
@z

@x
| Default value | Accepted values            | Format |
|---------------|----------------------------|--------|
| `system`      | `light`, `dark`, `system`  | Enum   |
@y
| Default value | Accepted values            | Format |
|---------------|----------------------------|--------|
| `system`      | `light`, `dark`, `system`  | Enum   |
@z

@x
- **Description:** Visual appearance of the Docker Desktop interface.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Customize interface appearance to match user preferences or system theme.
- **Configure this setting with:**
    - **General** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** Visual appearance of the Docker Desktop interface.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Customize interface appearance to match user preferences or system theme.
- **Configure this setting with:**
    - **General** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
### Configure shell completions
@y
### Configure shell completions
@z

@x
| Default value | Accepted values         | Format |
|---------------|-------------------------|--------|
| `integrated`  | `integrated`, `system`  | String |
@y
| Default value | Accepted values         | Format |
|---------------|-------------------------|--------|
| `integrated`  | `integrated`, `system`  | String |
@z

@x
- **Description:** How Docker CLI auto-completion integrates with the user's shell.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Control whether Docker modifies shell configuration files for auto-completion.
- **Configure this setting with:**
    - **General** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** How Docker CLI auto-completion integrates with the user's shell.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Control whether Docker modifies shell configuration files for auto-completion.
- **Configure this setting with:**
    - **General** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
### Choose container terminal
@y
### Choose container terminal
@z

@x
| Default value | Accepted values         | Format |
|---------------|-------------------------|--------|
| `integrated`  | `integrated`, `system`  | String |
@y
| Default value | Accepted values         | Format |
|---------------|-------------------------|--------|
| `integrated`  | `integrated`, `system`  | String |
@z

@x
- **Description:** Default terminal used when launching Docker CLI from Docker Desktop.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Set preferred terminal application for Docker CLI interactions.
- **Configure this setting with:**
    - **General** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** Default terminal used when launching Docker CLI from Docker Desktop.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Set preferred terminal application for Docker CLI interactions.
- **Configure this setting with:**
    - **General** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
### Enable Docker terminal
@y
### Enable Docker terminal
@z

@x
| Default value | Accepted values | Format |
|---------------|-----------------|--------|
| `false`       | `true`, `false` | Boolean |
@y
| Default value | Accepted values | Format |
|---------------|-----------------|--------|
| `false`       | `true`, `false` | Boolean |
@z

@x
- **Description:** Access to Docker Desktop's integrated terminal feature. If
the value is set to `false`, users can't use the Docker terminal to interact
with the host machine and execute commands directly from Docker Desktop.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Allow or restrict developer access to the built-in terminal for host system interaction.
- **Configure this setting with:**
    - **General** setting in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `desktopTerminalEnabled` setting in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
@y
- **Description:** Access to Docker Desktop's integrated terminal feature. If
the value is set to `false`, users can't use the Docker terminal to interact
with the host machine and execute commands directly from Docker Desktop.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Allow or restrict developer access to the built-in terminal for host system interaction.
- **Configure this setting with:**
    - **General** setting in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `desktopTerminalEnabled` setting in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
@z

@x
> [!NOTE]
>
> In hardened environments, disable and lock this setting to limit host access.
@y
> [!NOTE]
>
> In hardened environments, disable and lock this setting to limit host access.
@z

@x
### Enable Docker Debug by default
@y
### Enable Docker Debug by default
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `false`       | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `false`       | `true`, `false` | Boolean  |
@z

@x
- **Description:** Whether debug logging is turned on by default for Docker CLI commands.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Provide verbose output for troubleshooting and support scenarios.
- **Configure this setting with:**
    - **General** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** Whether debug logging is turned on by default for Docker CLI commands.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Provide verbose output for troubleshooting and support scenarios.
- **Configure this setting with:**
    - **General** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
### Include VM in Time Machine backup
@y
### Include VM in Time Machine backup
@z

@x
| Default value | Accepted values | Format |
|---------------|-----------------|--------|
| `false`       | `true`, `false` | Boolean |
@y
| Default value | Accepted values | Format |
|---------------|-----------------|--------|
| `false`       | `true`, `false` | Boolean |
@z

@x
- **Description:** Whether the Docker Desktop virtual machine is included in macOS Time Machine backups.
- **OS:** {{< badge color=blue text="Mac only" >}}
- **Use case:** Balance backup completeness with backup size and performance.
- **Configure this setting with:**
    - **General** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** Whether the Docker Desktop virtual machine is included in macOS Time Machine backups.
- **OS:** {{< badge color=blue text="Mac only" >}}
- **Use case:** Balance backup completeness with backup size and performance.
- **Configure this setting with:**
    - **General** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
### Use containerd for pulling and storing images
@y
### Use containerd for pulling and storing images
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `false`       | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `false`       | `true`, `false` | Boolean  |
@z

@x
- **Description:** Image storage backend used by Docker Desktop.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Improve image handling performance and enable containerd-native features.
- **Configure this setting with:**
    - **General** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** Image storage backend used by Docker Desktop.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Improve image handling performance and enable containerd-native features.
- **Configure this setting with:**
    - **General** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
### Choose Virtual Machine Manager
@y
### Choose Virtual Machine Manager
@z

@x
#### Docker VMM
@y
#### Docker VMM
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@z

@x
#### Apple Virtualization framework
@y
#### Apple Virtualization framework
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@z

@x
- **Description:** Use Apple Virtualization Framework to run Docker containers.
- **OS:** {{< badge color=blue text="Mac only" >}}
- **Use case:** Improve VM performance on Apple Silicon.
- **Configure this setting with:**
    - **General** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** Use Apple Virtualization Framework to run Docker containers.
- **OS:** {{< badge color=blue text="Mac only" >}}
- **Use case:** Improve VM performance on Apple Silicon.
- **Configure this setting with:**
    - **General** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
#### Rosetta
@y
#### Rosetta
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@z

@x
- **Description:** Use Rosetta to emulate `amd64` on Apple Silicon. If value
is set to `true`, Docker Desktop turns on Rosetta to accelerate
x86_64/amd64 binary emulation on Apple Silicon.
- **OS:** {{< badge color=blue text="Mac only" >}} 13+
- **Use case:** Run Intel-based containers on Apple Silicon hosts.
- **Configure this setting with:**
    - **General** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management:`useVirtualizationFrameworkRosetta` setting in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Use Rosetta for x86_64/amd64 emulation on Apple Silicon** setting in the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
- **Description:** Use Rosetta to emulate `amd64` on Apple Silicon. If value
is set to `true`, Docker Desktop turns on Rosetta to accelerate
x86_64/amd64 binary emulation on Apple Silicon.
- **OS:** {{< badge color=blue text="Mac only" >}} 13+
- **Use case:** Run Intel-based containers on Apple Silicon hosts.
- **Configure this setting with:**
    - **General** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management:`useVirtualizationFrameworkRosetta` setting in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Use Rosetta for x86_64/amd64 emulation on Apple Silicon** setting in the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
> [!NOTE]
>
> In hardened environments, disable and lock this setting so only ARM-native
images are permitted.
@y
> [!NOTE]
>
> In hardened environments, disable and lock this setting so only ARM-native
images are permitted.
@z

@x
> [!NOTE]
>
> Rosetta requires enabling Apple Virtualization framework.
@y
> [!NOTE]
>
> Rosetta requires enabling Apple Virtualization framework.
@z

@x
#### QEMU
@y
#### QEMU
@z

@x
> [!WARNING]
>
> QEMU has been deprecated in Docker Desktop versions 4.44 and later. For more information, see the [blog announcement](https://www.docker.com/blog/docker-desktop-for-mac-qemu-virtualization-option-to-be-deprecated-in-90-days/)
@y
> [!WARNING]
>
> QEMU has been deprecated in Docker Desktop versions 4.44 and later. For more information, see the [blog announcement](https://www.docker.com/blog/docker-desktop-for-mac-qemu-virtualization-option-to-be-deprecated-in-90-days/)
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@z

@x
### Choose file sharing implementation
@y
### Choose file sharing implementation
@z

@x
#### VirtioFS
@y
#### VirtioFS
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@z

@x
- **Description:** Use VirtioFS for fast, native file sharing between host and
containers. If value is set to `true`, VirtioFS is set as the file sharing
mechanism. If both VirtioFS and gRPC are set to `true`, VirtioFS takes
precedence.
- **OS:** {{< badge color=blue text="Mac only" >}} 12.5+
- **Use case:** Achieve better file system performance and compatibility on modern macOS.
- **Configure this setting with:**
    - **General settings** in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `useVirtualizationFrameworkVirtioFS` setting in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Use VirtioFS for file sharing** setting in the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
- **Description:** Use VirtioFS for fast, native file sharing between host and
containers. If value is set to `true`, VirtioFS is set as the file sharing
mechanism. If both VirtioFS and gRPC are set to `true`, VirtioFS takes
precedence.
- **OS:** {{< badge color=blue text="Mac only" >}} 12.5+
- **Use case:** Achieve better file system performance and compatibility on modern macOS.
- **Configure this setting with:**
    - **General settings** in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `useVirtualizationFrameworkVirtioFS` setting in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Use VirtioFS for file sharing** setting in the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
> [!NOTE]
>
> In hardened environments, enable and lock this setting for macOS 12.5 and
later.
@y
> [!NOTE]
>
> In hardened environments, enable and lock this setting for macOS 12.5 and
later.
@z

@x
#### gRPC FUSE
@y
#### gRPC FUSE
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@z

@x
- **Description:** Enable gRPC FUSE for macOS file sharing. If value is set to
`true`, gRPC Fuse is set as the file sharing mechanism.
- **OS:** {{< badge color=blue text="Mac only" >}}
- **Use case:** Alternative file sharing with improved performance over legacy osxfs.
- **Configure this setting with:**
    - **General** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `useGrpcfuse` setting in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Use gRPC FUSE for file sharing** setting in the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
- **Description:** Enable gRPC FUSE for macOS file sharing. If value is set to
`true`, gRPC Fuse is set as the file sharing mechanism.
- **OS:** {{< badge color=blue text="Mac only" >}}
- **Use case:** Alternative file sharing with improved performance over legacy osxfs.
- **Configure this setting with:**
    - **General** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `useGrpcfuse` setting in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Use gRPC FUSE for file sharing** setting in the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
> [!NOTE]
>
> In hardened environments, disable and lock this setting.
@y
> [!NOTE]
>
> In hardened environments, disable and lock this setting.
@z

@x
#### osxfs
@y
#### osxfs
@z

@x
| Default value | Accepted values | Format  |
| ------------- | --------------- | ------- |
| `false`       | `true`, `false` | Boolean |
@y
| Default value | Accepted values | Format  |
| ------------- | --------------- | ------- |
| `false`       | `true`, `false` | Boolean |
@z

@x
- **Description:** Use the original osxfs file sharing driver for macOS. When
set to true, Docker Desktop uses osxfs instead of VirtioFS or gRPC FUSE to mount
host directories into containers.
- **OS:** {{< badge color=blue text="Mac only" >}}
- **Use case:** Compatibility with legacy tooling that requires the original file sharing implementation.
- **Configure this setting with:**
    - **General** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** Use the original osxfs file sharing driver for macOS. When
set to true, Docker Desktop uses osxfs instead of VirtioFS or gRPC FUSE to mount
host directories into containers.
- **OS:** {{< badge color=blue text="Mac only" >}}
- **Use case:** Compatibility with legacy tooling that requires the original file sharing implementation.
- **Configure this setting with:**
    - **General** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
### Send usage statistics
@y
### Send usage statistics
@z

@x
| Default value | Accepted values | Format |
|---------------|-----------------|--------|
| `true`        | `true`, `false` | Boolean |
@y
| Default value | Accepted values | Format |
|---------------|-----------------|--------|
| `true`        | `true`, `false` | Boolean |
@z

@x
- **Description:** Controls whether Docker Desktop collects and sends local
usage statistics and crash reports to Docker. This setting affects telemetry
gathered from the Docker Desktop application itself. It does not affect
server-side telemetry collected via Docker Hub or other backend services, such
as sign in timestamps, pulls, or builds.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Help Docker improve the product based on usage patterns.
- **Configure this setting with:**
    - **General** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `analyticsEnabled` setting in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Send usage statistics** setting in the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
- **Description:** Controls whether Docker Desktop collects and sends local
usage statistics and crash reports to Docker. This setting affects telemetry
gathered from the Docker Desktop application itself. It does not affect
server-side telemetry collected via Docker Hub or other backend services, such
as sign in timestamps, pulls, or builds.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Help Docker improve the product based on usage patterns.
- **Configure this setting with:**
    - **General** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `analyticsEnabled` setting in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Send usage statistics** setting in the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
> [!NOTE]
>
> In hardened environments, disable and lock this setting. This allows you
to control all your data flows and collect support logs via secure channels
if needed.
@y
> [!NOTE]
>
> In hardened environments, disable and lock this setting. This allows you
to control all your data flows and collect support logs via secure channels
if needed.
@z

@x
> [!NOTE]
>
> Organizations using the Insights Dashboard may need this setting enabled to
ensure that developer activity is fully visible. If users opt out and the
setting is not locked, their activity may be excluded from analytics
views.
@y
> [!NOTE]
>
> Organizations using the Insights Dashboard may need this setting enabled to
ensure that developer activity is fully visible. If users opt out and the
setting is not locked, their activity may be excluded from analytics
views.
@z

@x
### Use Enhanced Container Isolation
@y
### Use Enhanced Container Isolation
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `false`       | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `false`       | `true`, `false` | Boolean  |
@z

@x
- **Description:** Advanced container security through Linux user namespaces and additional isolation.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Prevent containers from modifying Docker Desktop VM configuration or accessing sensitive host areas.
- **Configure this setting with:**
    - **General settings** in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `enhancedContainerIsolation` setting in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Enable enhanced container isolation** setting in the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
- **Description:** Advanced container security through Linux user namespaces and additional isolation.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Prevent containers from modifying Docker Desktop VM configuration or accessing sensitive host areas.
- **Configure this setting with:**
    - **General settings** in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `enhancedContainerIsolation` setting in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Enable enhanced container isolation** setting in the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
> [!NOTE]
>
> In hardened environments, disable and lock this setting. This allows you
to control all your data flows and collect support logs via secure channels
if needed.
@y
> [!NOTE]
>
> In hardened environments, disable and lock this setting. This allows you
to control all your data flows and collect support logs via secure channels
if needed.
@z

@x
### Show CLI hints
@y
### Show CLI hints
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`       | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`       | `true`, `false` | Boolean  |
@z

@x
- **Description:** Display of helpful CLI suggestions in the terminal when using Docker commands.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Help users discover Docker CLI features through contextual tips.
- **Configure this setting with:**
    - **General** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** Display of helpful CLI suggestions in the terminal when using Docker commands.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Help users discover Docker CLI features through contextual tips.
- **Configure this setting with:**
    - **General** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
### Enable Scout image analysis
@y
### Enable Scout image analysis
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@z

@x
- **Description:** Docker Scout SBOM generation and vulnerability scanning for container images.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Turn on vulnerability scanning and software bill of materials analysis.
- **Configure this setting with:**
    - **General settings** in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `sbomIndexing` setting in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **SBOM indexing** settings in the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
- **Description:** Docker Scout SBOM generation and vulnerability scanning for container images.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Turn on vulnerability scanning and software bill of materials analysis.
- **Configure this setting with:**
    - **General settings** in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `sbomIndexing` setting in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **SBOM indexing** settings in the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
> [!NOTE]
>
> In hardened environments, enable and lock this setting to ensure compliance scanning is always available.
@y
> [!NOTE]
>
> In hardened environments, enable and lock this setting to ensure compliance scanning is always available.
@z

@x
### Enable background Scout SBOM indexing
@y
### Enable background Scout SBOM indexing
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `false`        | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `false`        | `true`, `false` | Boolean  |
@z

@x
- **Description:** Automatic SBOM indexing for images without requiring user interaction.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Keep image metadata current by indexing during idle time or after image operations.
- **Configure this setting with:**
    - **General settings** in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** Automatic SBOM indexing for images without requiring user interaction.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Keep image metadata current by indexing during idle time or after image operations.
- **Configure this setting with:**
    - **General settings** in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
> [!NOTE]
>
> In hardened environments, enable and lock this setting for continuous security analysis.
@y
> [!NOTE]
>
> In hardened environments, enable and lock this setting for continuous security analysis.
@z

@x
### Automatically check configuration
@y
### Automatically check configuration
@z

@x
| Default value         | Accepted values | Format  |
|-----------------------|-----------------|---------|
| `CurrentSettingsVersions` | Integer         | Integer |
@y
| Default value         | Accepted values | Format  |
|-----------------------|-----------------|---------|
| `CurrentSettingsVersions` | Integer         | Integer |
@z

@x
- **Description:** Regular verification that Docker Desktop configuration hasn't been modified by external applications.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Track configuration versions for compatibility and change detection.
- **Configure this setting with:**
    - **General** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `configurationFileVersion` setting in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
@y
- **Description:** Regular verification that Docker Desktop configuration hasn't been modified by external applications.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Track configuration versions for compatibility and change detection.
- **Configure this setting with:**
    - **General** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `configurationFileVersion` setting in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
@z

@x
## Resources settings
@y
## Resources settings
@z

@x
### CPU limit
@y
### CPU limit
@z

@x
| Default value                                 | Accepted values | Format  |
|-----------------------------------------------|-----------------|---------|
| Number of logical CPU cores available on host | Integer         | Integer |
@y
| Default value                                 | Accepted values | Format  |
|-----------------------------------------------|-----------------|---------|
| Number of logical CPU cores available on host | Integer         | Integer |
@z

@x
- **Description:** Number of CPU cores allocated to the Docker Desktop virtual machine.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Balance Docker performance with host system resource availability.
- **Configure this setting with:**
    - **Advanced** Resources settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** Number of CPU cores allocated to the Docker Desktop virtual machine.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Balance Docker performance with host system resource availability.
- **Configure this setting with:**
    - **Advanced** Resources settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
### Memory limit
@y
### Memory limit
@z

@x
| Default value              | Accepted values | Format  |
|---------------------------|-----------------|---------|
| Based on system resources | Integer         | Integer |
@y
| Default value              | Accepted values | Format  |
|---------------------------|-----------------|---------|
| Based on system resources | Integer         | Integer |
@z

@x
- **Description:** Amount of RAM (in MiB) allocated to the Docker Desktop virtual machine.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Control memory allocation to optimize performance for both Docker and host applications.
- **Configure this setting with:**
    - **Advanced** Resources settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** Amount of RAM (in MiB) allocated to the Docker Desktop virtual machine.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Control memory allocation to optimize performance for both Docker and host applications.
- **Configure this setting with:**
    - **Advanced** Resources settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
### Swap
@y
### Swap
@z

@x
| Default value | Accepted values | Format  |
|---------------|-----------------|---------|
| `1024`        | Integer         | Integer |
@y
| Default value | Accepted values | Format  |
|---------------|-----------------|---------|
| `1024`        | Integer         | Integer |
@z

@x
- **Description:** Amount of swap space (in MiB) available to the Docker virtual machine.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Extend available memory for container workloads when physical RAM is limited.
- **Configure this setting with:**
    - **Advanced** Resources settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** Amount of swap space (in MiB) available to the Docker virtual machine.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Extend available memory for container workloads when physical RAM is limited.
- **Configure this setting with:**
    - **Advanced** Resources settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
### Disk usage limit
@y
### Disk usage limit
@z

@x
| Default value                  | Accepted values | Format  |
|-------------------------------|-----------------|---------|
| Default disk size of machine. | Integer         | Integer |
@y
| Default value                  | Accepted values | Format  |
|-------------------------------|-----------------|---------|
| Default disk size of machine. | Integer         | Integer |
@z

@x
- **Description:** Maximum disk space (in MiB) allocated for Docker Desktop data.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Prevent Docker from consuming excessive disk space on the host system.
- **Configure this setting with:**
    - **Advanced** Resources settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** Maximum disk space (in MiB) allocated for Docker Desktop data.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Prevent Docker from consuming excessive disk space on the host system.
- **Configure this setting with:**
    - **Advanced** Resources settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
### Disk image location
@y
### Disk image location
@z

@x
| Default value                                                                 | Accepted values | Format |
|--------------------------------------------------|-----------------|--------|
| macOS: `~/Library/Containers/com.docker.docker/Data/vms/0`  <br> Windows: `%USERPROFILE%\AppData\Local\Docker\wsl\data` | File path       | String |
@y
| Default value                                                                 | Accepted values | Format |
|--------------------------------------------------|-----------------|--------|
| macOS: `~/Library/Containers/com.docker.docker/Data/vms/0`  <br> Windows: `%USERPROFILE%\AppData\Local\Docker\wsl\data` | File path       | String |
@z

@x
- **Description:** File system path where Docker Desktop stores virtual machine data.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Move Docker data to custom storage locations for performance or space management.
- **Configure this setting with:**
    - **Advanced** Resources settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** File system path where Docker Desktop stores virtual machine data.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Move Docker data to custom storage locations for performance or space management.
- **Configure this setting with:**
    - **Advanced** Resources settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
### Enable Resource Saver
@y
### Enable Resource Saver
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@z

@x
- **Description:** Automatic pausing of Docker Desktop when idle to conserve system resources.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Reduce CPU and memory usage when Docker Desktop isn't actively being used.
- **Configure this setting with:**
    - **Advanced** Resources settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** Automatic pausing of Docker Desktop when idle to conserve system resources.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Reduce CPU and memory usage when Docker Desktop isn't actively being used.
- **Configure this setting with:**
    - **Advanced** Resources settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
### File sharing directories
@y
### File sharing directories
@z

@x
| Default value                           | Accepted values                 | Format                  |
|----------------------------------------|---------------------------------|--------------------------|
| Varies by OS                           | List of file paths as strings   | Array list of strings   |
@y
| Default value                           | Accepted values                 | Format                  |
|----------------------------------------|---------------------------------|--------------------------|
| Varies by OS                           | List of file paths as strings   | Array list of strings   |
@z

@x
- **Description:** Host directories that can be mounted into containers as volumes.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Define which host directories containers can access for development workflows.
- **Configure this setting with:**
    - **File sharing** Resources settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `filesharingAllowedDirectories` setting in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Allowed file sharing directories** setting in the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
- **Description:** Host directories that can be mounted into containers as volumes.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Define which host directories containers can access for development workflows.
- **Configure this setting with:**
    - **File sharing** Resources settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `filesharingAllowedDirectories` setting in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Allowed file sharing directories** setting in the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
> [!NOTE]
>
> In hardened environments, lock to an explicit allowlist and disable end-user
edits.
@y
> [!NOTE]
>
> In hardened environments, lock to an explicit allowlist and disable end-user
edits.
@z

@x
### Proxy exclude
@y
### Proxy exclude
@z

@x
| Default value | Accepted values    | Format |
|---------------|--------------------|--------|
| `""`          | List of addresses  | String |
@y
| Default value | Accepted values    | Format |
|---------------|--------------------|--------|
| `""`          | List of addresses  | String |
@z

@x
- **Description:** Network addresses that containers should bypass when using proxy settings.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Define proxy exceptions for internal services or specific domains.
- **Configure this setting with:**
    - **Proxies** Resources settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `proxy` setting with `manual` and `exclude` modes in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Proxy** section in the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
- **Description:** Network addresses that containers should bypass when using proxy settings.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Define proxy exceptions for internal services or specific domains.
- **Configure this setting with:**
    - **Proxies** Resources settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `proxy` setting with `manual` and `exclude` modes in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Proxy** section in the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
> [!NOTE]
>
> In hardened environments, disable and lock this setting to maintain strict proxy control.
@y
> [!NOTE]
>
> In hardened environments, disable and lock this setting to maintain strict proxy control.
@z

@x
### Docker subnet
@y
### Docker subnet
@z

@x
| Default value     | Accepted values | Format |
|-------------------|-----------------|--------|
| `192.168.65.0/24` | IP address      | String |
@y
| Default value     | Accepted values | Format |
|-------------------|-----------------|--------|
| `192.168.65.0/24` | IP address      | String |
@z

@x
- **Description:** Overrides the network range used for vpnkit DHCP/DNS for
`*.docker.internal`.
- **OS:** {{< badge color=blue text="Mac only" >}}
- **Use case:** Customize the subnet used for Docker container networking.
- **Configure this setting with:**
    - Settings Management: `vpnkitCIDR` setting in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **VPN Kit CIDR** setting in the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
- **Description:** Overrides the network range used for vpnkit DHCP/DNS for
`*.docker.internal`.
- **OS:** {{< badge color=blue text="Mac only" >}}
- **Use case:** Customize the subnet used for Docker container networking.
- **Configure this setting with:**
    - Settings Management: `vpnkitCIDR` setting in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **VPN Kit CIDR** setting in the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
### Use kernel networking for UDP
@y
### Use kernel networking for UDP
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `false`       | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `false`       | `true`, `false` | Boolean  |
@z

@x
- **Description:** Use the host’s kernel network stack for UDP traffic instead of Docker’s virtual network driver. This enables faster and more direct UDP communication, but may bypass some container isolation features.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Improve performance for UDP-intensive applications like real-time media, DNS, or gaming.
- **Configure this setting with:**
    - **Network** Resources settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** Use the host’s kernel network stack for UDP traffic instead of Docker’s virtual network driver. This enables faster and more direct UDP communication, but may bypass some container isolation features.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Improve performance for UDP-intensive applications like real-time media, DNS, or gaming.
- **Configure this setting with:**
    - **Network** Resources settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
### Enable host networking
@y
### Enable host networking
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `false`       | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `false`       | `true`, `false` | Boolean  |
@z

@x
- **Description:** Experimental support for containers to use the host network stack directly.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Allow containers to bypass Docker's network isolation for specific scenarios.
- **Configure this setting with:**
    - **Network** Resources settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** Experimental support for containers to use the host network stack directly.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Allow containers to bypass Docker's network isolation for specific scenarios.
- **Configure this setting with:**
    - **Network** Resources settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
### Networking mode
@y
### Networking mode
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `dual-stack` | `ipv4only`, `ipv6only` | String  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `dual-stack` | `ipv4only`, `ipv6only` | String  |
@z

@x
- **Description:** Default IP protocol used when Docker creates new networks.
- **OS:** {{< badge color=blue text="Windows and Mac" >}}
- **Use case:** Align with network infrastructure that supports only IPv4 or IPv6.
- **Configure this setting with:**
    - **Network** Resources settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `defaultNetworkingMode` setting in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Default network IP mode** in the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
- **Description:** Default IP protocol used when Docker creates new networks.
- **OS:** {{< badge color=blue text="Windows and Mac" >}}
- **Use case:** Align with network infrastructure that supports only IPv4 or IPv6.
- **Configure this setting with:**
    - **Network** Resources settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `defaultNetworkingMode` setting in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Default network IP mode** in the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
For more information, see [Networking](/manuals/desktop/features/networking.md#networking-mode-and-dns-behaviour-for-mac-and-windows).
@y
For more information, see [Networking](manuals/desktop/features/networking.md#networking-mode-and-dns-behaviour-for-mac-and-windows).
@z

@x
#### Inhibit DNS resolution for IPv4/IPv6
@y
#### Inhibit DNS resolution for IPv4/IPv6
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `auto` | `ipv4`, `ipv6`, `none` | String  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `auto` | `ipv4`, `ipv6`, `none` | String  |
@z

@x
- **Description:** Filters unsupported DNS record types. Requires Docker Desktop
version 4.43 and up.
- **OS:** {{< badge color=blue text="Windows and Mac" >}}
- **Use case:** Control how Docker filters DNS records returned to containers, improving reliability in environments where only IPv4 or IPv6 is supported.
- **Configure this setting with:**
    - **Network** Resources settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `dnsInhibition` setting in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **DNS filtering behavior** in the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
- **Description:** Filters unsupported DNS record types. Requires Docker Desktop
version 4.43 and up.
- **OS:** {{< badge color=blue text="Windows and Mac" >}}
- **Use case:** Control how Docker filters DNS records returned to containers, improving reliability in environments where only IPv4 or IPv6 is supported.
- **Configure this setting with:**
    - **Network** Resources settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `dnsInhibition` setting in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **DNS filtering behavior** in the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
For more information, see [Networking](/manuals/desktop/features/networking.md#networking-mode-and-dns-behaviour-for-mac-and-windows).
@y
For more information, see [Networking](manuals/desktop/features/networking.md#networking-mode-and-dns-behaviour-for-mac-and-windows).
@z

@x
### Enable WSL engine
@y
### Enable WSL engine
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@z

@x
- **Description:** If the value is set to `true`, Docker Desktop uses the WSL2
based engine. This overrides anything that may have been set at installation
using the `--backend=<backend name>` flag.
- **OS:** {{< badge color=blue text="Windows only" >}} + WSL
- **Use case:** Run Linux containers on Windows using the WSL 2 backend for better performance.
- **Configure this setting with:**
    - **WSL Integration** Resources settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `wslEngineEnabled` setting in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Windows Subsystem for Linux (WSL) Engine** setting in the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
- **Description:** If the value is set to `true`, Docker Desktop uses the WSL2
based engine. This overrides anything that may have been set at installation
using the `--backend=<backend name>` flag.
- **OS:** {{< badge color=blue text="Windows only" >}} + WSL
- **Use case:** Run Linux containers on Windows using the WSL 2 backend for better performance.
- **Configure this setting with:**
    - **WSL Integration** Resources settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `wslEngineEnabled` setting in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Windows Subsystem for Linux (WSL) Engine** setting in the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
> [!NOTE]
>
> In hardened environments, enable and lock this setting for improved security and performance.
@y
> [!NOTE]
>
> In hardened environments, enable and lock this setting for improved security and performance.
@z

@x
## Docker Engine settings
@y
## Docker Engine settings
@z

@x
The Docker Engine settings let you configure low-level daemon settings through a raw JSON object. These settings are passed directly to the dockerd process that powers container management in Docker Desktop.
@y
The Docker Engine settings let you configure low-level daemon settings through a raw JSON object. These settings are passed directly to the dockerd process that powers container management in Docker Desktop.
@z

@x
| Key                   | Example                     | Description                                        | Accepted values / Format       | Default |
| --------------------- | --------------------------- | -------------------------------------------------- | ------------------------------ | ------- |
| `debug`               | `true`                      | Enable verbose logging in the Docker daemon        | Boolean                        | `false` |
| `experimental`        | `true`                      | Enable experimental Docker CLI and daemon features | Boolean                        | `false` |
| `insecure-registries` | `["myregistry.local:5000"]` | Allow pulling from HTTP registries without TLS     | Array of strings (`host:port`) | `[]`    |
| `registry-mirrors`    | `["https://mirror.gcr.io"]` | Define alternative registry endpoints              | Array of URLs                  | `[]`    |
@y
| Key                   | Example                     | Description                                        | Accepted values / Format       | Default |
| --------------------- | --------------------------- | -------------------------------------------------- | ------------------------------ | ------- |
| `debug`               | `true`                      | Enable verbose logging in the Docker daemon        | Boolean                        | `false` |
| `experimental`        | `true`                      | Enable experimental Docker CLI and daemon features | Boolean                        | `false` |
| `insecure-registries` | `["myregistry.local:5000"]` | Allow pulling from HTTP registries without TLS     | Array of strings (`host:port`) | `[]`    |
| `registry-mirrors`    | `["https://mirror.gcr.io"]` | Define alternative registry endpoints              | Array of URLs                  | `[]`    |
@z

@x
- **Description:** Customize the behavior of the Docker daemon using a structured JSON config passed directly to dockerd.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Configure registry access, enable debug logging, or turn on experimental features.
- **Configure this setting with:**
    - **Docker Engine** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** Customize the behavior of the Docker daemon using a structured JSON config passed directly to dockerd.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Configure registry access, enable debug logging, or turn on experimental features.
- **Configure this setting with:**
    - **Docker Engine** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
> [!NOTE]
>
> In hardened environments, provide a vetted configuration and lock it to prevent
unauthorized daemon modifications.
@y
> [!NOTE]
>
> In hardened environments, provide a vetted configuration and lock it to prevent
unauthorized daemon modifications.
@z

@x
> [!IMPORTANT]
>
> Values for this setting are passed as-is to the Docker daemon. Invalid or unsupported fields may prevent Docker Desktop from starting.
@y
> [!IMPORTANT]
>
> Values for this setting are passed as-is to the Docker daemon. Invalid or unsupported fields may prevent Docker Desktop from starting.
@z

@x
## Builders settings
@y
## Builders settings
@z

@x
Builders settings lets you manage Buildx builder instances for advanced image-building scenarios, including multi-platform builds and custom backends.
@y
Builders settings lets you manage Buildx builder instances for advanced image-building scenarios, including multi-platform builds and custom backends.
@z

@x
| Key         | Example                          | Description                                                                | Accepted values / Format  | Default   |
| ----------- | -------------------------------- | -------------------------------------------------------------------------- | ------------------------- | --------- |
| `name`      | `"my-builder"`                   | Name of the builder instance                                               | String                    | —         |
| `driver`    | `"docker-container"`             | Backend used by the builder (`docker`, `docker-container`, `remote`, etc.) | String                    | `docker`  |
| `platforms` | `["linux/amd64", "linux/arm64"]` | Target platforms supported by the builder                                  | Array of platform strings | Host arch |
@y
| Key         | Example                          | Description                                                                | Accepted values / Format  | Default   |
| ----------- | -------------------------------- | -------------------------------------------------------------------------- | ------------------------- | --------- |
| `name`      | `"my-builder"`                   | Name of the builder instance                                               | String                    | —         |
| `driver`    | `"docker-container"`             | Backend used by the builder (`docker`, `docker-container`, `remote`, etc.) | String                    | `docker`  |
| `platforms` | `["linux/amd64", "linux/arm64"]` | Target platforms supported by the builder                                  | Array of platform strings | Host arch |
@z

@x
- **Description:** Buildx builder instances for advanced image building scenarios.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Set up cross-platform builds, remote builders, or custom build environments.
- **Configure this setting with:**
    - **Builders** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** Buildx builder instances for advanced image building scenarios.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Set up cross-platform builds, remote builders, or custom build environments.
- **Configure this setting with:**
    - **Builders** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
> [!NOTE]
>
> Builder definitions are structured as an array of objects, each describing a builder instance. Conflicting or unsupported configurations may cause build errors.
@y
> [!NOTE]
>
> Builder definitions are structured as an array of objects, each describing a builder instance. Conflicting or unsupported configurations may cause build errors.
@z

@x
## AI settings
@y
## AI settings
@z

@x
### Enable Docker Model Runner
@y
### Enable Docker Model Runner
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@z

@x
- **Description:** Docker Model Runner functionality for running AI models in containers.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Run and manage AI/ML models using Docker infrastructure.
- **Configure this setting with:**
    - **AI** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `enableInference` setting in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Enable Docker Model Runner** setting in the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
- **Description:** Docker Model Runner functionality for running AI models in containers.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Run and manage AI/ML models using Docker infrastructure.
- **Configure this setting with:**
    - **AI** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `enableInference` setting in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Enable Docker Model Runner** setting in the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
#### Enable host-side TCP support
@y
#### Enable host-side TCP support
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `false`       | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `false`       | `true`, `false` | Boolean  |
@z

@x
- **Description:** TCP connectivity for Docker Model Runner services.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Allow external applications to connect to Model Runner via TCP.
- **Configure this setting with:**
    - **AI** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `enableInferenceTCP` setting in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Host-side TCP support** setting in the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
- **Description:** TCP connectivity for Docker Model Runner services.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Allow external applications to connect to Model Runner via TCP.
- **Configure this setting with:**
    - **AI** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `enableInferenceTCP` setting in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Host-side TCP support** setting in the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
> [!NOTE]
>
> This setting requires Docker Model Runner setting to be enabled first.
@y
> [!NOTE]
>
> This setting requires Docker Model Runner setting to be enabled first.
@z

@x
##### Port
@y
##### Port
@z

@x
| Default value | Accepted values | Format  |
|---------------|-----------------|---------|
| 12434         | Integer         | Integer |
@y
| Default value | Accepted values | Format  |
|---------------|-----------------|---------|
| 12434         | Integer         | Integer |
@z

@x
- **Description:** Specific port used for Model Runner TCP connections.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Customize the port for Model Runner TCP connectivity.
- **Configure this setting with:**
    - **AI** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `enableInferenceTCPPort` setting in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Host-side TCP port** setting in the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
- **Description:** Specific port used for Model Runner TCP connections.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Customize the port for Model Runner TCP connectivity.
- **Configure this setting with:**
    - **AI** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `enableInferenceTCPPort` setting in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Host-side TCP port** setting in the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
> [!NOTE]
>
> This setting requires Docker Model Runner and host-side TCP support settings to be enabled first.
@y
> [!NOTE]
>
> This setting requires Docker Model Runner and host-side TCP support settings to be enabled first.
@z

@x
##### CORS Allowed Origins
@y
##### CORS Allowed Origins
@z

@x
| Default value | Accepted values                                                                 | Format |
|---------------|---------------------------------------------------------------------------------|--------|
| Empty string  | Empty string to deny all,`*` to accept all, or a list of comma-separated values | String |
@y
| Default value | Accepted values                                                                 | Format |
|---------------|---------------------------------------------------------------------------------|--------|
| Empty string  | Empty string to deny all,`*` to accept all, or a list of comma-separated values | String |
@z

@x
- **Description:** Cross-origin resource sharing settings for Model Runner web integration.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Allow web applications to connect to Model Runner services.
- **Configure this setting with:**
    - **AI** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `enableInferenceCORS` setting in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **CORS Allowed Origins** setting in the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
- **Description:** Cross-origin resource sharing settings for Model Runner web integration.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Allow web applications to connect to Model Runner services.
- **Configure this setting with:**
    - **AI** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `enableInferenceCORS` setting in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **CORS Allowed Origins** setting in the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
> [!NOTE]
>
> This setting requires Docker Model Runner and host-side TCP support settings to be enabled first.
@y
> [!NOTE]
>
> This setting requires Docker Model Runner and host-side TCP support settings to be enabled first.
@z

@x
#### Enable GPU-backed inference
@y
#### Enable GPU-backed inference
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `false`       | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `false`       | `true`, `false` | Boolean  |
@z

@x
- **Description:** GPU-backed inference.
- **OS:** {{< badge color=blue text="Windows only" >}}
- **Use case:** Enable GPU-backed inference. Additional components will be downloaded to ~/.docker/bin/inference.
- **Configure this setting with:**
    - **AI** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `enableInferenceGPUVariant` setting in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Enable GPU-backed inference** setting in the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
- **Description:** GPU-backed inference.
- **OS:** {{< badge color=blue text="Windows only" >}}
- **Use case:** Enable GPU-backed inference. Additional components will be downloaded to ~/.docker/bin/inference.
- **Configure this setting with:**
    - **AI** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `enableInferenceGPUVariant` setting in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Enable GPU-backed inference** setting in the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
## Kubernetes settings
@y
## Kubernetes settings
@z

@x
### Enable Kubernetes
@y
### Enable Kubernetes
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `false`       | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `false`       | `true`, `false` | Boolean  |
@z

@x
- **Description:** Local Kubernetes cluster integration with Docker Desktop.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Provide local Kubernetes development environment for testing and development.
- **Configure this setting with:**
    - **Kubernetes** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `kubernetes` setting in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Allow Kubernetes** setting in the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
- **Description:** Local Kubernetes cluster integration with Docker Desktop.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Provide local Kubernetes development environment for testing and development.
- **Configure this setting with:**
    - **Kubernetes** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `kubernetes` setting in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Allow Kubernetes** setting in the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
> [!NOTE]
>
> In hardened environments, disable and lock this setting unless Kubernetes development is specifically required.
@y
> [!NOTE]
>
> In hardened environments, disable and lock this setting unless Kubernetes development is specifically required.
@z

@x
> [!IMPORTANT]
>
> When Kubernetes is enabled through Settings Management policies, only the
`kubeadm` cluster provisioning method is supported. The `kind` provisioning
method is not yet supported by Settings Management.
@y
> [!IMPORTANT]
>
> When Kubernetes is enabled through Settings Management policies, only the
`kubeadm` cluster provisioning method is supported. The `kind` provisioning
method is not yet supported by Settings Management.
@z

@x
### Choose cluster provisioning method
@y
### Choose cluster provisioning method
@z

@x
| Default value | Accepted values | Format |
|---------------|-----------------|--------|
| `kubeadm`     | `kubeadm`, `kind`  | String |
@y
| Default value | Accepted values | Format |
|---------------|-----------------|--------|
| `kubeadm`     | `kubeadm`, `kind`  | String |
@z

@x
- **Description:** Kubernetes cluster topology and node configuration.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Choose between single-node (`kubeadm`) or multi-node (`kind`)` cluster configurations for different development needs.
- **Configure this setting with:**
    - **Kubernetes** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** Kubernetes cluster topology and node configuration.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Choose between single-node (`kubeadm`) or multi-node (`kind`)` cluster configurations for different development needs.
- **Configure this setting with:**
    - **Kubernetes** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
### Kubernetes node count (kind provisioning)
@y
### Kubernetes node count (kind provisioning)
@z

@x
| Default value | Accepted values | Format  |
|---------------|-----------------|---------|
| `1`           | Integer         | Integer |
@y
| Default value | Accepted values | Format  |
|---------------|-----------------|---------|
| `1`           | Integer         | Integer |
@z

@x
- **Description:** Number of nodes in multi-node Kubernetes clusters.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Scale cluster size for testing distributed applications or cluster features.
- **Configure this setting with:**
    - **Kubernetes** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** Number of nodes in multi-node Kubernetes clusters.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Scale cluster size for testing distributed applications or cluster features.
- **Configure this setting with:**
    - **Kubernetes** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
### Kubernetes node version (kind provisioning)
@y
### Kubernetes node version (kind provisioning)
@z

@x
| Default value | Accepted values               | Format |
|---------------|-------------------------------|--------|
| `1.31.1`      | Semantic version (e.g., 1.29.1) | String |
@y
| Default value | Accepted values               | Format |
|---------------|-------------------------------|--------|
| `1.31.1`      | Semantic version (e.g., 1.29.1) | String |
@z

@x
- **Description:** Kubernetes version used for cluster nodes.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Pin specific Kubernetes versions for consistency or compatibility requirements.
- **Configure this setting with:**
    - **Kubernetes** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** Kubernetes version used for cluster nodes.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Pin specific Kubernetes versions for consistency or compatibility requirements.
- **Configure this setting with:**
    - **Kubernetes** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
### Show system containers
@y
### Show system containers
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `false`       | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `false`       | `true`, `false` | Boolean  |
@z

@x
- **Description:** Visibility of Kubernetes system containers in Docker Desktop Dashboard.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Allow developers to view and debug kube-system containers.
- **Configure this setting with:**
    - **Kubernetes** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** Visibility of Kubernetes system containers in Docker Desktop Dashboard.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Allow developers to view and debug kube-system containers.
- **Configure this setting with:**
    - **Kubernetes** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
> [!NOTE]
>
> In hardened environments, disable and lock this setting to reduce interface complexity.
@y
> [!NOTE]
>
> In hardened environments, disable and lock this setting to reduce interface complexity.
@z

@x
## Software updates settings
@y
## Software updates settings
@z

@x
### Automatically check for updates
@y
### Automatically check for updates
@z

@x
| Default value | Accepted values | Format |
|---------------|-----------------|--------|
| `false`       | `true`, `false` | Boolean |
@y
| Default value | Accepted values | Format |
|---------------|-----------------|--------|
| `false`       | `true`, `false` | Boolean |
@z

@x
- **Description:** Whether Docker Desktop checks for and notifies about available updates. If the
value is set to `true`, checking for updates and notifications about Docker
Desktop updates are disabled.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Control update notifications and automatic version checking.
- **Configure this setting with:**
    - Settings Management: `disableUpdate` setting in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Disable update** setting in the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
- **Description:** Whether Docker Desktop checks for and notifies about available updates. If the
value is set to `true`, checking for updates and notifications about Docker
Desktop updates are disabled.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Control update notifications and automatic version checking.
- **Configure this setting with:**
    - Settings Management: `disableUpdate` setting in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Disable update** setting in the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
> [!NOTE]
>
> In hardened environments, enable this setting and lock. This guarantees that
only internally vetted versions are installed.
@y
> [!NOTE]
>
> In hardened environments, enable this setting and lock. This guarantees that
only internally vetted versions are installed.
@z

@x
### Always download updates
@y
### Always download updates
@z

@x
| Default value | Accepted values | Format |
|---------------|-----------------|--------|
| `false`       | `true`, `false` | Boolean |
@y
| Default value | Accepted values | Format |
|---------------|-----------------|--------|
| `false`       | `true`, `false` | Boolean |
@z

@x
- **Description:** Automatic downloading of Docker Desktop updates when they become available.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Manage bandwidth usage and control when updates are downloaded.
- **Configure this setting with:**
    - **Software updates** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: **Disable updates** setting in the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
- **Description:** Automatic downloading of Docker Desktop updates when they become available.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Manage bandwidth usage and control when updates are downloaded.
- **Configure this setting with:**
    - **Software updates** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: **Disable updates** setting in the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
### Automatically update components
@y
### Automatically update components
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@z

@x
- **Description:** Allow Docker Desktop to automatically update components that don't require a restart.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Automatically updates key Docker Desktop components such as Docker Compose, Docker Scout, the Docker CLI.
- **Configure this setting with:**
    - **General settings** in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md#software-updates)
    - Settings Management: `silentModulesUpdate` setting in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Automatically update components** setting in the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
- **Description:** Allow Docker Desktop to automatically update components that don't require a restart.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Automatically updates key Docker Desktop components such as Docker Compose, Docker Scout, the Docker CLI.
- **Configure this setting with:**
    - **General settings** in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md#software-updates)
    - Settings Management: `silentModulesUpdate` setting in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Automatically update components** setting in the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
## Extensions settings
@y
## Extensions settings
@z

@x
### Enable Docker extensions
@y
### Enable Docker extensions
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@z

@x
- **Description:** Access to Docker Extensions marketplace and installed extensions.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Control whether users can install and run Docker Extensions.
- **Configure this setting with:**
    - **Extensions** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `extensionsEnabled` setting in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Allow Extensions** setting in the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
- **Description:** Access to Docker Extensions marketplace and installed extensions.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Control whether users can install and run Docker Extensions.
- **Configure this setting with:**
    - **Extensions** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `extensionsEnabled` setting in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Allow Extensions** setting in the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
> [!NOTE]
>
> In hardened environments, disable and lock this setting. This prevents
third-party or unvetted plugins from being installed.
@y
> [!NOTE]
>
> In hardened environments, disable and lock this setting. This prevents
third-party or unvetted plugins from being installed.
@z

@x
### Allow only extensions distributed through the Docker Marketplace
@y
### Allow only extensions distributed through the Docker Marketplace
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@z

@x
- **Description:** Restriction of Docker Extensions to only those available through the official marketplace.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Prevent installation of third-party or locally developed extensions.
- **Configure this setting with:**
    - **Extensions** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** Restriction of Docker Extensions to only those available through the official marketplace.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Prevent installation of third-party or locally developed extensions.
- **Configure this setting with:**
    - **Extensions** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
### Show Docker Extensions system containers
@y
### Show Docker Extensions system containers
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `false`       | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `false`       | `true`, `false` | Boolean  |
@z

@x
- **Description:** Visibility of system containers used by Docker Extensions in the container list.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Help developers troubleshoot extension issues by viewing underlying containers.
- **Configure this setting with:**
    - **Extensions** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** Visibility of system containers used by Docker Extensions in the container list.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Help developers troubleshoot extension issues by viewing underlying containers.
- **Configure this setting with:**
    - **Extensions** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
## Beta features settings
@y
## Beta features settings
@z

@x
> [!IMPORTANT]
>
> For Docker Desktop versions 4.41 and earlier, these settings were under the **Experimental features** tab on the **Features in development** page.
@y
> [!IMPORTANT]
>
> For Docker Desktop versions 4.41 and earlier, these settings were under the **Experimental features** tab on the **Features in development** page.
@z

@x
### Enable Docker AI
@y
### Enable Docker AI
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `false`       | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `false`       | `true`, `false` | Boolean  |
@z

@x
- **Description:** Docker AI features including "Ask Gordon" functionality.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Turn on AI-powered assistance and recommendations within Docker Desktop.
- **Configure this setting with:**
    - **Beta** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `enableDockerAI` setting in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Enable Docker AI** setting in the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
- **Description:** Docker AI features including "Ask Gordon" functionality.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Turn on AI-powered assistance and recommendations within Docker Desktop.
- **Configure this setting with:**
    - **Beta** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `enableDockerAI` setting in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Enable Docker AI** setting in the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
### Enable Docker MCP Toolkit
@y
### Enable Docker MCP Toolkit
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`       | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`       | `true`, `false` | Boolean  |
@z

@x
- **Description:** Enable [Docker MCP Toolkit](/manuals/ai/mcp-catalog-and-toolkit/_index.md) in Docker Desktop.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Turn on MCP toolkit features for AI model development workflows.
- **Configure this setting with:**
    - **Beta** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `enableDockerMCPToolkit` setting in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
@y
- **Description:** Enable [Docker MCP Toolkit](manuals/ai/mcp-catalog-and-toolkit/_index.md) in Docker Desktop.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Turn on MCP toolkit features for AI model development workflows.
- **Configure this setting with:**
    - **Beta** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `enableDockerMCPToolkit` setting in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
@z

@x
### Enable Docker Offload
@y
### Enable Docker Offload
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `false`       | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `false`       | `true`, `false` | Boolean  |
@z

@x
- **Description:** Enable [Docker Offload](/offload/) in Docker Desktop.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Offload building and running containers to the cloud.
- **Configure this setting with:**
    - **Beta** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `enableCloud` setting in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Enable Docker Cloud** setting in the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
- **Description:** Enable [Docker Offload](__SUBDIR__/offload/) in Docker Desktop.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Offload building and running containers to the cloud.
- **Configure this setting with:**
    - **Beta** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `enableCloud` setting in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Enable Docker Cloud** setting in the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
### Enable Wasm
@y
### Enable Wasm
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `false`       | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `false`       | `true`, `false` | Boolean  |
@z

@x
- **Description:** Enable [Wasm](/manuals/desktop/features/wasm.md) to run Wasm workloads.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Run WebAssembly applications and modules within Docker containers.
- **Configure this setting with:**
    - **Beta** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** Enable [Wasm](manuals/desktop/features/wasm.md) to run Wasm workloads.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Run WebAssembly applications and modules within Docker containers.
- **Configure this setting with:**
    - **Beta** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
## Notifications settings
@y
## Notifications settings
@z

@x
### Status updates on tasks and processes
@y
### Status updates on tasks and processes
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@z

@x
- **Description:** General informational messages displayed within Docker Desktop.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Control visibility of operational status messages and process updates.
- **Configure this setting with:**
    - **Notifications** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** General informational messages displayed within Docker Desktop.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Control visibility of operational status messages and process updates.
- **Configure this setting with:**
    - **Notifications** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
### Recommendations from Docker
@y
### Recommendations from Docker
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@z

@x
- **Description:** Promotional content and feature recommendations displayed in Docker Desktop.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Manage exposure to Docker marketing content and feature promotions.
- **Configure this setting with:**
    - **Notifications** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** Promotional content and feature recommendations displayed in Docker Desktop.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Manage exposure to Docker marketing content and feature promotions.
- **Configure this setting with:**
    - **Notifications** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
### Docker announcements
@y
### Docker announcements
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@z

@x
- **Description:** General announcements and news displayed within Docker Desktop.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Control visibility of Docker-wide announcements and important updates.
- **Configure this setting with:**
    - **Notifications** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** General announcements and news displayed within Docker Desktop.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Control visibility of Docker-wide announcements and important updates.
- **Configure this setting with:**
    - **Notifications** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
### Docker surveys
@y
### Docker surveys
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@z

@x
- **Description:** Survey invitations and feedback requests displayed to users.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Manage user participation in Docker product feedback and research.
- **Configure this setting with:**
    - **Notifications** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** Survey invitations and feedback requests displayed to users.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Manage user participation in Docker product feedback and research.
- **Configure this setting with:**
    - **Notifications** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
### Docker Scout notification pop-ups
@y
### Docker Scout notification pop-ups
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@z

@x
- **Description:** In-application notifications from Docker Scout vulnerability scanning.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Control visibility of vulnerability scan results and security recommendations.
- **Configure this setting with:**
    - **Notifications** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** In-application notifications from Docker Scout vulnerability scanning.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Control visibility of vulnerability scan results and security recommendations.
- **Configure this setting with:**
    - **Notifications** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
### Docker Scout OS notifications
@y
### Docker Scout OS notifications
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `false`       | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `false`       | `true`, `false` | Boolean  |
@z

@x
- **Description:** Operating system-level notifications from Docker Scout.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Receive Scout security alerts through the system notification center.
- **Configure this setting with:**
    - **Notifications** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** Operating system-level notifications from Docker Scout.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Receive Scout security alerts through the system notification center.
- **Configure this setting with:**
    - **Notifications** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
## Advanced settings
@y
## Advanced settings
@z

@x
### Configure installation of Docker CLI
@y
### Configure installation of Docker CLI
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `system`      | File path       | String   |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `system`      | File path       | String   |
@z

@x
- **Description:** File system location where Docker CLI binaries are installed.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Customize CLI installation location for compliance or tooling integration requirements.
- **Configure this setting with:**
    - **Advanced** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** File system location where Docker CLI binaries are installed.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Customize CLI installation location for compliance or tooling integration requirements.
- **Configure this setting with:**
    - **Advanced** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
### Allow the default Docker socket to be used
@y
### Allow the default Docker socket to be used
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@z

@x
- **Description:** By default, enhanced container isolation blocks bind-mounting
the Docker Engine socket into containers
(e.g., `docker run -v /var/run/docker.sock:/var/run/docker.sock ...`). This lets
you relax this in a controlled way. See ECI Configuration for more info.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Support Docker-in-Docker scenarios, CI agents, or tools like Testcontainers while maintaining Enhanced Container Isolation.
- **Configure this setting with:**
    - **Advanced** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `dockerSocketMount` setting in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
@y
- **Description:** By default, enhanced container isolation blocks bind-mounting
the Docker Engine socket into containers
(e.g., `docker run -v /var/run/docker.sock:/var/run/docker.sock ...`). This lets
you relax this in a controlled way. See ECI Configuration for more info.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Support Docker-in-Docker scenarios, CI agents, or tools like Testcontainers while maintaining Enhanced Container Isolation.
- **Configure this setting with:**
    - **Advanced** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
    - Settings Management: `dockerSocketMount` setting in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
@z

@x
### Allow privileged port mapping
@y
### Allow privileged port mapping
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@z

@x
- **Description:** Permission to bind container ports to privileged ports (1-1024) on the host.
- **OS:** {{< badge color=blue text="Mac only" >}}
- **Use case:** Allow containers to use standard service ports like HTTP (80) or HTTPS (443).
- **Configure this setting with:**
    - **Advanced** settings in [Docker Desktop GUI](/manuals/desktop/settings-and-maintenance/settings.md)
@y
- **Description:** Permission to bind container ports to privileged ports (1-1024) on the host.
- **OS:** {{< badge color=blue text="Mac only" >}}
- **Use case:** Allow containers to use standard service ports like HTTP (80) or HTTPS (443).
- **Configure this setting with:**
    - **Advanced** settings in [Docker Desktop GUI](manuals/desktop/settings-and-maintenance/settings.md)
@z

@x
## Settings only available with Settings Management
@y
## Settings only available with Settings Management
@z

@x
The following settings aren’t shown in the Docker Desktop GUI. You can only configure them using Settings Management with the Admin Console or the `admin-settings.json` file.
@y
The following settings aren’t shown in the Docker Desktop GUI. You can only configure them using Settings Management with the Admin Console or the `admin-settings.json` file.
@z

@x
### Enable Docker Cloud GPU Support
@y
### Enable Docker Cloud GPU Support
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `true`        | `true`, `false` | Boolean  |
@z

@x
- **Description:** Enable GPU support for Docker Cloud features.
- **OS:** {{< badge color=blue text="All" >}}
- **Configure this setting with:**
    - Settings Management: **Enable Docker Cloud GPU Support** setting in the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md
@y
- **Description:** Enable GPU support for Docker Cloud features.
- **OS:** {{< badge color=blue text="All" >}}
- **Configure this setting with:**
    - Settings Management: **Enable Docker Cloud GPU Support** setting in the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md
@z

@x
### Block `docker load`
@y
### Block `docker load`
@z

@x
| Default value | Accepted values | Format |
|---------------|-----------------|--------|
| `false`       | `true`, `false` | Boolean |
@y
| Default value | Accepted values | Format |
|---------------|-----------------|--------|
| `false`       | `true`, `false` | Boolean |
@z

@x
- **Description:** Prevent users from loading local Docker images using the `docker load` command.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Enforce image provenance by requiring all images to come from registries.
- **Configure this setting with:**
    - Settings Management: `blockDockerLoad` setting in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Block Docker Load** setting in the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
- **Description:** Prevent users from loading local Docker images using the `docker load` command.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Enforce image provenance by requiring all images to come from registries.
- **Configure this setting with:**
    - Settings Management: `blockDockerLoad` setting in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Block Docker Load** setting in the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
> [!NOTE]
>
> In hardened environments, enable and lock this setting. This forces all images
to come from your secure, scanned registry.
@y
> [!NOTE]
>
> In hardened environments, enable and lock this setting. This forces all images
to come from your secure, scanned registry.
@z

@x
### Hide onboarding survey
@y
### Hide onboarding survey
@z

@x
| Default value | Accepted values | Format |
|---------------|-----------------|--------|
| `false`       | `true`, `false` | Boolean |
@y
| Default value | Accepted values | Format |
|---------------|-----------------|--------|
| `false`       | `true`, `false` | Boolean |
@z

@x
- **Description:** Prevent the onboarding survey from being shown to new users.
- **OS:** {{< badge color=blue text="All" >}}
- **Configure this setting with:**
    - Settings Management: `displayedOnboarding` setting in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Block Docker Load** setting in the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
- **Description:** Prevent the onboarding survey from being shown to new users.
- **OS:** {{< badge color=blue text="All" >}}
- **Configure this setting with:**
    - Settings Management: `displayedOnboarding` setting in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Block Docker Load** setting in the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
### Expose Docker API on TCP 2375
@y
### Expose Docker API on TCP 2375
@z

@x
| Default value | Accepted values | Format |
|---------------|-----------------|--------|
| `false`       | `true`, `false` | Boolean |
@y
| Default value | Accepted values | Format |
|---------------|-----------------|--------|
| `false`       | `true`, `false` | Boolean |
@z

@x
- **Description:** Exposes the Docker API over an unauthenticated TCP socket on port 2375. Only recommended for isolated and protected environments.
- **OS:** {{< badge color=blue text="Windows only" >}}
- **Use case:** Support legacy integrations that require TCP API access.
- **Configure this setting with:**
    - Settings Management: `exposeDockerAPIOnTCP2375` in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Expose Docker API** setting in the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
- **Description:** Exposes the Docker API over an unauthenticated TCP socket on port 2375. Only recommended for isolated and protected environments.
- **OS:** {{< badge color=blue text="Windows only" >}}
- **Use case:** Support legacy integrations that require TCP API access.
- **Configure this setting with:**
    - Settings Management: `exposeDockerAPIOnTCP2375` in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Expose Docker API** setting in the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
> [!NOTE]
>
> In hardened environments, disable and lock this setting. This ensures the
Docker API is only reachable via the secure internal socket.
@y
> [!NOTE]
>
> In hardened environments, disable and lock this setting. This ensures the
Docker API is only reachable via the secure internal socket.
@z

@x
### Air-gapped container proxy
@y
### Air-gapped container proxy
@z

@x
| Default value | Accepted values | Format      |
| ------------- | --------------- | ----------- |
| See example   | Object          | JSON object |
@y
| Default value | Accepted values | Format      |
| ------------- | --------------- | ----------- |
| See example   | Object          | JSON object |
@z

@x
- **Description:** HTTP/HTTPS proxy configuration for containers in air-gapped environments.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Provide controlled network access for containers in offline or restricted network environments.
- **Configure this setting with:**
    - Settings Management: `containersProxy` setting in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Containers proxy** section in the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
- **Description:** HTTP/HTTPS proxy configuration for containers in air-gapped environments.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Provide controlled network access for containers in offline or restricted network environments.
- **Configure this setting with:**
    - Settings Management: `containersProxy` setting in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Containers proxy** section in the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
#### Example
@y
#### Example
@z

% snip code...

@x
### Docker socket access control (ECI exceptions)
@y
### Docker socket access control (ECI exceptions)
@z

@x
| Default value | Accepted values | Format      |
| ------------- | --------------- | ----------- |
| -           | Object          | JSON object |
@y
| Default value | Accepted values | Format      |
| ------------- | --------------- | ----------- |
| -           | Object          | JSON object |
@z

@x
- **Description:** Specific images and commands allowed to use the Docker socket when Enhanced Container Isolation is active.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Support tools like Testcontainers, LocalStack, or CI systems that need Docker socket access while maintaining security.
- Configure this setting with:
    - Settings Management: `enhancedContainerIsolation` > `dockerSocketMount` in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Command list** in the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
- **Description:** Specific images and commands allowed to use the Docker socket when Enhanced Container Isolation is active.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Support tools like Testcontainers, LocalStack, or CI systems that need Docker socket access while maintaining security.
- Configure this setting with:
    - Settings Management: `enhancedContainerIsolation` > `dockerSocketMount` in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Command list** in the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
#### Example
@y
#### Example
@z

% snip code...

@x
### Allow beta features
@y
### Allow beta features
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `false`       | `true`, `false` | Boolean  |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `false`       | `true`, `false` | Boolean  |
@z

@x
- **Description:** Access to Docker Desktop features in public beta.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Provide early access to features in development for testing and feedback.
- **Configure this setting with:**
    - Settings Management: `allowBetaFeatures` setting in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Access beta features**
@y
- **Description:** Access to Docker Desktop features in public beta.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Provide early access to features in development for testing and feedback.
- **Configure this setting with:**
    - Settings Management: `allowBetaFeatures` setting in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Access beta features**
@z

@x
> [!NOTE]
>
> In hardened environments, disable and lock this setting.
@y
> [!NOTE]
>
> In hardened environments, disable and lock this setting.
@z

@x
### Docker daemon options (Linux or Windows)
@y
### Docker daemon options (Linux or Windows)
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `{}`          | JSON object     | Stringified JSON |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `{}`          | JSON object     | Stringified JSON |
@z

@x
- **Description:** Override the Docker daemon configuration used in Linux or Windows containers.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Configure advanced daemon options without modifying local configuration files.
- **Configure this setting with:**
    - Settings Management: `linuxVM.dockerDaemonOptions` or `windowsContainers.dockerDaemonOptions` in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
@y
- **Description:** Override the Docker daemon configuration used in Linux or Windows containers.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Configure advanced daemon options without modifying local configuration files.
- **Configure this setting with:**
    - Settings Management: `linuxVM.dockerDaemonOptions` or `windowsContainers.dockerDaemonOptions` in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
@z

@x
> [!NOTE]
>
> In hardened environments, provide a vetted JSON config and lock it so no
overrides are possible.
@y
> [!NOTE]
>
> In hardened environments, provide a vetted JSON config and lock it so no
overrides are possible.
@z

@x
### VPNKit CIDR
@y
### VPNKit CIDR
@z

@x
| Default value     | Accepted values | Format |
|-------------------|-----------------|--------|
| `192.168.65.0/24` | CIDR notation   | String |
@y
| Default value     | Accepted values | Format |
|-------------------|-----------------|--------|
| `192.168.65.0/24` | CIDR notation   | String |
@z

@x
- **Description:** Network subnet used for Docker Desktop's internal VPNKit DHCP/DNS services.
- **OS:** {{< badge color=blue text="Mac only" >}}
- **Use case:** Prevent IP address conflicts in environments with overlapping network subnets.
- **Configure this setting with:**
    - Settings Management: `vpnkitCIDR` setting in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **VPN Kit CIDR** setting in the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
- **Description:** Network subnet used for Docker Desktop's internal VPNKit DHCP/DNS services.
- **OS:** {{< badge color=blue text="Mac only" >}}
- **Use case:** Prevent IP address conflicts in environments with overlapping network subnets.
- **Configure this setting with:**
    - Settings Management: `vpnkitCIDR` setting in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **VPN Kit CIDR** setting in the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
> [!NOTE]
>
> In hardened environments, lock to an approved, non-conflicting CIDR.
@y
> [!NOTE]
>
> In hardened environments, lock to an approved, non-conflicting CIDR.
@z

@x
### Enable Kerberos and NTLM authentication
@y
### Enable Kerberos and NTLM authentication
@z

@x
| Default value | Accepted values | Format |
|---------------|-----------------|--------|
| `false`       | `true`, `false` | Boolean |
@y
| Default value | Accepted values | Format |
|---------------|-----------------|--------|
| `false`       | `true`, `false` | Boolean |
@z

@x
- **Description:** Enterprise proxy authentication support for Kerberos and NTLM protocols.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Support enterprise proxy servers that require Kerberos or NTLM authentication.
- **Configure this setting with:**
    - Settings Management: `proxy.enableKerberosNtlm` in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Kerberos NTLM** setting in the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
- **Description:** Enterprise proxy authentication support for Kerberos and NTLM protocols.
- **OS:** {{< badge color=blue text="All" >}}
- **Use case:** Support enterprise proxy servers that require Kerberos or NTLM authentication.
- **Configure this setting with:**
    - Settings Management: `proxy.enableKerberosNtlm` in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Kerberos NTLM** setting in the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
### PAC file URL
@y
### PAC file URL
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `""`          | PAC file URL    | String   |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `""`          | PAC file URL    | String   |
@z

@x
- **Description:** Specifies a PAC file URL. For example, `"pac": "http://proxy/proxy.pac"`.
- **OS:** {{< badge color=blue text="All" >}}
- **Configure this setting with:**
    - Settings Management: `pac` in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **PAC file** setting in the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
- **Description:** Specifies a PAC file URL. For example, `"pac": "http://proxy/proxy.pac"`.
- **OS:** {{< badge color=blue text="All" >}}
- **Configure this setting with:**
    - Settings Management: `pac` in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **PAC file** setting in the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
### Embedded PAC script
@y
### Embedded PAC script
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `""`          | Embedded PAC script  | String   |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `""`          | Embedded PAC script  | String   |
@z

@x
- **Description:** Specifies an embedded PAC (Proxy Auto-Config) script. For example, `"embeddedPac": "function FindProxyForURL(url, host) { return \"DIRECT\"; }"`.
- **OS:** {{< badge color=blue text="All" >}}
- **Configure this setting with:**
    - Settings Management: `embeddedPac` in the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Embedded PAC script** setting in the [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
- **Description:** Specifies an embedded PAC (Proxy Auto-Config) script. For example, `"embeddedPac": "function FindProxyForURL(url, host) { return \"DIRECT\"; }"`.
- **OS:** {{< badge color=blue text="All" >}}
- **Configure this setting with:**
    - Settings Management: `embeddedPac` in the [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Embedded PAC script** setting in the [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
### Custom Kubernetes image repository
@y
### Custom Kubernetes image repository
@z

@x
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `""`          | Registry URL    | String   |
@y
| Default value | Accepted values | Format   |
|---------------|-----------------|----------|
| `""`          | Registry URL    | String   |
@z

@x
- **Description**: Registry used for Kubernetes control plane images instead of Docker Hub. This allows Docker Desktop to pull Kubernetes system
images from a private registry or mirror instead of Docker Hub. This setting
overrides the `[registry[:port]/][namespace]` portion of image names.
- **OS**: {{< badge color=blue text="All" >}}
- **Use case**: Support air-gapped environments or when Docker Hub access is restricted.
- **Configure this setting with**:
    - Settings Management: `KubernetesImagesRepository` settings in the
    [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Kubernetes Images Repository** setting in the
    [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@y
- **Description**: Registry used for Kubernetes control plane images instead of Docker Hub. This allows Docker Desktop to pull Kubernetes system
images from a private registry or mirror instead of Docker Hub. This setting
overrides the `[registry[:port]/][namespace]` portion of image names.
- **OS**: {{< badge color=blue text="All" >}}
- **Use case**: Support air-gapped environments or when Docker Hub access is restricted.
- **Configure this setting with**:
    - Settings Management: `KubernetesImagesRepository` settings in the
    [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md)
    - Settings Management: **Kubernetes Images Repository** setting in the
    [Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
@z

@x
> [!NOTE]
>
> Images must be mirrored from Docker Hub with matching tags. Required images depend on the cluster provisioning method.
@y
> [!NOTE]
>
> Images must be mirrored from Docker Hub with matching tags. Required images depend on the cluster provisioning method.
@z

@x
> [!IMPORTANT]
>
> When using custom image repositories with Enhanced Container Isolation, add these images to the ECI allowlist: `[imagesRepository]/desktop-cloud-provider-kind:*` and
`[imagesRepository]/desktop-containerd-registry-mirror:*`.
@y
> [!IMPORTANT]
>
> When using custom image repositories with Enhanced Container Isolation, add these images to the ECI allowlist: `[imagesRepository]/desktop-cloud-provider-kind:*` and
`[imagesRepository]/desktop-containerd-registry-mirror:*`.
@z
