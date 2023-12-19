%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Enabling AppArmor in Docker
keywords: AppArmor, security, docker, documentation
title: AppArmor security profiles for Docker
---
@y
---
description: Enabling AppArmor in Docker
keywords: AppArmor, security, docker, documentation
title: AppArmor security profiles for Docker
---
@z

@x
AppArmor (Application Armor) is a Linux security module that protects an
operating system and its applications from security threats. To use it, a system
administrator associates an AppArmor security profile with each program. Docker
expects to find an AppArmor policy loaded and enforced.
@y
AppArmor (Application Armor) is a Linux security module that protects an
operating system and its applications from security threats. To use it, a system
administrator associates an AppArmor security profile with each program. Docker
expects to find an AppArmor policy loaded and enforced.
@z

@x
Docker automatically generates and loads a default profile for containers named
`docker-default`. The Docker binary generates this profile in `tmpfs` and then
loads it into the kernel.
@y
Docker automatically generates and loads a default profile for containers named
`docker-default`. The Docker binary generates this profile in `tmpfs` and then
loads it into the kernel.
@z

@x
> **Note**
>
> This profile is used on containers, not on the Docker daemon.
@y
> **Note**
>
> This profile is used on containers, not on the Docker daemon.
@z

@x
A profile for the Docker Engine daemon exists but it is not currently installed
with the `deb` packages. If you are interested in the source for the daemon
profile, it is located in
[contrib/apparmor](https://github.com/moby/moby/tree/master/contrib/apparmor)
in the Docker Engine source repository.
@y
A profile for the Docker Engine daemon exists but it is not currently installed
with the `deb` packages. If you are interested in the source for the daemon
profile, it is located in
[contrib/apparmor](https://github.com/moby/moby/tree/master/contrib/apparmor)
in the Docker Engine source repository.
@z

@x
## Understand the policies
@y
## Understand the policies
@z

@x
The `docker-default` profile is the default for running containers. It is
moderately protective while providing wide application compatibility. The
profile is generated from the following
[template](https://github.com/moby/moby/blob/master/profiles/apparmor/template.go).
@y
The `docker-default` profile is the default for running containers. It is
moderately protective while providing wide application compatibility. The
profile is generated from the following
[template](https://github.com/moby/moby/blob/master/profiles/apparmor/template.go).
@z

@x
When you run a container, it uses the `docker-default` policy unless you
override it with the `security-opt` option. For example, the following
explicitly specifies the default policy:
@y
When you run a container, it uses the `docker-default` policy unless you
override it with the `security-opt` option. For example, the following
explicitly specifies the default policy:
@z

@x
```console
$ docker run --rm -it --security-opt apparmor=docker-default hello-world
```
@y
```console
$ docker run --rm -it --security-opt apparmor=docker-default hello-world
```
@z

@x
## Load and unload profiles
@y
## Load and unload profiles
@z

@x
To load a new profile into AppArmor for use with containers:
@y
To load a new profile into AppArmor for use with containers:
@z

@x
```console
$ apparmor_parser -r -W /path/to/your_profile
```
@y
```console
$ apparmor_parser -r -W /path/to/your_profile
```
@z

@x
Then, run the custom profile with `--security-opt`:
@y
Then, run the custom profile with `--security-opt`:
@z

@x
```console
$ docker run --rm -it --security-opt apparmor=your_profile hello-world
```
@y
```console
$ docker run --rm -it --security-opt apparmor=your_profile hello-world
```
@z

@x
To unload a profile from AppArmor:
@y
To unload a profile from AppArmor:
@z

@x
```console
# unload the profile
$ apparmor_parser -R /path/to/profile
```
@y
```console
# unload the profile
$ apparmor_parser -R /path/to/profile
```
@z

@x
### Resources for writing profiles
@y
### Resources for writing profiles
@z

@x
The syntax for file globbing in AppArmor is a bit different than some other
globbing implementations. It is highly suggested you take a look at some of the
below resources with regard to AppArmor profile syntax.
@y
The syntax for file globbing in AppArmor is a bit different than some other
globbing implementations. It is highly suggested you take a look at some of the
below resources with regard to AppArmor profile syntax.
@z

@x
- [Quick Profile Language](https://gitlab.com/apparmor/apparmor/wikis/QuickProfileLanguage)
- [Globbing Syntax](https://gitlab.com/apparmor/apparmor/wikis/AppArmor_Core_Policy_Reference#AppArmor_globbing_syntax)
@y
- [Quick Profile Language](https://gitlab.com/apparmor/apparmor/wikis/QuickProfileLanguage)
- [Globbing Syntax](https://gitlab.com/apparmor/apparmor/wikis/AppArmor_Core_Policy_Reference#AppArmor_globbing_syntax)
@z

@x
## Nginx example profile
@y
## Nginx example profile
@z

@x
In this example, you create a custom AppArmor profile for Nginx. Below is the
custom profile.
@y
In this example, you create a custom AppArmor profile for Nginx. Below is the
custom profile.
@z

@x
```c
#include <tunables/global>
@y
```c
#include <tunables/global>
@z

@x
profile docker-nginx flags=(attach_disconnected,mediate_deleted) {
  #include <abstractions/base>
@y
profile docker-nginx flags=(attach_disconnected,mediate_deleted) {
  #include <abstractions/base>
@z

@x
  network inet tcp,
  network inet udp,
  network inet icmp,
@y
  network inet tcp,
  network inet udp,
  network inet icmp,
@z

@x
  deny network raw,
@y
  deny network raw,
@z

@x
  deny network packet,
@y
  deny network packet,
@z

@x
  file,
  umount,
@y
  file,
  umount,
@z

@x
  deny /bin/** wl,
  deny /boot/** wl,
  deny /dev/** wl,
  deny /etc/** wl,
  deny /home/** wl,
  deny /lib/** wl,
  deny /lib64/** wl,
  deny /media/** wl,
  deny /mnt/** wl,
  deny /opt/** wl,
  deny /proc/** wl,
  deny /root/** wl,
  deny /sbin/** wl,
  deny /srv/** wl,
  deny /tmp/** wl,
  deny /sys/** wl,
  deny /usr/** wl,
@y
  deny /bin/** wl,
  deny /boot/** wl,
  deny /dev/** wl,
  deny /etc/** wl,
  deny /home/** wl,
  deny /lib/** wl,
  deny /lib64/** wl,
  deny /media/** wl,
  deny /mnt/** wl,
  deny /opt/** wl,
  deny /proc/** wl,
  deny /root/** wl,
  deny /sbin/** wl,
  deny /srv/** wl,
  deny /tmp/** wl,
  deny /sys/** wl,
  deny /usr/** wl,
@z

@x
  audit /** w,
@y
  audit /** w,
@z

@x
  /var/run/nginx.pid w,
@y
  /var/run/nginx.pid w,
@z

@x
  /usr/sbin/nginx ix,
@y
  /usr/sbin/nginx ix,
@z

@x
  deny /bin/dash mrwklx,
  deny /bin/sh mrwklx,
  deny /usr/bin/top mrwklx,
@y
  deny /bin/dash mrwklx,
  deny /bin/sh mrwklx,
  deny /usr/bin/top mrwklx,
@z

@x
  capability chown,
  capability dac_override,
  capability setuid,
  capability setgid,
  capability net_bind_service,
@y
  capability chown,
  capability dac_override,
  capability setuid,
  capability setgid,
  capability net_bind_service,
@z

@x
  deny @{PROC}/* w,   # deny write for all files directly in /proc (not in a subdir)
  # deny write to files not in /proc/<number>/** or /proc/sys/**
  deny @{PROC}/{[^1-9],[^1-9][^0-9],[^1-9s][^0-9y][^0-9s],[^1-9][^0-9][^0-9][^0-9]*}/** w,
  deny @{PROC}/sys/[^k]** w,  # deny /proc/sys except /proc/sys/k* (effectively /proc/sys/kernel)
  deny @{PROC}/sys/kernel/{?,??,[^s][^h][^m]**} w,  # deny everything except shm* in /proc/sys/kernel/
  deny @{PROC}/sysrq-trigger rwklx,
  deny @{PROC}/mem rwklx,
  deny @{PROC}/kmem rwklx,
  deny @{PROC}/kcore rwklx,
@y
  deny @{PROC}/* w,   # deny write for all files directly in /proc (not in a subdir)
  # deny write to files not in /proc/<number>/** or /proc/sys/**
  deny @{PROC}/{[^1-9],[^1-9][^0-9],[^1-9s][^0-9y][^0-9s],[^1-9][^0-9][^0-9][^0-9]*}/** w,
  deny @{PROC}/sys/[^k]** w,  # deny /proc/sys except /proc/sys/k* (effectively /proc/sys/kernel)
  deny @{PROC}/sys/kernel/{?,??,[^s][^h][^m]**} w,  # deny everything except shm* in /proc/sys/kernel/
  deny @{PROC}/sysrq-trigger rwklx,
  deny @{PROC}/mem rwklx,
  deny @{PROC}/kmem rwklx,
  deny @{PROC}/kcore rwklx,
@z

@x
  deny mount,
@y
  deny mount,
@z

@x
  deny /sys/[^f]*/** wklx,
  deny /sys/f[^s]*/** wklx,
  deny /sys/fs/[^c]*/** wklx,
  deny /sys/fs/c[^g]*/** wklx,
  deny /sys/fs/cg[^r]*/** wklx,
  deny /sys/firmware/** rwklx,
  deny /sys/kernel/security/** rwklx,
}
```
@y
  deny /sys/[^f]*/** wklx,
  deny /sys/f[^s]*/** wklx,
  deny /sys/fs/[^c]*/** wklx,
  deny /sys/fs/c[^g]*/** wklx,
  deny /sys/fs/cg[^r]*/** wklx,
  deny /sys/firmware/** rwklx,
  deny /sys/kernel/security/** rwklx,
}
```
@z

@x
1. Save the custom profile to disk in the
   `/etc/apparmor.d/containers/docker-nginx` file.
@y
1. Save the custom profile to disk in the
   `/etc/apparmor.d/containers/docker-nginx` file.
@z

@x
   The file path in this example is not a requirement. In production, you could
   use another.
@y
   The file path in this example is not a requirement. In production, you could
   use another.
@z

@x
2. Load the profile.
@y
2. Load the profile.
@z

@x
   ```console
   $ sudo apparmor_parser -r -W /etc/apparmor.d/containers/docker-nginx
   ```
@y
   ```console
   $ sudo apparmor_parser -r -W /etc/apparmor.d/containers/docker-nginx
   ```
@z

@x
3. Run a container with the profile.
@y
3. Run a container with the profile.
@z

@x
   To run nginx in detached mode:
@y
   To run nginx in detached mode:
@z

@x
   ```console
   $ docker run --security-opt "apparmor=docker-nginx" \
        -p 80:80 -d --name apparmor-nginx nginx
   ```
@y
   ```console
   $ docker run --security-opt "apparmor=docker-nginx" \
        -p 80:80 -d --name apparmor-nginx nginx
   ```
@z

@x
4. Exec into the running container.
@y
4. Exec into the running container.
@z

@x
   ```console
   $ docker container exec -it apparmor-nginx bash
   ```
@y
   ```console
   $ docker container exec -it apparmor-nginx bash
   ```
@z

@x
5. Try some operations to test the profile.
@y
5. Try some operations to test the profile.
@z

@x
   ```console
   root@6da5a2a930b9:~# ping 8.8.8.8
   ping: Lacking privilege for raw socket.
@y
   ```console
   root@6da5a2a930b9:~# ping 8.8.8.8
   ping: Lacking privilege for raw socket.
@z

@x
   root@6da5a2a930b9:/# top
   bash: /usr/bin/top: Permission denied
@y
   root@6da5a2a930b9:/# top
   bash: /usr/bin/top: Permission denied
@z

@x
   root@6da5a2a930b9:~# touch ~/thing
   touch: cannot touch 'thing': Permission denied
@y
   root@6da5a2a930b9:~# touch ~/thing
   touch: cannot touch 'thing': Permission denied
@z

@x
   root@6da5a2a930b9:/# sh
   bash: /bin/sh: Permission denied
@y
   root@6da5a2a930b9:/# sh
   bash: /bin/sh: Permission denied
@z

@x
   root@6da5a2a930b9:/# dash
   bash: /bin/dash: Permission denied
   ```
@y
   root@6da5a2a930b9:/# dash
   bash: /bin/dash: Permission denied
   ```
@z

@x
You just deployed a container secured with a custom apparmor profile.
@y
You just deployed a container secured with a custom apparmor profile.
@z

@x
## Debug AppArmor
@y
## Debug AppArmor
@z

@x
You can use `dmesg` to debug problems and `aa-status` check the loaded profiles.
@y
You can use `dmesg` to debug problems and `aa-status` check the loaded profiles.
@z

@x
### Use dmesg
@y
### Use dmesg
@z

@x
Here are some helpful tips for debugging any problems you might be facing with
regard to AppArmor.
@y
Here are some helpful tips for debugging any problems you might be facing with
regard to AppArmor.
@z

@x
AppArmor sends quite verbose messaging to `dmesg`. Usually an AppArmor line
looks like the following:
@y
AppArmor sends quite verbose messaging to `dmesg`. Usually an AppArmor line
looks like the following:
@z

@x
```text
[ 5442.864673] audit: type=1400 audit(1453830992.845:37): apparmor="ALLOWED" operation="open" profile="/usr/bin/docker" name="/home/jessie/docker/man/man1/docker-attach.1" pid=10923 comm="docker" requested_mask="r" denied_mask="r" fsuid=1000 ouid=0
```
@y
```text
[ 5442.864673] audit: type=1400 audit(1453830992.845:37): apparmor="ALLOWED" operation="open" profile="/usr/bin/docker" name="/home/jessie/docker/man/man1/docker-attach.1" pid=10923 comm="docker" requested_mask="r" denied_mask="r" fsuid=1000 ouid=0
```
@z

@x
In the above example, you can see `profile=/usr/bin/docker`. This means the
user has the `docker-engine` (Docker Engine daemon) profile loaded.
@y
In the above example, you can see `profile=/usr/bin/docker`. This means the
user has the `docker-engine` (Docker Engine daemon) profile loaded.
@z

@x
Look at another log line:
@y
Look at another log line:
@z

@x
```text
[ 3256.689120] type=1400 audit(1405454041.341:73): apparmor="DENIED" operation="ptrace" profile="docker-default" pid=17651 comm="docker" requested_mask="receive" denied_mask="receive"
```
@y
```text
[ 3256.689120] type=1400 audit(1405454041.341:73): apparmor="DENIED" operation="ptrace" profile="docker-default" pid=17651 comm="docker" requested_mask="receive" denied_mask="receive"
```
@z

@x
This time the profile is `docker-default`, which is run on containers by
default unless in `privileged` mode. This line shows that apparmor has denied
`ptrace` in the container. This is exactly as expected.
@y
This time the profile is `docker-default`, which is run on containers by
default unless in `privileged` mode. This line shows that apparmor has denied
`ptrace` in the container. This is exactly as expected.
@z

@x
### Use aa-status
@y
### Use aa-status
@z

@x
If you need to check which profiles are loaded,  you can use `aa-status`. The
output looks like:
@y
If you need to check which profiles are loaded,  you can use `aa-status`. The
output looks like:
@z

@x
```console
$ sudo aa-status
apparmor module is loaded.
14 profiles are loaded.
1 profiles are in enforce mode.
   docker-default
13 profiles are in complain mode.
   /usr/bin/docker
   /usr/bin/docker///bin/cat
   /usr/bin/docker///bin/ps
   /usr/bin/docker///sbin/apparmor_parser
   /usr/bin/docker///sbin/auplink
   /usr/bin/docker///sbin/blkid
   /usr/bin/docker///sbin/iptables
   /usr/bin/docker///sbin/mke2fs
   /usr/bin/docker///sbin/modprobe
   /usr/bin/docker///sbin/tune2fs
   /usr/bin/docker///sbin/xtables-multi
   /usr/bin/docker///sbin/zfs
   /usr/bin/docker///usr/bin/xz
38 processes have profiles defined.
37 processes are in enforce mode.
   docker-default (6044)
   ...
   docker-default (31899)
1 processes are in complain mode.
   /usr/bin/docker (29756)
0 processes are unconfined but have a profile defined.
```
@y
```console
$ sudo aa-status
apparmor module is loaded.
14 profiles are loaded.
1 profiles are in enforce mode.
   docker-default
13 profiles are in complain mode.
   /usr/bin/docker
   /usr/bin/docker///bin/cat
   /usr/bin/docker///bin/ps
   /usr/bin/docker///sbin/apparmor_parser
   /usr/bin/docker///sbin/auplink
   /usr/bin/docker///sbin/blkid
   /usr/bin/docker///sbin/iptables
   /usr/bin/docker///sbin/mke2fs
   /usr/bin/docker///sbin/modprobe
   /usr/bin/docker///sbin/tune2fs
   /usr/bin/docker///sbin/xtables-multi
   /usr/bin/docker///sbin/zfs
   /usr/bin/docker///usr/bin/xz
38 processes have profiles defined.
37 processes are in enforce mode.
   docker-default (6044)
   ...
   docker-default (31899)
1 processes are in complain mode.
   /usr/bin/docker (29756)
0 processes are unconfined but have a profile defined.
```
@z

@x
The above output shows that the `docker-default` profile running on various
container PIDs is in `enforce` mode. This means AppArmor is actively blocking
and auditing in `dmesg` anything outside the bounds of the `docker-default`
profile.
@y
The above output shows that the `docker-default` profile running on various
container PIDs is in `enforce` mode. This means AppArmor is actively blocking
and auditing in `dmesg` anything outside the bounds of the `docker-default`
profile.
@z

@x
The output above also shows the `/usr/bin/docker` (Docker Engine daemon) profile
is running in `complain` mode. This means AppArmor only logs to `dmesg`
activity outside the bounds of the profile. (Except in the case of Ubuntu
Trusty, where some interesting behaviors are enforced.)
@y
The output above also shows the `/usr/bin/docker` (Docker Engine daemon) profile
is running in `complain` mode. This means AppArmor only logs to `dmesg`
activity outside the bounds of the profile. (Except in the case of Ubuntu
Trusty, where some interesting behaviors are enforced.)
@z

@x
## Contribute to Docker's AppArmor code
@y
## Contribute to Docker's AppArmor code
@z

@x
Advanced users and package managers can find a profile for `/usr/bin/docker`
(Docker Engine daemon) underneath
[contrib/apparmor](https://github.com/moby/moby/tree/master/contrib/apparmor)
in the Docker Engine source repository.
@y
Advanced users and package managers can find a profile for `/usr/bin/docker`
(Docker Engine daemon) underneath
[contrib/apparmor](https://github.com/moby/moby/tree/master/contrib/apparmor)
in the Docker Engine source repository.
@z

@x
The `docker-default` profile for containers lives in
[profiles/apparmor](https://github.com/moby/moby/tree/master/profiles/apparmor).
@y
The `docker-default` profile for containers lives in
[profiles/apparmor](https://github.com/moby/moby/tree/master/profiles/apparmor).
@z
