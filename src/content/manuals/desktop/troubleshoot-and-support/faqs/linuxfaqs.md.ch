%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Frequently asked questions for Docker Desktop for Linux
keywords: desktop, linux, faqs
title: FAQs for Docker Desktop for Linux
linkTitle: Linux
@y
description: Frequently asked questions for Docker Desktop for Linux
keywords: desktop, linux, faqs
title: FAQs for Docker Desktop for Linux
linkTitle: Linux
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
   Because Docker controls the kernel and the OS inside the VM, Docker can roll these out to all users immediately, even to users who are intentionally sticking on an LTS version of their machine OS.
@y
   Because Docker controls the kernel and the OS inside the VM, Docker can roll these out to all users immediately, even to users who are intentionally sticking on an LTS version of their machine OS.
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
   The VM utilized by Docker Desktop for Linux uses [`VirtioFS`](https://virtio-fs.gitlab.io), a shared file system that allows virtual machines to access a directory tree located on the host. Docker's internal benchmarking shows that with the right resource allocation to the VM, near native file system performance can be achieved with VirtioFS.
@y
   The VM utilized by Docker Desktop for Linux uses [`VirtioFS`](https://virtio-fs.gitlab.io), a shared file system that allows virtual machines to access a directory tree located on the host. Docker's internal benchmarking shows that with the right resource allocation to the VM, near native file system performance can be achieved with VirtioFS.
@z

@x
   As such, the default memory available to the VM in Docker Desktop for Linux is adjusted. You can tweak this setting to your specific needs by using the **Memory** slider within the **Settings** > **Resources** tab of Docker Desktop.
@y
   As such, the default memory available to the VM in Docker Desktop for Linux is adjusted. You can tweak this setting to your specific needs by using the **Memory** slider within the **Settings** > **Resources** tab of Docker Desktop.
@z

@x
### How do I enable file sharing?
@y
### How do I enable file sharing?
@z

@x
Docker Desktop for Linux uses [VirtioFS](https://virtio-fs.gitlab.io/) as the
default mechanism to enable file sharing between the host
and Docker Desktop VM. Synchronized file shares, a faster,
cache-based alternative for bind-mount-heavy workloads like PHP/JS
projects, is also available on Linux with a Pro, Team, or Business
subscription. For more details, see [File sharing](/manuals/desktop/settings-and-maintenance/settings.md#file-sharing)/desktop/settings-and-maintenance/settings/#file-sharing.
@y
Docker Desktop for Linux uses [VirtioFS](https://virtio-fs.gitlab.io/) as the
default mechanism to enable file sharing between the host
and Docker Desktop VM. Synchronized file shares, a faster,
cache-based alternative for bind-mount-heavy workloads like PHP/JS
projects, is also available on Linux with a Pro, Team, or Business
subscription. For more details, see [File sharing](manuals/desktop/settings-and-maintenance/settings.md#file-sharing)/desktop/settings-and-maintenance/settings/#file-sharing.
@z

@x
### How do I use Docker SDKs with Docker Desktop for Linux?
@y
### How do I use Docker SDKs with Docker Desktop for Linux?
@z

@x
Docker Desktop for Linux uses a per-user socket located at `~/.docker/desktop/docker.sock` instead of the system-wide `/var/run/docker.sock`. The Docker CLI handles this automatically through the `desktop-linux` context, but Docker SDKs and other tools that connect directly to the Docker daemon also need the `DOCKER_HOST` environment variable set.
@y
Docker Desktop for Linux uses a per-user socket located at `~/.docker/desktop/docker.sock` instead of the system-wide `/var/run/docker.sock`. The Docker CLI handles this automatically through the `desktop-linux` context, but Docker SDKs and other tools that connect directly to the Docker daemon also need the `DOCKER_HOST` environment variable set.
@z

@x
Without setting `DOCKER_HOST`, SDKs attempt to connect to `/var/run/docker.sock` and fail with an error like:
@y
Without setting `DOCKER_HOST`, SDKs attempt to connect to `/var/run/docker.sock` and fail with an error like:
@z

@x
```text
Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?
```
@y
```text
Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?
```
@z

@x
To fix this, set the `DOCKER_HOST` environment variable before running your SDK-based application:
@y
To fix this, set the `DOCKER_HOST` environment variable before running your SDK-based application:
@z

@x
```console
export DOCKER_HOST=unix://$HOME/.docker/desktop/docker.sock
```
@y
```console
export DOCKER_HOST=unix://$HOME/.docker/desktop/docker.sock
```
@z

@x
Or dynamically retrieve it from the `desktop-linux` context:
@y
Or dynamically retrieve it from the `desktop-linux` context:
@z

@x
```console
export DOCKER_HOST=$(docker context inspect desktop-linux --format '{{ .Endpoints.docker.Host }}')
```
@y
```console
export DOCKER_HOST=$(docker context inspect desktop-linux --format '{{ .Endpoints.docker.Host }}')
```
@z

@x
To make this permanent, add the export command to your shell profile (`~/.bashrc`, `~/.zshrc`, or similar):
@y
To make this permanent, add the export command to your shell profile (`~/.bashrc`, `~/.zshrc`, or similar):
@z

@x
```console
echo 'export DOCKER_HOST=unix://$HOME/.docker/desktop/docker.sock' >> ~/.bashrc
```
@y
```console
echo 'export DOCKER_HOST=unix://$HOME/.docker/desktop/docker.sock' >> ~/.bashrc
```
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
To locate the disk image file, select **Settings** from the Docker Desktop Dashboard then **Advanced** from the **Resources** tab.
@y
To locate the disk image file, select **Settings** from the Docker Desktop Dashboard then **Advanced** from the **Resources** tab.
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
1. Select **Settings** then **Advanced** from the **Resources** tab.
@y
1. Select **Settings** then **Advanced** from the **Resources** tab.
@z

@x
2. In the **Disk image location** section, select **Browse** and choose a new location for the disk image.
@y
2. In the **Disk image location** section, select **Browse** and choose a new location for the disk image.
@z

@x
3. Select **Apply** for the changes to take effect.
@y
3. Select **Apply** for the changes to take effect.
@z

@x
Do not move the file directly using your file manager, as this can cause
Docker Desktop to lose track of the file.
@y
Do not move the file directly using your file manager, as this can cause
Docker Desktop to lose track of the file.
@z

@x
##### How do I delete unnecessary containers and images?
@y
##### How do I delete unnecessary containers and images?
@z

@x
Check whether you have any unnecessary containers and images. You can see the detailed space usage information by running:
@y
Check whether you have any unnecessary containers and images. You can see the detailed space usage information by running:
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
2333548 -rw-r--r--@ 1 username  username    64G Dec 13 17:42 Docker.raw
```
@y
```console
$ cd ~/.docker/desktop/vms/0/data
$ ls -klsh Docker.raw
2333548 -rw-r--r--@ 1 username  username    64G Dec 13 17:42 Docker.raw
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
1. From Docker Desktop Dashboard select **Settings** then **Advanced** from the **Resources** tab.
@y
1. From Docker Desktop Dashboard select **Settings** then **Advanced** from the **Resources** tab.
@z

@x
2. The **Disk image size** section contains a slider that allows you to change the maximum size of the disk image. Adjust the slider to set a lower limit.
@y
2. The **Disk image size** section contains a slider that allows you to change the maximum size of the disk image. Adjust the slider to set a lower limit.
@z

@x
3. Select **Apply**.
@y
3. Select **Apply**.
@z

@x
When you reduce the maximum size, the current disk image file is deleted, and therefore, all containers and images are lost.
@y
When you reduce the maximum size, the current disk image file is deleted, and therefore, all containers and images are lost.
@z
