%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Learn how to resolve issues affecting macOS users of Docker Desktop, including startup problems and false malware warnings, with upgrade, patch, and workaround solutions.
keywords: Docker desktop, fix, mac, troubleshooting, macos, false malware warning, patch, upgrade solution
title: Resolve the recent Docker Desktop issue on macOS
linkTitle: Fix startup issue for Mac
@y
description: Learn how to resolve issues affecting macOS users of Docker Desktop, including startup problems and false malware warnings, with upgrade, patch, and workaround solutions.
keywords: Docker desktop, fix, mac, troubleshooting, macos, false malware warning, patch, upgrade solution
title: Resolve the recent Docker Desktop issue on macOS
linkTitle: Fix startup issue for Mac
@z

@x
This guide provides steps to address a recent issue affecting some macOS users of Docker Desktop. The issue may prevent Docker Desktop from starting and in some cases, may also trigger inaccurate malware warnings. For more details about the incident, see the [blog post](https://www.docker.com/blog/incident-update-docker-desktop-for-mac/).
@y
This guide provides steps to address a recent issue affecting some macOS users of Docker Desktop. The issue may prevent Docker Desktop from starting and in some cases, may also trigger inaccurate malware warnings. For more details about the incident, see the [blog post](https://www.docker.com/blog/incident-update-docker-desktop-for-mac/).
@z

@x
> [!NOTE]
>
> Docker Desktop versions 4.28 and earlier are not impacted by this issue. 
@y
> [!NOTE]
>
> Docker Desktop versions 4.28 and earlier are not impacted by this issue. 
@z

@x
## Available solutions
@y
## Available solutions
@z

@x
There are a few options available depending on your situation:
@y
There are a few options available depending on your situation:
@z

@x
### Upgrade to Docker Desktop version 4.37.2 (recommended)
@y
### Upgrade to Docker Desktop version 4.37.2 (recommended)
@z

@x
The recommended way is to upgrade to the latest Docker Desktop version which is version 4.37.2. 
@y
The recommended way is to upgrade to the latest Docker Desktop version which is version 4.37.2. 
@z

@x
If possible, update directly through the app. If not, and you’re still seeing the malware pop-up, follow the steps below:
@y
If possible, update directly through the app. If not, and you’re still seeing the malware pop-up, follow the steps below:
@z

@x
1. Kill the Docker process that cannot start properly:
@y
1. Kill the Docker process that cannot start properly:
@z

% snip command...

@x
2. Make sure the malware pop-up is permanently closed. 
@y
2. Make sure the malware pop-up is permanently closed. 
@z

@x
3. [Download and install version 4.37.2](/manuals/desktop/release-notes.md#4372).
@y
3. [Download and install version 4.37.2](manuals/desktop/release-notes.md#4372).
@z

@x
4. Launch Docker Desktop. A privileged pop-up message displays after 5 to 10 seconds.
@y
4. Launch Docker Desktop. A privileged pop-up message displays after 5 to 10 seconds.
@z

@x
5. Enter your password.
@y
5. Enter your password.
@z

@x
You should now see the Docker Desktop Dashboard.
@y
You should now see the Docker Desktop Dashboard.
@z

@x
### Install a patch if you have version 4.32 - 4.36
@y
### Install a patch if you have version 4.32 - 4.36
@z

@x
If you can’t upgrade to the latest version and you’re seeing the malware pop-up, follow the steps below:
@y
If you can’t upgrade to the latest version and you’re seeing the malware pop-up, follow the steps below:
@z

@x
1. Kill the Docker process that cannot start properly:
@y
1. Kill the Docker process that cannot start properly:
@z

% snip command...

@x
2. Make sure the malware pop-up is permanently closed.
@y
2. Make sure the malware pop-up is permanently closed.
@z

@x
3. [Download and install the patched installer](/manuals/desktop/release-notes.md) that matches your current base version. For example if you have version 4.36.0, install 4.36.1.
@y
3. [Download and install the patched installer](manuals/desktop/release-notes.md) that matches your current base version. For example if you have version 4.36.0, install 4.36.1.
@z

@x
4. Launch Docker Desktop. A privileged pop-up message displays after 5 to 10 seconds.
@y
4. Launch Docker Desktop. A privileged pop-up message displays after 5 to 10 seconds.
@z

@x
5. Enter your password.
@y
5. Enter your password.
@z

@x
You should now see the Docker Desktop Dashboard.
@y
You should now see the Docker Desktop Dashboard.
@z

@x
## MDM script
@y
## MDM script
@z

@x
If you are an IT administrator, you can use the following script as a workaround for your developers if they have a re-signed version of Docker Desktop version 4.35 or later.
@y
If you are an IT administrator, you can use the following script as a workaround for your developers if they have a re-signed version of Docker Desktop version 4.35 or later.
@z

@x within code
# Stop the docker services
@y
# docker サービスの停止
@z
@x
# Stop the vmnetd service
@y
# vmnetd サービスの停止
@z
@x
# Stop the socket service
@y
# socket サービスの停止
@z
@x
# Remove vmnetd binary
@y
# vmnetd バイナリの削除
@z
@x
# Remove socket binary
@y
# socket バイナリの削除
@z
@x
# Install new binaries
@y
# 新たなバイナリのインストール
@z
