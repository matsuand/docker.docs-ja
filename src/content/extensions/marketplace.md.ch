%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: Extensions
keywords: Docker Extensions, Docker Desktop, Linux, Mac, Windows, Marketplace
title: Marketplace extensions
@y
description: Extensions
keywords: Docker Extensions, Docker Desktop, Linux, Mac, Windows, Marketplace
title: マーケットプレースの Extensions
@z

@x
There are two types of extensions available in the Extensions Marketplace:
- Docker-reviewed extensions
- Self-published extensions
@y
Extensions マーケットプレースからは、以下に示す二種類の Extensions が入手できます。
- Docker によりレビューされた Extensions
- 独自公開された Extensions
@z

@x
Docker-reviewed extensions are manually reviewed by the Docker Extensions team to ensure an extra level of trust
and quality. They appear as **Reviewed** in the Marketplace.
@y
Docker によりレビューされた Extensions は、Docker Extensions チームが手作業によってレビューを行ったものであり、ハイレベルの信頼と品質が保証されています。
マーケットプレース内では **Reviewed** (レビューされている) として表示されます。
@z

@x
Self-published extensions are autonomously published by extension developers and go through an automated validation process. They appear as **Not reviewed** in the Marketplace.
@y
独自公開された Extensions は、Extensions 開発者が自発的に公開したものであり、自動検証プロセスを経ています。
マーケットプレース内では **Not reviewed** (レビューされていない) として表示されます。
@z

@x
## Install an extension
@y
## Extension のインストール {#install-an-extension}
@z

@x
> [!NOTE]
>
> For some extensions, a separate account needs to be created before use.
@y
> [!NOTE]
>
> Extension の中には、利用にあたって独自のアカウントを生成することが必要となります。
@z

@x
To install an extension:
@y
Extension をインストールするには以下を行います。
@z

@x
1. Open Docker Desktop.
2. From the Docker Dashboard, select the **Extensions** tab.
   The Extensions Marketplace opens on the **Browse** tab.
3. Browse the available extensions.
   You can sort the list of extensions by **Recently added**, **Most installed**, or alphabetically. Alternatively, use the **Content** or **Categories** drop-down menu to search for extensions by whether they have been reviewed or not, or by category.
4. Choose an extension and select **Install**.
@y
1. Docker Desktop を開きます。
2. Dashboard 画面から **Extensions** タブを選びます。
   **Browse** (ブラウザー) タブに Extensions マーケットプレースが開きます。
3. 利用可能な Extension を探します。
   Extension の一覧は **Recently added** (最新追加分)、**Most installed** (人気のインストール)、またアルファベット順に並び変えることができます。
   またドロップダウンメニューから **Content** (内容) あるいは **Categories** (カテゴリー) を選ぶことで、レビューの有無やカテゴリー順により、検索を容易に行うことができます。
4. 目的の Extension を選んで **Install** (インストール) をクリックします。
@z

@x
From here, you can select **Open** to access the extension or install additional extensions. The extension also appears in the left-hand menu and in the **Manage** tab.
@y
From here, you can select **Open** to access the extension or install additional extensions. The extension also appears in the left-hand menu and in the **Manage** tab.
@z

@x
## Update an extension
@y
## Extension のアップデート {#update-an-extension}
@z

@x
You can update any extension outside of Docker Desktop releases. To update an extension to the latest version, navigate to the Docker Dashboard and select the **Manage** tab.
@y
You can update any extension outside of Docker Desktop releases. To update an extension to the latest version, navigate to the Docker Dashboard and select the **Manage** tab.
@z

@x
The **Manage** tab displays with all your installed extensions. If an extension has a new version available, it displays an **Update** button.
@y
The **Manage** tab displays with all your installed extensions. If an extension has a new version available, it displays an **Update** button.
@z

@x
## Uninstall an extension
@y
## Extension のアンインストール {#uninstall-an-extension}
@z

@x
You can uninstall an extension at any time.
@y
You can uninstall an extension at any time.
@z

@x
> [!NOTE]
>
> Any data used by the extension that's stored in a volume must be manually deleted.
@y
> [!NOTE]
>
> Any data used by the extension that's stored in a volume must be manually deleted.
@z

@x
1. Navigate to the Docker Dashboard and select the **Manage** tab.
   This displays a list of extensions you've installed.
2. Select the ellipsis to the right of extension you want to uninstall.
3. Select **Uninstall**.
@y
1. Navigate to the Docker Dashboard and select the **Manage** tab.
   This displays a list of extensions you've installed.
2. Select the ellipsis to the right of extension you want to uninstall.
3. Select **Uninstall**.
@z
