%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker offload stop
short: Stop a Docker Offload session
long: |-
  Stop a Docker Offload session.
@y
command: docker offload stop
short: Stop a Docker Offload session
long: |-
  Stop a Docker Offload session.
@z

@x
  What stopping does, and which options apply, depends on which version of
  Docker Offload your commands use. That's set by **Enable Docker Offload** in
  Docker Desktop settings.
@y
  What stopping does, and which options apply, depends on which version of
  Docker Offload your commands use. That's set by **Enable Docker Offload** in
  Docker Desktop settings.
@z

@x
  When the setting is off, or doesn't appear, you use the current version of
  Docker Offload. Stopping pauses the sandbox and the next `docker offload
  create` resumes it. Every machine on the account uses the same sandbox, so a
  stop pauses it for all of them. To delete the sandbox instead, use `docker
  offload rm`. The `--terminate` option isn't available.
@y
  When the setting is off, or doesn't appear, you use the current version of
  Docker Offload. Stopping pauses the sandbox and the next `docker offload
  create` resumes it. Every machine on the account uses the same sandbox, so a
  stop pauses it for all of them. To delete the sandbox instead, use `docker
  offload rm`. The `--terminate` option isn't available.
@z

@x
  When the setting is on, you use Docker Offload v1. Stopping ends the session,
  and the cloud environment and everything in it is removed.
@y
  When the setting is on, you use Docker Offload v1. Stopping ends the session,
  and the cloud environment and everything in it is removed.
@z

@x
usage: docker offload stop [OPTIONS]
@y
usage: docker offload stop [OPTIONS]
@z

% options:

@x terminate
    description: Terminate the remote lease. Docker Offload v1 only
@y
    description: Terminate the remote lease. Docker Offload v1 only
@z
