%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Answers to common questions about Docker Desktop release frequency,
  supported versions, installing older versions, and download errors
keywords: desktop, mac, windows, faqs, releases, support, install, 403, version,
  older version, old version, previous version, downgrade
title: FAQs on Docker Desktop releases
linkTitle: Releases
@y
description: Answers to common questions about Docker Desktop release frequency,
  supported versions, installing older versions, and download errors
keywords: desktop, mac, windows, faqs, releases, support, install, 403, version,
  older version, old version, previous version, downgrade
title: FAQs on Docker Desktop releases
linkTitle: Releases
@z

@x
### How often will new releases be?
@y
### How often will new releases be?
@z

@x
New releases are available every week, unless there are critical fixes that
need to be released sooner.
@y
New releases are available every week, unless there are critical fixes that
need to be released sooner.
@z

@x
The **Automatically check for updates** setting in the **Software updates**
tab is turned on by default. This means you receive notifications in the
Docker menu and a notification badge on the Docker Desktop Dashboard when a
new version is available.
@y
The **Automatically check for updates** setting in the **Software updates**
tab is turned on by default. This means you receive notifications in the
Docker menu and a notification badge on the Docker Desktop Dashboard when a
new version is available.
@z

@x
On Mac and Windows, you can also let Docker Desktop automatically download
new updates in the background by selecting the **Always download updates**
checkbox.
@y
On Mac and Windows, you can also let Docker Desktop automatically download
new updates in the background by selecting the **Always download updates**
checkbox.
@z

@x
Sometimes new versions are rolled out gradually over a few days. Therefore,
if you wait, it will turn up soon. Alternatively, you can select **Check for
updates** in the Docker menu to get the latest version immediately.
@y
Sometimes new versions are rolled out gradually over a few days. Therefore,
if you wait, it will turn up soon. Alternatively, you can select **Check for
updates** in the Docker menu to get the latest version immediately.
@z

@x
### How do I ensure that all users in my organization are using the same version?
@y
### How do I ensure that all users in my organization are using the same version?
@z

@x
This is managed through your IT administrator's endpoint management software.
@y
This is managed through your IT administrator's endpoint management software.
@z

@x
### Which Docker Desktop versions are supported?
@y
### Which Docker Desktop versions are supported?
@z

@x
> [!IMPORTANT]
>
> Docker Desktop versions older than six months from the latest release aren't
> available for download. Previous release notes are available in the
> [documentation repository](https://github.com/docker/docs/tree/main/content/manuals/desktop/previous-versions).
@y
> [!IMPORTANT]
>
> Docker Desktop versions older than six months from the latest release aren't
> available for download. Previous release notes are available in the
> [documentation repository](https://github.com/docker/docs/tree/main/content/manuals/desktop/previous-versions).
@z

@x
Docker Support covers:
@y
Docker Support covers:
@z

@x
- Docker Business: Versions up to six months older than the latest version.
  Fixes apply to the latest version only.
- Docker Pro and Team: The latest version only.
@y
- Docker Business: Versions up to six months older than the latest version.
  Fixes apply to the latest version only.
- Docker Pro and Team: The latest version only.
@z

@x
For details, see [Supported versions](/manuals/support/_index.md#supported-versions).
@y
For details, see [Supported versions](manuals/support/_index.md#supported-versions).
@z

@x
Docker recommends running the latest Docker Desktop release. See the
[release notes](/manuals/desktop/release-notes.md) for the latest version and
download links.
@y
Docker recommends running the latest Docker Desktop release. See the
[release notes](manuals/desktop/release-notes.md) for the latest version and
download links.
@z

@x
### How do I install an older version?
@y
### How do I install an older version?
@z

@x
Installers are limited to the
[six-month download window](#which-docker-desktop-versions-are-supported).
Choose a version that still includes **Download Docker Desktop** links in the
[release notes](/manuals/desktop/release-notes.md).
@y
Installers are limited to the
[six-month download window](#which-docker-desktop-versions-are-supported).
Choose a version that still includes **Download Docker Desktop** links in the
[release notes](manuals/desktop/release-notes.md).
@z

@x
The install commands don't take a version number. Choose the version by
downloading that release's installer, then run the install steps for your
operating system.
@y
The install commands don't take a version number. Choose the version by
downloading that release's installer, then run the install steps for your
operating system.
@z

@x
1. Open the [release notes](/manuals/desktop/release-notes.md).
1. Go to the version you want. Under the version heading and date, look for
   a **Download Docker Desktop** section with links for Windows, Mac, and
   Linux.
1. If that section is missing, Docker doesn't provide an installer for that
   entry from the docs. Choose another version that includes **Download Docker
   Desktop**.
1. Download the installer for your platform.
1. If a newer version of Docker Desktop is already installed,
   [uninstall](/manuals/desktop/uninstall.md) it before installing the older
   version.
1. Install the version you downloaded:
@y
1. Open the [release notes](manuals/desktop/release-notes.md).
1. Go to the version you want. Under the version heading and date, look for
   a **Download Docker Desktop** section with links for Windows, Mac, and
   Linux.
1. If that section is missing, Docker doesn't provide an installer for that
   entry from the docs. Choose another version that includes **Download Docker
   Desktop**.
1. Download the installer for your platform.
1. If a newer version of Docker Desktop is already installed,
   [uninstall](manuals/desktop/uninstall.md) it before installing the older
   version.
1. Install the version you downloaded:
@z

@x
   - [Install Docker Desktop on Windows](/manuals/desktop/setup/install/windows-install.md)
   - [Install Docker Desktop on Mac](/manuals/desktop/setup/install/mac-install.md)
   - [Install Docker Desktop on Linux](/manuals/desktop/setup/install/linux/_index.md)
@y
   - [Install Docker Desktop on Windows](manuals/desktop/setup/install/windows-install.md)
   - [Install Docker Desktop on Mac](manuals/desktop/setup/install/mac-install.md)
   - [Install Docker Desktop on Linux](manuals/desktop/setup/install/linux/_index.md)
@z

@x
### Why do I get a 403 download error?
@y
### Why do I get a 403 download error?
@z

@x
A `403 Forbidden` response means the installer for that build isn't available
to download. This usually means the build is outside the
[six-month download window](#which-docker-desktop-versions-are-supported).
This applies on Windows, Mac, and Linux, whether you use a browser, a package
manager, or another download tool. The failure happens when fetching the
installer, not when running the install command.
@y
A `403 Forbidden` response means the installer for that build isn't available
to download. This usually means the build is outside the
[six-month download window](#which-docker-desktop-versions-are-supported).
This applies on Windows, Mac, and Linux, whether you use a browser, a package
manager, or another download tool. The failure happens when fetching the
installer, not when running the install command.
@z

@x
Download a version that includes a **Download Docker Desktop** section in the
[release notes](/manuals/desktop/release-notes.md).
@y
Download a version that includes a **Download Docker Desktop** section in the
[release notes](manuals/desktop/release-notes.md).
@z
