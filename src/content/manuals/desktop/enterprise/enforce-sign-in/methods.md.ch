%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

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
| Configuration profiles | Mac only |
| `plist` file | Mac only |
| `registry.json` | All platforms |
@y
| Method | Platform |
|:-------|:---------|
| Registry key | Windows only |
| Configuration profiles | Mac only |
| `plist` file | Mac only |
| `registry.json` | All platforms |
@z

@x
> [!TIP]
>
> For Mac, configuration profiles offer the highest security because they're
protected by Apple's System Integrity Protection (SIP).
@y
> [!TIP]
>
> For Mac, configuration profiles offer the highest security because they're
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

% snip code...

@x
1. Create a multi-string value name `allowedOrgs`.
1. Use your organization names as string data. You can add multiple organizations:
   - Use lowercase letters only
   - Add each organization on a separate line
   - Do not use spaces or commas as separators
1. Restart Docker Desktop.
1. Verify the **Sign in required!** prompt appears in Docker Desktop.
@y
1. Create a multi-string value name `allowedOrgs`.
1. Use your organization names as string data. You can add multiple organizations:
   - Use lowercase letters only
   - Add each organization on a separate line
   - Do not use spaces or commas as separators
1. Restart Docker Desktop.
1. Verify the **Sign in required!** prompt appears in Docker Desktop.
@z

@x
You can also create this key at install time with the MSI installer's
`ALLOWEDORG` property, which accepts multiple organizations separated by
semicolons:
@y
You can also create this key at install time with the MSI installer's
`ALLOWEDORG` property, which accepts multiple organizations separated by
semicolons:
@z

% snip command...

@x
For more information, see [MSI installer](/manuals/desktop/enterprise/enterprise-deployment/msi-install-and-configure.md#configuration-options).
@y
For more information, see [MSI installer](manuals/desktop/enterprise/enterprise-deployment/msi-install-and-configure.md#configuration-options).
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
1. Create a registry script with the following structure:
   - Path: `HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Docker\Docker Desktop`
   - Value name: `allowedOrgs` (multi-string)
   - Value data: Your organization names, one per line, in lowercase only
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
1. Create a registry script with the following structure:
   - Path: `HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Docker\Docker Desktop`
   - Value name: `allowedOrgs` (multi-string)
   - Value data: Your organization names, one per line, in lowercase only
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
## Mac: Configuration profiles method (recommended)
@y
## Mac: Configuration profiles method (recommended)
@z

@x
Configuration profiles provide the most secure enforcement method for Mac, as they're protected by Apple's System Integrity Protection.
@y
Configuration profiles provide the most secure enforcement method for Mac, as they're protected by Apple's System Integrity Protection.
@z

@x
The payload is a dictionary of key-values. Docker Desktop supports the following keys:
@y
The payload is a dictionary of key-values. Docker Desktop supports the following keys:
@z

@x
- `allowedOrgs`: Sets a list of organizations in one single string, where each organization is in lowercase only and is separated by a semi-colon. 
- `overrideProxyHTTP`: Sets the URL of the HTTP proxy that must be used for outgoing HTTP requests.
- `overrideProxyHTTPS`: Sets the URL of the HTTP proxy that must be used for outgoing HTTPS requests.
- `overrideProxyExclude`: Bypasses proxy settings for the specified hosts and domains. Uses a comma-separated list.
- `overrideProxyPAC`: Sets the file path where the PAC file is located. It has precedence over the remote PAC file on the selected proxy.
- `overrideProxyEmbeddedPAC`: Sets the content of an in-memory PAC file. It has precedence over `overrideProxyPAC`.
@y
- `allowedOrgs`: Sets a list of organizations in one single string, where each organization is in lowercase only and is separated by a semi-colon. 
- `overrideProxyHTTP`: Sets the URL of the HTTP proxy that must be used for outgoing HTTP requests.
- `overrideProxyHTTPS`: Sets the URL of the HTTP proxy that must be used for outgoing HTTPS requests.
- `overrideProxyExclude`: Bypasses proxy settings for the specified hosts and domains. Uses a comma-separated list.
- `overrideProxyPAC`: Sets the file path where the PAC file is located. It has precedence over the remote PAC file on the selected proxy.
- `overrideProxyEmbeddedPAC`: Sets the content of an in-memory PAC file. It has precedence over `overrideProxyPAC`.
@z

@x
> [!IMPORTANT]
>
> `allowedOrgs` must be a `<string>`, not an `<array>`. Docker Desktop only reads
> string values from a configuration profile, so an array is silently ignored and
> no enforcement happens. This differs from the
> [`.plist` method](#mac-plist-file-method), which does use an array.
@y
> [!IMPORTANT]
>
> `allowedOrgs` must be a `<string>`, not an `<array>`. Docker Desktop only reads
> string values from a configuration profile, so an array is silently ignored and
> no enforcement happens. This differs from the
> [`.plist` method](#mac-plist-file-method), which does use an array.
@z

@x
Setting at least one of the proxy keys puts Docker Desktop's proxy into manual
mode and locks the proxy settings, so developers can't change them.
@y
Setting at least one of the proxy keys puts Docker Desktop's proxy into manual
mode and locks the proxy settings, so developers can't change them.
@z

@x
1. Create a file named `docker.mobileconfig` and include the following content:
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
            <string>Your company name</string>
            <key>allowedOrgs</key>
            <string>first_org;second_org</string>
            <key>overrideProxyHTTP</key>
            <string>http://company.proxy:port</string>
            <key>overrideProxyHTTPS</key>
            <string>https://company.proxy:port</string>
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
      <string>Your company name</string>
   </dict>
   </plist>
   ```
1. Replace placeholders:
   - Change `com.yourcompany.docker.config` to your company identifier
   - Replace `Your company name` with your organization name making sure it is all lowercase
   - Replace `PayloadUUID` with a randomly generated UUID
   - Update the `allowedOrgs` value with your organization names (separated by semicolons)
   - Replace `company.proxy:port` with http/https proxy server host(or IP address) and port
1. Deploy the profile using your MDM solution.
1. Verify the profile appears in **System Settings** > **General** > **Device Management** under **Device (Managed)**. Ensure the profile is listed with the correct name and settings.
@y
1. Create a file named `docker.mobileconfig` and include the following content:
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
            <string>Your company name</string>
            <key>allowedOrgs</key>
            <string>first_org;second_org</string>
            <key>overrideProxyHTTP</key>
            <string>http://company.proxy:port</string>
            <key>overrideProxyHTTPS</key>
            <string>https://company.proxy:port</string>
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
      <string>Your company name</string>
   </dict>
   </plist>
   ```
1. Replace placeholders:
   - Change `com.yourcompany.docker.config` to your company identifier
   - Replace `Your company name` with your organization name making sure it is all lowercase
   - Replace `PayloadUUID` with a randomly generated UUID
   - Update the `allowedOrgs` value with your organization names (separated by semicolons)
   - Replace `company.proxy:port` with http/https proxy server host(or IP address) and port
1. Deploy the profile using your MDM solution.
1. Verify the profile appears in **System Settings** > **General** > **Device Management** under **Device (Managed)**. Ensure the profile is listed with the correct name and settings.
@z

@x
Some MDM solutions let you specify the payload as a plain dictionary of key-value settings without the full `.mobileconfig` wrapper:
@y
Some MDM solutions let you specify the payload as a plain dictionary of key-value settings without the full `.mobileconfig` wrapper:
@z

@x
```xml
<dict>
   <key>allowedOrgs</key>
   <string>first_org;second_org</string>
   <key>overrideProxyHTTP</key>
   <string>http://company.proxy:port</string>
   <key>overrideProxyHTTPS</key>
   <string>https://company.proxy:port</string>
</dict>
```
@y
```xml
<dict>
   <key>allowedOrgs</key>
   <string>first_org;second_org</string>
   <key>overrideProxyHTTP</key>
   <string>http://company.proxy:port</string>
   <key>overrideProxyHTTPS</key>
   <string>https://company.proxy:port</string>
</dict>
```
@z

@x
## Mac: plist file method
@y
## Mac: plist file method
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
1. Add this content, replacing `myorg1` and `myorg2` with your organization names and making sure they have lowercase letters only:
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
1. Verify the **Sign in using your work email address** prompt appears in Docker Desktop.
@y
1. Create the file `/Library/Application Support/com.docker.docker/desktop.plist`.
1. Add this content, replacing `myorg1` and `myorg2` with your organization names and making sure they have lowercase letters only:
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
1. Verify the **Sign in using your work email address** prompt appears in Docker Desktop.
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
Create the `registry.json` file (UTF-8) at the appropriate location:
@y
Create the `registry.json` file (UTF-8) at the appropriate location:
@z

@x
| Platform | Location |
| --- | --- |
| Windows | `%ProgramData%\DockerDesktop\registry.json` |
| Mac | `/Library/Application Support/com.docker.docker/registry.json` |
| Linux | `/usr/share/docker-desktop/registry/registry.json` |
@y
| Platform | Location |
| --- | --- |
| Windows | `%ProgramData%\DockerDesktop\registry.json` |
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
1. Add this content, replacing organization names with your own and making sure they have lowercase letters only:
      ```json
      {
         "allowedOrgs": ["myorg1", "myorg2"]
      }
      ```
1. Set file permissions to prevent user editing.
1. Restart Docker Desktop.
1. Verify the **Sign in using your work email address** prompt appears in Docker Desktop.
@y
1. Ensure users are members of your Docker organization.
1. Create the `registry.json` file at the appropriate location for your platform.
1. Add this content, replacing organization names with your own and making sure they have lowercase letters only:
      ```json
      {
         "allowedOrgs": ["myorg1", "myorg2"]
      }
      ```
1. Set file permissions to prevent user editing.
1. Restart Docker Desktop.
1. Verify the **Sign in using your work email address** prompt appears in Docker Desktop.
@z

@x
If users have issues starting Docker Desktop after enforcing sign-in,
they may need to update to the latest version.
@y
If users have issues starting Docker Desktop after enforcing sign-in,
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
#### Mac
@y
#### Mac
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
`--allowed-org` is a flag on the EXE installer. If you deploy with the MSI
installer, use the `ALLOWEDORG` property instead, which creates the
[registry key](#windows-registry-key-method).
@y
`--allowed-org` is a flag on the EXE installer. If you deploy with the MSI
installer, use the `ALLOWEDORG` property instead, which creates the
[registry key](#windows-registry-key-method).
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
"Docker Desktop Installer.exe" install --allowed-org=myorg1
```
The `--allowed-org` flag accepts only one organization. To enforce sign-in for multiple organizations on Mac, configure the `registry.json` file after installation.
@y
# Command Prompt
"Docker Desktop Installer.exe" install --allowed-org=myorg1
```
The `--allowed-org` flag accepts only one organization. To enforce sign-in for multiple organizations on Mac, configure the `registry.json` file after installation.
@z

@x
> [!IMPORTANT]
>
> With Docker Desktop version 4.83 and later, `--allowed-org` can't be combined
> with `--user`, and it can't be used for a Microsoft Store installation. Both
> are per-user installations and the installer rejects the combination. This
> matters because the Windows installer selects a per-user installation by
> default from version 4.83. For per-user installations, configure the
> `registry.json` file after installation.
@y
> [!IMPORTANT]
>
> With Docker Desktop version 4.83 and later, `--allowed-org` can't be combined
> with `--user`, and it can't be used for a Microsoft Store installation. Both
> are per-user installations and the installer rejects the combination. This
> matters because the Windows installer selects a per-user installation by
> default from version 4.83. For per-user installations, configure the
> `registry.json` file after installation.
@z

@x
#### Mac
@y
#### Mac
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
The `--allowed-org` flag accepts only one organization. To enforce sign-in for multiple organizations on Mac, configure the `registry.json` file after installation.
@y
The `--allowed-org` flag accepts only one organization. To enforce sign-in for multiple organizations on Mac, configure the `registry.json` file after installation.
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
When more than one configuration method exists on the same machine, Docker
Desktop evaluates them in order and stops at the first one that's configured.
The order depends on the platform.
@y
When more than one configuration method exists on the same machine, Docker
Desktop evaluates them in order and stops at the first one that's configured.
The order depends on the platform.
@z

@x
| Platform | Precedence order |
|:---------|:-----------------|
| Windows | 1. Registry key<br>2. `registry.json`<br>3. `admin-settings.json` |
| Mac | 1. Configuration profile<br>2. `desktop.plist`<br>3. `registry.json`<br>4. `admin-settings.json` |
| Linux | 1. `registry.json`<br>2. `admin-settings.json` |
@y
| Platform | Precedence order |
|:---------|:-----------------|
| Windows | 1. Registry key<br>2. `registry.json`<br>3. `admin-settings.json` |
| Mac | 1. Configuration profile<br>2. `desktop.plist`<br>3. `registry.json`<br>4. `admin-settings.json` |
| Linux | 1. `registry.json`<br>2. `admin-settings.json` |
@z

@x
Lower-precedence methods are not consulted once a higher one applies. For
example, on a Mac with both a configuration profile and a `registry.json` file,
only the organizations in the configuration profile are enforced.
@y
Lower-precedence methods are not consulted once a higher one applies. For
example, on a Mac with both a configuration profile and a `registry.json` file,
only the organizations in the configuration profile are enforced.
@z

@x
## Settings Management and sign-in enforcement
@y
## Settings Management and sign-in enforcement
@z

@x
Deploying an `admin-settings.json` file enforces sign-in on its own, even if the
file contains no organization list. Users who aren't on a Docker Business
subscription see the sign-in prompt, and the Docker Engine is held until they
sign in.
@y
Deploying an `admin-settings.json` file enforces sign-in on its own, even if the
file contains no organization list. Users who aren't on a Docker Business
subscription see the sign-in prompt, and the Docker Engine is held until they
sign in.
@z

@x
This differs from the four methods above in two ways:
@y
This differs from the four methods above in two ways:
@z

@x
- It doesn't restrict sign-in to particular organizations, so any Docker account
  satisfies it. Combine it with one of the methods above if you need organization
  membership enforced.
- It's the lowest-precedence method, so any of the methods above overrides it.
@y
- It doesn't restrict sign-in to particular organizations, so any Docker account
  satisfies it. Combine it with one of the methods above if you need organization
  membership enforced.
- It's the lowest-precedence method, so any of the methods above overrides it.
@z

@x
If you use [Settings Management](/manuals/desktop/enterprise/hardened-desktop/settings-management/_index.md), account for this when planning your rollout: developers who are signed out will be prompted to sign in as soon as the file reaches their machine and Docker Desktop restarts.
@y
If you use [Settings Management](manuals/desktop/enterprise/hardened-desktop/settings-management/_index.md), account for this when planning your rollout: developers who are signed out will be prompted to sign in as soon as the file reaches their machine and Docker Desktop restarts.
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
- Check that organization names use lowercase letters and match your Docker Hub
  organization name exactly. Matching is case-sensitive, so a mismatch signs out
  every user
- Check for stray whitespace in the value. In the Windows registry key, put each
  organization on its own line rather than separating them with spaces or commas
- Check whether a higher-precedence method is in effect. See
  [Method precedence](#method-precedence)
- Restart Docker Desktop or reboot the system. Docker Desktop doesn't pick up new
  configuration while running
- Confirm users are members of the specified organizations
- Update Docker Desktop to the latest version
@y
- Verify file locations and permissions
- Check that organization names use lowercase letters and match your Docker Hub
  organization name exactly. Matching is case-sensitive, so a mismatch signs out
  every user
- Check for stray whitespace in the value. In the Windows registry key, put each
  organization on its own line rather than separating them with spaces or commas
- Check whether a higher-precedence method is in effect. See
  [Method precedence](#method-precedence)
- Restart Docker Desktop or reboot the system. Docker Desktop doesn't pick up new
  configuration while running
- Confirm users are members of the specified organizations
- Update Docker Desktop to the latest version
@z

@x
If enforcement works but developers report that the Docker CLI stopped working,
that's expected. See [Impact on the Docker CLI](_index.md#impact-on-the-docker-cli).
@y
If enforcement works but developers report that the Docker CLI stopped working,
that's expected. See [Impact on the Docker CLI](_index.md#impact-on-the-docker-cli).
@z
