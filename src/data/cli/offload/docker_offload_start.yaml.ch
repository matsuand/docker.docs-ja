%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker offload start
short: Start a Docker Offload v1 session
long: |-
  Start a Docker Offload v1 session.

  This command belongs to Docker Offload v1, and works when **Enable Docker
  Offload** is turned on in Docker Desktop settings. If the setting is off, or
  doesn't appear, your Docker commands use the current version of Docker
  Offload, which uses `docker offload create` instead.
usage: docker offload start
@y
command: docker offload start
short: Start a Docker Offload v1 session
long: |-
  Start a Docker Offload v1 session.

  This command belongs to Docker Offload v1, and works when **Enable Docker
  Offload** is turned on in Docker Desktop settings. If the setting is off, or
  doesn't appear, your Docker commands use the current version of Docker
  Offload, which uses `docker offload create` instead.
usage: docker offload start
@z

% options:

@x account
    description: The Docker account to use
@y
    description: 利用する Docker アカウント。
@z

@x timeout
    description: How long to wait for the engine to be ready
@y
    description: How long to wait for the engine to be ready
@z

% snip directives...
