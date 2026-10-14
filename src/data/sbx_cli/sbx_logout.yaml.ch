%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx logout
synopsis: Stop running local sandboxes and sign out of Docker
usage: sbx logout [flags]
@y
name: sbx logout
synopsis: Stop running local sandboxes and sign out of Docker
usage: sbx logout [flags]
@z

% options:

@x force
      usage: Skip confirmation prompt
@y
      usage: Skip confirmation prompt
@z

@x help
      usage: help for logout
@y
      usage: help for logout
@z

% inherited_options:

@x
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

@x
example: |4-
      sbx logout
@y
example: |4-
      sbx logout
@z

@x
      # Skip the confirmation prompt
      sbx logout --force
@y
      # Skip the confirmation prompt
      sbx logout --force
@z

% see_also:

@x
    - sbx - Manage AI coding agent sandboxes.
@y
    - sbx - Manage AI coding agent sandboxes.
@z
