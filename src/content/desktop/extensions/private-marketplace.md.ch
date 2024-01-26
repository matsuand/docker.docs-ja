%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: How to configure and use Docker Extensions' private marketplace
keywords: Docker Extensions, Docker Desktop, Linux, Mac, Windows, Marketplace, marketplace
title: Configure a private marketplace for extensions
---
@y
---
description: How to configure and use Docker Extensions' private marketplace
keywords: Docker Extensions, Docker Desktop, Linux, Mac, Windows, Marketplace, marketplace
title: Configure a private marketplace for extensions
---
@z

@x
> **Beta**
>
> This feature is currently in [Beta](../../release-lifecycle.md#beta). It is available to Docker Business customers only.
{ .experimental }
@y
> **Beta**
>
> This feature is currently in [Beta](../../release-lifecycle.md#beta). It is available to Docker Business customers only.
{ .experimental }
@z

@x
Learn how to configure and set up a private marketplace with a curated list of extensions for your Docker Desktop users.
@y
Learn how to configure and set up a private marketplace with a curated list of extensions for your Docker Desktop users.
@z

@x
It is designed specifically for organizations who don’t give developers root access to their machines.
@y
It is designed specifically for organizations who don’t give developers root access to their machines.
@z

@x
Docker Extensions' private marketplace feature makes use of [Settings Management](../hardened-desktop/settings-management/_index.md) so admins have complete control over the private marketplace.
@y
Docker Extensions' private marketplace feature makes use of [Settings Management](../hardened-desktop/settings-management/_index.md) so admins have complete control over the private marketplace.
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

@x
   ```console
   $ mkdir my-marketplace
   $ cd my-marketplace
   ```
@y
   ```console
   $ mkdir my-marketplace
   $ cd my-marketplace
   ```
@z

@x
2. Initialize the configuration files for your marketplace:
@y
2. Initialize the configuration files for your marketplace:
@z

@x
   {{< tabs >}}
   {{< tab name="Mac" >}}
@y
   {{< tabs >}}
   {{< tab name="Mac" >}}
@z

@x
   ```console
   $ /Applications/Docker.app/Contents/Resources/bin/extension-admin init
   ```
@y
   ```console
   $ /Applications/Docker.app/Contents/Resources/bin/extension-admin init
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
   ```console
   $ C:\Program Files\Docker\Docker\resources\bin\extension-admin init
   ```
@y
   ```console
   $ C:\Program Files\Docker\Docker\resources\bin\extension-admin init
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
   ```console
   $ /opt/docker-desktop/extension-admin init
   ```
@y
   ```console
   $ /opt/docker-desktop/extension-admin init
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
## Step two: Set the private marketplace behaviour
@y
## Step two: Set the private marketplace behaviour
@z

@x
The generated `admin-settings.json` file includes various settings you can modify.
@y
The generated `admin-settings.json` file includes various settings you can modify.
@z

@x
Each setting has a `value` that you can set, including a `locked` field that allows you to lock the setting and make it unchangeable by your developers.
@y
Each setting has a `value` that you can set, including a `locked` field that allows you to lock the setting and make it unchangeable by your developers.
@z

@x
- `extensionsEnabled` enables Docker Extensions
- `extensionsPrivateMarketplace` activates the private marketplace and ensures Docker Desktop connects to content defined and controlled by the administrator instead of the public Docker marketplace.
- `onlyMarketplaceExtensions` allows or blocks users from installing other extensions by using the command line. Teams developing new extensions must have this setting unlocked (`"locked": false`) to install and test extensions being developed
- `extensionsPrivateMarketplaceAdminContactURL` defines a contact link for users to request new extensions in the private marketplace. If `value` is empty then no link is shown to your developers on Docker Desktop, otherwise this can be either an HTTP link or a “mailto:” link. For example,
@y
- `extensionsEnabled` enables Docker Extensions
- `extensionsPrivateMarketplace` activates the private marketplace and ensures Docker Desktop connects to content defined and controlled by the administrator instead of the public Docker marketplace.
- `onlyMarketplaceExtensions` allows or blocks users from installing other extensions by using the command line. Teams developing new extensions must have this setting unlocked (`"locked": false`) to install and test extensions being developed
- `extensionsPrivateMarketplaceAdminContactURL` defines a contact link for users to request new extensions in the private marketplace. If `value` is empty then no link is shown to your developers on Docker Desktop, otherwise this can be either an HTTP link or a “mailto:” link. For example,
@z

@x
  ```json
  "extensionsPrivateMarketplaceAdminContactURL": {
    "locked": true,
    "value": "mailto:admin@acme.com"
  }
  ```
@y
  ```json
  "extensionsPrivateMarketplaceAdminContactURL": {
    "locked": true,
    "value": "mailto:admin@acme.com"
  }
  ```
@z

@x
To find out more information about the `admin-settings.json` file, see [Settings Management](../hardened-desktop/settings-management/_index.md).
@y
To find out more information about the `admin-settings.json` file, see [Settings Management](../hardened-desktop/settings-management/_index.md).
@z

@x
## Step three: List allowed extensions for the private marketplace
@y
## Step three: List allowed extensions for the private marketplace
@z

@x
The generated `extensions.txt` file defines the list of extensions that is available in your private marketplace.
@y
The generated `extensions.txt` file defines the list of extensions that is available in your private marketplace.
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

@x
```console
docker/disk-usage-extension:0.2.8
```
@y
```console
docker/disk-usage-extension:0.2.8
```
@z

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
- Extensions from the public marketplace or any public image stored in Docker Hub,
- Extension images stored in Docker Hub as private images. Users need to be signed in and have pull access to these images.
- Extension images stored in a private registry. Users need to be signed in and have pull access to these images.
@y
- Extensions from the public marketplace or any public image stored in Docker Hub,
- Extension images stored in Docker Hub as private images. Users need to be signed in and have pull access to these images.
- Extension images stored in a private registry. Users need to be signed in and have pull access to these images.
@z

@x
> **Important**
> 
> Your developers can only install the version of the extension that you’ve listed.
{ .important}
@y
> **Important**
> 
> Your developers can only install the version of the extension that you’ve listed.
{ .important}
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
{{< tabs >}}
{{< tab name="Mac" >}}
@y
{{< tabs >}}
{{< tab name="Mac" >}}
@z

@x
```console
$ /Applications/Docker.app/Contents/Resources/bin/extension-admin generate
```
@y
```console
$ /Applications/Docker.app/Contents/Resources/bin/extension-admin generate
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
```console
$ C:\Program Files\Docker\Docker\resources\bin\extension-admin generate
```
@y
```console
$ C:\Program Files\Docker\Docker\resources\bin\extension-admin generate
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
```console
$ /opt/docker-desktop/extension-admin generate
```
@y
```console
$ /opt/docker-desktop/extension-admin generate
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
This creates an `extension-marketplace` directory and downloads the marketplace metadata for all the allowed extensions.
@y
This creates an `extension-marketplace` directory and downloads the marketplace metadata for all the allowed extensions.
@z

@x
The marketplace content is generated from extension image info as image labels, which is the [same format as public extensions](../extensions-sdk/extensions/labels.md). It includes the extension title, description, screenshots, links, etc. 
@y
The marketplace content is generated from extension image info as image labels, which is the [same format as public extensions](../extensions-sdk/extensions/labels.md). It includes the extension title, description, screenshots, links, etc. 
@z

@x
## Step five: Test the private marketplace setup on your Docker Desktop installation
@y
## Step five: Test the private marketplace setup on your Docker Desktop installation
@z

@x
We recommend you try the private marketplace on your Docker Desktop installation.
@y
We recommend you try the private marketplace on your Docker Desktop installation.
@z

@x
1. Copy the relevant generated files to the location where Docker Desktop reads its configuration files.
@y
1. Copy the relevant generated files to the location where Docker Desktop reads its configuration files.
@z

@x
   {{< tabs >}}
   {{< tab name="Mac" >}}
@y
   {{< tabs >}}
   {{< tab name="Mac" >}}
@z

@x
   ```console
   $ sudo /Applications/Docker.app/Contents/Resources/bin/extension-admin apply
   ```
@y
   ```console
   $ sudo /Applications/Docker.app/Contents/Resources/bin/extension-admin apply
   ```
@z

@x
   {{< /tab >}}
   {{< tab name="Windows (run as admin)" >}}
@y
   {{< /tab >}}
   {{< tab name="Windows (run as admin)" >}}
@z

@x
   ```console
   $ C:\Program Files\Docker\Docker\resources\bin\extension-admin apply
   ```
@y
   ```console
   $ C:\Program Files\Docker\Docker\resources\bin\extension-admin apply
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
   ```console
   $ sudo /opt/docker-desktop/extension-admin apply
   ```
@y
   ```console
   $ sudo /opt/docker-desktop/extension-admin apply
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
2. Quit and reopen Docker Desktop. 
3. Sign in with an Docker account.
@y
2. Quit and reopen Docker Desktop. 
3. Sign in with an Docker account.
@z

@x
When you select the **Extensions** tab, you should see the private marketplace listing only the extensions you have allowed in `extensions.txt`.
@y
When you select the **Extensions** tab, you should see the private marketplace listing only the extensions you have allowed in `extensions.txt`.
@z

@x
![Extensions Private Marketplace](/assets/images/extensions-private-marketplace.webp)
@y
![Extensions Private Marketplace](/assets/images/extensions-private-marketplace.webp)
@z

@x
## Step six: Distribute the private marketplace to your developers’ machines
@y
## Step six: Distribute the private marketplace to your developers’ machines
@z

@x
Once you’ve confirmed that the private marketplace configuration works, the final step is to distribute the files to the developers’ machines with the MDM software your organization uses. For example, [Jamf](https://www.jamf.com/).
@y
Once you’ve confirmed that the private marketplace configuration works, the final step is to distribute the files to the developers’ machines with the MDM software your organization uses. For example, [Jamf](https://www.jamf.com/).
@z

@x
Make sure your developers are signed in to Docker Desktop in order for the private marketplace configuration to take effect. As an administrator, you should [configure a registry.json to enforce Docker Desktop sign-in](../../security/for-admins/configure-sign-in.md).
@y
Make sure your developers are signed in to Docker Desktop in order for the private marketplace configuration to take effect. As an administrator, you should [configure a registry.json to enforce Docker Desktop sign-in](../../security/for-admins/configure-sign-in.md).
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
