%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Fix "Docker.app is damaged and can't be opened. You should move it to the Trash" dialog on macOS
keywords: docker desktop mac, damaged app, move to trash, gatekeeper, installation issues, troubleshooting
title: Fix "Docker.app is damaged and can't be opened" on macOS
linkTitle: MacOS app damaged dialog
@y
description: Fix "Docker.app is damaged and can't be opened. You should move it to the Trash" dialog on macOS
keywords: docker desktop mac, damaged app, move to trash, gatekeeper, installation issues, troubleshooting
title: Fix "Docker.app is damaged and can't be opened" on macOS
linkTitle: MacOS app damaged dialog
@z

@x
## Error message
@y
## Error message
@z

@x
macOS shows the following dialog when you try to open Docker Desktop:
@y
macOS shows the following dialog when you try to open Docker Desktop:
@z

@x
```text
Docker.app is damaged and can't be opened. You should move it to the Trash.
```
@y
```text
Docker.app is damaged and can't be opened. You should move it to the Trash.
```
@z

@x
This error prevents Docker Desktop from launching and can occur during installation or after updates.
@y
This error prevents Docker Desktop from launching and can occur during installation or after updates.
@z

@x
## Possible cause
@y
## Possible cause
@z

@x
This issue occurs due to a non-atomic copy during a drag/drop installation. When you drag and drop `Docker.app` from a DMG file while another application, like VS Code, is invoking the Docker CLI through symlinks, the copy operation may be interrupted, leaving the app in a partially copied state that Gatekeeper marks as "damaged".
@y
This issue occurs due to a non-atomic copy during a drag/drop installation. When you drag and drop `Docker.app` from a DMG file while another application, like VS Code, is invoking the Docker CLI through symlinks, the copy operation may be interrupted, leaving the app in a partially copied state that Gatekeeper marks as "damaged".
@z

@x
## Solution
@y
## Solution
@z

@x
Follow these steps to resolve the issue:
@y
Follow these steps to resolve the issue:
@z

@x
### Step one: Quit third-party software
@y
### Step one: Quit third-party software
@z

@x
Close any applications that might call Docker in the background:
@y
Close any applications that might call Docker in the background:
@z

@x
- Visual Studio Code and other IDEs
- Terminal applications
- Agent apps or development tools
- Any scripts or processes that use the Docker CLI
@y
- Visual Studio Code and other IDEs
- Terminal applications
- Agent apps or development tools
- Any scripts or processes that use the Docker CLI
@z

@x
### Step two: Remove any partial installation
@y
### Step two: Remove any partial installation
@z

@x
1. Move `/Applications/Docker.app` to Trash and empty Trash.
2. If you used a DMG installer, eject and re-mount the Docker DMG.
@y
1. Move `/Applications/Docker.app` to Trash and empty Trash.
2. If you used a DMG installer, eject and re-mount the Docker DMG.
@z

@x
### Step three: Reinstall Docker Desktop
@y
### Step three: Reinstall Docker Desktop
@z

@x
Follow the instructions in the [macOS installation guide](/manuals/desktop/setup/install/mac-install.md) to reinstall Docker Desktop.
@y
Follow the instructions in the [macOS installation guide](manuals/desktop/setup/install/mac-install.md) to reinstall Docker Desktop.
@z

@x
### If the dialog persists
@y
### If the dialog persists
@z

@x
If you continue to see the "damaged" dialog after following the recovery steps:
@y
If you continue to see the "damaged" dialog after following the recovery steps:
@z

@x
1. Gather diagnostics using the terminal. Follow the instructions in [Diagnose from the terminal](/manuals/desktop/troubleshoot-and-support/troubleshoot/_index.md#diagnose-from-the-terminal).
@y
1. Gather diagnostics using the terminal. Follow the instructions in [Diagnose from the terminal](manuals/desktop/troubleshoot-and-support/troubleshoot/_index.md#diagnose-from-the-terminal).
@z

@x
   - Note down the your diagnostics ID displayed in the terminal after running diagnostics.
@y
   - Note down the your diagnostics ID displayed in the terminal after running diagnostics.
@z

@x
2. Get help:
   - If you have a paid Docker subscription, [contact support](/manuals/support/_index.md) and include your diagnostics ID
   - For community users, [open an issue on GitHub](https://github.com/docker/for-mac/issues) and include your diagnostics ID
@y
2. Get help:
   - If you have a paid Docker subscription, [contact support](manuals/support/_index.md) and include your diagnostics ID
   - For community users, [open an issue on GitHub](https://github.com/docker/for-mac/issues) and include your diagnostics ID
@z

@x
## Prevention
@y
## Prevention
@z

@x
To avoid this issue in the future:
@y
To avoid this issue in the future:
@z

@x
- If your organization allows, update Docker Desktop via the in-app update flow
- Always quit applications that use Docker before installing Docker Desktop via the DMG installer drag-and-drop approach
- In managed environments, use PKG installations over DMG drag-and-drop
- Keep installer volumes mounted until installation is complete
@y
- If your organization allows, update Docker Desktop via the in-app update flow
- Always quit applications that use Docker before installing Docker Desktop via the DMG installer drag-and-drop approach
- In managed environments, use PKG installations over DMG drag-and-drop
- Keep installer volumes mounted until installation is complete
@z

@x
## Related information
@y
## Related information
@z

@x
- [Install Docker Desktop on Mac](/manuals/desktop/setup/install/mac-install.md)
- [PKG installer documentation](/manuals/enterprise/enterprise-deployment/pkg-install-and-configure.md)
- [Troubleshoot Docker Desktop](/manuals/desktop/troubleshoot-and-support/troubleshoot/_index.md)
- [Known issues](/manuals/desktop/troubleshoot-and-support/troubleshoot/known-issues.md)
@y
- [Install Docker Desktop on Mac](manuals/desktop/setup/install/mac-install.md)
- [PKG installer documentation](manuals/enterprise/enterprise-deployment/pkg-install-and-configure.md)
- [Troubleshoot Docker Desktop](manuals/desktop/troubleshoot-and-support/troubleshoot/_index.md)
- [Known issues](manuals/desktop/troubleshoot-and-support/troubleshoot/known-issues.md)
@z
