%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Enforce sign-in for Docker Sandboxes
linkTitle: Enforce sign-in
@y
title: Enforce sign-in for Docker Sandboxes
linkTitle: Enforce sign-in
@z

@x
description: Require Docker Sandboxes users to sign in as members of your organization, enforced through endpoint management.
keywords: docker sandboxes, sign-in enforcement, organization enforcement, sbx login, MDM, configuration profile, registry key, allowedOrgs
@y
description: Require Docker Sandboxes users to sign in as members of your organization, enforced through endpoint management.
keywords: docker sandboxes, sign-in enforcement, organization enforcement, sbx login, MDM, configuration profile, registry key, allowedOrgs
@z

@x
{{< summary-bar feature_name="AI Governance" >}}
@y
{{< summary-bar feature_name="AI Governance" >}}
@z

@x
Organization policies apply only when a developer signs in to Docker Sandboxes
as a member of your organization.
Without sign-in enforcement, a developer can sign in with a personal account
and bypass those policies. Sign-in enforcement closes that gap on the machine
itself, where users can't override it.
@y
Organization policies apply only when a developer signs in to Docker Sandboxes
as a member of your organization.
Without sign-in enforcement, a developer can sign in with a personal account
and bypass those policies. Sign-in enforcement closes that gap on the machine
itself, where users can't override it.
@z

@x
To set it up, you write an enforcement configuration that lists your
organizations, test it on one machine, then deploy it to your developers'
machines with your endpoint management tooling.
@y
To set it up, you write an enforcement configuration that lists your
organizations, test it on one machine, then deploy it to your developers'
machines with your endpoint management tooling.
@z

@x
## How sign-in enforcement works
@y
## How sign-in enforcement works
@z

@x
1. An administrator deploys an enforcement configuration to managed endpoints
   through MDM, Group Policy, or configuration management, specifying one or
   more allowed Docker organization slugs.
2. When a user runs `sbx login`, they authenticate with Docker. Credentials
   are saved temporarily, then Docker Sandboxes calls the Docker API to
   verify organization membership.
3. If the user belongs to at least one allowed organization, sign-in succeeds and
   the credentials are kept.
4. If not, Docker Sandboxes immediately revokes the saved credentials and the
   user receives a [denial message](#check-what-denied-developers-see) listing
   the required organizations.
@y
1. An administrator deploys an enforcement configuration to managed endpoints
   through MDM, Group Policy, or configuration management, specifying one or
   more allowed Docker organization slugs.
2. When a user runs `sbx login`, they authenticate with Docker. Credentials
   are saved temporarily, then Docker Sandboxes calls the Docker API to
   verify organization membership.
3. If the user belongs to at least one allowed organization, sign-in succeeds and
   the credentials are kept.
4. If not, Docker Sandboxes immediately revokes the saved credentials and the
   user receives a [denial message](#check-what-denied-developers-see) listing
   the required organizations.
@z

@x
`sbx login` and `sbx logout` always run regardless of organization membership.
Other commands require a valid signed-in session, so they fail after a denied
sign-in until the user signs in with an allowed account.
@y
`sbx login` and `sbx logout` always run regardless of organization membership.
Other commands require a valid signed-in session, so they fail after a denied
sign-in until the user signs in with an allowed account.
@z

@x
## Write the enforcement configuration
@y
## Write the enforcement configuration
@z

@x
The configuration lists the organizations developers must belong to, and
optionally who to contact for access. Every platform uses the same fields. The
canonical JSON representation:
@y
The configuration lists the organizations developers must belong to, and
optionally who to contact for access. Every platform uses the same fields. The
canonical JSON representation:
@z

@x
```json
{
  "allowedOrgs": ["docker", "acme-corp"],
  "adminEmail": "it-security@acme-corp.com",
  "adminURL": "https://acme-corp.atlassian.net/servicedesk/it",
  "adminName": "ACME IT Security Team"
}
```
@y
```json
{
  "allowedOrgs": ["docker", "acme-corp"],
  "adminEmail": "it-security@acme-corp.com",
  "adminURL": "https://acme-corp.atlassian.net/servicedesk/it",
  "adminName": "ACME IT Security Team"
}
```
@z

@x
| Field         | Type            | Required | Description                                                                                         |
| ------------- | --------------- | -------- | --------------------------------------------------------------------------------------------------- |
| `allowedOrgs` | list of strings | Yes      | Docker organization slugs. The user must be a member of at least one. Matching is case-insensitive. |
| `adminName`   | string          | No       | Administrator or team display name shown in the denial message.                                     |
| `adminEmail`  | string          | No       | Contact email shown in the denial message.                                                          |
| `adminURL`    | string          | No       | Help desk or access-request URL shown in the denial message.                                        |
@y
| Field         | Type            | Required | Description                                                                                         |
| ------------- | --------------- | -------- | --------------------------------------------------------------------------------------------------- |
| `allowedOrgs` | list of strings | Yes      | Docker organization slugs. The user must be a member of at least one. Matching is case-insensitive. |
| `adminName`   | string          | No       | Administrator or team display name shown in the denial message.                                     |
| `adminEmail`  | string          | No       | Contact email shown in the denial message.                                                          |
| `adminURL`    | string          | No       | Help desk or access-request URL shown in the denial message.                                        |
@z

@x
If `allowedOrgs` is empty or missing, enforcement is inactive and any
authenticated user can use Docker Sandboxes.
@y
If `allowedOrgs` is empty or missing, enforcement is inactive and any
authenticated user can use Docker Sandboxes.
@z

@x
The optional `adminName`, `adminEmail`, and `adminURL` fields give denied users
a path to resolution. Include the contact details your organization uses for
access requests.
@y
The optional `adminName`, `adminEmail`, and `adminURL` fields give denied users
a path to resolution. Include the contact details your organization uses for
access requests.
@z

@x
## Test the configuration on one machine
@y
## Test the configuration on one machine
@z

@x
Before you deploy to every machine, write the configuration on one machine and
confirm that `sbx login` behaves as you expect.
@y
Before you deploy to every machine, write the configuration on one machine and
confirm that `sbx login` behaves as you expect.
@z

@x
{{< tabs >}}
{{< tab name="macOS" >}}
@y
{{< tabs >}}
{{< tab name="macOS" >}}
@z

@x
Write the configuration to the user preferences domain:
@y
Write the configuration to the user preferences domain:
@z

@x
```console
$ defaults write com.docker.sbx allowedOrgs -array "acme-corp"
$ defaults write com.docker.sbx adminEmail "it@acme.com"
```
@y
```console
$ defaults write com.docker.sbx allowedOrgs -array "acme-corp"
$ defaults write com.docker.sbx adminEmail "it@acme.com"
```
@z

@x
To remove the test configuration:
@y
To remove the test configuration:
@z

@x
```console
$ defaults delete com.docker.sbx
```
@y
```console
$ defaults delete com.docker.sbx
```
@z

@x
`defaults write` uses the user preferences domain, not the managed-preferences
domain. On a managed device, the MDM profile is authoritative and user-level
settings in the same domain are ignored.
@y
`defaults write` uses the user preferences domain, not the managed-preferences
domain. On a managed device, the MDM profile is authoritative and user-level
settings in the same domain are ignored.
@z

@x
{{< /tab >}}
{{< tab name="Windows" >}}
@y
{{< /tab >}}
{{< tab name="Windows" >}}
@z

@x
Run the following in an elevated PowerShell session. Use `New-ItemProperty` to
create values with an explicit type. `Set-ItemProperty` doesn't create new
values.
@y
Run the following in an elevated PowerShell session. Use `New-ItemProperty` to
create values with an explicit type. `Set-ItemProperty` doesn't create new
values.
@z

@x
```powershell
New-Item -Path "HKLM:\SOFTWARE\Policies\Docker\SBX" -Force
@y
```powershell
New-Item -Path "HKLM:\SOFTWARE\Policies\Docker\SBX" -Force
@z

@x
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Docker\SBX" `
  -Name "allowedOrgs" -Value @("acme-corp") -PropertyType MultiString -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Docker\SBX" `
  -Name "adminEmail" -Value "it@acme.com" -PropertyType String -Force
```
@y
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Docker\SBX" `
  -Name "allowedOrgs" -Value @("acme-corp") -PropertyType MultiString -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Docker\SBX" `
  -Name "adminEmail" -Value "it@acme.com" -PropertyType String -Force
```
@z

@x
To remove the test configuration:
@y
To remove the test configuration:
@z

@x
```powershell
Remove-Item -Path "HKLM:\SOFTWARE\Policies\Docker\SBX" -Recurse -Force
```
@y
```powershell
Remove-Item -Path "HKLM:\SOFTWARE\Policies\Docker\SBX" -Recurse -Force
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
Write the configuration file and set its ownership:
@y
Write the configuration file and set its ownership:
@z

@x
```console
$ sudo mkdir -p /etc/docker-sbx
$ sudo tee /etc/docker-sbx/config.json <<'EOF'
{"allowedOrgs": ["acme-corp"], "adminEmail": "it@acme.com"}
EOF
$ sudo chown root:root /etc/docker-sbx/config.json
$ sudo chmod 644 /etc/docker-sbx/config.json
```
@y
```console
$ sudo mkdir -p /etc/docker-sbx
$ sudo tee /etc/docker-sbx/config.json <<'EOF'
{"allowedOrgs": ["acme-corp"], "adminEmail": "it@acme.com"}
EOF
$ sudo chown root:root /etc/docker-sbx/config.json
$ sudo chmod 644 /etc/docker-sbx/config.json
```
@z

@x
To remove the test configuration:
@y
To remove the test configuration:
@z

@x
```console
$ sudo rm -f /etc/docker-sbx/config.json
```
@y
```console
$ sudo rm -f /etc/docker-sbx/config.json
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
Then run `sbx login` with an account that belongs to an allowed organization,
and again with one that doesn't. The second sign-in is denied with the message
described in
[Check what denied developers see](#check-what-denied-developers-see).
@y
Then run `sbx login` with an account that belongs to an allowed organization,
and again with one that doesn't. The second sign-in is denied with the message
described in
[Check what denied developers see](#check-what-denied-developers-see).
@z

@x
## Deploy the configuration to your managed machines
@y
## Deploy the configuration to your managed machines
@z

@x
Use your existing endpoint management tooling to deploy the configuration. Each
platform reads it from a native location that ordinary users can't modify.
@y
Use your existing endpoint management tooling to deploy the configuration. Each
platform reads it from a native location that ordinary users can't modify.
@z

@x
{{< tabs >}}
{{< tab name="macOS" >}}
@y
{{< tabs >}}
{{< tab name="macOS" >}}
@z

@x
On macOS, the configuration is a managed preferences domain, `com.docker.sbx`.
@y
On macOS, the configuration is a managed preferences domain, `com.docker.sbx`.
@z

@x
Deploy it through any MDM solution, such as Jamf or Intune, as a custom
configuration profile. MDM-deployed profiles take precedence over user-level
preferences and can only be removed by removing the device from MDM management,
so users can't override them.
@y
Deploy it through any MDM solution, such as Jamf or Intune, as a custom
configuration profile. MDM-deployed profiles take precedence over user-level
preferences and can only be removed by removing the device from MDM management,
so users can't override them.
@z

@x
The following `.mobileconfig` payload sets the allowed organization and admin
contact details:
@y
The following `.mobileconfig` payload sets the allowed organization and admin
contact details:
@z

@x
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
  "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>PayloadContent</key>
  <array>
    <dict>
      <key>PayloadType</key>
      <string>com.apple.ManagedClient.preferences</string>
      <key>PayloadVersion</key>
      <integer>1</integer>
      <key>PayloadIdentifier</key>
      <string>com.docker.sbx.policy</string>
      <key>PayloadUUID</key>
      <string><!-- generate a UUID --></string>
      <key>PayloadEnabled</key>
      <true/>
      <key>PayloadDisplayName</key>
      <string>Docker Sandboxes Policy</string>
      <key>PayloadContent</key>
      <dict>
        <key>com.docker.sbx</key>
        <dict>
          <key>Forced</key>
          <array>
            <dict>
              <key>mcx_preference_settings</key>
              <dict>
                <key>allowedOrgs</key>
                <array>
                  <string>acme-corp</string>
                </array>
                <key>adminEmail</key>
                <string>it-security@acme-corp.com</string>
                <key>adminURL</key>
                <string>https://acme-corp.atlassian.net/servicedesk/it</string>
                <key>adminName</key>
                <string>ACME IT Security</string>
              </dict>
            </dict>
          </array>
        </dict>
      </dict>
    </dict>
  </array>
</dict>
</plist>
```
@y
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
  "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>PayloadContent</key>
  <array>
    <dict>
      <key>PayloadType</key>
      <string>com.apple.ManagedClient.preferences</string>
      <key>PayloadVersion</key>
      <integer>1</integer>
      <key>PayloadIdentifier</key>
      <string>com.docker.sbx.policy</string>
      <key>PayloadUUID</key>
      <string><!-- generate a UUID --></string>
      <key>PayloadEnabled</key>
      <true/>
      <key>PayloadDisplayName</key>
      <string>Docker Sandboxes Policy</string>
      <key>PayloadContent</key>
      <dict>
        <key>com.docker.sbx</key>
        <dict>
          <key>Forced</key>
          <array>
            <dict>
              <key>mcx_preference_settings</key>
              <dict>
                <key>allowedOrgs</key>
                <array>
                  <string>acme-corp</string>
                </array>
                <key>adminEmail</key>
                <string>it-security@acme-corp.com</string>
                <key>adminURL</key>
                <string>https://acme-corp.atlassian.net/servicedesk/it</string>
                <key>adminName</key>
                <string>ACME IT Security</string>
              </dict>
            </dict>
          </array>
        </dict>
      </dict>
    </dict>
  </array>
</dict>
</plist>
```
@z

@x
{{< /tab >}}
{{< tab name="Windows" >}}
@y
{{< /tab >}}
{{< tab name="Windows" >}}
@z

@x
On Windows, the configuration is a set of registry values under
`HKLM\SOFTWARE\Policies\Docker\SBX`. Deploy them through Group Policy, Intune,
or any endpoint management tool that can write registry values.
@y
On Windows, the configuration is a set of registry values under
`HKLM\SOFTWARE\Policies\Docker\SBX`. Deploy them through Group Policy, Intune,
or any endpoint management tool that can write registry values.
@z

@x
| Value name    | Type           | Description                                         |
| ------------- | -------------- | --------------------------------------------------- |
| `allowedOrgs` | `REG_MULTI_SZ` | Multi-string list, one organization slug per string |
| `adminName`   | `REG_SZ`       | Administrator or team name (optional)               |
| `adminEmail`  | `REG_SZ`       | Contact email (optional)                            |
| `adminURL`    | `REG_SZ`       | Help desk URL (optional)                            |
@y
| Value name    | Type           | Description                                         |
| ------------- | -------------- | --------------------------------------------------- |
| `allowedOrgs` | `REG_MULTI_SZ` | Multi-string list, one organization slug per string |
| `adminName`   | `REG_SZ`       | Administrator or team name (optional)               |
| `adminEmail`  | `REG_SZ`       | Contact email (optional)                            |
| `adminURL`    | `REG_SZ`       | Help desk URL (optional)                            |
@z

@x
{{< /tab >}}
{{< tab name="Linux" >}}
@y
{{< /tab >}}
{{< tab name="Linux" >}}
@z

@x
On Linux, the configuration is a root-owned JSON file at
`/etc/docker-sbx/config.json`.
@y
On Linux, the configuration is a root-owned JSON file at
`/etc/docker-sbx/config.json`.
@z

@x
Deploy it through configuration management such as Ansible, Puppet, Chef, or
Salt. The file must be owned by root with `644` permissions.
@y
Deploy it through configuration management such as Ansible, Puppet, Chef, or
Salt. The file must be owned by root with `644` permissions.
@z

@x
```json
{
  "allowedOrgs": ["acme-corp"],
  "adminEmail": "it-security@acme-corp.com",
  "adminURL": "https://acme-corp.atlassian.net/servicedesk/it",
  "adminName": "ACME IT Security"
}
```
@y
```json
{
  "allowedOrgs": ["acme-corp"],
  "adminEmail": "it-security@acme-corp.com",
  "adminURL": "https://acme-corp.atlassian.net/servicedesk/it",
  "adminName": "ACME IT Security"
}
```
@z

@x
The Linux loader fails closed if the file is a symlink, isn't a regular file,
isn't owned by root, or is writable by group or other. Any deviation is treated
as a configuration error and `sbx login` is denied with a descriptive message.
Deploying with the commands in
[Test the configuration on one machine](#test-the-configuration-on-one-machine)
passes these checks.
@y
The Linux loader fails closed if the file is a symlink, isn't a regular file,
isn't owned by root, or is writable by group or other. Any deviation is treated
as a configuration error and `sbx login` is denied with a descriptive message.
Deploying with the commands in
[Test the configuration on one machine](#test-the-configuration-on-one-machine)
passes these checks.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Check what denied developers see
@y
## Check what denied developers see
@z

@x
When a user signs in with an account that isn't a member of an allowed
organization, they're signed out and shown a denial message. Only the contact
fields you configure appear. For example, if only `adminEmail` is set, the URL
line is omitted.
@y
When a user signs in with an account that isn't a member of an allowed
organization, they're signed out and shown a denial message. Only the contact
fields you configure appear. For example, if only `adminEmail` is set, the URL
line is omitted.
@z

@x
When no admin contact details are configured:
@y
When no admin contact details are configured:
@z

@x
```text
Access denied: Your administrator requires you to be logged into an account
that is a member of one of the following Docker organizations:
  - acme-corp
@y
```text
Access denied: Your administrator requires you to be logged into an account
that is a member of one of the following Docker organizations:
  - acme-corp
@z

@x
Sign in with an account that belongs to one of these organizations, or
contact your administrator for access.
```
@y
Sign in with an account that belongs to one of these organizations, or
contact your administrator for access.
```
@z

@x
When admin contact details are configured:
@y
When admin contact details are configured:
@z

@x
```text
Access denied: Your administrator requires you to be logged into an account
that is a member of one of the following Docker organizations:
  - acme-corp
@y
```text
Access denied: Your administrator requires you to be logged into an account
that is a member of one of the following Docker organizations:
  - acme-corp
@z

@x
For access, contact ACME IT Security:
  Email: it-security@acme-corp.com
  URL:   https://acme-corp.atlassian.net/servicedesk/it
```
@y
For access, contact ACME IT Security:
  Email: it-security@acme-corp.com
  URL:   https://acme-corp.atlassian.net/servicedesk/it
```
@z

@x
## Turn off enforcement
@y
## Turn off enforcement
@z

@x
To turn off sign-in enforcement on a machine, remove the configuration with
the same tooling you used to deploy it. You can also leave `allowedOrgs` empty,
which makes enforcement inactive so any authenticated user can use Docker
Sandboxes.
@y
To turn off sign-in enforcement on a machine, remove the configuration with
the same tooling you used to deploy it. You can also leave `allowedOrgs` empty,
which makes enforcement inactive so any authenticated user can use Docker
Sandboxes.
@z
