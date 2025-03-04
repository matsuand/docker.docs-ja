%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Set, use, and manage variables in a Compose file with interpolation
linkTitle: Interpolation
@y
title: Set, use, and manage variables in a Compose file with interpolation
linkTitle: Interpolation
@z

@x
description: How to set, use, and manage variables in your Compose file with interpolation
keywords: compose, orchestration, environment, variables, interpolation
@y
description: How to set, use, and manage variables in your Compose file with interpolation
keywords: compose, orchestration, environment, variables, interpolation
@z

@x
A Compose file can use variables to offer more flexibility. If you want to quickly switch 
between image tags to test multiple versions, or want to adjust a volume source to your local
environment, you don't need to edit the Compose file each time, you can just set variables that insert values into your Compose file at run time.
@y
A Compose file can use variables to offer more flexibility. If you want to quickly switch 
between image tags to test multiple versions, or want to adjust a volume source to your local
environment, you don't need to edit the Compose file each time, you can just set variables that insert values into your Compose file at run time.
@z

@x
Interpolation can also be used to insert values into your Compose file at run time, which is then used to pass variables into your container's environment
@y
Interpolation can also be used to insert values into your Compose file at run time, which is then used to pass variables into your container's environment
@z

@x
Below is a simple example: 
@y
Below is a simple example: 
@z

% snip command...

@x
When you run `docker compose up`, the `web` service defined in the Compose file [interpolates](variable-interpolation.md) in the image `webapp:v1.5` which was set in the `.env` file. You can verify this with the
[config command](/reference/cli/docker/compose/config.md), which prints your resolved application config to the terminal:
@y
When you run `docker compose up`, the `web` service defined in the Compose file [interpolates](variable-interpolation.md) in the image `webapp:v1.5` which was set in the `.env` file. You can verify this with the
[config command](reference/cli/docker/compose/config.md), which prints your resolved application config to the terminal:
@z

% snip command...

@x
## Interpolation syntax
@y
## Interpolation syntax
@z

@x
Interpolation is applied for unquoted and double-quoted values.
Both braced (`${VAR}`) and unbraced (`$VAR`) expressions are supported.
@y
Interpolation is applied for unquoted and double-quoted values.
Both braced (`${VAR}`) and unbraced (`$VAR`) expressions are supported.
@z

@x
For braced expressions, the following formats are supported:
- Direct substitution
  - `${VAR}` -> value of `VAR`
- Default value
  - `${VAR:-default}` -> value of `VAR` if set and non-empty, otherwise `default`
  - `${VAR-default}` -> value of `VAR` if set, otherwise `default`
- Required value
  - `${VAR:?error}` -> value of `VAR` if set and non-empty, otherwise exit with error
  - `${VAR?error}` -> value of `VAR` if set, otherwise exit with error
- Alternative value
  - `${VAR:+replacement}` -> `replacement` if `VAR` is set and non-empty, otherwise empty
  - `${VAR+replacement}` -> `replacement` if `VAR` is set, otherwise empty
@y
For braced expressions, the following formats are supported:
- Direct substitution
  - `${VAR}` -> value of `VAR`
- Default value
  - `${VAR:-default}` -> value of `VAR` if set and non-empty, otherwise `default`
  - `${VAR-default}` -> value of `VAR` if set, otherwise `default`
- Required value
  - `${VAR:?error}` -> value of `VAR` if set and non-empty, otherwise exit with error
  - `${VAR?error}` -> value of `VAR` if set, otherwise exit with error
- Alternative value
  - `${VAR:+replacement}` -> `replacement` if `VAR` is set and non-empty, otherwise empty
  - `${VAR+replacement}` -> `replacement` if `VAR` is set, otherwise empty
@z

@x
For more information, see [Interpolation](/reference/compose-file/interpolation.md) in the Compose Specification. 
@y
For more information, see [Interpolation](reference/compose-file/interpolation.md) in the Compose Specification. 
@z

@x
## Ways to set variables with interpolation
@y
## Ways to set variables with interpolation
@z

@x
Docker Compose can interpolate variables into your Compose file from multiple sources. 
@y
Docker Compose can interpolate variables into your Compose file from multiple sources. 
@z

@x
Note that when the same variable is declared by multiple sources, precedence applies:
@y
Note that when the same variable is declared by multiple sources, precedence applies:
@z

@x
1. Variables from your shell environment
2. If `--env-file` is not set, variables set by an `.env` file in local working directory (`PWD`)
3. Variables from a file set by `--env-file` or an `.env` file in project directory
@y
1. Variables from your shell environment
2. If `--env-file` is not set, variables set by an `.env` file in local working directory (`PWD`)
3. Variables from a file set by `--env-file` or an `.env` file in project directory
@z

@x
You can check variables and values used by Compose to interpolate the Compose model by running `docker compose config --environment`.
@y
You can check variables and values used by Compose to interpolate the Compose model by running `docker compose config --environment`.
@z

@x
### `.env` file
@y
### `.env` file
@z

@x
An `.env` file in Docker Compose is a text file used to define variables that should be made available for interpolation when running `docker compose up`. This file typically contains key-value pairs of variables, and it lets you  centralize and manage configuration in one place. The `.env` file is useful if you have multiple variables you need to store.
@y
An `.env` file in Docker Compose is a text file used to define variables that should be made available for interpolation when running `docker compose up`. This file typically contains key-value pairs of variables, and it lets you  centralize and manage configuration in one place. The `.env` file is useful if you have multiple variables you need to store.
@z

@x
The `.env` file is the default method for setting variables. The `.env` file should be placed at the root of the project directory next to your `compose.yaml` file. For more information on formatting an environment file, see [Syntax for environment files](#env-file-syntax).
@y
The `.env` file is the default method for setting variables. The `.env` file should be placed at the root of the project directory next to your `compose.yaml` file. For more information on formatting an environment file, see [Syntax for environment files](#env-file-syntax).
@z

@x
Basic example: 
@y
Basic example: 
@z

% snip command...

@x
#### Additional information 
@y
#### Additional information 
@z

@x
- If you define a variable in your `.env` file, you can reference it directly in your `compose.yaml` with the [`environment` attribute](/reference/compose-file/services.md#environment). For example, if your `.env` file contains the environment variable `DEBUG=1` and your `compose.yaml` file looks like this:
@y
- If you define a variable in your `.env` file, you can reference it directly in your `compose.yaml` with the [`environment` attribute](reference/compose-file/services.md#environment). For example, if your `.env` file contains the environment variable `DEBUG=1` and your `compose.yaml` file looks like this:
@z

% snip code...

@x
   Docker Compose replaces `${DEBUG}` with the value from the `.env` file
@y
   Docker Compose replaces `${DEBUG}` with the value from the `.env` file
@z

@x
   > [!IMPORTANT]
   >
   > Be aware of [Environment variables precedence](envvars-precedence.md) when using variables in an `.env` file that  as environment variables in your container's environment.
@y
   > [!IMPORTANT]
   >
   > Be aware of [Environment variables precedence](envvars-precedence.md) when using variables in an `.env` file that  as environment variables in your container's environment.
@z

@x
- You can place your `.env` file in a location other than the root of your project's directory, and then use the [`--env-file` option in the CLI](#substitute-with---env-file) so Compose can navigate to it.
@y
- You can place your `.env` file in a location other than the root of your project's directory, and then use the [`--env-file` option in the CLI](#substitute-with---env-file) so Compose can navigate to it.
@z

@x
- Your `.env` file can be overridden by another `.env` if it is [substituted with `--env-file`](#substitute-with---env-file).
@y
- Your `.env` file can be overridden by another `.env` if it is [substituted with `--env-file`](#substitute-with---env-file).
@z

@x
> [!IMPORTANT]
>
> Substitution from `.env` files is a Docker Compose CLI feature.
>
> It is not supported by Swarm when running `docker stack deploy`.
@y
> [!IMPORTANT]
>
> Substitution from `.env` files is a Docker Compose CLI feature.
>
> It is not supported by Swarm when running `docker stack deploy`.
@z

@x
#### `.env` file syntax
@y
#### `.env` file syntax
@z

@x
The following syntax rules apply to environment files:
@y
The following syntax rules apply to environment files:
@z

@x
- Lines beginning with `#` are processed as comments and ignored.
- Blank lines are ignored.
- Unquoted and double-quoted (`"`) values have interpolation applied.
- Each line represents a key-value pair. Values can optionally be quoted.
  - `VAR=VAL` -> `VAL`
  - `VAR="VAL"` -> `VAL`
  - `VAR='VAL'` -> `VAL`
- Inline comments for unquoted values must be preceded with a space.
  - `VAR=VAL # comment` -> `VAL`
  - `VAR=VAL# not a comment` -> `VAL# not a comment`
- Inline comments for quoted values must follow the closing quote.
  - `VAR="VAL # not a comment"` -> `VAL # not a comment`
  - `VAR="VAL" # comment` -> `VAL`
- Single-quoted (`'`) values are used literally.
  - `VAR='$OTHER'` -> `$OTHER`
  - `VAR='${OTHER}'` -> `${OTHER}`
- Quotes can be escaped with `\`.
  - `VAR='Let\'s go!'` -> `Let's go!`
  - `VAR="{\"hello\": \"json\"}"` -> `{"hello": "json"}`
- Common shell escape sequences including `\n`, `\r`, `\t`, and `\\` are supported in double-quoted values.
  - `VAR="some\tvalue"` -> `some  value`
  - `VAR='some\tvalue'` -> `some\tvalue`
  - `VAR=some\tvalue` -> `some\tvalue`
@y
- Lines beginning with `#` are processed as comments and ignored.
- Blank lines are ignored.
- Unquoted and double-quoted (`"`) values have interpolation applied.
- Each line represents a key-value pair. Values can optionally be quoted.
  - `VAR=VAL` -> `VAL`
  - `VAR="VAL"` -> `VAL`
  - `VAR='VAL'` -> `VAL`
- Inline comments for unquoted values must be preceded with a space.
  - `VAR=VAL # comment` -> `VAL`
  - `VAR=VAL# not a comment` -> `VAL# not a comment`
- Inline comments for quoted values must follow the closing quote.
  - `VAR="VAL # not a comment"` -> `VAL # not a comment`
  - `VAR="VAL" # comment` -> `VAL`
- Single-quoted (`'`) values are used literally.
  - `VAR='$OTHER'` -> `$OTHER`
  - `VAR='${OTHER}'` -> `${OTHER}`
- Quotes can be escaped with `\`.
  - `VAR='Let\'s go!'` -> `Let's go!`
  - `VAR="{\"hello\": \"json\"}"` -> `{"hello": "json"}`
- Common shell escape sequences including `\n`, `\r`, `\t`, and `\\` are supported in double-quoted values.
  - `VAR="some\tvalue"` -> `some  value`
  - `VAR='some\tvalue'` -> `some\tvalue`
  - `VAR=some\tvalue` -> `some\tvalue`
@z

@x
### Substitute with `--env-file`
@y
### Substitute with `--env-file`
@z

@x
You can set default values for multiple environment variables, in an `.env` file and then pass the file as an argument in the CLI.
@y
You can set default values for multiple environment variables, in an `.env` file and then pass the file as an argument in the CLI.
@z

@x
The advantage of this method is that you can store the file anywhere and name it appropriately, for example, 
This file path is relative to the current working directory where the Docker Compose command is executed. Passing the file path is done using the `--env-file` option:
@y
The advantage of this method is that you can store the file anywhere and name it appropriately, for example, 
This file path is relative to the current working directory where the Docker Compose command is executed. Passing the file path is done using the `--env-file` option:
@z

% snip command...

@x
#### Additional information 
@y
#### Additional information 
@z

@x
- This method is useful if you want to temporarily override an `.env` file that is already referenced in your `compose.yaml` file. For example you may have different `.env` files for production ( `.env.prod`) and testing (`.env.test`).
  In the following example, there are two environment files, `.env` and `.env.dev`. Both have different values set for `TAG`. 
@y
- This method is useful if you want to temporarily override an `.env` file that is already referenced in your `compose.yaml` file. For example you may have different `.env` files for production ( `.env.prod`) and testing (`.env.test`).
  In the following example, there are two environment files, `.env` and `.env.dev`. Both have different values set for `TAG`. 
@z
% snip command...
@x
  If the `--env-file` is not used in the command line, the `.env` file is loaded by default:
@y
  If the `--env-file` is not used in the command line, the `.env` file is loaded by default:
@z
% snip command...
@x
  Passing the `--env-file` argument overrides the default file path:
@y
  Passing the `--env-file` argument overrides the default file path:
@z
% snip command...
@x
  When an invalid file path is being passed as an `--env-file` argument, Compose returns an error:
@y
  When an invalid file path is being passed as an `--env-file` argument, Compose returns an error:
@z
% snip command...
@x
- You can use multiple `--env-file` options to specify multiple environment files, and Docker Compose reads them in order. Later files can override variables from earlier files.
@y
- You can use multiple `--env-file` options to specify multiple environment files, and Docker Compose reads them in order. Later files can override variables from earlier files.
@z
% snip command...
@x
- You can override specific environment variables from the command line when starting containers. 
@y
- You can override specific environment variables from the command line when starting containers. 
@z
% snip command...

@x
### local `.env` file versus &lt;project directory&gt; `.env` file
@y
### local `.env` file versus &lt;project directory&gt; `.env` file
@z

@x
An `.env` file can also be used to declare [pre-defined environment variables](envvars.md) used to control Compose behavior and files to be loaded. 
@y
An `.env` file can also be used to declare [pre-defined environment variables](envvars.md) used to control Compose behavior and files to be loaded. 
@z

@x
When executed without an explicit `--env-file` flag, Compose searches for an `.env` file in your working directory ([PWD](https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html#index-PWD)) and loads values 
both for self-configuration and interpolation. If the values in this file define the `COMPOSE_FILE` pre-defined variable, which results in a project directory being set to another folder, 
Compose will load a second `.env` file, if present. This second `.env` file has a lower precedence. 
@y
When executed without an explicit `--env-file` flag, Compose searches for an `.env` file in your working directory ([PWD](https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html#index-PWD)) and loads values 
both for self-configuration and interpolation. If the values in this file define the `COMPOSE_FILE` pre-defined variable, which results in a project directory being set to another folder, 
Compose will load a second `.env` file, if present. This second `.env` file has a lower precedence. 
@z

@x
This mechanism makes it possible to invoke an existing Compose project with a custom set of variables as overrides, without the need to pass environment variables by the command line.
@y
This mechanism makes it possible to invoke an existing Compose project with a custom set of variables as overrides, without the need to pass environment variables by the command line.
@z

% snip command...

@x
### Substitute from the shell 
@y
### Substitute from the shell 
@z

@x
You can use existing environment variables from your host machine or from the shell environment where you execute `docker compose` commands. This lets you dynamically inject values into your Docker Compose configuration at runtime.
For example, suppose the shell contains `POSTGRES_VERSION=9.3` and you supply the following configuration:
@y
You can use existing environment variables from your host machine or from the shell environment where you execute `docker compose` commands. This lets you dynamically inject values into your Docker Compose configuration at runtime.
For example, suppose the shell contains `POSTGRES_VERSION=9.3` and you supply the following configuration:
@z

% snip code...

@x
When you run `docker compose up` with this configuration, Compose looks for the `POSTGRES_VERSION` environment variable in the shell and substitutes its value in. For this example, Compose resolves the image to `postgres:9.3` before running the configuration.
@y
When you run `docker compose up` with this configuration, Compose looks for the `POSTGRES_VERSION` environment variable in the shell and substitutes its value in. For this example, Compose resolves the image to `postgres:9.3` before running the configuration.
@z

@x
If an environment variable is not set, Compose substitutes with an empty string. In the previous example, if `POSTGRES_VERSION` is not set, the value for the image option is `postgres:`.
@y
If an environment variable is not set, Compose substitutes with an empty string. In the previous example, if `POSTGRES_VERSION` is not set, the value for the image option is `postgres:`.
@z

@x
> [!NOTE]
>
> `postgres:` is not a valid image reference. Docker expects either a reference without a tag, like `postgres` which defaults to the latest image, or with a tag such as `postgres:15`.
@y
> [!NOTE]
>
> `postgres:` is not a valid image reference. Docker expects either a reference without a tag, like `postgres` which defaults to the latest image, or with a tag such as `postgres:15`.
@z
