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
This page provides download links, system requirements, and step-by-step installation instructions for Docker Desktop on Windows.
@y
このページでは Docker Desktop for Windows をインストールするための、ダウンロードリンク、システム要件、インストール手順について説明します。
@z

@x
{{< button text="Docker Desktop for Windows - x86_64" url="https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-win-amd64" >}}
{{< button text="Docker Desktop for Windows - x86_64 on the Microsoft Store" url="https://apps.microsoft.com/detail/xp8cbj40xlbwkx?hl=en-GB&gl=GB" >}}
{{< button text="Docker Desktop for Windows - Arm (Early Access)" url="https://desktop.docker.com/win/main/arm64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-win-arm64" >}}
@y
{{< button text="Docker Desktop for Windows - x86_64" url="https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-win-amd64" >}}
{{< button text="Microsoft Store 上の Docker Desktop for Windows - x86_64" url="https://apps.microsoft.com/detail/xp8cbj40xlbwkx?hl=en-GB&gl=GB" >}}
{{< button text="Docker Desktop for Windows - Arm (早期アクセス)" url="https://desktop.docker.com/win/main/arm64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-win-arm64" >}}
@z

@x
_For checksums, see [Release notes](/manuals/desktop/release-notes.md)_
@y
チェックサムについては [リリースノート](manuals/desktop/release-notes.md) を参照してください。
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
> Docker Desktop's functionality remains consistent on both WSL and Hyper-V, without a preference for either architecture. Hyper-V and WSL have their own advantages and disadvantages, depending on your specific setup and your planned use case. 
@y
> [!TIP]
>
> **Hyper-V または WSL を使うべきか？**
>
> Docker Desktop は WSL 上でも Hyper-V 上でも、アーキテクチャーに関係なく同様に機能します。
> Hyper-V と WSL にはそれぞれに利点と欠点があり、それは設定内容や利用形態により変化します。
@z

@x
{{< tabs >}}
{{< tab name="WSL 2 backend, x86_64" >}}
@y
{{< tabs >}}
{{< tab name="WSL 2 バックエンド、x86_64" >}}
@z

@x
- WSL version 2.1.5 or later. To check your version, see [WSL: Verification and setup](#wsl-verification-and-setup)
- Windows 10 64-bit: Enterprise, Pro, or Education version 22H2 (build 19045).
- Windows 11 64-bit: Enterprise, Pro, or Education version 23H2 (build 22631) or higher.
- Turn on the WSL 2 feature on Windows. For detailed instructions, refer to the
  [Microsoft documentation](https://docs.microsoft.com/en-us/windows/wsl/install-win10).
- The following hardware prerequisites are required to successfully run
  WSL 2 on Windows 10 or Windows 11:
  - 64-bit processor with [Second Level Address Translation (SLAT)](https://en.wikipedia.org/wiki/Second_Level_Address_Translation)
  - 4GB system RAM
  - Enable hardware virtualization in BIOS/UEFI. For more information, see
    [Virtualization](/manuals/desktop/troubleshoot-and-support/troubleshoot/topics.md#docker-desktop-fails-due-to-virtualization-not-working).
@y
- WSL バージョン 2.1.5 またはそれ以降。バージョンをチェックするには [WSL: Verification and setup](#wsl-verification-and-setup) を参照。
- Windows 10 64 ビット: Enterprise, Pro, Education バージョン 22H2 (ビルド 19045)。
- Windows 11 64 ビット: Enterprise, Pro, Education バージョン 23H2 (ビルド22631) またはそれ以降。
- Windows 上での WSL 2 機能を有効化すること。
  詳しい手順については [Microsoft のドキュメント](https://docs.microsoft.com/en-us/windows/wsl/install-win10) を参照してください。
- Windows 10 または Windows 11 上の WSL 2 を正常動作させるためには、以下のハードウェア要件が必要。
  - [第 2 レベルのアドレス変換](https://en.wikipedia.org/wiki/Second_Level_Address_Translation) (Second Level Address Translation; SLAT) に対応した 64 ビットプロセッサー。
  - 4GB システム RAM
  - BIOS/UEFI におけるハードウェア仮想機能の有効化。
    詳しくは [仮想化](manuals/desktop/troubleshoot-and-support/troubleshoot/topics.md#docker-desktop-fails-due-to-virtualization-not-working) を参照してください。
@z

@x
For more information on setting up WSL 2 with Docker Desktop, see [WSL](/manuals/desktop/features/wsl/_index.md).
@y
Docker Desktop を用いる際の WSL 2 の設定に関する詳細は [WSL](manuals/desktop/features/wsl/_index.md) を参照してください。
@z

@x
> [!NOTE]
>
> Docker only supports Docker Desktop on Windows for those versions of Windows that are still within [Microsoft’s servicing timeline](https://support.microsoft.com/en-us/help/13853/windows-lifecycle-fact-sheet). Docker Desktop is not supported on server versions of Windows, such as Windows Server 2019 or Windows Server 2022. For more information on how to run containers on Windows Server, see [Microsoft's official documentation](https://learn.microsoft.com/virtualization/windowscontainers/quick-start/set-up-environment).
@y
> [!NOTE]
>
> Docker がサポートする Docker Desktop on Windows は、Windows バージョンが [Microsoft のサービスタイムライン](https://support.microsoft.com/en-us/help/13853/windows-lifecycle-fact-sheet) に含まれているもののみです。
> Docker Desktop は Windows Server 2019 や Windows Server 2022 といったサーバーバージョンに対してはサポートされていません。
> Windows Server 上においてコンテナーを実行する方法については [Microsoftの公式ドキュメント](https://learn.microsoft.com/virtualization/windowscontainers/quick-start/set-up-environment) を参照してください。
@z

@x
> [!IMPORTANT]
>
> To run [Windows containers](#windows-containers), you need Windows 10 or Windows 11 Professional or Enterprise edition.
> Windows Home or Education editions only allow you to run Linux containers.
@y
> [!IMPORTANT]
>
> [Windows コンテナー](#windows-containers) を実行する場合は、Windows 10 または Windows 11 の Professional または Enterprise エディションが必要です。
> Windows Home または Education エディションでは Linux コンテナーしか動作させることはできません。
@z

@x
{{< /tab >}}
{{< tab name="Hyper-V backend, x86_64" >}}
@y
{{< /tab >}}
{{< tab name="Hyper-V バックエンド, x86_64" >}}
@z

@x
- Windows 10 64-bit: Enterprise, Pro, or Education version 22H2 (build 19045).
- Windows 11 64-bit: Enterprise, Pro, or Education version 23H2 (build 22631) or higher.
- Turn on Hyper-V and Containers Windows features.
- The following hardware prerequisites are required to successfully run Client
  Hyper-V on Windows 10:
@y
- Windows 10 64 ビット: Enterprise, Pro, Education バージョンの 22H2 (ビルド 19045)。
- Windows 11 64 ビット: Enterprise, Pro, Education バージョンの 23H2 (ビルド 22631) またはそれ以降。
- Windows 上での Hyper-V およびコンテナーウィンドウ機能を有効化すること。
- Windows 10 上のクライアント Hyper-V を正常動作させるためには、以下のハードウェア要件が必要。
@z

@x
  - 64 bit processor with [Second Level Address Translation (SLAT)](https://en.wikipedia.org/wiki/Second_Level_Address_Translation)
  - 4GB system RAM
  - Turn on BIOS/UEFI-level hardware virtualization support in the
    BIOS/UEFI settings. For more information, see
    [Virtualization](/manuals/desktop/troubleshoot-and-support/troubleshoot/topics.md#virtualization).
@y
  - [第 2 レベルのアドレス変換](https://en.wikipedia.org/wiki/Second_Level_Address_Translation) (Second Level Address Translation; SLAT) に対応した 64 ビットプロセッサー。
  - 4GB システム RAM
  - BIOS/UEFI におけるハードウェア仮想機能の有効化。
    詳しくは [仮想化](manuals/desktop/troubleshoot-and-support/troubleshoot/topics.md#virtualization) を参照してください。
@z

@x
> [!NOTE]
>
> Docker only supports Docker Desktop on Windows for those versions of Windows that are still within [Microsoft’s servicing timeline](https://support.microsoft.com/en-us/help/13853/windows-lifecycle-fact-sheet). Docker Desktop is not supported on server versions of Windows, such as Windows Server 2019 or Windows Server 2022. For more information on how to run containers on Windows Server, see [Microsoft's official documentation](https://learn.microsoft.com/virtualization/windowscontainers/quick-start/set-up-environment).
@y
> [!NOTE]
>
> Docker がサポートする Docker Desktop on Windows は、Windows バージョンが [Microsoft のサービスタイムライン](https://support.microsoft.com/en-us/help/13853/windows-lifecycle-fact-sheet) に含まれているもののみです。
> Docker Desktop は Windows Server 2019 や Windows Server 2022 といったサーバーバージョンに対してはサポートされていません。
> Windows Server 上においてコンテナーを実行する方法については [Microsoftの公式ドキュメント](https://learn.microsoft.com/virtualization/windowscontainers/quick-start/set-up-environment) を参照してください。
@z

@x
> [!IMPORTANT]
>
> To run [Windows containers](#windows-containers), you need Windows 10 or Windows 11 Professional or Enterprise edition.
> Windows Home or Education editions only allow you to run Linux containers.
@y
> [!IMPORTANT]
>
> [Windows コンテナー](#windows-containers) を実行する場合は、Windows 10 または Windows 11 の Professional または Enterprise エディションが必要です。
> Windows Home または Education エディションでは Linux コンテナーしか動作させることはできません。
@z

@x
{{< /tab >}}
{{< tab name="WSL 2 backend, Arm (Early Access)" >}}
@y
{{< /tab >}}
{{< tab name="WSL 2 backend, Arm (早期アクセス)" >}}
@z

@x
- WSL version 2.1.5 or later. To check your version, see [WSL: Verification and setup](#wsl-verification-and-setup)
- Windows 10 64-bit: Enterprise, Pro, or Education version 22H2 (build 19045).
- Windows 11 64-bit: Enterprise, Pro, or Education version 23H2 (build 22631) or higher.
- Turn on the WSL 2 feature on Windows. For detailed instructions, refer to the
  [Microsoft documentation](https://docs.microsoft.com/en-us/windows/wsl/install-win10).
- The following hardware prerequisites are required to successfully run
  WSL 2 on Windows 10 or Windows 11:
  - 64-bit processor with [Second Level Address Translation (SLAT)](https://en.wikipedia.org/wiki/Second_Level_Address_Translation)
  - 4GB system RAM
  - Enable hardware virtualization in BIOS/UEFI. For more information, see
    [Virtualization](/manuals/desktop/troubleshoot-and-support/troubleshoot/topics.md#virtualization).
@y
- WSL バージョン 2.1.5 またはそれ以降。バージョンをチェックするには [WSL: Verification and setup](#wsl-verification-and-setup) を参照。
- Windows 10 64 ビット: Enterprise, Pro, Education バージョン 22H2 (ビルド 19045)。
- Windows 11 64 ビット: Enterprise, Pro, Education バージョン 23H2 (ビルド 22631) またはそれ以降。
- Windows 上での WSL 2 機能を有効化すること。
  詳しい手順については [Microsoft のドキュメント](https://docs.microsoft.com/en-us/windows/wsl/install-win10) を参照してください。
- Windows 10 または Windows 11 上の WSL 2 を正常動作させるためには、以下のハードウェア要件が必要。
  - [第 2 レベルのアドレス変換](https://en.wikipedia.org/wiki/Second_Level_Address_Translation) (Second Level Address Translation; SLAT) に対応した 64 ビットプロセッサー。
  - 4GB システム RAM
  - BIOS/UEFI におけるハードウェア仮想機能の有効化。
    詳しくは [仮想化](manuals/desktop/troubleshoot-and-support/troubleshoot/topics.md#virtualization) を参照してください。
@z

@x
> [!IMPORTANT]
>
> Windows containers are not supported.
@y
> [!IMPORTANT]
>
> Windows コンテナーはサポートされていません。
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
For more information, see [Running Docker Desktop in a VM or VDI environment](/manuals/desktop/setup/vm-vdi.md).
@y
Docker Desktop を VMware ESXi あるいは Azure VM において動作させるのは、Docker Business 購入者に対してサポートされています。
これを利用するには、まずハイパーバイザー内においてネスト化仮想環境を有効にする必要があります。
詳しくは [VM または VDI 環境での Docker Desktop の実行](manuals/desktop/setup/vm-vdi.md) を参照してください。
@z

@x
## Install Docker Desktop on Windows
@y
## Windows への Docker Desktop のインストール {#install-docker-desktop-on-windows}
@z

@x
### Install interactively
@y
### 対話的なインストール {#install-interactively}
@z

@x
1. Download the installer using the download button at the top of the page, or from the [release notes](/manuals/desktop/release-notes.md).
@y
1. ページ最上部にあるダウンロードボタンをクリックしてインストーラーをダウンロードするか、あるいは [リリースノート](manuals/desktop/release-notes.md) ページからダウンロードします。
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
    On systems that support only one backend, Docker Desktop automatically selects the available option.
@y
    バックエンドを一つしかサポートしないシステムでは、Docker Desktop が利用可能なオプションを自動的に選択します。
@z

@x
4. Follow the instructions on the installation wizard to authorize the installer and proceed with the installation.
@y
4. インストールウィザードの手順に従ってインストーラーを承認して、インストールを完了させます。
@z

@x
5. When the installation is successful, select **Close** to complete the installation process.
@y
5. インストールが正常に行われたら **Close** をクリックして作業を終了します。
@z

@x
6. [Start Docker Desktop](#start-docker-desktop).
@y
6. [Docker Desktop の起動](#start-docker-desktop) を行います。
@z

@x
If your administrator account is different to your user account, you must add the user to the **docker-users** group to access features that require higher privileges, such as creating and managing the Hyper-V VM, or using Windows containers:
@y
利用しているユーザーアカウントが管理アカウントではない場合、**docker-users** グループにユーザーを追加する必要があります。
これによって Hyper-V VM の生成管理といった、より高権限を必要とする機能にアクセスできます。
これを行わない場合には Windows コンテナーを利用することになります。
@z

@x
1. Run **Computer Management** as an **administrator**.
2. Navigate to **Local Users and Groups** > **Groups** > **docker-users**. 
3. Right-click to add the user to the group.
4. Sign out and sign back in for the changes to take effect.
@y
1. **administrator** (管理者) 権限により **Computer Management** (コンピューター管理) を開きます。
2. **Local Users and Groups** > **Groups** > **docker-users** を順に開きます。
3. 右クリックによってユーザーをそのグループに追加します。
4. 設定変更を有効にするため、いったんサインアウトした上で再度サインインします。
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
デフォルトで Docker Desktop は `C:\Program Files\Docker\Docker` にインストールされます。
@z

@x
If your administrator account is different to your user account, you must add the user to the **docker-users** group to access features that require higher privileges, such as creating and managing the Hyper-V VM, or using Windows containers.
@y
利用しているユーザーアカウントが管理アカウントではない場合、**docker-users** グループにユーザーを追加する必要があります。
これによって Hyper-V VM の生成管理といった、より高権限を必要とする機能にアクセスできます。
これを行わない場合には Windows コンテナーを利用することになります。
@z

% snip command...

@x
See the [Installer flags](#installer-flags) section to see what flags the `install` command accepts.
@y
`install` コマンドがどのようなフラグを受け付けるかについては [インストーラーのフラグ](#installer-flags) の節を参照してください。
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
1. Docker を検索し、検索結果の中から **Docker Desktop** を選択します。
@z

@x
2. The Docker menu ({{< inline-image src="images/whale-x.svg" alt="whale menu" >}}) displays the Docker Subscription Service Agreement.
@y
2. Docker メニュー ({{< inline-image src="images/whale-x.svg" alt="クジラメニュー" >}}) には、Docker Subscription Service Agreement（サブスクリプションサービス契約）画面が表示されます。
@z

@x
   {{% include "desktop-license-update.md" %}}
@y
   {{% include "desktop-license-update.md" %}}
@z

@x
3. Select **Accept** to continue. Docker Desktop starts after you accept the terms.
@y
3. **Accept** を選びます。
   契約条項を受け入れれば Docker Desktop が起動します。
@z

@x
   Note that Docker Desktop won't run if you do not agree to the terms. You can choose to accept the terms at a later date by opening Docker Desktop.
@y
   契約条項への同意がなければ Docker Desktop を起動させることはできません。
   後日 Docker Desktop を開いたときに、改めて契約条項に同意することができます。
@z

@x
   For more information, see [Docker Desktop Subscription Service Agreement](https://www.docker.com/legal/docker-subscription-service-agreement/). It is recommended that you read the [FAQs](https://www.docker.com/pricing/faq).
@y
   詳しくは [Docker Desktop サブスクリプションサービス契約](https://www.docker.com/legal/docker-subscription-service-agreement/) を参照してください。
   [FAQ](https://www.docker.com/pricing/faq) を読むこともお勧めします。
@z

@x
> [!TIP]
>
> As an IT administrator, you can use endpoint management (MDM) software to identify the number of Docker Desktop instances and their versions within your environment. This can provide accurate license reporting, help ensure your machines use the latest version of Docker Desktop, and enable you to [enforce sign-in](/manuals/enterprise/security/enforce-sign-in/_index.md).
> - [Intune](https://learn.microsoft.com/en-us/mem/intune/apps/app-discovered-apps)
> - [Jamf](https://docs.jamf.com/10.25.0/jamf-pro/administrator-guide/Application_Usage.html)
> - [Kandji](https://support.kandji.io/support/solutions/articles/72000559793-view-a-device-application-list)
> - [Kolide](https://www.kolide.com/features/device-inventory/properties/mac-apps)
> - [Workspace One](https://blogs.vmware.com/euc/2022/11/how-to-use-workspace-one-intelligence-to-manage-app-licenses-and-reduce-costs.html)
@y
> [!TIP]
>
> IT 管理者としては、エンドポイント管理 (MDM) ソフトウェアを使えば、環境内の Docker Desktop インスタンスとそのバージョンを識別できるようになります。
> この機能によって正確なライセンス情報を得ることができ、Docker Desktop の最新バージョンを常に利用できるようになります。
> また [強制的なサインイン](manuals/enterprise/security/enforce-sign-in/_index.md) の機能もあります。
> - [Intune](https://learn.microsoft.com/en-us/mem/intune/apps/app-discovered-apps)
> - [Jamf](https://docs.jamf.com/10.25.0/jamf-pro/administrator-guide/Application_Usage.html)
> - [Kandji](https://support.kandji.io/support/solutions/articles/72000559793-view-a-device-application-list)
> - [Kolide](https://www.kolide.com/features/device-inventory/properties/mac-apps)
> - [Workspace One](https://blogs.vmware.com/euc/2022/11/how-to-use-workspace-one-intelligence-to-manage-app-licenses-and-reduce-costs.html)
@z

@x
## Advanced system configuration and installation options
@y
## Advanced system configuration and installation options
@z

@x
### WSL: Verification and setup
@y
### WSL: Verification and setup
@z

@x
If you have chosen to use WSL, first verify that your installed version meets system requirements by running the following command in your terminal:
@y
If you have chosen to use WSL, first verify that your installed version meets system requirements by running the following command in your terminal:
@z

% snip command...

@x
If version details do not appear, you are likely using the inbox version of WSL. This version does not support modern capabilities and must be updated.
@y
If version details do not appear, you are likely using the inbox version of WSL. This version does not support modern capabilities and must be updated.
@z

@x
You can update or install WSL using one of the following methods:
@y
You can update or install WSL using one of the following methods:
@z

@x
#### Option 1: Install or update WSL via the terminal
@y
#### Option 1: Install or update WSL via the terminal
@z

@x
1. Open PowerShell or Windows Command Prompt in administrator mode.
2. Run either the install or update command. You may be prompted to restart your machine. For more information, refer to [Install WSL](https://learn.microsoft.com/en-us/windows/wsl/install).
@y
1. Open PowerShell or Windows Command Prompt in administrator mode.
2. Run either the install or update command. You may be prompted to restart your machine. For more information, refer to [Install WSL](https://learn.microsoft.com/en-us/windows/wsl/install).
@z

% snip command...

@x
#### Option 2: Install WSL via the MSI package
@y
#### Option 2: Install WSL via the MSI package
@z

@x
If Microsoft Store access is blocked due to security policies:
@y
If Microsoft Store access is blocked due to security policies:
@z

@x
1. Go to the official [WSL GitHub Releases page](https://github.com/microsoft/WSL/releases).
2. Download the `.msi` installer from the latest stable release (under the Assets drop-down).
3. Run the downloaded installer and follow the setup instructions.
@y
1. Go to the official [WSL GitHub Releases page](https://github.com/microsoft/WSL/releases).
2. Download the `.msi` installer from the latest stable release (under the Assets drop-down).
3. Run the downloaded installer and follow the setup instructions.
@z

@x
### Installer flags
@y
### インストーラーのフラグ {#installer-flags}
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
#### Installation behavior
@y
#### インストール動作 {#installation-behavior}
@z

@x
- `--quiet`: Suppresses information output when running the installer 
- `--accept-license`: Accepts the [Docker Subscription Service Agreement](https://www.docker.com/legal/docker-subscription-service-agreement) now, rather than requiring it to be accepted when the application is first run
- `--installation-dir=<path>`: Changes the default installation location (`C:\Program Files\Docker\Docker`)
- `--backend=<backend name>`: Selects the default backend to use for Docker Desktop, `hyper-v`, `windows` or `wsl-2` (default)
- `--always-run-service`: After installation completes, starts `com.docker.service` and sets the service startup type to Automatic. This circumvents the need for administrator privileges, which are otherwise necessary to start `com.docker.service`. `com.docker.service` is required by Windows containers and Hyper-V backend.
@y
- `--quiet`: インストーラーの起動時に情報出力を省略します。
- `--accept-license`: [Docker サブスクリプションサービス契約](https://www.docker.com/legal/docker-subscription-service-agreement) をここで受け入れます。これを行わない場合は、アプリケーションの初回起動時に行うことになります。
- `--installation-dir=<パス>`: デフォルトのインストール先 (`C:\Program Files\Docker\Docker`) を変更します。
- `--backend=<バックエンド名>`: Docker Desktop が利用するデフォルトのバックエンドを指定します。`hyper-v`、`windows`、`wsl-2` (デフォルト) のいずれか。
- `--always-run-service`: インストール完了後に `com.docker.service` を起動し、このサービスの起動タイプを Automatic (自動) に設定します。
  これによって管理者権限がなくても稼働できるようになります。
  これがなかった場合 `com.docker.service` の起動には管理者権限が必要です。
  `com.docker.service` は Windows コンテナーと Hyper-V バックエンドのために必要となります。
@z

@x
#### Security and access control
@y
#### セキュリティとアクセス制御 {#security-and-access-control}
@z

@x
- `--allowed-org=<org name>`: Requires the user to sign in and be part of the specified Docker Hub organization when running the application
- `--admin-settings`: Automatically creates an `admin-settings.json` file which is used by admins to control certain Docker Desktop settings on client machines within their organization. For more information, see [Settings Management](/manuals/enterprise/security/hardened-desktop/settings-management/_index.md).
  - It must be used together with the `--allowed-org=<org name>` flag. 
  - For example:`--allowed-org=<org name> --admin-settings="{'configurationFileVersion': 2, 'enhancedContainerIsolation': {'value': true, 'locked': false}}"`
- `--no-windows-containers`: Disables the Windows containers integration. This can improve security. For more information, see [Windows containers](/manuals/desktop/setup/install/windows-permission-requirements.md#windows-containers).
@y
- `--allowed-org=<組織名>`: アプリケーションの実行にあたっては、ユーザーがサインインしていることを要求し、指定された Docker Hub 組織のメンバーであることを要求します。
- `--admin-settings`: admin が利用する `admin-settings.json` ファイルを自動生成します。
  これは組織内にあるクライアントマシン上の Docker Desktop における特定設定項目を制御するものです。
  詳しくは [設定管理](manuals/enterprise/security/hardened-desktop/settings-management/_index.md) を参照してください。
  - これは `--allowed-org=<組織名>` フラグとともに用いなければなりません。
  - たとえば以下のとおりです。`--allowed-org=<org name> --admin-settings="{'configurationFileVersion': 2, 'enhancedContainerIsolation': {'value': true, 'locked': false}}"`
- `--no-windows-containers`: Windows コンテナー統合機能を無効にします。
  これによってセキュリティを向上させます。
  詳しくは [Windows コンテナー](manuals/desktop/setup/install/windows-permission-requirements.md#windows-containers) を参照してください。
@z

@x
#### Proxy configuration
@y
#### プロキシー設定 {#proxy-configuration}
@z

@x
- `--proxy-http-mode=<mode>`: Sets the HTTP Proxy mode, `system` (default) or `manual`
- `--override-proxy-http=<URL>`: Sets the URL of the HTTP proxy that must be used for outgoing HTTP requests, requires `--proxy-http-mode` to be `manual`
- `--override-proxy-https=<URL>`: Sets the URL of the HTTP proxy that must be used for outgoing HTTPS requests, requires `--proxy-http-mode` to be `manual`
- `--override-proxy-exclude=<hosts/domains>`: Bypasses proxy settings for the hosts and domains. Uses a comma-separated list.
- `--proxy-enable-kerberosntlm`: Enables Kerberos and NTLM proxy authentication. If you are enabling this, ensure your proxy server is properly configured for Kerberos/NTLM authentication. Available with Docker Desktop 4.32 and later.
- `--override-proxy-pac=<PAC file URL>`: Sets the PAC file URL. This setting takes effect only when using `manual` proxy mode.
- `--override-proxy-embedded-pac=<PAC script>`: Specifies an embedded PAC (Proxy Auto-Config) script. This setting takes effect only when using `manual` proxy mode and has precedence over the `--override-proxy-pac` flag.
@y
- `--proxy-http-mode=<mode>`: HTTP プロキシーモードを設定します。`system` (デフォルト) または `manual` です。
- `--override-proxy-http=<URL>`: HTTP リクエストに対して用いられる HTTP プロキシーの URL を設定します。
  `--proxy-http-mode` を `manual` に設定しておく必要があります。
- `--override-proxy-https=<URL>`: HTTPS リクエストに対して用いられる HTTP プロキシーの URL を設定します。
  `--proxy-http-mode` を `manual` に設定しておく必要があります。
- `--override-proxy-exclude=<hosts/domains>`: ホストとドメインに対するプロキシー設定をバイパスします。
  カンマ区切りのリストとして指定します。
- `--proxy-enable-kerberosntlm`: Kerberos と NTLM プロキシー認証を有効にします。
  これを有効にすると Kerberos/NTLM 認証への設定がプロキシーサーバーに対して適切に設定されます。
  Docker Desktop 4.32 またはそれ以降において利用可能です。
- `--override-proxy-pac=<PAC file URL>`: Sets the PAC file URL. This setting takes effect only when using `manual` proxy mode.
- `--override-proxy-embedded-pac=<PAC script>`: Specifies an embedded PAC (Proxy Auto-Config) script. This setting takes effect only when using `manual` proxy mode and has precedence over the `--override-proxy-pac` flag.
@z

@x
##### Example of specifying PAC file
@y
##### PAC ファイルの設定例 {#example-of-specifying-pac-file}
@z

% snip code...

@x
##### Example of specifying PAC script
@y
##### PAC スクリプトの設定例 {#example-of-specifying-pac-script}
@z

% snip code...

@x
#### Data root and disk location
@y
#### Data root and disk location
@z

@x
- `--hyper-v-default-data-root=<path>`: Specifies the default location for the Hyper-V VM disk. 
- `--windows-containers-default-data-root=<path>`: Specifies the default location for the Windows containers.
- `--wsl-default-data-root=<path>`: Specifies the default location for the WSL distribution disk.
@y
- `--hyper-v-default-data-root=<パス>`: Hyper-V VM ディスクのデフォルトパスを指定します。
- `--windows-containers-default-data-root=<パス>`: Windows コンテナーのデフォルトパスを指定します。
- `--wsl-default-data-root=<path>`: WSL 配布ディスクのデフォルトパスを指定します。
@z

@x
### Administrator privileges
@y
### 管理者権限 {#administrator-privileges}
@z

@x
Installing Docker Desktop requires administrator privileges. However, once installed, it can be used without administrative access. Some actions, though, still need elevated permissions. See [Understand permission requirements for Windows](./windows-permission-requirements.md) for more detail.
@y
Installing Docker Desktop requires administrator privileges. However, once installed, it can be used without administrative access. Some actions, though, still need elevated permissions. See [Understand permission requirements for Windows](./windows-permission-requirements.md) for more detail.
@z

@x
See the [FAQs](/manuals/desktop/troubleshoot-and-support/faqs/general.md#how-do-i-run-docker-desktop-without-administrator-privileges) on how to install and run Docker Desktop without needing administrator privileges.
@y
See the [FAQs](manuals/desktop/troubleshoot-and-support/faqs/general.md#how-do-i-run-docker-desktop-without-administrator-privileges) on how to install and run Docker Desktop without needing administrator privileges.
@z

@x
If you're an IT admin and your users do not have administrator rights and plan to perform operations that require elevated privileges, be sure to install Docker Desktop using the `--always-run-service` installer flag. This ensures those actions can still be executed without prompting for User Account Control (UAC) elevation. See [Installer Flags](#installer-flags) for more detail.
@y
If you're an IT admin and your users do not have administrator rights and plan to perform operations that require elevated privileges, be sure to install Docker Desktop using the `--always-run-service` installer flag. This ensures those actions can still be executed without prompting for User Account Control (UAC) elevation. See [Installer Flags](#installer-flags) for more detail.
@z

@x
### Windows containers 
@y
### Windows containers 
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
  [I want to connect to a container from Windows](/manuals/desktop/features/networking.md#i-want-to-connect-to-a-container-from-the-host)
@y
- To understand how to connect to Windows containers from the local host, see
  [I want to connect to a container from Windows](manuals/desktop/features/networking.md#i-want-to-connect-to-a-container-from-the-host)
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
## Where to go next
@y
## 次に読むものは {#where-to-go-next}
@z

@x
- Explore [Docker's subscriptions](https://www.docker.com/pricing/) to see what Docker can offer you.
- [Get started with Docker](/get-started/introduction/_index.md).
- [Explore Docker Desktop](/manuals/desktop/use-desktop/_index.md) and all its features.
- [Troubleshooting](/manuals/desktop/troubleshoot-and-support/troubleshoot/_index.md) describes common problems, workarounds, and
  how to get support.
- [FAQs](/manuals/desktop/troubleshoot-and-support/faqs/general.md) provide answers to frequently asked questions.
- [Release notes](/manuals/desktop/release-notes.md) lists component updates, new features, and improvements associated with Docker Desktop releases.
- [Back up and restore data](/manuals/desktop/settings-and-maintenance/backup-and-restore.md) provides instructions on backing up and restoring data related to Docker.
@y
- Explore [Docker's subscriptions](https://www.docker.com/pricing/) to see what Docker can offer you.
- [Get started with Docker](get-started/introduction/_index.md).
- [Explore Docker Desktop](manuals/desktop/use-desktop/_index.md) and all its features.
- [Troubleshooting](manuals/desktop/troubleshoot-and-support/troubleshoot/_index.md) describes common problems, workarounds, and
  how to get support.
- [FAQs](manuals/desktop/troubleshoot-and-support/faqs/general.md) provide answers to frequently asked questions.
- [Release notes](manuals/desktop/release-notes.md) lists component updates, new features, and improvements associated with Docker Desktop releases.
- [Back up and restore data](manuals/desktop/settings-and-maintenance/backup-and-restore.md) provides instructions on backing up and restoring data related to Docker.
@z
