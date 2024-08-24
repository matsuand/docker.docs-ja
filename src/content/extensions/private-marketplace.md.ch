%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応
% snip 対応

@x
description: How to configure and use Docker Extensions' private marketplace
keywords: Docker Extensions, Docker Desktop, Linux, Mac, Windows, Marketplace, private, security
title: Configure a private marketplace for extensions
@y
description: How to configure and use Docker Extensions' private marketplace
keywords: Docker Extensions, Docker Desktop, Linux, Mac, Windows, Marketplace, private, security
title: Configure a private marketplace for extensions
@z

@x
{{% experimental title="Beta" %}}
This feature is currently in [Beta](../../release-lifecycle.md#beta). It is available to Docker Business customers only.
{{% /experimental %}}
@y
{{% experimental title="Beta" %}}
This feature is currently in [Beta](../../release-lifecycle.md#beta). It is available to Docker Business customers only.
{{% /experimental %}}
@z

@x
Learn how to configure and set up a private marketplace with a curated list of extensions for your Docker Desktop users.
@y
Learn how to configure and set up a private marketplace with a curated list of extensions for your Docker Desktop users.
@z

@x
It is designed specifically 
@y
It is designed specifically 
@z

@x
Docker Extensions' private marketplace is designed specifically for organizations who don’t give developers root access to their machines. It makes use of [Settings Management](/security/for-admins/hardened-desktop/settings-management/_index.md) so administrators have complete control over the private marketplace.
@y
Docker Extensions' private marketplace is designed specifically for organizations who don’t give developers root access to their machines. It makes use of [Settings Management](/security/for-admins/hardened-desktop/settings-management/_index.md) so administrators have complete control over the private marketplace.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- [Download and install Docker Desktop 4.26.0 or later](https://docs.docker.com/desktop/release-notes/).
- You must be an administrator for your organization.
- You have the ability to push the `extension-marketplace` folder and `admin-settings.json` file to the locations specified below through device management software such as [Jamf](https://www.jamf.com/).
@y
- [Download and install Docker Desktop 4.26.0 or later](https://docs.docker.com/desktop/release-notes/).
- You must be an administrator for your organization.
- You have the ability to push the `extension-marketplace` folder and `admin-settings.json` file to the locations specified below through device management software such as [Jamf](https://www.jamf.com/).
@z

@x
## Step one: Initialize the private marketplace
@y
## Step one: Initialize the private marketplace
@z

@x
1. Create a folder locally for the content that will be deployed to your developers’ machines:
@y
1. Create a folder locally for the content that will be deployed to your developers’ machines:
@z

% snip command...

@x
2. Initialize the configuration files for your marketplace:
@y
2. Initialize the configuration files for your marketplace:
@z

@x
   {{< tabs group="os_version" >}}
   {{< tab name="Mac" >}}
@y
   {{< tabs group="os_version" >}}
   {{< tab name="Mac" >}}
@z

% snip command...

@x
   {{< /tab >}}
   {{< tab name="Windows" >}}
@y
   {{< /tab >}}
   {{< tab name="Windows" >}}
@z

% snip command...

@x
   {{< /tab >}}
   {{< tab name="Linux" >}}
@y
   {{< /tab >}}
   {{< tab name="Linux" >}}
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
This creates 2 files:
@y
This creates 2 files:
@z

@x
- `admin-settings.json`, which activates the private marketplace feature once it’s applied to Docker Desktop on your developers’ machines.
- `extensions.txt`, which determines which extensions to list in your private marketplace.
@y
- `admin-settings.json`, which activates the private marketplace feature once it’s applied to Docker Desktop on your developers’ machines.
- `extensions.txt`, which determines which extensions to list in your private marketplace.
@z

@x
## Step two: Set the behaviour
@y
## Step two: Set the behaviour
@z

@x
The generated `admin-settings.json` file includes various settings you can modify.
@y
The generated `admin-settings.json` file includes various settings you can modify.
@z

@x
Each setting has a `value` that you can set, including a `locked` field that lets you lock the setting and make it unchangeable by your developers.
@y
Each setting has a `value` that you can set, including a `locked` field that lets you lock the setting and make it unchangeable by your developers.
@z

@x
- `extensionsEnabled` enables Docker Extensions.
- `extensionsPrivateMarketplace` activates the private marketplace and ensures Docker Desktop connects to content defined and controlled by the administrator instead of the public Docker marketplace.
- `onlyMarketplaceExtensions` allows or blocks developers from installing other extensions by using the command line. Teams developing new extensions must have this setting unlocked (`"locked": false`) to install and test extensions being developed.
- `extensionsPrivateMarketplaceAdminContactURL` defines a contact link for developers to request new extensions in the private marketplace. If `value` is empty then no link is shown to your developers on Docker Desktop, otherwise this can be either an HTTP link or a “mailto:” link. For example,
@y
- `extensionsEnabled` enables Docker Extensions.
- `extensionsPrivateMarketplace` activates the private marketplace and ensures Docker Desktop connects to content defined and controlled by the administrator instead of the public Docker marketplace.
- `onlyMarketplaceExtensions` allows or blocks developers from installing other extensions by using the command line. Teams developing new extensions must have this setting unlocked (`"locked": false`) to install and test extensions being developed.
- `extensionsPrivateMarketplaceAdminContactURL` defines a contact link for developers to request new extensions in the private marketplace. If `value` is empty then no link is shown to your developers on Docker Desktop, otherwise this can be either an HTTP link or a “mailto:” link. For example,
@z

% snip code...

@x
To find out more information about the `admin-settings.json` file, see [Settings Management](/security/for-admins/hardened-desktop/settings-management/_index.md).
@y
To find out more information about the `admin-settings.json` file, see [Settings Management](security/for-admins/hardened-desktop/settings-management/_index.md).
@z

@x
## Step three: List allowed extensions 
@y
## Step three: List allowed extensions 
@z

@x
The generated `extensions.txt` file defines the list of extensions that are available in your private marketplace.
@y
The generated `extensions.txt` file defines the list of extensions that are available in your private marketplace.
@z

@x
Each line in the file is an allowed extension and follows the format of `org/repo:tag`.
@y
Each line in the file is an allowed extension and follows the format of `org/repo:tag`.
@z

@x
For example, if you want to permit the Disk Usage extension you would enter the following into your `extensions.txt` file:
@y
For example, if you want to permit the Disk Usage extension you would enter the following into your `extensions.txt` file:
@z

% snip command...

@x
If no tag is provided, the latest tag available for the image is used. You can also comment out lines with `#` so the extension is ignored.
@y
If no tag is provided, the latest tag available for the image is used. You can also comment out lines with `#` so the extension is ignored.
@z

@x
This list can include different types of extension images: 
@y
This list can include different types of extension images: 
@z

@x
- Extensions from the public marketplace or any public image stored in Docker Hub.
- Extension images stored in Docker Hub as private images. Developers need to be signed in and have pull access to these images.
- Extension images stored in a private registry. Developers need to be signed in and have pull access to these images.
@y
- Extensions from the public marketplace or any public image stored in Docker Hub.
- Extension images stored in Docker Hub as private images. Developers need to be signed in and have pull access to these images.
- Extension images stored in a private registry. Developers need to be signed in and have pull access to these images.
@z

@x
> [!IMPORTANT]
> 
> Your developers can only install the version of the extension that you’ve listed.
@y
> [!IMPORTANT]
> 
> Your developers can only install the version of the extension that you’ve listed.
@z

@x
## Step four: Generate the private marketplace
@y
## Step four: Generate the private marketplace
@z

@x
Once the list in `extensions.txt` is ready, you can generate the marketplace:
@y
Once the list in `extensions.txt` is ready, you can generate the marketplace:
@z

@x
{{< tabs group="os_version" >}}
{{< tab name="Mac" >}}
@y
{{< tabs group="os_version" >}}
{{< tab name="Mac" >}}
@z

% snip command...

@x
{{< /tab >}}
{{< tab name="Windows" >}}
@y
{{< /tab >}}
{{< tab name="Windows" >}}
@z

% snip command...

@x
{{< /tab >}}
{{< tab name="Linux" >}}
@y
{{< /tab >}}
{{< tab name="Linux" >}}
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
This creates an `extension-marketplace` directory and downloads the marketplace metadata for all the allowed extensions.
@y
This creates an `extension-marketplace` directory and downloads the marketplace metadata for all the allowed extensions.
@z

@x
The marketplace content is generated from extension image information as image labels, which is the [same format as public extensions](extensions-sdk/extensions/labels.md). It includes the extension title, description, screenshots, links, etc. 
@y
The marketplace content is generated from extension image information as image labels, which is the [same format as public extensions](extensions-sdk/extensions/labels.md). It includes the extension title, description, screenshots, links, etc. 
@z

@x
## Step five: Test the private marketplace setup
@y
## Step five: Test the private marketplace setup
@z

@x
It's recommended that you try the private marketplace on your Docker Desktop installation.
@y
It's recommended that you try the private marketplace on your Docker Desktop installation.
@z

@x
1. Run the following command in your terminal. This command automatically copies the generated files to the location where Docker Desktop reads the configuration files. Depending on your operating system, the location is:
@y
1. Run the following command in your terminal. This command automatically copies the generated files to the location where Docker Desktop reads the configuration files. Depending on your operating system, the location is:
@z

@x
    - Mac: `/Library/Application\ Support/com.docker.docker`
    - Windows: `C:\ProgramData\DockerDesktop`
    - Linux: `/usr/share/docker-desktop`
@y
    - Mac: `/Library/Application\ Support/com.docker.docker`
    - Windows: `C:\ProgramData\DockerDesktop`
    - Linux: `/usr/share/docker-desktop`
@z

@x
   {{< tabs group="os_version" >}}
   {{< tab name="Mac" >}}
@y
   {{< tabs group="os_version" >}}
   {{< tab name="Mac" >}}
@z

% snip command...

@x
   {{< /tab >}}
   {{< tab name="Windows (run as admin)" >}}
@y
   {{< /tab >}}
   {{< tab name="Windows (run as admin)" >}}
@z

% snip command...

@x
   {{< /tab >}}
   {{< tab name="Linux" >}}
@y
   {{< /tab >}}
   {{< tab name="Linux" >}}
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
2. Quit and re-open Docker Desktop. 
3. Sign in with a Docker account.
@y
2. Quit and re-open Docker Desktop. 
3. Sign in with a Docker account.
@z

@x
When you select the **Extensions** tab, you should see the private marketplace listing only the extensions you have allowed in `extensions.txt`.
@y
When you select the **Extensions** tab, you should see the private marketplace listing only the extensions you have allowed in `extensions.txt`.
@z

@x __SUBDIR__ 対応
![Extensions Private Marketplace](/assets/images/extensions-private-marketplace.webp)
@y
![Extensions Private Marketplace](assets/images/extensions-private-marketplace.webp)
@z

@x
## Step six: Distribute the private marketplace
@y
## Step six: Distribute the private marketplace
@z

@x
Once you’ve confirmed that the private marketplace configuration works, the final step is to distribute the files to the developers’ machines with the MDM software your organization uses. For example, [Jamf](https://www.jamf.com/).
@y
Once you’ve confirmed that the private marketplace configuration works, the final step is to distribute the files to the developers’ machines with the MDM software your organization uses. For example, [Jamf](https://www.jamf.com/).
@z

@x
The files to distribute are: 
* `admin-settings.json`
* the entire `extension-marketplace` folder and its subfolders
@y
The files to distribute are: 
* `admin-settings.json`
* the entire `extension-marketplace` folder and its subfolders
@z

@x
These files must be placed on developer's machines. Depending on your operating system, the target location is (as mentioned above):
@y
These files must be placed on developer's machines. Depending on your operating system, the target location is (as mentioned above):
@z

@x
- Mac: `/Library/Application\ Support/com.docker.docker`
- Windows: `C:\ProgramData\DockerDesktop`
- Linux: `/usr/share/docker-desktop`
@y
- Mac: `/Library/Application\ Support/com.docker.docker`
- Windows: `C:\ProgramData\DockerDesktop`
- Linux: `/usr/share/docker-desktop`
@z

@x
Make sure your developers are signed in to Docker Desktop in order for the private marketplace configuration to take effect. As an administrator, you should [enforce sign-in](/security/for-admins/enforce-sign-in/_index.md).
@y
Make sure your developers are signed in to Docker Desktop in order for the private marketplace configuration to take effect. As an administrator, you should [enforce sign-in](security/for-admins/enforce-sign-in/_index.md).
@z

@x
## Feedback
@y
## Feedback
@z

@x
Give feedback or report any bugs you may find by emailing `extensions@docker.com`.
@y
Give feedback or report any bugs you may find by emailing `extensions@docker.com`.
@z
