%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応。
% snip 対応。

@x
description: Configure registry.json to enforce users to sign into Docker Desktop
toc_max: 2
keywords: authentication, registry.json, configure, enforce sign-in
title: Enforce sign-in for Desktop
@y
description: Configure registry.json to enforce users to sign into Docker Desktop
toc_max: 2
keywords: authentication, registry.json, configure, enforce sign-in
title: Enforce sign-in for Desktop
@z

@x
By default, members of your organization can use Docker Desktop without signing
in. When users don’t sign in as a member of your organization, they don’t
receive the [benefits of your organization’s
subscription](../../subscription/core-subscription/details.md) and they can circumvent [Docker’s
security features](../../desktop/hardened-desktop/_index.md) for your organization.
@y
By default, members of your organization can use Docker Desktop without signing
in. When users don’t sign in as a member of your organization, they don’t
receive the [benefits of your organization’s
subscription](../../subscription/core-subscription/details.md) and they can circumvent [Docker’s
security features](../../desktop/hardened-desktop/_index.md) for your organization.
@z

@x
To ensure members of your organization always sign in, you can deploy a
`registry.json` configuration file to the machines of your users.
@y
To ensure members of your organization always sign in, you can deploy a
`registry.json` configuration file to the machines of your users.
@z

@x
## How is sign-in enforced?
@y
## How is sign-in enforced?
@z

@x
When Docker Desktop starts and it detects a `registry.json` file, the
following occurs:
@y
When Docker Desktop starts and it detects a `registry.json` file, the
following occurs:
@z

@x
- The following **Sign in required!** prompt appears requiring the user to sign
  in as a member of your organization to use Docker Desktop. ![Enforce Sign-in
  Prompt](../images/enforce-sign-in.png?w=400)
- When a user signs in to an account that isn’t a member of your organization,
  they will be automatically signed out and can’t use Docker Desktop. The user
  can select **Sign in** and try again.
- When a user signs in to an account that is a member of your organization, they
 can use Docker Desktop.
- When a user signs out, the **Sign in required!** prompt appears and they can
  no longer use Docker Desktop.
@y
- The following **Sign in required!** prompt appears requiring the user to sign
  in as a member of your organization to use Docker Desktop. ![Enforce Sign-in
  Prompt](../images/enforce-sign-in.png?w=400)
- When a user signs in to an account that isn’t a member of your organization,
  they will be automatically signed out and can’t use Docker Desktop. The user
  can select **Sign in** and try again.
- When a user signs in to an account that is a member of your organization, they
 can use Docker Desktop.
- When a user signs out, the **Sign in required!** prompt appears and they can
  no longer use Docker Desktop.
@z

@x
> **Enforce sign-in vs enforce SSO**
>
> Enforcing sign-in ensures that users are required to sign in to use Docker Desktop.
> If your organization is also using single sign-on (SSO), you can optionally enforce SSO.
> This means that your users must use SSO to sign in, instead of a username and password.
> When you enforce sign-in and enforce SSO, your users must sign in and must use SSO to do so.
> See [Enforce SSO](/security/for-admins/single-sign-on/connect#optional-enforce-sso) for details on how to enable this for your SSO connection.
{ .tip }
@y
> **Enforce sign-in vs enforce SSO**
>
> Enforcing sign-in ensures that users are required to sign in to use Docker Desktop.
> If your organization is also using single sign-on (SSO), you can optionally enforce SSO.
> This means that your users must use SSO to sign in, instead of a username and password.
> When you enforce sign-in and enforce SSO, your users must sign in and must use SSO to do so.
> See [Enforce SSO](__SUBDIR__/security/for-admins/single-sign-on/connect#optional-enforce-sso) for details on how to enable this for your SSO connection.
{ .tip }
@z

@x
## Create a registry.json file to enforce sign-in
@y
## Create a registry.json file to enforce sign-in
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
    | Windows | /ProgramData/DockerDesktop/registry.json |
    | Mac | /Library/Application Support/com.docker.docker/registry.json |
    | Linux | /usr/share/docker-desktop/registry/registry.json |
@y
    | Platform | Location |
    | --- | --- |
    | Windows | /ProgramData/DockerDesktop/registry.json |
    | Mac | /Library/Application Support/com.docker.docker/registry.json |
    | Linux | /usr/share/docker-desktop/registry/registry.json |
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

% snip code...

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
## Alternative methods to create a registry.json file
@y
## Alternative methods to create a registry.json file
@z

@x
You can also use the following alternative methods to create a `registry.json` file.
@y
You can also use the following alternative methods to create a `registry.json` file.
@z

@x
### Create a registry.json file when installing Docker Desktop
@y
### Create a registry.json file when installing Docker Desktop
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

% snip command...

@x
If you're using the Windows Command Prompt:
@y
If you're using the Windows Command Prompt:
@z

% snip command...

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

% snip command...

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Create a registry.json file using the command line
@y
### Create a registry.json file using the command line
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
command as an Admin and replace `myorg` with your organization's name. The file
contents are case-sensitive and you must use lowercase letters for your
organization's name.
@y
To use the CLI to create a `registry.json` file, run the following PowerShell
command as an Admin and replace `myorg` with your organization's name. The file
contents are case-sensitive and you must use lowercase letters for your
organization's name.
@z

% snip command...

@x
This creates the `registry.json` file at
`C:\ProgramData\DockerDesktop\registry.json` and includes the organization
information the user belongs to. Make sure that the user can't edit this file, but only the administrator can:
@y
This creates the `registry.json` file at
`C:\ProgramData\DockerDesktop\registry.json` and includes the organization
information the user belongs to. Make sure that the user can't edit this file, but only the administrator can:
@z

% snip comand...

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

% snip command...

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

% snip command...

@x
Verify that the file has the expected permissions (`-rw-r--r--`) and ownership
(`root` and `admin`):
@y
Verify that the file has the expected permissions (`-rw-r--r--`) and ownership
(`root` and `admin`):
@z

% snip command...

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

% snip command...

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

% snip command...

@x
Verify that the file has the expected permissions (`-rw-r--r--`) and ownership
(`root`):
@y
Verify that the file has the expected permissions (`-rw-r--r--`) and ownership
(`root`):
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
## Deploy registry.json to multiple devices
@y
## Deploy registry.json to multiple devices
@z

@x
The previous instructions explain how to create and deploy a `registry.json` file to a single device. To automatically deploy the `registry.json` to multiple devices, you must use a third-party solution, such as a mobile device management solution. You can use the previous instructions along with your third-party solution to remotely deploy the `registry.json` file, or remotely install Docker Desktop with the `registry.json` file. For more details, see the documentation of your third-party solution.
@y
The previous instructions explain how to create and deploy a `registry.json` file to a single device. To automatically deploy the `registry.json` to multiple devices, you must use a third-party solution, such as a mobile device management solution. You can use the previous instructions along with your third-party solution to remotely deploy the `registry.json` file, or remotely install Docker Desktop with the `registry.json` file. For more details, see the documentation of your third-party solution.
@z
