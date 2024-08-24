%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: The benefits of enhanced container isolation
title: Key features and benefits
keywords: set up, enhanced container isolation, rootless, security, features, Docker Desktop
aliases: 
 - /desktop/hardened-desktop/enhanced-container-isolation/features-benefits/
---
@y
---
description: The benefits of enhanced container isolation
title: Key features and benefits
keywords: set up, enhanced container isolation, rootless, security, features, Docker Desktop
aliases: 
 - /desktop/hardened-desktop/enhanced-container-isolation/features-benefits/
---
@z

@x
### Linux User Namespace on all containers
@y
### Linux User Namespace on all containers
@z

@x
With Enhanced Container Isolation, all user containers leverage the [Linux user-namespace](https://man7.org/linux/man-pages/man7/user_namespaces.7.html)
for extra isolation. This means that the root user in the container maps to an unprivileged
user in the Docker Desktop Linux VM.
@y
With Enhanced Container Isolation, all user containers leverage the [Linux user-namespace](https://man7.org/linux/man-pages/man7/user_namespaces.7.html)
for extra isolation. This means that the root user in the container maps to an unprivileged
user in the Docker Desktop Linux VM.
@z

@x
For example:
@y
For example:
@z

@x
```console
$ docker run -it --rm --name=first alpine
/ # cat /proc/self/uid_map
         0     100000      65536
```
@y
```console
$ docker run -it --rm --name=first alpine
/ # cat /proc/self/uid_map
         0     100000      65536
```
@z

@x
The output `0 100000 65536` is the signature of the Linux user-namespace. It
means that the root user (0) in the container is mapped to unprivileged user
100000 in the Docker Desktop Linux VM, and the mapping extends for a continuous
range of 64K user IDs. The same applies to group IDs.
@y
The output `0 100000 65536` is the signature of the Linux user-namespace. It
means that the root user (0) in the container is mapped to unprivileged user
100000 in the Docker Desktop Linux VM, and the mapping extends for a continuous
range of 64K user IDs. The same applies to group IDs.
@z

@x
Each container gets an exclusive range of mappings, managed by Sysbox. For
example, if a second container is launched the mapping range is different:
@y
Each container gets an exclusive range of mappings, managed by Sysbox. For
example, if a second container is launched the mapping range is different:
@z

@x
```console
$ docker run -it --rm --name=second alpine
/ # cat /proc/self/uid_map
         0     165536      65536
```
@y
```console
$ docker run -it --rm --name=second alpine
/ # cat /proc/self/uid_map
         0     165536      65536
```
@z

@x
In contrast, without Enhanced Container Isolation, the container's root user is
in fact root on the host (aka "true root") and this applies to all containers:
@y
In contrast, without Enhanced Container Isolation, the container's root user is
in fact root on the host (aka "true root") and this applies to all containers:
@z

@x
```console
$ docker run -it --rm alpine
/ # cat /proc/self/uid_map
         0       0     4294967295
```
@y
```console
$ docker run -it --rm alpine
/ # cat /proc/self/uid_map
         0       0     4294967295
```
@z

@x
By virtue of using the Linux user-namespace, Enhanced Container Isolation
ensures the container processes never run as user ID 0 (true root) in the Linux
VM. In fact they never run with any valid user-ID in the Linux VM. Thus, their
Linux capabilities are constrained to resources within the container only,
increasing isolation significantly compared to regular containers, both
container-to-host and cross-container isolation.
@y
By virtue of using the Linux user-namespace, Enhanced Container Isolation
ensures the container processes never run as user ID 0 (true root) in the Linux
VM. In fact they never run with any valid user-ID in the Linux VM. Thus, their
Linux capabilities are constrained to resources within the container only,
increasing isolation significantly compared to regular containers, both
container-to-host and cross-container isolation.
@z

@x
### Privileged containers are also secured
@y
### Privileged containers are also secured
@z

@x
Privileged containers `docker run --privileged ...` are insecure because they
give the container full access to the Linux kernel. That is, the container runs
as true root with all capabilities enabled, seccomp and AppArmor restrictions
are disabled, all hardware devices are exposed, for example.
@y
Privileged containers `docker run --privileged ...` are insecure because they
give the container full access to the Linux kernel. That is, the container runs
as true root with all capabilities enabled, seccomp and AppArmor restrictions
are disabled, all hardware devices are exposed, for example.
@z

@x
For organizations that wish to secure Docker Desktop on their developer's
machines, privileged containers are problematic as they allow container
workloads whether benign or malicious to gain control of the Linux kernel
inside the Docker Desktop VM and thus modify security related settings, for example registry
access management, and network proxies.
@y
For organizations that wish to secure Docker Desktop on their developer's
machines, privileged containers are problematic as they allow container
workloads whether benign or malicious to gain control of the Linux kernel
inside the Docker Desktop VM and thus modify security related settings, for example registry
access management, and network proxies.
@z

@x
With Enhanced Container Isolation, privileged containers can no longer do
this. The combination of the Linux user-namespace and other security techniques
used by Sysbox ensures that processes inside a privileged container can only
access resources assigned to the container.
@y
With Enhanced Container Isolation, privileged containers can no longer do
this. The combination of the Linux user-namespace and other security techniques
used by Sysbox ensures that processes inside a privileged container can only
access resources assigned to the container.
@z

@x
> [!NOTE]
>
> Enhanced Container Isolation does not prevent users from launching privileged
> containers, but rather runs them securely by ensuring that they can only
> modify resources associated with the container. Privileged workloads that
> modify global kernel settings, for example loading a kernel module or changing BPF
> settings will not work properly as they will receive "permission
> denied" error when attempting such operations.
@y
> [!NOTE]
>
> Enhanced Container Isolation does not prevent users from launching privileged
> containers, but rather runs them securely by ensuring that they can only
> modify resources associated with the container. Privileged workloads that
> modify global kernel settings, for example loading a kernel module or changing BPF
> settings will not work properly as they will receive "permission
> denied" error when attempting such operations.
@z

@x
For example, Enhanced Container Isolation ensures privileged containers can't
access Docker Desktop network settings in the Linux VM configured via Berkeley
Packet Filters (BPF):
@y
For example, Enhanced Container Isolation ensures privileged containers can't
access Docker Desktop network settings in the Linux VM configured via Berkeley
Packet Filters (BPF):
@z

@x
```console
$ docker run --privileged djs55/bpftool map show
Error: can't get next map: Operation not permitted
```
@y
```console
$ docker run --privileged djs55/bpftool map show
Error: can't get next map: Operation not permitted
```
@z

@x
In contrast, without Enhanced Container Isolation, privileged containers
can easily do this:
@y
In contrast, without Enhanced Container Isolation, privileged containers
can easily do this:
@z

@x
```console
$ docker run --privileged djs55/bpftool map show
17: ringbuf  name blocked_packets  flags 0x0
        key 0B  value 0B  max_entries 16777216  memlock 0B
18: hash  name allowed_map  flags 0x0
        key 4B  value 4B  max_entries 10000  memlock 81920B
20: lpm_trie  name allowed_trie  flags 0x1
        key 8B  value 8B  max_entries 1024  memlock 16384B
```
@y
```console
$ docker run --privileged djs55/bpftool map show
17: ringbuf  name blocked_packets  flags 0x0
        key 0B  value 0B  max_entries 16777216  memlock 0B
18: hash  name allowed_map  flags 0x0
        key 4B  value 4B  max_entries 10000  memlock 81920B
20: lpm_trie  name allowed_trie  flags 0x1
        key 8B  value 8B  max_entries 1024  memlock 16384B
```
@z

@x
Note that some advanced container workloads require privileged containers, for
example Docker-in-Docker, Kubernetes-in-Docker, etc. With Enhanced Container
Isolation you can still run such workloads but do so much more securely than
before.
@y
Note that some advanced container workloads require privileged containers, for
example Docker-in-Docker, Kubernetes-in-Docker, etc. With Enhanced Container
Isolation you can still run such workloads but do so much more securely than
before.
@z

@x
### Containers can't share namespaces with the Linux VM
@y
### Containers can't share namespaces with the Linux VM
@z

@x
When Enhanced Container Isolation is enabled, containers can't share Linux
namespaces with the host (e.g., pid, network, uts, etc.) as that essentially
breaks isolation.
@y
When Enhanced Container Isolation is enabled, containers can't share Linux
namespaces with the host (e.g., pid, network, uts, etc.) as that essentially
breaks isolation.
@z

@x
For example, sharing the pid namespace fails:
@y
For example, sharing the pid namespace fails:
@z

@x
```console
$ docker run -it --rm --pid=host alpine
docker: Error response from daemon: failed to create shim task: OCI runtime create failed: error in the container spec: invalid or unsupported container spec: sysbox containers can't share namespaces [pid] with the host (because they use the linux user-namespace for isolation): unknown.
```
@y
```console
$ docker run -it --rm --pid=host alpine
docker: Error response from daemon: failed to create shim task: OCI runtime create failed: error in the container spec: invalid or unsupported container spec: sysbox containers can't share namespaces [pid] with the host (because they use the linux user-namespace for isolation): unknown.
```
@z

@x
Similarly sharing the network namespace fails:
@y
Similarly sharing the network namespace fails:
@z

@x
```console
$ docker run -it --rm --network=host alpine
docker: Error response from daemon: failed to create shim task: OCI runtime create failed: error in the container spec: invalid or unsupported container spec: sysbox containers can't share a network namespace with the host (because they use the linux user-namespace for isolation): unknown.
```
@y
```console
$ docker run -it --rm --network=host alpine
docker: Error response from daemon: failed to create shim task: OCI runtime create failed: error in the container spec: invalid or unsupported container spec: sysbox containers can't share a network namespace with the host (because they use the linux user-namespace for isolation): unknown.
```
@z

@x
In addition, the `--userns=host` flag, used to disable the user-namespace on the
container, is ignored:
@y
In addition, the `--userns=host` flag, used to disable the user-namespace on the
container, is ignored:
@z

@x
```console
$ docker run -it --rm --userns=host alpine
/ # cat /proc/self/uid_map
         0     100000      65536
```
@y
```console
$ docker run -it --rm --userns=host alpine
/ # cat /proc/self/uid_map
         0     100000      65536
```
@z

@x
Finally, Docker build `--network=host` and Docker buildx entitlements
(`network.host`, `security.insecure`) are not allowed. Builds that require these
won't work properly.
@y
Finally, Docker build `--network=host` and Docker buildx entitlements
(`network.host`, `security.insecure`) are not allowed. Builds that require these
won't work properly.
@z

@x
### Bind mount restrictions
@y
### Bind mount restrictions
@z

@x
When Enhanced Container Isolation is enabled, Docker Desktop users can continue
to bind mount host directories into containers as configured via **Settings** >
**Resources** > **File sharing**, but they are no longer allowed to bind mount
arbitrary Linux VM directories into containers.
@y
When Enhanced Container Isolation is enabled, Docker Desktop users can continue
to bind mount host directories into containers as configured via **Settings** >
**Resources** > **File sharing**, but they are no longer allowed to bind mount
arbitrary Linux VM directories into containers.
@z

@x
This prevents containers from modifying sensitive files inside the Docker
Desktop Linux VM, files that can hold configurations for registry access
management, proxies, docker engine configurations, and more.
@y
This prevents containers from modifying sensitive files inside the Docker
Desktop Linux VM, files that can hold configurations for registry access
management, proxies, docker engine configurations, and more.
@z

@x
For example, the following bind mount of the Docker Engine's configuration file
(`/etc/docker/daemon.json` inside the Linux VM) into a container is restricted
and therefore fails:
@y
For example, the following bind mount of the Docker Engine's configuration file
(`/etc/docker/daemon.json` inside the Linux VM) into a container is restricted
and therefore fails:
@z

@x
```console
$ docker run -it --rm -v /etc/docker/daemon.json:/mnt/daemon.json alpine
docker: Error response from daemon: failed to create shim task: OCI runtime create failed: error in the container spec: can't mount /etc/docker/daemon.json because it's configured as a restricted host mount: unknown
```
@y
```console
$ docker run -it --rm -v /etc/docker/daemon.json:/mnt/daemon.json alpine
docker: Error response from daemon: failed to create shim task: OCI runtime create failed: error in the container spec: can't mount /etc/docker/daemon.json because it's configured as a restricted host mount: unknown
```
@z

@x
In contrast, without Enhanced Container Isolation this mount works and gives the
container full read and write access to the Docker Engine's configuration.
@y
In contrast, without Enhanced Container Isolation this mount works and gives the
container full read and write access to the Docker Engine's configuration.
@z

@x
Of course, bind mounts of host files continue to work as usual. For example,
assuming a user configures Docker Desktop to file share her $HOME directory,
she can bind mount it into the container:
@y
Of course, bind mounts of host files continue to work as usual. For example,
assuming a user configures Docker Desktop to file share her $HOME directory,
she can bind mount it into the container:
@z

@x
```console
$ docker run -it --rm -v $HOME:/mnt alpine
/ #
```
@y
```console
$ docker run -it --rm -v $HOME:/mnt alpine
/ #
```
@z

@x
> [!NOTE]
>
> By default, Enhanced Container Isolation won't allow bind mounting the Docker Engine socket
> (/var/run/docker.sock) into a container, as doing so essentially grants the
> container control of Docker Engine, thus breaking container isolation. However,
> as some legitimate use cases require this, it's possible to relax
> this restriction for trusted container images. See [Docker socket mount permissions](config.md#docker-socket-mount-permissions).
@y
> [!NOTE]
>
> By default, Enhanced Container Isolation won't allow bind mounting the Docker Engine socket
> (/var/run/docker.sock) into a container, as doing so essentially grants the
> container control of Docker Engine, thus breaking container isolation. However,
> as some legitimate use cases require this, it's possible to relax
> this restriction for trusted container images. See [Docker socket mount permissions](config.md#docker-socket-mount-permissions).
@z

@x
### Vetting sensitive system calls
@y
### Vetting sensitive system calls
@z

@x
Another feature of Enhanced Container Isolation is that it intercepts and vets a
few highly sensitive system calls inside containers, such as `mount` and
`umount`.  This ensures that processes that have capabilities to execute these
system calls can't use them to breach the container.
@y
Another feature of Enhanced Container Isolation is that it intercepts and vets a
few highly sensitive system calls inside containers, such as `mount` and
`umount`.  This ensures that processes that have capabilities to execute these
system calls can't use them to breach the container.
@z

@x
For example, a container that has `CAP_SYS_ADMIN` (required to execute the
`mount` system call) can't use that capability to change a read-only bind mount
into a read-write mount:
@y
For example, a container that has `CAP_SYS_ADMIN` (required to execute the
`mount` system call) can't use that capability to change a read-only bind mount
into a read-write mount:
@z

@x
```console
$ docker run -it --rm --cap-add SYS_ADMIN -v $HOME:/mnt:ro alpine
/ # mount -o remount,rw /mnt /mnt
mount: permission denied (are you root?)
```
@y
```console
$ docker run -it --rm --cap-add SYS_ADMIN -v $HOME:/mnt:ro alpine
/ # mount -o remount,rw /mnt /mnt
mount: permission denied (are you root?)
```
@z

@x
Since the `$HOME` directory was mounted into the container's `/mnt` directory as
read-only, it can't be changed from within the container to read-write, even if the container process has the capability to do so. This
ensures container processes can't use `mount`, or `umount`, to breach the container's
root filesystem.
@y
Since the `$HOME` directory was mounted into the container's `/mnt` directory as
read-only, it can't be changed from within the container to read-write, even if the container process has the capability to do so. This
ensures container processes can't use `mount`, or `umount`, to breach the container's
root filesystem.
@z

@x
Note however that in the example above the container can still create mounts
within the container, and mount them read-only or read-write as needed. Those
mounts are allowed since they occur within the container, and therefore don't
breach it's root filesystem:
@y
Note however that in the example above the container can still create mounts
within the container, and mount them read-only or read-write as needed. Those
mounts are allowed since they occur within the container, and therefore don't
breach it's root filesystem:
@z

@x
```text
/ # mkdir /root/tmpfs
/ # mount -t tmpfs tmpfs /root/tmpfs
/ # mount -o remount,ro /root/tmpfs /root/tmpfs
@y
```text
/ # mkdir /root/tmpfs
/ # mount -t tmpfs tmpfs /root/tmpfs
/ # mount -o remount,ro /root/tmpfs /root/tmpfs
@z

@x
/ # findmnt | grep tmpfs
├─/root/tmpfs    tmpfs      tmpfs    ro,relatime,uid=100000,gid=100000
@y
/ # findmnt | grep tmpfs
├─/root/tmpfs    tmpfs      tmpfs    ro,relatime,uid=100000,gid=100000
@z

@x
/ # mount -o remount,rw /root/tmpfs /root/tmpfs
/ # findmnt | grep tmpfs
├─/root/tmpfs    tmpfs      tmpfs    rw,relatime,uid=100000,gid=100000
```
@y
/ # mount -o remount,rw /root/tmpfs /root/tmpfs
/ # findmnt | grep tmpfs
├─/root/tmpfs    tmpfs      tmpfs    rw,relatime,uid=100000,gid=100000
```
@z

@x
This feature, together with the user-namespace, ensures that even if a container
process has all Linux capabilities they can't be used to breach the container.
@y
This feature, together with the user-namespace, ensures that even if a container
process has all Linux capabilities they can't be used to breach the container.
@z

@x
Finally, Enhanced Container Isolation does system call vetting in such a way
that it does not affect the performance of containers in the great majority of
cases. It intercepts control-path system calls that are rarely used in most
container workloads but data-path system calls are not intercepted.
@y
Finally, Enhanced Container Isolation does system call vetting in such a way
that it does not affect the performance of containers in the great majority of
cases. It intercepts control-path system calls that are rarely used in most
container workloads but data-path system calls are not intercepted.
@z

@x
### Filesystem user-ID mappings
@y
### Filesystem user-ID mappings
@z

@x
As mentioned above, Enhanced Container Isolation enables the Linux
user-namespace on all containers and this ensures that the container's user-ID
range (0->64K) maps to an unprivileged range of "real" user-IDs in the Docker
Desktop Linux VM (e.g., 100000->165535).
@y
As mentioned above, Enhanced Container Isolation enables the Linux
user-namespace on all containers and this ensures that the container's user-ID
range (0->64K) maps to an unprivileged range of "real" user-IDs in the Docker
Desktop Linux VM (e.g., 100000->165535).
@z

@x
Moreover, each container gets an exclusive range of real user-IDs in the Linux
VM (e.g., container 0 could get mapped to 100000->165535, container 2 to
165536->231071, container 3 to 231072->296607, and so on). Same applies to
group-IDs. In addition, if a container is stopped and restarted, there is no
guarantee it will receive the same mapping as before. This by design and further
improves security.
@y
Moreover, each container gets an exclusive range of real user-IDs in the Linux
VM (e.g., container 0 could get mapped to 100000->165535, container 2 to
165536->231071, container 3 to 231072->296607, and so on). Same applies to
group-IDs. In addition, if a container is stopped and restarted, there is no
guarantee it will receive the same mapping as before. This by design and further
improves security.
@z

@x
However the above presents a problem when mounting Docker volumes into
containers, as the files written to such volumes will have the real
user/group-IDs and will therefore won't be accessible across a container's
start/stop/restart, or between containers due to the different real
user-ID/group-ID of each container.
@y
However the above presents a problem when mounting Docker volumes into
containers, as the files written to such volumes will have the real
user/group-IDs and will therefore won't be accessible across a container's
start/stop/restart, or between containers due to the different real
user-ID/group-ID of each container.
@z

@x
To solve this problem, Sysbox uses "filesystem user-ID remapping" via the Linux
Kernel's ID-mapped mounts feature (added in 2021) or an alternative module
called shiftfs. These technologies map filesystem accesses from the container's
real user-ID (e.g., range 100000->165535) to the range (0->65535) inside Docker
Desktop's Linux VM. This way, volumes can now be mounted or shared across
containers, even if each container uses an exclusive range of user-IDs. Users
need not worry about the container's real user-IDs.
@y
To solve this problem, Sysbox uses "filesystem user-ID remapping" via the Linux
Kernel's ID-mapped mounts feature (added in 2021) or an alternative module
called shiftfs. These technologies map filesystem accesses from the container's
real user-ID (e.g., range 100000->165535) to the range (0->65535) inside Docker
Desktop's Linux VM. This way, volumes can now be mounted or shared across
containers, even if each container uses an exclusive range of user-IDs. Users
need not worry about the container's real user-IDs.
@z

@x
Note that although filesystem user-ID remapping may cause containers to access
Linux VM files mounted into the container with real user-ID 0 (i.e., root), the
[restricted mounts feature](#bind-mount-restrictions) described above ensures
that no Linux VM sensitive files can be mounted into the container.
@y
Note that although filesystem user-ID remapping may cause containers to access
Linux VM files mounted into the container with real user-ID 0 (i.e., root), the
[restricted mounts feature](#bind-mount-restrictions) described above ensures
that no Linux VM sensitive files can be mounted into the container.
@z

@x
### Procfs & Sysfs Emulation
@y
### Procfs & Sysfs Emulation
@z

@x
Another feature of Enhanced Container Isolation is that inside each container,
the procfs ("/proc") and sysfs ("/sys") filesystems are partially emulated. This
serves several purposes, such as hiding sensitive host information inside the
container and namespacing host kernel resources that are not yet namespaced by
the Linux kernel itself.
@y
Another feature of Enhanced Container Isolation is that inside each container,
the procfs ("/proc") and sysfs ("/sys") filesystems are partially emulated. This
serves several purposes, such as hiding sensitive host information inside the
container and namespacing host kernel resources that are not yet namespaced by
the Linux kernel itself.
@z

@x
As a simple example, when Enhanced Container Isolation is enabled the
`/proc/uptime` file shows the uptime of the container itself, not that of the
Docker Desktop Linux VM:
@y
As a simple example, when Enhanced Container Isolation is enabled the
`/proc/uptime` file shows the uptime of the container itself, not that of the
Docker Desktop Linux VM:
@z

@x
```console
$ docker run -it --rm alpine
/ # cat /proc/uptime
5.86 5.86
```
@y
```console
$ docker run -it --rm alpine
/ # cat /proc/uptime
5.86 5.86
```
@z

@x
In contrast, without Enhanced Container Isolation you see the uptime of
the Docker Desktop Linux VM. Though this is a trivial example, it shows how
Enhanced Container Isolation aims to prevent the Linux VM's configuration and
information from leaking into the container so as to make it more difficult to
breach the VM.
@y
In contrast, without Enhanced Container Isolation you see the uptime of
the Docker Desktop Linux VM. Though this is a trivial example, it shows how
Enhanced Container Isolation aims to prevent the Linux VM's configuration and
information from leaking into the container so as to make it more difficult to
breach the VM.
@z

@x
In addition several other resources under `/proc/sys` that are not namespaced by
the Linux Kernel are also emulated inside the container. Each container
sees a separate view of each such resource and Sysbox reconciles the values
across the containers when programming the corresponding Linux kernel setting.
@y
In addition several other resources under `/proc/sys` that are not namespaced by
the Linux Kernel are also emulated inside the container. Each container
sees a separate view of each such resource and Sysbox reconciles the values
across the containers when programming the corresponding Linux kernel setting.
@z

@x
This has the advantage of enabling container workloads that would otherwise
require truly privileged containers to access such non-namespaced kernel
resources to run with Enhanced Container Isolation enabled, thereby improving
security.
@y
This has the advantage of enabling container workloads that would otherwise
require truly privileged containers to access such non-namespaced kernel
resources to run with Enhanced Container Isolation enabled, thereby improving
security.
@z
