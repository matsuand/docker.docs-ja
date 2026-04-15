%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

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
This reference documents Docker Desktop settings that administrators can configure using [Settings Management](/manuals/enterprise/security/hardened-desktop/settings-management/_index.md). Use this page to understand which settings are available, their accepted values, platform compatibility, and which configuration methods apply.
@y
This reference documents Docker Desktop settings that administrators can configure using [Settings Management](manuals/enterprise/security/hardened-desktop/settings-management/_index.md). Use this page to understand which settings are available, their accepted values, platform compatibility, and which configuration methods apply.
@z

@x
> [!NOTE]
>
> This page only covers configurable settings for administrators who are deploying Docker Desktop to their organization. For the full list of Docker Desktop user-facing settings, see [Change settings](/manuals/desktop/settings-and-maintenance/settings.md).
@y
> [!NOTE]
>
> This page only covers configurable settings for administrators who are deploying Docker Desktop to their organization. For the full list of Docker Desktop user-facing settings, see [Change settings](manuals/desktop/settings-and-maintenance/settings.md).
@z

@x
## General
@y
## General
@z

@x
### Send usage statistics
@y
### Send usage statistics
@z

@x
Controls whether Docker Desktop collects and sends local usage statistics and crash reports to Docker. Does not affect server-side telemetry collected via Docker Hub or other backend services such
as sign in timestamps, pulls, or builds.
@y
Controls whether Docker Desktop collects and sends local usage statistics and crash reports to Docker. Does not affect server-side telemetry collected via Docker Hub or other backend services such
as sign in timestamps, pulls, or builds.
@z

@x
| Property | Value |
|---|---|
| Default | `true` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `analyticsEnabled` |
| Admin Console | **Send usage statistics** |
@y
| Property | Value |
|---|---|
| Default | `true` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `analyticsEnabled` |
| Admin Console | **Send usage statistics** |
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
### Automatically check for updates
@y
### Automatically check for updates
@z

@x
Controls whether Docker Desktop checks for and notifies users about available updates. When set to `true`, update checks and notifications are disabled.
@y
Controls whether Docker Desktop checks for and notifies users about available updates. When set to `true`, update checks and notifications are disabled.
@z

@x
| Property | Value |
|---|---|
| Default | `false` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `disableUpdate` |
| Admin Console | **Disable update** |
@y
| Property | Value |
|---|---|
| Default | `false` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `disableUpdate` |
| Admin Console | **Disable update** |
@z

@x
> [!NOTE]
>
> In hardened environments, enable this setting and lock it. This guarantees that
only internally vetted versions are installed.
@y
> [!NOTE]
>
> In hardened environments, enable this setting and lock it. This guarantees that
only internally vetted versions are installed.
@z

@x
### Automatically update components
@y
### Automatically update components
@z

@x
Allows Docker Desktop to automatically update components that do not require a restart, such as Docker Compose, Docker Scout, and the Docker CLI.
@y
Allows Docker Desktop to automatically update components that do not require a restart, such as Docker Compose, Docker Scout, and the Docker CLI.
@z

@x
| Property | Value |
|---|---|
| Default | `true` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `silentModulesUpdate` |
| Admin Console | **Automatically update components** |
@y
| Property | Value |
|---|---|
| Default | `true` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `silentModulesUpdate` |
| Admin Console | **Automatically update components** |
@z

@x
### Enable Gordon
@y
### Enable Gordon
@z

@x
| Property | Value |
|---|---|
| Default | `false` |
| Accepted values (individuals) | `true`, `false` |
| Accepted values (Business tier) | `"Disabled"`, `"Enabled"`, `"Always Enabled"` |
| JSON key | `enableDockerAI` |
| Admin Console | **Enable Gordon** |
@y
| Property | Value |
|---|---|
| Default | `false` |
| Accepted values (individuals) | `true`, `false` |
| Accepted values (Business tier) | `"Disabled"`, `"Enabled"`, `"Always Enabled"` |
| JSON key | `enableDockerAI` |
| Admin Console | **Enable Gordon** |
@z

@x
> [!IMPORTANT]
>
> Docker Business customers must set this to `"Enabled"` or `"Always Enabled"` in the Admin Console. Setting to `"User Defined"` alone will not activate Gordon.
@y
> [!IMPORTANT]
>
> Docker Business customers must set this to `"Enabled"` or `"Always Enabled"` in the Admin Console. Setting to `"User Defined"` alone will not activate Gordon.
@z

@x
### Block `docker load`
@y
### Block `docker load`
@z

@x
Prevents users from loading local Docker images using the `docker load` command, enforcing image provenance by requiring all images to come from registries.
@y
Prevents users from loading local Docker images using the `docker load` command, enforcing image provenance by requiring all images to come from registries.
@z

@x
| Property | Value |
|---|---|
| Default | `false` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `blockDockerLoad` |
| Admin Console | **Block Docker Load** |
@y
| Property | Value |
|---|---|
| Default | `false` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `blockDockerLoad` |
| Admin Console | **Block Docker Load** |
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
Prevents the onboarding survey from being shown to new users.
@y
Prevents the onboarding survey from being shown to new users.
@z

@x
| Property | Value |
|---|---|
| Default | `false` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `displayedOnboarding` |
| Admin Console | **Hide onboarding survey** |
@y
| Property | Value |
|---|---|
| Default | `false` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `displayedOnboarding` |
| Admin Console | **Hide onboarding survey** |
@z

@x
### Enable Docker terminal
@y
### Enable Docker terminal
@z

@x
Allows or restricts access to the built-in terminal for host system interaction. When set to `false`, users cannot use the Docker terminal to interact with the host machine or execute commands directly from Docker Desktop.
@y
Allows or restricts access to the built-in terminal for host system interaction. When set to `false`, users cannot use the Docker terminal to interact with the host machine or execute commands directly from Docker Desktop.
@z

@x
| Property | Value |
|---|---|
| Default | `false` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| Docker Desktop GUI | **General** tab |
| JSON key | `desktopTerminalEnabled` |
| Admin Console | Not available |
@y
| Property | Value |
|---|---|
| Default | `false` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| Docker Desktop GUI | **General** tab |
| JSON key | `desktopTerminalEnabled` |
| Admin Console | Not available |
@z

@x
### Expose Docker API on TCP 2375 {{< badge color=blue text="Windows only" >}}
@y
### Expose Docker API on TCP 2375 {{< badge color=blue text="Windows only" >}}
@z

@x
Exposes the Docker API over an unauthenticated TCP socket on port 2375. Only recommended for isolated and protected environments. Supports legacy integrations that require TCP API access.
@y
Exposes the Docker API over an unauthenticated TCP socket on port 2375. Only recommended for isolated and protected environments. Supports legacy integrations that require TCP API access.
@z

@x
| Property | Value |
|---|---|
| Default | `false` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `exposeDockerAPIOnTCP2375` |
| Admin Console | **Expose Docker API** |
@y
| Property | Value |
|---|---|
| Default | `false` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `exposeDockerAPIOnTCP2375` |
| Admin Console | **Expose Docker API** |
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
## Extensions 
@y
## Extensions 
@z

@x
### Enable Docker extensions
@y
### Enable Docker extensions
@z

@x
Controls whether users can install and run Docker Extensions.
@y
Controls whether users can install and run Docker Extensions.
@z

@x
| Property | Value |
|---|---|
| Default | `true` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `extensionsEnabled` |
| Admin Console | **Allow Extensions** |
@y
| Property | Value |
|---|---|
| Default | `true` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `extensionsEnabled` |
| Admin Console | **Allow Extensions** |
@z

@x
> [!NOTE]
>
> In hardened environments, disable and lock this setting. This prevents
third-party or unverified plugins from being installed.
@y
> [!NOTE]
>
> In hardened environments, disable and lock this setting. This prevents
third-party or unverified plugins from being installed.
@z

@x
### Allow only extensions distributed through the Docker Marketplace
@y
### Allow only extensions distributed through the Docker Marketplace
@z

@x
Prevents installation of third-party or locally developed extensions.
@y
Prevents installation of third-party or locally developed extensions.
@z

@x
| Property | Value |
|---|---|
| Default | `false` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `onlyMarketplaceExtensions` |
| Admin Console | **Only marketplace extensions** |
@y
| Property | Value |
|---|---|
| Default | `false` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `onlyMarketplaceExtensions` |
| Admin Console | **Only marketplace extensions** |
@z

@x
### Enable a private marketplace
@y
### Enable a private marketplace
@z

@x
Ensures Docker Desktop connects to content defined and controlled by the administrator instead of the public Docker Marketplace.
@y
Ensures Docker Desktop connects to content defined and controlled by the administrator instead of the public Docker Marketplace.
@z

@x
| Property | Value |
|---|---|
| Default | `false` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `extensionsPrivateMarketplace` |
| Admin Console | **Extensions private marketplace** |
@y
| Property | Value |
|---|---|
| Default | `false` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `extensionsPrivateMarketplace` |
| Admin Console | **Extensions private marketplace** |
@z

@x
## AI
@y
## AI
@z

@x
### Enable Docker Model Runner
@y
### Enable Docker Model Runner
@z

@x
Enables Docker Model Runner functionality for running AI models in containers.
@y
Enables Docker Model Runner functionality for running AI models in containers.
@z

@x
| Property | Value |
|---|---|
| Default | `true` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `enableInference` |
| Admin Console | **Enable Docker Model Runner** |
@y
| Property | Value |
|---|---|
| Default | `true` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `enableInference` |
| Admin Console | **Enable Docker Model Runner** |
@z

@x
#### Enable host-side TCP support
@y
#### Enable host-side TCP support
@z

@x
Enables TCP connectivity for Docker Model Runner services, allowing external applications to connect to Model Runner via TCP.
@y
Enables TCP connectivity for Docker Model Runner services, allowing external applications to connect to Model Runner via TCP.
@z

@x
| Property | Value |
|---|---|
| Default | `false` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `enableInferenceTCP` |
| Admin Console | **Host-side TCP support** |
| Requires | Docker Model Runner enabled |
@y
| Property | Value |
|---|---|
| Default | `false` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `enableInferenceTCP` |
| Admin Console | **Host-side TCP support** |
| Requires | Docker Model Runner enabled |
@z

@x
##### Port
@y
##### Port
@z

@x
Specifies the port used for Model Runner TCP connections.
@y
Specifies the port used for Model Runner TCP connections.
@z

@x
| Property | Value |
|---|---|
| Default | `12434` |
| Accepted values | Integer |
| Format | Integer |
| JSON key | `enableInferenceTCPPort` |
| Admin Console | **Host-side TCP port** |
| Requires | Docker Model Runner and host-side TCP support enabled |
@y
| Property | Value |
|---|---|
| Default | `12434` |
| Accepted values | Integer |
| Format | Integer |
| JSON key | `enableInferenceTCPPort` |
| Admin Console | **Host-side TCP port** |
| Requires | Docker Model Runner and host-side TCP support enabled |
@z

@x
##### CORS Allowed Origins 
@y
##### CORS Allowed Origins 
@z

@x
Controls cross-origin resource sharing for Model Runner web integration.
@y
Controls cross-origin resource sharing for Model Runner web integration.
@z

@x
| Property | Value |
|---|---|
| Default | Empty string |
| Accepted values | Empty string (deny all), `*` (accept all), or comma-separated list of origins |
| Format | String |
| JSON key | `enableInferenceCORS` |
| Admin Console | **CORS Allowed Origins** |
| Requires | Docker Model Runner and host-side TCP support enabled |
@y
| Property | Value |
|---|---|
| Default | Empty string |
| Accepted values | Empty string (deny all), `*` (accept all), or comma-separated list of origins |
| Format | String |
| JSON key | `enableInferenceCORS` |
| Admin Console | **CORS Allowed Origins** |
| Requires | Docker Model Runner and host-side TCP support enabled |
@z

@x
### Enable GPU-backed inference {{< badge color=blue text="Windows only" >}}
@y
### Enable GPU-backed inference {{< badge color=blue text="Windows only" >}}
@z

@x
Enables GPU-backed inference. Additional components will be downloaded to `~/.docker/bin/inference`.
@y
Enables GPU-backed inference. Additional components will be downloaded to `~/.docker/bin/inference`.
@z

@x
| Property | Value |
|---|---|
| Default | `false` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `enableInferenceGPUVariant` |
| Admin Console | **Enable GPU-backed inference** |
@y
| Property | Value |
|---|---|
| Default | `false` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `enableInferenceGPUVariant` |
| Admin Console | **Enable GPU-backed inference** |
@z

@x
## File sharing and emulation 
@y
## File sharing and emulation 
@z

@x
### File sharing directories 
@y
### File sharing directories 
@z

@x
Defines which host directories containers can access for development workflows.
@y
Defines which host directories containers can access for development workflows.
@z

@x
| Property | Value |
|---|---|
| Default | Varies by OS |
| Accepted values | List of file paths |
| Format | Array of strings |
| JSON key | `filesharingAllowedDirectories` |
| Admin Console | Yes — **Allowed file sharing directories** |
@y
| Property | Value |
|---|---|
| Default | Varies by OS |
| Accepted values | List of file paths |
| Format | Array of strings |
| JSON key | `filesharingAllowedDirectories` |
| Admin Console | Yes — **Allowed file sharing directories** |
@z

@x
### VirtioFS {{< badge color=blue text="Mac only" >}}
@y
### VirtioFS {{< badge color=blue text="Mac only" >}}
@z

@x
Uses VirtioFS for fast, native file sharing between host and containers. If both VirtioFS and gRPC FUSE are set to `true`, VirtioFS takes precedence.
@y
Uses VirtioFS for fast, native file sharing between host and containers. If both VirtioFS and gRPC FUSE are set to `true`, VirtioFS takes precedence.
@z

@x
| Property | Value |
|---|---|
| Default | `true` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `useVirtualizationFrameworkVirtioFS` |
| Admin Console | **Use VirtioFS for file sharing** tab |
@y
| Property | Value |
|---|---|
| Default | `true` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `useVirtualizationFrameworkVirtioFS` |
| Admin Console | **Use VirtioFS for file sharing** tab |
@z

@x
### gRPC FUSE {{< badge color=blue text="Mac only" >}}
@y
### gRPC FUSE {{< badge color=blue text="Mac only" >}}
@z

@x
Enables gRPC FUSE for macOS file sharing.
@y
Enables gRPC FUSE for macOS file sharing.
@z

@x
| Property | Value |
|---|---|
| Default | `true` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `useGrpcfuse` |
| Admin Console | **Use gRPC FUSE for file sharing** |
@y
| Property | Value |
|---|---|
| Default | `true` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `useGrpcfuse` |
| Admin Console | **Use gRPC FUSE for file sharing** |
@z

@x
### Rosetta {{< badge color=blue text="Mac only" >}}
@y
### Rosetta {{< badge color=blue text="Mac only" >}}
@z

@x
Uses Rosetta for x86_64/amd64 emulation on Apple Silicon.
@y
Uses Rosetta for x86_64/amd64 emulation on Apple Silicon.
@z

@x
| Property | Value |
|---|---|
| Default | `true` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `useVirtualizationFrameworkRosetta` |
| Admin Console | **Use Rosetta for x86_64/amd64 emulation on Apple Silicon** |
@y
| Property | Value |
|---|---|
| Default | `true` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `useVirtualizationFrameworkRosetta` |
| Admin Console | **Use Rosetta for x86_64/amd64 emulation on Apple Silicon** |
@z

@x
## Scout
@y
## Scout
@z

@x
### Enable Scout image analysis
@y
### Enable Scout image analysis
@z

@x
Turns on vulnerability scanning and software bill of materials (SBOM) analysis for container images.
@y
Turns on vulnerability scanning and software bill of materials (SBOM) analysis for container images.
@z

@x
| Property | Value |
|---|---|
| Default | `true` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `sbomIndexing` |
| Admin Console | **SBOM indexing** |
@y
| Property | Value |
|---|---|
| Default | `true` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `sbomIndexing` |
| Admin Console | **SBOM indexing** |
@z

@x
### Enable background Scout SBOM indexing 
@y
### Enable background Scout SBOM indexing 
@z

@x
Keeps image metadata current by indexing during idle time or after image operations.
@y
Keeps image metadata current by indexing during idle time or after image operations.
@z

@x
| Property | Value |
|---|---|
| Default | `false` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `useBackgroundIndexing` |
| Admin Console | **Background indexing** |
@y
| Property | Value |
|---|---|
| Default | `false` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `useBackgroundIndexing` |
| Admin Console | **Background indexing** |
@z

@x
## Proxy
@y
## Proxy
@z

@x
### Embedded PAC script 
@y
### Embedded PAC script 
@z

@x
Specifies an embedded Proxy Auto-Config (PAC) script. For example: `"embeddedPac": "function FindProxyForURL(url, host) { return \"DIRECT\"; }"`.
@y
Specifies an embedded Proxy Auto-Config (PAC) script. For example: `"embeddedPac": "function FindProxyForURL(url, host) { return \"DIRECT\"; }"`.
@z

@x
| Property | Value |
|---|---|
| Default | `""` |
| Accepted values | Embedded PAC script content |
| Format | String |
| JSON key | `embeddedPac` |
| Admin Console | Yes **Embedded PAC script** |
@y
| Property | Value |
|---|---|
| Default | `""` |
| Accepted values | Embedded PAC script content |
| Format | String |
| JSON key | `embeddedPac` |
| Admin Console | Yes **Embedded PAC script** |
@z

@x
### PAC file URL 
@y
### PAC file URL 
@z

@x
Specifies a PAC file URL for Docker Desktop to use when routing network traffic. For example: `"pac": "http://proxy/proxy.pac"`.
@y
Specifies a PAC file URL for Docker Desktop to use when routing network traffic. For example: `"pac": "http://proxy/proxy.pac"`.
@z

@x
| Property | Value |
|---|---|
| Default | `""` |
| Accepted values | PAC file URL |
| Format | String |
| JSON key | `pac` |
| Admin Console | **PAC file** |
@y
| Property | Value |
|---|---|
| Default | `""` |
| Accepted values | PAC file URL |
| Format | String |
| JSON key | `pac` |
| Admin Console | **PAC file** |
@z

@x
### Override Windows "dockerd" port {{< badge color=blue text="Windows only" >}}
@y
### Override Windows "dockerd" port {{< badge color=blue text="Windows only" >}}
@z

@x
Exposes Docker Desktop's internal proxy locally on this port for the Windows Docker daemon to connect to. If it is set to 0, a random free port is chosen. If the value is greater than 0, use that exact value for the port.
@y
Exposes Docker Desktop's internal proxy locally on this port for the Windows Docker daemon to connect to. If it is set to 0, a random free port is chosen. If the value is greater than 0, use that exact value for the port.
@z

@x
| Property | Value |
|---|---|
| Default | `-1` |
| Accepted values | `-1` `0` |
| Format | String |
| JSON key | `windowsDockerdPort` |
| Admin Console | **Override Windows “dockerd” port** |
@y
| Property | Value |
|---|---|
| Default | `-1` |
| Accepted values | `-1` `0` |
| Format | String |
| JSON key | `windowsDockerdPort` |
| Admin Console | **Override Windows “dockerd” port** |
@z

@x
### Enable Kerberos and NTLM authentication 
@y
### Enable Kerberos and NTLM authentication 
@z

@x
Enables enterprise proxy authentication support for Kerberos and NTLM protocols.
@y
Enables enterprise proxy authentication support for Kerberos and NTLM protocols.
@z

@x
| Property | Value |
|---|---|
| Default | `false` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `proxy.enableKerberosNtlm` |
| Admin Console | **Kerberos NTLM** |
@y
| Property | Value |
|---|---|
| Default | `false` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `proxy.enableKerberosNtlm` |
| Admin Console | **Kerberos NTLM** |
@z

@x
### Proxy bypass
@y
### Proxy bypass
@z

@x
Defines network addresses that containers should bypass when using proxy settings.
@y
Defines network addresses that containers should bypass when using proxy settings.
@z

@x
| Property | Value |
|---|---|
| Default | `""` |
| Accepted values | List of addresses |
| Format | String |
| Docker Desktop GUI | **Proxies** tab |
| JSON key | `proxy` (with `manual` and `exclude` modes) |
| Admin Console | Yes — **Proxy** section |
@y
| Property | Value |
|---|---|
| Default | `""` |
| Accepted values | List of addresses |
| Format | String |
| Docker Desktop GUI | **Proxies** tab |
| JSON key | `proxy` (with `manual` and `exclude` modes) |
| Admin Console | Yes — **Proxy** section |
@z

@x
## Containers proxy
@y
## Containers proxy
@z

@x
### Air-gapped container proxy
@y
### Air-gapped container proxy
@z

@x
Configures an HTTP/HTTPS proxy for containers in air-gapped environments, providing controlled network access in offline or restricted network environments.
@y
Configures an HTTP/HTTPS proxy for containers in air-gapped environments, providing controlled network access in offline or restricted network environments.
@z

@x
| Property | Value |
|---|---|
| Default | See example below |
| Accepted values | JSON object |
| Format | JSON object |
| JSON key | `containersProxy` |
| Admin Console | **Containers proxy** section |
@y
| Property | Value |
|---|---|
| Default | See example below |
| Accepted values | JSON object |
| Format | JSON object |
| JSON key | `containersProxy` |
| Admin Console | **Containers proxy** section |
@z

% snip code...

@x
For more information, see [Air-gapped containers](/manuals/enterprise/security/hardened-desktop/air-gapped-containers.md).
@y
For more information, see [Air-gapped containers](manuals/enterprise/security/hardened-desktop/air-gapped-containers.md).
@z

@x
## LinuxVM
@y
## LinuxVM
@z

@x
### Enable WSL engine {{< badge color=blue text="Windows only" >}}
@y
### Enable WSL engine {{< badge color=blue text="Windows only" >}}
@z

@x
When set to `true`, Docker Desktop uses the WSL 2 based engine. Overrides any backend flag set at installation using `--backend=<backend name>`.
@y
When set to `true`, Docker Desktop uses the WSL 2 based engine. Overrides any backend flag set at installation using `--backend=<backend name>`.
@z

@x
| Property | Value |
|---|---|
| Default | `true` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `wslEngineEnabled` |
| Admin Console | **Windows Subsystem for Linux (WSL) Engine** |
@y
| Property | Value |
|---|---|
| Default | `true` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `wslEngineEnabled` |
| Admin Console | **Windows Subsystem for Linux (WSL) Engine** |
@z

@x
### Docker daemon options 
@y
### Docker daemon options 
@z

@x
Overrides the Docker daemon configuration used in containers, without modifying local configuration files.
@y
Overrides the Docker daemon configuration used in containers, without modifying local configuration files.
@z

@x
| Property | Value |
|---|---|
| Default | `{}` |
| Accepted values | JSON object |
| Format | Stringified JSON |
| JSON key | `linuxVM.dockerDaemonOptions` |
| Admin Console | **Docker Daemon options** in the LinuxVM dropdown |
@y
| Property | Value |
|---|---|
| Default | `{}` |
| Accepted values | JSON object |
| Format | Stringified JSON |
| JSON key | `linuxVM.dockerDaemonOptions` |
| Admin Console | **Docker Daemon options** in the LinuxVM dropdown |
@z

@x
### VPNKit CIDR {{< badge color=blue text="Mac only" >}}
@y
### VPNKit CIDR {{< badge color=blue text="Mac only" >}}
@z

@x
Sets the network subnet used for Docker Desktop's internal VPNKit DHCP/DNS services. Prevents IP address conflicts in environments with overlapping network subnets.
@y
Sets the network subnet used for Docker Desktop's internal VPNKit DHCP/DNS services. Prevents IP address conflicts in environments with overlapping network subnets.
@z

@x
| Property | Value |
|---|---|
| Default | `192.168.65.0/24` |
| Accepted values | CIDR notation |
| Format | String |
| JSON key | `vpnkitCIDR` |
| Admin Console | **VPNKit CIDR** |
@y
| Property | Value |
|---|---|
| Default | `192.168.65.0/24` |
| Accepted values | CIDR notation |
| Format | String |
| JSON key | `vpnkitCIDR` |
| Admin Console | **VPNKit CIDR** |
@z

@x
## Windows containers
@y
## Windows containers
@z

@x
### Docker daemon options 
@y
### Docker daemon options 
@z

@x
Overrides the Docker daemon configuration used in Windows containers, without modifying local configuration files.
@y
Overrides the Docker daemon configuration used in Windows containers, without modifying local configuration files.
@z

@x
| Property | Value |
|---|---|
| Default | `{}` |
| Accepted values | JSON object |
| Format | Stringified JSON |
| JSON key | `windowsContainers.dockerDaemonOptions` |
| Admin Console | **Docker Daemon options** in the **Windows containers dropdown** |
@y
| Property | Value |
|---|---|
| Default | `{}` |
| Accepted values | JSON object |
| Format | Stringified JSON |
| JSON key | `windowsContainers.dockerDaemonOptions` |
| Admin Console | **Docker Daemon options** in the **Windows containers dropdown** |
@z

@x
## Kubernetes
@y
## Kubernetes
@z

@x
### Enable Kubernetes
@y
### Enable Kubernetes
@z

@x
Enables the local Kubernetes cluster integration with Docker Desktop.
@y
Enables the local Kubernetes cluster integration with Docker Desktop.
@z

@x
| Property | Value |
|---|---|
| Default | `false` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `kubernetes` |
| Admin Console | **Enable Kubernetes** |
@y
| Property | Value |
|---|---|
| Default | `false` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `kubernetes` |
| Admin Console | **Enable Kubernetes** |
@z

@x
### Show system containers
@y
### Show system containers
@z

@x
Controls visibility of Kubernetes system containers in the Docker Desktop Dashboard.
@y
Controls visibility of Kubernetes system containers in the Docker Desktop Dashboard.
@z

@x
| Property | Value |
|---|---|
| Default | `false` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| Admin Console | **Show system containers** |
@y
| Property | Value |
|---|---|
| Default | `false` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| Admin Console | **Show system containers** |
@z

@x
### Kubernetes image repository 
@y
### Kubernetes image repository 
@z

@x
Specifies a registry used for Kubernetes control plane images instead of Docker Hub. Overrides the `[registry[:port]/][namespace]` portion of image names. Images must be mirrored from Docker Hub with matching tags.
@y
Specifies a registry used for Kubernetes control plane images instead of Docker Hub. Overrides the `[registry[:port]/][namespace]` portion of image names. Images must be mirrored from Docker Hub with matching tags.
@z

@x
| Property | Value |
|---|---|
| Default | `""` |
| Accepted values | Registry URL |
| Format | String |
| JSON key | `KubernetesImagesRepository` |
| Admin Console | **Kubernetes Images Repository** |
@y
| Property | Value |
|---|---|
| Default | `""` |
| Accepted values | Registry URL |
| Format | String |
| JSON key | `KubernetesImagesRepository` |
| Admin Console | **Kubernetes Images Repository** |
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
> When using custom image repositories with Enhanced Container Isolation, add these images to the ECI allowlist: `[imagesRepository]/desktop-cloud-provider-kind:*` and `[imagesRepository]/desktop-containerd-registry-mirror:*`.
@y
> [!IMPORTANT]
>
> When using custom image repositories with Enhanced Container Isolation, add these images to the ECI allowlist: `[imagesRepository]/desktop-cloud-provider-kind:*` and `[imagesRepository]/desktop-containerd-registry-mirror:*`.
@z

@x
### Cluster provisioning method 
@y
### Cluster provisioning method 
@z

@x
Controls Kubernetes cluster topology and node configuration.
@y
Controls Kubernetes cluster topology and node configuration.
@z

@x
| Property | Value |
|---|---|
| Default | `kubeadm` |
| Accepted values | `kubeadm`, `kind` |
| Format | String |
| Admin Console | **Kubernetes mode** |
@y
| Property | Value |
|---|---|
| Default | `kubeadm` |
| Accepted values | `kubeadm`, `kind` |
| Format | String |
| Admin Console | **Kubernetes mode** |
@z

@x
### Node version
@y
### Node version
@z

@x
Pins the Kubernetes version used for cluster nodes.
@y
Pins the Kubernetes version used for cluster nodes.
@z

@x
| Property | Value |
|---|---|
| Default | `1.31.1` |
| Accepted values | Semantic version (e.g. `1.29.1`) |
| Format | String |
| Admin Console | **Node version** tab |
@y
| Property | Value |
|---|---|
| Default | `1.31.1` |
| Accepted values | Semantic version (e.g. `1.29.1`) |
| Format | String |
| Admin Console | **Node version** tab |
@z

@x
### Nodes count
@y
### Nodes count
@z

@x
Sets the number of nodes in multi-node Kubernetes clusters.
@y
Sets the number of nodes in multi-node Kubernetes clusters.
@z

@x
| Property | Value |
|---|---|
| Default | `1` |
| Accepted values | Integer |
| Format | Integer |
| Admin Console | **Nodes count** |
@y
| Property | Value |
|---|---|
| Default | `1` |
| Accepted values | Integer |
| Format | Integer |
| Admin Console | **Nodes count** |
@z

@x
## Features in development
@y
## Features in development
@z

@x
### Access beta features
@y
### Access beta features
@z

@x
Controls whether users can access all Docker Desktop features that are in public beta.
@y
Controls whether users can access all Docker Desktop features that are in public beta.
@z

@x
| Property | Value |
|---|---|
| Default | `false` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `allowBetaFeatures` |
| Admin Console | **Access beta features** |
@y
| Property | Value |
|---|---|
| Default | `false` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `allowBetaFeatures` |
| Admin Console | **Access beta features** |
@z

@x
### Enable Docker MCP Toolkit (Beta)
@y
### Enable Docker MCP Toolkit (Beta)
@z

@x
Enables [Docker MCP Toolkit](/manuals/ai/mcp-catalog-and-toolkit/_index.md) in Docker Desktop for AI model development workflows.
@y
Enables [Docker MCP Toolkit](manuals/ai/mcp-catalog-and-toolkit/_index.md) in Docker Desktop for AI model development workflows.
@z

@x
| Property | Value |
|---|---|
| Default | `true` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `enableDockerMCPToolkit` |
| Admin Console | Not available |
@y
| Property | Value |
|---|---|
| Default | `true` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `enableDockerMCPToolkit` |
| Admin Console | Not available |
@z

@x
## Enhance container isolation
@y
## Enhance container isolation
@z

@x
### Enable Enhanced Container Isolation 
@y
### Enable Enhanced Container Isolation 
@z

@x
Prevents containers from modifying Docker Desktop VM configuration or accessing sensitive host areas.
@y
Prevents containers from modifying Docker Desktop VM configuration or accessing sensitive host areas.
@z

@x
| Property | Value |
|---|---|
| Default | `false` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `enhancedContainerIsolation` |
| Admin Console | **Enable enhanced container isolation** |
@y
| Property | Value |
|---|---|
| Default | `false` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `enhancedContainerIsolation` |
| Admin Console | **Enable enhanced container isolation** |
@z

@x
### Docker socket access control (ECI exceptions)
@y
### Docker socket access control (ECI exceptions)
@z

@x
Defines specific images and commands allowed to use the Docker socket when Enhanced Container Isolation is active. Supports tools like Testcontainers, LocalStack, or CI systems that need Docker socket access while maintaining security.
@y
Defines specific images and commands allowed to use the Docker socket when Enhanced Container Isolation is active. Supports tools like Testcontainers, LocalStack, or CI systems that need Docker socket access while maintaining security.
@z

@x
| Property | Value |
|---|---|
| Accepted values | JSON object |
| Format | JSON object |
| JSON key | ``dockerSocketMount` |
| Admin Console | **Image list**, **Command list** |
@y
| Property | Value |
|---|---|
| Accepted values | JSON object |
| Format | JSON object |
| JSON key | ``dockerSocketMount` |
| Admin Console | **Image list**, **Command list** |
@z

% snip code...

@x
## Network
@y
## Network
@z

@x
### Networking mode 
@y
### Networking mode 
@z

@x
Sets the default IP protocol used when Docker creates new networks.
@y
Sets the default IP protocol used when Docker creates new networks.
@z

@x
| Property | Value |
|---|---|
| Default | `dual-stack` |
| Accepted values | `ipv4only`, `ipv6only` |
| Format | String |
| JSON key | `defaultNetworkingMode` |
| Admin Console | **Default network IP mode** |
@y
| Property | Value |
|---|---|
| Default | `dual-stack` |
| Accepted values | `ipv4only`, `ipv6only` |
| Format | String |
| JSON key | `defaultNetworkingMode` |
| Admin Console | **Default network IP mode** |
@z

@x
For more information, see [Networking](/manuals/desktop/features/networking.md#networking-mode-and-dns-behaviour-for-mac-and-windows).
@y
For more information, see [Networking](manuals/desktop/features/networking.md#networking-mode-and-dns-behaviour-for-mac-and-windows).
@z

@x
### Inhibit DNS resolution for IPv4/IPv6 
@y
### Inhibit DNS resolution for IPv4/IPv6 
@z

@x
Filters unsupported DNS record types to improve reliability in environments where only IPv4 or IPv6 is supported. Requires Docker Desktop 4.43 and later.
@y
Filters unsupported DNS record types to improve reliability in environments where only IPv4 or IPv6 is supported. Requires Docker Desktop 4.43 and later.
@z

@x
| Property | Value |
|---|---|
| Default | `auto` |
| Accepted values | `ipv4`, `ipv6`, `none` |
| Format | String |
| JSON key | `dnsInhibition` |
| Admin Console | **DNS filtering behavior** |
@y
| Property | Value |
|---|---|
| Default | `auto` |
| Accepted values | `ipv4`, `ipv6`, `none` |
| Format | String |
| JSON key | `dnsInhibition` |
| Admin Console | **DNS filtering behavior** |
@z

@x
For more information, see [Networking](/manuals/desktop/features/networking.md#networking-mode-and-dns-behaviour-for-mac-and-windows).
@y
For more information, see [Networking](manuals/desktop/features/networking.md#networking-mode-and-dns-behaviour-for-mac-and-windows).
@z

@x
### Port binding behavior
@y
### Port binding behavior
@z

@x
Specify how port bindings are handled for new containers.
@y
Specify how port bindings are handled for new containers.
@z

@x
| Property | Value |
|---|---|
| Default | `default-port-binding` |
| Accepted values | `default-local-port-binding`, `local-only-port-binding`, `default-port-binding` |
| Format | String |
| JSON key | `portBindingBehavior` |
| Admin Console | **Port binding behavior** |
@y
| Property | Value |
|---|---|
| Default | `default-port-binding` |
| Accepted values | `default-local-port-binding`, `local-only-port-binding`, `default-port-binding` |
| Format | String |
| JSON key | `portBindingBehavior` |
| Admin Console | **Port binding behavior** |
@z

@x
## Other
@y
## Other
@z

@x
### Enable Docker Offload 
@y
### Enable Docker Offload 
@z

@x
Controls Docker Offload availability. When enabled, users see the Docker Offload toggle in the Docker Desktop header.
@y
Controls Docker Offload availability. When enabled, users see the Docker Offload toggle in the Docker Desktop header.
@z

@x
| Property | Value |
|---|---|
| Default | `false` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `enableCloud` |
| Admin Console | **Enable Docker Offload** |
@y
| Property | Value |
|---|---|
| Default | `false` |
| Accepted values | `true`, `false` |
| Format | Boolean |
| JSON key | `enableCloud` |
| Admin Console | **Enable Docker Offload** |
@z

@x
> [!NOTE]
>
> This setting is only available when Docker Offload capability is enabled for
> the organization.
@y
> [!NOTE]
>
> This setting is only available when Docker Offload capability is enabled for
> the organization.
@z
