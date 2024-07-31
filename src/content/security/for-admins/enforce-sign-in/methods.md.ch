%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
description: Learn about the different ways you can force users to sign in to Docker Desktop
keywords: authentication, registry.json, configure, enforce sign-in, docker desktop, security 
title: Ways to enforce sign-in for Docker Desktop
@y
description: Learn about the different ways you can force users to sign in to Docker Desktop
keywords: authentication, registry.json, configure, enforce sign-in, docker desktop, security 
title: Ways to enforce sign-in for Docker Desktop
@z

@x
This page outlines the different ways you can enforce sign-in for Docker Desktop.
@y
This page outlines the different ways you can enforce sign-in for Docker Desktop.
@z

@x
## Registry key method (Windows only)
@y
## Registry key method (Windows only)
@z

@x
> **Early Access**
>
> The registry key method is an [early access](../../../release-lifecycle.md#early-access-ea) feature for Docker Business subscribers. 
> It's available with Docker Desktop version 4.32 and later.
{ .restricted }
@y
> **Early Access**
>
> The registry key method is an [early access](../../../release-lifecycle.md#early-access-ea) feature for Docker Business subscribers. 
> It's available with Docker Desktop version 4.32 and later.
{ .restricted }
@z

@x
1. Create the registry key. Your new key should look like the following:
@y
1. Create the registry key. Your new key should look like the following:
@z

@x
   ```console 
   $ HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Docker\Docker Desktop
   ```
2. Create a multi-string value `allowedOrgs`. 
   > **Important**
   >
   > Only one entry for `allowedOrgs` is currently supported. If you add more than one value, sign-in enforcement silently fails.
   { .important }
3. As string data use your organization’s name, all lowercase.
4. Restart Docker Desktop.
5. Open Docker Desktop and when Docker Desktop starts, verify that the **Sign in required!** prompt appears.
@y
   ```console 
   $ HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Docker\Docker Desktop
   ```
2. Create a multi-string value `allowedOrgs`. 
   > **Important**
   >
   > Only one entry for `allowedOrgs` is currently supported. If you add more than one value, sign-in enforcement silently fails.
   { .important }
3. As string data use your organization’s name, all lowercase.
4. Restart Docker Desktop.
5. Open Docker Desktop and when Docker Desktop starts, verify that the **Sign in required!** prompt appears.
@z

@x
In some cases, a system reboot may be necessary for enforcement to take effect.
@y
In some cases, a system reboot may be necessary for enforcement to take effect.
@z

@x
>**Note**
>
> If a registry key and a `registry.json` file both exist, the registry key takes precedence.
@y
>**Note**
>
> If a registry key and a `registry.json` file both exist, the registry key takes precedence.
@z

@x
### Example deployment via Group Policy
@y
### Example deployment via Group Policy
@z

@x
The following is only an illustrative example. 
@y
The following is only an illustrative example. 
@z

@x
There are many ways to deploy the registry key, for example using an MDM solution or with PowerShell scripting. The method you choose is dependent on your organizations infrastructure, security policies, and the administrative rights of the end-users. 
@y
There are many ways to deploy the registry key, for example using an MDM solution or with PowerShell scripting. The method you choose is dependent on your organizations infrastructure, security policies, and the administrative rights of the end-users. 
@z

@x
1. Create the registry script. Write a script to create the `HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Docker\Docker Desktop` key, add the `allowedOrgs` multi-string, and then set the value to your organization’s name.
2. Within Group Policy, create or edit a Group Policy Objective (GPO) that applies to the machines or users you want to target.
3. Within the GPO, navigate to **Computer Configuration** > **Preferences** > **Windows Settings** > **Registry**.
4. Add the registry item. Right-click on the **Registry** node, select **New** > **Registry Item**.
5. Configure the new registry item to match the registry script you created, specifying the action as **Update**. Make sure you input the correct path, value name (`allowedOrgs`), and value data (your organization’s name).
6. Link the GPO to an Organizational Unit (OU) that contains the machines you want to apply this setting to.
7. Test the GPO. Test the GPO on a small set of machines first to ensure it behaves as expected. You can use the `gpupdate /force` command on a test machine to manually refresh its group policy settings and check the registry to confirm the changes.
8. Once verified, you can proceed with broader deployment. Monitor the deployment to ensure the settings are applied correctly across the organization's computers.
@y
1. Create the registry script. Write a script to create the `HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Docker\Docker Desktop` key, add the `allowedOrgs` multi-string, and then set the value to your organization’s name.
2. Within Group Policy, create or edit a Group Policy Objective (GPO) that applies to the machines or users you want to target.
3. Within the GPO, navigate to **Computer Configuration** > **Preferences** > **Windows Settings** > **Registry**.
4. Add the registry item. Right-click on the **Registry** node, select **New** > **Registry Item**.
5. Configure the new registry item to match the registry script you created, specifying the action as **Update**. Make sure you input the correct path, value name (`allowedOrgs`), and value data (your organization’s name).
6. Link the GPO to an Organizational Unit (OU) that contains the machines you want to apply this setting to.
7. Test the GPO. Test the GPO on a small set of machines first to ensure it behaves as expected. You can use the `gpupdate /force` command on a test machine to manually refresh its group policy settings and check the registry to confirm the changes.
8. Once verified, you can proceed with broader deployment. Monitor the deployment to ensure the settings are applied correctly across the organization's computers.
@z

@x
## plist method (Mac only)
@y
## plist method (Mac only)
@z

@x
> **Early Access**
>
> The plist method is an [early access](../../../release-lifecycle.md#early-access-ea) feature for Docker Business subscribers. 
> It's available with Docker Desktop version 4.32 and later.
{ .restricted }
@y
> **Early Access**
>
> The plist method is an [early access](../../../release-lifecycle.md#early-access-ea) feature for Docker Business subscribers. 
> It's available with Docker Desktop version 4.32 and later.
{ .restricted }
@z

@x
1. Create the file `/Library/Application Support/com.docker.docker/desktop.plist`.
2. Open `desktop.plist` in a text editor and add the following content, where `myorg` is replaced with your organization’s name all lowercase:
@y
1. Create the file `/Library/Application Support/com.docker.docker/desktop.plist`.
2. Open `desktop.plist` in a text editor and add the following content, where `myorg` is replaced with your organization’s name all lowercase:
@z

@x
   ```xml
   <?xml version="1.0" encoding="UTF-8"?>
   <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
   <plist version="1.0">
     <dict>
	     <key>allowedOrgs</key>
	     <array>
             <string>myorg</string>
         </array>
     </dict>
   </plist>
   ```
   > **Important**
   >
   > Only one entry for `allowedOrgs` is currently supported. If you add more than one value, sign-in enforcement silently fails.
   { .important }
@y
   ```xml
   <?xml version="1.0" encoding="UTF-8"?>
   <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
   <plist version="1.0">
     <dict>
	     <key>allowedOrgs</key>
	     <array>
             <string>myorg</string>
         </array>
     </dict>
   </plist>
   ```
   > **Important**
   >
   > Only one entry for `allowedOrgs` is currently supported. If you add more than one value, sign-in enforcement silently fails.
   { .important }
@z

@x
3. Modify the file permissions to ensure the file cannot be edited by any non-administrator users.
4. Restart Docker Desktop. 
5. Open Docker Desktop and when Docker Desktop starts, verify that the **Sign in required!** prompt appears.
@y
3. Modify the file permissions to ensure the file cannot be edited by any non-administrator users.
4. Restart Docker Desktop. 
5. Open Docker Desktop and when Docker Desktop starts, verify that the **Sign in required!** prompt appears.
@z

@x
>**Note**
>
> If a `plist` and `registry.json` file both exist, the `plist` file takes precedence.
@y
>**Note**
>
> If a `plist` and `registry.json` file both exist, the `plist` file takes precedence.
@z

@x
### Example deployment 
@y
### Example deployment 
@z

@x
The following is only an illustrative example. 
@y
The following is only an illustrative example. 
@z

@x
There are many ways to deploy the `.plist` file. The method you choose is dependent on your organizations infrastructure, security policies, and the administrative rights of the end-users. 
@y
There are many ways to deploy the `.plist` file. The method you choose is dependent on your organizations infrastructure, security policies, and the administrative rights of the end-users. 
@z

@x
{{< tabs >}}
{{< tab name="MDM" >}}
@y
{{< tabs >}}
{{< tab name="MDM" >}}
@z

@x
1. Follow the steps previously outlined to create the `desktop.plist` file.
2. Use an MDM tool like Jamf or Fleet to distribute the `desktop.plist` file to `/Library/Application Support/com.docker.docker/` on target macOS devices.
3. Through the MDM tool, set the file permissions to permit editing by administrators only.
@y
1. Follow the steps previously outlined to create the `desktop.plist` file.
2. Use an MDM tool like Jamf or Fleet to distribute the `desktop.plist` file to `/Library/Application Support/com.docker.docker/` on target macOS devices.
3. Through the MDM tool, set the file permissions to permit editing by administrators only.
@z

@x
{{< /tab >}}
{{< tab name="Shell script" >}}
@y
{{< /tab >}}
{{< tab name="Shell script" >}}
@z

@x
1. Create a Bash script that can check for the existence of the `.plist` file in the correct directory, create or modify it as needed, and set the appropriate permissions.
   Include commands in your script to:
    - Navigate to the `/Library/Application Support/com.docker.docker/` directory or create it if it doesn't exist.
    - Use the `defaults` command to write the required keys and values to the `desktop.plist` file. For example:
       ```console
       $ defaults write /Library/Application\ Support/com.docker.docker/desktop.plist allowedOrgs -string "myorg"
       ```
    - Change permissions of the `plist` file to restrict editing, using `chmod` and possibly `chown` to set the owner to root or another administrator account, ensuring it can't be easily modified by unauthorized users.
2. Before deploying the script across the organization, test it on a local macOS machine to ensure it behaves as expected. Pay attention to directory paths, permissions, and the successful application of `plist` settings.
3. Ensure that you have the capability to execute scripts remotely on macOS devices. This might involve setting up SSH access or using a remote support tool that supports macOS.
4.  Use a method of remote script execution that fits your organization's infrastructure. Options include:
    - SSH. If SSH is enabled on the target machines, you can use it to execute the script remotely. This method requires knowledge of the device's IP address and appropriate credentials.
    - Remote support tool. For organizations using a remote support tool, you can add the script to a task and execute it across all selected machines.
5. Ensure the script is running as expected on all targeted devices. This might involve checking log files or implementing logging within the script itself to report its success or failure.
@y
1. Create a Bash script that can check for the existence of the `.plist` file in the correct directory, create or modify it as needed, and set the appropriate permissions.
   Include commands in your script to:
    - Navigate to the `/Library/Application Support/com.docker.docker/` directory or create it if it doesn't exist.
    - Use the `defaults` command to write the required keys and values to the `desktop.plist` file. For example:
       ```console
       $ defaults write /Library/Application\ Support/com.docker.docker/desktop.plist allowedOrgs -string "myorg"
       ```
    - Change permissions of the `plist` file to restrict editing, using `chmod` and possibly `chown` to set the owner to root or another administrator account, ensuring it can't be easily modified by unauthorized users.
2. Before deploying the script across the organization, test it on a local macOS machine to ensure it behaves as expected. Pay attention to directory paths, permissions, and the successful application of `plist` settings.
3. Ensure that you have the capability to execute scripts remotely on macOS devices. This might involve setting up SSH access or using a remote support tool that supports macOS.
4.  Use a method of remote script execution that fits your organization's infrastructure. Options include:
    - SSH. If SSH is enabled on the target machines, you can use it to execute the script remotely. This method requires knowledge of the device's IP address and appropriate credentials.
    - Remote support tool. For organizations using a remote support tool, you can add the script to a task and execute it across all selected machines.
5. Ensure the script is running as expected on all targeted devices. This might involve checking log files or implementing logging within the script itself to report its success or failure.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## registry.json method (All)
@y
## registry.json method (All)
@z

@x
The following instructions explain how to create and deploy a `registry.json` file to a single device. There are many ways to deploy the `regitry.json` file. You can follow the example deployments outlined in the `.plist` file section.  The method you choose is dependent on your organization's infrastructure, security policies, and the administrative rights of the end-users.
@y
The following instructions explain how to create and deploy a `registry.json` file to a single device. There are many ways to deploy the `regitry.json` file. You can follow the example deployments outlined in the `.plist` file section.  The method you choose is dependent on your organization's infrastructure, security policies, and the administrative rights of the end-users.
@z

@x
### Option 1: Create a registry.json file to enforce sign-in
@y
### Option 1: Create a registry.json file to enforce sign-in
@z

@x
1. Ensure that the user is a member of your organization in Docker. For more
details, see [Manage members](/admin/organization/members/).
@y
1. Ensure that the user is a member of your organization in Docker. For more
details, see [Manage members](__SUBDIR__/admin/organization/members/).
@z

@x
2. Create the `registry.json` file.
@y
2. Create the `registry.json` file.
@z

@x
    Based on the user's operating system, create a file named `registry.json` at the following location and make sure the file can't be edited by the user.
@y
    Based on the user's operating system, create a file named `registry.json` at the following location and make sure the file can't be edited by the user.
@z

@x
    | Platform | Location |
    | --- | --- |
    | Windows | `/ProgramData/DockerDesktop/registry.json` |
    | Mac | `/Library/Application Support/com.docker.docker/registry.json` |
    | Linux | `/usr/share/docker-desktop/registry/registry.json` |
@y
    | Platform | Location |
    | --- | --- |
    | Windows | `/ProgramData/DockerDesktop/registry.json` |
    | Mac | `/Library/Application Support/com.docker.docker/registry.json` |
    | Linux | `/usr/share/docker-desktop/registry/registry.json` |
@z

@x
3. Specify your organization in the `registry.json` file.
@y
3. Specify your organization in the `registry.json` file.
@z

@x
    Open the `registry.json` file in a text editor and add the following contents, where `myorg` is replaced with your organization’s name. The file contents are case-sensitive and you must use lowercase letters for your organization's name.
@y
    Open the `registry.json` file in a text editor and add the following contents, where `myorg` is replaced with your organization’s name. The file contents are case-sensitive and you must use lowercase letters for your organization's name.
@z

@x
    ```json
    {
    "allowedOrgs": ["myorg"]
    }
    ```
   > **Important**
   >
   > Only one entry for `allowedOrgs` is currently supported. If you add more than one value, sign-in enforcement silently fails.
   { .important }
@y
    ```json
    {
    "allowedOrgs": ["myorg"]
    }
    ```
   > **Important**
   >
   > Only one entry for `allowedOrgs` is currently supported. If you add more than one value, sign-in enforcement silently fails.
   { .important }
@z

@x
4. Verify that sign-in is enforced.
@y
4. Verify that sign-in is enforced.
@z

@x
    To activate the `registry.json` file, restart Docker Desktop on the user’s machine. When Docker Desktop starts, verify that the **Sign in
    required!** prompt appears. 
@y
    To activate the `registry.json` file, restart Docker Desktop on the user’s machine. When Docker Desktop starts, verify that the **Sign in
    required!** prompt appears. 
@z

@x
    In some cases, a system reboot may be necessary for the enforcement to take effect.
@y
    In some cases, a system reboot may be necessary for the enforcement to take effect.
@z

@x
    > **Tip**
    >
    > If your users have issues starting Docker Desktop after you enforce sign-in, they may need to update to the latest version.
    { .tip }
@y
    > **Tip**
    >
    > If your users have issues starting Docker Desktop after you enforce sign-in, they may need to update to the latest version.
    { .tip }
@z

@x
### Option 2: Create a registry.json file when installing Docker Desktop
@y
### Option 2: Create a registry.json file when installing Docker Desktop
@z

@x
To create a `registry.json` file when installing Docker Desktop, use the following instructions based on your user's operating system.
@y
To create a `registry.json` file when installing Docker Desktop, use the following instructions based on your user's operating system.
@z

@x
{{< tabs >}}
{{< tab name="Windows" >}}
@y
{{< tabs >}}
{{< tab name="Windows" >}}
@z

@x
To automatically create a `registry.json` file when installing Docker Desktop,
download `Docker Desktop Installer.exe` and run one of the following commands
from the directory containing `Docker Desktop Installer.exe`. Replace `myorg`
with your organization's name. You must use lowercase letters for your
organization's name.
@y
To automatically create a `registry.json` file when installing Docker Desktop,
download `Docker Desktop Installer.exe` and run one of the following commands
from the directory containing `Docker Desktop Installer.exe`. Replace `myorg`
with your organization's name. You must use lowercase letters for your
organization's name.
@z

@x
If you're using PowerShell:
@y
If you're using PowerShell:
@z

@x
```powershell
PS> Start-Process '.\Docker Desktop Installer.exe' -Wait 'install --allowed-org=myorg'
```
@y
```powershell
PS> Start-Process '.\Docker Desktop Installer.exe' -Wait 'install --allowed-org=myorg'
```
@z

@x
If you're using the Windows Command Prompt:
@y
If you're using the Windows Command Prompt:
@z

@x
```console
C:\Users\Admin> "Docker Desktop Installer.exe" install --allowed-org=myorg
```
@y
```console
C:\Users\Admin> "Docker Desktop Installer.exe" install --allowed-org=myorg
```
@z

@x
{{< /tab >}}
{{< tab name="Mac" >}}
@y
{{< /tab >}}
{{< tab name="Mac" >}}
@z

@x
To automatically create a `registry.json` file when installing Docker Desktop,
download `Docker.dmg` and run the following commands in a terminal from the
directory containing `Docker.dmg`. Replace `myorg` with your organization's name. You must use lowercase letters for your organization's name.
@y
To automatically create a `registry.json` file when installing Docker Desktop,
download `Docker.dmg` and run the following commands in a terminal from the
directory containing `Docker.dmg`. Replace `myorg` with your organization's name. You must use lowercase letters for your organization's name.
@z

@x
```console
$ sudo hdiutil attach Docker.dmg
$ sudo /Volumes/Docker/Docker.app/Contents/MacOS/install --allowed-org=myorg
$ sudo hdiutil detach /Volumes/Docker
```
@y
```console
$ sudo hdiutil attach Docker.dmg
$ sudo /Volumes/Docker/Docker.app/Contents/MacOS/install --allowed-org=myorg
$ sudo hdiutil detach /Volumes/Docker
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Option 3: Create a registry.json file using the command line
@y
### Option 3: Create a registry.json file using the command line
@z

@x
To create a `registry.json` using the command line, use the following instructions based on your user's operating system.
@y
To create a `registry.json` using the command line, use the following instructions based on your user's operating system.
@z

@x
{{< tabs >}}
{{< tab name="Windows" >}}
@y
{{< tabs >}}
{{< tab name="Windows" >}}
@z

@x
To use the CLI to create a `registry.json` file, run the following PowerShell
command as an administrator and replace `myorg` with your organization's name. The file
contents are case-sensitive and you must use lowercase letters for your
organization's name.
@y
To use the CLI to create a `registry.json` file, run the following PowerShell
command as an administrator and replace `myorg` with your organization's name. The file
contents are case-sensitive and you must use lowercase letters for your
organization's name.
@z

@x
```powershell
PS>  Set-Content /ProgramData/DockerDesktop/registry.json '{"allowedOrgs":["myorg"]}'
```
@y
```powershell
PS>  Set-Content /ProgramData/DockerDesktop/registry.json '{"allowedOrgs":["myorg"]}'
```
@z

@x
This creates the `registry.json` file at
`C:\ProgramData\DockerDesktop\registry.json` and includes the organization
information the user belongs to. Make sure that the user can't edit this file, but only the administrator can:
@y
This creates the `registry.json` file at
`C:\ProgramData\DockerDesktop\registry.json` and includes the organization
information the user belongs to. Make sure that the user can't edit this file, but only the administrator can:
@z

@x
```console
PS C:\ProgramData\DockerDesktop> Get-Acl .\registry.json
@y
```console
PS C:\ProgramData\DockerDesktop> Get-Acl .\registry.json
@z

@x
    Directory: C:\ProgramData\DockerDesktop
@y
    Directory: C:\ProgramData\DockerDesktop
@z

@x
Path          Owner                  Access
----          -----                  ------
registry.json BUILTIN\Administrators NT AUTHORITY\SYSTEM Allow  FullControl...
```
@y
Path          Owner                  Access
----          -----                  ------
registry.json BUILTIN\Administrators NT AUTHORITY\SYSTEM Allow  FullControl...
```
@z

@x
{{< /tab >}}
{{< tab name="Mac" >}}
@y
{{< /tab >}}
{{< tab name="Mac" >}}
@z

@x
To use the CLI to create a `registry.json` file, run the following commands in a
terminal and replace `myorg` with your organization's name. The file contents
are case-sensitive and you must use lowercase letters for your organization's
name.
@y
To use the CLI to create a `registry.json` file, run the following commands in a
terminal and replace `myorg` with your organization's name. The file contents
are case-sensitive and you must use lowercase letters for your organization's
name.
@z

@x
```console
$ sudo mkdir -p "/Library/Application Support/com.docker.docker"
$ echo '{"allowedOrgs":["myorg"]}' | sudo tee "/Library/Application Support/com.docker.docker/registry.json"
```
@y
```console
$ sudo mkdir -p "/Library/Application Support/com.docker.docker"
$ echo '{"allowedOrgs":["myorg"]}' | sudo tee "/Library/Application Support/com.docker.docker/registry.json"
```
@z

@x
This creates (or updates, if the file already exists) the `registry.json` file
at `/Library/Application Support/com.docker.docker/registry.json` and includes
the organization information the user belongs to. Make sure that the file has the
expected content, and that the user can't edit this file, but only the administrator can.
@y
This creates (or updates, if the file already exists) the `registry.json` file
at `/Library/Application Support/com.docker.docker/registry.json` and includes
the organization information the user belongs to. Make sure that the file has the
expected content, and that the user can't edit this file, but only the administrator can.
@z

@x
Verify that the content of the file contains the correct information:
@y
Verify that the content of the file contains the correct information:
@z

@x
```console
$ sudo cat "/Library/Application Support/com.docker.docker/registry.json"
{"allowedOrgs":["myorg"]}
```
@y
```console
$ sudo cat "/Library/Application Support/com.docker.docker/registry.json"
{"allowedOrgs":["myorg"]}
```
@z

@x
Verify that the file has the expected permissions (`-rw-r--r--`) and ownership
(`root` and `admin`):
@y
Verify that the file has the expected permissions (`-rw-r--r--`) and ownership
(`root` and `admin`):
@z

@x
```console
$ sudo ls -l "/Library/Application Support/com.docker.docker/registry.json"
-rw-r--r--  1 root  admin  26 Jul 27 22:01 /Library/Application Support/com.docker.docker/registry.json
```
@y
```console
$ sudo ls -l "/Library/Application Support/com.docker.docker/registry.json"
-rw-r--r--  1 root  admin  26 Jul 27 22:01 /Library/Application Support/com.docker.docker/registry.json
```
@z

@x
{{< /tab >}}
{{< tab name="Linux" >}}
@y
{{< /tab >}}
{{< tab name="Linux" >}}
@z

@x
To use the CLI to create a `registry.json` file, run the following commands in a
terminal and replace `myorg` with your organization's name. The file contents
are case-sensitive and you must use lowercase letters for your organization's
name.
@y
To use the CLI to create a `registry.json` file, run the following commands in a
terminal and replace `myorg` with your organization's name. The file contents
are case-sensitive and you must use lowercase letters for your organization's
name.
@z

@x
```console
$ sudo mkdir -p /usr/share/docker-desktop/registry
$ echo '{"allowedOrgs":["myorg"]}' | sudo tee /usr/share/docker-desktop/registry/registry.json
```
@y
```console
$ sudo mkdir -p /usr/share/docker-desktop/registry
$ echo '{"allowedOrgs":["myorg"]}' | sudo tee /usr/share/docker-desktop/registry/registry.json
```
@z

@x
This creates (or updates, if the file already exists) the `registry.json` file
at `/usr/share/docker-desktop/registry/registry.json` and includes the
organization information to which the user belongs. Make sure the file has the
expected content and that the user can't edit this file, only the root can.
@y
This creates (or updates, if the file already exists) the `registry.json` file
at `/usr/share/docker-desktop/registry/registry.json` and includes the
organization information to which the user belongs. Make sure the file has the
expected content and that the user can't edit this file, only the root can.
@z

@x
Verify that the content of the file contains the correct information:
@y
Verify that the content of the file contains the correct information:
@z

@x
```console
$ sudo cat /usr/share/docker-desktop/registry/registry.json
{"allowedOrgs":["myorg"]}
```
@y
```console
$ sudo cat /usr/share/docker-desktop/registry/registry.json
{"allowedOrgs":["myorg"]}
```
@z

@x
Verify that the file has the expected permissions (`-rw-r--r--`) and ownership
(`root`):
@y
Verify that the file has the expected permissions (`-rw-r--r--`) and ownership
(`root`):
@z

@x
```console
$ sudo ls -l /usr/share/docker-desktop/registry/registry.json
-rw-r--r--  1 root  root  26 Jul 27 22:01 /usr/share/docker-desktop/registry/registry.json
```
@y
```console
$ sudo ls -l /usr/share/docker-desktop/registry/registry.json
-rw-r--r--  1 root  root  26 Jul 27 22:01 /usr/share/docker-desktop/registry/registry.json
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z
