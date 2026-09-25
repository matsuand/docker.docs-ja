%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx
synopsis: Manage AI coding agent sandboxes.
description: |-
    Docker Sandboxes creates isolated sandbox environments for AI agents, powered by Docker.
@y
name: sbx
synopsis: Manage AI coding agent sandboxes.
description: |-
    Docker Sandboxes creates isolated sandbox environments for AI agents, powered by Docker.
@z

@x
    Run without a command to launch interactive mode, or pass a command for CLI usage.
@y
    Run without a command to launch interactive mode, or pass a command for CLI usage.
@z

@x
usage: sbx COMMAND
@y
usage: sbx COMMAND
@z

%options:

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

@x help
      usage: help for sbx
@y
      usage: help for sbx
@z

%see_also:

@x
    - sbx attach - Attach to a cloud sandbox, starting it first if it is stopped
    - sbx completion - Generate the autocompletion script for the specified shell
    - sbx cp - Copy files or directories between a sandbox and the host
    - sbx create - Create a sandbox for an agent
    - sbx daemon - Manage sandboxd daemon
    - sbx diagnose - Diagnose common issues with your sbx installation
    - sbx env - (Experimental) Manage sandboxes declaratively from an sbxenv.yaml file
    - sbx exec - Execute a command inside a sandbox
    - sbx kit - (Experimental) Manage kit artifacts
    - sbx login - Sign in to Docker
    - sbx logout - Stop running local sandboxes and sign out of Docker
    - sbx ls - List sandboxes
    - sbx mcp - Manage MCP servers
    - sbx move - Move a sandbox between local and cloud
    - sbx policy - Manage sandbox policies
    - sbx ports - Manage sandbox port publishing
    - sbx prune - Remove all stopped sandboxes
    - sbx reset - Reset all sandboxes and clean up state
    - sbx rm - Remove one or more sandboxes
    - sbx run - Run an agent in a sandbox
    - sbx secret - Manage stored secrets
    - sbx settings - Manage Docker Sandboxes settings
    - sbx setup - (Experimental) Detect host configuration and prepare Docker Sandboxes
    - sbx skills - (Experimental) Manage skills available in sandboxes
    - sbx stop - Stop one or more sandboxes without removing them
    - sbx template - Manage sandbox templates
    - sbx ttl - Inspect or extend a cloud sandbox's TTL
    - sbx tui - Open the interactive TUI dashboard
    - sbx version - Show Docker Sandboxes version information
    - sbx volume - Manage persistent volumes (cloud-only)
@y
    - sbx attach - Attach to a cloud sandbox, starting it first if it is stopped
    - sbx completion - Generate the autocompletion script for the specified shell
    - sbx cp - Copy files or directories between a sandbox and the host
    - sbx create - Create a sandbox for an agent
    - sbx daemon - Manage sandboxd daemon
    - sbx diagnose - Diagnose common issues with your sbx installation
    - sbx env - (Experimental) Manage sandboxes declaratively from an sbxenv.yaml file
    - sbx exec - Execute a command inside a sandbox
    - sbx kit - (Experimental) Manage kit artifacts
    - sbx login - Sign in to Docker
    - sbx logout - Stop running local sandboxes and sign out of Docker
    - sbx ls - List sandboxes
    - sbx mcp - Manage MCP servers
    - sbx move - Move a sandbox between local and cloud
    - sbx policy - Manage sandbox policies
    - sbx ports - Manage sandbox port publishing
    - sbx prune - Remove all stopped sandboxes
    - sbx reset - Reset all sandboxes and clean up state
    - sbx rm - Remove one or more sandboxes
    - sbx run - Run an agent in a sandbox
    - sbx secret - Manage stored secrets
    - sbx settings - Manage Docker Sandboxes settings
    - sbx setup - (Experimental) Detect host configuration and prepare Docker Sandboxes
    - sbx skills - (Experimental) Manage skills available in sandboxes
    - sbx stop - Stop one or more sandboxes without removing them
    - sbx template - Manage sandbox templates
    - sbx ttl - Inspect or extend a cloud sandbox's TTL
    - sbx tui - Open the interactive TUI dashboard
    - sbx version - Show Docker Sandboxes version information
    - sbx volume - Manage persistent volumes (cloud-only)
@z
