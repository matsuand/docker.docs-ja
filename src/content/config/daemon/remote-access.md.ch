%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
description:
  Configuring remote access allows Docker to accept requests from remote
  hosts by configuring it to listen on an IP address and port as well as the Unix
  socket
keywords: configuration, daemon, remote access, engine
title: Configure remote access for Docker daemon
@y
description:
  Configuring remote access allows Docker to accept requests from remote
  hosts by configuring it to listen on an IP address and port as well as the Unix
  socket
keywords: configuration, daemon, remote access, engine
title: Configure remote access for Docker daemon
@z

@x
By default, the Docker daemon listens for connections on a Unix socket to accept
requests from local clients. You can configure Docker to accept requests
from remote clients by configuring it to listen on an IP address and port as well
as the Unix socket.
@y
By default, the Docker daemon listens for connections on a Unix socket to accept
requests from local clients. You can configure Docker to accept requests
from remote clients by configuring it to listen on an IP address and port as well
as the Unix socket.
@z

@x
> **Warning**
>
> Configuring Docker to accept connections from remote clients can leave you
> vulnerable to unauthorized access to the host and other attacks.
@y
> **Warning**
>
> Configuring Docker to accept connections from remote clients can leave you
> vulnerable to unauthorized access to the host and other attacks.
@z
@x
> It's critically important that you understand the security implications of opening Docker to the network.
> If steps aren't taken to secure the connection, it's possible for remote non-root users to gain root access on the host.
@y
> It's critically important that you understand the security implications of opening Docker to the network.
> If steps aren't taken to secure the connection, it's possible for remote non-root users to gain root access on the host.
@z
@x
> Remote access without TLS is **not recommended**, and will require explicit opt-in in a future release.
> For more information on how to use TLS certificates to secure this connection, see
> [Protect the Docker daemon socket](../../engine/security/protect-access.md).
{ .warning }
@y
> Remote access without TLS is **not recommended**, and will require explicit opt-in in a future release.
> For more information on how to use TLS certificates to secure this connection, see
> [Protect the Docker daemon socket](../../engine/security/protect-access.md).
{ .warning }
@z

@x
## Enable remote access
@y
## Enable remote access
@z

@x
You can enable remote access to the daemon either using a `docker.service` systemd unit file for Linux distributions using systemd.
Or you can use the `daemon.json` file, if your distribution doesn't use systemd.
@y
You can enable remote access to the daemon either using a `docker.service` systemd unit file for Linux distributions using systemd.
Or you can use the `daemon.json` file, if your distribution doesn't use systemd.
@z

@x
Configuring Docker to listen for connections using both the systemd unit file
and the `daemon.json` file causes a conflict that prevents Docker from starting.
@y
Configuring Docker to listen for connections using both the systemd unit file
and the `daemon.json` file causes a conflict that prevents Docker from starting.
@z

@x
### Configuring remote access with systemd unit file
@y
### Configuring remote access with systemd unit file
@z

@x
1. Use the command `sudo systemctl edit docker.service` to open an override file
   for `docker.service` in a text editor.
@y
1. Use the command `sudo systemctl edit docker.service` to open an override file
   for `docker.service` in a text editor.
@z

@x
2. Add or modify the following lines, substituting your own values.
@y
2. Add or modify the following lines, substituting your own values.
@z

% snip code...

@x
3. Save the file.
@y
3. Save the file.
@z

@x
4. Reload the `systemctl` configuration.
@y
4. Reload the `systemctl` configuration.
@z

% snip command...

@x
5. Restart Docker.
@y
5. Restart Docker.
@z

% snip command...

@x
6. Verify that the change has gone through.
@y
6. Verify that the change has gone through.
@z

% snip command...

@x
### Configuring remote access with `daemon.json`
@y
### Configuring remote access with `daemon.json`
@z

@x
1. Set the `hosts` array in the `/etc/docker/daemon.json` to connect to the Unix
   socket and an IP address, as follows:
@y
1. Set the `hosts` array in the `/etc/docker/daemon.json` to connect to the Unix
   socket and an IP address, as follows:
@z

% snip code...

@x
2. Restart Docker.
@y
2. Restart Docker.
@z

@x
3. Verify that the change has gone through.
@y
3. Verify that the change has gone through.
@z

% snip command...
