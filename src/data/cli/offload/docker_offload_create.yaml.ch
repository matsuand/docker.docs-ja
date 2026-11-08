%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker offload create
short: Create a Docker Offload cloud sandbox
long: |-
  Create a Docker Offload cloud sandbox.
@y
command: docker offload create
short: Create a Docker Offload cloud sandbox
long: |-
  Create a Docker Offload cloud sandbox.
@z

@x
  This command is available when **Enable Docker Offload** is turned off in
  Docker Desktop settings, or doesn't appear. If the setting is on, you'll be asked to 
  switch it off before continuing.
@y
  This command is available when **Enable Docker Offload** is turned off in
  Docker Desktop settings, or doesn't appear. If the setting is on, you'll be asked to 
  switch it off before continuing.
@z

@x
  If a sandbox already exists for your account, `create` connects to it instead
  of creating a second one, and resumes it if it's paused.
@y
  If a sandbox already exists for your account, `create` connects to it instead
  of creating a second one, and resumes it if it's paused.
@z

@x
  A sandbox pauses once it has been idle for its idle timeout, which is 5m
  unless you set it: nothing working inside it, and no command, build or pull
  in flight. Pausing keeps its containers, and a docker command that needs the
  sandbox, such as `run`, `start` or `attach`, resumes it. Attached sessions
  are cut off by a pause; reattach with `docker attach`. Exec sessions have to
  be started again.
@y
  A sandbox pauses once it has been idle for its idle timeout, which is 5m
  unless you set it: nothing working inside it, and no command, build or pull
  in flight. Pausing keeps its containers, and a docker command that needs the
  sandbox, such as `run`, `start` or `attach`, resumes it. Attached sessions
  are cut off by a pause; reattach with `docker attach`. Exec sessions have to
  be started again.
@z

@x
  Set the idle timeout with `--idle-timeout`, at least 1m, or turn pausing off
  with `--keep-alive`. Either applies at once to a sandbox that's already
  running, and is kept for that sandbox on this machine; a new sandbox starts
  from 5m. A kept-alive sandbox runs until you stop it, but still pauses if
  this machine sleeps past its `--ttl`, and after 24h.
@y
  Set the idle timeout with `--idle-timeout`, at least 1m, or turn pausing off
  with `--keep-alive`. Either applies at once to a sandbox that's already
  running, and is kept for that sandbox on this machine; a new sandbox starts
  from 5m. A kept-alive sandbox runs until you stop it, but still pauses if
  this machine sleeps past its `--ttl`, and after 24h.
@z

@x
  `--cpus`, `--memory` and `--ttl` apply only when a sandbox is created. If a
  sandbox is already running, they aren't applied and `create` tells you so.
  To resize, create again with `--recreate`, which deletes the sandbox and
  everything on it.
@y
  `--cpus`, `--memory` and `--ttl` apply only when a sandbox is created. If a
  sandbox is already running, they aren't applied and `create` tells you so.
  To resize, create again with `--recreate`, which deletes the sandbox and
  everything on it.
@z

@x
usage: docker offload create [OPTIONS]
@y
usage: docker offload create [OPTIONS]
@z

% options:

@x account
    description: The Docker account to use
@y
    description: The Docker account to use
@z

@x cpus
    description: 'The number of CPUs for a new sandbox: 1, 2, 4, 8 or 16'
@y
    description: 'The number of CPUs for a new sandbox: 1, 2, 4, 8 or 16'
@z

@x idle-timeout
    description: |
      How long the sandbox may be idle before it pauses, as a duration like 30m (default 5m, minimum 1m, 0 is --keep-alive)
@y
    description: |
      How long the sandbox may be idle before it pauses, as a duration like 30m (default 5m, minimum 1m, 0 is --keep-alive)
@z

@x keep-alive
    description: Never pause the sandbox for being idle
@y
    description: Never pause the sandbox for being idle
@z

@x memory
    description: Memory for a new sandbox, as a size like 16g
@y
    description: Memory for a new sandbox, as a size like 16g
@z

@x recreate
    description: |
      Recreate the sandbox if it is a different size than asked for. Deletes the old sandbox and everything on it.
@y
    description: |
      Recreate the sandbox if it is a different size than asked for. Deletes the old sandbox and everything on it.
@z

@x timeout
    description: How long to wait for the sandbox to be ready
@y
    description: How long to wait for the sandbox to be ready
@z

@x ttl
    description: |
      How long the sandbox keeps running after the daemon stops renewing it, for example if this machine sleeps or goes offline, as a duration like 4h
@y
    description: |
      How long the sandbox keeps running after the daemon stops renewing it, for example if this machine sleeps or goes offline, as a duration like 4h
@z

@x
examples: |-
  ### Create a sandbox and connect to it
@y
examples: |-
  ### Create a sandbox and connect to it
@z

@x
  ```console
  $ docker offload create
  ```
@y
  ```console
  $ docker offload create
  ```
@z

@x
  ### Create a sandbox with a chosen size and lifetime
@y
  ### Create a sandbox with a chosen size and lifetime
@z

@x
  ```console
  $ docker offload create --cpus 8 --memory 16g --ttl 4h
  ```
@y
  ```console
  $ docker offload create --cpus 8 --memory 16g --ttl 4h
  ```
@z

@x
  ### Change the idle timeout
@y
  ### Change the idle timeout
@z

@x
  Applies at once to a sandbox that's already running:
@y
  Applies at once to a sandbox that's already running:
@z

@x
  ```console
  $ docker offload create --idle-timeout 30m
  ```
@y
  ```console
  $ docker offload create --idle-timeout 30m
  ```
@z

@x
  ### Keep a sandbox awake
@y
  ### Keep a sandbox awake
@z

@x
  The sandbox runs, and bills, until you stop it:
@y
  The sandbox runs, and bills, until you stop it:
@z

@x
  ```console
  $ docker offload create --keep-alive
  ```
@y
  ```console
  $ docker offload create --keep-alive
  ```
@z
