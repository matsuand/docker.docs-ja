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
   ```console
   $ sudo launchctl bootout system/com.docker.vmnetd 2>/dev/null || true
   $ sudo launchctl bootout system/com.docker.socket 2>/dev/null || true
@y
1. Kill the Docker process that cannot start properly:
   ```console
   $ sudo launchctl bootout system/com.docker.vmnetd 2>/dev/null || true
   $ sudo launchctl bootout system/com.docker.socket 2>/dev/null || true
@z

@x
   $ sudo rm /Library/PrivilegedHelperTools/com.docker.vmnetd || true
   $ sudo rm /Library/PrivilegedHelperTools/com.docker.socket || true
@y
   $ sudo rm /Library/PrivilegedHelperTools/com.docker.vmnetd || true
   $ sudo rm /Library/PrivilegedHelperTools/com.docker.socket || true
@z

@x
   $ ps aux | grep -i docker | awk '{print $2}' | sudo xargs kill -9 2>/dev/null
   ```
@y
   $ ps aux | grep -i docker | awk '{print $2}' | sudo xargs kill -9 2>/dev/null
   ```
@z

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
> [!TIP]
>
> If the malware pop-up persists after completing these steps and Docker is in the Trash, try emptying the Trash and rerunning the steps.
@y
> [!TIP]
>
> If the malware pop-up persists after completing these steps and Docker is in the Trash, try emptying the Trash and rerunning the steps.
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
   ```console
   $ sudo launchctl bootout system/com.docker.vmnetd 2>/dev/null || true
   $ sudo launchctl bootout system/com.docker.socket 2>/dev/null || true
@y
1. Kill the Docker process that cannot start properly:
   ```console
   $ sudo launchctl bootout system/com.docker.vmnetd 2>/dev/null || true
   $ sudo launchctl bootout system/com.docker.socket 2>/dev/null || true
@z

@x
   $ sudo rm /Library/PrivilegedHelperTools/com.docker.vmnetd || true
   $ sudo rm /Library/PrivilegedHelperTools/com.docker.socket || true
@y
   $ sudo rm /Library/PrivilegedHelperTools/com.docker.vmnetd || true
   $ sudo rm /Library/PrivilegedHelperTools/com.docker.socket || true
@z

@x
   $ ps aux | grep docker | awk '{print $2}' | sudo xargs kill -9 2>/dev/null
   ```
@y
   $ ps aux | grep docker | awk '{print $2}' | sudo xargs kill -9 2>/dev/null
   ```
@z

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
> [!TIP]
>
> If the malware pop-up persists after completing these steps and Docker is in the Trash, try emptying the Trash and rerunning the steps.
@y
> [!TIP]
>
> If the malware pop-up persists after completing these steps and Docker is in the Trash, try emptying the Trash and rerunning the steps.
@z

@x
## MDM script
@y
## MDM script
@z

@x
If you are an IT administrator and your developers are seeing the malware pop-up:
@y
If you are an IT administrator and your developers are seeing the malware pop-up:
@z

@x
1. Make sure your developers have a re-signed version of Docker Desktop version 4.32 or later.
2. Run the following script:
@y
1. Make sure your developers have a re-signed version of Docker Desktop version 4.32 or later.
2. Run the following script:
@z

@x
   ```console
   #!/bin/bash
@y
   ```console
   #!/bin/bash
@z

@x
   # Stop the docker services
   echo "Stopping Docker..."
   sudo pkill -i docker
@y
   # Stop the docker services
   echo "Stopping Docker..."
   sudo pkill -i docker
@z

@x
   # Stop the vmnetd service
   echo "Stopping com.docker.vmnetd service..."
   sudo launchctl bootout system /Library/LaunchDaemons/com.docker.vmnetd.plist
@y
   # Stop the vmnetd service
   echo "Stopping com.docker.vmnetd service..."
   sudo launchctl bootout system /Library/LaunchDaemons/com.docker.vmnetd.plist
@z

@x
   # Stop the socket service
   echo "Stopping com.docker.socket service..."
   sudo launchctl bootout system /Library/LaunchDaemons/com.docker.socket.plist
@y
   # Stop the socket service
   echo "Stopping com.docker.socket service..."
   sudo launchctl bootout system /Library/LaunchDaemons/com.docker.socket.plist
@z

@x
   # Remove vmnetd binary
   echo "Removing com.docker.vmnetd binary..."
   sudo rm -f /Library/PrivilegedHelperTools/com.docker.vmnetd
@y
   # Remove vmnetd binary
   echo "Removing com.docker.vmnetd binary..."
   sudo rm -f /Library/PrivilegedHelperTools/com.docker.vmnetd
@z

@x
   # Remove socket binary
   echo "Removing com.docker.socket binary..."
   sudo rm -f /Library/PrivilegedHelperTools/com.docker.socket
@y
   # Remove socket binary
   echo "Removing com.docker.socket binary..."
   sudo rm -f /Library/PrivilegedHelperTools/com.docker.socket
@z

@x
   # Install new binaries
   echo "Install new binaries..."
   sudo cp /Applications/Docker.app/Contents/Library/LaunchServices/com.docker.vmnetd /Library/PrivilegedHelperTools/
   sudo cp /Applications/Docker.app/Contents/MacOS/com.docker.socket /Library/PrivilegedHelperTools/
   ```
@y
   # Install new binaries
   echo "Install new binaries..."
   sudo cp /Applications/Docker.app/Contents/Library/LaunchServices/com.docker.vmnetd /Library/PrivilegedHelperTools/
   sudo cp /Applications/Docker.app/Contents/MacOS/com.docker.socket /Library/PrivilegedHelperTools/
   ```
@z

@x
## Homebrew casks
@y
## Homebrew casks
@z

@x
If you installed Docker Desktop using Homebrew casks, the recommended solution is to perform a full reinstall to resolve the issue.
@y
If you installed Docker Desktop using Homebrew casks, the recommended solution is to perform a full reinstall to resolve the issue.
@z

@x
To reinstall Docker Desktop, run the following commands in your terminal:
@y
To reinstall Docker Desktop, run the following commands in your terminal:
@z

@x
```console
$ brew update
$ brew reinstall --cask docker
```
@y
```console
$ brew update
$ brew reinstall --cask docker
```
@z

@x
These commands will update Homebrew and completely reinstall Docker Desktop, ensuring you have the latest version with the fix applied.
@y
These commands will update Homebrew and completely reinstall Docker Desktop, ensuring you have the latest version with the fix applied.
@z
