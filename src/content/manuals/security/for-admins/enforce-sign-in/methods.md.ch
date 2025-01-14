%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
description: Learn about the different ways you can force your developers to sign in to Docker Desktop
keywords: authentication, registry.json, configure, enforce sign-in, docker desktop, security, .plist. registry key, mac, windows
title: Ways to enforce sign-in for Docker Desktop
@y
description: Learn about the different ways you can force your developers to sign in to Docker Desktop
keywords: authentication, registry.json, configure, enforce sign-in, docker desktop, security, .plist. registry key, mac, windows
title: Ways to enforce sign-in for Docker Desktop
@z

@x
linkTitle: Methods
@y
linkTitle: Methods
@z

@x
This page outlines the different methods for enforcing sign-in for Docker Desktop.
@y
This page outlines the different methods for enforcing sign-in for Docker Desktop.
@z

@x
## Registry key method (Windows only)
@y
## Registry key method (Windows only)
@z

@x
> [!NOTE]
>
> The registry key method is available with Docker Desktop version 4.32 and later.
@y
> [!NOTE]
>
> The registry key method is available with Docker Desktop version 4.32 and later.
@z

@x
To enforce sign-in for Docker Desktop on Windows, you can configure a registry key that specifies your organization's allowed users. The following steps guide you through creating and deploying the registry key to enforce this policy:
@y
To enforce sign-in for Docker Desktop on Windows, you can configure a registry key that specifies your organization's allowed users. The following steps guide you through creating and deploying the registry key to enforce this policy:
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
   > [!IMPORTANT]
   >
   > As of Docker Desktop version 4.36 and later, you can add more than one organization. With Docker Desktop version 4.35 and earlier, if you add more than one organization sign-in enforcement silently fails.
3. Use your organization's name, all lowercase as string data.
4. Restart Docker Desktop.
5. When Docker Desktop restarts, verify that the **Sign in required!** prompt appears.
@y
   ```console
   $ HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Docker\Docker Desktop
   ```
2. Create a multi-string value `allowedOrgs`.
   > [!IMPORTANT]
   >
   > As of Docker Desktop version 4.36 and later, you can add more than one organization. With Docker Desktop version 4.35 and earlier, if you add more than one organization sign-in enforcement silently fails.
3. Use your organization's name, all lowercase as string data.
4. Restart Docker Desktop.
5. When Docker Desktop restarts, verify that the **Sign in required!** prompt appears.
@z

@x
In some cases, a system reboot may be necessary for enforcement to take effect.
@y
In some cases, a system reboot may be necessary for enforcement to take effect.
@z

@x
> [!NOTE]
>
> If a registry key and a `registry.json` file both exist, the registry key takes precedence.
@y
> [!NOTE]
>
> If a registry key and a `registry.json` file both exist, the registry key takes precedence.
@z

@x
### Example deployment via Group Policy
@y
### Example deployment via Group Policy
@z

@x
The following example outlines how to deploy a registry key to enforce sign-in on Docker Desktop using Group Policy. There are multiple ways to deploy this configuration depending on your organization's infrastructure, security policies, and management tools.
@y
The following example outlines how to deploy a registry key to enforce sign-in on Docker Desktop using Group Policy. There are multiple ways to deploy this configuration depending on your organization's infrastructure, security policies, and management tools.
@z

@x
1. Create the registry script. Write a script to create the `HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Docker\Docker Desktop` key, add the `allowedOrgs` multi-string, and then set the value to your organization’s name.
2. Within Group Policy, create or edit a Group Policy Objective (GPO) that applies to the machines or users you want to target.
3. Within the GPO, navigate to **Computer Configuration** and select **Preferences**.
4. Select **Windows Settings** then **Registry**.
5. To add the registry item, right-click on the **Registry** node, select **New**, and then **Registry Item**.
6. Configure the new registry item to match the registry script you created, specifying the action as **Update**. Make sure you input the correct path, value name (`allowedOrgs`), and value data (your organization names).
7. Link the GPO to an Organizational Unit (OU) that contains the machines you want to apply this setting to.
8. Test the GPO on a small set of machines first to ensure it behaves as expected. You can use the `gpupdate /force` command on a test machine to manually refresh its group policy settings and check the registry to confirm the changes.
9. Once verified, you can proceed with broader deployment. Monitor the deployment to ensure the settings are applied correctly across the organization's computers.
@y
1. Create the registry script. Write a script to create the `HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Docker\Docker Desktop` key, add the `allowedOrgs` multi-string, and then set the value to your organization’s name.
2. Within Group Policy, create or edit a Group Policy Objective (GPO) that applies to the machines or users you want to target.
3. Within the GPO, navigate to **Computer Configuration** and select **Preferences**.
4. Select **Windows Settings** then **Registry**.
5. To add the registry item, right-click on the **Registry** node, select **New**, and then **Registry Item**.
6. Configure the new registry item to match the registry script you created, specifying the action as **Update**. Make sure you input the correct path, value name (`allowedOrgs`), and value data (your organization names).
7. Link the GPO to an Organizational Unit (OU) that contains the machines you want to apply this setting to.
8. Test the GPO on a small set of machines first to ensure it behaves as expected. You can use the `gpupdate /force` command on a test machine to manually refresh its group policy settings and check the registry to confirm the changes.
9. Once verified, you can proceed with broader deployment. Monitor the deployment to ensure the settings are applied correctly across the organization's computers.
@z

@x
## Configuration profiles method (Mac only)
@y
## Configuration profiles method (Mac only)
@z

@x
> [!NOTE]
>
> The configuration profiles method is in [Early Access](/manuals/release-lifecycle.md)
> and is available with Docker Desktop version 4.36 and later.
@y
> [!NOTE]
>
> The configuration profiles method is in [Early Access](manuals/release-lifecycle.md)
> and is available with Docker Desktop version 4.36 and later.
@z

@x
Configuration profiles are a feature of macOS that let you distribute
configuration information to the Macs you manage. It is the safest method to
enforce sign-in on macOS because the installed configuration profiles are
protected by Apples' System Integrity Protection (SIP) and therefore can't be
tampered with by the users.
@y
Configuration profiles are a feature of macOS that let you distribute
configuration information to the Macs you manage. It is the safest method to
enforce sign-in on macOS because the installed configuration profiles are
protected by Apples' System Integrity Protection (SIP) and therefore can't be
tampered with by the users.
@z

@x
1. Save the following XML file with the extension `.mobileconfig`, for example
   `docker.mobileconfig`:
@y
1. Save the following XML file with the extension `.mobileconfig`, for example
   `docker.mobileconfig`:
@z

@x
   ```xml
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>PayloadContent</key>
        <array>
          <dict>
            <key>PayloadType</key>
            <string>com.docker.config</string>
            <key>PayloadVersion</key>
            <integer>1</integer>
            <key>PayloadIdentifier</key>
            <string>com.docker.config</string>
            <key>PayloadUUID</key>
            <string>eed295b0-a650-40b0-9dda-90efb12be3c7</string>
            <key>PayloadDisplayName</key>
            <string>Docker Desktop Configuration</string>
            <key>PayloadDescription</key>
            <string>Configuration profile to manage Docker Desktop settings.</string>
            <key>PayloadOrganization</key>
            <string>Your Company Name</string>
            <key>allowedOrgs</key>
            <string>first_org;second_org</string>
          </dict>
        </array>
        <key>PayloadType</key>
        <string>Configuration</string>
        <key>PayloadVersion</key>
        <integer>1</integer>
        <key>PayloadIdentifier</key>
        <string>com.yourcompany.docker.config</string>
        <key>PayloadUUID</key>
        <string>0deedb64-7dc9-46e5-b6bf-69d64a9561ce</string>
        <key>PayloadDisplayName</key>
        <string>Docker Desktop Config Profile</string>
        <key>PayloadDescription</key>
        <string>Config profile to enforce Docker Desktop settings for allowed organizations.</string>
        <key>PayloadOrganization</key>
        <string>Your Company Name</string>
      </dict>
    </plist>
   ```
@y
   ```xml
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>PayloadContent</key>
        <array>
          <dict>
            <key>PayloadType</key>
            <string>com.docker.config</string>
            <key>PayloadVersion</key>
            <integer>1</integer>
            <key>PayloadIdentifier</key>
            <string>com.docker.config</string>
            <key>PayloadUUID</key>
            <string>eed295b0-a650-40b0-9dda-90efb12be3c7</string>
            <key>PayloadDisplayName</key>
            <string>Docker Desktop Configuration</string>
            <key>PayloadDescription</key>
            <string>Configuration profile to manage Docker Desktop settings.</string>
            <key>PayloadOrganization</key>
            <string>Your Company Name</string>
            <key>allowedOrgs</key>
            <string>first_org;second_org</string>
          </dict>
        </array>
        <key>PayloadType</key>
        <string>Configuration</string>
        <key>PayloadVersion</key>
        <integer>1</integer>
        <key>PayloadIdentifier</key>
        <string>com.yourcompany.docker.config</string>
        <key>PayloadUUID</key>
        <string>0deedb64-7dc9-46e5-b6bf-69d64a9561ce</string>
        <key>PayloadDisplayName</key>
        <string>Docker Desktop Config Profile</string>
        <key>PayloadDescription</key>
        <string>Config profile to enforce Docker Desktop settings for allowed organizations.</string>
        <key>PayloadOrganization</key>
        <string>Your Company Name</string>
      </dict>
    </plist>
   ```
@z

@x
2. Change the placeholders `com.yourcompany.docker.config` and `Your Company Name` to the name of your company.
@y
2. Change the placeholders `com.yourcompany.docker.config` and `Your Company Name` to the name of your company.
@z

@x
3. Add your organization name. The names of the allowed organizations are stored in the `allowedOrgs`
   property. It can contain either the name of a single organization or a list of organization names,
   separated by a semicolon:
@y
3. Add your organization name. The names of the allowed organizations are stored in the `allowedOrgs`
   property. It can contain either the name of a single organization or a list of organization names,
   separated by a semicolon:
@z

@x
   ```xml
            <key>allowedOrgs</key>
            <string>first_org;second_org</string>
   ```
@y
   ```xml
            <key>allowedOrgs</key>
            <string>first_org;second_org</string>
   ```
@z

@x
4. Use a MDM solution to distribute your modified `.mobileconfig` file to your macOS clients. 
@y
4. Use a MDM solution to distribute your modified `.mobileconfig` file to your macOS clients. 
@z

@x
## plist method (Mac only)
@y
## plist method (Mac only)
@z

@x
> [!NOTE]
>
> The `plist` method is available with Docker Desktop version 4.32 and later.
@y
> [!NOTE]
>
> The `plist` method is available with Docker Desktop version 4.32 and later.
@z

@x
To enforce sign-in for Docker Desktop on macOS, you can use a `plist` file that defines the required settings. The following steps guide you through the process of creating and deploying the necessary `plist` file to enforce this policy:
@y
To enforce sign-in for Docker Desktop on macOS, you can use a `plist` file that defines the required settings. The following steps guide you through the process of creating and deploying the necessary `plist` file to enforce this policy:
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
             <string>myorg1</string>
             <string>myorg2</string>
         </array>
     </dict>
   </plist>
   ```
   > [!IMPORTANT]
   >
   > As of Docker Desktop version 4.36 and later, you can add more than one organization. With Docker Desktop version 4.35 and earlier, sign-in enforcement silently fails if you add more than one organization.
@y
   ```xml
   <?xml version="1.0" encoding="UTF-8"?>
   <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
   <plist version="1.0">
     <dict>
	     <key>allowedOrgs</key>
	     <array>
             <string>myorg1</string>
             <string>myorg2</string>
         </array>
     </dict>
   </plist>
   ```
   > [!IMPORTANT]
   >
   > As of Docker Desktop version 4.36 and later, you can add more than one organization. With Docker Desktop version 4.35 and earlier, sign-in enforcement silently fails if you add more than one organization.
@z

@x
3. Modify the file permissions to ensure the file cannot be edited by any non-administrator users.
4. Restart Docker Desktop.
5. When Docker Desktop restarts, verify that the **Sign in required!** prompt appears.
@y
3. Modify the file permissions to ensure the file cannot be edited by any non-administrator users.
4. Restart Docker Desktop.
5. When Docker Desktop restarts, verify that the **Sign in required!** prompt appears.
@z

@x
> [!NOTE]
>
> If a `plist` and `registry.json` file both exist, the `plist` file takes precedence.
@y
> [!NOTE]
>
> If a `plist` and `registry.json` file both exist, the `plist` file takes precedence.
@z

@x
### Example deployment
@y
### Example deployment
@z

@x
The following example outlines how to create and distribute the `plist` file to enforce sign-in on Docker Desktop. There are multiple ways to deploy this configuration depending on your organization's infrastructure, security policies, and management tools.
@y
The following example outlines how to create and distribute the `plist` file to enforce sign-in on Docker Desktop. There are multiple ways to deploy this configuration depending on your organization's infrastructure, security policies, and management tools.
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
    - SSH: If SSH is enabled on the target machines, you can use it to execute the script remotely. This method requires knowledge of the device's IP address and appropriate credentials.
    - Remote support tool: For organizations using a remote support tool, you can add the script to a task and execute it across all selected machines.
5. Ensure the script is running as expected on all targeted devices. You may have to check log files or implement logging within the script itself to report its success or failure.
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
    - SSH: If SSH is enabled on the target machines, you can use it to execute the script remotely. This method requires knowledge of the device's IP address and appropriate credentials.
    - Remote support tool: For organizations using a remote support tool, you can add the script to a task and execute it across all selected machines.
5. Ensure the script is running as expected on all targeted devices. You may have to check log files or implement logging within the script itself to report its success or failure.
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
The following instructions explain how to create and deploy a `registry.json` file to a single device. There are many ways to deploy the `registry.json` file. You can follow the example deployments outlined in the `.plist` file section. The method you choose is dependent on your organization's infrastructure, security policies, and the administrative rights of the end-users.
@y
The following instructions explain how to create and deploy a `registry.json` file to a single device. There are many ways to deploy the `registry.json` file. You can follow the example deployments outlined in the `.plist` file section. The method you choose is dependent on your organization's infrastructure, security policies, and the administrative rights of the end-users.
@z

@x
### Option 1: Create a registry.json file to enforce sign-in
@y
### Option 1: Create a registry.json file to enforce sign-in
@z

@x
1. Ensure the user is a member of your organization in Docker. For more
details, see [Manage members](/admin/organization/members/).
2. Create the `registry.json` file.
@y
1. Ensure the user is a member of your organization in Docker. For more
details, see [Manage members](__SUBDIR__/admin/organization/members/).
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
    "allowedOrgs": ["myorg1", "myorg2"]
    }
    ```
   > [!IMPORTANT]
   >
   > As of Docker Desktop version 4.36 and later, you can add more than one organization. With Docker Desktop version 4.35 and earlier, if you add more than one organization sign-in enforcement silently fails.
@y
    ```json
    {
    "allowedOrgs": ["myorg1", "myorg2"]
    }
    ```
   > [!IMPORTANT]
   >
   > As of Docker Desktop version 4.36 and later, you can add more than one organization. With Docker Desktop version 4.35 and earlier, if you add more than one organization sign-in enforcement silently fails.
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
    > [!TIP]
    >
    > If your users have issues starting Docker Desktop after you enforce sign-in, they may need to update to the latest version.
@y
    > [!TIP]
    >
    > If your users have issues starting Docker Desktop after you enforce sign-in, they may need to update to the latest version.
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
> [!IMPORTANT]
>
> As of Docker Desktop version 4.36 and later, you can add more than one organization to a single `registry.json` file. With Docker Desktop version 4.35 and earlier, if you add more than one organization sign-in enforcement silently fails.
@y
```console
C:\Users\Admin> "Docker Desktop Installer.exe" install --allowed-org=myorg
```
> [!IMPORTANT]
>
> As of Docker Desktop version 4.36 and later, you can add more than one organization to a single `registry.json` file. With Docker Desktop version 4.35 and earlier, if you add more than one organization sign-in enforcement silently fails.
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
> [!IMPORTANT]
>
> As of Docker Desktop version 4.36 and later, you can add more than one organization to a single `registry.json` file. With Docker Desktop version 4.35 and earlier, if you add more than one organization sign-in enforcement silently fails.
@y
> [!IMPORTANT]
>
> As of Docker Desktop version 4.36 and later, you can add more than one organization to a single `registry.json` file. With Docker Desktop version 4.35 and earlier, if you add more than one organization sign-in enforcement silently fails.
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
> [!IMPORTANT]
>
> As of Docker Desktop version 4.36 and later, you can add more than one organization to a single `registry.json` file. With Docker Desktop version 4.35 and earlier, if you add more than one organization sign-in enforcement silently fails.
@y
> [!IMPORTANT]
>
> As of Docker Desktop version 4.36 and later, you can add more than one organization to a single `registry.json` file. With Docker Desktop version 4.35 and earlier, if you add more than one organization sign-in enforcement silently fails.
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
> [!IMPORTANT]
>
> As of Docker Desktop version 4.36 and later, you can add more than one organization to a single `registry.json` file. With Docker Desktop version 4.35 and earlier, if you add more than one organization sign-in enforcement silently fails.
@y
> [!IMPORTANT]
>
> As of Docker Desktop version 4.36 and later, you can add more than one organization to a single `registry.json` file. With Docker Desktop version 4.35 and earlier, if you add more than one organization sign-in enforcement silently fails.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## More resources
@y
## More resources
@z

@x
- [Video: Enforce sign-in with a registry.json](https://www.youtube.com/watch?v=CIOQ6wDnJnM)
@y
- [Video: Enforce sign-in with a registry.json](https://www.youtube.com/watch?v=CIOQ6wDnJnM)
@z
