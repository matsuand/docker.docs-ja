%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Use the PKG installer
description: Understand how to use the PKG installer. Also explore additional configuration options.
keywords: PKG, mac, docker desktop, install, deploy, configure
@y
title: Use the PKG installer
description: Understand how to use the PKG installer. Also explore additional configuration options.
keywords: PKG, mac, docker desktop, install, deploy, configure
@z

@x
{{% restricted title="Early Access" %}}
The PKG installer is currently an [Early Access](/manuals/release-lifecycle.md) feature and is available to all company and organization owners with a Business subscription and Docker Desktop version 4.36 and later.
{{% /restricted %}}
@y
{{% restricted title="Early Access" %}}
The PKG installer is currently an [Early Access](manuals/release-lifecycle.md) feature and is available to all company and organization owners with a Business subscription and Docker Desktop version 4.36 and later.
{{% /restricted %}}
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
1. In the [Docker Admin Console](http://admin.docker.com/), navigate to your organization.
2. Under **Security and access**, select the **Deploy Docker Desktop** page. 
3. From the **macOS** tab, select the **Download PKG installer** button. 
4. Once downloaded, double-click `Docker.pkg` to run the installer. 
5. Follow the instructions on the installation wizard to authorize the installer and proceed with the install.
   - **Introduction**: Select `Continue`.
   - **License**: Review the license agreement and select `Agree`.
   - **Destination Select**: This step is optional. It is recommended that you don't change the default installation destination (usually `Macintosh HD`). Select `Continue`.
   - **Installation Type**: Select `Install`.
   - **Installation**: Authenticate using your administrator password or Touch ID.
   - **Summary**: After the installation completes, select `Close`.
@y
1. In the [Docker Admin Console](http://admin.docker.com/), navigate to your organization.
2. Under **Security and access**, select the **Deploy Docker Desktop** page. 
3. From the **macOS** tab, select the **Download PKG installer** button. 
4. Once downloaded, double-click `Docker.pkg` to run the installer. 
5. Follow the instructions on the installation wizard to authorize the installer and proceed with the install.
   - **Introduction**: Select `Continue`.
   - **License**: Review the license agreement and select `Agree`.
   - **Destination Select**: This step is optional. It is recommended that you don't change the default installation destination (usually `Macintosh HD`). Select `Continue`.
   - **Installation Type**: Select `Install`.
   - **Installation**: Authenticate using your administrator password or Touch ID.
   - **Summary**: After the installation completes, select `Close`.
@z

@x
> [!NOTE]
>
> When installing Docker Desktop with the PKG, in-app updates are automatically disabled. This feature ensures your organization maintains the required Docker Desktop version. For Docker Desktop installed with the .dmg installer, in-app updates remain supported.
>
> Docker Desktop notifies you when an update is available. To update Docker Desktop, download the latest installer from the Docker Admin Console. Navigate to the  **Deploy Docker Desktop** page > under **Security and access**. 
>
> To keep up to date with new releases, check the [release notes](/manuals/desktop/release-notes.md) page.
@y
> [!NOTE]
>
> When installing Docker Desktop with the PKG, in-app updates are automatically disabled. This feature ensures your organization maintains the required Docker Desktop version. For Docker Desktop installed with the .dmg installer, in-app updates remain supported.
>
> Docker Desktop notifies you when an update is available. To update Docker Desktop, download the latest installer from the Docker Admin Console. Navigate to the  **Deploy Docker Desktop** page > under **Security and access**. 
>
> To keep up to date with new releases, check the [release notes](manuals/desktop/release-notes.md) page.
@z

@x
## Install from the command line
@y
## Install from the command line
@z

@x
1. In the [Docker Admin Console](http://admin.docker.com/), navigate to your organization.
2. Under **Security and access**, select the **Deploy Docker Desktop** page. 
3. From the **macOS** tab, select the **Download PKG installer** button.
4. From your terminal, run the following command:
@y
1. In the [Docker Admin Console](http://admin.docker.com/), navigate to your organization.
2. Under **Security and access**, select the **Deploy Docker Desktop** page. 
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
- See how you can deploy Docker Desktop for Mac via [Intune](use-intune.md) or [Jamf Pro](use-jamf-pro.md)
- Explore how to [Enforce sign-in](/manuals/security/for-admins/enforce-sign-in/methods.md#plist-method-mac-only) for your users.
@y
- See how you can deploy Docker Desktop for Mac via [Intune](use-intune.md) or [Jamf Pro](use-jamf-pro.md)
- Explore how to [Enforce sign-in](manuals/security/for-admins/enforce-sign-in/methods.md#plist-method-mac-only) for your users.
@z
