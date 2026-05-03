%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx cp
synopsis: Copy files or directories between a sandbox and the host
description: |-
    Either SRC or DST must be a sandbox path, written as SANDBOX:PATH.
    The other must be a local path. Copying between two sandboxes is not supported.
@y
name: sbx cp
synopsis: Copy files or directories between a sandbox and the host
description: |-
    Either SRC or DST must be a sandbox path, written as SANDBOX:PATH.
    The other must be a local path. Copying between two sandboxes is not supported.
@z

@x
    When copying a directory, the directory itself is placed at the destination.
    If the destination path does not exist it is created; if it already exists
    as a directory, the source is placed inside it.
@y
    When copying a directory, the directory itself is placed at the destination.
    If the destination path does not exist it is created; if it already exists
    as a directory, the source is placed inside it.
@z

@x
usage: sbx cp [flags] SRC DST
@y
usage: sbx cp [flags] SRC DST
@z

%options:

@x follow-link
      usage: |
        Follow symbolic links in the source path when copying from host to sandbox
@y
      usage: |
        Follow symbolic links in the source path when copying from host to sandbox
@z

@x help
      usage: help for cp
@y
      usage: help for cp
@z

%inherited_options:

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

@x
example: |4-
      # Copy a file from host to sandbox
      sbx cp ./config.json my-sandbox:/home/user/
@y
example: |4-
      # Copy a file from host to sandbox
      sbx cp ./config.json my-sandbox:/home/user/
@z

@x
      # Copy a file from sandbox to host
      sbx cp my-sandbox:/home/user/output.log ./
@y
      # Copy a file from sandbox to host
      sbx cp my-sandbox:/home/user/output.log ./
@z

@x
      # Copy a directory
      sbx cp ./src/ my-sandbox:/home/user/src
@y
      # Copy a directory
      sbx cp ./src/ my-sandbox:/home/user/src
@z

%see_also:

@x
    - sbx - Manage AI coding agent sandboxes.
@y
    - sbx - Manage AI coding agent sandboxes.
@z
