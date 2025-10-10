%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

%  .md リンクへの (no slash) 対応

@x
title: MSI installer
description: Understand how to use the MSI installer. Also explore additional configuration options.
keywords: msi, windows, docker desktop, install, deploy, configure, admin, mdm
@y
title: MSI installer
description: Understand how to use the MSI installer. Also explore additional configuration options.
keywords: msi, windows, docker desktop, install, deploy, configure, admin, mdm
@z

@x
{{< summary-bar feature_name="MSI installer" >}}
@y
{{< summary-bar feature_name="MSI installer" >}}
@z

@x
The MSI package supports various MDM (Mobile Device Management) solutions, making it ideal for bulk installations and eliminating the need for manual setups by individual users. With this package, IT administrators can ensure standardized, policy-driven installations of Docker Desktop, enhancing efficiency and software management across their organizations.
@y
The MSI package supports various MDM (Mobile Device Management) solutions, making it ideal for bulk installations and eliminating the need for manual setups by individual users. With this package, IT administrators can ensure standardized, policy-driven installations of Docker Desktop, enhancing efficiency and software management across their organizations.
@z

@x
## Install interactively
@y
## Install interactively
@z

@x
1. In [Docker Home](http://app.docker.com), choose your organization.
2. Select **Admin Console**, then **Enterprise deployment**.
3. From the **Windows OS** tab, select the **Download MSI installer** button.
4. Once downloaded, double-click `Docker Desktop Installer.msi` to run the installer.
5. After accepting the license agreement, choose the install location. By default, Docker Desktop is installed at `C:\Program Files\Docker\Docker`.
6. Configure the Docker Desktop installation. You can:
@y
1. In [Docker Home](http://app.docker.com), choose your organization.
2. Select **Admin Console**, then **Enterprise deployment**.
3. From the **Windows OS** tab, select the **Download MSI installer** button.
4. Once downloaded, double-click `Docker Desktop Installer.msi` to run the installer.
5. After accepting the license agreement, choose the install location. By default, Docker Desktop is installed at `C:\Program Files\Docker\Docker`.
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
    - Select the Docker Desktop backend: WSL or Hyper-V. If only one is supported by your system, you won't be able to choose.
7. Follow the instructions on the installation wizard to authorize the installer and proceed with the install.
8. When the installation is successful, select **Finish** to complete the installation process.
@y
    - Select the Docker Desktop backend: WSL or Hyper-V. If only one is supported by your system, you won't be able to choose.
7. Follow the instructions on the installation wizard to authorize the installer and proceed with the install.
8. When the installation is successful, select **Finish** to complete the installation process.
@z

@x
If your administrator account is different from your user account, you must add the user to the **docker-users** group to access features that require higher privileges, such as creating and managing the Hyper-V VM, or using Windows containers:
@y
If your administrator account is different from your user account, you must add the user to the **docker-users** group to access features that require higher privileges, such as creating and managing the Hyper-V VM, or using Windows containers:
@z

@x
1. Run **Computer Management** as an **administrator**.
2. Navigate to **Local Users and Groups** > **Groups** > **docker-users**.
3. Right-click to add the user to the group.
4. Sign out and sign back in for the changes to take effect.
@y
1. Run **Computer Management** as an **administrator**.
2. Navigate to **Local Users and Groups** > **Groups** > **docker-users**.
3. Right-click to add the user to the group.
4. Sign out and sign back in for the changes to take effect.
@z

@x
> [!NOTE]
>
> When installing Docker Desktop with the MSI, in-app updates are automatically disabled. This ensures organizations can maintain version consistency and prevent unapproved updates. For Docker Desktop installed with the .exe installer, in-app updates remain supported.
>
> Docker Desktop notifies you when an update is available. To update Docker Desktop, download the latest installer from the Docker Admin Console. Navigate to the **Enterprise deployment** page.
>
> To keep up to date with new releases, check the [release notes](/manuals/desktop/release-notes.md) page.
@y
> [!NOTE]
>
> When installing Docker Desktop with the MSI, in-app updates are automatically disabled. This ensures organizations can maintain version consistency and prevent unapproved updates. For Docker Desktop installed with the .exe installer, in-app updates remain supported.
>
> Docker Desktop notifies you when an update is available. To update Docker Desktop, download the latest installer from the Docker Admin Console. Navigate to the **Enterprise deployment** page.
>
> To keep up to date with new releases, check the [release notes](manuals/desktop/release-notes.md) page.
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
#### Install interactively with verbose logging
@y
#### Install interactively with verbose logging
@z

% snip command...

@x
#### Install interactively without verbose logging
@y
#### Install interactively without verbose logging
@z

% snip command...

@x
#### Install non-interactively with verbose logging
@y
#### Install non-interactively with verbose logging
@z

% snip command...

@x
#### Install non-interactively and suppressing reboots
@y
#### Install non-interactively and suppressing reboots
@z

% snip command...

@x
#### Install non-interactively with admin settings
@y
#### Install non-interactively with admin settings
@z

% snip command...

@x
#### Install interactively and allow users to switch to Windows containers without admin rights
@y
#### Install interactively and allow users to switch to Windows containers without admin rights
@z

% snip command...

@x
#### Install with the passive display option
@y
#### Install with the passive display option
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
> When creating a value that expects a JSON string:
>
> - The property expects a JSON formatted string
> - The string should be wrapped in double quotes
> - The string shouldn't contain any whitespace
> - Property names are expected to be in double quotes
@y
> [!TIP]
>
> When creating a value that expects a JSON string:
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
> [!NOTE]
>
> This command may take some time, depending on the number of installed applications.
@y
> [!NOTE]
>
> This command may take some time, depending on the number of installed applications.
@z

@x
`IdentifyingNumber` is the applications product code and can be used to uninstall Docker Desktop. For example:
@y
`IdentifyingNumber` is the applications product code and can be used to uninstall Docker Desktop. For example:
@z

% snip command...

@x
#### Uninstall interactively with verbose logging
@y
#### Uninstall interactively with verbose logging
@z

% snip command...

@x
#### Uninstall interactively without verbose logging
@y
#### Uninstall interactively without verbose logging
@z

% snip command...

@x
#### Uninstall non-interactively with verbose logging
@y
#### Uninstall non-interactively with verbose logging
@z

% snip command...

@x
#### Uninstall non-interactively without verbose logging
@y
#### Uninstall non-interactively without verbose logging
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
| `ADMINSETTINGS` | Automatically creates an `admin-settings.json` file which is used to [control certain Docker Desktop settings](/manuals/enterprise/security/hardened-desktop/settings-management/_index.md) on client machines within organizations. It must be used together with the `ALLOWEDORG` property. | None |
| `ALLOWEDORG` | Requires the user to sign in and be part of the specified Docker Hub organization when running the application. This creates a registry key called `allowedOrgs` in `HKLM\Software\Policies\Docker\Docker Desktop`. | None |
| `ALWAYSRUNSERVICE` | Lets users switch to Windows containers without needing admin rights | 0 |
| `DISABLEWINDOWSCONTAINERS` | Disables the Windows containers integration | 0 |
| `ENGINE` | Sets the Docker Engine that's used to run containers. This can be either `wsl` , `hyperv`, or `windows` | `wsl` |
| `PROXYENABLEKERBEROSNTLM` | When set to 1, enables support for Kerberos and NTLM proxy authentication. Available with Docker Desktop 4.33 and later| 0 |
| `PROXYHTTPMODE` | Sets the HTTP Proxy mode. This can be either `system` or `manual` | `system` |
| `OVERRIDEPROXYHTTP` | Sets the URL of the HTTP proxy that must be used for outgoing HTTP requests. | None |
| `OVERRIDEPROXYHTTPS` | Sets the URL of the HTTP proxy that must be used for outgoing HTTPS requests. | None |
| `OVERRIDEPROXYEXCLUDE` | Bypasses proxy settings for the hosts and domains. Uses a comma-separated list. | None |
| `OVERRIDEPROXYPAC` | Sets the PAC file URL. This setting takes effect only when using `manual` proxy mode. | None |
| `OVERRIDEPROXYEMBEDDEDPAC` | Specifies an embedded PAC (Proxy Auto-Config) script. This setting takes effect only when using `manual` proxy mode and has precedence over the `OVERRIDEPROXYPAC` flag.| None |
| `HYPERVDEFAULTDATAROOT` | Specifies the default location for the Hyper-V VM disk. | None |
| `WINDOWSCONTAINERSDEFAULTDATAROOT` | Specifies the default location for Windows containers. | None |
| `WSLDEFAULTDATAROOT` | Specifies the default location for the WSL distribution disk. | None |
| `DISABLEANALYTICS` | When set to 1, analytics collection will be disabled for the MSI. For more information, see [Analytics](#analytics). | 0 |
@y
| Property | Description | Default |
| :--- | :--- | :--- |
| `ENABLEDESKTOPSHORTCUT` | Creates a desktop shortcut. | 1 |
| `INSTALLFOLDER` | Specifies a custom location where Docker Desktop will be installed. | C:\Program Files\Docker |
| `ADMINSETTINGS` | Automatically creates an `admin-settings.json` file which is used to [control certain Docker Desktop settings](manuals/enterprise/security/hardened-desktop/settings-management/_index.md) on client machines within organizations. It must be used together with the `ALLOWEDORG` property. | None |
| `ALLOWEDORG` | Requires the user to sign in and be part of the specified Docker Hub organization when running the application. This creates a registry key called `allowedOrgs` in `HKLM\Software\Policies\Docker\Docker Desktop`. | None |
| `ALWAYSRUNSERVICE` | Lets users switch to Windows containers without needing admin rights | 0 |
| `DISABLEWINDOWSCONTAINERS` | Disables the Windows containers integration | 0 |
| `ENGINE` | Sets the Docker Engine that's used to run containers. This can be either `wsl` , `hyperv`, or `windows` | `wsl` |
| `PROXYENABLEKERBEROSNTLM` | When set to 1, enables support for Kerberos and NTLM proxy authentication. Available with Docker Desktop 4.33 and later| 0 |
| `PROXYHTTPMODE` | Sets the HTTP Proxy mode. This can be either `system` or `manual` | `system` |
| `OVERRIDEPROXYHTTP` | Sets the URL of the HTTP proxy that must be used for outgoing HTTP requests. | None |
| `OVERRIDEPROXYHTTPS` | Sets the URL of the HTTP proxy that must be used for outgoing HTTPS requests. | None |
| `OVERRIDEPROXYEXCLUDE` | Bypasses proxy settings for the hosts and domains. Uses a comma-separated list. | None |
| `OVERRIDEPROXYPAC` | Sets the PAC file URL. This setting takes effect only when using `manual` proxy mode. | None |
| `OVERRIDEPROXYEMBEDDEDPAC` | Specifies an embedded PAC (Proxy Auto-Config) script. This setting takes effect only when using `manual` proxy mode and has precedence over the `OVERRIDEPROXYPAC` flag.| None |
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
By default, the installer reboots the machine after a successful installation. When run silently, the reboot is automatic and the user is not prompted.
@y
By default, the installer reboots the machine after a successful installation. When run silently, the reboot is automatic and the user is not prompted.
@z

@x
## Analytics
@y
## Analytics
@z

@x
The MSI installer collects anonymous usage statistics relating to installation only. This is to better understand user behaviour and to improve the user experience by identifying and addressing issues or optimizing popular features.
@y
The MSI installer collects anonymous usage statistics relating to installation only. This is to better understand user behaviour and to improve the user experience by identifying and addressing issues or optimizing popular features.
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
When analytics is disabled, this key is set to `1`.
@y
When analytics is disabled, this key is set to `1`.
@z

@x
## Additional resources
@y
## Additional resources
@z

@x
- [Explore the FAQs](/manuals/enterprise/enterprise-deployment/faq.md)
@y
- [Explore the FAQs](manuals/enterprise/enterprise-deployment/faq.md)
@z
