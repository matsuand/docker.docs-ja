%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Install Docker for Mac to get started. This guide covers system requirements,
  where to download, and instructions on how to install and update.
keywords: docker for mac, install docker macos, docker mac, docker mac install, docker
  install macos, install docker on mac, install docker macbook, docker desktop for
  mac, how to install docker on mac, setup docker on mac
title: Install Docker Desktop on Mac
aliases:
- /desktop/mac/install/
- /docker-for-mac/install/
- /engine/installation/mac/
- /installation/mac/
- /docker-for-mac/apple-m1/
- /docker-for-mac/apple-silicon/
- /desktop/mac/apple-silicon/
---
@y
---
description: Install Docker for Mac to get started. This guide covers system requirements,
  where to download, and instructions on how to install and update.
keywords: docker for mac, install docker macos, docker mac, docker mac install, docker
  install macos, install docker on mac, install docker macbook, docker desktop for
  mac, how to install docker on mac, setup docker on mac
title: Install Docker Desktop on Mac
aliases:
- /desktop/mac/install/
- /docker-for-mac/install/
- /engine/installation/mac/
- /installation/mac/
- /docker-for-mac/apple-m1/
- /docker-for-mac/apple-silicon/
- /desktop/mac/apple-silicon/
---
@z

@x
This page contains download URLs, information about system requirements, and instructions on how to install Docker Desktop for Mac.
@y
This page contains download URLs, information about system requirements, and instructions on how to install Docker Desktop for Mac.
@z

@x
{{< button text="Docker Desktop for Mac with Apple silicon" url="https://desktop.docker.com/mac/main/arm64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-arm64" >}}
{{< button text="Docker Desktop for Mac with Intel chip" url="https://desktop.docker.com/mac/main/amd64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-amd64" >}}
@y
{{< button text="Docker Desktop for Mac with Apple silicon" url="https://desktop.docker.com/mac/main/arm64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-arm64" >}}
{{< button text="Docker Desktop for Mac with Intel chip" url="https://desktop.docker.com/mac/main/amd64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-amd64" >}}
@z

@x
*For checksums, see [Release notes](../release-notes.md).*
@y
*For checksums, see [Release notes](../release-notes.md).*
@z

@x
> **Docker Desktop terms**
>
> Commercial use of Docker Desktop in larger enterprises (more than 250
> employees OR more than $10 million USD in annual revenue) requires a paid
> subscription.
@y
> **Docker Desktop terms**
>
> Commercial use of Docker Desktop in larger enterprises (more than 250
> employees OR more than $10 million USD in annual revenue) requires a paid
> subscription.
@z

@x
## System requirements
@y
## System requirements
@z

@x
{{< tabs >}}
{{< tab name="Mac with Intel chip" >}}
@y
{{< tabs >}}
{{< tab name="Mac with Intel chip" >}}
@z

@x
- A supported version of macOS.
@y
- A supported version of macOS.
@z

@x
  > **Important**
  >
  > Docker supports Docker Desktop on the most recent versions of macOS. That is, the current release of macOS and the previous two releases. As new major versions of macOS are made generally available, Docker stops supporting the oldest version and supports the newest version of macOS (in addition to the previous two releases).
  { .important }
@y
  > **Important**
  >
  > Docker supports Docker Desktop on the most recent versions of macOS. That is, the current release of macOS and the previous two releases. As new major versions of macOS are made generally available, Docker stops supporting the oldest version and supports the newest version of macOS (in addition to the previous two releases).
  { .important }
@z

@x
- At least 4 GB of RAM.
@y
- At least 4 GB of RAM.
@z

@x
{{< /tab >}}
{{< tab name="Mac with Apple silicon" >}}
@y
{{< /tab >}}
{{< tab name="Mac with Apple silicon" >}}
@z

@x
- A supported version of macOS.
@y
- A supported version of macOS.
@z

@x
  > **Important**
  >
  > Docker supports Docker Desktop on the most recent versions of macOS. That is, the current release of macOS and the previous two releases. As new major versions of macOS are made generally available, Docker stops supporting the oldest version and supports the newest version of macOS (in addition to the previous two releases).
  { .important }
@y
  > **Important**
  >
  > Docker supports Docker Desktop on the most recent versions of macOS. That is, the current release of macOS and the previous two releases. As new major versions of macOS are made generally available, Docker stops supporting the oldest version and supports the newest version of macOS (in addition to the previous two releases).
  { .important }
@z

@x
- At least 4 GB of RAM.
@y
- At least 4 GB of RAM.
@z

@x
Beginning with Docker Desktop 4.3.0, we have removed the hard requirement to install Rosetta 2. There are a few optional command line tools that still require Rosetta 2 when using Darwin/AMD64. See [Known issues](../troubleshoot/known-issues.md). However, to get the best experience, we recommend that you install Rosetta 2. To install Rosetta 2 manually from the command line, run the following command:
@y
Beginning with Docker Desktop 4.3.0, we have removed the hard requirement to install Rosetta 2. There are a few optional command line tools that still require Rosetta 2 when using Darwin/AMD64. See [Known issues](../troubleshoot/known-issues.md). However, to get the best experience, we recommend that you install Rosetta 2. To install Rosetta 2 manually from the command line, run the following command:
@z

@x
  ```console
  $ softwareupdate --install-rosetta
  ```
{{< /tab >}}
{{< /tabs >}}
@y
  ```console
  $ softwareupdate --install-rosetta
  ```
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Install and run Docker Desktop on Mac
@y
## Install and run Docker Desktop on Mac
@z

@x
{{< tabs >}}
{{< tab name="Install interactively" >}}
@y
{{< tabs >}}
{{< tab name="Install interactively" >}}
@z

@x
1. Double-click `Docker.dmg` to open the installer, then drag the Docker icon to
    the **Applications** folder.
@y
1. Double-click `Docker.dmg` to open the installer, then drag the Docker icon to
    the **Applications** folder.
@z

@x
2. Double-click `Docker.app` in the **Applications** folder to start Docker.
@y
2. Double-click `Docker.app` in the **Applications** folder to start Docker.
@z

@x
3. The Docker menu displays the Docker Subscription Service Agreement.
@y
3. The Docker menu displays the Docker Subscription Service Agreement.
@z

@x
    Here’s a summary of the key points: 
    - Docker Desktop is free for small businesses (fewer than 250 employees AND less than $10 million in annual revenue), personal use, education, and non-commercial open source projects.
    - Otherwise, it requires a paid subscription for professional use.
    - Paid subscriptions are also required for government entities.
    - Docker Pro, Team, and Business subscriptions include commercial use of Docker Desktop.
@y
    Here’s a summary of the key points: 
    - Docker Desktop is free for small businesses (fewer than 250 employees AND less than $10 million in annual revenue), personal use, education, and non-commercial open source projects.
    - Otherwise, it requires a paid subscription for professional use.
    - Paid subscriptions are also required for government entities.
    - Docker Pro, Team, and Business subscriptions include commercial use of Docker Desktop.
@z

@x
4. Select **Accept** to continue. 
@y
4. Select **Accept** to continue. 
@z

@x
   Note that Docker Desktop won't run if you do not agree to the terms. You can choose to accept the terms at a later date by opening Docker Desktop.
@y
   Note that Docker Desktop won't run if you do not agree to the terms. You can choose to accept the terms at a later date by opening Docker Desktop.
@z

@x
   For more information, see [Docker Desktop Subscription Service Agreement](https://www.docker.com/legal/docker-subscription-service-agreement). We recommend that you also read the [FAQs](https://www.docker.com/pricing/faq).
5. From the installation window, select either: 
   - **Use recommended settings (Requires password)**. This let's Docker Desktop automatically set the necessary configuration settings. 
   - **Use advanced settings**. You can then set the location of the Docker CLI tools either in the system or user directory, enable the default Docker socket, and enable privileged port mapping. See [Settings](../settings/mac.md#advanced), for more information and how to set the location of the Docker CLI tools.
6. Select **Finish**. If you have applied any of the above configurations that require a password in step 5, enter your password to confirm your choice.  
@y
   For more information, see [Docker Desktop Subscription Service Agreement](https://www.docker.com/legal/docker-subscription-service-agreement). We recommend that you also read the [FAQs](https://www.docker.com/pricing/faq).
5. From the installation window, select either: 
   - **Use recommended settings (Requires password)**. This let's Docker Desktop automatically set the necessary configuration settings. 
   - **Use advanced settings**. You can then set the location of the Docker CLI tools either in the system or user directory, enable the default Docker socket, and enable privileged port mapping. See [Settings](../settings/mac.md#advanced), for more information and how to set the location of the Docker CLI tools.
6. Select **Finish**. If you have applied any of the above configurations that require a password in step 5, enter your password to confirm your choice.  
@z

@x
{{< /tab >}}
{{< tab name="Install from the command line" >}}
@y
{{< /tab >}}
{{< tab name="Install from the command line" >}}
@z

@x
After downloading `Docker.dmg`, run the following commands in a terminal to install Docker Desktop in the **Applications** folder:
@y
After downloading `Docker.dmg`, run the following commands in a terminal to install Docker Desktop in the **Applications** folder:
@z

@x
```console
$ sudo hdiutil attach Docker.dmg
$ sudo /Volumes/Docker/Docker.app/Contents/MacOS/install
$ sudo hdiutil detach /Volumes/Docker
```
@y
```console
$ sudo hdiutil attach Docker.dmg
$ sudo /Volumes/Docker/Docker.app/Contents/MacOS/install
$ sudo hdiutil detach /Volumes/Docker
```
@z

@x
As macOS typically performs security checks the first time an application is used, the `install` command can take several minutes to run.
@y
As macOS typically performs security checks the first time an application is used, the `install` command can take several minutes to run.
@z

@x
The `install` command accepts the following flags:
- `--accept-license`: Accepts the [Docker Subscription Service Agreement](https://www.docker.com/legal/docker-subscription-service-agreement) now, rather than requiring it to be accepted when the application is first run.
- `--allowed-org=<org name>`: Requires the user to sign in and be part of the specified Docker Hub organization when running the application
- `--user=<username>`: Performs the privileged configurations once during installation. This removes the need for the user to grant root privileges on first run. For more information, see [Privileged helper permission requirements](../mac/permission-requirements.md#permission-requirements). To find the username, enter `ls /Users` in the CLI.
- `--admin-settings`: Automatically creates an `admin-settings.json` file which is used by administrators to control certain Docker Desktop settings on client machines within their organization. For more information, see [Settings Management](../hardened-desktop/settings-management/index.md).
  - It must be used together with the `--allowed-org=<org name>` flag. 
  - For example:
    `--allowed-org=<org name> --admin-settings='{"configurationFileVersion": 2, "enhancedContainerIsolation": {"value": true, "locked": false}}'`
- `--proxy-http-mode=<mode>`: Sets the HTTP Proxy mode. The two modes are `system` (default) or `manual`.
- `--override-proxy-http=<URL>`: Sets the URL of the HTTP proxy that must be used for outgoing HTTP requests. It requires `--proxy-http-mode` to be `manual`.
- `--override-proxy-https=<URL>`: Sets the URL of the HTTP proxy that must be used for outgoing HTTPS requests, requires `--proxy-http-mode` to be `manual`
- `--override-proxy-exclude=<hosts/domains>`: Bypasses proxy settings for the hosts and domains. It's a comma-separated list.
@y
The `install` command accepts the following flags:
- `--accept-license`: Accepts the [Docker Subscription Service Agreement](https://www.docker.com/legal/docker-subscription-service-agreement) now, rather than requiring it to be accepted when the application is first run.
- `--allowed-org=<org name>`: Requires the user to sign in and be part of the specified Docker Hub organization when running the application
- `--user=<username>`: Performs the privileged configurations once during installation. This removes the need for the user to grant root privileges on first run. For more information, see [Privileged helper permission requirements](../mac/permission-requirements.md#permission-requirements). To find the username, enter `ls /Users` in the CLI.
- `--admin-settings`: Automatically creates an `admin-settings.json` file which is used by administrators to control certain Docker Desktop settings on client machines within their organization. For more information, see [Settings Management](../hardened-desktop/settings-management/index.md).
  - It must be used together with the `--allowed-org=<org name>` flag. 
  - For example:
    `--allowed-org=<org name> --admin-settings='{"configurationFileVersion": 2, "enhancedContainerIsolation": {"value": true, "locked": false}}'`
- `--proxy-http-mode=<mode>`: Sets the HTTP Proxy mode. The two modes are `system` (default) or `manual`.
- `--override-proxy-http=<URL>`: Sets the URL of the HTTP proxy that must be used for outgoing HTTP requests. It requires `--proxy-http-mode` to be `manual`.
- `--override-proxy-https=<URL>`: Sets the URL of the HTTP proxy that must be used for outgoing HTTPS requests, requires `--proxy-http-mode` to be `manual`
- `--override-proxy-exclude=<hosts/domains>`: Bypasses proxy settings for the hosts and domains. It's a comma-separated list.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Where to go next 
@y
## Where to go next 
@z

@x
- [Get started with Docker](../../get-started/index.md) provides a general Docker tutorial.
- [Explore Docker Desktop](../use-desktop/index.md) and all its features.
- [Troubleshooting](../troubleshoot/overview.md) describes common problems, workarounds, how
  to run and submit diagnostics, and submit issues.
- [FAQs](../faqs/general.md) provide answers to frequently asked questions.
- [Release notes](../release-notes.md) lists component updates, new features, and improvements associated with Docker Desktop releases.
- [Back up and restore data](../backup-and-restore.md) provides instructions
  on backing up and restoring data related to Docker.
@y
- [Get started with Docker](../../get-started/index.md) provides a general Docker tutorial.
- [Explore Docker Desktop](../use-desktop/index.md) and all its features.
- [Troubleshooting](../troubleshoot/overview.md) describes common problems, workarounds, how
  to run and submit diagnostics, and submit issues.
- [FAQs](../faqs/general.md) provide answers to frequently asked questions.
- [Release notes](../release-notes.md) lists component updates, new features, and improvements associated with Docker Desktop releases.
- [Back up and restore data](../backup-and-restore.md) provides instructions
  on backing up and restoring data related to Docker.
@z
