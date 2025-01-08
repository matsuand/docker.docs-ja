%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: FAQs
description: Frequently asked questions for deploying Docker Desktop at scale
keywords: msi, deploy, docker desktop, faqs, pkg
@y
title: FAQs
description: Frequently asked questions for deploying Docker Desktop at scale
keywords: msi, deploy, docker desktop, faqs, pkg
@z

@x
### What happens to user data if they have an older Docker Desktop installation (i.e. `.exe`)?
@y
### What happens to user data if they have an older Docker Desktop installation (i.e. `.exe`)?
@z

@x
If they have an older `.exe` installation, users must [uninstall](/manuals/desktop/uninstall.md) this version before using the new MSI version. This deletes all Docker containers, images, volumes, and other Docker-related data local to the machine, and removes the files generated by the application. For older versions, users should [backup](/manuals/desktop/settings-and-maintenance/backup-and-restore.md) any containers that they want to keep.
@y
If they have an older `.exe` installation, users must [uninstall](manuals/desktop/uninstall.md) this version before using the new MSI version. This deletes all Docker containers, images, volumes, and other Docker-related data local to the machine, and removes the files generated by the application. For older versions, users should [backup](manuals/desktop/settings-and-maintenance/backup-and-restore.md) any containers that they want to keep.
@z

@x
For Docker Desktop versions 4.30 and later of the `exe` installer, a `-keep-data` flag is available. It removes Docker Desktop but keeps underlying data, such as the VMs that run containers.
@y
For Docker Desktop versions 4.30 and later of the `exe` installer, a `-keep-data` flag is available. It removes Docker Desktop but keeps underlying data, such as the VMs that run containers.
@z

@x
```powershell
& 'C:\Program Files\Docker\Docker\Docker Desktop Installer.exe' uninstall -keep-data
```
@y
```powershell
& 'C:\Program Files\Docker\Docker\Docker Desktop Installer.exe' uninstall -keep-data
```
@z

@x
### What happens if the user's machine has an older `.exe` installation?
@y
### What happens if the user's machine has an older `.exe` installation?
@z

@x
The new MSI installer checks if a previous version was installed and doesn't proceed with the installation. Instead, it prompts the user to uninstall their current/old version first, before retrying to install the MSI version.
@y
The new MSI installer checks if a previous version was installed and doesn't proceed with the installation. Instead, it prompts the user to uninstall their current/old version first, before retrying to install the MSI version.
@z

@x
### My installation failed, how do I find out what happened?
@y
### My installation failed, how do I find out what happened?
@z

@x
MSI installations can sometimes fail unexpectedly and not provide users with much information about what went wrong.
@y
MSI installations can sometimes fail unexpectedly and not provide users with much information about what went wrong.
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
The script would be responsible for creating the `docker-users` group and populating it with the correct user.
@y
The script would be responsible for creating the `docker-users` group and populating it with the correct user.
@z

@x
Here's an example script that creates the `docker-users` group and adds the current user to it (requirements may vary depending on environment):
@y
Here's an example script that creates the `docker-users` group and adds the current user to it (requirements may vary depending on environment):
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
# Create the group
New-LocalGroup -Name $Group
@y
# Create the group
New-LocalGroup -Name $Group
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