%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Get started with Docker for Windows. This guide covers system requirements,
  where to download, and instructions on how to install and update.
keywords: docker for windows, docker windows, docker desktop for windows, docker on
  windows, install docker windows, install docker on windows, docker windows 10, docker
  run on windows, installing docker for windows, windows containers, wsl, hyper-v
title: Install Docker Desktop on Windows
@y
description: Get started with Docker for Windows. This guide covers system requirements,
  where to download, and instructions on how to install and update.
keywords: docker for windows, docker windows, docker desktop for windows, docker on
  windows, install docker windows, install docker on windows, docker windows 10, docker
  run on windows, installing docker for windows, windows containers, wsl, hyper-v
title: Windows への Docker Desktop のインストール
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
This page contains the download URL, information about system requirements, and instructions on how to install Docker Desktop for Windows.
@y
このページでは Docker Desktop for Windows をインストールするための、ダウンロード情報、システム要件、インストール手順について説明します。
@z

@x
{{< button text="Docker Desktop for Windows - x86_64" url="https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-win-amd64" >}}
{{< button text="Docker Desktop for Windows - Arm (Beta)" url="https://desktop.docker.com/win/main/arm64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-win-arm64" >}}
@y
{{< button text="Docker Desktop for Windows - x86_64" url="https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-win-amd64" >}}
{{< button text="Docker Desktop for Windows - Arm (Beta)" url="https://desktop.docker.com/win/main/arm64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-win-arm64" >}}
@z

@x
_For checksums, see [Release notes](../release-notes.md)_
@y
チェックサムについては [リリースノート](../release-notes.md)_ を参照してください。
@z

@x
## System requirements
@y
## システム要件 {#system-requirements}
@z

@x
> [!TIP]
>
> **Should I use Hyper-V or WSL?**
>
> Docker Desktop's functionality remains consistent on both WSL and Hyper-V, without a preference for either architecture. Hyper-V and WSL have their own advantages and disadvantages, depending on your specific set up and your planned use case. 
@y
> [!TIP]
>
> **Should I use Hyper-V or WSL?**
>
> Docker Desktop's functionality remains consistent on both WSL and Hyper-V, without a preference for either architecture. Hyper-V and WSL have their own advantages and disadvantages, depending on your specific set up and your planned use case. 
@z

@x
{{< tabs >}}
{{< tab name="WSL 2 backend, x86_64" >}}
@y
{{< tabs >}}
{{< tab name="WSL 2 バックエンド、x86_64" >}}
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
  - 64-bit processor with [Second Level Address Translation (SLAT)](https://en.wikipedia.org/wiki/Second_Level_Address_Translation)
  - 4GB system RAM
  - Enable hardware virtualization in BIOS. For more information, see
    [Virtualization](../troubleshoot/topics.md#virtualization).
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
  - 64-bit processor with [Second Level Address Translation (SLAT)](https://en.wikipedia.org/wiki/Second_Level_Address_Translation)
  - 4GB system RAM
  - Enable hardware virtualization in BIOS. For more information, see
    [Virtualization](../troubleshoot/topics.md#virtualization).
@z

@x
For more information on setting up WSL 2 with Docker Desktop, see [WSL](../wsl/_index.md).
@y
For more information on setting up WSL 2 with Docker Desktop, see [WSL](../wsl/_index.md).
@z

@x
> [!NOTE]
>
> Docker only supports Docker Desktop on Windows for those versions of Windows that are still within [Microsoft’s servicing timeline](https://support.microsoft.com/en-us/help/13853/windows-lifecycle-fact-sheet). Docker Desktop is not supported on server versions of Windows, such as Windows Server 2019 or Windows Server 2022. For more information on how to run containers on Windows Server, see [Microsoft's official documentation](https://learn.microsoft.com/virtualization/windowscontainers/quick-start/set-up-environment).
@y
> [!NOTE]
>
> Docker only supports Docker Desktop on Windows for those versions of Windows that are still within [Microsoft’s servicing timeline](https://support.microsoft.com/en-us/help/13853/windows-lifecycle-fact-sheet). Docker Desktop is not supported on server versions of Windows, such as Windows Server 2019 or Windows Server 2022. For more information on how to run containers on Windows Server, see [Microsoft's official documentation](https://learn.microsoft.com/virtualization/windowscontainers/quick-start/set-up-environment).
@z

@x
> [!IMPORTANT]
>
> To run Windows containers, you need Windows 10 or Windows 11 Professional or Enterprise edition.
> Windows Home or Education editions only allow you to run Linux containers.
@y
> [!IMPORTANT]
>
> To run Windows containers, you need Windows 10 or Windows 11 Professional or Enterprise edition.
> Windows Home or Education editions only allow you to run Linux containers.
@z

@x
{{< /tab >}}
{{< tab name="Hyper-V backend, x86_64" >}}
@y
{{< /tab >}}
{{< tab name="Hyper-V backend, x86_64" >}}
@z

@x
- Windows 11 64-bit: Home or Pro version 21H2 or higher, or Enterprise or Education version 21H2 or higher.
- Windows 10 64-bit:
  - Home or Pro 22H2 (build 19045) or higher, or Enterprise or Education 22H2 (build 19045) or higher is recommended. 
  - Minimum required is Home or Pro 21H2 (build 19044) or higher, or Enterprise or Education 21H2 (build 19044) or higher.
- Turn on Hyper-V and Containers Windows features.
- The following hardware prerequisites are required to successfully run Client
  Hyper-V on Windows 10:
@y
- Windows 11 64-bit: Home or Pro version 21H2 or higher, or Enterprise or Education version 21H2 or higher.
- Windows 10 64-bit:
  - Home or Pro 22H2 (build 19045) or higher, or Enterprise or Education 22H2 (build 19045) or higher is recommended. 
  - Minimum required is Home or Pro 21H2 (build 19044) or higher, or Enterprise or Education 21H2 (build 19044) or higher.
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
> [!NOTE]
>
> Docker only supports Docker Desktop on Windows for those versions of Windows that are still within [Microsoft’s servicing timeline](https://support.microsoft.com/en-us/help/13853/windows-lifecycle-fact-sheet). Docker Desktop is not supported on server versions of Windows, such as Windows Server 2019 or Windows Server 2022. For more information on how to run containers on Windows Server, see [Microsoft's official documentation](https://learn.microsoft.com/virtualization/windowscontainers/quick-start/set-up-environment).
@y
> [!NOTE]
>
> Docker only supports Docker Desktop on Windows for those versions of Windows that are still within [Microsoft’s servicing timeline](https://support.microsoft.com/en-us/help/13853/windows-lifecycle-fact-sheet). Docker Desktop is not supported on server versions of Windows, such as Windows Server 2019 or Windows Server 2022. For more information on how to run containers on Windows Server, see [Microsoft's official documentation](https://learn.microsoft.com/virtualization/windowscontainers/quick-start/set-up-environment).
@z

@x
> [!IMPORTANT]
>
> To run Windows containers, you need Windows 10 or Windows 11 Professional or Enterprise edition.
> Windows Home or Education editions only allow you to run Linux containers.
@y
> [!IMPORTANT]
>
> To run Windows containers, you need Windows 10 or Windows 11 Professional or Enterprise edition.
> Windows Home or Education editions only allow you to run Linux containers.
@z

@x
{{< /tab >}}
{{< tab name="WSL 2 backend, Arm (Beta)" >}}
@y
{{< /tab >}}
{{< tab name="WSL 2 backend, Arm (Beta)" >}}
@z

@x
- WSL version 1.1.3.0 or later.
- Windows 11 64-bit: Home or Pro version 21H2 or higher, or Enterprise or Education version 21H2 or higher.
- Windows 10 64-bit: 
  - Home or Pro 22H2 (build 19045) or higher, or Enterprise or Education 22H2 (build 19045) or higher is recommended. 
  - Minimum required is Home or Pro 21H2 (build 19044) or higher, or Enterprise or Education 21H2 (build 19044) or higher.
- Turn on the WSL 2 feature on Windows. For detailed instructions, refer to the
  [Microsoft documentation](https://docs.microsoft.com/en-us/windows/wsl/install-win10).
- The following hardware prerequisites are required to successfully run
  WSL 2 on Windows 10 or Windows 11:
  - 64-bit processor with [Second Level Address Translation (SLAT)](https://en.wikipedia.org/wiki/Second_Level_Address_Translation)
  - 4GB system RAM
  - Enable hardware virtualization in BIOS. For more information, see
    [Virtualization](../troubleshoot/topics.md#virtualization).
@y
- WSL version 1.1.3.0 or later.
- Windows 11 64-bit: Home or Pro version 21H2 or higher, or Enterprise or Education version 21H2 or higher.
- Windows 10 64-bit: 
  - Home or Pro 22H2 (build 19045) or higher, or Enterprise or Education 22H2 (build 19045) or higher is recommended. 
  - Minimum required is Home or Pro 21H2 (build 19044) or higher, or Enterprise or Education 21H2 (build 19044) or higher.
- Turn on the WSL 2 feature on Windows. For detailed instructions, refer to the
  [Microsoft documentation](https://docs.microsoft.com/en-us/windows/wsl/install-win10).
- The following hardware prerequisites are required to successfully run
  WSL 2 on Windows 10 or Windows 11:
  - 64-bit processor with [Second Level Address Translation (SLAT)](https://en.wikipedia.org/wiki/Second_Level_Address_Translation)
  - 4GB system RAM
  - Enable hardware virtualization in BIOS. For more information, see
    [Virtualization](../troubleshoot/topics.md#virtualization).
@z

@x
> [!IMPORTANT]
>
> Windows containers are not supported.
@y
> [!IMPORTANT]
>
> Windows containers are not supported.
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
> [!NOTE]
>
> When you switch to Windows containers, **Settings** only shows those tabs that are active and apply to your Windows containers.
@y
> [!NOTE]
>
> When you switch to Windows containers, **Settings** only shows those tabs that are active and apply to your Windows containers.
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
### Install interactively
@y
### Install interactively
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
   If your system only supports one of the two options, you won't be able to select which backend to use.
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
If your administrator account is different to your user account, you must add the user to the **docker-users** group:
1. Run **Computer Management** as an **administrator**.
2. Navigate to **Local Users and Groups** > **Groups** > **docker-users**. 
3. Right-click to add the user to the group.
4. Sign out and sign back in for the changes to take effect.
@y
If your administrator account is different to your user account, you must add the user to the **docker-users** group:
1. Run **Computer Management** as an **administrator**.
2. Navigate to **Local Users and Groups** > **Groups** > **docker-users**. 
3. Right-click to add the user to the group.
4. Sign out and sign back in for the changes to take effect.
@z

@x
### Install from the command line
@y
### コマンドラインからのインストール {#install-from-the-command-line}
@z

@x
After downloading `Docker Desktop Installer.exe`, run the following command in a terminal to install Docker Desktop:
@y
`Docker Desktop Installer.exe` をダウンロードしたら、端末から以下のコマンドを実行して Docker Desktop をインストールします。
@z

% snip command...

@x
If you’re using PowerShell you should run it as:
@y
PowerShell を利用している場合は以下を実行します。
@z

% snip command...

@x
If using the Windows Command Prompt:
@y
Windows コマンドプロンプトの利用時は以下を実行します。
@z

% snip command...

@x
By default, Docker Desktop is installed at `C:\Program Files\Docker\Docker`.
@y
By default, Docker Desktop is installed at `C:\Program Files\Docker\Docker`.
@z

@x
The `install` command accepts the following flags:
- `--quiet`: Suppresses information output when running the installer 
- `--accept-license`: Accepts the [Docker Subscription Service Agreement](https://www.docker.com/legal/docker-subscription-service-agreement) now, rather than requiring it to be accepted when the application is first run
- `--no-windows-containers`: Disables the Windows containers integration
- `--allowed-org=<org name>`: Requires the user to sign in and be part of the specified Docker Hub organization when running the application
- `--backend=<backend name>`: Selects the default backend to use for Docker Desktop, `hyper-v`, `windows` or `wsl-2` (default)
- `--installation-dir=<path>`: Changes the default installation location (`C:\Program Files\Docker\Docker`)
- `--admin-settings`: Automatically creates an `admin-settings.json` file which is used by admins to control certain Docker Desktop settings on client machines within their organization. For more information, see [Settings Management](/security/for-admins/hardened-desktop/settings-management/index.md).
  - It must be used together with the `--allowed-org=<org name>` flag. 
  - For example:
@y
`install` コマンドでは以下のフラグ指定が可能です。
- `--quiet`: インストーラーの起動時に情報出力を省略します。
- `--accept-license`: Accepts the [Docker Subscription Service Agreement](https://www.docker.com/legal/docker-subscription-service-agreement) now, rather than requiring it to be accepted when the application is first run
- `--no-windows-containers`: Disables the Windows containers integration
- `--allowed-org=<org name>`: Requires the user to sign in and be part of the specified Docker Hub organization when running the application
- `--backend=<backend name>`: Selects the default backend to use for Docker Desktop, `hyper-v`, `windows` or `wsl-2` (default)
- `--installation-dir=<path>`: Changes the default installation location (`C:\Program Files\Docker\Docker`)
- `--admin-settings`: Automatically creates an `admin-settings.json` file which is used by admins to control certain Docker Desktop settings on client machines within their organization. For more information, see [Settings Management](security/for-admins/hardened-desktop/settings-management/_index.md).
  - It must be used together with the `--allowed-org=<org name>` flag. 
  - For example:
@z

% snip text...

@x
- `--proxy-http-mode=<mode>`: Sets the HTTP Proxy mode, `system` (default) or `manual`
- `--override-proxy-http=<URL>`: Sets the URL of the HTTP proxy that must be used for outgoing HTTP requests, requires `--proxy-http-mode` to be `manual`
- `--override-proxy-https=<URL>`: Sets the URL of the HTTP proxy that must be used for outgoing HTTPS requests, requires `--proxy-http-mode` to be `manual`
- `--override-proxy-exclude=<hosts/domains>`: Bypasses proxy settings for the hosts and domains. Uses a comma-separated list.
- `--proxy-enable-kerberosntlm`: Enables Kerberos and NTLM proxy authentication. If you are enabling this, ensure your proxy server is properly configured for Kerberos/NTLM authentication. Available with Docker Desktop 4.32 and later.
- `--hyper-v-default-data-root=<path>`: Specifies the default location for the Hyper-V VM disk. 
- `--windows-containers-default-data-root=<path>`: Specifies the default location for the Windows containers.
- `--wsl-default-data-root=<path>`: Specifies the default location for the WSL distribution disk.
- `--always-run-service`: After installation completes, starts `com.docker.service` and sets the service startup type to Automatic. This circumvents the need for administrator privileges, which are otherwise necessary to start `com.docker.service`. `com.docker.service` is required by Windows containers and Hyper-V backend.
@y
- `--proxy-http-mode=<mode>`: Sets the HTTP Proxy mode, `system` (default) or `manual`
- `--override-proxy-http=<URL>`: Sets the URL of the HTTP proxy that must be used for outgoing HTTP requests, requires `--proxy-http-mode` to be `manual`
- `--override-proxy-https=<URL>`: Sets the URL of the HTTP proxy that must be used for outgoing HTTPS requests, requires `--proxy-http-mode` to be `manual`
- `--override-proxy-exclude=<hosts/domains>`: Bypasses proxy settings for the hosts and domains. Uses a comma-separated list.
- `--proxy-enable-kerberosntlm`: Enables Kerberos and NTLM proxy authentication. If you are enabling this, ensure your proxy server is properly configured for Kerberos/NTLM authentication. Available with Docker Desktop 4.32 and later.
- `--hyper-v-default-data-root=<path>`: Specifies the default location for the Hyper-V VM disk. 
- `--windows-containers-default-data-root=<path>`: Specifies the default location for the Windows containers.
- `--wsl-default-data-root=<path>`: Specifies the default location for the WSL distribution disk.
- `--always-run-service`: After installation completes, starts `com.docker.service` and sets the service startup type to Automatic. This circumvents the need for administrator privileges, which are otherwise necessary to start `com.docker.service`. `com.docker.service` is required by Windows containers and Hyper-V backend.
@z

@x
> [!NOTE]
>
> If you're using PowerShell, you need to use the `ArgumentList` parameter before any flags. 
> For example:
> ```powershell
> Start-Process 'Docker Desktop Installer.exe' -Wait -ArgumentList 'install', '--accept-license'
> ```
@y
> [!NOTE]
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

% snip command...

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
   For more information, see [Docker Desktop Subscription Service Agreement](https://www.docker.com/legal/docker-subscription-service-agreement/). It is recommended that you read the [FAQs](https://www.docker.com/pricing/faq).
@y
   For more information, see [Docker Desktop Subscription Service Agreement](https://www.docker.com/legal/docker-subscription-service-agreement/). It is recommended that you read the [FAQs](https://www.docker.com/pricing/faq).
@z

@x
> [!TIP]
>
> As an IT administrator, you can use endpoint management (MDM) software to identify the number of Docker Desktop instances and their versions within your environment. This can provide accurate license reporting, help ensure your machines use the latest version of Docker Desktop, and enable you to [enforce sign-in](../../security/for-admins/enforce-sign-in/_index.md).
> - [Intune](https://learn.microsoft.com/en-us/mem/intune/apps/app-discovered-apps)
> - [Jamf](https://docs.jamf.com/10.25.0/jamf-pro/administrator-guide/Application_Usage.html)
> - [Kandji](https://support.kandji.io/support/solutions/articles/72000559793-view-a-device-application-list)
> - [Kolide](https://www.kolide.com/features/device-inventory/properties/mac-apps)
> - [Workspace One](https://blogs.vmware.com/euc/2022/11/how-to-use-workspace-one-intelligence-to-manage-app-licenses-and-reduce-costs.html)
@y
> [!TIP]
>
> As an IT administrator, you can use endpoint management (MDM) software to identify the number of Docker Desktop instances and their versions within your environment. This can provide accurate license reporting, help ensure your machines use the latest version of Docker Desktop, and enable you to [enforce sign-in](../../security/for-admins/enforce-sign-in/_index.md).
> - [Intune](https://learn.microsoft.com/en-us/mem/intune/apps/app-discovered-apps)
> - [Jamf](https://docs.jamf.com/10.25.0/jamf-pro/administrator-guide/Application_Usage.html)
> - [Kandji](https://support.kandji.io/support/solutions/articles/72000559793-view-a-device-application-list)
> - [Kolide](https://www.kolide.com/features/device-inventory/properties/mac-apps)
> - [Workspace One](https://blogs.vmware.com/euc/2022/11/how-to-use-workspace-one-intelligence-to-manage-app-licenses-and-reduce-costs.html)
@z

@x
## Where to go next
@y
## 次に読むものは {#where-to-go-next}
@z

@x
- Explore [Docker's core subscriptions](https://www.docker.com/pricing/) to see what Docker can offer you.
- [Get started with Docker](/get-started/introduction/_index.md).
- [Explore Docker Desktop](../use-desktop/index.md) and all its features.
- [Troubleshooting](../troubleshoot/overview.md) describes common problems, workarounds, and
  how to get support.
- [FAQs](../faqs/general.md) provide answers to frequently asked questions.
- [Release notes](../release-notes.md) lists component updates, new features, and improvements associated with Docker Desktop releases.
- [Back up and restore data](../backup-and-restore.md) provides instructions on backing up and restoring data related to Docker.
@y
- Explore [Docker's core subscriptions](https://www.docker.com/pricing/) to see what Docker can offer you.
- [Docker をはじめよう](get-started/introduction/_index.md).
- [Docker Desktop の確認](../use-desktop/index.md) and all its features.
- [トラブルシューティング](../troubleshoot/overview.md) では、一般的な問題、回避策、サポートの受け方などについて説明しています。
- [FAQ](../faqs/general.md) では、一般的な問題、回避策、サポートの受け方などについて説明しています。
- [リリースノート](../release-notes.md) では、Docker Desktop リリースにおけるコンポーネントアップデート、新機能、改善項目を一覧にしています。
- [データのバックアップとリストア](../backup-and-restore.md) では Docker に関するデータのバックアップやリストアの手順を説明しています。
@z
