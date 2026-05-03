%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Security model
linkTitle: Security model
@y
title: Security model
linkTitle: Security model
@z

@x
description: Trust boundaries, isolation layers, and security properties of Docker Sandboxes.
keywords: docker sandboxes, security model, isolation, trust boundaries, microVM
@y
description: Trust boundaries, isolation layers, and security properties of Docker Sandboxes.
keywords: docker sandboxes, security model, isolation, trust boundaries, microVM
@z

@x
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@y
{{< summary-bar feature_name="Docker Sandboxes sbx" >}}
@z

@x
Docker Sandboxes run AI agents in microVMs so they can execute code, install
packages, and use tools without accessing your host system. Multiple isolation
layers protect your host system.
@y
Docker Sandboxes run AI agents in microVMs so they can execute code, install
packages, and use tools without accessing your host system. Multiple isolation
layers protect your host system.
@z

@x
## Trust boundaries
@y
## Trust boundaries
@z

@x
The primary trust boundary is the microVM. The agent has full control inside
the VM, including sudo access. The VM boundary prevents the agent from reaching
anything on your host except what is explicitly shared.
@y
The primary trust boundary is the microVM. The agent has full control inside
the VM, including sudo access. The VM boundary prevents the agent from reaching
anything on your host except what is explicitly shared.
@z

@x
What crosses the boundary into the VM:
@y
What crosses the boundary into the VM:
@z

@x
- **Workspace directory:** mounted into the VM with read-write access. With
  the default direct mount, changes the agent makes appear on your host
  immediately.
- **Credentials:** the host-side proxy injects authentication headers into
  outbound HTTP requests. The raw credential values never enter the VM.
- **Network access:** HTTP and HTTPS requests to
  [allowed domains](defaults/) are proxied through the host.
@y
- **Workspace directory:** mounted into the VM with read-write access. With
  the default direct mount, changes the agent makes appear on your host
  immediately.
- **Credentials:** the host-side proxy injects authentication headers into
  outbound HTTP requests. The raw credential values never enter the VM.
- **Network access:** HTTP and HTTPS requests to
  [allowed domains](defaults/) are proxied through the host.
@z

@x
What crosses the boundary back to the host:
@y
What crosses the boundary back to the host:
@z

@x
- **Workspace file changes:** visible on your host in real time with the
  default direct mount.
- **HTTP/HTTPS requests:** sent to allowed domains through the host proxy.
@y
- **Workspace file changes:** visible on your host in real time with the
  default direct mount.
- **HTTP/HTTPS requests:** sent to allowed domains through the host proxy.
@z

@x
Everything else is blocked. The agent cannot access your host filesystem
(outside the workspace), your host Docker daemon, your host network or
localhost, other sandboxes, or any domain not in the allow list. Raw TCP, UDP,
and ICMP are blocked at the network layer.
@y
Everything else is blocked. The agent cannot access your host filesystem
(outside the workspace), your host Docker daemon, your host network or
localhost, other sandboxes, or any domain not in the allow list. Raw TCP, UDP,
and ICMP are blocked at the network layer.
@z

@x
![Sandbox security model showing the hypervisor boundary between the sandbox VM and the host system. The workspace directory is shared read-write. The agent process, Docker Engine, packages, and VM filesystem are inside the VM. Host filesystem, processes, Docker Engine, and network are outside the VM and not accessible. A proxy enforces allow/deny policies and injects credentials into outbound requests.](../images/sbx-security.png)
@y
![Sandbox security model showing the hypervisor boundary between the sandbox VM and the host system. The workspace directory is shared read-write. The agent process, Docker Engine, packages, and VM filesystem are inside the VM. Host filesystem, processes, Docker Engine, and network are outside the VM and not accessible. A proxy enforces allow/deny policies and injects credentials into outbound requests.](../images/sbx-security.png)
@z

@x
## Isolation layers
@y
## Isolation layers
@z

@x
The sandbox security model has four layers. See
[Isolation layers](isolation/) for technical details on each.
@y
The sandbox security model has four layers. See
[Isolation layers](isolation/) for technical details on each.
@z

@x
- **Hypervisor isolation:** separate kernel per sandbox. No shared memory or
  processes with the host.
- **Network isolation:** all HTTP/HTTPS traffic proxied through the host.
  [Deny-by-default policy](defaults/). Non-HTTP protocols blocked entirely.
- **Docker Engine isolation:** each sandbox has its own Docker Engine with no
  path to the host daemon.
- **Credential isolation:** API keys are injected into HTTP headers by the
  host-side proxy. Credential values never enter the VM.
@y
- **Hypervisor isolation:** separate kernel per sandbox. No shared memory or
  processes with the host.
- **Network isolation:** all HTTP/HTTPS traffic proxied through the host.
  [Deny-by-default policy](defaults/). Non-HTTP protocols blocked entirely.
- **Docker Engine isolation:** each sandbox has its own Docker Engine with no
  path to the host daemon.
- **Credential isolation:** API keys are injected into HTTP headers by the
  host-side proxy. Credential values never enter the VM.
@z

@x
## What the agent can do inside the sandbox
@y
## What the agent can do inside the sandbox
@z

@x
Inside the VM, the agent has full privileges: sudo access, package installation,
a private Docker Engine, and read-write access to the workspace. Installed
packages, Docker images, and other VM state persist across restarts. See
[Default security posture](defaults/) for the full breakdown of what is
permitted and what is blocked.
@y
Inside the VM, the agent has full privileges: sudo access, package installation,
a private Docker Engine, and read-write access to the workspace. Installed
packages, Docker images, and other VM state persist across restarts. See
[Default security posture](defaults/) for the full breakdown of what is
permitted and what is blocked.
@z

@x
## What is not isolated by default
@y
## What is not isolated by default
@z

@x
The sandbox isolates the agent from your host system, but the agent's actions
can still affect you through the shared workspace and allowed network channels.
@y
The sandbox isolates the agent from your host system, but the agent's actions
can still affect you through the shared workspace and allowed network channels.
@z

@x
**Workspace changes are live on your host.** The agent edits the same files you
see on your host. This includes files that execute implicitly during normal
development: Git hooks, CI configuration, IDE task configs, `Makefile`,
`package.json` scripts, and similar build files. Review changes before running
any modified code. Note that Git hooks live inside `.git/` and do not appear in
`git diff` output. Check them separately.
See [Workspace trust](workspace/).
@y
**Workspace changes are live on your host.** The agent edits the same files you
see on your host. This includes files that execute implicitly during normal
development: Git hooks, CI configuration, IDE task configs, `Makefile`,
`package.json` scripts, and similar build files. Review changes before running
any modified code. Note that Git hooks live inside `.git/` and do not appear in
`git diff` output. Check them separately.
See [Workspace trust](workspace/).
@z

@x
**Default allowed domains include broad wildcards.** Some defaults like
`*.googleapis.com` cover many services beyond AI APIs. Run `sbx policy ls` to
see the full list of active rules, and remove entries you don't need. See
[Default security posture](defaults/).
@y
**Default allowed domains include broad wildcards.** Some defaults like
`*.googleapis.com` cover many services beyond AI APIs. Run `sbx policy ls` to
see the full list of active rules, and remove entries you don't need. See
[Default security posture](defaults/).
@z

@x
## Learn more
@y
## Learn more
@z

@x
- [Isolation layers](isolation/): how hypervisor, network, Docker, and
  credential isolation work
- [Default security posture](defaults/): what a fresh sandbox permits and
  blocks
- [Credentials](credentials/): how to provide and manage API keys
- [Policies](policy/): how to customize network access rules
- [Workspace trust](workspace/): what to review after an agent session
@y
- [Isolation layers](isolation/): how hypervisor, network, Docker, and
  credential isolation work
- [Default security posture](defaults/): what a fresh sandbox permits and
  blocks
- [Credentials](credentials/): how to provide and manage API keys
- [Policies](policy/): how to customize network access rules
- [Workspace trust](workspace/): what to review after an agent session
@z
