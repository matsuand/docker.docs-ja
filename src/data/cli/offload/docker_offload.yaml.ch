%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
command: docker offload
short: Control Docker Offload from the CLI
long: |-
  Control Docker Offload from the CLI.
@y
command: docker offload
short: Control Docker Offload from the CLI
long: |-
  Control Docker Offload from the CLI.
@z

@x
  There are two versions of Docker Offload, and some commands belong to only
  one of them.
@y
  There are two versions of Docker Offload, and some commands belong to only
  one of them.
@z

@x
  | Command | Docker Offload | Docker Offload v1 |
  | --- | --- | --- |
  | `docker offload create` | Yes | No |
  | `docker offload rm` | Yes | No |
  | `docker offload start` | No | Yes |
  | `docker offload stop` | Yes | Yes |
  | `docker offload status` | Yes | Yes |
  | `docker offload diagnose` | No | Yes |
  | `docker offload version` | Yes | Yes |
@y
  | Command | Docker Offload | Docker Offload v1 |
  | --- | --- | --- |
  | `docker offload create` | Yes | No |
  | `docker offload rm` | Yes | No |
  | `docker offload start` | No | Yes |
  | `docker offload stop` | Yes | Yes |
  | `docker offload status` | Yes | Yes |
  | `docker offload diagnose` | No | Yes |
  | `docker offload version` | Yes | Yes |
@z

@x
  Running a command that belongs to the other version reports an error telling
  you which setting to change. For more information, see [Docker
  Offload](/manuals/offload/_index.md) and [Docker Offload
  v1](/manuals/offload/v1/_index.md).
@y
  Running a command that belongs to the other version reports an error telling
  you which setting to change. For more information, see [Docker
  Offload](manuals/offload/_index.md) and [Docker Offload
  v1](manuals/offload/v1/_index.md).
@z

@x
usage: docker offload
@y
usage: docker offload
@z
