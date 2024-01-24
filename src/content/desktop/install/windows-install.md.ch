%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Get started with Docker for Windows. This guide covers system requirements,
  where to download, and instructions on how to install and update.
keywords: docker for windows, docker windows, docker desktop for windows, docker on
  windows, install docker windows, install docker on windows, docker windows 10, docker
  run on windows, installing docker for windows, windows containers, wsl, hyper-v
title: Install Docker Desktop on Windows
aliases:
- /desktop/windows/install/
- /docker-ee-for-windows/install/
- /docker-for-windows/install-windows-home/
- /docker-for-windows/install/
- /ee/docker-ee/windows/docker-ee/
- /engine/installation/windows/
- /engine/installation/windows/docker-ee/
- /install/windows/docker-ee/
- /install/windows/ee-preview/
- /installation/windows/
- /desktop/win/configuring-wsl/
---
@y
---
description: Get started with Docker for Windows. This guide covers system requirements,
  where to download, and instructions on how to install and update.
keywords: docker for windows, docker windows, docker desktop for windows, docker on
  windows, install docker windows, install docker on windows, docker windows 10, docker
  run on windows, installing docker for windows, windows containers, wsl, hyper-v
title: Windows への Docker Desktop のインストール
aliases:
- /desktop/windows/install/
- /docker-ee-for-windows/install/
- /docker-for-windows/install-windows-home/
- /docker-for-windows/install/
- /ee/docker-ee/windows/docker-ee/
- /engine/installation/windows/
- /engine/installation/windows/docker-ee/
- /install/windows/docker-ee/
- /install/windows/ee-preview/
- /installation/windows/
- /desktop/win/configuring-wsl/
---
@z

@x
This page contains the download URL, information about system requirements, and instructions on how to install Docker Desktop for Windows.
@y
このページでは Docker Desktop for Windows をインストールするための、ダウンロード情報、システム要件、インストール手順について説明します。
@z

@x
{{< button text="Docker Desktop for Windows" url="https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe" >}}
@y
{{< button text="Docker Desktop for Windows" url="https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe" >}}
@z

@x
_For checksums, see [Release notes](../release-notes.md)_
@y
_チェックサムについては [リリースノート](../release-notes.md)_ を参照してください。
@z

@x
> **Docker Desktop terms**
>
> Commercial use of Docker Desktop in larger enterprises (more than 250
> employees OR more than $10 million USD in annual revenue) requires a paid
> subscription.
@y
> **Docker Desktop 契約条項**
>
> より大きなエンタープライズ向け（従業員 250 名以上、あるいは年間収益 1 千万 US ドル以上）に Docker Desktop を商用利用する場合は、有償サブスクリプションが必要です。
@z

@x
## System requirements
@y
## システム要件 {#system-requirements}
@z

@x
{{< tabs >}}
{{< tab name="WSL 2 backend" >}}
@y
{{< tabs >}}
{{< tab name="WSL 2 バックエンド" >}}
@z

@x
- WSL version 1.1.3.0 or later.
- Windows 11 64-bit: Home or Pro version 21H2 or higher, or Enterprise or Education version 21H2 or higher.
- Windows 10 64-bit: 
  - We recommend Home or Pro 22H2 (build 19045) or higher, or Enterprise or Education 22H2 (build 19045) or higher. 
  - Minimum required is Home or Pro 21H2 (build 19044) or higher, or Enterprise or Education 21H2 (build 19044) or higher.
- Turn on the WSL 2 feature on Windows. For detailed instructions, refer to the
  [Microsoft documentation](https://docs.microsoft.com/en-us/windows/wsl/install-win10).
- The following hardware prerequisites are required to successfully run
  WSL 2 on Windows 10 or Windows 11:
@y
- WSL version 1.1.3.0 or later.
- Windows 11 64-bit: Home or Pro version 21H2 or higher, or Enterprise or Education version 21H2 or higher.
- Windows 10 64-bit: 
  - We recommend Home or Pro 22H2 (build 19045) or higher, or Enterprise or Education 22H2 (build 19045) or higher. 
  - Minimum required is Home or Pro 21H2 (build 19044) or higher, or Enterprise or Education 21H2 (build 19044) or higher.
- Turn on the WSL 2 feature on Windows. For detailed instructions, refer to the
  [Microsoft documentation](https://docs.microsoft.com/en-us/windows/wsl/install-win10).
- The following hardware prerequisites are required to successfully run
  WSL 2 on Windows 10 or Windows 11:
@z

@x
  - 64-bit processor with [Second Level Address Translation (SLAT)](https://en.wikipedia.org/wiki/Second_Level_Address_Translation)
  - 4GB system RAM
  - Enable hardware virtualization in BIOS. For more information, see
    [Virtualization](../troubleshoot/topics.md#virtualization).
@y
  - 64-bit processor with [Second Level Address Translation (SLAT)](https://en.wikipedia.org/wiki/Second_Level_Address_Translation)
  - 4GB system RAM
  - Enable hardware virtualization in BIOS. For more information, see
    [Virtualization](../troubleshoot/topics.md#virtualization).
@z

@x
> **Important**
>
> To run Windows containers, you need Windows 10 or Windows 11 Professional or Enterprise edition.
> Windows Home or Education editions only allow you to run Linux containers.
{ .important }
@y
> **重要**
>
> To run Windows containers, you need Windows 10 or Windows 11 Professional or Enterprise edition.
> Windows Home or Education editions only allow you to run Linux containers.
{ .important }
@z

@x
> **Note**
>
> Docker only supports Docker Desktop on Windows for those versions of Windows that are still within [Microsoft’s servicing timeline](https://support.microsoft.com/en-us/help/13853/windows-lifecycle-fact-sheet).
@y
> **メモ**
>
> Docker only supports Docker Desktop on Windows for those versions of Windows that are still within [Microsoft’s servicing timeline](https://support.microsoft.com/en-us/help/13853/windows-lifecycle-fact-sheet).
@z

@x
> **Should I use Hyper-V or WSL?**
>
> Docker Desktop's functionality remains consistent on both WSL and Hyper-V, without a preference for either architecture. Hyper-V and WSL have their own advantages and disadvantages, depending on your specific set up and your planned use case. 
{ .tip }
@y
> **Should I use Hyper-V or WSL?**
>
> Docker Desktop's functionality remains consistent on both WSL and Hyper-V, without a preference for either architecture. Hyper-V and WSL have their own advantages and disadvantages, depending on your specific set up and your planned use case. 
{ .tip }
@z

@x
{{< /tab >}}
{{< tab name="Hyper-V backend and Windows containers" >}}
@y
{{< /tab >}}
{{< tab name="Hyper-V backend and Windows containers" >}}
@z

@x
- Windows 11 64-bit: Pro version 21H2 or higher, or Enterprise or Education version 21H2 or higher.
- Windows 10 64-bit:
  - We recommend Home or Pro 22H2 (build 19045) or higher, or Enterprise or Education 22H2 (build 19045) or higher. 
  - Minimum required is Home or Pro 21H2 (build 19044) or higher, or Enterprise or Education 21H2 (build 19044) or higher.
@y
- Windows 11 64-bit: Pro version 21H2 or higher, or Enterprise or Education version 21H2 or higher.
- Windows 10 64-bit:
  - We recommend Home or Pro 22H2 (build 19045) or higher, or Enterprise or Education 22H2 (build 19045) or higher. 
  - Minimum required is Home or Pro 21H2 (build 19044) or higher, or Enterprise or Education 21H2 (build 19044) or higher.
@z

@x
  For Windows 10 and Windows 11 Home, see the system requirements in the WSL 2 backend tab.
@y
  For Windows 10 and Windows 11 Home, see the system requirements in the WSL 2 backend tab.
@z

@x
- Turn on Hyper-V and Containers Windows features.
- The following hardware prerequisites are required to successfully run Client
  Hyper-V on Windows 10:
@y
- Turn on Hyper-V and Containers Windows features.
- The following hardware prerequisites are required to successfully run Client
  Hyper-V on Windows 10:
@z

@x
  - 64 bit processor with [Second Level Address Translation (SLAT)](https://en.wikipedia.org/wiki/Second_Level_Address_Translation)
  - 4GB system RAM
  - Turn on BIOS-level hardware virtualization support in the
    BIOS settings. For more information, see
    [Virtualization](../troubleshoot/topics.md#virtualization).
@y
  - 64 bit processor with [Second Level Address Translation (SLAT)](https://en.wikipedia.org/wiki/Second_Level_Address_Translation)
  - 4GB system RAM
  - Turn on BIOS-level hardware virtualization support in the
    BIOS settings. For more information, see
    [Virtualization](../troubleshoot/topics.md#virtualization).
@z

@x
> **Important**
>
> To run Windows containers, you need Windows 10 or Windows 11 Professional or Enterprise edition.
> Windows Home or Education editions only allow you to run Linux containers.
{ .important }
@y
> **重要**
>
> To run Windows containers, you need Windows 10 or Windows 11 Professional or Enterprise edition.
> Windows Home or Education editions only allow you to run Linux containers.
{ .important }
@z

@x
> **Note**
>
> Docker only supports Docker Desktop on Windows for those versions of Windows that are still within [Microsoft’s servicing timeline](https://support.microsoft.com/en-us/help/13853/windows-lifecycle-fact-sheet).
@y
> **メモ**
>
> Docker only supports Docker Desktop on Windows for those versions of Windows that are still within [Microsoft’s servicing timeline](https://support.microsoft.com/en-us/help/13853/windows-lifecycle-fact-sheet).
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
Containers and images created with Docker Desktop are shared between all
user accounts on machines where it is installed. This is because all Windows
accounts use the same VM to build and run containers. Note that it is not possible to share containers and images between user accounts when using the Docker Desktop WSL 2 backend.
@y
Docker Desktop を使って生成されたコンテナーやイメージは、Docker Desktop がインストールされているマシン上であれば、全ユーザーアカウントが共有できます。
これは Windows アカウントが同一の VM を使って、コンテナーのビルドや実行を行うからです。
ただし Docker Desktop WSL 2 バックエンドを利用している場合は、ユーザーアカウント間でコンテナーやイメージは共有できません。
@z

@x
Running Docker Desktop inside a VMware ESXi or Azure VM is supported for Docker Business customers.
It requires enabling nested virtualization on the hypervisor first.
For more information, see [Running Docker Desktop in a VM or VDI environment](../vm-vdi.md).
@y
Running Docker Desktop inside a VMware ESXi or Azure VM is supported for Docker Business customers.
It requires enabling nested virtualization on the hypervisor first.
For more information, see [Running Docker Desktop in a VM or VDI environment](../vm-vdi.md).
@z

@x
{{< accordion title="How do I switch between Windows and Linux containers?" >}}
@y
{{< accordion title="How do I switch between Windows and Linux containers?" >}}
@z

@x
From the Docker Desktop menu, you can toggle which daemon (Linux or Windows)
the Docker CLI talks to. Select **Switch to Windows containers** to use Windows
containers, or select **Switch to Linux containers** to use Linux containers
(the default).
@y
From the Docker Desktop menu, you can toggle which daemon (Linux or Windows)
the Docker CLI talks to. Select **Switch to Windows containers** to use Windows
containers, or select **Switch to Linux containers** to use Linux containers
(the default).
@z

@x
For more information on Windows containers, refer to the following documentation:
@y
For more information on Windows containers, refer to the following documentation:
@z

@x
- Microsoft documentation on [Windows containers](https://docs.microsoft.com/en-us/virtualization/windowscontainers/about/index).
@y
- Microsoft documentation on [Windows containers](https://docs.microsoft.com/en-us/virtualization/windowscontainers/about/index).
@z

@x
- [Build and Run Your First Windows Server Container (Blog Post)](https://www.docker.com/blog/build-your-first-docker-windows-server-container/)
  gives a quick tour of how to build and run native Docker Windows containers on Windows 10 and Windows Server 2016 evaluation releases.
@y
- [Build and Run Your First Windows Server Container (Blog Post)](https://www.docker.com/blog/build-your-first-docker-windows-server-container/)
  gives a quick tour of how to build and run native Docker Windows containers on Windows 10 and Windows Server 2016 evaluation releases.
@z

@x
- [Getting Started with Windows Containers (Lab)](https://github.com/docker/labs/blob/master/windows/windows-containers/README.md)
  shows you how to use the [MusicStore](https://github.com/aspnet/MusicStore/)
  application with Windows containers. The MusicStore is a standard .NET application and,
  [forked here to use containers](https://github.com/friism/MusicStore), is a good example of a multi-container application.
@y
- [Getting Started with Windows Containers (Lab)](https://github.com/docker/labs/blob/master/windows/windows-containers/README.md)
  shows you how to use the [MusicStore](https://github.com/aspnet/MusicStore/)
  application with Windows containers. The MusicStore is a standard .NET application and,
  [forked here to use containers](https://github.com/friism/MusicStore), is a good example of a multi-container application.
@z

@x
- To understand how to connect to Windows containers from the local host, see
  [I want to connect to a container from Windows](../networking.md#i-want-to-connect-to-a-container-from-the-host)
@y
- To understand how to connect to Windows containers from the local host, see
  [I want to connect to a container from Windows](../networking.md#i-want-to-connect-to-a-container-from-the-host)
@z

@x
> **Note**
>
> When you switch to Windows containers, **Settings** only shows those tabs that are active and apply to your Windows containers. These are:
>
>  * [General](../settings/windows.md#general)
>  * [Proxies](../settings/windows.md#proxies)
>  * [Daemon](../settings/windows.md#docker-engine)
@y
> **Note**
>
> When you switch to Windows containers, **Settings** only shows those tabs that are active and apply to your Windows containers. These are:
>
>  * [General](../settings/windows.md#general)
>  * [Proxies](../settings/windows.md#proxies)
>  * [Daemon](../settings/windows.md#docker-engine)
@z

@x
If you set proxies or daemon configuration in Windows containers mode, these
apply only on Windows containers. If you switch back to Linux containers,
proxies and daemon configurations return to what you had set for Linux
containers. Your Windows container settings are retained and become available
again when you switch back.
@y
If you set proxies or daemon configuration in Windows containers mode, these
apply only on Windows containers. If you switch back to Linux containers,
proxies and daemon configurations return to what you had set for Linux
containers. Your Windows container settings are retained and become available
again when you switch back.
@z

@x
{{< /accordion >}}
@y
{{< /accordion >}}
@z

@x
## Install Docker Desktop on Windows
@y
## Windows への Docker Desktop のインストール {#install-docker-desktop-on-windows}
@z

@x
{{< tabs >}}
{{< tab name="Install interactively" >}}
@y
{{< tabs >}}
{{< tab name="Install interactively" >}}
@z

@x
1. Download the installer using the download button at the top of the page, or from the [release notes](../release-notes.md).
@y
1. ページ最上部にあるダウンロードボタンをクリックしてインストーラーをダウンロードするか、あるいは [リリースノート](../release-notes.md) ページからダウンロードします。
@z

@x
2. Double-click `Docker Desktop Installer.exe` to run the installer. By default, Docker Desktop is installed at `C:\Program Files\Docker\Docker`.
@y
2. `Docker Desktop Installer.exe` をダブルクリックしてインストーラーを起動します。
   デフォルトで Docker は `C:\Program Files\Docker\Docker` にインストールされます。
@z

@x
3. When prompted, ensure the **Use WSL 2 instead of Hyper-V** option on the Configuration page is selected or not depending on your choice of backend.
@y
3. プロンプト画面が表示されたら、バックエンドでの選択状況に従って Configuration ページにおける **Use WSL 2 instead of Hyper-V** オプションのオンオフが設定されていることを確認してください。
@z

@x
   If your system only supports one of the two options, you will not be able to select which backend to use.
@y
   利用するシステムが 2 つのオプションの 1 つのみをサポートしている場合は、バックエンドにおいて選択することはできません。
@z

@x
4. Follow the instructions on the installation wizard to authorize the installer and proceed with the install.
@y
4. インストールウィザードの手順に従ってインストーラーを承認して、インストールを完了させます。
@z

@x
5. When the installation is successful, select **Close** to complete the installation process.
@y
5. インストールが正常に行われたら **Close** をクリックして作業を終了します。
@z

@x
If your admin account is different to your user account, you must add the user to the **docker-users** group:
@y
管理アカウントが利用しているアカウントと異なる場合、そのアカウントを **docker-users** グループに追加する必要があります。
@z

@x
1. Run **Computer Management** as an **administrator**.
2. Navigate to **Local Users and Groups** > **Groups** > **docker-users**. 
3. Right-click to add the user to the group.
4. Sign out and sign back in for the changes to take effect.
@y
1. **administrator**（管理者）として **Computer Management**（コンピューターの管理）を実行します。
2. **Local Users and Groups** > **Groups** > **docker-users** を選びます。
3. このグループに対して、右クリックメニューからユーザーを追加します。
4. 変更を有効にするため、いったんサインアウトしてからサインインし直します。
@z

@x
{{< /tab >}}
{{< tab name="Install from the command line" >}}
@y
{{< /tab >}}
{{< tab name="コマンドラインからのインストール" >}}
@z

@x
After downloading `Docker Desktop Installer.exe`, run the following command in a terminal to install Docker Desktop:
@y
`Docker Desktop Installer.exe` をダウンロードしたら、端末から以下のコマンドを実行して Docker Desktop をインストールします。
@z

@x
```console
$ "Docker Desktop Installer.exe" install
```
@y
```console
$ "Docker Desktop Installer.exe" install
```
@z

@x
If you’re using PowerShell you should run it as:
@y
PowerShell を利用している場合は以下を実行します。
@z

@x
```powershell
Start-Process 'Docker Desktop Installer.exe' -Wait install
```
@y
```powershell
Start-Process 'Docker Desktop Installer.exe' -Wait install
```
@z

@x
If using the Windows Command Prompt:
@y
Windows コマンドプロンプトの利用時は以下を実行します。
@z

@x
```sh
start /w "" "Docker Desktop Installer.exe" install
```
@y
```sh
start /w "" "Docker Desktop Installer.exe" install
```
@z

@x
The `install` command accepts the following flags:
- `--quiet`: Suppresses information output when running the installer 
- `--accept-license`: Accepts the [Docker Subscription Service Agreement](https://www.docker.com/legal/docker-subscription-service-agreement) now, rather than requiring it to be accepted when the application is first run
- `--no-windows-containers`: Disables the Windows containers integration
- `--allowed-org=<org name>`: Requires the user to sign in and be part of the specified Docker Hub organization when running the application
- `--backend=<backend name>`: Selects the default backend to use for Docker Desktop, `hyper-v`, `windows` or `wsl-2` (default)
- `--installation-dir=<path>`: Changes the default installation location (`C:\Program Files\Docker\Docker`)
- `--admin-settings`: Automatically creates an `admin-settings.json` file which is used by admins to control certain Docker Desktop settings on client machines within their organization. For more information, see [Settings Management](../hardened-desktop/settings-management/index.md).
  - It must be used together with the `--allowed-org=<org name>` flag. 
  - For example:
@y
`install` コマンドでは以下のフラグ指定が可能です。
- `--quiet`: インストーラーの起動時に情報出力を省略します。
- `--accept-license`: [Docker Subscription Service Agreement](https://www.docker.com/legal/docker-subscription-service-agreement) に関して、アプリケーションの初回実行時に同意するのではなく、この場で同意するものとします。
- `--no-windows-containers`: Disables the Windows containers integration
- `--allowed-org=<org name>`: アプリケーションを実行するにあたって、ユーザーのサインインを要求して、指定した Docker Hub 組織の一員であることを要求します。
- `--backend=<backend name>`: Docker Desktop において利用するデフォルトのバックエンドを選択します。`hyper-v`、`windows`、`wsl-2`(デフォルト) のいずれかとします。
- `--installation-dir=<path>`: Changes the default installation location (`C:\Program Files\Docker\Docker`)
- `--admin-settings`: Automatically creates an `admin-settings.json` file which is used by admins to control certain Docker Desktop settings on client machines within their organization. For more information, see [Settings Management](../hardened-desktop/settings-management/index.md).
  - It must be used together with the `--allowed-org=<org name>` flag. 
  - For example:
@z

@x
    ```text
    --allowed-org=<org name> --admin-settings='{"configurationFileVersion": 2, "enhancedContainerIsolation": {"value": true, "locked": false}}'
    ```
@y
    ```text
    --allowed-org=<org name> --admin-settings='{"configurationFileVersion": 2, "enhancedContainerIsolation": {"value": true, "locked": false}}'
    ```
@z

@x
- `--proxy-http-mode=<mode>`: Sets the HTTP Proxy mode, `system` (default) or `manual`
- `--override-proxy-http=<URL>`: Sets the URL of the HTTP proxy that must be used for outgoing HTTP requests, requires `--proxy-http-mode` to be `manual`
- `--override-proxy-https=<URL>`: Sets the URL of the HTTP proxy that must be used for outgoing HTTPS requests, requires `--proxy-http-mode` to be `manual`
- `--override-proxy-exclude=<hosts/domains>`: Bypasses proxy settings for the hosts and domains. Uses a comma-separated list.
- `--hyper-v-default-data-root=<path>`: Specifies the default location for the Hyper-V VM disk. 
- `--windows-containers-default-data-root=<path>`: Specifies the default location for the Windows containers.
- `--wsl-default-data-root=<path>`: Specifies the default location for the WSL distribution disk.
- `--always-run-service`: Lets users switch to Windows containers without needing admin rights. 
@y
- `--proxy-http-mode=<mode>`: Sets the HTTP Proxy mode, `system` (default) or `manual`
- `--override-proxy-http=<URL>`: Sets the URL of the HTTP proxy that must be used for outgoing HTTP requests, requires `--proxy-http-mode` to be `manual`
- `--override-proxy-https=<URL>`: Sets the URL of the HTTP proxy that must be used for outgoing HTTPS requests, requires `--proxy-http-mode` to be `manual`
- `--override-proxy-exclude=<hosts/domains>`: Bypasses proxy settings for the hosts and domains. Uses a comma-separated list.
- `--hyper-v-default-data-root=<path>`: Specifies the default location for the Hyper-V VM disk. 
- `--windows-containers-default-data-root=<path>`: Specifies the default location for the Windows containers.
- `--wsl-default-data-root=<path>`: Specifies the default location for the WSL distribution disk.
- `--always-run-service`: Lets users switch to Windows containers without needing admin rights. 
@z

@x
> **Note**
>
> If you're using PowerShell, you need to use the `ArgumentList` parameter before any flags. 
> For example:
> ```powershell
> Start-Process 'Docker Desktop Installer.exe' -Wait -ArgumentList 'install', '--accept-license'
> ```
@y
> **メモ**
>
> If you're using PowerShell, you need to use the `ArgumentList` parameter before any flags. 
> For example:
> ```powershell
> Start-Process 'Docker Desktop Installer.exe' -Wait -ArgumentList 'install', '--accept-license'
> ```
@z

@x
If your admin account is different to your user account, you must add the user to the **docker-users** group:
@y
ユーザーアカウントが管理者アカウントと異なる場合は、ユーザーを **docker-users** グループに追加することが必要です。
@z

@x
```console
$ net localgroup docker-users <user> /add
```
{{< /tab >}}
{{< /tabs >}}
@y
```console
$ net localgroup docker-users <user> /add
```
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Start Docker Desktop
@y
## Docker Desktop の起動 {#start-docker-desktop}
@z

@x
Docker Desktop does not start automatically after installation. To start Docker Desktop:
@y
インストール直後の Docker Desktop は、自動的には起動されません。
Docker Desktop を起動するには、以下を実行します。
@z

@x
1. Search for Docker, and select **Docker Desktop** in the search results.
@y
1. Search for Docker, and select **Docker Desktop** in the search results.
@z

@x
   ![Search for Docker app](images/docker-app-search.png)
@y
   ![Search for Docker app](images/docker-app-search.png)
@z

@x
2. The Docker menu ({{< inline-image src="images/whale-x.svg" alt="whale menu" >}}) displays the Docker Subscription Service Agreement.
@y
2. Docker メニュー ({{< inline-image src="images/whale-x.svg" alt="クジラメニュー" >}}) には、Docker Subscription Service Agreement（サブスクリプションサービス契約）画面が表示されます。
@z

@x
   {{< include "desktop-license-update.md" >}}
@y
   {{< include "desktop-license-update.md" >}}
@z

@x
3. Select **Accept** to continue. Docker Desktop starts after you accept the terms.
@y
3. Select **Accept** to continue. Docker Desktop starts after you accept the terms.
@z

@x
   Note that Docker Desktop won't run if you do not agree to the terms. You can choose to accept the terms at a later date by opening Docker Desktop.
@y
   Note that Docker Desktop won't run if you do not agree to the terms. You can choose to accept the terms at a later date by opening Docker Desktop.
@z

@x
   For more information, see [Docker Desktop Subscription Service Agreement](https://www.docker.com/legal/docker-subscription-service-agreement/). We recommend that you also read the [FAQs](https://www.docker.com/pricing/faq).
@y
   For more information, see [Docker Desktop Subscription Service Agreement](https://www.docker.com/legal/docker-subscription-service-agreement/). We recommend that you also read the [FAQs](https://www.docker.com/pricing/faq).
@z

@x
## Where to go next
@y
## 次に読むものは {#where-to-go-next}
@z

@x
- [Get started with Docker](../../guides/get-started/_index.md).
- [Explore Docker Desktop](../use-desktop/index.md) and all its features.
- [Troubleshooting](../troubleshoot/overview.md) describes common problems, workarounds, and
  how to get support.
- [FAQs](../faqs/general.md) provide answers to frequently asked questions.
- [Release notes](../release-notes.md) lists component updates, new features, and improvements associated with Docker Desktop releases.
- [Back up and restore data](../backup-and-restore.md) provides instructions on backing up and restoring data related to Docker.
@y
- [Docker をはじめよう](../../guides/get-started/_index.md)。
- [Docker Desktop の確認](../use-desktop/index.md) とその全機能。
- [トラブルシューティング](../troubleshoot/overview.md) では、一般的な問題、回避策、サポートの受け方などについて説明しています。
- [FAQ](../faqs/general.md) ではよくたずねられる質問を示しています。
- [リリースノート](../release-notes.md) では、Docker Desktop リリースにおけるコンポーネントアップデート、新機能、改善項目を一覧にしています。
- [データのバックアップとリストア](../backup-and-restore.md) では Docker に関するデータのバックアップやリストアの手順を説明しています。
@z
