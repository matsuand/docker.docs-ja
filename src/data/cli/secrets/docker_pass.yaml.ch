%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker pass
short: Manage your local OS keychain secrets.
long: |-
    Docker Pass is a helper for securely retrieving secrets from a range of
    backends, such as your local OS keychain, password managers, or remote
    vaults, and injecting them into containers and host commands when
    needed. Each backend is implemented as a plugin.
@y
command: docker pass
short: Manage your local OS keychain secrets.
long: |-
    Docker Pass is a helper for securely retrieving secrets from a range of
    backends, such as your local OS keychain, password managers, or remote
    vaults, and injecting them into containers and host commands when
    needed. Each backend is implemented as a plugin.
@z

@x
    ### Installation
@y
    ### Installation
@z

@x
    On Docker Desktop, Secrets Engine and `docker pass` are integrated by default.
    For Docker CE, install the packages separately from Docker's official
    repository. This requires Docker Engine (`dockerd`) 29.2.0 or later. If you did
    not install Docker Engine from that repository, add it with the official
    convenience script:
@y
    On Docker Desktop, Secrets Engine and `docker pass` are integrated by default.
    For Docker CE, install the packages separately from Docker's official
    repository. This requires Docker Engine (`dockerd`) 29.2.0 or later. If you did
    not install Docker Engine from that repository, add it with the official
    convenience script:
@z

@x
    ```shell
    curl -fsSL https://get.docker.com | sh -s -- --setup-repo
    ```
@y
    ```shell
    curl -fsSL https://get.docker.com | sh -s -- --setup-repo
    ```
@z

@x
    apt (Debian/Ubuntu):
@y
    apt (Debian/Ubuntu):
@z

@x
    ```shell
    sudo apt-get update
    sudo apt-get install docker-secrets-engine docker-secrets-engine-plugins
    ```
@y
    ```shell
    sudo apt-get update
    sudo apt-get install docker-secrets-engine docker-secrets-engine-plugins
    ```
@z

@x
    dnf (Fedora):
@y
    dnf (Fedora):
@z

@x
    ```shell
    sudo dnf install docker-secrets-engine docker-secrets-engine-plugins
    ```
@y
    ```shell
    sudo dnf install docker-secrets-engine docker-secrets-engine-plugins
    ```
@z

@x
    Then enable the service for your user:
@y
    Then enable the service for your user:
@z

@x
    ```shell
    systemctl --user daemon-reload
    systemctl --user enable --now docker-secrets-engine.service
    ```
@y
    ```shell
    systemctl --user daemon-reload
    systemctl --user enable --now docker-secrets-engine.service
    ```
@z

@x
    For full instructions see the [Secrets Engine README](https://github.com/docker/secrets-engine/blob/main/README.md).
@y
    For full instructions see the [Secrets Engine README](https://github.com/docker/secrets-engine/blob/main/README.md).
@z

@x
    ### Secret References
@y
    ### Secret References
@z

@x
    A secret reference is written using the `se://` URI scheme and either
    identifies a specific secret or matches multiple secrets through a
    pattern over the realm structure. For example:
@y
    A secret reference is written using the `se://` URI scheme and either
    identifies a specific secret or matches multiple secrets through a
    pattern over the realm structure. For example:
@z

@x
    - `se://docker/auth/hub/alice` — resolves to a specific secret, Alice's
      Docker Hub credential.
    - `se://docker/auth/hub/*` — matches every credential stored directly under
      Docker Hub.
    - `se://docker/auth/**` — matches every Docker auth secret across all
      registries.
@y
    - `se://docker/auth/hub/alice` — resolves to a specific secret, Alice's
      Docker Hub credential.
    - `se://docker/auth/hub/*` — matches every credential stored directly under
      Docker Hub.
    - `se://docker/auth/**` — matches every Docker auth secret across all
      registries.
@z

@x
    Resolution fans out across every plugin whose pattern matches the
    reference, so even a specific ID can return multiple values if more
    than one plugin has stored a secret under that ID.
    The same reference can be reused across environments and storage
    backends without rewriting Compose files or application
    configuration. For example, it may resolve against your local OS
    keychain in development and against a production vault in CI or on a
    server.
@y
    Resolution fans out across every plugin whose pattern matches the
    reference, so even a specific ID can return multiple values if more
    than one plugin has stored a secret under that ID.
    The same reference can be reused across environments and storage
    backends without rewriting Compose files or application
    configuration. For example, it may resolve against your local OS
    keychain in development and against a production vault in CI or on a
    server.
@z

@x
    The engine resolves these references in two contexts:
@y
    The engine resolves these references in two contexts:
@z

@x
    #### Containers
@y
    #### Containers
@z

@x
    Anywhere Docker accepts an environment-variable value, write
    `se://<id|pattern>` and the engine resolves it just before the container
    starts.
@y
    Anywhere Docker accepts an environment-variable value, write
    `se://<id|pattern>` and the engine resolves it just before the container
    starts.
@z

@x
    With `docker run -e`:
@y
    With `docker run -e`:
@z

@x
    ```sh
    docker run --rm -e OPENAI_API_KEY=se://openai/api-key busybox sh -c 'echo "$OPENAI_API_KEY"'
    ```
@y
    ```sh
    docker run --rm -e OPENAI_API_KEY=se://openai/api-key busybox sh -c 'echo "$OPENAI_API_KEY"'
    ```
@z

@x
    In a Compose file under `environment:`:
@y
    In a Compose file under `environment:`:
@z

@x
    ```yaml
    services:
      app:
        image: your/image
        environment:
          DB_PASSWORD: se://postgres/prod/app-user
    ```
@y
    ```yaml
    services:
      app:
        image: your/image
        environment:
          DB_PASSWORD: se://postgres/prod/app-user
    ```
@z

@x
    Note: `docker compose build` is not supported yet.
@y
    Note: `docker compose build` is not supported yet.
@z

@x
    #### Host commands
@y
    #### Host commands
@z

@x
    `docker pass run` wraps any host process and resolves `se://`
    references in its environment before exec'ing it. Any env variable
    whose value has the form `se://<id|pattern>` is replaced with the
    resolved secret; everything else is passed through untouched.
@y
    `docker pass run` wraps any host process and resolves `se://`
    references in its environment before exec'ing it. Any env variable
    whose value has the form `se://<id|pattern>` is replaced with the
    resolved secret; everything else is passed through untouched.
@z

@x
    ```sh
    GH_TOKEN=se://gh-token docker pass run -- gh repo list
    ```
@y
    ```sh
    GH_TOKEN=se://gh-token docker pass run -- gh repo list
    ```
@z

@x
    #### Identifiers
@y
    #### Identifiers
@z

@x
    Secret IDs are hierarchical, path-like strings. Components are separated
    by `/`; each component may contain `A-Z`, `a-z`, `0-9`, `.`, `-`, `_`,
    or `:`. No leading, trailing, or empty components. Matching is
    case-sensitive. A predictable realm/namespace structure
    (e.g. `docker/auth/<registry>`, `docker/db/<env>/password`) makes
    automation and access control easier.
@y
    Secret IDs are hierarchical, path-like strings. Components are separated
    by `/`; each component may contain `A-Z`, `a-z`, `0-9`, `.`, `-`, `_`,
    or `:`. No leading, trailing, or empty components. Matching is
    case-sensitive. A predictable realm/namespace structure
    (e.g. `docker/auth/<registry>`, `docker/db/<env>/password`) makes
    automation and access control easier.
@z

@x
    #### Patterns
@y
    #### Patterns
@z

@x
    Patterns follow the same rules as identifiers, with two extra tokens:
@y
    Patterns follow the same rules as identifiers, with two extra tokens:
@z

@x
    - `*` — matches exactly one component.
    - `**` — matches zero or more components.
@y
    - `*` — matches exactly one component.
    - `**` — matches zero or more components.
@z

@x
    Wildcards must occupy a whole component (e.g. `auth/*/token` is valid;
    `auth/foo*` is not), and a single component may contain at most one of
    `*` or `**`.
@y
    Wildcards must occupy a whole component (e.g. `auth/*/token` is valid;
    `auth/foo*` is not), and a single component may contain at most one of
    `*` or `**`.
@z

@x
    Example patterns:
@y
    Example patterns:
@z

@x
    - `docker/auth/**` — every Docker auth secret in any sub-realm.
    - `myrealm/*/password` — password entries one level deep under
      `myrealm`.
    - `**` — catch-all.
@y
    - `docker/auth/**` — every Docker auth secret in any sub-realm.
    - `myrealm/*/password` — password entries one level deep under
      `myrealm`.
    - `**` — catch-all.
@z

@x
    #### Routing
@y
    #### Routing
@z

@x
    When a container references `se://<id|pattern>`, the engine fans the lookup out
    to every plugin whose declared pattern matches `<id|pattern>` and merges their
    responses. If no plugin matches, the lookup fails and the container
    does not start.
@y
    When a container references `se://<id|pattern>`, the engine fans the lookup out
    to every plugin whose declared pattern matches `<id|pattern>` and merges their
    responses. If no plugin matches, the lookup fails and the container
    does not start.
@z

@x
    ### Plugin Management
@y
    ### Plugin Management
@z

@x
    Use the CLI to inspect loaded and available plugins:
@y
    Use the CLI to inspect loaded and available plugins:
@z

@x
    ```sh
    docker pass plugins ls
    ```
@y
    ```sh
    docker pass plugins ls
    ```
@z

@x
    Plugins marked as **configurable** can be enabled or disabled at runtime:
@y
    Plugins marked as **configurable** can be enabled or disabled at runtime:
@z

@x
    ```sh
    docker pass plugins enable <name>
    docker pass plugins disable <name>
    ```
@y
    ```sh
    docker pass plugins enable <name>
    docker pass plugins disable <name>
    ```
@z

@x
    ### Plugins
@y
    ### Plugins
@z

@x
    #### OS Keychain
@y
    #### OS Keychain
@z

@x
    - **Plugin name:** `docker-pass`
    - **Storage backend:** the local OS keychain, accessed via
      platform-specific APIs:
      - **Windows:** Windows Credential Manager API
      - **macOS:** Keychain Services API
      - **Linux:** `org.freedesktop.secrets` API (requires DBus and a
        Secret Service provider such as `gnome-keyring` or `kdewallet`)
    - **Use:** holds secrets you store directly with `docker pass` (and
      internal secrets used by other plugins, such as the 1Password service
      account token). Always on; not configurable.
@y
    - **Plugin name:** `docker-pass`
    - **Storage backend:** the local OS keychain, accessed via
      platform-specific APIs:
      - **Windows:** Windows Credential Manager API
      - **macOS:** Keychain Services API
      - **Linux:** `org.freedesktop.secrets` API (requires DBus and a
        Secret Service provider such as `gnome-keyring` or `kdewallet`)
    - **Use:** holds secrets you store directly with `docker pass` (and
      internal secrets used by other plugins, such as the 1Password service
      account token). Always on; not configurable.
@z

@x
    #### 1Password (configurable)
@y
    #### 1Password (configurable)
@z

@x
    Each item matches the requested pattern under up to three candidate IDs:
@y
    Each item matches the requested pattern under up to three candidate IDs:
@z

@x
    1. **Raw item ID** — the opaque alphanumeric ID that 1Password assigns
       (e.g. `alphanumeric_26char`).
    2. **`<vault-id>/<title>`** — the vault's ID joined with the item's
       normalized title.
    3. **`<vault-name>/<title>`** — the vault's display name joined with
       the item's normalized title.
@y
    1. **Raw item ID** — the opaque alphanumeric ID that 1Password assigns
       (e.g. `alphanumeric_26char`).
    2. **`<vault-id>/<title>`** — the vault's ID joined with the item's
       normalized title.
    3. **`<vault-name>/<title>`** — the vault's display name joined with
       the item's normalized title.
@z

@x
    Normalization (applied to vault names and titles) follows 1Password's
    [secret-reference syntax](https://developer.1password.com/docs/cli/secret-reference-syntax/):
    spaces become `-`, `(` and `)` are stripped, `/` and `&` become `_`,
    any remaining character outside `[a-zA-Z0-9-._]` is removed, and the
    result is lowercased. Following 1Password's matching rules makes the
    plugin case-insensitive, so existing `op://` references can be reused
    as-is.
    Candidates that don't produce a valid ID are skipped silently, so
    items with unusual names are still matchable through one of the other
    forms.
@y
    Normalization (applied to vault names and titles) follows 1Password's
    [secret-reference syntax](https://developer.1password.com/docs/cli/secret-reference-syntax/):
    spaces become `-`, `(` and `)` are stripped, `/` and `&` become `_`,
    any remaining character outside `[a-zA-Z0-9-._]` is removed, and the
    result is lowercased. Following 1Password's matching rules makes the
    plugin case-insensitive, so existing `op://` references can be reused
    as-is.
    Candidates that don't produce a valid ID are skipped silently, so
    items with unusual names are still matchable through one of the other
    forms.
@z

@x
    ##### CLI version
@y
    ##### CLI version
@z

@x
    - **Plugin name:** `1password-cli`
    - **How it authenticates:** delegates to the [`op` CLI](https://developer.1password.com/docs/cli/).
      You need `op` installed and an active 1Password session. On macOS
      this typically means the 1Password desktop app with biometric unlock
      enabled; on other platforms, `op signin`.
    - **Setup:** no tokens to manage. If your local `op` is signed in, the
      plugin can resolve secrets.
    - **Behavior:** when Docker Desktop starts, the plugin performs an
      initial fetch of all items, which triggers a 1Password authorization
      prompt. The resulting cache is then refreshed periodically.
    - **Fatal errors:** the plugin treats a few conditions as
      unrecoverable and stops itself instead of retrying:
      - the `op` binary cannot be found on `PATH`,
      - the user dismisses or lets the 1Password authorization prompt
        time out.
@y
    - **Plugin name:** `1password-cli`
    - **How it authenticates:** delegates to the [`op` CLI](https://developer.1password.com/docs/cli/).
      You need `op` installed and an active 1Password session. On macOS
      this typically means the 1Password desktop app with biometric unlock
      enabled; on other platforms, `op signin`.
    - **Setup:** no tokens to manage. If your local `op` is signed in, the
      plugin can resolve secrets.
    - **Behavior:** when Docker Desktop starts, the plugin performs an
      initial fetch of all items, which triggers a 1Password authorization
      prompt. The resulting cache is then refreshed periodically.
    - **Fatal errors:** the plugin treats a few conditions as
      unrecoverable and stops itself instead of retrying:
      - the `op` binary cannot be found on `PATH`,
      - the user dismisses or lets the 1Password authorization prompt
        time out.
@z

@x
      When this happens the plugin is reported as crashed in
      `docker pass plugins ls`. Resolve the underlying issue (install
      `op`, sign in, accept the prompt) and re-enable the plugin with
      `docker pass plugins enable 1password-cli`.
    - **Enable / disable:**
      ```sh
      docker pass plugins enable 1password-cli
      docker pass plugins disable 1password-cli
      ```
@y
      When this happens the plugin is reported as crashed in
      `docker pass plugins ls`. Resolve the underlying issue (install
      `op`, sign in, accept the prompt) and re-enable the plugin with
      `docker pass plugins enable 1password-cli`.
    - **Enable / disable:**
      ```sh
      docker pass plugins enable 1password-cli
      docker pass plugins disable 1password-cli
      ```
@z

@x
    ##### Service account token version
@y
    ##### Service account token version
@z

@x
    - **Plugin name:** `1password-sdk`
    - **How it authenticates:** uses the official 1Password Go SDK with a
      [service account token](https://developer.1password.com/docs/service-accounts/get-started/)
      scoped to the vaults you want to expose.
    - **Setup:** supply the token once on stdin. It is stored in the OS
      keychain and the plugin is enabled in the same step:
      ```sh
      echo "$OP_SERVICE_ACCOUNT_TOKEN" | docker pass plugins 1password setup
      ```
    - **Teardown:** remove the token and disable the plugin:
      ```sh
      docker pass plugins 1password purge
      ```
@y
    - **Plugin name:** `1password-sdk`
    - **How it authenticates:** uses the official 1Password Go SDK with a
      [service account token](https://developer.1password.com/docs/service-accounts/get-started/)
      scoped to the vaults you want to expose.
    - **Setup:** supply the token once on stdin. It is stored in the OS
      keychain and the plugin is enabled in the same step:
      ```sh
      echo "$OP_SERVICE_ACCOUNT_TOKEN" | docker pass plugins 1password setup
      ```
    - **Teardown:** remove the token and disable the plugin:
      ```sh
      docker pass plugins 1password purge
      ```
@z

@x
    ### Feedback and SDK
@y
    ### Feedback and SDK
@z

@x
    Use the Go SDK at
    [github.com/docker/secrets-engine](https://github.com/docker/secrets-engine)
    to integrate secret resolution into your own code, build custom
    clients, or write new plugins.
@y
    Use the Go SDK at
    [github.com/docker/secrets-engine](https://github.com/docker/secrets-engine)
    to integrate secret resolution into your own code, build custom
    clients, or write new plugins.
@z

@x
    Have a feature request or hit a bug? File an issue at [github.com/docker/secrets-engine/issues](https://github.com/docker/secrets-engine/issues).
usage: docker pass set|get|ls|rm|run
pname: docker
plink: docker.yaml
cname:
    - docker pass get
    - docker pass ls
    - docker pass plugins
    - docker pass rm
    - docker pass run
    - docker pass set
clink:
    - docker_pass_get.yaml
    - docker_pass_ls.yaml
    - docker_pass_plugins.yaml
    - docker_pass_rm.yaml
    - docker_pass_run.yaml
    - docker_pass_set.yaml
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
examples: |-
    ### Using keychain secrets in containers
@y
    Have a feature request or hit a bug? File an issue at [github.com/docker/secrets-engine/issues](https://github.com/docker/secrets-engine/issues).
usage: docker pass set|get|ls|rm|run
pname: docker
plink: docker.yaml
cname:
    - docker pass get
    - docker pass ls
    - docker pass plugins
    - docker pass rm
    - docker pass run
    - docker pass set
clink:
    - docker_pass_get.yaml
    - docker_pass_ls.yaml
    - docker_pass_plugins.yaml
    - docker_pass_rm.yaml
    - docker_pass_run.yaml
    - docker_pass_set.yaml
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
examples: |-
    ### Using keychain secrets in containers
@z

@x
    Create a secret:
@y
    Create a secret:
@z

@x
    ```console
    $ docker pass set GH_TOKEN=123456789
    ```
@y
    ```console
    $ docker pass set GH_TOKEN=123456789
    ```
@z

@x
    Create a secret from STDIN:
@y
    Create a secret from STDIN:
@z

@x
    ```console
    echo "my_val" | docker pass set GH_TOKEN
    ```
@y
    ```console
    echo "my_val" | docker pass set GH_TOKEN
    ```
@z

@x
    Run a container that uses the secret:
@y
    Run a container that uses the secret:
@z

@x
    ```console
    $ docker run -e GH_TOKEN= -dt --name demo busybox
    ```
@y
    ```console
    $ docker run -e GH_TOKEN= -dt --name demo busybox
    ```
@z

@x
    Inspect the secret from inside the container:
@y
    Inspect the secret from inside the container:
@z

@x
    ```console
    $ docker exec demo sh -c 'echo $GH_TOKEN'
    123456789
    ```
@y
    ```console
    $ docker exec demo sh -c 'echo $GH_TOKEN'
    123456789
    ```
@z

@x
    Explicitly assign a secret to a different environment variable:
@y
    Explicitly assign a secret to a different environment variable:
@z

@x
    ```console
    $ docker run -e GITHUB_TOKEN=se://GH_TOKEN -dt --name demo busybox
    ```
@y
    ```console
    $ docker run -e GITHUB_TOKEN=se://GH_TOKEN -dt --name demo busybox
    ```
@z

@x
    ### Using keychain secrets in Compose
@y
    ### Using keychain secrets in Compose
@z

@x
    Store the secrets:
@y
    Store the secrets:
@z

@x
    ```console
    $ docker pass set myapp/anthropic/api-key=sk-ant-...
    $ docker pass set myapp/postgres/password=s3cr3t
    ```
@y
    ```console
    $ docker pass set myapp/anthropic/api-key=sk-ant-...
    $ docker pass set myapp/postgres/password=s3cr3t
    ```
@z

@x
    ```yaml
    services:
      api:
        image: service1
        environment:
          - ANTHROPIC_API_KEY=se://myapp/anthropic/api-key
          - POSTGRES_PASSWORD=se://myapp/postgres/password
@y
    ```yaml
    services:
      api:
        image: service1
        environment:
          - ANTHROPIC_API_KEY=se://myapp/anthropic/api-key
          - POSTGRES_PASSWORD=se://myapp/postgres/password
@z

@x
      worker:
        image: service2
        command: worker
        environment:
          - ANTHROPIC_API_KEY=se://myapp/anthropic/api-key
@y
      worker:
        image: service2
        command: worker
        environment:
          - ANTHROPIC_API_KEY=se://myapp/anthropic/api-key
@z

@x
      db:
        image: postgres:17
        environment:
          - POSTGRES_PASSWORD=se://myapp/postgres/password
    ```
@y
      db:
        image: postgres:17
        environment:
          - POSTGRES_PASSWORD=se://myapp/postgres/password
    ```
@z
