%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Frequently asked questions for Docker Desktop for Linux
keywords: desktop, linux, faqs
title: FAQs for Docker Desktop for Linux
aliases:
- /desktop/linux/space/
---
@y
---
description: Frequently asked questions for Docker Desktop for Linux
keywords: desktop, linux, faqs
title: FAQs for Docker Desktop for Linux
aliases:
- /desktop/linux/space/
---
@z

@x
### Why does Docker Desktop for Linux run a VM?
@y
### Why does Docker Desktop for Linux run a VM?
@z

@x
Docker Desktop for Linux runs a Virtual Machine (VM) for the following reasons:
@y
Docker Desktop for Linux runs a Virtual Machine (VM) for the following reasons:
@z

@x
1. To ensure that Docker Desktop provides a consistent experience across platforms.
@y
1. To ensure that Docker Desktop provides a consistent experience across platforms.
@z

@x
    During research, the most frequently cited reason for users wanting Docker Desktop for Linux was to ensure a consistent Docker Desktop
    experience with feature parity across all major operating systems. Utilizing
    a VM ensures that the Docker Desktop experience for Linux users will closely
    match that of Windows and macOS.
@y
    During research, the most frequently cited reason for users wanting Docker Desktop for Linux was to ensure a consistent Docker Desktop
    experience with feature parity across all major operating systems. Utilizing
    a VM ensures that the Docker Desktop experience for Linux users will closely
    match that of Windows and macOS.
@z

@x
2. To make use of new kernel features.
@y
2. To make use of new kernel features.
@z

@x
    Sometimes we want to make use of new operating system features. Because we control the kernel and the OS inside the VM, we can roll these out to all users immediately, even to users who are intentionally sticking on an LTS version of their machine OS.
@y
    Sometimes we want to make use of new operating system features. Because we control the kernel and the OS inside the VM, we can roll these out to all users immediately, even to users who are intentionally sticking on an LTS version of their machine OS.
@z

@x
3. To enhance security.
@y
3. To enhance security.
@z

@x
    Container image vulnerabilities pose a security risk for the host environment. There is a large number of unofficial images that are not guaranteed to be verified for known vulnerabilities. Malicious users can push images to public registries and use different methods to trick users into pulling and running them. The VM approach mitigates this threat as any malware that gains root privileges is restricted to the VM environment without access to the host.
@y
    Container image vulnerabilities pose a security risk for the host environment. There is a large number of unofficial images that are not guaranteed to be verified for known vulnerabilities. Malicious users can push images to public registries and use different methods to trick users into pulling and running them. The VM approach mitigates this threat as any malware that gains root privileges is restricted to the VM environment without access to the host.
@z

@x
    Why not run rootless Docker? Although this has the benefit of superficially limiting access to the root user so everything looks safer in "top", it allows unprivileged users to gain `CAP_SYS_ADMIN` in their own user namespace and access kernel APIs which are not expecting to be used by unprivileged users, resulting in [vulnerabilities](https://www.openwall.com/lists/oss-security/2022/01/18/7).
@y
    Why not run rootless Docker? Although this has the benefit of superficially limiting access to the root user so everything looks safer in "top", it allows unprivileged users to gain `CAP_SYS_ADMIN` in their own user namespace and access kernel APIs which are not expecting to be used by unprivileged users, resulting in [vulnerabilities](https://www.openwall.com/lists/oss-security/2022/01/18/7).
@z

@x
4. To provide the benefits of feature parity and enhanced security, with minimal impact on performance.
@y
4. To provide the benefits of feature parity and enhanced security, with minimal impact on performance.
@z

@x
    The VM utilized by Docker Desktop for Linux uses [`VirtioFS`](https://virtio-fs.gitlab.io), a shared file system that allows virtual machines to access a directory tree located on the host. Our internal benchmarking shows that with the right resource allocation to the VM, near native file system performance can be achieved with VirtioFS.
@y
    The VM utilized by Docker Desktop for Linux uses [`VirtioFS`](https://virtio-fs.gitlab.io), a shared file system that allows virtual machines to access a directory tree located on the host. Our internal benchmarking shows that with the right resource allocation to the VM, near native file system performance can be achieved with VirtioFS.
@z

@x
    As such, we have adjusted the default memory available to the VM in Docker Desktop for Linux. You can tweak this setting to your specific needs by using the **Memory** slider within the **Settings** > **Resources** tab of Docker Desktop.
@y
    As such, we have adjusted the default memory available to the VM in Docker Desktop for Linux. You can tweak this setting to your specific needs by using the **Memory** slider within the **Settings** > **Resources** tab of Docker Desktop.
@z

@x
### How do I enable file sharing?
@y
### How do I enable file sharing?
@z

@x
Docker Desktop for Linux uses [VirtioFS](https://virtio-fs.gitlab.io/) as the
default (and currently only) mechanism to enable file sharing between the host
and Docker Desktop VM. In order not to require elevated privileges, without
unnecessarily restricting operations on the shared files, Docker Desktop runs
the file sharing service (`virtiofsd`) inside a user namespace (see
`user_namespaces(7)`) with UID and GID mapping configured. As a result Docker
Desktop relies on the host being configured to enable the current user to use
subordinate ID delegation. For this to be true `/etc/subuid` (see `subuid(5)`)
and `/etc/subgid` (see `subgid(5)`) must be present. Docker Desktop only
supports subordinate ID delegation configured via files. Docker Desktop maps the
current user ID and GID to 0 in the containers. It uses the first entry
corresponding to the current user in `/etc/subuid` and `/etc/subgid` to set up
mappings for IDs above 0 in the containers.
@y
Docker Desktop for Linux uses [VirtioFS](https://virtio-fs.gitlab.io/) as the
default (and currently only) mechanism to enable file sharing between the host
and Docker Desktop VM. In order not to require elevated privileges, without
unnecessarily restricting operations on the shared files, Docker Desktop runs
the file sharing service (`virtiofsd`) inside a user namespace (see
`user_namespaces(7)`) with UID and GID mapping configured. As a result Docker
Desktop relies on the host being configured to enable the current user to use
subordinate ID delegation. For this to be true `/etc/subuid` (see `subuid(5)`)
and `/etc/subgid` (see `subgid(5)`) must be present. Docker Desktop only
supports subordinate ID delegation configured via files. Docker Desktop maps the
current user ID and GID to 0 in the containers. It uses the first entry
corresponding to the current user in `/etc/subuid` and `/etc/subgid` to set up
mappings for IDs above 0 in the containers.
@z

@x
| ID in container | ID on host                                                                       |
| --------------- | -------------------------------------------------------------------------------- |
| 0 (root)        | ID of the user running DD (e.g. 1000)                                            |
| 1               | 0 + beginning of ID range specified in `/etc/subuid`/`/etc/subgid` (e.g. 100000) |
| 2               | 1 + beginning of ID range specified in `/etc/subuid`/`/etc/subgid` (e.g. 100001) |
| 3               | 2 + beginning of ID range specified in `/etc/subuid`/`/etc/subgid` (e.g. 100002) |
| ...             | ...                                                                              |
@y
| ID in container | ID on host                                                                       |
| --------------- | -------------------------------------------------------------------------------- |
| 0 (root)        | ID of the user running DD (e.g. 1000)                                            |
| 1               | 0 + beginning of ID range specified in `/etc/subuid`/`/etc/subgid` (e.g. 100000) |
| 2               | 1 + beginning of ID range specified in `/etc/subuid`/`/etc/subgid` (e.g. 100001) |
| 3               | 2 + beginning of ID range specified in `/etc/subuid`/`/etc/subgid` (e.g. 100002) |
| ...             | ...                                                                              |
@z

@x
If `/etc/subuid` and `/etc/subgid` are missing, they need to be created.
Both should contain entries in the form -
`<username>:<start of id range>:<id range size>`. For example, to allow the current user
to use IDs from 100 000 to 165 535:
@y
If `/etc/subuid` and `/etc/subgid` are missing, they need to be created.
Both should contain entries in the form -
`<username>:<start of id range>:<id range size>`. For example, to allow the current user
to use IDs from 100 000 to 165 535:
@z

@x
```console
$ grep "$USER" /etc/subuid >> /dev/null 2&>1 || (echo "$USER:100000:65536" | sudo tee -a /etc/subuid)
$ grep "$USER" /etc/subgid >> /dev/null 2&>1 || (echo "$USER:100000:65536" | sudo tee -a /etc/subgid)
```
@y
```console
$ grep "$USER" /etc/subuid >> /dev/null 2&>1 || (echo "$USER:100000:65536" | sudo tee -a /etc/subuid)
$ grep "$USER" /etc/subgid >> /dev/null 2&>1 || (echo "$USER:100000:65536" | sudo tee -a /etc/subgid)
```
@z

@x
To verify the configs have been created correctly, inspect their contents:
@y
To verify the configs have been created correctly, inspect their contents:
@z

@x
```console
$ echo $USER
exampleuser
$ cat /etc/subuid
exampleuser:100000:65536
$ cat /etc/subgid
exampleuser:100000:65536
```
@y
```console
$ echo $USER
exampleuser
$ cat /etc/subuid
exampleuser:100000:65536
$ cat /etc/subgid
exampleuser:100000:65536
```
@z

@x
In this scenario if a shared file is `chown`ed inside a Docker Desktop container
owned by a user with a UID of 1000, it shows up on the host as owned by
a user with a UID of 100999. This has the unfortunate side effect of preventing
easy access to such a file on the host. The problem is resolved by creating
a group with the new GID and adding our user to it, or by setting a recursive
ACL (see `setfacl(1)`) for folders shared with the Docker Desktop VM.
@y
In this scenario if a shared file is `chown`ed inside a Docker Desktop container
owned by a user with a UID of 1000, it shows up on the host as owned by
a user with a UID of 100999. This has the unfortunate side effect of preventing
easy access to such a file on the host. The problem is resolved by creating
a group with the new GID and adding our user to it, or by setting a recursive
ACL (see `setfacl(1)`) for folders shared with the Docker Desktop VM.
@z

@x
### Where does Docker Desktop store Linux containers?
@y
### Where does Docker Desktop store Linux containers?
@z

@x
Docker Desktop stores Linux containers and images in a single, large "disk image" file in the Linux filesystem. This is different from Docker on Linux, which usually stores containers and images in the `/var/lib/docker` directory on the host's filesystem.
@y
Docker Desktop stores Linux containers and images in a single, large "disk image" file in the Linux filesystem. This is different from Docker on Linux, which usually stores containers and images in the `/var/lib/docker` directory on the host's filesystem.
@z

@x
#### Where is the disk image file?
@y
#### Where is the disk image file?
@z

@x
To locate the disk image file, select **Settings** from the Docker Dashboard then **Advanced** from the **Resources** tab.
@y
To locate the disk image file, select **Settings** from the Docker Dashboard then **Advanced** from the **Resources** tab.
@z

@x
The **Advanced** tab displays the location of the disk image. It also displays the maximum size of the disk image and the actual space the disk image is consuming. Note that other tools might display space usage of the file in terms of the maximum file size, and not the actual file size.
@y
The **Advanced** tab displays the location of the disk image. It also displays the maximum size of the disk image and the actual space the disk image is consuming. Note that other tools might display space usage of the file in terms of the maximum file size, and not the actual file size.
@z

@x
##### What if the file is too large?
@y
##### What if the file is too large?
@z

@x
If the disk image file is too large, you can:
@y
If the disk image file is too large, you can:
@z

@x
- Move it to a bigger drive
- Delete unnecessary containers and images
- Reduce the maximum allowable size of the file
@y
- Move it to a bigger drive
- Delete unnecessary containers and images
- Reduce the maximum allowable size of the file
@z

@x
##### How do I move the file to a bigger drive?
@y
##### How do I move the file to a bigger drive?
@z

@x
To move the disk image file to a different location:
@y
To move the disk image file to a different location:
@z

@x
1. Select **Settings** then  **Advanced** from the **Resources** tab.
@y
1. Select **Settings** then  **Advanced** from the **Resources** tab.
@z

@x
2. In the **Disk image location** section, select **Browse** and choose a new location for the disk image.
@y
2. In the **Disk image location** section, select **Browse** and choose a new location for the disk image.
@z

@x
3. Select **Apply & Restart** for the changes to take effect.
@y
3. Select **Apply & Restart** for the changes to take effect.
@z

@x
Do not move the file directly in Finder as this can cause Docker Desktop to lose track of the file.
@y
Do not move the file directly in Finder as this can cause Docker Desktop to lose track of the file.
@z

@x
##### How do I delete unnecessary containers and images?
@y
##### How do I delete unnecessary containers and images?
@z

@x
Check whether you have any unnecessary containers and images. If your client and daemon API are running version 1.25 or later (use the `docker version` command on the client to check your client and daemon API versions), you can see the detailed space usage information by running:
@y
Check whether you have any unnecessary containers and images. If your client and daemon API are running version 1.25 or later (use the `docker version` command on the client to check your client and daemon API versions), you can see the detailed space usage information by running:
@z

@x
```console
$ docker system df -v
```
@y
```console
$ docker system df -v
```
@z

@x
Alternatively, to list images, run:
@y
Alternatively, to list images, run:
@z

@x
```console
$ docker image ls
```
@y
```console
$ docker image ls
```
@z

@x
To list containers, run:
@y
To list containers, run:
@z

@x
```console
$ docker container ls -a
```
@y
```console
$ docker container ls -a
```
@z

@x
If there are lots of redundant objects, run the command:
@y
If there are lots of redundant objects, run the command:
@z

@x
```console
$ docker system prune
```
@y
```console
$ docker system prune
```
@z

@x
This command removes all stopped containers, unused networks, dangling images, and build cache.
@y
This command removes all stopped containers, unused networks, dangling images, and build cache.
@z

@x
It might take a few minutes to reclaim space on the host depending on the format of the disk image file:
@y
It might take a few minutes to reclaim space on the host depending on the format of the disk image file:
@z

@x
- If the file is named `Docker.raw`: space on the host should be reclaimed within a few seconds.
- If the file is named `Docker.qcow2`: space will be freed by a background process after a few minutes.
@y
- If the file is named `Docker.raw`: space on the host should be reclaimed within a few seconds.
- If the file is named `Docker.qcow2`: space will be freed by a background process after a few minutes.
@z

@x
Space is only freed when images are deleted. Space is not freed automatically when files are deleted inside running containers. To trigger a space reclamation at any point, run the command:
@y
Space is only freed when images are deleted. Space is not freed automatically when files are deleted inside running containers. To trigger a space reclamation at any point, run the command:
@z

@x
```console
$ docker run --privileged --pid=host docker/desktop-reclaim-space
```
@y
```console
$ docker run --privileged --pid=host docker/desktop-reclaim-space
```
@z

@x
Note that many tools report the maximum file size, not the actual file size.
To query the actual size of the file on the host from a terminal, run:
@y
Note that many tools report the maximum file size, not the actual file size.
To query the actual size of the file on the host from a terminal, run:
@z

@x
```console
$ cd ~/.docker/desktop/vms/0/data
$ ls -klsh Docker.raw
2333548 -rw-r--r--@ 1 username  staff    64G Dec 13 17:42 Docker.raw
```
@y
```console
$ cd ~/.docker/desktop/vms/0/data
$ ls -klsh Docker.raw
2333548 -rw-r--r--@ 1 username  staff    64G Dec 13 17:42 Docker.raw
```
@z

@x
In this example, the actual size of the disk is `2333548` KB, whereas the maximum size of the disk is `64` GB.
@y
In this example, the actual size of the disk is `2333548` KB, whereas the maximum size of the disk is `64` GB.
@z

@x
##### How do I reduce the maximum size of the file?
@y
##### How do I reduce the maximum size of the file?
@z

@x
To reduce the maximum size of the disk image file:
@y
To reduce the maximum size of the disk image file:
@z

@x
1. From Docker Dashboard select **Settings** then **Advanced** from the **Resources** tab.
@y
1. From Docker Dashboard select **Settings** then **Advanced** from the **Resources** tab.
@z

@x
2. The **Disk image size** section contains a slider that allows you to change the maximum size of the disk image. Adjust the slider to set a lower limit.
@y
2. The **Disk image size** section contains a slider that allows you to change the maximum size of the disk image. Adjust the slider to set a lower limit.
@z

@x
3. Select **Apply & Restart**.
@y
3. Select **Apply & Restart**.
@z

@x
When you reduce the maximum size, the current disk image file is deleted, and therefore, all containers and images are lost.
@y
When you reduce the maximum size, the current disk image file is deleted, and therefore, all containers and images are lost.
@z
