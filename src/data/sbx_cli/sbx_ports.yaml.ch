%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx ports
synopsis: Manage sandbox port publishing
description: |-
    Manage sandbox port publishing.
@y
name: sbx ports
synopsis: Manage sandbox port publishing
description: |-
    Manage sandbox port publishing.
@z

@x
    List, publish, or unpublish ports for a running sandbox. Without --publish or
    --unpublish flags, lists all published ports.
@y
    List, publish, or unpublish ports for a running sandbox. Without --publish or
    --unpublish flags, lists all published ports.
@z

@x
    Port spec format: [[HOST_IP:]HOST_PORT:]SANDBOX_PORT[/PROTOCOL]
    If HOST_PORT is omitted, an ephemeral port is allocated automatically.
    If HOST_IP is omitted, the port is bound on loopback, expanded based on
    PROTOCOL and the sandbox's address families: tcp/udp binds both 127.0.0.1
    and ::1 (or only 127.0.0.1 if the sandbox is IPv4-only); tcp4/udp4 binds
    only 127.0.0.1; tcp6/udp6 binds only ::1. PROTOCOL defaults to tcp.
    Supported protocols: tcp, tcp4, tcp6, udp, udp4, udp6.
@y
    Port spec format: [[HOST_IP:]HOST_PORT:]SANDBOX_PORT[/PROTOCOL]
    If HOST_PORT is omitted, an ephemeral port is allocated automatically.
    If HOST_IP is omitted, the port is bound on loopback, expanded based on
    PROTOCOL and the sandbox's address families: tcp/udp binds both 127.0.0.1
    and ::1 (or only 127.0.0.1 if the sandbox is IPv4-only); tcp4/udp4 binds
    only 127.0.0.1; tcp6/udp6 binds only ::1. PROTOCOL defaults to tcp.
    Supported protocols: tcp, tcp4, tcp6, udp, udp4, udp6.
@z

@x
usage: sbx ports SANDBOX [flags]
@y
usage: sbx ports SANDBOX [flags]
@z

% options:

@x help
      usage: help for ports
@y
      usage: help for ports
@z

@x json
      usage: Output in JSON format (for port listing)
@y
      usage: Output in JSON format (for port listing)
@z

@x publish
      usage: |
        Publish a port (can be repeated): [[HOST_IP:]HOST_PORT:]SANDBOX_PORT[/PROTOCOL]
@y
      usage: |
        Publish a port (can be repeated): [[HOST_IP:]HOST_PORT:]SANDBOX_PORT[/PROTOCOL]
@z

@x unpublish
      usage: |
        Unpublish a port (can be repeated): [HOST_IP:]HOST_PORT:SANDBOX_PORT[/PROTOCOL]
@y
      usage: |
        Unpublish a port (can be repeated): [HOST_IP:]HOST_PORT:SANDBOX_PORT[/PROTOCOL]
@z

% inherited_options:

@x
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

@x
example: |4-
      # List published ports
      sbx ports my-sandbox
@y
example: |4-
      # List published ports
      sbx ports my-sandbox
@z

@x
      # Publish sandbox port 8080 to an ephemeral host port
      sbx ports my-sandbox --publish 8080
@y
      # Publish sandbox port 8080 to an ephemeral host port
      sbx ports my-sandbox --publish 8080
@z

@x
      # Publish with a specific host port
      sbx ports my-sandbox --publish 3000:8080
@y
      # Publish with a specific host port
      sbx ports my-sandbox --publish 3000:8080
@z

@x
      # Unpublish a port
      sbx ports my-sandbox --unpublish 3000:8080
@y
      # Unpublish a port
      sbx ports my-sandbox --unpublish 3000:8080
@z

% see_also:

@x
    - sbx - Manage AI coding agent sandboxes.
@y
    - sbx - Manage AI coding agent sandboxes.
@z
