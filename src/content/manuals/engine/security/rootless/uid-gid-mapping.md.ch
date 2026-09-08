%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: How container UIDs and GIDs are mapped to the host in rootless mode
keywords: security, namespaces, rootless, uid, gid, subuid, subgid
title: UID/GID mapping
@y
description: How container UIDs and GIDs are mapped to the host in rootless mode
keywords: security, namespaces, rootless, uid, gid, subuid, subgid
title: UID/GID mapping
@z

@x
Rootless mode and [`userns-remap` mode](../userns-remap.md) map container UIDs
and GIDs to the host differently.
@y
Rootless mode and [`userns-remap` mode](../userns-remap.md) map container UIDs
and GIDs to the host differently.
@z

@x
- In `userns-remap` mode, container UID `0` is mapped to the first subordinate
  UID listed in `/etc/subuid` for the remap user, and container UID `n` is
  mapped to `subuid + n`.
- In rootless mode, container UID `0` is mapped to the host UID of the user
  running rootless Docker (the result of `id -u`); container UID `n` (for
  `n >= 1`) is mapped to `subuid + (n - 1)`.
@y
- In `userns-remap` mode, container UID `0` is mapped to the first subordinate
  UID listed in `/etc/subuid` for the remap user, and container UID `n` is
  mapped to `subuid + n`.
- In rootless mode, container UID `0` is mapped to the host UID of the user
  running rootless Docker (the result of `id -u`); container UID `n` (for
  `n >= 1`) is mapped to `subuid + (n - 1)`.
@z

@x
GIDs follow the same rules using `/etc/subgid`.
@y
GIDs follow the same rules using `/etc/subgid`.
@z

@x
This difference matters when setting file permissions on bind-mounted
directories: in rootless mode, files owned by your host user appear as owned
by `root` inside the container.
@y
This difference matters when setting file permissions on bind-mounted
directories: in rootless mode, files owned by your host user appear as owned
by `root` inside the container.
@z
