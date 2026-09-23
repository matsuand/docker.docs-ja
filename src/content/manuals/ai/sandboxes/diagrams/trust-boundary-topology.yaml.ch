%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
type: topology
title: Explore the microVM isolation boundary
description: Select a component or labeled connection to inspect what is private, mounted, or unreachable.
@y
type: topology
title: Explore the microVM isolation boundary
description: Select a component or labeled connection to inspect what is private, mounted, or unreachable.
@z

@x
  label: The agent is contained inside the microVM
  body: The agent controls the private VM filesystem and Docker Engine. The workspace, optional skills store, and forwarded SSH agent socket are explicit host connections; other host resources have no direct access path.
@y
  label: The agent is contained inside the microVM
  body: The agent controls the private VM filesystem and Docker Engine. The workspace, optional skills store, and forwarded SSH agent socket are explicit host connections; other host resources have no direct access path.
@z

@x
    label: Host machine
@y
    label: Host machine
@z

@x
    label: Sandbox microVM
@y
    label: Sandbox microVM
@z

@x
    label: AI agent
    description: Full control in the microVM
    details: The agent has sudo access inside the microVM. It can install packages, run code, and modify resources that are inside the sandbox boundary.
    category: Inside the microVM
@y
    label: AI agent
    description: Full control in the microVM
    details: The agent has sudo access inside the microVM. It can install packages, run code, and modify resources that are inside the sandbox boundary.
    category: Inside the microVM
@z

@x
    label: VM filesystem
    description: Private to this sandbox
    details: The microVM has its own persistent filesystem. The agent cannot use it to browse files elsewhere on the host.
    category: Inside the microVM
@y
    label: VM filesystem
    description: Private to this sandbox
    details: The microVM has its own persistent filesystem. The agent cannot use it to browse files elsewhere on the host.
    category: Inside the microVM
@z

@x
    label: Docker Engine
    description: No host connection
    details: Containers created by the agent run on the Docker Engine inside the microVM. This engine has no connection to the Docker daemon on the host.
    category: Inside the microVM
@y
    label: Docker Engine
    description: No host connection
    details: Containers created by the agent run on the Docker Engine inside the microVM. This engine has no connection to the Docker daemon on the host.
    category: Inside the microVM
@z

@x
    label: Workspace
    description: Mounted from the host
    details: Direct mode mounts the host working tree read-write, so edits are visible on both sides. Clone mode mounts the host repository read-only and gives the agent a private clone.
    category: Explicitly shared
@y
    label: Workspace
    description: Mounted from the host
    details: Direct mode mounts the host working tree read-write, so edits are visible on both sides. Clone mode mounts the host repository read-only and gives the agent a private clone.
    category: Explicitly shared
@z

@x
    label: Shared skills store
    description: Optional shared mount
    details: Supported agents mount the host-side skills store read-write unless you opt out. Changes can become visible to agents in other participating sandboxes.
    category: Explicitly shared
@y
    label: Shared skills store
    description: Optional shared mount
    details: Supported agents mount the host-side skills store read-write unless you opt out. Changes can become visible to agents in other participating sandboxes.
    category: Explicitly shared
@z

@x
    label: SSH agent socket
    description: Forwarded by default
    details: When SSH_AUTH_SOCK is set on the host, Docker Sandboxes forwards the agent socket into the microVM. Sandbox processes can request signatures, but the private keys stay on the host.
    category: Explicitly shared
@y
    label: SSH agent socket
    description: Forwarded by default
    details: When SSH_AUTH_SOCK is set on the host, Docker Sandboxes forwards the agent socket into the microVM. Sandbox processes can request signatures, but the private keys stay on the host.
    category: Explicitly shared
@z

@x
    label: Other host resources
    description: No direct access
    details: The agent has no direct path to the rest of the host filesystem, host processes, or the host Docker daemon.
    category: Outside the microVM
@y
    label: Other host resources
    description: No direct access
    details: The agent has no direct path to the rest of the host filesystem, host processes, or the host Docker daemon.
    category: Outside the microVM
@z

@x
    label: Workspace mount
    details: This explicit mount is the agent's path to project files on the host. Its permissions depend on whether the sandbox uses direct mode or clone mode.
    category: Shared relationship
@y
    label: Workspace mount
    details: This explicit mount is the agent's path to project files on the host. Its permissions depend on whether the sandbox uses direct mode or clone mode.
    category: Shared relationship
@z

@x
    label: Skills mount
    details: This optional read-write mount connects supported agents to a persistent skills store shared through the host.
    category: Shared relationship
@y
    label: Skills mount
    details: This optional read-write mount connects supported agents to a persistent skills store shared through the host.
    category: Shared relationship
@z

@x
    label: SSH agent socket
    details: The forwarded socket gives sandbox processes access to signing operations through the host SSH agent without exposing the private keys.
    category: Shared relationship
@y
    label: SSH agent socket
    details: The forwarded socket gives sandbox processes access to signing operations through the host SSH agent without exposing the private keys.
    category: Shared relationship
@z
