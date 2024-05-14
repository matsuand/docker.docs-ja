%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Review of the Docker Daemon attack surface
keywords: Docker, Docker documentation, security
title: Docker security
aliases:
- /articles/security/
- /engine/articles/security/
- /engine/security/security/
- /security/security/
---
@y
---
description: Review of the Docker Daemon attack surface
keywords: Docker, Docker documentation, security
title: Docker security
aliases:
- /articles/security/
- /engine/articles/security/
- /engine/security/security/
- /security/security/
---
@z

@x
There are four major areas to consider when reviewing Docker security:
@y
There are four major areas to consider when reviewing Docker security:
@z

@x
 - The intrinsic security of the kernel and its support for
   namespaces and cgroups
 - The attack surface of the Docker daemon itself
 - Loopholes in the container configuration profile, either by default,
   or when customized by users.
 - The "hardening" security features of the kernel and how they
   interact with containers.
@y
 - The intrinsic security of the kernel and its support for
   namespaces and cgroups
 - The attack surface of the Docker daemon itself
 - Loopholes in the container configuration profile, either by default,
   or when customized by users.
 - The "hardening" security features of the kernel and how they
   interact with containers.
@z

@x
## Kernel namespaces
@y
## Kernel namespaces
@z

@x
Docker containers are very similar to LXC containers, and they have
similar security features. When you start a container with
`docker run`, behind the scenes Docker creates a set of namespaces and control
groups for the container.
@y
Docker containers are very similar to LXC containers, and they have
similar security features. When you start a container with
`docker run`, behind the scenes Docker creates a set of namespaces and control
groups for the container.
@z

@x
Namespaces provide the first and most straightforward form of
isolation. Processes running within a container cannot see, and even
less affect, processes running in another container, or in the host
system.
@y
Namespaces provide the first and most straightforward form of
isolation. Processes running within a container cannot see, and even
less affect, processes running in another container, or in the host
system.
@z

@x
Each container also gets its own network stack, meaning that a
container doesn't get privileged access to the sockets or interfaces
of another container. Of course, if the host system is setup
accordingly, containers can interact with each other through their
respective network interfaces — just like they can interact with
external hosts. When you specify public ports for your containers or use
[links](../../network/links.md)
then IP traffic is allowed between containers. They can ping each other,
send/receive UDP packets, and establish TCP connections, but that can be
restricted if necessary. From a network architecture point of view, all
containers on a given Docker host are sitting on bridge interfaces. This
means that they are just like physical machines connected through a
common Ethernet switch; no more, no less.
@y
Each container also gets its own network stack, meaning that a
container doesn't get privileged access to the sockets or interfaces
of another container. Of course, if the host system is setup
accordingly, containers can interact with each other through their
respective network interfaces — just like they can interact with
external hosts. When you specify public ports for your containers or use
[links](../../network/links.md)
then IP traffic is allowed between containers. They can ping each other,
send/receive UDP packets, and establish TCP connections, but that can be
restricted if necessary. From a network architecture point of view, all
containers on a given Docker host are sitting on bridge interfaces. This
means that they are just like physical machines connected through a
common Ethernet switch; no more, no less.
@z

@x
How mature is the code providing kernel namespaces and private
networking? Kernel namespaces were introduced [between kernel version
2.6.15 and
2.6.26](https://man7.org/linux/man-pages/man7/namespaces.7.html).
This means that since July 2008 (date of the 2.6.26 release
), namespace code has been exercised and scrutinized on a large
number of production systems. And there is more: the design and
inspiration for the namespaces code are even older. Namespaces are
actually an effort to reimplement the features of [OpenVZ](
https://en.wikipedia.org/wiki/OpenVZ) in such a way that they could be
merged within the mainstream kernel. And OpenVZ was initially released
in 2005, so both the design and the implementation are pretty mature.
@y
How mature is the code providing kernel namespaces and private
networking? Kernel namespaces were introduced [between kernel version
2.6.15 and
2.6.26](https://man7.org/linux/man-pages/man7/namespaces.7.html).
This means that since July 2008 (date of the 2.6.26 release
), namespace code has been exercised and scrutinized on a large
number of production systems. And there is more: the design and
inspiration for the namespaces code are even older. Namespaces are
actually an effort to reimplement the features of [OpenVZ](
https://en.wikipedia.org/wiki/OpenVZ) in such a way that they could be
merged within the mainstream kernel. And OpenVZ was initially released
in 2005, so both the design and the implementation are pretty mature.
@z

@x
## Control groups
@y
## Control groups
@z

@x
Control Groups are another key component of Linux containers. They
implement resource accounting and limiting. They provide many
useful metrics, but they also help ensure that each container gets
its fair share of memory, CPU, disk I/O; and, more importantly, that a
single container cannot bring the system down by exhausting one of those
resources.
@y
Control Groups are another key component of Linux containers. They
implement resource accounting and limiting. They provide many
useful metrics, but they also help ensure that each container gets
its fair share of memory, CPU, disk I/O; and, more importantly, that a
single container cannot bring the system down by exhausting one of those
resources.
@z

@x
So while they do not play a role in preventing one container from
accessing or affecting the data and processes of another container, they
are essential to fend off some denial-of-service attacks. They are
particularly important on multi-tenant platforms, like public and
private PaaS, to guarantee a consistent uptime (and performance) even
when some applications start to misbehave.
@y
So while they do not play a role in preventing one container from
accessing or affecting the data and processes of another container, they
are essential to fend off some denial-of-service attacks. They are
particularly important on multi-tenant platforms, like public and
private PaaS, to guarantee a consistent uptime (and performance) even
when some applications start to misbehave.
@z

@x
Control Groups have been around for a while as well: the code was
started in 2006, and initially merged in kernel 2.6.24.
@y
Control Groups have been around for a while as well: the code was
started in 2006, and initially merged in kernel 2.6.24.
@z

@x
## Docker daemon attack surface
@y
## Docker daemon attack surface
@z

@x
Running containers (and applications) with Docker implies running the
Docker daemon. This daemon requires `root` privileges unless you opt-in
to [Rootless mode](rootless.md), and you should therefore be aware of
some important details.
@y
Running containers (and applications) with Docker implies running the
Docker daemon. This daemon requires `root` privileges unless you opt-in
to [Rootless mode](rootless.md), and you should therefore be aware of
some important details.
@z

@x
First of all, only trusted users should be allowed to control your
Docker daemon. This is a direct consequence of some powerful Docker
features. Specifically, Docker allows you to share a directory between
the Docker host and a guest container; and it allows you to do so
without limiting the access rights of the container. This means that you
can start a container where the `/host` directory is the `/` directory
on your host; and the container can alter your host filesystem
without any restriction. This is similar to how virtualization systems
allow filesystem resource sharing. Nothing prevents you from sharing your
root filesystem (or even your root block device) with a virtual machine.
@y
First of all, only trusted users should be allowed to control your
Docker daemon. This is a direct consequence of some powerful Docker
features. Specifically, Docker allows you to share a directory between
the Docker host and a guest container; and it allows you to do so
without limiting the access rights of the container. This means that you
can start a container where the `/host` directory is the `/` directory
on your host; and the container can alter your host filesystem
without any restriction. This is similar to how virtualization systems
allow filesystem resource sharing. Nothing prevents you from sharing your
root filesystem (or even your root block device) with a virtual machine.
@z

@x
This has a strong security implication: for example, if you instrument Docker
from a web server to provision containers through an API, you should be
even more careful than usual with parameter checking, to make sure that
a malicious user cannot pass crafted parameters causing Docker to create
arbitrary containers.
@y
This has a strong security implication: for example, if you instrument Docker
from a web server to provision containers through an API, you should be
even more careful than usual with parameter checking, to make sure that
a malicious user cannot pass crafted parameters causing Docker to create
arbitrary containers.
@z

@x
For this reason, the REST API endpoint (used by the Docker CLI to
communicate with the Docker daemon) changed in Docker 0.5.2, and now
uses a Unix socket instead of a TCP socket bound on 127.0.0.1 (the
latter being prone to cross-site request forgery attacks if you happen to run
Docker directly on your local machine, outside of a VM). You can then
use traditional Unix permission checks to limit access to the control
socket.
@y
For this reason, the REST API endpoint (used by the Docker CLI to
communicate with the Docker daemon) changed in Docker 0.5.2, and now
uses a Unix socket instead of a TCP socket bound on 127.0.0.1 (the
latter being prone to cross-site request forgery attacks if you happen to run
Docker directly on your local machine, outside of a VM). You can then
use traditional Unix permission checks to limit access to the control
socket.
@z

@x
You can also expose the REST API over HTTP if you explicitly decide to do so.
However, if you do that, be aware of the above mentioned security implications.
Note that even if you have a firewall to limit accesses to the REST API 
endpoint from other hosts in the network, the endpoint can be still accessible
from containers, and it can easily result in the privilege escalation.
Therefore it is *mandatory* to secure API endpoints with 
[HTTPS and certificates](protect-access.md).
Exposing the daemon API over HTTP without TLS is not permitted,
and such a configuration causes the daemon to fail early on startup, see
[Unauthenticated TCP connections](../deprecated.md#unauthenticated-tcp-connections).
It is also recommended to ensure that it is reachable only from a trusted
network or VPN.
@y
You can also expose the REST API over HTTP if you explicitly decide to do so.
However, if you do that, be aware of the above mentioned security implications.
Note that even if you have a firewall to limit accesses to the REST API 
endpoint from other hosts in the network, the endpoint can be still accessible
from containers, and it can easily result in the privilege escalation.
Therefore it is *mandatory* to secure API endpoints with 
[HTTPS and certificates](protect-access.md).
Exposing the daemon API over HTTP without TLS is not permitted,
and such a configuration causes the daemon to fail early on startup, see
[Unauthenticated TCP connections](../deprecated.md#unauthenticated-tcp-connections).
It is also recommended to ensure that it is reachable only from a trusted
network or VPN.
@z

@x
You can also use `DOCKER_HOST=ssh://USER@HOST` or `ssh -L /path/to/docker.sock:/var/run/docker.sock`
instead if you prefer SSH over TLS.
@y
You can also use `DOCKER_HOST=ssh://USER@HOST` or `ssh -L /path/to/docker.sock:/var/run/docker.sock`
instead if you prefer SSH over TLS.
@z

@x
The daemon is also potentially vulnerable to other inputs, such as image
loading from either disk with `docker load`, or from the network with
`docker pull`. As of Docker 1.3.2, images are now extracted in a chrooted
subprocess on Linux/Unix platforms, being the first-step in a wider effort
toward privilege separation. As of Docker 1.10.0, all images are stored and
accessed by the cryptographic checksums of their contents, limiting the
possibility of an attacker causing a collision with an existing image.
@y
The daemon is also potentially vulnerable to other inputs, such as image
loading from either disk with `docker load`, or from the network with
`docker pull`. As of Docker 1.3.2, images are now extracted in a chrooted
subprocess on Linux/Unix platforms, being the first-step in a wider effort
toward privilege separation. As of Docker 1.10.0, all images are stored and
accessed by the cryptographic checksums of their contents, limiting the
possibility of an attacker causing a collision with an existing image.
@z

@x
Finally, if you run Docker on a server, it is recommended to run
exclusively Docker on the server, and move all other services within
containers controlled by Docker. Of course, it is fine to keep your
favorite admin tools (probably at least an SSH server), as well as
existing monitoring/supervision processes, such as NRPE and collectd.
@y
Finally, if you run Docker on a server, it is recommended to run
exclusively Docker on the server, and move all other services within
containers controlled by Docker. Of course, it is fine to keep your
favorite admin tools (probably at least an SSH server), as well as
existing monitoring/supervision processes, such as NRPE and collectd.
@z

@x
## Linux kernel capabilities
@y
## Linux kernel capabilities
@z

@x
By default, Docker starts containers with a restricted set of
capabilities. What does that mean?
@y
By default, Docker starts containers with a restricted set of
capabilities. What does that mean?
@z

@x
Capabilities turn the binary "root/non-root" dichotomy into a
fine-grained access control system. Processes (like web servers) that
just need to bind on a port below 1024 do not need to run as root: they
can just be granted the `net_bind_service` capability instead. And there
are many other capabilities, for almost all the specific areas where root
privileges are usually needed. This means a lot for container security.
@y
Capabilities turn the binary "root/non-root" dichotomy into a
fine-grained access control system. Processes (like web servers) that
just need to bind on a port below 1024 do not need to run as root: they
can just be granted the `net_bind_service` capability instead. And there
are many other capabilities, for almost all the specific areas where root
privileges are usually needed. This means a lot for container security.
@z

@x
Typical servers run several processes as `root`, including the SSH daemon,
`cron` daemon, logging daemons, kernel modules, network configuration tools,
and more. A container is different, because almost all of those tasks are
handled by the infrastructure around the container:
@y
Typical servers run several processes as `root`, including the SSH daemon,
`cron` daemon, logging daemons, kernel modules, network configuration tools,
and more. A container is different, because almost all of those tasks are
handled by the infrastructure around the container:
@z

@x
 - SSH access are typically managed by a single server running on
   the Docker host
 - `cron`, when necessary, should run as a user
   process, dedicated and tailored for the app that needs its
   scheduling service, rather than as a platform-wide facility
 - Log management is also typically handed to Docker, or to
   third-party services like Loggly or Splunk
 - Hardware management is irrelevant, meaning that you never need to
   run `udevd` or equivalent daemons within
   containers
 - Network management happens outside of the containers, enforcing
   separation of concerns as much as possible, meaning that a container
   should never need to perform `ifconfig`,
   `route`, or ip commands (except when a container
   is specifically engineered to behave like a router or firewall, of
   course)
@y
 - SSH access are typically managed by a single server running on
   the Docker host
 - `cron`, when necessary, should run as a user
   process, dedicated and tailored for the app that needs its
   scheduling service, rather than as a platform-wide facility
 - Log management is also typically handed to Docker, or to
   third-party services like Loggly or Splunk
 - Hardware management is irrelevant, meaning that you never need to
   run `udevd` or equivalent daemons within
   containers
 - Network management happens outside of the containers, enforcing
   separation of concerns as much as possible, meaning that a container
   should never need to perform `ifconfig`,
   `route`, or ip commands (except when a container
   is specifically engineered to behave like a router or firewall, of
   course)
@z

@x
This means that in most cases, containers do not need "real" root
privileges at all* And therefore, containers can run with a reduced
capability set; meaning that "root" within a container has much less
privileges than the real "root". For instance, it is possible to:
@y
This means that in most cases, containers do not need "real" root
privileges at all* And therefore, containers can run with a reduced
capability set; meaning that "root" within a container has much less
privileges than the real "root". For instance, it is possible to:
@z

@x
 - Deny all "mount" operations
 - Deny access to raw sockets (to prevent packet spoofing)
 - Deny access to some filesystem operations, like creating new device
   nodes, changing the owner of files, or altering attributes (including
   the immutable flag)
 - Deny module loading
@y
 - Deny all "mount" operations
 - Deny access to raw sockets (to prevent packet spoofing)
 - Deny access to some filesystem operations, like creating new device
   nodes, changing the owner of files, or altering attributes (including
   the immutable flag)
 - Deny module loading
@z

@x
This means that even if an intruder manages to escalate to root within a
container, it is much harder to do serious damage, or to escalate
to the host.
@y
This means that even if an intruder manages to escalate to root within a
container, it is much harder to do serious damage, or to escalate
to the host.
@z

@x
This doesn't affect regular web apps, but reduces the vectors of attack by
malicious users considerably. By default Docker
drops all capabilities except [those
needed](https://github.com/moby/moby/blob/master/oci/caps/defaults.go#L6-L19),
an allowlist instead of a denylist approach. You can see a full list of
available capabilities in [Linux
manpages](https://man7.org/linux/man-pages/man7/capabilities.7.html).
@y
This doesn't affect regular web apps, but reduces the vectors of attack by
malicious users considerably. By default Docker
drops all capabilities except [those
needed](https://github.com/moby/moby/blob/master/oci/caps/defaults.go#L6-L19),
an allowlist instead of a denylist approach. You can see a full list of
available capabilities in [Linux
manpages](https://man7.org/linux/man-pages/man7/capabilities.7.html).
@z

@x
One primary risk with running Docker containers is that the default set
of capabilities and mounts given to a container may provide incomplete
isolation, either independently, or when used in combination with
kernel vulnerabilities.
@y
One primary risk with running Docker containers is that the default set
of capabilities and mounts given to a container may provide incomplete
isolation, either independently, or when used in combination with
kernel vulnerabilities.
@z

@x
Docker supports the addition and removal of capabilities, allowing use
of a non-default profile. This may make Docker more secure through
capability removal, or less secure through the addition of capabilities.
The best practice for users would be to remove all capabilities except
those explicitly required for their processes.
@y
Docker supports the addition and removal of capabilities, allowing use
of a non-default profile. This may make Docker more secure through
capability removal, or less secure through the addition of capabilities.
The best practice for users would be to remove all capabilities except
those explicitly required for their processes.
@z

@x
## Docker Content Trust signature verification
@y
## Docker Content Trust signature verification
@z

@x
Docker Engine can be configured to only run signed images. The Docker Content 
Trust signature verification feature is built directly into the `dockerd` binary.  
This is configured in the Dockerd configuration file. 
@y
Docker Engine can be configured to only run signed images. The Docker Content 
Trust signature verification feature is built directly into the `dockerd` binary.  
This is configured in the Dockerd configuration file. 
@z

@x
To enable this feature, trustpinning can be configured in `daemon.json`, whereby 
only repositories signed with a user-specified root key can be pulled and run.
@y
To enable this feature, trustpinning can be configured in `daemon.json`, whereby 
only repositories signed with a user-specified root key can be pulled and run.
@z

@x
This feature provides more insight to administrators than previously available with
the CLI for enforcing and performing image signature verification. 
@y
This feature provides more insight to administrators than previously available with
the CLI for enforcing and performing image signature verification. 
@z

@x
For more information on configuring Docker Content Trust Signature Verification, go to 
[Content trust in Docker](trust/index.md).
@y
For more information on configuring Docker Content Trust Signature Verification, go to 
[Content trust in Docker](trust/index.md).
@z

@x
## Other kernel security features
@y
## Other kernel security features
@z

@x
Capabilities are just one of the many security features provided by
modern Linux kernels. It is also possible to leverage existing,
well-known systems like TOMOYO, AppArmor, SELinux, GRSEC, etc. with
Docker.
@y
Capabilities are just one of the many security features provided by
modern Linux kernels. It is also possible to leverage existing,
well-known systems like TOMOYO, AppArmor, SELinux, GRSEC, etc. with
Docker.
@z

@x
While Docker currently only enables capabilities, it doesn't interfere
with the other systems. This means that there are many different ways to
harden a Docker host. Here are a few examples.
@y
While Docker currently only enables capabilities, it doesn't interfere
with the other systems. This means that there are many different ways to
harden a Docker host. Here are a few examples.
@z

@x
 - You can run a kernel with GRSEC and PAX. This adds many safety
   checks, both at compile-time and run-time; it also defeats many
   exploits, thanks to techniques like address randomization. It doesn't
   require Docker-specific configuration, since those security features
   apply system-wide, independent of containers.
 - If your distribution comes with security model templates for
   Docker containers, you can use them out of the box. For instance, we
   ship a template that works with AppArmor and Red Hat comes with SELinux
   policies for Docker. These templates provide an extra safety net (even
   though it overlaps greatly with capabilities).
 - You can define your own policies using your favorite access control
   mechanism.
@y
 - You can run a kernel with GRSEC and PAX. This adds many safety
   checks, both at compile-time and run-time; it also defeats many
   exploits, thanks to techniques like address randomization. It doesn't
   require Docker-specific configuration, since those security features
   apply system-wide, independent of containers.
 - If your distribution comes with security model templates for
   Docker containers, you can use them out of the box. For instance, we
   ship a template that works with AppArmor and Red Hat comes with SELinux
   policies for Docker. These templates provide an extra safety net (even
   though it overlaps greatly with capabilities).
 - You can define your own policies using your favorite access control
   mechanism.
@z

@x
Just as you can use third-party tools to augment Docker containers, including
special network topologies or shared filesystems, tools exist to harden Docker
containers without the need to modify Docker itself.
@y
Just as you can use third-party tools to augment Docker containers, including
special network topologies or shared filesystems, tools exist to harden Docker
containers without the need to modify Docker itself.
@z

@x
As of Docker 1.10 User Namespaces are supported directly by the docker
daemon. This feature allows for the root user in a container to be mapped
to a non uid-0 user outside the container, which can help to mitigate the
risks of container breakout. This facility is available but not enabled
by default.
@y
As of Docker 1.10 User Namespaces are supported directly by the docker
daemon. This feature allows for the root user in a container to be mapped
to a non uid-0 user outside the container, which can help to mitigate the
risks of container breakout. This facility is available but not enabled
by default.
@z

@x
Refer to the [daemon command](../../reference/cli/dockerd.md#daemon-user-namespace-options)
in the command line reference for more information on this feature.
Additional information on the implementation of User Namespaces in Docker
can be found in
[this blog post](https://integratedcode.us/2015/10/13/user-namespaces-have-arrived-in-docker/).
@y
Refer to the [daemon command](../../reference/cli/dockerd.md#daemon-user-namespace-options)
in the command line reference for more information on this feature.
Additional information on the implementation of User Namespaces in Docker
can be found in
[this blog post](https://integratedcode.us/2015/10/13/user-namespaces-have-arrived-in-docker/).
@z

@x
## Conclusions
@y
## Conclusions
@z

@x
Docker containers are, by default, quite secure; especially if you
run your processes as non-privileged users inside the container.
@y
Docker containers are, by default, quite secure; especially if you
run your processes as non-privileged users inside the container.
@z

@x
You can add an extra layer of safety by enabling AppArmor, SELinux,
GRSEC, or another appropriate hardening system.
@y
You can add an extra layer of safety by enabling AppArmor, SELinux,
GRSEC, or another appropriate hardening system.
@z

@x
If you think of ways to make docker more secure, we welcome feature requests,
pull requests, or comments on the Docker community forums.
@y
If you think of ways to make docker more secure, we welcome feature requests,
pull requests, or comments on the Docker community forums.
@z

@x
## Related information
@y
## Related information
@z

@x
* [Use trusted images](trust/index.md)
* [Seccomp security profiles for Docker](seccomp.md)
* [AppArmor security profiles for Docker](apparmor.md)
* [On the Security of Containers (2014)](https://medium.com/@ewindisch/on-the-security-of-containers-2c60ffe25a9e)
* [Docker swarm mode overlay network security model](../../network/drivers/overlay.md)
@y
* [Use trusted images](trust/index.md)
* [Seccomp security profiles for Docker](seccomp.md)
* [AppArmor security profiles for Docker](apparmor.md)
* [On the Security of Containers (2014)](https://medium.com/@ewindisch/on-the-security-of-containers-2c60ffe25a9e)
* [Docker swarm mode overlay network security model](../../network/drivers/overlay.md)
@z
