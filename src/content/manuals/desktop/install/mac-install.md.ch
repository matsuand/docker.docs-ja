%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Install Docker for Mac to get started. This guide covers system requirements,
  where to download, and instructions on how to install and update.
keywords: docker for mac, install docker macos, docker mac, docker mac install, docker
  install macos, install docker on mac, install docker macbook, docker desktop for
  mac, how to install docker on mac, setup docker on mac
title: Install Docker Desktop on Mac
@y
description: Install Docker for Mac to get started. This guide covers system requirements,
  where to download, and instructions on how to install and update.
keywords: docker for mac, install docker macos, docker mac, docker mac install, docker
  install macos, install docker on mac, install docker macbook, docker desktop for
  mac, how to install docker on mac, setup docker on mac
title: Mac への Docker Desktop のインストール
@z

@x
> **Docker Desktop terms**
>
> Commercial use of Docker Desktop in larger enterprises (more than 250
> employees OR more than $10 million USD in annual revenue) requires a [paid
> subscription](https://www.docker.com/pricing/).
@y
> **Docker Desktop 契約条項**
>
> より大きなエンタープライズ向け（従業員 250 名以上、あるいは年間収益 1 千万 US ドル以上）に Docker Desktop を商用利用する場合は、[有償サブスクリプション](https://www.docker.com/pricing/) が必要です。
@z

@x
This page contains download URLs, information about system requirements, and instructions on how to install Docker Desktop for Mac.
@y
このページでは Docker Desktop for Mac をインストールするための、ダウンロード情報、システム要件、インストール手順について説明します。
@z

@x
{{< button text="Docker Desktop for Mac with Apple silicon" url="https://desktop.docker.com/mac/main/arm64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-arm64" >}}
{{< button text="Docker Desktop for Mac with Intel chip" url="https://desktop.docker.com/mac/main/amd64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-amd64" >}}
@y
{{< button text="Docker Desktop for Mac、Apple silicon 向け" url="https://desktop.docker.com/mac/main/arm64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-arm64" >}}
{{< button text="Docker Desktop for Mac、Intel chip 向け" url="https://desktop.docker.com/mac/main/amd64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-amd64" >}}
@z

@x
*For checksums, see [Release notes](../release-notes.md).*
@y
*チェックサムについては [リリースノート](../release-notes.md) を参照してください。*
@z

@x
## System requirements
@y
## システム要件 {#system-requirements}
@z

@x
{{< tabs >}}
{{< tab name="Mac with Intel chip" >}}
@y
{{< tabs >}}
{{< tab name="Intel チップ Mac の場合" >}}
@z

@x
- A supported version of macOS.
@y
- A supported version of macOS.
@z

@x
  > [!IMPORTANT]
  >
  > Docker supports Docker Desktop on the most recent versions of macOS. That is, the current release of macOS and the previous two releases. As new major versions of macOS are made generally available, Docker stops supporting the oldest version and supports the newest version of macOS (in addition to the previous two releases).
@y
  > [!IMPORTANT]
  >
  > Docker supports Docker Desktop on the most recent versions of macOS. That is, the current release of macOS and the previous two releases. As new major versions of macOS are made generally available, Docker stops supporting the oldest version and supports the newest version of macOS (in addition to the previous two releases).
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
{{< tab name="Apple silicon Mac の場合" >}}
@z

@x
- A supported version of macOS.
@y
- A supported version of macOS.
@z

@x
  > [!IMPORTANT]
  >
  > Docker supports Docker Desktop on the most recent versions of macOS. That is, the current release of macOS and the previous two releases. As new major versions of macOS are made generally available, Docker stops supporting the oldest version and supports the newest version of macOS (in addition to the previous two releases).
@y
  > [!IMPORTANT]
  >
  > Docker supports Docker Desktop on the most recent versions of macOS. That is, the current release of macOS and the previous two releases. As new major versions of macOS are made generally available, Docker stops supporting the oldest version and supports the newest version of macOS (in addition to the previous two releases).
@z

@x
- At least 4 GB of RAM.
- For the best experience, it's recommended that you install Rosetta 2. There is no longer a hard requirement to install Rosetta 2, however there are a few optional command line tools that still require Rosetta 2 when using Darwin/AMD64. See [Known issues](../troubleshoot/known-issues.md). To install Rosetta 2 manually from the command line, run the following command:
@y
- At least 4 GB of RAM.
- For the best experience, it's recommended that you install Rosetta 2. There is no longer a hard requirement to install Rosetta 2, however there are a few optional command line tools that still require Rosetta 2 when using Darwin/AMD64. See [Known issues](../troubleshoot/known-issues.md). To install Rosetta 2 manually from the command line, run the following command:
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
## Install and run Docker Desktop on Mac
@y
## Install and run Docker Desktop on Mac
@z

@x
### Install interactively
@y
### Install interactively
@z

@x
1. Download the installer using the download buttons at the top of the page, or from the [release notes](../release-notes.md).
@y
1. Download the installer using the download buttons at the top of the page, or from the [release notes](../release-notes.md).
@z

@x
2. Double-click `Docker.dmg` to open the installer, then drag the Docker icon to the **Applications** folder. By default, Docker Desktop is installed at `/Applications/Docker.app`.
@y
2. Double-click `Docker.dmg` to open the installer, then drag the Docker icon to the **Applications** folder. By default, Docker Desktop is installed at `/Applications/Docker.app`.
@z

@x
3. Double-click `Docker.app` in the **Applications** folder to start Docker.
@y
3. Double-click `Docker.app` in the **Applications** folder to start Docker.
@z

@x
4. The Docker menu displays the Docker Subscription Service Agreement.
@y
4. The Docker menu displays the Docker Subscription Service Agreement.
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
5. Select **Accept** to continue. 
@y
5. Select **Accept** to continue. 
@z

@x
   Note that Docker Desktop won't run if you do not agree to the terms. You can choose to accept the terms at a later date by opening Docker Desktop.
@y
   Note that Docker Desktop won't run if you do not agree to the terms. You can choose to accept the terms at a later date by opening Docker Desktop.
@z

@x
   For more information, see [Docker Desktop Subscription Service Agreement](https://www.docker.com/legal/docker-subscription-service-agreement). It is recommended that you also read the [FAQs](https://www.docker.com/pricing/faq).
@y
   For more information, see [Docker Desktop Subscription Service Agreement](https://www.docker.com/legal/docker-subscription-service-agreement). It is recommended that you also read the [FAQs](https://www.docker.com/pricing/faq).
@z

@x
6. From the installation window, select either: 
   - **Use recommended settings (Requires password)**. This lets Docker Desktop automatically set the necessary configuration settings. 
   - **Use advanced settings**. You can then set the location of the Docker CLI tools either in the system or user directory, enable the default Docker socket, and enable privileged port mapping. See [Settings](/manuals/desktop/settings.md#advanced), for more information and how to set the location of the Docker CLI tools.
@y
6. From the installation window, select either: 
   - **Use recommended settings (Requires password)**. This lets Docker Desktop automatically set the necessary configuration settings. 
   - **Use advanced settings**. You can then set the location of the Docker CLI tools either in the system or user directory, enable the default Docker socket, and enable privileged port mapping. See [Settings](manuals/desktop/settings.md#advanced), for more information and how to set the location of the Docker CLI tools.
@z

@x
7. Select **Finish**. If you have applied any of the previous configurations that require a password in step 6, enter your password to confirm your choice.  
@y
7. Select **Finish**. If you have applied any of the previous configurations that require a password in step 6, enter your password to confirm your choice.  
@z

@x
### Install from the command line
@y
### Install from the command line
@z

@x
After downloading `Docker.dmg` from either the download buttons at the top of the page or from the [release notes](../release-notes.md), run the following commands in a terminal to install Docker Desktop in the **Applications** folder:
@y
After downloading `Docker.dmg` from either the download buttons at the top of the page or from the [release notes](../release-notes.md), run the following commands in a terminal to install Docker Desktop in the **Applications** folder:
@z

% snip command...

@x
By default, Docker Desktop is installed at `/Applications/Docker.app`. As macOS typically performs security checks the first time an application is used, the `install` command can take several minutes to run.
@y
By default, Docker Desktop is installed at `/Applications/Docker.app`. As macOS typically performs security checks the first time an application is used, the `install` command can take several minutes to run.
@z

@x
The `install` command accepts the following flags:
- `--accept-license`: Accepts the [Docker Subscription Service Agreement](https://www.docker.com/legal/docker-subscription-service-agreement) now, rather than requiring it to be accepted when the application is first run.
- `--allowed-org=<org name>`: Requires the user to sign in and be part of the specified Docker Hub organization when running the application
- `--user=<username>`: Performs the privileged configurations once during installation. This removes the need for the user to grant root privileges on first run. For more information, see [Privileged helper permission requirements](/manuals/desktop/install/mac-permission-requirements.md#permission-requirements). To find the username, enter `ls /Users` in the CLI.
- `--admin-settings`: Automatically creates an `admin-settings.json` file which is used by administrators to control certain Docker Desktop settings on client machines within their organization. For more information, see [Settings Management](/manuals/security/for-admins/hardened-desktop/settings-management/_index.md).
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
- `--user=<username>`: Performs the privileged configurations once during installation. This removes the need for the user to grant root privileges on first run. For more information, see [Privileged helper permission requirements](manuals/desktop/install/mac-permission-requirements.md#permission-requirements). To find the username, enter `ls /Users` in the CLI.
- `--admin-settings`: Automatically creates an `admin-settings.json` file which is used by administrators to control certain Docker Desktop settings on client machines within their organization. For more information, see [Settings Management](manuals/security/for-admins/hardened-desktop/settings-management/_index.md).
  - It must be used together with the `--allowed-org=<org name>` flag. 
  - For example:
    `--allowed-org=<org name> --admin-settings='{"configurationFileVersion": 2, "enhancedContainerIsolation": {"value": true, "locked": false}}'`
- `--proxy-http-mode=<mode>`: Sets the HTTP Proxy mode. The two modes are `system` (default) or `manual`.
- `--override-proxy-http=<URL>`: Sets the URL of the HTTP proxy that must be used for outgoing HTTP requests. It requires `--proxy-http-mode` to be `manual`.
- `--override-proxy-https=<URL>`: Sets the URL of the HTTP proxy that must be used for outgoing HTTPS requests, requires `--proxy-http-mode` to be `manual`
- `--override-proxy-exclude=<hosts/domains>`: Bypasses proxy settings for the hosts and domains. It's a comma-separated list.
@z

@x
> [!TIP]
>
> As an IT administrator, you can use endpoint management (MDM) software to identify the number of Docker Desktop instances and their versions within your environment. This can provide accurate license reporting, help ensure your machines use the latest version of Docker Desktop, and enable you to [enforce sign-in](/manuals/security/for-admins/enforce-sign-in/_index.md).
> - [Intune](https://learn.microsoft.com/en-us/mem/intune/apps/app-discovered-apps)
> - [Jamf](https://docs.jamf.com/10.25.0/jamf-pro/administrator-guide/Application_Usage.html)
> - [Kandji](https://support.kandji.io/support/solutions/articles/72000559793-view-a-device-application-list)
> - [Kolide](https://www.kolide.com/features/device-inventory/properties/mac-apps)
> - [Workspace One](https://blogs.vmware.com/euc/2022/11/how-to-use-workspace-one-intelligence-to-manage-app-licenses-and-reduce-costs.html)
@y
> [!TIP]
>
> As an IT administrator, you can use endpoint management (MDM) software to identify the number of Docker Desktop instances and their versions within your environment. This can provide accurate license reporting, help ensure your machines use the latest version of Docker Desktop, and enable you to [enforce sign-in](manuals/security/for-admins/enforce-sign-in/_index.md).
> - [Intune](https://learn.microsoft.com/en-us/mem/intune/apps/app-discovered-apps)
> - [Jamf](https://docs.jamf.com/10.25.0/jamf-pro/administrator-guide/Application_Usage.html)
> - [Kandji](https://support.kandji.io/support/solutions/articles/72000559793-view-a-device-application-list)
> - [Kolide](https://www.kolide.com/features/device-inventory/properties/mac-apps)
> - [Workspace One](https://blogs.vmware.com/euc/2022/11/how-to-use-workspace-one-intelligence-to-manage-app-licenses-and-reduce-costs.html)
@z

@x
## Where to go next 
@y
## Where to go next 
@z

@x
- Explore [Docker's core subscriptions](https://www.docker.com/pricing/) to see what Docker can offer you. 
- [Get started with Docker](/get-started/introduction/_index.md).
- [Explore Docker Desktop](../use-desktop/_index.md) and all its features.
- [Troubleshooting](/manuals/desktop/troubleshoot/_index.md) describes common problems, workarounds, how
  to run and submit diagnostics, and submit issues.
- [FAQs](../faqs/general.md) provide answers to frequently asked questions.
- [Release notes](../release-notes.md) lists component updates, new features, and improvements associated with Docker Desktop releases.
- [Back up and restore data](../backup-and-restore.md) provides instructions
  on backing up and restoring data related to Docker.
@y
- Explore [Docker's core subscriptions](https://www.docker.com/pricing/) to see what Docker can offer you. 
- [Get started with Docker](get-started/introduction/_index.md).
- [Explore Docker Desktop](../use-desktop/_index.md) and all its features.
- [Troubleshooting](manuals/desktop/troubleshoot/_index.md) describes common problems, workarounds, how
  to run and submit diagnostics, and submit issues.
- [FAQs](../faqs/general.md) provide answers to frequently asked questions.
- [Release notes](../release-notes.md) lists component updates, new features, and improvements associated with Docker Desktop releases.
- [Back up and restore data](../backup-and-restore.md) provides instructions
  on backing up and restoring data related to Docker.
@z
