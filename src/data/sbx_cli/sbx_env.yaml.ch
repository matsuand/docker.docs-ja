%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx env
synopsis: |
    Manage sandboxes declaratively from an sbxenv.yaml file
experimental: true
description: |-
    Manage a sandbox environment declared in an sbxenv.yaml file.
@y
name: sbx env
synopsis: |
    Manage sandboxes declaratively from an sbxenv.yaml file
experimental: true
description: |-
    Manage a sandbox environment declared in an sbxenv.yaml file.
@z

@x
    The file describes the agent, optional mixin kits, workspace mounts,
    environment variables, secrets to provision, and per-service credential
    bindings. Secrets are provisioned at the environment's sandbox scope so
    `sbx env rm` can remove everything it created.
@y
    The file describes the agent, optional mixin kits, workspace mounts,
    environment variables, secrets to provision, and per-service credential
    bindings. Secrets are provisioned at the environment's sandbox scope so
    `sbx env rm` can remove everything it created.
@z

@x
    A file may declare its own inputs in an `args:` block, each with a default or
    `required: true` and an optional description, enum, or pattern. Reference one
    as `${{ env.args.NAME }}` anywhere a value appears and supply it with
    `--env-arg NAME=VALUE`.
@y
    A file may declare its own inputs in an `args:` block, each with a default or
    `required: true` and an optional description, enum, or pattern. Reference one
    as `${{ env.args.NAME }}` anywhere a value appears and supply it with
    `--env-arg NAME=VALUE`.
@z

@x
    A `kits:` entry is either a bare reference or a mapping carrying the
    arguments that kit declares, which `--kit-arg` overrides per invocation:
@y
    A `kits:` entry is either a bare reference or a mapping carrying the
    arguments that kit declares, which `--kit-arg` overrides per invocation:
@z

@x
      kits:
        - ./mixins/base
        - source: ./mixins/tool
          args:
            version: ${{ env.args.channel }}
@y
      kits:
        - ./mixins/base
        - source: ./mixins/tool
          args:
            version: ${{ env.args.channel }}
@z

@x
    A kit source written as an explicit relative path — `./…`, `../…`, `.`, `..`, or one
    ending in `.zip` — is resolved against the directory of the file that declares
    it, so a checked-in file reaches the same kits from wherever `sbx` is run. Write a
    local kit that way: a bare `kits/tool` is as much a registry reference as a
    directory, so it is left as written and resolves from the current directory.
@y
    A kit source written as an explicit relative path — `./…`, `../…`, `.`, `..`, or one
    ending in `.zip` — is resolved against the directory of the file that declares
    it, so a checked-in file reaches the same kits from wherever `sbx` is run. Write a
    local kit that way: a bare `kits/tool` is as much a registry reference as a
    directory, so it is left as written and resolves from the current directory.
@z

@x
    A `workspace:` names the directory mounted read/write into the sandbox. A
    relative path resolves against the directory of the file that declares it — as
    a relative kit source does — so `workspace: .` mounts the directory the file
    sits in. ${{ env.projectDir }} names the project directory (the one holding the
    first PATH, or the current directory when none is named) and ${{ env.fileDir }}
    the declaring file's own, for a value that spells its anchor out. Declaring
    none mounts nothing — as omitting PATH does for `sbx create` — and the agent
    works in the container's own filesystem instead of on your files. Unless the file sets `name:` or --name overrides it,
    the sandbox is named after the mounted directory, or after the project directory
    when nothing is mounted, so an environment that mounts nothing is still the same
    sandbox every time.
@y
    A `workspace:` names the directory mounted read/write into the sandbox. A
    relative path resolves against the directory of the file that declares it — as
    a relative kit source does — so `workspace: .` mounts the directory the file
    sits in. ${{ env.projectDir }} names the project directory (the one holding the
    first PATH, or the current directory when none is named) and ${{ env.fileDir }}
    the declaring file's own, for a value that spells its anchor out. Declaring
    none mounts nothing — as omitting PATH does for `sbx create` — and the agent
    works in the container's own filesystem instead of on your files. Unless the file sets `name:` or --name overrides it,
    the sandbox is named after the mounted directory, or after the project directory
    when nothing is mounted, so an environment that mounts nothing is still the same
    sandbox every time.
@z

@x
    A `lifecycle:` block declares commands that run on the host — outside
    the sandbox, with your own privileges — around the sandbox's life:
@y
    A `lifecycle:` block declares commands that run on the host — outside
    the sandbox, with your own privileges — around the sandbox's life:
@z

@x
      lifecycle:
        initialize:
          - command: test -d app || git clone https://github.com/acme/app
        postCreate:
          - command: ./scripts/seed-fixtures.sh
        preRemove:
          - command: ./scripts/archive-state.sh
@y
      lifecycle:
        initialize:
          - command: test -d app || git clone https://github.com/acme/app
        postCreate:
          - command: ./scripts/seed-fixtures.sh
        preRemove:
          - command: ./scripts/archive-state.sh
@z

@x
    Each runs through your shell from the project directory — the one holding the
    first PATH, or the current directory when none is named; ${{ env.projectDir }}
    names the same place, and commands merged in from a file elsewhere share it.
    Change it per command with `workdir:`, and cap a command's runtime with
    `timeout:`.
@y
    Each runs through your shell from the project directory — the one holding the
    first PATH, or the current directory when none is named; ${{ env.projectDir }}
    names the same place, and commands merged in from a file elsewhere share it.
    Change it per command with `workdir:`, and cap a command's runtime with
    `timeout:`.
@z

@x
    "initialize" runs on every "create" and every "run", including one that only
    attaches, so it can produce the workspace the sandbox mounts; write it to be
    repeatable. "postCreate" runs once the sandbox exists, and "preRemove" after
    "sbx env rm" is confirmed but before it deletes anything. Whatever stops
    preRemove is only a warning, so a teardown that cannot run still cannot make an
    environment unremovable; what one adds to the environment instead — a stored
    credential, an approved domain — stops the removal, since what follows would
    delete it without a plan row ever naming it. "sbx env exec" runs no commands at
    all.
@y
    "initialize" runs on every "create" and every "run", including one that only
    attaches, so it can produce the workspace the sandbox mounts; write it to be
    repeatable. "postCreate" runs once the sandbox exists, and "preRemove" after
    "sbx env rm" is confirmed but before it deletes anything. Whatever stops
    preRemove is only a warning, so a teardown that cannot run still cannot make an
    environment unremovable; what one adds to the environment instead — a stored
    credential, an approved domain — stops the removal, since what follows would
    delete it without a plan row ever naming it. "sbx env exec" runs no commands at
    all.
@z

@x
    Commands appear in the environment plan with the directory each runs in, and are
    approved with it before the invocation does any work. An environment that declares
    any of them asks on every invocation, whether or not this one is what runs them,
    since approving a command also trusts whatever it invokes, including a script
    whose contents change after the answer. Use --skip-host-commands to run none of
    them.
@y
    Commands appear in the environment plan with the directory each runs in, and are
    approved with it before the invocation does any work. An environment that declares
    any of them asks on every invocation, whether or not this one is what runs them,
    since approving a command also trusts whatever it invokes, including a script
    whose contents change after the answer. Use --skip-host-commands to run none of
    them.
@z

@x
    Everything an environment sets up — host commands, credentials, bindings, MCP
    registrations, directories, published ports, the sandbox itself and the
    variables it runs with — is shown as a plan and approved before anything runs:
@y
    Everything an environment sets up — host commands, credentials, bindings, MCP
    registrations, directories, published ports, the sandbox itself and the
    variables it runs with — is shown as a plan and approved before anything runs:
@z

@x
      ── ENVIRONMENT PLAN
         claude-proj
@y
      ── ENVIRONMENT PLAN
         claude-proj
@z

@x
         secrets:
      +    anthropic:
      +      ref: op://vault/anthropic/key
      +      refresh: 55m
@y
         secrets:
      +    anthropic:
      +      ref: op://vault/anthropic/key
      +      refresh: 55m
@z

@x
         lifecycle:
           initialize:
      ~      - command: make setup -> make setup && make seed
               workdir: /Users/me/proj
@y
         lifecycle:
           initialize:
      ~      - command: make setup -> make setup && make seed
               workdir: /Users/me/proj
@z

@x
         Plan: + 1 to add, ~ 1 to change, - 0 to destroy.
@y
         Plan: + 1 to add, ~ 1 to change, - 0 to destroy.
@z

@x
         Approve this plan? [y/N]
@y
         Approve this plan? [y/N]
@z

@x
    The plan is your file: the same keys, nested the same way, in the order the
    blocks are declared in, so a line is looked up where it was written. What the
    plan adds is the margin, and the two values a line moves between. The totals
    name every symbol the margin can carry: "+ to add" and "~ to change" above,
    "- to destroy" for what "sbx env rm" takes away, "> to run" for a command that
    runs again — a command converges to nothing, so it runs on every apply that
    reaches it — and "! to forget" for a resource this environment applied and no
    longer declares. Where the file has nothing to
    say, a note in the margin does: that a resource is missing, or that the work
    waits for the next create, since a port, a credential, a kit or a postCreate
    command comes with the sandbox, so attaching to one that already exists leaves it
    for the next one that is built. A resource that is as it was, and already
    approved, is left out: what is on screen is what there is to read.
@y
    The plan is your file: the same keys, nested the same way, in the order the
    blocks are declared in, so a line is looked up where it was written. What the
    plan adds is the margin, and the two values a line moves between. The totals
    name every symbol the margin can carry: "+ to add" and "~ to change" above,
    "- to destroy" for what "sbx env rm" takes away, "> to run" for a command that
    runs again — a command converges to nothing, so it runs on every apply that
    reaches it — and "! to forget" for a resource this environment applied and no
    longer declares. Where the file has nothing to
    say, a note in the margin does: that a resource is missing, or that the work
    waits for the next create, since a port, a credential, a kit or a postCreate
    command comes with the sandbox, so attaching to one that already exists leaves it
    for the next one that is built. A resource that is as it was, and already
    approved, is left out: what is on screen is what there is to read.
@z

@x
    An attribute shows what the environment declares, so an edited kit argument or
    variable reads as what it was against what it becomes, and a "command:" or "ref:"
    secret shows where the credential comes from — a command that resolves one runs on
    this machine. A secret's literal "value:" is the one exception: a plan is both shown
    here and written to state, so it is named and stands in as a "sha256:" digest.
@y
    An attribute shows what the environment declares, so an edited kit argument or
    variable reads as what it was against what it becomes, and a "command:" or "ref:"
    secret shows where the credential comes from — a command that resolves one runs on
    this machine. A secret's literal "value:" is the one exception: a plan is both shown
    here and written to state, so it is named and stands in as a "sha256:" digest.
@z

@x
         kits:
      ~    - source: ./mixins/tool
      ~      args:
      ~        version: 1.2.3 -> 1.2.4
         env:
      ~    GOFLAGS: -mod=mod -> -mod=readonly
@y
         kits:
      ~    - source: ./mixins/tool
      ~      args:
      ~        version: 1.2.3 -> 1.2.4
         env:
      ~    GOFLAGS: -mod=mod -> -mod=readonly
@z

@x
    What an attribute was is what this environment last applied here, or — for one it
    approved and never applied, such as a binding or a port answered for while
    attaching to a sandbox that already exists — what was approved. Either way an
    edit shows the value the question is about, whatever the row itself does.
@y
    What an attribute was is what this environment last applied here, or — for one it
    approved and never applied, such as a binding or a port answered for while
    attaching to a sandbox that already exists — what was approved. Either way an
    edit shows the value the question is about, whatever the row itself does.
@z

@x
    An environment file that a mount would hand over read-write — which is what
    mounting the project directory holding it does — is bound read-only at its own
    path inside that mount, leaving the rest of it writable. The file decides what a
    later invocation runs on this machine, so an agent able to edit it decides what
    the next plan asks about. Declare "sandboxOptions.writableEnvFiles: true" where an
    agent is meant to edit it; the plan then says the file is writable, as it says
    when a file sits below a mount's own directory, where renaming that directory
    reaches it again.
@y
    An environment file that a mount would hand over read-write — which is what
    mounting the project directory holding it does — is bound read-only at its own
    path inside that mount, leaving the rest of it writable. The file decides what a
    later invocation runs on this machine, so an agent able to edit it decides what
    the next plan asks about. Declare "sandboxOptions.writableEnvFiles: true" where an
    agent is meant to edit it; the plan then says the file is writable, as it says
    when a file sits below a mount's own directory, where renaming that directory
    reaches it again.
@z

@x
    What was approved is recorded per environment under sbx's state directory, not
    next to the file, so a later invocation asks only about what moved — and applies
    silently when nothing did. An environment that declares commands running on this
    machine is asked about on every invocation, changed or not: the answer is about
    the invocation, and what a command does depends on what the project holds when it
    runs rather than on the text approved before. "sbx env plan" prints the plan and
    changes nothing.
@y
    What was approved is recorded per environment under sbx's state directory, not
    next to the file, so a later invocation asks only about what moved — and applies
    silently when nothing did. An environment that declares commands running on this
    machine is asked about on every invocation, changed or not: the answer is about
    the invocation, and what a command does depends on what the project holds when it
    runs rather than on the text approved before. "sbx env plan" prints the plan and
    changes nothing.
@z

@x
    Use --auto-approve (-y) where there is no terminal to answer on. Where an
    environment's commands are your own and run many times a day,
    "sbx settings set env.rememberHostCommands true" asks about them only when
    they change.
@y
    Use --auto-approve (-y) where there is no terminal to answer on. Where an
    environment's commands are your own and run many times a day,
    "sbx settings set env.rememberHostCommands true" asks about them only when
    they change.
@z

@x
usage: sbx env COMMAND
@y
usage: sbx env COMMAND
@z

% options:

@x help
      usage: help for env
@y
      usage: help for env
@z

% inherited_options:

@x cloud
      usage: |
        Dispatch to Docker Cloud Sandboxes API instead of local sandboxd (supported by a growing set of verbs — run 'sbx --cloud --help' for the current list)
@y
      usage: |
        Dispatch to Docker Cloud Sandboxes API instead of local sandboxd (supported by a growing set of verbs — run 'sbx --cloud --help' for the current list)
@z

@x cloud-api-url
      usage: |
        Cloud Sandboxes API base URL; only used with --cloud. Defaults to prod (https://api.sandboxes-cloud.docker.com). Set DOCKER_CLOUD_API_URL or pass this flag to override; a legacy value ending in /v1 is accepted.
@y
      usage: |
        Cloud Sandboxes API base URL; only used with --cloud. Defaults to prod (https://api.sandboxes-cloud.docker.com). Set DOCKER_CLOUD_API_URL or pass this flag to override; a legacy value ending in /v1 is accepted.
@z

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

% see_also:

@x
    - sbx - Manage AI coding agent sandboxes.
    - sbx env create - Create a sandbox environment from sbxenv.yaml
    - sbx env exec - Execute a command inside a sandbox environment
    - sbx env plan - Show what an environment would change outside the sandbox
    - sbx env rm - Remove a sandbox environment and its scoped resources
    - sbx env run - Create (if needed) and attach to a sandbox environment
@y
    - sbx - Manage AI coding agent sandboxes.
    - sbx env create - Create a sandbox environment from sbxenv.yaml
    - sbx env exec - Execute a command inside a sandbox environment
    - sbx env plan - Show what an environment would change outside the sandbox
    - sbx env rm - Remove a sandbox environment and its scoped resources
    - sbx env run - Create (if needed) and attach to a sandbox environment
@z
