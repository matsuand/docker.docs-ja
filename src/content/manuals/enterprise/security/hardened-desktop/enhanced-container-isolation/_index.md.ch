%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Enhanced Container Isolation
linkTitle: Enhanced Container Isolation
description: Enhanced Container Isolation provides additional security for Docker Desktop by preventing malicious containers from compromising the host
keywords: enhanced container isolation, container security, sysbox runtime, linux user namespaces, hardened desktop
@y
title: Enhanced Container Isolation
linkTitle: Enhanced Container Isolation
description: Enhanced Container Isolation provides additional security for Docker Desktop by preventing malicious containers from compromising the host
keywords: enhanced container isolation, container security, sysbox runtime, linux user namespaces, hardened desktop
@z

@x
{{< summary-bar feature_name="Hardened Docker Desktop" >}}
@y
{{< summary-bar feature_name="Hardened Docker Desktop" >}}
@z

@x
Enhanced Container Isolation (ECI) prevents malicious containers from compromising Docker Desktop or the host system. It applies advanced security techniques automatically while maintaining full developer productivity and workflow compatibility.
@y
Enhanced Container Isolation (ECI) prevents malicious containers from compromising Docker Desktop or the host system. It applies advanced security techniques automatically while maintaining full developer productivity and workflow compatibility.
@z

@x
ECI strengthens container isolation and locks in security configurations created by administrators, such as [Registry Access Management policies](/manuals/enterprise/security/hardened-desktop/registry-access-management.md) and [Settings Management](../settings-management/_index.md) controls.
@y
ECI strengthens container isolation and locks in security configurations created by administrators, such as [Registry Access Management policies](manuals/enterprise/security/hardened-desktop/registry-access-management.md) and [Settings Management](../settings-management/_index.md) controls.
@z

@x
> [!NOTE]
>
> ECI works alongside other Docker security features like reduced Linux capabilities, seccomp, and AppArmor.
@y
> [!NOTE]
>
> ECI works alongside other Docker security features like reduced Linux capabilities, seccomp, and AppArmor.
@z

@x
## Who should use Enhanced Container Isolation?
@y
## Who should use Enhanced Container Isolation?
@z

@x
Enhanced Container Isolation is designed for:
@y
Enhanced Container Isolation is designed for:
@z

@x
- Organizations that want to prevent container-based attacks and reduce security vulnerabilities in developer environments
- Security teams that need stronger container isolation without impacting developer workflows
- Enterprises that require additional protection when running untrusted or third-party container images
@y
- Organizations that want to prevent container-based attacks and reduce security vulnerabilities in developer environments
- Security teams that need stronger container isolation without impacting developer workflows
- Enterprises that require additional protection when running untrusted or third-party container images
@z

@x
## How Enhanced Container Isolation works
@y
## How Enhanced Container Isolation works
@z

@x
Docker implements ECI using the [Sysbox container runtime](https://github.com/nestybox/sysbox), a
security-enhanced fork of the standard OCI runc runtime. When ECI is turned on, containers created through `docker run` or `docker create` automatically use Sysbox instead of runc without requiring any changes to developer workflows.
@y
Docker implements ECI using the [Sysbox container runtime](https://github.com/nestybox/sysbox), a
security-enhanced fork of the standard OCI runc runtime. When ECI is turned on, containers created through `docker run` or `docker create` automatically use Sysbox instead of runc without requiring any changes to developer workflows.
@z

@x
Even containers using the `--privileged` flag run securely with Enhanced Container Isolation, preventing them from breaching the Docker Desktop virtual machine or other containers.
@y
Even containers using the `--privileged` flag run securely with Enhanced Container Isolation, preventing them from breaching the Docker Desktop virtual machine or other containers.
@z

@x
> [!NOTE]
>
> When ECI is turned on, the Docker CLI `--runtime` flag is ignored.
Docker's default runtime remains runc, but all user containers
implicitly launch with Sysbox.
@y
> [!NOTE]
>
> When ECI is turned on, the Docker CLI `--runtime` flag is ignored.
Docker's default runtime remains runc, but all user containers
implicitly launch with Sysbox.
@z

@x
## Key security features
@y
## Key security features
@z

@x
### Linux user namespace isolation
@y
### Linux user namespace isolation
@z

@x
With Enhanced Container Isolation, all containers leverage Linux user namespaces for stronger isolation. Container root users map to unprivileged users in the Docker Desktop VM:
@y
With Enhanced Container Isolation, all containers leverage Linux user namespaces for stronger isolation. Container root users map to unprivileged users in the Docker Desktop VM:
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
This output shows that container root (0) maps to unprivileged user 100000 in the VM, with a range of 64K user IDs. Each container gets exclusive mappings:
@y
This output shows that container root (0) maps to unprivileged user 100000 in the VM, with a range of 64K user IDs. Each container gets exclusive mappings:
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
Without Enhanced Container Isolation, containers run as true root:
@y
Without Enhanced Container Isolation, containers run as true root:
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
By using Linux user namespaces, ECI ensures container processes never run with valid user IDs in the Linux VM, constraining their capabilities to resources within the container only.
@y
By using Linux user namespaces, ECI ensures container processes never run with valid user IDs in the Linux VM, constraining their capabilities to resources within the container only.
@z

@x
### Secured privileged containers
@y
### Secured privileged containers
@z

@x
Privileged containers (`docker run --privileged`) normally pose significant security risks because they provide unrestricted access to the Linux kernel. Without ECI, privileged containers can:
@y
Privileged containers (`docker run --privileged`) normally pose significant security risks because they provide unrestricted access to the Linux kernel. Without ECI, privileged containers can:
@z

@x
- Run as true root with all capabilities
- Bypass seccomp and AppArmor restrictions
- Access all hardware devices
- Modify global kernel settings
@y
- Run as true root with all capabilities
- Bypass seccomp and AppArmor restrictions
- Access all hardware devices
- Modify global kernel settings
@z

@x
Organizations securing developer environments face challenges with privileged containers because they can gain control of the Docker Desktop VM and alter security settings like registry access management and network proxies.
@y
Organizations securing developer environments face challenges with privileged containers because they can gain control of the Docker Desktop VM and alter security settings like registry access management and network proxies.
@z

@x
Enhanced Container Isolation transforms privileged containers by ensuring they can only access resources within their container boundary. For example, privileged containers can't access Docker Desktop's network configuration:
@y
Enhanced Container Isolation transforms privileged containers by ensuring they can only access resources within their container boundary. For example, privileged containers can't access Docker Desktop's network configuration:
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
Without ECI, privileged containers can easily access and modify these settings:
@y
Without ECI, privileged containers can easily access and modify these settings:
@z

@x
```console
$ docker run --privileged djs55/bpftool map show
17: ringbuf  name blocked_packets  flags 0x0
        key 0B  value 0B  max_entries 16777216  memlock 0B
18: hash  name allowed_map  flags 0x0
        key 4B  value 4B  max_entries 10000  memlock 81920B
```
@y
```console
$ docker run --privileged djs55/bpftool map show
17: ringbuf  name blocked_packets  flags 0x0
        key 0B  value 0B  max_entries 16777216  memlock 0B
18: hash  name allowed_map  flags 0x0
        key 4B  value 4B  max_entries 10000  memlock 81920B
```
@z

@x
Advanced container workloads like Docker-in-Docker and Kubernetes-in-Docker still work with ECI but run much more securely.
@y
Advanced container workloads like Docker-in-Docker and Kubernetes-in-Docker still work with ECI but run much more securely.
@z

@x
> [!NOTE]
>
> ECI doesn't prevent users from running privileged containers, but makes them secure by containing their access. Privileged workloads that modify global kernel settings (loading kernel modules, changing Berkeley Packet Filter settings) receive "permission denied" errors.
@y
> [!NOTE]
>
> ECI doesn't prevent users from running privileged containers, but makes them secure by containing their access. Privileged workloads that modify global kernel settings (loading kernel modules, changing Berkeley Packet Filter settings) receive "permission denied" errors.
@z

@x
### Namespace isolation enforcement
@y
### Namespace isolation enforcement
@z

@x
Enhanced Container Isolation prevents containers from sharing Linux namespaces with the Docker Desktop VM, maintaining isolation boundaries:
@y
Enhanced Container Isolation prevents containers from sharing Linux namespaces with the Docker Desktop VM, maintaining isolation boundaries:
@z

@x
**PID namespace sharing blocked:**
@y
**PID namespace sharing blocked:**
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
**Network namespace sharing blocked:**
@y
**Network namespace sharing blocked:**
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
**User namespace override ignored:**
@y
**User namespace override ignored:**
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
Docker build operations using `--network-host` and Docker buildx entitlements (`network.host`,
`security.insecure`) are also blocked.
@y
Docker build operations using `--network-host` and Docker buildx entitlements (`network.host`,
`security.insecure`) are also blocked.
@z

@x
### Protected bind mounts
@y
### Protected bind mounts
@z

@x
Enhanced Container Isolation maintains support for standard file sharing while preventing access to sensitive VM directories:
@y
Enhanced Container Isolation maintains support for standard file sharing while preventing access to sensitive VM directories:
@z

@x
Host directory mounts continue to work:
@y
Host directory mounts continue to work:
@z

@x
```console
$ docker run -it --rm -v $HOME:/mnt alpine
/ # ls /mnt
# Successfully lists home directory contents
```
@y
```console
$ docker run -it --rm -v $HOME:/mnt alpine
/ # ls /mnt
# Successfully lists home directory contents
```
@z

@x
VM configuration mounts are blocked:
@y
VM configuration mounts are blocked:
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
This prevents containers from reading or modifying Docker Engine configurations, registry access management settings, proxy configurations, and other security-related VM files.
@y
This prevents containers from reading or modifying Docker Engine configurations, registry access management settings, proxy configurations, and other security-related VM files.
@z

@x
> [!NOTE]
>
> By default, ECI blocks bind mounting the Docker Engine socket (/var/run/docker.sock) as this would grant containers control over Docker Engine. Administrators can create exceptions for trusted container images.
@y
> [!NOTE]
>
> By default, ECI blocks bind mounting the Docker Engine socket (/var/run/docker.sock) as this would grant containers control over Docker Engine. Administrators can create exceptions for trusted container images.
@z

@x
### Advanced system call protection
@y
### Advanced system call protection
@z

@x
Enhanced Container Isolation intercepts sensitive system calls to prevent containers from using legitimate capabilities maliciously:
@y
Enhanced Container Isolation intercepts sensitive system calls to prevent containers from using legitimate capabilities maliciously:
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
Even with `CAP_SYS_ADMIN` capability, containers can't change read-only bind mounts to read-write, ensuring they can't breach container boundaries.
@y
Even with `CAP_SYS_ADMIN` capability, containers can't change read-only bind mounts to read-write, ensuring they can't breach container boundaries.
@z

@x
Containers can still create internal mounts within their filesystem:
@y
Containers can still create internal mounts within their filesystem:
@z

@x
```console
/ # mkdir /root/tmpfs
/ # mount -t tmpfs tmpfs /root/tmpfs
/ # mount -o remount,ro /root/tmpfs /root/tmpfs
/ # findmnt | grep tmpfs
├─/root/tmpfs    tmpfs      tmpfs    ro,relatime,uid=100000,gid=100000
```
@y
```console
/ # mkdir /root/tmpfs
/ # mount -t tmpfs tmpfs /root/tmpfs
/ # mount -o remount,ro /root/tmpfs /root/tmpfs
/ # findmnt | grep tmpfs
├─/root/tmpfs    tmpfs      tmpfs    ro,relatime,uid=100000,gid=100000
```
@z

@x
ECI performs system call filtering efficiently by intercepting only control-path system calls (rarely used) while leaving data-path system calls unaffected, maintaining container performance.
@y
ECI performs system call filtering efficiently by intercepting only control-path system calls (rarely used) while leaving data-path system calls unaffected, maintaining container performance.
@z

@x
### Automatic filesystem user ID mapping
@y
### Automatic filesystem user ID mapping
@z

@x
Enhanced Container Isolation solves file sharing challenges between containers with different user ID ranges through automatic filesystem mapping.
@y
Enhanced Container Isolation solves file sharing challenges between containers with different user ID ranges through automatic filesystem mapping.
@z

@x
Each container gets exclusive user ID mappings, but Sysbox uses filesystem user ID remapping via Linux kernel ID-mapped mounts (added in 2021) or alternative shiftsfs module. This maps filesystem accesses from containers' real user IDs to standard ranges, enabling:
@y
Each container gets exclusive user ID mappings, but Sysbox uses filesystem user ID remapping via Linux kernel ID-mapped mounts (added in 2021) or alternative shiftsfs module. This maps filesystem accesses from containers' real user IDs to standard ranges, enabling:
@z

@x
- Volume sharing across containers with different user ID ranges
- Consistent file ownership regardless of container user ID mappings
- Transparent file access without user intervention
@y
- Volume sharing across containers with different user ID ranges
- Consistent file ownership regardless of container user ID mappings
- Transparent file access without user intervention
@z

@x
### Information hiding through filesystem emulation
@y
### Information hiding through filesystem emulation
@z

@x
ECI emulates portions of `/proc` and `/sys` filesystems within containers to hide sensitive host information and provide per-container views of kernel resources:
@y
ECI emulates portions of `/proc` and `/sys` filesystems within containers to hide sensitive host information and provide per-container views of kernel resources:
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
This shows container uptime instead of Docker Desktop VM uptime, preventing system information from leaking into containers.
@y
This shows container uptime instead of Docker Desktop VM uptime, preventing system information from leaking into containers.
@z

@x
Several `/proc/sys` resources that aren't namespaced by the Linux kernel are emulated per-container, with Sysbox coordinating values when programming kernel settings. This enables container workloads that normally require privileged access to run securely.
@y
Several `/proc/sys` resources that aren't namespaced by the Linux kernel are emulated per-container, with Sysbox coordinating values when programming kernel settings. This enables container workloads that normally require privileged access to run securely.
@z

@x
## Performance and compatibility
@y
## Performance and compatibility
@z

@x
Enhanced Container Isolation maintains optimized performance and full compatibility:
@y
Enhanced Container Isolation maintains optimized performance and full compatibility:
@z

@x
- No performance impact: System call filtering targets only control-path calls, leaving data-path operations unaffected
- Full workflow compatibility: Existing development processes, tools, and container images work unchanged
- Advanced workload support: Docker-in-Docker, Kubernetes-in-Docker, and other complex scenarios work securely
- Automatic management: User ID mappings, filesystem access, and security policies are handled automatically
- Standard image support: No special container images or modifications required
@y
- No performance impact: System call filtering targets only control-path calls, leaving data-path operations unaffected
- Full workflow compatibility: Existing development processes, tools, and container images work unchanged
- Advanced workload support: Docker-in-Docker, Kubernetes-in-Docker, and other complex scenarios work securely
- Automatic management: User ID mappings, filesystem access, and security policies are handled automatically
- Standard image support: No special container images or modifications required
@z

@x
> [!IMPORTANT]
>
> ECI protection varies by Docker Desktop version and doesn't yet protect extension containers. Docker builds and Kubernetes in Docker Desktop have varying protection levels depending on the version. For details, see [Enhanced Container Isolation limitations](/manuals/enterprise/security/hardened-desktop/enhanced-container-isolation/limitations.md).
@y
> [!IMPORTANT]
>
> ECI protection varies by Docker Desktop version and doesn't yet protect extension containers. Docker builds and Kubernetes in Docker Desktop have varying protection levels depending on the version. For details, see [Enhanced Container Isolation limitations](manuals/enterprise/security/hardened-desktop/enhanced-container-isolation/limitations.md).
@z
