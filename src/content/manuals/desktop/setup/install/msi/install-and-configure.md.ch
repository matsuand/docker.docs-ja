%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
title: Install and configure
description: Understand how to use the MSI installer. Also explore additional configuration options.
keywords: msi, windows, docker desktop, install, deploy, configure
@y
title: Install and configure
description: Understand how to use the MSI installer. Also explore additional configuration options.
keywords: msi, windows, docker desktop, install, deploy, configure
@z

@x
## Install interactively
@y
## Install interactively
@z

@x
1. In the [Docker Admin Console](http://admin.docker.com/), navigate to your organization.   
@y
1. In the [Docker Admin Console](http://admin.docker.com/), navigate to your organization.   
@z

@x
2. Under **Security and access**, select the **Deploy Docker Desktop** page. 
@y
2. Under **Security and access**, select the **Deploy Docker Desktop** page. 
@z

@x
3. Select the **Download MSI installer** button. 
@y
3. Select the **Download MSI installer** button. 
@z

@x
4. Once downloaded, double-click `Docker Desktop Installer.msi` to run the installer. 
@y
4. Once downloaded, double-click `Docker Desktop Installer.msi` to run the installer. 
@z

@x
5. Once you've accepted the license agreement, you can choose the install location. By default, Docker Desktop is installed at `C:\Program Files\Docker\Docker`.
@y
5. Once you've accepted the license agreement, you can choose the install location. By default, Docker Desktop is installed at `C:\Program Files\Docker\Docker`.
@z

@x
6. Configure the Docker Desktop installation. You can:
@y
6. Configure the Docker Desktop installation. You can:
@z

@x
    - Create a desktop shortcut
@y
    - Create a desktop shortcut
@z

@x
    - Set the Docker Desktop service startup type to automatic
@y
    - Set the Docker Desktop service startup type to automatic
@z

@x
    - Disable Windows Container usage
@y
    - Disable Windows Container usage
@z

@x
    - Select the engine for Docker Desktop. Either WSL or Hyper-V. If your system only supports one of the two options, you won't be able to select which backend to use.
@y
    - Select the engine for Docker Desktop. Either WSL or Hyper-V. If your system only supports one of the two options, you won't be able to select which backend to use.
@z

@x
7. Follow the instructions on the installation wizard to authorize the installer and proceed with the install.
@y
7. Follow the instructions on the installation wizard to authorize the installer and proceed with the install.
@z

@x
8. When the installation is successful, select **Finish** to complete the installation process.
@y
8. When the installation is successful, select **Finish** to complete the installation process.
@z

@x
If your administrator account is different to your user account, you must add the user to the **docker-users** group:
1. Run **Computer Management** as an **administrator**.
2. Navigate to **Local Users and Groups** > **Groups** > **docker-users**. 
3. Right-click to add the user to the group.
4. Sign out and sign back in for the changes to take effect.
@y
If your administrator account is different to your user account, you must add the user to the **docker-users** group:
1. Run **Computer Management** as an **administrator**.
2. Navigate to **Local Users and Groups** > **Groups** > **docker-users**. 
3. Right-click to add the user to the group.
4. Sign out and sign back in for the changes to take effect.
@z

@x
> [!NOTE]
>
> When installing Docker Desktop with the MSI, in-app updates are automatically disabled. This feature ensures your organization maintains the required Docker Desktop version. For Docker Desktop installed with the .exe installer, in-app updates remain supported.
>
> Docker Desktop notifies you when an update is available. To update Docker Desktop, download the latest installer from the Docker Admin Console. Navigate to the  **Deploy Docker Desktop** page > under **Security and access**. 
>
> To keep up to date with new releases, check the [release notes](https://docs.docker.com/desktop/release-notes/) page.
@y
> [!NOTE]
>
> When installing Docker Desktop with the MSI, in-app updates are automatically disabled. This feature ensures your organization maintains the required Docker Desktop version. For Docker Desktop installed with the .exe installer, in-app updates remain supported.
>
> Docker Desktop notifies you when an update is available. To update Docker Desktop, download the latest installer from the Docker Admin Console. Navigate to the  **Deploy Docker Desktop** page > under **Security and access**. 
>
> To keep up to date with new releases, check the [release notes](https://docs.docker.com/desktop/release-notes/) page.
@z

@x
## Install from the command line
@y
## Install from the command line
@z

@x
This section covers command line installations of Docker Desktop using PowerShell. It provides common installation commands that you can run. You can also add additional arguments which are outlined in [configuration options](#configuration-options).
@y
This section covers command line installations of Docker Desktop using PowerShell. It provides common installation commands that you can run. You can also add additional arguments which are outlined in [configuration options](#configuration-options).
@z

@x
When installing Docker Desktop, you can choose between interactive or non-interactive installations. 
@y
When installing Docker Desktop, you can choose between interactive or non-interactive installations. 
@z

@x
Interactive installations, without specifying `/quiet` or `/qn`, display the user interface and let you select your own properties. 
@y
Interactive installations, without specifying `/quiet` or `/qn`, display the user interface and let you select your own properties. 
@z

@x
When installing via the user interface it's possible to:
@y
When installing via the user interface it's possible to:
@z

@x
- Choose the destination folder
- Create a desktop shortcut
- Configure the Docker Desktop service startup type
- Disable Windows Containers
- Choose between the WSL or Hyper-V engine
@y
- Choose the destination folder
- Create a desktop shortcut
- Configure the Docker Desktop service startup type
- Disable Windows Containers
- Choose between the WSL or Hyper-V engine
@z

@x
Non-interactive installations are silent and any additional configuration must be passed as arguments.
@y
Non-interactive installations are silent and any additional configuration must be passed as arguments.
@z

@x
### Common installation commands
@y
### Common installation commands
@z

@x
> [!IMPORTANT]
>
> Admin rights are required to run any of the following commands.
@y
> [!IMPORTANT]
>
> Admin rights are required to run any of the following commands.
@z

@x
#### Installing interactively with verbose logging
@y
#### Installing interactively with verbose logging
@z

% snip command...

@x
#### Installing interactively without verbose logging
@y
#### Installing interactively without verbose logging
@z

% snip command...

@x
#### Installing non-interactively with verbose logging
@y
#### Installing non-interactively with verbose logging
@z

% snip command...

@x
#### Installing non-interactively and suppressing reboots
@y
#### Installing non-interactively and suppressing reboots
@z

% snip command...

@x
#### Installing non-interactively with admin settings
@y
#### Installing non-interactively with admin settings
@z

% snip command...

@x
#### Installing with the passive display option
@y
#### Installing with the passive display option
@z

@x
You can use the `/passive` display option instead of `/quiet` when you want to perform a non-interactive installation but show a progress dialog.
@y
You can use the `/passive` display option instead of `/quiet` when you want to perform a non-interactive installation but show a progress dialog.
@z

@x
In passive mode the installer doesn't display any prompts or error messages to the user and the installation cannot be cancelled.
@y
In passive mode the installer doesn't display any prompts or error messages to the user and the installation cannot be cancelled.
@z

@x
For example:
@y
For example:
@z

% snip command...

@x
> [!TIP]
>
> Some useful tips to remember when creating a value that expects a JSON string as it’s value:
> 
> - The property expects a JSON formatted string
> - The string should be wrapped in double quotes
> - The string shouldn't contain any whitespace
> - Property names are expected to be in double quotes
@y
> [!TIP]
>
> Some useful tips to remember when creating a value that expects a JSON string as it’s value:
> 
> - The property expects a JSON formatted string
> - The string should be wrapped in double quotes
> - The string shouldn't contain any whitespace
> - Property names are expected to be in double quotes
@z

@x
### Common uninstall commands
@y
### Common uninstall commands
@z

@x
When uninstalling Docker Desktop, you need to use the same `.msi` file that was originally used to install the application.
@y
When uninstalling Docker Desktop, you need to use the same `.msi` file that was originally used to install the application.
@z

@x
If you no longer have the original `.msi` file, you need to use the product code associated with the installation. To find the product code, run:
@y
If you no longer have the original `.msi` file, you need to use the product code associated with the installation. To find the product code, run:
@z

% snip command...

@x
It should return output similar to the following:
@y
It should return output similar to the following:
@z

% snip output...

@x
`IdentifyingNumber` is the applications product code and can be used to uninstall Docker Desktop. For example:
@y
`IdentifyingNumber` is the applications product code and can be used to uninstall Docker Desktop. For example:
@z

% snip command...

@x
#### Uninstalling interactively with verbose logging
@y
#### Uninstalling interactively with verbose logging
@z

% snip command...

@x
#### Uninstalling interactively without verbose logging
@y
#### Uninstalling interactively without verbose logging
@z

% snip command...

@x
#### Uninstalling non-interactively with verbose logging
@y
#### Uninstalling non-interactively with verbose logging
@z

% snip command...

@x
#### Uninstalling non-interactively without verbose logging
@y
#### Uninstalling non-interactively without verbose logging
@z

% snip command...

@x
### Configuration options 
@y
### Configuration options 
@z

@x
> [!IMPORTANT]
>
> In addition to the following custom properties, the Docker Desktop MSI installer also supports the standard [Windows Installer command line options](https://learn.microsoft.com/en-us/windows/win32/msi/standard-installer-command-line-options).
@y
> [!IMPORTANT]
>
> In addition to the following custom properties, the Docker Desktop MSI installer also supports the standard [Windows Installer command line options](https://learn.microsoft.com/en-us/windows/win32/msi/standard-installer-command-line-options).
@z

@x
| Property | Description | Default |
| :--- | :--- | :--- |
| `ENABLEDESKTOPSHORTCUT` | Creates a desktop shortcut. | 1 |
| `INSTALLFOLDER` | Specifies a custom location where Docker Desktop will be installed. | C:\Program Files\Docker |
| `ADMINSETTINGS` | Automatically creates an `admin-settings.json` file which is used to [control certain Docker Desktop settings](/manuals/security/for-admins/hardened-desktop/settings-management/_index.md) on client machines within organizations. It must be used together with the `ALLOWEDORG` property. | None |
| `ALLOWEDORG` | Requires the user to sign in and be part of the specified Docker Hub organization when running the application. This creates a registry key called `allowedOrgs` in `HKLM\Software\Policies\Docker\Docker Desktop`. | None |
| `ALWAYSRUNSERVICE` | Lets users switch to Windows containers without needing admin rights | 0 |
| `DISABLEWINDOWSCONTAINERS` | Disables the Windows containers integration | 0 |
| `ENGINE` | Sets the Docker Engine that's used to run containers. This can be either `wsl` , `hyperv`, or `windows` | `wsl` |
| `PROXYENABLEKERBEROSNTLM` | When set to 1, enables support for Kerberos and NTLM proxy authentication. Available with Docker Desktop 4.33 and later| 0 |
| `PROXYHTTPMODE` | Sets the HTTP Proxy mode. This can be either `system` or `manual` | `system` |
| `OVERRIDEPROXYHTTP` | Sets the URL of the HTTP proxy that must be used for outgoing HTTP requests. | None |
| `OVERRIDEPROXYHTTPS` | Sets the URL of the HTTP proxy that must be used for outgoing HTTPS requests. | None |
| `OVERRIDEPROXYEXCLUDE` | Bypasses proxy settings for the hosts and domains. Uses a comma-separated list. | None |
| `HYPERVDEFAULTDATAROOT` | Specifies the default location for the Hyper-V VM disk. | None |
| `WINDOWSCONTAINERSDEFAULTDATAROOT` | Specifies the default location for Windows containers. | None |
| `WSLDEFAULTDATAROOT` | Specifies the default location for the WSL distribution disk. | None |
| `DISABLEANALYTICS` | When set to 1, analytics collection will be disabled for the MSI. For more information, see [Analytics](#analytics). | 0 |
@y
| Property | Description | Default |
| :--- | :--- | :--- |
| `ENABLEDESKTOPSHORTCUT` | Creates a desktop shortcut. | 1 |
| `INSTALLFOLDER` | Specifies a custom location where Docker Desktop will be installed. | C:\Program Files\Docker |
| `ADMINSETTINGS` | Automatically creates an `admin-settings.json` file which is used to [control certain Docker Desktop settings](manuals/security/for-admins/hardened-desktop/settings-management/_index.md) on client machines within organizations. It must be used together with the `ALLOWEDORG` property. | None |
| `ALLOWEDORG` | Requires the user to sign in and be part of the specified Docker Hub organization when running the application. This creates a registry key called `allowedOrgs` in `HKLM\Software\Policies\Docker\Docker Desktop`. | None |
| `ALWAYSRUNSERVICE` | Lets users switch to Windows containers without needing admin rights | 0 |
| `DISABLEWINDOWSCONTAINERS` | Disables the Windows containers integration | 0 |
| `ENGINE` | Sets the Docker Engine that's used to run containers. This can be either `wsl` , `hyperv`, or `windows` | `wsl` |
| `PROXYENABLEKERBEROSNTLM` | When set to 1, enables support for Kerberos and NTLM proxy authentication. Available with Docker Desktop 4.33 and later| 0 |
| `PROXYHTTPMODE` | Sets the HTTP Proxy mode. This can be either `system` or `manual` | `system` |
| `OVERRIDEPROXYHTTP` | Sets the URL of the HTTP proxy that must be used for outgoing HTTP requests. | None |
| `OVERRIDEPROXYHTTPS` | Sets the URL of the HTTP proxy that must be used for outgoing HTTPS requests. | None |
| `OVERRIDEPROXYEXCLUDE` | Bypasses proxy settings for the hosts and domains. Uses a comma-separated list. | None |
| `HYPERVDEFAULTDATAROOT` | Specifies the default location for the Hyper-V VM disk. | None |
| `WINDOWSCONTAINERSDEFAULTDATAROOT` | Specifies the default location for Windows containers. | None |
| `WSLDEFAULTDATAROOT` | Specifies the default location for the WSL distribution disk. | None |
| `DISABLEANALYTICS` | When set to 1, analytics collection will be disabled for the MSI. For more information, see [Analytics](#analytics). | 0 |
@z

@x
Additionally, you can also use `/norestart` or `/forcerestart` to control reboot behaviour.
@y
Additionally, you can also use `/norestart` or `/forcerestart` to control reboot behaviour.
@z

@x
By default, the installer reboots the machine after a successful installation. When ran silently, the reboot is automatic and the user is not prompted.
@y
By default, the installer reboots the machine after a successful installation. When ran silently, the reboot is automatic and the user is not prompted.
@z

@x
## Analytics
@y
## Analytics
@z

@x
The MSI installer collects anonymous usage statistics to better understand user behaviour and to improve the user experience by identifying and addressing issues or optimizing popular features.
@y
The MSI installer collects anonymous usage statistics to better understand user behaviour and to improve the user experience by identifying and addressing issues or optimizing popular features.
@z

@x
### How to opt-out
@y
### How to opt-out
@z

@x
{{< tabs >}}
{{< tab name="From the GUI" >}}
@y
{{< tabs >}}
{{< tab name="From the GUI" >}}
@z

@x
When you install Docker Desktop from the default installer GUI, select the **Disable analytics** checkbox located on the bottom-left corner of the **Welcome** dialog.
@y
When you install Docker Desktop from the default installer GUI, select the **Disable analytics** checkbox located on the bottom-left corner of the **Welcome** dialog.
@z

@x
{{< /tab >}}
{{< tab name="From the command line" >}}
@y
{{< /tab >}}
{{< tab name="From the command line" >}}
@z

@x
When you install Docker Desktop from the command line, use the `DISABLEANALYTICS` property.
@y
When you install Docker Desktop from the command line, use the `DISABLEANALYTICS` property.
@z

% snip command...

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Persistence
@y
### Persistence
@z

@x
If you decide to disable analytics for an installation, your choice is persisted in the registry and honoured across future upgrades and uninstalls.
@y
If you decide to disable analytics for an installation, your choice is persisted in the registry and honoured across future upgrades and uninstalls.
@z

@x
However, the key is removed when Docker Desktop is uninstalled and must be configured again via one of the previous methods.
@y
However, the key is removed when Docker Desktop is uninstalled and must be configured again via one of the previous methods.
@z

@x
The registry key is as follows:
@y
The registry key is as follows:
@z

% snip command...

@x
When analytics is disabled, this key has a value of `1`. 
@y
When analytics is disabled, this key has a value of `1`. 
@z

@x
## Additional resources
@y
## Additional resources
@z

@x
- [Explore the FAQs](faq.md)
@y
- [Explore the FAQs](faq.md)
@z
