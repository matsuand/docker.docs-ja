%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: How to start containers automatically
keywords: containers, restart, policies, automation, administration
title: Start containers automatically
@y
description: How to start containers automatically
keywords: containers, restart, policies, automation, administration
title: Start containers automatically
@z

@x
Docker provides [restart policies](/engine/containers/run.md#restart-policies---restart)
to control whether your containers start automatically when they exit, or when
Docker restarts. Restart policies start linked containers in the correct order.
Docker recommends that you use restart policies, and avoid using process
managers to start containers.
@y
Docker provides [restart policies](engine/containers/run.md#restart-policies---restart)
to control whether your containers start automatically when they exit, or when
Docker restarts. Restart policies start linked containers in the correct order.
Docker recommends that you use restart policies, and avoid using process
managers to start containers.
@z

@x
Restart policies are different from the `--live-restore` flag of the `dockerd`
command. Using `--live-restore` lets you to keep your containers running during
a Docker upgrade, though networking and user input are interrupted.
@y
Restart policies are different from the `--live-restore` flag of the `dockerd`
command. Using `--live-restore` lets you to keep your containers running during
a Docker upgrade, though networking and user input are interrupted.
@z

@x
## Use a restart policy
@y
## Use a restart policy
@z

@x
To configure the restart policy for a container, use the `--restart` flag
when using the `docker run` command. The value of the `--restart` flag can be
any of the following:
@y
To configure the restart policy for a container, use the `--restart` flag
when using the `docker run` command. The value of the `--restart` flag can be
any of the following:
@z

@x
| Flag                       | Description                                                                                                                                                                                                                                                                                                                                                           |
| :------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `no`                       | Don't automatically restart the container. (Default)                                                                                                                                                                                                                                                                                                                  |
| `on-failure[:max-retries]` | Restart the container if it exits due to an error, which manifests as a non-zero exit code. Optionally, limit the number of times the Docker daemon attempts to restart the container using the `:max-retries` option. The `on-failure` policy only prompts a restart if the container exits with a failure. It doesn't restart the container if the daemon restarts. |
| `always`                   | Always restart the container if it stops. If it's manually stopped, it's restarted only when Docker daemon restarts or the container itself is manually restarted. (See the second bullet listed in [restart policy details](#restart-policy-details))                                                                                                                |
| `unless-stopped`           | Similar to `always`, except that when the container is stopped (manually or otherwise), it isn't restarted even after Docker daemon restarts.                                                                                                                                                                                                                         |
@y
| Flag                       | Description                                                                                                                                                                                                                                                                                                                                                           |
| :------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `no`                       | Don't automatically restart the container. (Default)                                                                                                                                                                                                                                                                                                                  |
| `on-failure[:max-retries]` | Restart the container if it exits due to an error, which manifests as a non-zero exit code. Optionally, limit the number of times the Docker daemon attempts to restart the container using the `:max-retries` option. The `on-failure` policy only prompts a restart if the container exits with a failure. It doesn't restart the container if the daemon restarts. |
| `always`                   | Always restart the container if it stops. If it's manually stopped, it's restarted only when Docker daemon restarts or the container itself is manually restarted. (See the second bullet listed in [restart policy details](#restart-policy-details))                                                                                                                |
| `unless-stopped`           | Similar to `always`, except that when the container is stopped (manually or otherwise), it isn't restarted even after Docker daemon restarts.                                                                                                                                                                                                                         |
@z

@x
The following command starts a Redis container and configures it to always
restart, unless the container is explicitly stopped, or the daemon restarts.
@y
The following command starts a Redis container and configures it to always
restart, unless the container is explicitly stopped, or the daemon restarts.
@z

@x
```console
$ docker run -d --restart unless-stopped redis
```
@y
```console
$ docker run -d --restart unless-stopped redis
```
@z

@x
The following command changes the restart policy for an already running
container named `redis`.
@y
The following command changes the restart policy for an already running
container named `redis`.
@z

@x
```console
$ docker update --restart unless-stopped redis
```
@y
```console
$ docker update --restart unless-stopped redis
```
@z

@x
The following command ensures all running containers restart.
@y
The following command ensures all running containers restart.
@z

@x
```console
$ docker update --restart unless-stopped $(docker ps -q)
```
@y
```console
$ docker update --restart unless-stopped $(docker ps -q)
```
@z

@x
### Restart policy details
@y
### Restart policy details
@z

@x
Keep the following in mind when using restart policies:
@y
Keep the following in mind when using restart policies:
@z

@x
- A restart policy only takes effect after a container starts successfully. In
  this case, starting successfully means that the container is up for at least
  10 seconds and Docker has started monitoring it. This prevents a container
  which doesn't start at all from going into a restart loop.
@y
- A restart policy only takes effect after a container starts successfully. In
  this case, starting successfully means that the container is up for at least
  10 seconds and Docker has started monitoring it. This prevents a container
  which doesn't start at all from going into a restart loop.
@z

@x
- If you manually stop a container, the restart policy is ignored until the
  Docker daemon restarts or the container is manually restarted. This prevents
  a restart loop.
@y
- If you manually stop a container, the restart policy is ignored until the
  Docker daemon restarts or the container is manually restarted. This prevents
  a restart loop.
@z

@x
- Restart policies only apply to containers. To configure restart policies for
  Swarm services, see
  [flags related to service restart](/reference/cli/docker/service/create.md).
@y
- Restart policies only apply to containers. To configure restart policies for
  Swarm services, see
  [flags related to service restart](reference/cli/docker/service/create.md).
@z

@x
### Restarting foreground containers
@y
### Restarting foreground containers
@z

@x
When you run a container in the foreground, stopping a container causes the
attached CLI to exit as well, regardless of the restart policy of the
container. This behavior is illustrated in the following example.
@y
When you run a container in the foreground, stopping a container causes the
attached CLI to exit as well, regardless of the restart policy of the
container. This behavior is illustrated in the following example.
@z

@x
1. Create a Dockerfile that prints the numbers 1 to 5 and then exits.
@y
1. Create a Dockerfile that prints the numbers 1 to 5 and then exits.
@z

@x
   ```dockerfile
   FROM busybox:latest
   COPY --chmod=755 <<"EOF" /start.sh
   echo "Starting..."
   for i in $(seq 1 5); do
     echo "$i"
     sleep 1
   done
   echo "Exiting..."
   exit 1
   EOF
   ENTRYPOINT /start.sh
   ```
@y
   ```dockerfile
   FROM busybox:latest
   COPY --chmod=755 <<"EOF" /start.sh
   echo "Starting..."
   for i in $(seq 1 5); do
     echo "$i"
     sleep 1
   done
   echo "Exiting..."
   exit 1
   EOF
   ENTRYPOINT /start.sh
   ```
@z

@x
2. Build an image from the Dockerfile.
@y
2. Build an image from the Dockerfile.
@z

@x
   ```console
   $ docker build -t startstop .
   ```
@y
   ```console
   $ docker build -t startstop .
   ```
@z

@x
3. Run a container from the image, specifying `always` for its restart policy.
@y
3. Run a container from the image, specifying `always` for its restart policy.
@z

@x
   The container prints the numbers 1..5 to stdout, and then exits. This causes
   the attached CLI to exit as well.
@y
   The container prints the numbers 1..5 to stdout, and then exits. This causes
   the attached CLI to exit as well.
@z

@x
   ```console
   $ docker run --restart always startstop
   Starting...
   1
   2
   3
   4
   5
   Exiting...
   $
   ```
@y
   ```console
   $ docker run --restart always startstop
   Starting...
   1
   2
   3
   4
   5
   Exiting...
   $
   ```
@z

@x
4. Running `docker ps` shows that is still running or restarting, thanks to the
   restart policy. The CLI session has already exited, however. It doesn't
   survive the initial container exit.
@y
4. Running `docker ps` shows that is still running or restarting, thanks to the
   restart policy. The CLI session has already exited, however. It doesn't
   survive the initial container exit.
@z

@x
   ```console
   $ docker ps
   CONTAINER ID   IMAGE       COMMAND                  CREATED         STATUS         PORTS     NAMES
   081991b35afe   startstop   "/bin/sh -c /start.sh"   9 seconds ago   Up 4 seconds             gallant_easley
   ```
@y
   ```console
   $ docker ps
   CONTAINER ID   IMAGE       COMMAND                  CREATED         STATUS         PORTS     NAMES
   081991b35afe   startstop   "/bin/sh -c /start.sh"   9 seconds ago   Up 4 seconds             gallant_easley
   ```
@z

@x
5. You can re-attach your terminal to the container between restarts, using the
   `docker container attach` command. It's detached again the next time the
   container exits.
@y
5. You can re-attach your terminal to the container between restarts, using the
   `docker container attach` command. It's detached again the next time the
   container exits.
@z

@x
   ```console
   $ docker container attach 081991b35afe
   4
   5
   Exiting...
   $
   ```
@y
   ```console
   $ docker container attach 081991b35afe
   4
   5
   Exiting...
   $
   ```
@z

@x
## Use a process manager
@y
## Use a process manager
@z

@x
If restart policies don't suit your needs, such as when processes outside
Docker depend on Docker containers, you can use a process manager such as
[systemd](https://systemd.io/) or
[supervisor](http://supervisord.org/) instead.
@y
If restart policies don't suit your needs, such as when processes outside
Docker depend on Docker containers, you can use a process manager such as
[systemd](https://systemd.io/) or
[supervisor](http://supervisord.org/) instead.
@z

@x
> [!WARNING]
>
> Don't combine Docker restart policies with host-level process managers,
> as this creates conflicts.
@y
> [!WARNING]
>
> Don't combine Docker restart policies with host-level process managers,
> as this creates conflicts.
@z

@x
To use a process manager, configure it to start your container or service using
the same `docker start` or `docker service` command you would normally use to
start the container manually. Consult the documentation for the specific
process manager for more details.
@y
To use a process manager, configure it to start your container or service using
the same `docker start` or `docker service` command you would normally use to
start the container manually. Consult the documentation for the specific
process manager for more details.
@z

@x
### Using a process manager inside containers
@y
### Using a process manager inside containers
@z

@x
Process managers can also run within the container to check whether a process is
running and starts/restart it if not.
@y
Process managers can also run within the container to check whether a process is
running and starts/restart it if not.
@z

@x
> [!WARNING]
>
> These aren't Docker-aware, and only monitor operating system processes within
> the container. Docker doesn't recommend this approach, because it's
> platform-dependent and may differ between versions of a given Linux
> distribution.
@y
> [!WARNING]
>
> These aren't Docker-aware, and only monitor operating system processes within
> the container. Docker doesn't recommend this approach, because it's
> platform-dependent and may differ between versions of a given Linux
> distribution.
@z
