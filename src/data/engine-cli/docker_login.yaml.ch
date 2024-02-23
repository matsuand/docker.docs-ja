%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker login
short: Log in to a registry
long: Log in to a registry.
usage: docker login [OPTIONS] [SERVER]
pname: docker
plink: docker.yaml
options:
    - option: password
      shorthand: p
      value_type: string
      description: Password
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: password-stdin
      value_type: bool
      default_value: "false"
      description: Take the password from stdin
      details_url: '#password-stdin'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: username
      shorthand: u
      value_type: string
      description: Username
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: help
      value_type: bool
      default_value: "false"
      description: Print usage
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Login to a self-hosted registry
@y
command: docker login
short: Log in to a registry
long: Log in to a registry.
usage: docker login [OPTIONS] [SERVER]
pname: docker
plink: docker.yaml
options:
    - option: password
      shorthand: p
      value_type: string
      description: Password
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: password-stdin
      value_type: bool
      default_value: "false"
      description: Take the password from stdin
      details_url: '#password-stdin'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: username
      shorthand: u
      value_type: string
      description: Username
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: help
      value_type: bool
      default_value: "false"
      description: Print usage
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Login to a self-hosted registry
@z

@x
    If you want to log in to a self-hosted registry you can specify this by
    adding the server name.
@y
    If you want to log in to a self-hosted registry you can specify this by
    adding the server name.
@z

@x
    ```console
    $ docker login localhost:8080
    ```
@y
    ```console
    $ docker login localhost:8080
    ```
@z

@x
    ### Provide a password using STDIN (--password-stdin) {#password-stdin}
@y
    ### Provide a password using STDIN (--password-stdin) {#password-stdin}
@z

@x
    To run the `docker login` command non-interactively, you can set the
    `--password-stdin` flag to provide a password through `STDIN`. Using
    `STDIN` prevents the password from ending up in the shell's history,
    or log-files.
@y
    To run the `docker login` command non-interactively, you can set the
    `--password-stdin` flag to provide a password through `STDIN`. Using
    `STDIN` prevents the password from ending up in the shell's history,
    or log-files.
@z

@x
    The following example reads a password from a file, and passes it to the
    `docker login` command using `STDIN`:
@y
    The following example reads a password from a file, and passes it to the
    `docker login` command using `STDIN`:
@z

@x
    ```console
    $ cat ~/my_password.txt | docker login --username foo --password-stdin
    ```
@y
    ```console
    $ cat ~/my_password.txt | docker login --username foo --password-stdin
    ```
@z

@x
    ### Privileged user requirement
@y
    ### Privileged user requirement
@z

@x
    `docker login` requires you to use `sudo` or be `root`, except when:
@y
    `docker login` requires you to use `sudo` or be `root`, except when:
@z

@x
    - Connecting to a remote daemon, such as a `docker-machine` provisioned `docker engine`.
    - The user is added to the `docker` group. This will impact the security of your system; the `docker` group is `root` equivalent.  See [Docker Daemon Attack Surface](/engine/security/#docker-daemon-attack-surface) for details.
@y
    - Connecting to a remote daemon, such as a `docker-machine` provisioned `docker engine`.
    - The user is added to the `docker` group. This will impact the security of your system; the `docker` group is `root` equivalent.  See [Docker Daemon Attack Surface](__SUBDIR__/engine/security/#docker-daemon-attack-surface) for details.
@z

@x
    You can log in to any public or private repository for which you have
    credentials.  When you log in, the command stores credentials in
    `$HOME/.docker/config.json` on Linux or `%USERPROFILE%/.docker/config.json` on
    Windows, via the procedure described below.
@y
    You can log in to any public or private repository for which you have
    credentials.  When you log in, the command stores credentials in
    `$HOME/.docker/config.json` on Linux or `%USERPROFILE%/.docker/config.json` on
    Windows, via the procedure described below.
@z

@x
    ### Credential stores
@y
    ### Credential stores
@z

@x
    The Docker Engine can keep user credentials in an external credential store,
    such as the native keychain of the operating system. Using an external store
    is more secure than storing credentials in the Docker configuration file.
@y
    The Docker Engine can keep user credentials in an external credential store,
    such as the native keychain of the operating system. Using an external store
    is more secure than storing credentials in the Docker configuration file.
@z

@x
    To use a credential store, you need an external helper program to interact
    with a specific keychain or external store. Docker requires the helper
    program to be in the client's host `$PATH`.
@y
    To use a credential store, you need an external helper program to interact
    with a specific keychain or external store. Docker requires the helper
    program to be in the client's host `$PATH`.
@z

@x
    You can download the helpers from the `docker-credential-helpers`
    [releases page](https://github.com/docker/docker-credential-helpers/releases).
    Helpers are available for the following credential stores:
@y
    You can download the helpers from the `docker-credential-helpers`
    [releases page](https://github.com/docker/docker-credential-helpers/releases).
    Helpers are available for the following credential stores:
@z

@x
    - D-Bus Secret Service
    - Apple macOS keychain
    - Microsoft Windows Credential Manager
    - [pass](https://www.passwordstore.org/)
@y
    - D-Bus Secret Service
    - Apple macOS keychain
    - Microsoft Windows Credential Manager
    - [pass](https://www.passwordstore.org/)
@z

@x
    #### Configure the credential store
@y
    #### Configure the credential store
@z

@x
    You need to specify the credential store in `$HOME/.docker/config.json`
    to tell the Docker Engine to use it. The value of the config property should be
    the suffix of the program to use (i.e. everything after `docker-credential-`).
    For example, to use `docker-credential-osxkeychain`:
@y
    You need to specify the credential store in `$HOME/.docker/config.json`
    to tell the Docker Engine to use it. The value of the config property should be
    the suffix of the program to use (i.e. everything after `docker-credential-`).
    For example, to use `docker-credential-osxkeychain`:
@z

@x
    ```json
    {
      "credsStore": "osxkeychain"
    }
    ```
@y
    ```json
    {
      "credsStore": "osxkeychain"
    }
    ```
@z

@x
    If you are currently logged in, run `docker logout` to remove
    the credentials from the file and run `docker login` again.
@y
    If you are currently logged in, run `docker logout` to remove
    the credentials from the file and run `docker login` again.
@z

@x
    #### Default behavior
@y
    #### Default behavior
@z

@x
    By default, Docker looks for the native binary on each of the platforms, i.e.
    "osxkeychain" on macOS, "wincred" on windows, and "pass" on Linux. A special
    case is that on Linux, Docker will fall back to the "secretservice" binary if
    it cannot find the "pass" binary. If none of these binaries are present, it
    stores the credentials (i.e. password) in base64 encoding in the config files
    described above.
@y
    By default, Docker looks for the native binary on each of the platforms, i.e.
    "osxkeychain" on macOS, "wincred" on windows, and "pass" on Linux. A special
    case is that on Linux, Docker will fall back to the "secretservice" binary if
    it cannot find the "pass" binary. If none of these binaries are present, it
    stores the credentials (i.e. password) in base64 encoding in the config files
    described above.
@z

@x
    #### Credential helper protocol
@y
    #### Credential helper protocol
@z

@x
    Credential helpers can be any program or script that follows a very simple protocol.
    This protocol is heavily inspired by Git, but it differs in the information shared.
@y
    Credential helpers can be any program or script that follows a very simple protocol.
    This protocol is heavily inspired by Git, but it differs in the information shared.
@z

@x
    The helpers always use the first argument in the command to identify the action.
    There are only three possible values for that argument: `store`, `get`, and `erase`.
@y
    The helpers always use the first argument in the command to identify the action.
    There are only three possible values for that argument: `store`, `get`, and `erase`.
@z

@x
    The `store` command takes a JSON payload from the standard input. That payload carries
    the server address, to identify the credential, the user name, and either a password
    or an identity token.
@y
    The `store` command takes a JSON payload from the standard input. That payload carries
    the server address, to identify the credential, the user name, and either a password
    or an identity token.
@z

@x
    ```json
    {
      "ServerURL": "https://index.docker.io/v1",
      "Username": "david",
      "Secret": "passw0rd1"
    }
    ```
@y
    ```json
    {
      "ServerURL": "https://index.docker.io/v1",
      "Username": "david",
      "Secret": "passw0rd1"
    }
    ```
@z

@x
    If the secret being stored is an identity token, the Username should be set to
    `<token>`.
@y
    If the secret being stored is an identity token, the Username should be set to
    `<token>`.
@z

@x
    The `store` command can write error messages to `STDOUT` that the Docker Engine
    will show if there was an issue.
@y
    The `store` command can write error messages to `STDOUT` that the Docker Engine
    will show if there was an issue.
@z

@x
    The `get` command takes a string payload from the standard input. That payload carries
    the server address that the Docker Engine needs credentials for. This is
    an example of that payload: `https://index.docker.io/v1`.
@y
    The `get` command takes a string payload from the standard input. That payload carries
    the server address that the Docker Engine needs credentials for. This is
    an example of that payload: `https://index.docker.io/v1`.
@z

@x
    The `get` command writes a JSON payload to `STDOUT`. Docker reads the user name
    and password from this payload:
@y
    The `get` command writes a JSON payload to `STDOUT`. Docker reads the user name
    and password from this payload:
@z

@x
    ```json
    {
      "Username": "david",
      "Secret": "passw0rd1"
    }
    ```
@y
    ```json
    {
      "Username": "david",
      "Secret": "passw0rd1"
    }
    ```
@z

@x
    The `erase` command takes a string payload from `STDIN`. That payload carries
    the server address that the Docker Engine wants to remove credentials for. This is
    an example of that payload: `https://index.docker.io/v1`.
@y
    The `erase` command takes a string payload from `STDIN`. That payload carries
    the server address that the Docker Engine wants to remove credentials for. This is
    an example of that payload: `https://index.docker.io/v1`.
@z

@x
    The `erase` command can write error messages to `STDOUT` that the Docker Engine
    will show if there was an issue.
@y
    The `erase` command can write error messages to `STDOUT` that the Docker Engine
    will show if there was an issue.
@z

@x
    ### Credential helpers
@y
    ### Credential helpers
@z

@x
    Credential helpers are similar to the credential store above, but act as the
    designated programs to handle credentials for specific registries. The default
    credential store (`credsStore` or the config file itself) will not be used for
    operations concerning credentials of the specified registries.
@y
    Credential helpers are similar to the credential store above, but act as the
    designated programs to handle credentials for specific registries. The default
    credential store (`credsStore` or the config file itself) will not be used for
    operations concerning credentials of the specified registries.
@z

@x
    #### Configure credential helpers
@y
    #### Configure credential helpers
@z

@x
    If you are currently logged in, run `docker logout` to remove
    the credentials from the default store.
@y
    If you are currently logged in, run `docker logout` to remove
    the credentials from the default store.
@z

@x
    Credential helpers are specified in a similar way to `credsStore`, but
    allow for multiple helpers to be configured at a time. Keys specify the
    registry domain, and values specify the suffix of the program to use
    (i.e. everything after `docker-credential-`).
    For example:
@y
    Credential helpers are specified in a similar way to `credsStore`, but
    allow for multiple helpers to be configured at a time. Keys specify the
    registry domain, and values specify the suffix of the program to use
    (i.e. everything after `docker-credential-`).
    For example:
@z

@x
    ```json
    {
      "credHelpers": {
        "registry.example.com": "registryhelper",
        "awesomereg.example.org": "hip-star",
        "unicorn.example.io": "vcbait"
      }
    }
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    ```json
    {
      "credHelpers": {
        "registry.example.com": "registryhelper",
        "awesomereg.example.org": "hip-star",
        "unicorn.example.io": "vcbait"
      }
    }
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
