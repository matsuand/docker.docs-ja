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
    HOST_IP defaults to 127.0.0.1, PROTOCOL defaults to tcp.
    Supported protocols: tcp, tcp4, tcp6, udp, udp4, udp6.
usage: sbx ports SANDBOX [flags]
options:
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for ports
    - name: json
      default_value: "false"
      usage: Output in JSON format (for port listing)
    - name: publish
      default_value: '[]'
      usage: |
        Publish a port (can be repeated): [[HOST_IP:]HOST_PORT:]SANDBOX_PORT[/PROTOCOL]
    - name: unpublish
      default_value: '[]'
      usage: |
        Unpublish a port (can be repeated): [HOST_IP:]HOST_PORT:SANDBOX_PORT[/PROTOCOL]
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
example: |4-
      # List published ports
      sbx ports my-sandbox
@y
    Port spec format: [[HOST_IP:]HOST_PORT:]SANDBOX_PORT[/PROTOCOL]
    If HOST_PORT is omitted, an ephemeral port is allocated automatically.
    HOST_IP defaults to 127.0.0.1, PROTOCOL defaults to tcp.
    Supported protocols: tcp, tcp4, tcp6, udp, udp4, udp6.
usage: sbx ports SANDBOX [flags]
options:
    - name: help
      shorthand: h
      default_value: "false"
      usage: help for ports
    - name: json
      default_value: "false"
      usage: Output in JSON format (for port listing)
    - name: publish
      default_value: '[]'
      usage: |
        Publish a port (can be repeated): [[HOST_IP:]HOST_PORT:]SANDBOX_PORT[/PROTOCOL]
    - name: unpublish
      default_value: '[]'
      usage: |
        Unpublish a port (can be repeated): [HOST_IP:]HOST_PORT:SANDBOX_PORT[/PROTOCOL]
inherited_options:
    - name: debug
      shorthand: D
      default_value: "false"
      usage: Enable debug logging
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
see_also:
    - sbx - Manage AI coding agent sandboxes.
@y
      # Unpublish a port
      sbx ports my-sandbox --unpublish 3000:8080
see_also:
    - sbx - Manage AI coding agent sandboxes.
@z
