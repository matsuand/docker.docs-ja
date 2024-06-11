%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
description: Instructions for installing Docker Desktop on RHEL
keywords: red hat, red hat enterprise linux, rhel, rpm,
  update install, uninstall, upgrade, update, linux,
  desktop, docker desktop, docker desktop for linux, dd4l
title: Install Docker Desktop on RHEL
@y
description: Instructions for installing Docker Desktop on RHEL
keywords: red hat, red hat enterprise linux, rhel, rpm,
  update install, uninstall, upgrade, update, linux,
  desktop, docker desktop, docker desktop for linux, dd4l
title: Install Docker Desktop on RHEL
@z

@x
> **Early Access**
>
> Docker Desktop on RHEL is in [Early Access](../../release-lifecycle.md).
{ .restricted }
@y
> **Early Access**
>
> Docker Desktop on RHEL is in [Early Access](../../release-lifecycle.md).
{ .restricted }
@z

@x
> **Docker Desktop terms**
>
> Commercial use of Docker Desktop in larger enterprises (more than 250
> employees OR more than $10 million USD in annual revenue) requires a [paid
> subscription](https://www.docker.com/pricing/).
@y
> **Docker Desktop terms**
>
> Commercial use of Docker Desktop in larger enterprises (more than 250
> employees OR more than $10 million USD in annual revenue) requires a [paid
> subscription](https://www.docker.com/pricing/).
@z

@x
This page contains information on how to install, launch and upgrade Docker Desktop on a Red Hat Enterprise Linux (RHEL) distribution.
@y
This page contains information on how to install, launch and upgrade Docker Desktop on a Red Hat Enterprise Linux (RHEL) distribution.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
To install Docker Desktop successfully, you must:
@y
To install Docker Desktop successfully, you must:
@z

@x
- Meet the [system requirements](linux-install.md#general-system-requirements).
- Have a 64-bit version of either RHEL 8 or RHEL 9.
@y
- Meet the [system requirements](linux-install.md#general-system-requirements).
- Have a 64-bit version of either RHEL 8 or RHEL 9.
@z

@x
If you don't have `pass` installed, or it can't be installed, you must enable
[CodeReady Linux Builder (CRB) repository](https://access.redhat.com/articles/4348511)
and
[Extra Packages for Enterprise Linux (EPEL)](https://docs.fedoraproject.org/en-US/epel/).
@y
If you don't have `pass` installed, or it can't be installed, you must enable
[CodeReady Linux Builder (CRB) repository](https://access.redhat.com/articles/4348511)
and
[Extra Packages for Enterprise Linux (EPEL)](https://docs.fedoraproject.org/en-US/epel/).
@z

% snip {{< tabs group="os_version" >}}

@x
Additionally, for a GNOME desktop environment you must install AppIndicator and KStatusNotifierItem [GNOME extensions](https://extensions.gnome.org/extension/615/appindicator-support/). You must also enable EPEL.
@y
Additionally, for a GNOME desktop environment you must install AppIndicator and KStatusNotifierItem [GNOME extensions](https://extensions.gnome.org/extension/615/appindicator-support/). You must also enable EPEL.
@z

% snip {{< tabs group="os_version" >}} except comment...
@x
$ # enable EPEL as described above
@y
$ # 上述どおり EPEL を有効に
@z
@x
$ # enable EPEL as described above
@y
$ # 上述どおり EPEL を有効に
@z

@x
For non-GNOME desktop environments, `gnome-terminal` must be installed:
@y
For non-GNOME desktop environments, `gnome-terminal` must be installed:
@z

% snip command...

@x
## Install Docker Desktop
@y
## Install Docker Desktop
@z

@x
To install Docker Desktop on RHEL:
@y
To install Docker Desktop on RHEL:
@z

@x
1. Set up Docker's package repository as follows:
@y
1. Set up Docker's package repository as follows:
@z

% snip command...

@x
2. Download the latest RPM package.
@y
2. Download the latest RPM package.
@z

@x
3. Install the package with dnf as follows:
@y
3. Install the package with dnf as follows:
@z

% snip command...

@x
There are a few post-install configuration steps done through the post-install script contained in the RPM package.
@y
There are a few post-install configuration steps done through the post-install script contained in the RPM package.
@z

@x
The post-install script:
@y
The post-install script:
@z

@x
- Sets the capability on the Docker Desktop binary to map privileged ports and set resource limits.
- Adds a DNS name for Kubernetes to `/etc/hosts`.
- Creates a symlink from `/usr/local/bin/com.docker.cli` to `/usr/bin/docker`.
  This is because the classic Docker CLI is installed at `/usr/bin/docker`. The Docker Desktop installer also installs a Docker CLI binary that includes cloud-integration capabilities and is essentially a wrapper for the Compose CLI, at`/usr/local/bin/com.docker.cli`. The symlink ensures that the wrapper can access the classic Docker CLI. 
- Creates a symlink from `/usr/libexec/qemu-kvm` to `/usr/local/bin/qemu-system-x86_64`.
@y
- Sets the capability on the Docker Desktop binary to map privileged ports and set resource limits.
- Adds a DNS name for Kubernetes to `/etc/hosts`.
- Creates a symlink from `/usr/local/bin/com.docker.cli` to `/usr/bin/docker`.
  This is because the classic Docker CLI is installed at `/usr/bin/docker`. The Docker Desktop installer also installs a Docker CLI binary that includes cloud-integration capabilities and is essentially a wrapper for the Compose CLI, at`/usr/local/bin/com.docker.cli`. The symlink ensures that the wrapper can access the classic Docker CLI. 
- Creates a symlink from `/usr/libexec/qemu-kvm` to `/usr/local/bin/qemu-system-x86_64`.
@z

@x
## Launch Docker Desktop
@y
## Launch Docker Desktop
@z

@x
{{< include "desktop-linux-launch.md" >}}
@y
{{< include "desktop-linux-launch.md" >}}
@z

@x
>**Tip**
>
> To attach Red Hat subscription data to containers, see [Red Hat verified solution](https://access.redhat.com/solutions/5870841).
>
> For example:
> ```console
> $ docker run --rm -it -v "/etc/pki/entitlement:/etc/pki/entitlement" -v "/etc/rhsm:/etc/rhsm-host" -v "/etc/yum.repos.d/redhat.repo:/etc/yum.repos.d/redhat.repo" registry.access.redhat.com/ubi9
> ```
{ .tip }
@y
>**Tip**
>
> To attach Red Hat subscription data to containers, see [Red Hat verified solution](https://access.redhat.com/solutions/5870841).
>
> For example:
> ```console
> $ docker run --rm -it -v "/etc/pki/entitlement:/etc/pki/entitlement" -v "/etc/rhsm:/etc/rhsm-host" -v "/etc/yum.repos.d/redhat.repo:/etc/yum.repos.d/redhat.repo" registry.access.redhat.com/ubi9
> ```
{ .tip }
@z

@x
## Upgrade Docker Desktop
@y
## Upgrade Docker Desktop
@z

@x
Once a new version for Docker Desktop is released, the Docker UI shows a notification.
You need to first remove the previous version and then download the new package each time you want to upgrade Docker Desktop. Run:
@y
Once a new version for Docker Desktop is released, the Docker UI shows a notification.
You need to first remove the previous version and then download the new package each time you want to upgrade Docker Desktop. Run:
@z

% snip command...

@x
## Next steps
@y
## Next steps
@z

@x
- Take a look at the [Get started](../../get-started/_index.md) training modules to learn how to build an image and run it as a containerized application.
- [Explore Docker Desktop](../use-desktop/index.md) and all its features.
@y
- Take a look at the [Get started](../../get-started/_index.md) training modules to learn how to build an image and run it as a containerized application.
- [Explore Docker Desktop](../use-desktop/index.md) and all its features.
@z
