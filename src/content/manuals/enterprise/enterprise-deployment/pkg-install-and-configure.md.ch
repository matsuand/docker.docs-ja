%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: PKG installer
description: Understand how to use the PKG installer. Also explore additional configuration options.
keywords: pkg, mac, docker desktop, install, deploy, configure, admin, mdm
@y
title: PKG installer
description: Understand how to use the PKG installer. Also explore additional configuration options.
keywords: pkg, mac, docker desktop, install, deploy, configure, admin, mdm
@z

@x
{{< summary-bar feature_name="PKG installer" >}}
@y
{{< summary-bar feature_name="PKG installer" >}}
@z

@x
The PKG package supports various MDM (Mobile Device Management) solutions, making it ideal for bulk installations and eliminating the need for manual setups by individual users. With this package, IT administrators can ensure standardized, policy-driven installations of Docker Desktop, enhancing efficiency and software management across their organizations.
@y
The PKG package supports various MDM (Mobile Device Management) solutions, making it ideal for bulk installations and eliminating the need for manual setups by individual users. With this package, IT administrators can ensure standardized, policy-driven installations of Docker Desktop, enhancing efficiency and software management across their organizations.
@z

@x
## Install interactively
@y
## Install interactively
@z

@x
1. In [Docker Home](http://app.docker.com), choose your organization.
2. Select **Admin Console**, then **Enterprise deployment**.
3. From the **macOS** tab, select the **Download PKG installer** button.
4. Once downloaded, double-click `Docker.pkg` to run the installer.
5. Follow the instructions on the installation wizard to authorize the installer and proceed with the installation.
   - **Introduction**: Select **Continue**.
   - **License**: Review the license agreement and select **Agree**.
   - **Destination Select**: This step is optional. It is recommended that you keep the default installation destination (usually `Macintosh HD`). Select **Continue**.
   - **Installation Type**: Select **Install**.
   - **Installation**: Authenticate using your administrator password or Touch ID.
   - **Summary**: When the installation completes, select **Close**.
@y
1. In [Docker Home](http://app.docker.com), choose your organization.
2. Select **Admin Console**, then **Enterprise deployment**.
3. From the **macOS** tab, select the **Download PKG installer** button.
4. Once downloaded, double-click `Docker.pkg` to run the installer.
5. Follow the instructions on the installation wizard to authorize the installer and proceed with the installation.
   - **Introduction**: Select **Continue**.
   - **License**: Review the license agreement and select **Agree**.
   - **Destination Select**: This step is optional. It is recommended that you keep the default installation destination (usually `Macintosh HD`). Select **Continue**.
   - **Installation Type**: Select **Install**.
   - **Installation**: Authenticate using your administrator password or Touch ID.
   - **Summary**: When the installation completes, select **Close**.
@z

@x
> [!NOTE]
>
> When installing Docker Desktop with the PKG, in-app updates are automatically disabled. This ensures organizations can maintain version consistency and prevent unapproved updates. For Docker Desktop installed with the `.dmg` installer, in-app updates remain supported.
>
> Docker Desktop notifies you when an update is available. To update Docker Desktop, download the latest installer from the Docker Admin Console. Navigate to the **Enterprise deployment** page.
>
> To keep up to date with new releases, check the [release notes](/manuals/desktop/release-notes.md) page.
@y
> [!NOTE]
>
> When installing Docker Desktop with the PKG, in-app updates are automatically disabled. This ensures organizations can maintain version consistency and prevent unapproved updates. For Docker Desktop installed with the `.dmg` installer, in-app updates remain supported.
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
1. In [Docker Home](http://app.docker.com), choose your organization.
2. Select **Admin Console**, then **Enterprise deployment**.
3. From the **macOS** tab, select the **Download PKG installer** button.
4. From your terminal, run the following command:
@y
1. In [Docker Home](http://app.docker.com), choose your organization.
2. Select **Admin Console**, then **Enterprise deployment**.
3. From the **macOS** tab, select the **Download PKG installer** button.
4. From your terminal, run the following command:
@z

@x
   ```console
   $ sudo installer -pkg "/path/to/Docker.pkg" -target /Applications
   ```
@y
   ```console
   $ sudo installer -pkg "/path/to/Docker.pkg" -target /Applications
   ```
@z

@x
## Additional resources
@y
## Additional resources
@z

@x
- See how you can deploy Docker Desktop for Mac using [Intune](use-intune.md) or [Jamf Pro](use-jamf-pro.md)
- Explore how to [Enforce sign-in](/manuals/enterprise/security/enforce-sign-in/methods.md#plist-method-mac-only) for your users.
@y
- See how you can deploy Docker Desktop for Mac using [Intune](use-intune.md) or [Jamf Pro](use-jamf-pro.md)
- Explore how to [Enforce sign-in](manuals/enterprise/security/enforce-sign-in/methods.md#plist-method-mac-only) for your users.
@z
