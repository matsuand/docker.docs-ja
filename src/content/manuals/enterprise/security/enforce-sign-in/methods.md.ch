%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Configure sign-in enforcement
linkTitle: Configure
description: Configure sign-in enforcement for Docker Desktop using registry keys, configuration profiles, plist files, or registry.json files
keywords: authentication, registry.json, configure, enforce sign-in, docker desktop, security, .plist, registry key, mac, windows, linux
@y
title: Configure sign-in enforcement
linkTitle: Configure
description: Configure sign-in enforcement for Docker Desktop using registry keys, configuration profiles, plist files, or registry.json files
keywords: authentication, registry.json, configure, enforce sign-in, docker desktop, security, .plist, registry key, mac, windows, linux
@z

@x
{{< summary-bar feature_name="Enforce sign-in" >}}
@y
{{< summary-bar feature_name="Enforce sign-in" >}}
@z

@x
You can enforce sign-in for Docker Desktop using several methods. Choose the method that best fits your organization's infrastructure and security requirements.
@y
You can enforce sign-in for Docker Desktop using several methods. Choose the method that best fits your organization's infrastructure and security requirements.
@z

@x
## Choose your method
@y
## Choose your method
@z

@x
| Method | Platform |
|:-------|:---------|
| Registry key | Windows only |
| Configuration profiles | macOS only |
| `plist` file | macOS only |
| `registry.json` | All platforms |
@y
| Method | Platform |
|:-------|:---------|
| Registry key | Windows only |
| Configuration profiles | macOS only |
| `plist` file | macOS only |
| `registry.json` | All platforms |
@z

@x
> [!TIP]
>
> For macOS, configuration profiles offer the highest security because they're
protected by Apple's System Integrity Protection (SIP).
@y
> [!TIP]
>
> For macOS, configuration profiles offer the highest security because they're
protected by Apple's System Integrity Protection (SIP).
@z

@x
## Windows: Registry key method
@y
## Windows: Registry key method
@z

@x
{{< tabs >}}
{{< tab name="Manual setup" >}}
@y
{{< tabs >}}
{{< tab name="Manual setup" >}}
@z

@x
To configure the registry key method manually:
@y
To configure the registry key method manually:
@z

@x
1. Create the registry key:
@y
1. Create the registry key:
@z

@x
   ```console
   $ HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Docker\Docker Desktop
   ```
1. Create a multi-string value name `allowedOrgs`.
1. Use your organization names as string data:
   - Use lowercase letters only
   - Add each organization on a separate line
   - Do not use spaces or commas as separators
1. Restart Docker Desktop.
1. Verify the `Sign in required!` prompt appears in Docker Desktop.
@y
   ```console
   $ HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Docker\Docker Desktop
   ```
1. Create a multi-string value name `allowedOrgs`.
1. Use your organization names as string data:
   - Use lowercase letters only
   - Add each organization on a separate line
   - Do not use spaces or commas as separators
1. Restart Docker Desktop.
1. Verify the `Sign in required!` prompt appears in Docker Desktop.
@z

@x
> [!IMPORTANT]
>
> You can add multiple organizations with Docker Desktop version 4.36 and later.
With version 4.35 and earlier, adding multiple organizations causes sign-in
enforcement to fail silently.
@y
> [!IMPORTANT]
>
> You can add multiple organizations with Docker Desktop version 4.36 and later.
With version 4.35 and earlier, adding multiple organizations causes sign-in
enforcement to fail silently.
@z

@x
{{< /tab >}}
{{< tab name="Group Policy deployment" >}}
@y
{{< /tab >}}
{{< tab name="Group Policy deployment" >}}
@z

@x
Deploy the registry key across your organization using Group Policy:
@y
Deploy the registry key across your organization using Group Policy:
@z

@x
1. Create a registry script with the required key structure.
1. In Group Policy Management, create or edit a GPO.
1. Navigate to **Computer Configuration** > **Preferences** > **Windows Settings** > **Registry**.
1. Right-click **Registry** > **New** > **Registry Item**.
1. Configure the registry item:
   - Action: **Update**
   - Path: `HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Docker\Docker Desktop`
   - Value name: `allowedOrgs`
   - Value data: Your organization names
1. Link the GPO to the target Organizational Unit.
1. Test on a small group using `gpupdate/force`.
1. Deploy organization-wide after verification.
@y
1. Create a registry script with the required key structure.
1. In Group Policy Management, create or edit a GPO.
1. Navigate to **Computer Configuration** > **Preferences** > **Windows Settings** > **Registry**.
1. Right-click **Registry** > **New** > **Registry Item**.
1. Configure the registry item:
   - Action: **Update**
   - Path: `HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Docker\Docker Desktop`
   - Value name: `allowedOrgs`
   - Value data: Your organization names
1. Link the GPO to the target Organizational Unit.
1. Test on a small group using `gpupdate/force`.
1. Deploy organization-wide after verification.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## macOS: Configuration profiles method (recommended)
@y
## macOS: Configuration profiles method (recommended)
@z

@x
{{< summary-bar feature_name="Config profiles" >}}
@y
{{< summary-bar feature_name="Config profiles" >}}
@z

@x
Configuration profiles provide the most secure enforcement method for macOS because they're protected by Apple's System Integrity Protection.
@y
Configuration profiles provide the most secure enforcement method for macOS because they're protected by Apple's System Integrity Protection.
@z

@x
1. Create a file named `docker.mobileconfig` with this content:
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
1. Replace placeholders:
   - Change `com.yourcompany.docker.config` to your company identifier
   - Replace `Your Company Name` with your organization name
   - Update the `allowedOrgs` value with your organization names (separated by semicolons)
1. Deploy the profile using your MDM solution.
1. Verify the profile appears in **System Settings** > **General** > **Device Management** under **Device (Managed)** profiles.
@y
1. Create a file named `docker.mobileconfig` with this content:
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
1. Replace placeholders:
   - Change `com.yourcompany.docker.config` to your company identifier
   - Replace `Your Company Name` with your organization name
   - Update the `allowedOrgs` value with your organization names (separated by semicolons)
1. Deploy the profile using your MDM solution.
1. Verify the profile appears in **System Settings** > **General** > **Device Management** under **Device (Managed)** profiles.
@z

@x
## macOS: plist file method
@y
## macOS: plist file method
@z

@x
Use this alternative method for macOS with Docker Desktop version 4.32 and later.
@y
Use this alternative method for macOS with Docker Desktop version 4.32 and later.
@z

@x
{{< tabs >}}
{{< tab name="Manual creation" >}}
@y
{{< tabs >}}
{{< tab name="Manual creation" >}}
@z

@x
1. Create the file `/Library/Application Support/com.docker.docker/desktop.plist`.
1. Add this content, replacing `myorg1` and `myorg2` with your organization names:
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
1. Set file permissions to prevent editing by non-administrator users.
1. Restart Docker Desktop.
1. Verify the `Sign in required!` prompt appears in Docker Desktop.
@y
1. Create the file `/Library/Application Support/com.docker.docker/desktop.plist`.
1. Add this content, replacing `myorg1` and `myorg2` with your organization names:
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
1. Set file permissions to prevent editing by non-administrator users.
1. Restart Docker Desktop.
1. Verify the `Sign in required!` prompt appears in Docker Desktop.
@z

@x
{{< /tab >}}
{{< tab name="Shell script deployment" >}}
@y
{{< /tab >}}
{{< tab name="Shell script deployment" >}}
@z

@x
Create and deploy a script for organization-wide distribution:
@y
Create and deploy a script for organization-wide distribution:
@z

@x
```bash
#!/bin/bash
@y
```bash
#!/bin/bash
@z

@x
# Create directory if it doesn't exist
sudo mkdir -p "/Library/Application Support/com.docker.docker"
@y
# Create directory if it doesn't exist
sudo mkdir -p "/Library/Application Support/com.docker.docker"
@z

@x
# Write the plist file
sudo defaults write "/Library/Application Support/com.docker.docker/desktop.plist" allowedOrgs -array "myorg1" "myorg2"
@y
# Write the plist file
sudo defaults write "/Library/Application Support/com.docker.docker/desktop.plist" allowedOrgs -array "myorg1" "myorg2"
@z

@x
# Set appropriate permissions
sudo chmod 644 "/Library/Application Support/com.docker.docker/desktop.plist"
sudo chown root:admin "/Library/Application Support/com.docker.docker/desktop.plist"
```
@y
# Set appropriate permissions
sudo chmod 644 "/Library/Application Support/com.docker.docker/desktop.plist"
sudo chown root:admin "/Library/Application Support/com.docker.docker/desktop.plist"
```
@z

@x
Deploy this script using SSH, remote support tools, or your preferred deployment method.
@y
Deploy this script using SSH, remote support tools, or your preferred deployment method.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## All platforms: registry.json method
@y
## All platforms: registry.json method
@z

@x
The registry.json method works across all platforms and offers flexible deployment options.
@y
The registry.json method works across all platforms and offers flexible deployment options.
@z

@x
### File locations
@y
### File locations
@z

@x
Create the `registry.json` file at the appropriate location:
@y
Create the `registry.json` file at the appropriate location:
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
### Basic setup
@y
### Basic setup
@z

@x
{{< tabs >}}
{{< tab name="Manual creation" >}}
@y
{{< tabs >}}
{{< tab name="Manual creation" >}}
@z

@x
1. Ensure users are members of your Docker organization.
1. Create the `registry.json` file at the appropriate location for your platform.
1. Add this content, replacing organization names with your own:
      ```json
      {
         "allowedOrgs": ["myorg1", "myorg2"]
      }
      ```
1. Set file permissions to prevent user editing.
1. Restart Docker Desktop.
1. Verify the `Sign in required!` prompt appears in Docker Desktop.
@y
1. Ensure users are members of your Docker organization.
1. Create the `registry.json` file at the appropriate location for your platform.
1. Add this content, replacing organization names with your own:
      ```json
      {
         "allowedOrgs": ["myorg1", "myorg2"]
      }
      ```
1. Set file permissions to prevent user editing.
1. Restart Docker Desktop.
1. Verify the `Sign in required!` prompt appears in Docker Desktop.
@z

@x
> [!TIP]
>
> If users have issues starting Docker Desktop after enforcing sign-in,
they may need to update to the latest version.
@y
> [!TIP]
>
> If users have issues starting Docker Desktop after enforcing sign-in,
they may need to update to the latest version.
@z

@x
{{< /tab >}}
{{< tab name="Command line setup" >}}
@y
{{< /tab >}}
{{< tab name="Command line setup" >}}
@z

@x
#### Windows (PowerShell as Administrator)
@y
#### Windows (PowerShell as Administrator)
@z

@x
```shell
Set-Content /ProgramData/DockerDesktop/registry.json '{"allowedOrgs":["myorg1","myorg2"]}'
```
@y
```shell
Set-Content /ProgramData/DockerDesktop/registry.json '{"allowedOrgs":["myorg1","myorg2"]}'
```
@z

@x
#### macOS
@y
#### macOS
@z

@x
```console
sudo mkdir -p "/Library/Application Support/com.docker.docker"
echo '{"allowedOrgs":["myorg1","myorg2"]}' | sudo tee "/Library/Application Support/com.docker.docker/registry.json"
```
@y
```console
sudo mkdir -p "/Library/Application Support/com.docker.docker"
echo '{"allowedOrgs":["myorg1","myorg2"]}' | sudo tee "/Library/Application Support/com.docker.docker/registry.json"
```
@z

@x
#### Linux
@y
#### Linux
@z

@x
```console
sudo mkdir -p /usr/share/docker-desktop/registry
echo '{"allowedOrgs":["myorg1","myorg2"]}' | sudo tee /usr/share/docker-desktop/registry/registry.json
```
@y
```console
sudo mkdir -p /usr/share/docker-desktop/registry
echo '{"allowedOrgs":["myorg1","myorg2"]}' | sudo tee /usr/share/docker-desktop/registry/registry.json
```
@z

@x
{{< /tab >}}
{{< tab name="Installation-time setup" >}}
@y
{{< /tab >}}
{{< tab name="Installation-time setup" >}}
@z

@x
Create the registry.json file during Docker Desktop installation:
@y
Create the registry.json file during Docker Desktop installation:
@z

@x
#### Windows
@y
#### Windows
@z

@x
```shell
# PowerShell
Start-Process '.\Docker Desktop Installer.exe' -Wait 'install --allowed-org=myorg'
@y
```shell
# PowerShell
Start-Process '.\Docker Desktop Installer.exe' -Wait 'install --allowed-org=myorg'
@z

@x
# Command Prompt
"Docker Desktop Installer.exe" install --allowed-org=myorg
```
@y
# Command Prompt
"Docker Desktop Installer.exe" install --allowed-org=myorg
```
@z

@x
#### macOS
@y
#### macOS
@z

@x
```console
sudo hdiutil attach Docker.dmg
sudo /Volumes/Docker/Docker.app/Contents/MacOS/install --allowed-org=myorg
sudo hdiutil detach /Volumes/Docker
```
@y
```console
sudo hdiutil attach Docker.dmg
sudo /Volumes/Docker/Docker.app/Contents/MacOS/install --allowed-org=myorg
sudo hdiutil detach /Volumes/Docker
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
## Method precedence
@y
## Method precedence
@z

@x
When multiple configuration methods exist on the same system, Docker Desktop uses this precedence order:
@y
When multiple configuration methods exist on the same system, Docker Desktop uses this precedence order:
@z

@x
1. Registry key (Windows only)
2. Configuration profiles (macOS only)
3. plist file (macOS only)
4. registry.json file
@y
1. Registry key (Windows only)
2. Configuration profiles (macOS only)
3. plist file (macOS only)
4. registry.json file
@z

@x
> [!IMPORTANT]
>
> Docker Desktop version 4.36 and later supports multiple organizations in a single configuration. Earlier versions (4.35 and below) fail silently when multiple organizations are specified.
@y
> [!IMPORTANT]
>
> Docker Desktop version 4.36 and later supports multiple organizations in a single configuration. Earlier versions (4.35 and below) fail silently when multiple organizations are specified.
@z

@x
## Troubleshoot sign-in enforcement
@y
## Troubleshoot sign-in enforcement
@z

@x
If sign-in enforcement doesn't work:
@y
If sign-in enforcement doesn't work:
@z

@x
- Verify file locations and permissions
- Check that organization names use lowercase letters
- Restart Docker Desktop or reboot the system
- Confirm users are members of the specified organizations
- Update Docker Desktop to the latest version
@y
- Verify file locations and permissions
- Check that organization names use lowercase letters
- Restart Docker Desktop or reboot the system
- Confirm users are members of the specified organizations
- Update Docker Desktop to the latest version
@z
