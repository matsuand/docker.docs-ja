%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Enterprise deployment FAQs
linkTitle: FAQs
description: Frequently asked questions for deploying Docker Desktop at scale
keywords: msi, deploy, docker desktop, faqs, pkg, mdm, jamf, intune, windows, mac, enterprise, admin
@y
title: Enterprise deployment FAQs
linkTitle: FAQs
description: Frequently asked questions for deploying Docker Desktop at scale
keywords: msi, deploy, docker desktop, faqs, pkg, mdm, jamf, intune, windows, mac, enterprise, admin
@z

@x
## MSI
@y
## MSI
@z

@x
Common questions about installing Docker Desktop using the MSI installer.
@y
Common questions about installing Docker Desktop using the MSI installer.
@z

@x
### What happens to user data if they have an older Docker Desktop installation (i.e. `.exe`)?
@y
### What happens to user data if they have an older Docker Desktop installation (i.e. `.exe`)?
@z

@x
Users must [uninstall](/manuals/desktop/uninstall.md) older `.exe` installations before using the new MSI version. The `.exe` installer includes a `--keep-data` flag that removes Docker Desktop while preserving underlying resources such as the container VMs:
@y
Users must [uninstall](manuals/desktop/uninstall.md) older `.exe` installations before using the new MSI version. The `.exe` installer includes a `--keep-data` flag that removes Docker Desktop while preserving underlying resources such as the container VMs:
@z

@x
```powershell
# For all-user installations
& 'C:\Program Files\Docker\Docker\Docker Desktop Installer.exe' uninstall --keep-data
@y
```powershell
# For all-user installations
& 'C:\Program Files\Docker\Docker\Docker Desktop Installer.exe' uninstall --keep-data
@z

@x
# For per-user installations
& '%LOCALAPPDATA%\Programs\DockerDesktop\Docker Desktop Installer.exe' uninstall --keep-data
@y
# For per-user installations
& '%LOCALAPPDATA%\Programs\DockerDesktop\Docker Desktop Installer.exe' uninstall --keep-data
@z

@x
```
@y
```
@z

@x
For all-users installations, you can have the MSI do this for you with the `REMOVEEXISTINGINSTALL` property, described in the next answer.
@y
For all-users installations, you can have the MSI do this for you with the `REMOVEEXISTINGINSTALL` property, described in the next answer.
@z

@x
### What happens if the user's machine has an older `.exe` installation?
@y
### What happens if the user's machine has an older `.exe` installation?
@z

@x
### What happens if the user's machine has an older `.exe` installation?
@y
### What happens if the user's machine has an older `.exe` installation?
@z

@x
The MSI installer detects existing `.exe` installations and, by default, blocks the installation. How you resolve it depends on whether the `.exe` was installed for all users or for a single user.
@y
The MSI installer detects existing `.exe` installations and, by default, blocks the installation. How you resolve it depends on whether the `.exe` was installed for all users or for a single user.
@z

@x
#### All-users `.exe` installation
@y
#### All-users `.exe` installation
@z

@x
The installation stops with:
@y
The installation stops with:
@z

@x
```text
You need to uninstall the previous Docker Desktop version in order to use the MSI installer.
```
@y
```text
You need to uninstall the previous Docker Desktop version in order to use the MSI installer.
```
@z

@x
Either uninstall it first with `--keep-data` as described in the previous answer, or let the MSI do it by setting `REMOVEEXISTINGINSTALL=1`:
@y
Either uninstall it first with `--keep-data` as described in the previous answer, or let the MSI do it by setting `REMOVEEXISTINGINSTALL=1`:
@z

@x
```powershell
msiexec /i "DockerDesktop.msi" /L*V ".\msi.log" /quiet /norestart REMOVEEXISTINGINSTALL=1
```
@y
```powershell
msiexec /i "DockerDesktop.msi" /L*V ".\msi.log" /quiet /norestart REMOVEEXISTINGINSTALL=1
```
@z

@x
This runs the existing uninstaller with `--keep-data`, so settings and container data are preserved. `REMOVEEXISTINGINSTALL` defaults to `0` and is available with Docker Desktop version 4.30 and later.
@y
This runs the existing uninstaller with `--keep-data`, so settings and container data are preserved. `REMOVEEXISTINGINSTALL` defaults to `0` and is available with Docker Desktop version 4.30 and later.
@z

@x
#### Per-user `.exe` installation
@y
#### Per-user `.exe` installation
@z

@x
Available with Docker Desktop version 4.84 and later, the installation stops with:
@y
Available with Docker Desktop version 4.84 and later, the installation stops with:
@z

@x
```text
Docker Desktop is installed per-user for one or more accounts on this machine: <usernames>.
Please have each affected user uninstall Docker Desktop first before running the MSI installer.
```
@y
```text
Docker Desktop is installed per-user for one or more accounts on this machine: <usernames>.
Please have each affected user uninstall Docker Desktop first before running the MSI installer.
```
@z

@x
`REMOVEEXISTINGINSTALL` doesn't help here. The MSI runs with machine-wide privileges and can't reliably uninstall software installed under another user's profile, so each listed user must uninstall Docker Desktop themselves before the MSI can proceed.
@y
`REMOVEEXISTINGINSTALL` doesn't help here. The MSI runs with machine-wide privileges and can't reliably uninstall software installed under another user's profile, so each listed user must uninstall Docker Desktop themselves before the MSI can proceed.
@z

@x
With Docker Desktop version 4.83 and earlier, the MSI doesn't detect per-user installations.
@y
With Docker Desktop version 4.83 and earlier, the MSI doesn't detect per-user installations.
@z

@x
> [!NOTE]
>
> Per-user installations became more common with Docker Desktop version 4.83, when the EXE installer started selecting a per-user installation by default. Expect to encounter them on machines where developers installed Docker Desktop themselves.
@y
> [!NOTE]
>
> Per-user installations became more common with Docker Desktop version 4.83, when the EXE installer started selecting a per-user installation by default. Expect to encounter them on machines where developers installed Docker Desktop themselves.
@z

@x
### Can I install the MSI per-user?
@y
### Can I install the MSI per-user?
@z

@x
No. The MSI installer only supports all-users installations.
@y
No. The MSI installer only supports all-users installations.
@z

@x
Available with Docker Desktop version 4.92 and later, passing `MSIINSTALLPERUSER` fails with:
@y
Available with Docker Desktop version 4.92 and later, passing `MSIINSTALLPERUSER` fails with:
@z

@x
```text
Docker Desktop does not support per-user installation with the MSI installer.
```
@y
```text
Docker Desktop does not support per-user installation with the MSI installer.
```
@z

@x
With Docker Desktop version 4.91 and earlier, the MSI accepts `MSIINSTALLPERUSER` but produces an installation that later updates can't upgrade.
@y
With Docker Desktop version 4.91 and earlier, the MSI accepts `MSIINSTALLPERUSER` but produces an installation that later updates can't upgrade.
@z

@x
Use the EXE installer with the `--user` flag if you need a per-user installation.
@y
Use the EXE installer with the `--user` flag if you need a per-user installation.
@z

@x
### My installation failed, how do I find out what happened?
@y
### My installation failed, how do I find out what happened?
@z

@x
MSI installations may fail silently, offering little diagnostic feedback.
@y
MSI installations may fail silently, offering little diagnostic feedback.
@z

@x
To debug a failed installation, run the install again with verbose logging enabled:
@y
To debug a failed installation, run the install again with verbose logging enabled:
@z

@x
```powershell
msiexec /i "DockerDesktop.msi" /L*V ".\msi.log"
```
@y
```powershell
msiexec /i "DockerDesktop.msi" /L*V ".\msi.log"
```
@z

@x
After the installation has failed, open the log file and search for occurrences of `value 3`. This is the exit code Windows Installer outputs when it has failed. Just above the line, you will find the reason for the failure.
@y
After the installation has failed, open the log file and search for occurrences of `value 3`. This is the exit code Windows Installer outputs when it has failed. Just above the line, you will find the reason for the failure.
@z

@x
### Why does the installer prompt for a reboot at the end of every fresh installation?
@y
### Why does the installer prompt for a reboot at the end of every fresh installation?
@z

@x
The installer prompts for a reboot because it assumes that changes have been made to the system that require a reboot to finish their configuration.
@y
The installer prompts for a reboot because it assumes that changes have been made to the system that require a reboot to finish their configuration.
@z

@x
For example, if you select the WSL engine, the installer adds the required Windows features. After these features are installed, the system reboots to complete configurations so the WSL engine is functional.
@y
For example, if you select the WSL engine, the installer adds the required Windows features. After these features are installed, the system reboots to complete configurations so the WSL engine is functional.
@z

@x
You can suppress reboots by using the `/norestart` option when launching the installer from the command line:
@y
You can suppress reboots by using the `/norestart` option when launching the installer from the command line:
@z

@x
```powershell
msiexec /i "DockerDesktop.msi" /L*V ".\msi.log" /norestart
```
@y
```powershell
msiexec /i "DockerDesktop.msi" /L*V ".\msi.log" /norestart
```
@z

@x
### Why isn't the `docker-users` group populated when the MSI is installed with Intune or another MDM solution?
@y
### Why isn't the `docker-users` group populated when the MSI is installed with Intune or another MDM solution?
@z

@x
It's common for MDM solutions to install applications in the context of the system account. This means that the `docker-users` group isn't populated with the user's account, as the system account doesn't have access to the user's context.
@y
It's common for MDM solutions to install applications in the context of the system account. This means that the `docker-users` group isn't populated with the user's account, as the system account doesn't have access to the user's context.
@z

@x
As an example, you can reproduce this by running the installer with `psexec` in an elevated command prompt:
@y
As an example, you can reproduce this by running the installer with `psexec` in an elevated command prompt:
@z

@x
```powershell
psexec -i -s msiexec /i "DockerDesktop.msi"
```
The installation should complete successfully, but the `docker-users` group won't be populated.
@y
```powershell
psexec -i -s msiexec /i "DockerDesktop.msi"
```
The installation should complete successfully, but the `docker-users` group won't be populated.
@z

@x
As a workaround, you can create a script that runs in the context of the user account.
@y
As a workaround, you can create a script that runs in the context of the user account.
@z

@x
The script would be responsible for ensuring the `docker-users` group exists and populating it with the correct user.
@y
The script would be responsible for ensuring the `docker-users` group exists and populating it with the correct user.
@z

@x
> [!WARNING]
>
> Membership in `docker-users` grants access to the Docker daemon socket, which is equivalent to granting administrative privileges on the host. Only add users who require access to Windows containers or Hyper-V VM management. For Linux containers using the WSL 2 backend, this group membership is not required. See [Protect the Docker daemon socket](/manuals/engine/security/protect-access.md) for further information.
@y
> [!WARNING]
>
> Membership in `docker-users` grants access to the Docker daemon socket, which is equivalent to granting administrative privileges on the host. Only add users who require access to Windows containers or Hyper-V VM management. For Linux containers using the WSL 2 backend, this group membership is not required. See [Protect the Docker daemon socket](manuals/engine/security/protect-access.md) for further information.
@z

@x
Here's an example script that creates the `docker-users` group if needed and adds the current user to it (requirements may vary depending on environment):
@y
Here's an example script that creates the `docker-users` group if needed and adds the current user to it (requirements may vary depending on environment):
@z

@x
```powershell
$Group = "docker-users"
$CurrentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
@y
```powershell
$Group = "docker-users"
$CurrentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
@z

@x
# Create the group if it doesn't exist
if (-not (Get-LocalGroup -Name $Group -ErrorAction SilentlyContinue)) {
    New-LocalGroup -Name $Group
}
@y
# Create the group if it doesn't exist
if (-not (Get-LocalGroup -Name $Group -ErrorAction SilentlyContinue)) {
    New-LocalGroup -Name $Group
}
@z

@x
# Add the user to the group
Add-LocalGroupMember -Group $Group -Member $CurrentUser
```
@y
# Add the user to the group
Add-LocalGroupMember -Group $Group -Member $CurrentUser
```
@z

@x
> [!NOTE]
>
> After adding a new user to the `docker-users` group, the user must sign out and then sign back in for the changes to take effect.
@y
> [!NOTE]
>
> After adding a new user to the `docker-users` group, the user must sign out and then sign back in for the changes to take effect.
@z

@x
## MDM
@y
## MDM
@z

@x
Common questions about deploying Docker Desktop using mobile device management
(MDM) tools such as Jamf, Intune, or Workspace ONE.
@y
Common questions about deploying Docker Desktop using mobile device management
(MDM) tools such as Jamf, Intune, or Workspace ONE.
@z

@x
### Why doesn't my MDM tool apply all Docker Desktop configuration settings at once?
@y
### Why doesn't my MDM tool apply all Docker Desktop configuration settings at once?
@z

@x
Some MDM tools, such as Workspace ONE, may not support applying multiple
configuration settings in a single XML file. In these cases, you may need to
deploy each setting in a separate XML file.
@y
Some MDM tools, such as Workspace ONE, may not support applying multiple
configuration settings in a single XML file. In these cases, you may need to
deploy each setting in a separate XML file.
@z

@x
Refer to your MDM provider's documentation for specific deployment
requirements or limitations.
@y
Refer to your MDM provider's documentation for specific deployment
requirements or limitations.
@z
