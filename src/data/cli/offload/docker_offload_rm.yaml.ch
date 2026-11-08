%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker offload rm
short: Remove the Docker Offload cloud sandbox
long: |-
  The cloud sandbox is deleted with everything in it, running or paused. Every
  machine on the account uses the same sandbox, so `rm` deletes it for all of
  them. To keep the sandbox for later, use `docker offload stop` instead.
@y
command: docker offload rm
short: Remove the Docker Offload cloud sandbox
long: |-
  The cloud sandbox is deleted with everything in it, running or paused. Every
  machine on the account uses the same sandbox, so `rm` deletes it for all of
  them. To keep the sandbox for later, use `docker offload stop` instead.
@z

@x
usage: docker offload rm [OPTIONS]
@y
usage: docker offload rm [OPTIONS]
@z

% options:

@x account
    description: The Docker account the sandbox is under
@y
    description: The Docker account the sandbox is under
@z

@x force
    description: Remove without asking for confirmation
@y
    description: Remove without asking for confirmation
@z

@x
examples: |-
  ### Remove the sandbox
@y
examples: |-
  ### Remove the sandbox
@z

@x
  Asks for confirmation first:
@y
  Asks for confirmation first:
@z

@x
  ```console
  $ docker offload rm
  ```
@y
  ```console
  $ docker offload rm
  ```
@z

@x
  ### Remove the sandbox without confirmation
@y
  ### Remove the sandbox without confirmation
@z

@x
  ```console
  $ docker offload rm --force
  ```
@y
  ```console
  $ docker offload rm --force
  ```
@z
