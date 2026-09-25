%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx move
synopsis: Move a sandbox between local and cloud
description: |-
    Move a sandbox between the local host and Docker's hosted Sandboxes service.
@y
name: sbx move
synopsis: Move a sandbox between local and cloud
description: |-
    Move a sandbox between the local host and Docker's hosted Sandboxes service.
@z

@x
    Move captures the sandbox's filesystem as a container image and starts a new
    sandbox from it on the destination. Running processes and in-memory state do
    not travel. The destination sandbox gets a new ID; name it with --name.
@y
    Move captures the sandbox's filesystem as a container image and starts a new
    sandbox from it on the destination. Running processes and in-memory state do
    not travel. The destination sandbox gets a new ID; name it with --name.
@z

@x
    Neither direction deletes the source. Moving to cloud stops the local
    sandbox; restart it with 'sbx run --name <name>'. Moving to local asks the
    cloud source to stop; a refused or unconfirmed stop warns without failing
    the move, and the stop may still be finishing when the move returns.
    'sbx --cloud ls' shows it. A cloud sandbox with no agent is left running.
    A stopped cloud source keeps its ID and state: 'sbx --cloud run <id>'
    resumes it, 'sbx --cloud rm <id>' deletes it.
@y
    Neither direction deletes the source. Moving to cloud stops the local
    sandbox; restart it with 'sbx run --name <name>'. Moving to local asks the
    cloud source to stop; a refused or unconfirmed stop warns without failing
    the move, and the stop may still be finishing when the move returns.
    'sbx --cloud ls' shows it. A cloud sandbox with no agent is left running.
    A stopped cloud source keeps its ID and state: 'sbx --cloud run <id>'
    resumes it, 'sbx --cloud rm <id>' deletes it.
@z

@x
    A failed or cancelled move restores what it can. It restarts a local source
    that was running and removes the transfer templates it created. The restart
    re-runs the entrypoint; processes you started by hand are not revived. If a
    cleanup step fails, the output names what is left and the command that
    recovers it.
@y
    A failed or cancelled move restores what it can. It restarts a local source
    that was running and removes the transfer templates it created. The restart
    re-runs the entrypoint; processes you started by hand are not revived. If a
    cleanup step fails, the output names what is left and the command that
    recovers it.
@z

@x
    What does not travel:
      - The workspace bind mount and other host mounts. Files moved to local
        stay inside the sandbox at the image's working directory; copy them out
        with 'sbx cp'.
      - Secrets managed by sbx. The destination picks its own secrets, so
        you may need to sign in again. Credentials saved in copied files
        still travel.
      - Volumes and environment variables attached to a cloud sandbox, when
        moving to local. A local sandbox's environment is part of its image
        and travels to the cloud.
      - Network policies. Moving to cloud uses cloud policies; moving to local
        starts with the host's default policy. Active local L7 (HTTP) rules
        prompt before a move to cloud; --force skips the prompt but keeps
        the warning.
      - Cloud URLs and host port bindings. Moving to cloud republishes TCP
        ports under new cloud URLs; a port the cloud refuses is skipped with a
        warning. Moving to local saves the published TCP ports and binds them
        on loopback while the sandbox runs. Host ports can change on restart;
        'sbx ports SANDBOX' shows them. A cloud port published with an
        explicit host binding stops a move to local.
@y
    What does not travel:
      - The workspace bind mount and other host mounts. Files moved to local
        stay inside the sandbox at the image's working directory; copy them out
        with 'sbx cp'.
      - Secrets managed by sbx. The destination picks its own secrets, so
        you may need to sign in again. Credentials saved in copied files
        still travel.
      - Volumes and environment variables attached to a cloud sandbox, when
        moving to local. A local sandbox's environment is part of its image
        and travels to the cloud.
      - Network policies. Moving to cloud uses cloud policies; moving to local
        starts with the host's default policy. Active local L7 (HTTP) rules
        prompt before a move to cloud; --force skips the prompt but keeps
        the warning.
      - Cloud URLs and host port bindings. Moving to cloud republishes TCP
        ports under new cloud URLs; a port the cloud refuses is skipped with a
        warning. Moving to local saves the published TCP ports and binds them
        on loopback while the sandbox runs. Host ports can change on restart;
        'sbx ports SANDBOX' shows them. A cloud port published with an
        explicit host binding stops a move to local.
@z

@x
    Sizing and disk:
      - Moving to cloud rounds recorded CPU and memory limits up to a cloud
        shape. Missing limits use cloud defaults with a warning. Limits above
        the largest shape stop the move before anything is captured. Moving to
        local uses local defaults.
      - Moving to local stages downloaded layers in the host's temporary
        directory. Reusing local layers can take up to 32 GiB in addition to
        the local runtime's image storage. If reuse fails, the layers are
        downloaded. If staging runs out of space, the move falls back to the
        export stream.
@y
    Sizing and disk:
      - Moving to cloud rounds recorded CPU and memory limits up to a cloud
        shape. Missing limits use cloud defaults with a warning. Limits above
        the largest shape stop the move before anything is captured. Moving to
        local uses local defaults.
      - Moving to local stages downloaded layers in the host's temporary
        directory. Reusing local layers can take up to 32 GiB in addition to
        the local runtime's image storage. If reuse fails, the layers are
        downloaded. If staging runs out of space, the move falls back to the
        export stream.
@z

@x
    The cloud sandbox a move creates expires. The default is the server's TTL,
    typically 1h: stopped in place on expiry when the account and sandbox
    support it, deleted otherwise. Choose with --ttl and --on-timeout.
    Extend later with 'sbx --cloud ttl'.
@y
    The cloud sandbox a move creates expires. The default is the server's TTL,
    typically 1h: stopped in place on expiry when the account and sandbox
    support it, deleted otherwise. Choose with --ttl and --on-timeout.
    Extend later with 'sbx --cloud ttl'.
@z

@x
usage: sbx move SANDBOX [flags]
@y
usage: sbx move SANDBOX [flags]
@z

% options:

@x force
      usage: Skip the move confirmation prompt
@y
      usage: Skip the move confirmation prompt
@z

@x help
      usage: help for move
@y
      usage: help for move
@z

@x name
      usage: |
        Name for the destination sandbox (default: 'moved-' + the source name; a cloud destination always adds a short unique suffix, a local one only when that name is already taken)
@y
      usage: |
        Name for the destination sandbox (default: 'moved-' + the source name; a cloud destination always adds a short unique suffix, a local one only when that name is already taken)
@z

@x on-timeout
      usage: |
        What happens to the destination cloud sandbox when its TTL lapses: 'stop' stops it in place so it can be started again later, or 'delete' removes it. Not every sandbox supports 'stop', and an explicit request the server refuses fails the move. Default: stop when the sandbox supports it, else the server default (delete). Only with --to cloud
@y
      usage: |
        What happens to the destination cloud sandbox when its TTL lapses: 'stop' stops it in place so it can be started again later, or 'delete' removes it. Not every sandbox supports 'stop', and an explicit request the server refuses fails the move. Default: stop when the sandbox supports it, else the server default (delete). Only with --to cloud
@z

@x to
      usage: |
        Destination of the move: 'local' (cloud to local) or 'cloud' (local to cloud)
@y
      usage: |
        Destination of the move: 'local' (cloud to local) or 'cloud' (local to cloud)
@z

@x ttl
      usage: |
        Time-to-live for the destination cloud sandbox (15s to 24h, e.g. 30m, 2h; only with --to cloud; default: server-side)
@y
      usage: |
        Time-to-live for the destination cloud sandbox (15s to 24h, e.g. 30m, 2h; only with --to cloud; default: server-side)
@z

% inherited_options:

@x cloud
      usage: |
        Dispatch to Docker Cloud Sandboxes API instead of local sandboxd (supported by a growing set of verbs — run 'sbx --cloud --help' for the current list)
@y
      usage: |
        Dispatch to Docker Cloud Sandboxes API instead of local sandboxd (supported by a growing set of verbs — run 'sbx --cloud --help' for the current list)
@z

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

@x
example: |4-
      # Move a cloud sandbox down to the local host
      sbx move sbx_abc123 --to local
@y
example: |4-
      # Move a cloud sandbox down to the local host
      sbx move sbx_abc123 --to local
@z

@x
      # Move a local sandbox up to the cloud
      sbx move my-sandbox --to cloud
@y
      # Move a local sandbox up to the cloud
      sbx move my-sandbox --to cloud
@z

@x
      # Give the destination sandbox a custom name
      sbx move sbx_abc123 --to local --name big-refactor
@y
      # Give the destination sandbox a custom name
      sbx move sbx_abc123 --to local --name big-refactor
@z

% see_also:

@x
    - sbx - Manage AI coding agent sandboxes.
@y
    - sbx - Manage AI coding agent sandboxes.
@z
