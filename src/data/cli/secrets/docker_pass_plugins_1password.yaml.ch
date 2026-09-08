%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker pass plugins 1password
short: Manage the 1Password SDK plugin.
long: |-
    Manage the `1password-sdk` plugin, which resolves secret references against 1Password through the official 1Password SDK.
@y
command: docker pass plugins 1password
short: Manage the 1Password SDK plugin.
long: |-
    Manage the `1password-sdk` plugin, which resolves secret references against 1Password through the official 1Password SDK.
@z

@x
    The plugin authenticates with a [service account token](https://developer.1password.com/docs/service-accounts/get-started/) scoped to the vaults you want to expose. The token is stored in the local OS keychain. Use the subcommands to install the token (and enable the plugin) or to remove it (and disable the plugin).
@y
    The plugin authenticates with a [service account token](https://developer.1password.com/docs/service-accounts/get-started/) scoped to the vaults you want to expose. The token is stored in the local OS keychain. Use the subcommands to install the token (and enable the plugin) or to remove it (and disable the plugin).
@z

@x
    Items reachable through this plugin are matched under any of:
@y
    Items reachable through this plugin are matched under any of:
@z

@x
    - the raw 1Password item ID,
    - `<vault-id>/<title>`,
    - `<vault-name>/<title>`,
    - a native 1Password secret-reference path (`<vault>/<item>/<field>` or `<vault>/<item>/<section>/<field>`), resolved directly via the SDK as if prefixed with `op://`.
@y
    - the raw 1Password item ID,
    - `<vault-id>/<title>`,
    - `<vault-name>/<title>`,
    - a native 1Password secret-reference path (`<vault>/<item>/<field>` or `<vault>/<item>/<section>/<field>`), resolved directly via the SDK as if prefixed with `op://`.
@z

@x
    Matching for the title-based forms follows 1Password's normalization rules and is case-insensitive, so existing `op://` references can be reused as-is.
usage: docker pass plugins 1password
pname: docker pass plugins
plink: docker_pass_plugins.yaml
cname:
    - docker pass plugins 1password purge
    - docker pass plugins 1password setup
clink:
    - docker_pass_plugins_1password_purge.yaml
    - docker_pass_plugins_1password_setup.yaml
deprecated: false
hidden: false
experimental: true
experimentalcli: true
kubernetes: false
swarm: false
examples: |-
    Install the service account token and enable the plugin:
@y
    Matching for the title-based forms follows 1Password's normalization rules and is case-insensitive, so existing `op://` references can be reused as-is.
usage: docker pass plugins 1password
pname: docker pass plugins
plink: docker_pass_plugins.yaml
cname:
    - docker pass plugins 1password purge
    - docker pass plugins 1password setup
clink:
    - docker_pass_plugins_1password_purge.yaml
    - docker_pass_plugins_1password_setup.yaml
deprecated: false
hidden: false
experimental: true
experimentalcli: true
kubernetes: false
swarm: false
examples: |-
    Install the service account token and enable the plugin:
@z

@x
    ```sh
    echo "$OP_SERVICE_ACCOUNT_TOKEN" | docker pass plugins 1password setup
    ```
@y
    ```sh
    echo "$OP_SERVICE_ACCOUNT_TOKEN" | docker pass plugins 1password setup
    ```
@z

@x
    Remove the token and disable the plugin:
@y
    Remove the token and disable the plugin:
@z

@x
    ```sh
    docker pass plugins 1password purge
    ```
@y
    ```sh
    docker pass plugins 1password purge
    ```
@z
