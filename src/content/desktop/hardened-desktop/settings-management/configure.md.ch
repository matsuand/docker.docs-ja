%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
description: How to configure Settings Management for Docker Desktop
keywords: admin, controls, rootless, enhanced container isolation
title: Configure Settings Management
@y
description: How to configure Settings Management for Docker Desktop
keywords: admin, controls, rootless, enhanced container isolation
title: Configure Settings Management
@z

@x
>**Note**
>
>Settings Management is available to Docker Business customers only.
@y
>**Note**
>
>Settings Management is available to Docker Business customers only.
@z

@x
This page contains information for admins on how to configure Settings Management to specify and lock configuration parameters to create a standardized Docker Desktop environment across the organization.
@y
This page contains information for admins on how to configure Settings Management to specify and lock configuration parameters to create a standardized Docker Desktop environment across the organization.
@z

@x
Settings Management is designed specifically for organizations who don’t give developers root access to their machines.
@y
Settings Management is designed specifically for organizations who don’t give developers root access to their machines.
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
- [Download and install Docker Desktop 4.13.0 or later](../../release-notes.md).
- As an admin, you need to [configure a registry.json to enforce sign-in](../../../security/for-admins/configure-sign-in.md). This is because this feature requires a Docker Business subscription and therefore your Docker Desktop users must authenticate to your organization for this configuration to take effect.
@y
- [Download and install Docker Desktop 4.13.0 or later](../../release-notes.md).
- As an admin, you need to [configure a registry.json to enforce sign-in](../../../security/for-admins/configure-sign-in.md). This is because this feature requires a Docker Business subscription and therefore your Docker Desktop users must authenticate to your organization for this configuration to take effect.
@z

@x
### Step one: Create the `admin-settings.json` file and save it in the correct location
@y
### Step one: Create the `admin-settings.json` file and save it in the correct location
@z

@x
You can either use the `--admin-settings` installer flag on [macOS](../../install/mac-install.md#install-from-the-command-line) or [Windows](../../install/windows-install.md#install-from-the-command-line) to automatically create the `admin-settings.json` and save it in the correct location, or set it up manually.
@y
You can either use the `--admin-settings` installer flag on [macOS](../../install/mac-install.md#install-from-the-command-line) or [Windows](../../install/windows-install.md#install-from-the-command-line) to automatically create the `admin-settings.json` and save it in the correct location, or set it up manually.
@z

@x
To set it up manually:
1. Create a new, empty JSON file and name it `admin-settings.json`.
2. Save the `admin-settings.json` file on your developers' machines in the following locations:
@y
To set it up manually:
1. Create a new, empty JSON file and name it `admin-settings.json`.
2. Save the `admin-settings.json` file on your developers' machines in the following locations:
@z

@x
    - Mac: `/Library/Application\ Support/com.docker.docker/admin-settings.json`
    - Windows: `C:\ProgramData\DockerDesktop\admin-settings.json`
    - Linux: `/usr/share/docker-desktop/admin-settings.json`
@y
    - Mac: `/Library/Application\ Support/com.docker.docker/admin-settings.json`
    - Windows: `C:\ProgramData\DockerDesktop\admin-settings.json`
    - Linux: `/usr/share/docker-desktop/admin-settings.json`
@z

@x
    By placing this file in the above protected directories, end users are unable to modify it.
@y
    By placing this file in the above protected directories, end users are unable to modify it.
@z

@x
    > **Important**
    >
    > It is assumed that you have the ability to push the `admin-settings.json` settings file to the locations specified above through a device management software such as [Jamf](https://www.jamf.com/lp/en-gb/apple-mobile-device-management-mdm-jamf-shared/?attr=google_ads-brand-search-shared&gclid=CjwKCAjw1ICZBhAzEiwAFfvFhEXjayUAi8FHHv1JJitFPb47C_q_RCySTmF86twF1qJc_6GST-YDmhoCuJsQAvD_BwE).
    { .important }
@y
    > **Important**
    >
    > It is assumed that you have the ability to push the `admin-settings.json` settings file to the locations specified above through a device management software such as [Jamf](https://www.jamf.com/lp/en-gb/apple-mobile-device-management-mdm-jamf-shared/?attr=google_ads-brand-search-shared&gclid=CjwKCAjw1ICZBhAzEiwAFfvFhEXjayUAi8FHHv1JJitFPb47C_q_RCySTmF86twF1qJc_6GST-YDmhoCuJsQAvD_BwE).
    { .important }
@z

@x
### Step two: Configure the settings you want to lock in
@y
### Step two: Configure the settings you want to lock in
@z

@x
>**Note**
>
>Some of the configuration parameters only apply to Windows. This is highlighted in the table below.
@y
>**Note**
>
>Some of the configuration parameters only apply to Windows. This is highlighted in the table below.
@z

@x
The `admin-settings.json` file requires a nested list of configuration parameters, each of which must contain the  `locked` parameter. You can add or remove configuration parameters as per your requirements.
@y
The `admin-settings.json` file requires a nested list of configuration parameters, each of which must contain the  `locked` parameter. You can add or remove configuration parameters as per your requirements.
@z

@x
If `locked: true`, users aren't able to edit this setting from Docker Desktop or the CLI.
@y
If `locked: true`, users aren't able to edit this setting from Docker Desktop or the CLI.
@z

@x
If `locked: false`, it's similar to setting a factory default in that:
- For new installs, `locked: false` pre-populates the relevant settings in the Docker Desktop UI, but users are able to modify it.
@y
If `locked: false`, it's similar to setting a factory default in that:
- For new installs, `locked: false` pre-populates the relevant settings in the Docker Desktop UI, but users are able to modify it.
@z

@x
- If Docker Desktop is already installed and being used, `locked: false` is ignored. This is because existing users of Docker Desktop may have already updated a setting, which in turn will have been written to the relevant config file, for example the `settings.json` or `daemon.json`. In these instances, the user's preferences are respected and we don't alter these values. These can be controlled by the admin by setting `locked: true`.
@y
- If Docker Desktop is already installed and being used, `locked: false` is ignored. This is because existing users of Docker Desktop may have already updated a setting, which in turn will have been written to the relevant config file, for example the `settings.json` or `daemon.json`. In these instances, the user's preferences are respected and we don't alter these values. These can be controlled by the admin by setting `locked: true`.
@z

@x
The following `admin-settings.json` code and table provides an example of the required syntax and descriptions for parameters and values:
@y
The following `admin-settings.json` code and table provides an example of the required syntax and descriptions for parameters and values:
@z

% snip code...

@x
| Parameter                        |   | Description                      |
| :------------------------------- |---| :------------------------------- |
| `configurationFileVersion`        |   |Specifies the version of the configuration file format.    |
| `exposeDockerAPIOnTCP2375` | Windows only| Exposes the Docker API on a specified port. If `value` is set to true, the Docker API is exposed on port 2375. Note: This is unauthenticated and should only be enabled if protected by suitable firewall rules.|
| `proxy` |   |If `mode` is set to `system` instead of `manual`, Docker Desktop gets the proxy values from the system and ignores and values set for `http`, `https` and `exclude`. Change `mode` to `manual` to manually configure proxy servers. If the proxy port is custom, specify it in the `http` or `https` property, for example `"https": "http://myotherproxy.com:4321"`. The `exclude` property specifies a comma-separated list of hosts and domains to bypass the proxy. |
| &nbsp; &nbsp; &nbsp; &nbsp;`windowsDockerdPort`  | Windows only | Exposes Docker Desktop's internal proxy locally on this port for the Windows Docker daemon to connect to. If it is set to 0, a random free port is chosen. If the value is greater than 0, use that exact value for the port. The default value is -1 which disables the option. Note: This is available for Windows containers only. |
| `enhancedContainerIsolation`  |  | If `value` is set to true, Docker Desktop runs all containers as unprivileged, via the Linux user-namespace, prevents them from modifying sensitive configurations inside the Docker Desktop VM, and uses other advanced techniques to isolate them. For more information, see [Enhanced Container Isolation](../enhanced-container-isolation/index.md).|
| &nbsp; &nbsp; &nbsp; &nbsp;`dockerSocketMount` |  | By default, enhanced container isolation blocks bind-mounting the Docker Engine socket into containers (e.g., `docker run -v /var/run/docker.sock:/var/run/docker.sock ...`). This allows admins to relax this in a controlled way. See [ECI Configuration](../enhanced-container-isolation/config.md) for more info. |
| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; `imageList` |  | Indicates which container images are allowed to bind-mount the Docker Engine socket. |
| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; `commandList` |  | Restricts the commands that containers can issue via the bind-mounted Docker Engine socket. |
| `linuxVM` |   |Parameters and settings related to Linux VM options - grouped together here for convenience. |
| &nbsp; &nbsp; &nbsp; &nbsp;`wslEngineEnabled`  | Windows only | If `value` is set to true, Docker Desktop uses the WSL 2 based engine. This overrides anything that may have been set at installation using the `--backend=<backend name>` flag. |
| &nbsp;&nbsp; &nbsp; &nbsp;`dockerDaemonOptions`|  |If `value` is set to true, it overrides the options in the Docker Engine config file. See the [Docker Engine reference](/reference/cli/dockerd/#daemon-configuration-file). Note that for added security, a few of the config attributes may be overridden when Enhanced Container Isolation is enabled. |
| &nbsp;&nbsp; &nbsp; &nbsp;`vpnkitCIDR` |  |Overrides the network range used for vpnkit DHCP/DNS for `*.docker.internal`  |
|`kubernetes`|  | If `enabled` is set to true, a Kubernetes single-node cluster is started when Docker Desktop starts. If `showSystemContainers` is set to true, Kubernetes containers are displayed in the UI and when you run `docker ps`.  `imagesRepository` allows you to specify which repository Docker Desktop pulls the Kubernetes images from. For example, `"imagesRepository": "registry-1.docker.io/docker"`.  |
| `windowsContainers` |  | Parameters and settings related to `windowsContainers` options - grouped together here for convenience.                  |
| &nbsp; &nbsp; &nbsp; &nbsp;`dockerDaemonOptions` |  | Overrides the options in the Linux daemon config file. See the [Docker Engine reference](/reference/cli/dockerd/#daemon-configuration-file).|
|`disableUpdate`|  |If `value` is set to true, checking for and notifications about Docker Desktop updates is disabled.|
|`analyticsEnabled`|  |If `value` is set to false, Docker Desktop doesn't send usage statistics to Docker. |
|`extensionsEnabled`|  |If `value` is set to false, Docker extensions are disabled. |
|`scout`|| Setting `useBackgroundIndexing` to `false` disables automatic indexing of images loaded to the image store. Setting `sbomIndexing` to `false` prevents the manual indexing triggered by inspecting an image in Docker Desktop.<br><br>**Note**: Users can still use the `docker scout` CLI commands to index images, even if indexing is disabled in Settings Management. |
| `allowExperimentalFeatures`| | If `value` is set to `false`, experimental features are disabled.|
| `allowBetaFeatures`| | If `value` is set to `false`, beta features are disabled.|
| `blockDockerLoad` | | If `value` is set to `true`, users are no longer able to run [`docker load`](/reference/cli/docker/image/load/) and receive an error if they try to.|
| `filesharingAllowedDirectories` |  | Specify which paths your developers can add file shares to. Also accepts `$HOME`, `$TMP`, or `$TEMP` as `path` variables. When a path is added, its subdirectories are allowed. If `sharedByDefault` is set to `true`, that path will be added upon factory reset or when Docker Desktop first starts. |
| `useVirtualizationFrameworkVirtioFS`|  macOS only | If `value` is set to `true`, VirtioFS is set as the file sharing mechanism. Note: If both `useVirtualizationFrameworkVirtioFS` and `useGrpcfuse` have `value` set to `true`, VirtioFS takes precedence. Likewise, if both `useVirtualizationFrameworkVirtioFS` and `useGrpcfuse` have `value` set to `false`, osxfs is set as the file sharing mechanism. |
| `useGrpcfuse` | macOS only | If `value` is set to `true`, gRPC Fuse is set as the file sharing mechanism. |
@y
| Parameter                        |   | Description                      |
| :------------------------------- |---| :------------------------------- |
| `configurationFileVersion`        |   |Specifies the version of the configuration file format.    |
| `exposeDockerAPIOnTCP2375` | Windows only| Exposes the Docker API on a specified port. If `value` is set to true, the Docker API is exposed on port 2375. Note: This is unauthenticated and should only be enabled if protected by suitable firewall rules.|
| `proxy` |   |If `mode` is set to `system` instead of `manual`, Docker Desktop gets the proxy values from the system and ignores and values set for `http`, `https` and `exclude`. Change `mode` to `manual` to manually configure proxy servers. If the proxy port is custom, specify it in the `http` or `https` property, for example `"https": "http://myotherproxy.com:4321"`. The `exclude` property specifies a comma-separated list of hosts and domains to bypass the proxy. |
| &nbsp; &nbsp; &nbsp; &nbsp;`windowsDockerdPort`  | Windows only | Exposes Docker Desktop's internal proxy locally on this port for the Windows Docker daemon to connect to. If it is set to 0, a random free port is chosen. If the value is greater than 0, use that exact value for the port. The default value is -1 which disables the option. Note: This is available for Windows containers only. |
| `enhancedContainerIsolation`  |  | If `value` is set to true, Docker Desktop runs all containers as unprivileged, via the Linux user-namespace, prevents them from modifying sensitive configurations inside the Docker Desktop VM, and uses other advanced techniques to isolate them. For more information, see [Enhanced Container Isolation](../enhanced-container-isolation/index.md).|
| &nbsp; &nbsp; &nbsp; &nbsp;`dockerSocketMount` |  | By default, enhanced container isolation blocks bind-mounting the Docker Engine socket into containers (e.g., `docker run -v /var/run/docker.sock:/var/run/docker.sock ...`). This allows admins to relax this in a controlled way. See [ECI Configuration](../enhanced-container-isolation/config.md) for more info. |
| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; `imageList` |  | Indicates which container images are allowed to bind-mount the Docker Engine socket. |
| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; `commandList` |  | Restricts the commands that containers can issue via the bind-mounted Docker Engine socket. |
| `linuxVM` |   |Parameters and settings related to Linux VM options - grouped together here for convenience. |
| &nbsp; &nbsp; &nbsp; &nbsp;`wslEngineEnabled`  | Windows only | If `value` is set to true, Docker Desktop uses the WSL 2 based engine. This overrides anything that may have been set at installation using the `--backend=<backend name>` flag. |
| &nbsp;&nbsp; &nbsp; &nbsp;`dockerDaemonOptions`|  |If `value` is set to true, it overrides the options in the Docker Engine config file. See the [Docker Engine reference](/reference/cli/dockerd/#daemon-configuration-file). Note that for added security, a few of the config attributes may be overridden when Enhanced Container Isolation is enabled. |
| &nbsp;&nbsp; &nbsp; &nbsp;`vpnkitCIDR` |  |Overrides the network range used for vpnkit DHCP/DNS for `*.docker.internal`  |
|`kubernetes`|  | If `enabled` is set to true, a Kubernetes single-node cluster is started when Docker Desktop starts. If `showSystemContainers` is set to true, Kubernetes containers are displayed in the UI and when you run `docker ps`.  `imagesRepository` allows you to specify which repository Docker Desktop pulls the Kubernetes images from. For example, `"imagesRepository": "registry-1.docker.io/docker"`.  |
| `windowsContainers` |  | Parameters and settings related to `windowsContainers` options - grouped together here for convenience.                  |
| &nbsp; &nbsp; &nbsp; &nbsp;`dockerDaemonOptions` |  | Overrides the options in the Linux daemon config file. See the [Docker Engine reference](/reference/cli/dockerd/#daemon-configuration-file).|
|`disableUpdate`|  |If `value` is set to true, checking for and notifications about Docker Desktop updates is disabled.|
|`analyticsEnabled`|  |If `value` is set to false, Docker Desktop doesn't send usage statistics to Docker. |
|`extensionsEnabled`|  |If `value` is set to false, Docker extensions are disabled. |
|`scout`|| Setting `useBackgroundIndexing` to `false` disables automatic indexing of images loaded to the image store. Setting `sbomIndexing` to `false` prevents the manual indexing triggered by inspecting an image in Docker Desktop.<br><br>**Note**: Users can still use the `docker scout` CLI commands to index images, even if indexing is disabled in Settings Management. |
| `allowExperimentalFeatures`| | If `value` is set to `false`, experimental features are disabled.|
| `allowBetaFeatures`| | If `value` is set to `false`, beta features are disabled.|
| `blockDockerLoad` | | If `value` is set to `true`, users are no longer able to run [`docker load`](/reference/cli/docker/image/load/) and receive an error if they try to.|
| `filesharingAllowedDirectories` |  | Specify which paths your developers can add file shares to. Also accepts `$HOME`, `$TMP`, or `$TEMP` as `path` variables. When a path is added, its subdirectories are allowed. If `sharedByDefault` is set to `true`, that path will be added upon factory reset or when Docker Desktop first starts. |
| `useVirtualizationFrameworkVirtioFS`|  macOS only | If `value` is set to `true`, VirtioFS is set as the file sharing mechanism. Note: If both `useVirtualizationFrameworkVirtioFS` and `useGrpcfuse` have `value` set to `true`, VirtioFS takes precedence. Likewise, if both `useVirtualizationFrameworkVirtioFS` and `useGrpcfuse` have `value` set to `false`, osxfs is set as the file sharing mechanism. |
| `useGrpcfuse` | macOS only | If `value` is set to `true`, gRPC Fuse is set as the file sharing mechanism. |
@z

@x
### Step three: Re-launch Docker Desktop
>**Note**
>
>Administrators should test the changes made through the `admin-settings.json` file locally to see if the settings work as expected.
@y
### Step three: Re-launch Docker Desktop
>**Note**
>
>Administrators should test the changes made through the `admin-settings.json` file locally to see if the settings work as expected.
@z

@x
For settings to take effect:
- On a new install, developers need to launch Docker Desktop and authenticate to their organization.
- On an existing install, developers need to quit Docker Desktop through the Docker menu, and then relaunch Docker Desktop. If they are already signed in, they don't need to sign in again for the changes to take effect.
  >**Important**
  >
  >Selecting **Restart** from the Docker menu isn't enough as it only restarts some components of Docker Desktop.
  { .important }
@y
For settings to take effect:
- On a new install, developers need to launch Docker Desktop and authenticate to their organization.
- On an existing install, developers need to quit Docker Desktop through the Docker menu, and then relaunch Docker Desktop. If they are already signed in, they don't need to sign in again for the changes to take effect.
  >**Important**
  >
  >Selecting **Restart** from the Docker menu isn't enough as it only restarts some components of Docker Desktop.
  { .important }
@z

@x
Docker doesn't automatically mandate that developers re-launch and sign in once a change has been made so as not to disrupt your developers' workflow.
@y
Docker doesn't automatically mandate that developers re-launch and sign in once a change has been made so as not to disrupt your developers' workflow.
@z

@x
In Docker Desktop, developers see the relevant settings grayed out and the message **Locked by your administrator**.
@y
In Docker Desktop, developers see the relevant settings grayed out and the message **Locked by your administrator**.
@z

@x
![Proxy settings grayed out with Settings Management](/assets/images/grayed-setting.png)
@y
![Proxy settings grayed out with Settings Management](__SUBDIR__/assets/images/grayed-setting.png)
@z
