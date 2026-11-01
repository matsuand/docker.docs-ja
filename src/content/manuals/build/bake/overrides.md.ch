%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
title: Overriding configurations
description: Learn how to override configurations in Bake files to build with different attributes.
keywords: build, buildx, bake, buildkit, hcl, json, overrides, configuration
@y
title: Overriding configurations
description: Learn how to override configurations in Bake files to build with different attributes.
keywords: build, buildx, bake, buildkit, hcl, json, overrides, configuration
@z

@x
Bake supports loading build definitions from files, but sometimes you need even
more flexibility to configure these definitions. For example, you might want to
override an attribute when building in a particular environment or for a
specific target.
@y
Bake supports loading build definitions from files, but sometimes you need even
more flexibility to configure these definitions. For example, you might want to
override an attribute when building in a particular environment or for a
specific target.
@z

@x
To override target attributes or the variables used to configure them, use:
@y
To override target attributes or the variables used to configure them, use:
@z

@x
- [File overrides](#file-overrides)
- [CLI overrides](#command-line)
- [Variable overrides](#variables)
- [Environment variable overrides](#environment-variables)
@y
- [File overrides](#file-overrides)
- [CLI overrides](#command-line)
- [Variable overrides](#variables)
- [Environment variable overrides](#environment-variables)
@z

@x
## File overrides
@y
## File overrides
@z

@x
You can load multiple Bake files that define build configurations for your
targets. This is useful when you want to separate configurations into different
files for better organization, or to conditionally override configurations
based on which files are loaded.
@y
You can load multiple Bake files that define build configurations for your
targets. This is useful when you want to separate configurations into different
files for better organization, or to conditionally override configurations
based on which files are loaded.
@z

@x
### Default file lookup
@y
### Default file lookup
@z

@x
You can use the `--file` or `-f` flag to specify which files to load.
If you don't specify any files, Bake will use the following lookup order:
@y
You can use the `--file` or `-f` flag to specify which files to load.
If you don't specify any files, Bake will use the following lookup order:
@z

@x
1. `compose.yaml`
2. `compose.yml`
3. `docker-compose.yml`
4. `docker-compose.yaml`
5. `docker-bake.json`
6. `docker-bake.hcl`
7. `docker-bake.override.json`
8. `docker-bake.override.hcl`
@y
1. `compose.yaml`
2. `compose.yml`
3. `docker-compose.yml`
4. `docker-compose.yaml`
5. `docker-bake.json`
6. `docker-bake.hcl`
7. `docker-bake.override.json`
8. `docker-bake.override.hcl`
@z

@x
If more than one Bake file is found, all files are loaded and merged into a
single definition. Files are merged according to the lookup order.
@y
If more than one Bake file is found, all files are loaded and merged into a
single definition. Files are merged according to the lookup order.
@z

% snip command...

@x
If merged files contain duplicate attribute definitions, those definitions are
either merged or overridden by the last occurrence, depending on the attribute.
@y
If merged files contain duplicate attribute definitions, those definitions are
either merged or overridden by the last occurrence, depending on the attribute.
@z

@x
Bake will attempt to load all of the files in the order they are found. If
multiple files define the same target, attributes are either merged or
overridden. In the case of overrides, the last one loaded takes precedence.
@y
Bake will attempt to load all of the files in the order they are found. If
multiple files define the same target, attributes are either merged or
overridden. In the case of overrides, the last one loaded takes precedence.
@z

@x
For example, given the following files:
@y
For example, given the following files:
@z

% snip code...

@x
Since `docker-bake.override.hcl` is loaded last in the default lookup order,
the `TAG` variable is overridden with the value `bar`.
@y
Since `docker-bake.override.hcl` is loaded last in the default lookup order,
the `TAG` variable is overridden with the value `bar`.
@z

% snip command...

@x
### Manual file overrides
@y
### Manual file overrides
@z

@x
You can use the `--file` flag to explicitly specify which files to load,
and use this as a way to conditionally apply override files.
@y
You can use the `--file` flag to explicitly specify which files to load,
and use this as a way to conditionally apply override files.
@z

@x
For example, you can create a file that defines a set of configurations for a
specific environment, and load it only when building for that environment. The
following example shows how to load an `override.hcl` file that sets the `TAG`
variable to `bar`. The `TAG` variable is then used in the `default` target.
@y
For example, you can create a file that defines a set of configurations for a
specific environment, and load it only when building for that environment. The
following example shows how to load an `override.hcl` file that sets the `TAG`
variable to `bar`. The `TAG` variable is then used in the `default` target.
@z

% snip code...

@x
Printing the build configuration without the `--file` flag shows the `TAG`
variable is set to the default value `foo`.
@y
Printing the build configuration without the `--file` flag shows the `TAG`
variable is set to the default value `foo`.
@z

% snip command...

@x
Using the `--file` flag to load the `overrides.hcl` file overrides the `TAG`
variable with the value `bar`.
@y
Using the `--file` flag to load the `overrides.hcl` file overrides the `TAG`
variable with the value `bar`.
@z

% snip command...

@x
## Command line
@y
## Command line
@z

@x
You can also override target configurations from the command line with the
[`--set` flag](/reference/cli/docker/buildx/bake/#set):
@y
You can also override target configurations from the command line with the
[`--set` flag](__SUBDIR__/reference/cli/docker/buildx/bake/#set):
@z

% snip code...
% snip command...
% snip code...

@x
> [!NOTE]
>
> `--set` is a repeatable flag. For array fields such as `tag`, repeat `--set`
> to provide multiple values or use `+=` to append without replacing.
> An empty assignment, such as `--set app.tag=`, clears the array. Subsequent
> assignments add values to the cleared array. Array literal syntax such as
> `--set app.tag=[a,b]` is not supported.
@y
> [!NOTE]
>
> `--set` is a repeatable flag. For array fields such as `tag`, repeat `--set`
> to provide multiple values or use `+=` to append without replacing.
> An empty assignment, such as `--set app.tag=`, clears the array. Subsequent
> assignments add values to the cleared array. Array literal syntax such as
> `--set app.tag=[a,b]` is not supported.
@z

@x
Override keys use singular names such as `arg`, `secret`, and `tag`. These
names apply to `--set` selectors; Bake file attributes keep their existing
names, such as `args` and `tags`. Older plural override spellings remain
supported as aliases.
@y
Override keys use singular names such as `arg`, `secret`, and `tag`. These
names apply to `--set` selectors; Bake file attributes keep their existing
names, such as `args` and `tags`. Older plural override spellings remain
supported as aliases.
@z

@x
`context` and `contexts` aren't aliases: `context` sets the main build
context, while `contexts.<name>` sets one named context. The alias `secrets`
applies to the secret list override only; `secrets.<id>` is invalid.
@y
`context` and `contexts` aren't aliases: `context` sets the main build
context, while `contexts.<name>` sets one named context. The alias `secrets`
applies to the secret list override only; `secrets.<id>` is invalid.
@z

@x
You can match multiple targets with a pattern. Quote the override so your
shell doesn't expand the pattern before Bake reads it:
@y
You can match multiple targets with a pattern. Quote the override so your
shell doesn't expand the pattern before Bake reads it:
@z

% snip command...

@x
The first and third commands affect targets whose names start with `foo`.
The second sets the platform for all targets. For the full list of override
keys, aliases, pattern syntax, and fields supporting `+=`, see the
[`--set` reference](/reference/cli/docker/buildx/bake/#set).
@y
The first and third commands affect targets whose names start with `foo`.
The second sets the platform for all targets. For the full list of override
keys, aliases, pattern syntax, and fields supporting `+=`, see the
[`--set` reference](__SUBDIR__/reference/cli/docker/buildx/bake/#set).
@z

@x
### Override list attributes
@y
### Override list attributes
@z

@x
Attributes such as `secret`, `ssh`, and `output` can use lists of objects in a
Bake file. In a `--set` value, use the inline syntax of the corresponding
build flag, rather than an HCL object or array. For example, `secret` uses the
same `id=...,src=...` syntax as
[`build --secret`](/reference/cli/docker/buildx/build/#secret).
@y
Attributes such as `secret`, `ssh`, and `output` can use lists of objects in a
Bake file. In a `--set` value, use the inline syntax of the corresponding
build flag, rather than an HCL object or array. For example, `secret` uses the
same `id=...,src=...` syntax as
[`build --secret`](__SUBDIR__/reference/cli/docker/buildx/build/#secret).
@z

@x
Use `=` to replace the secret list, `+=` to add a secret, or an empty value
to clear the list:
@y
Use `=` to replace the secret list, `+=` to add a secret, or an empty value
to clear the list:
@z

% snip command...

@x
These operations affect the list as a whole. To change only the source of one
declared secret while preserving the others, use `secret.<id>`.
@y
These operations affect the list as a whole. To change only the source of one
declared secret while preserving the others, use `secret.<id>`.
@z

@x
### Override a secret source
@y
### Override a secret source
@z

@x
Use `--set <target>.secret.<id>=<source>` to change the source of an existing
secret without replacing the target's secret list. The secret ID must already
be declared by the target.
@y
Use `--set <target>.secret.<id>=<source>` to change the source of an existing
secret without replacing the target's secret list. The secret ID must already
be declared by the target.
@z

@x
For example, declare an `aws` secret in the Bake file:
@y
For example, declare an `aws` secret in the Bake file:
@z

% snip code...

@x
Supply its value from an environment variable or a different file:
@y
Supply its value from an environment variable or a different file:
@z

% snip command...

@x
The build still receives the secret as `aws`. Other declared secrets keep
their sources. The override fails if the target doesn't declare `aws`, or if
an `id=` in the override value names a different secret. This form doesn't
support `+=`.
@y
The build still receives the secret as `aws`. Other declared secrets keep
their sources. The override fails if the target doesn't declare `aws`, or if
an `id=` in the override value names a different secret. This form doesn't
support `+=`.
@z

@x
Named source overrides are applied after secret list overrides, so the ID
must exist in the resulting list. The value describes the complete source
using `env=...` or `src=...`; it doesn't address an object field such as
`secret.aws.env`.
@y
Named source overrides are applied after secret list overrides, so the ID
must exist in the resulting list. The value describes the complete source
using `env=...` or `src=...`; it doesn't address an object field such as
`secret.aws.env`.
@z

@x
### Override resource limits
@y
### Override resource limits
@z

@x
Use `--set <target>.resource.<name>=<value>` to change a resource limit for
the containers that run build steps. For example, override memory and CPU
limits for an `app` target:
@y
Use `--set <target>.resource.<name>=<value>` to change a resource limit for
the containers that run build steps. For example, override memory and CPU
limits for an `app` target:
@z

% snip command...

@x
Supported names are `memory`, `memory-swap`, `cpu-shares`, `cpu-period`,
`cpu-quota`, `cpuset-cpus`, and `cpuset-mems`. Each override changes only the
named limit, preserving other limits from the Bake definition. Resource
overrides don't support `+=`.
@y
Supported names are `memory`, `memory-swap`, `cpu-shares`, `cpu-period`,
`cpu-quota`, `cpuset-cpus`, and `cpuset-mems`. Each override changes only the
named limit, preserving other limits from the Bake definition. Resource
overrides don't support `+=`.
@z

@x
These limits require a BuildKit daemon with per-step resource limit support
and take effect on Linux. They control resources within a build step, rather
than how many Bake targets run concurrently. See the
[`--resource` reference](/reference/cli/docker/buildx/build/#resource) for
units and supported values, and the
[`resources` attribute](./reference.md#targetresources) for file configuration.
@y
These limits require a BuildKit daemon with per-step resource limit support
and take effect on Linux. They control resources within a build step, rather
than how many Bake targets run concurrently. See the
[`--resource` reference](__SUBDIR__/reference/cli/docker/buildx/build/#resource) for
units and supported values, and the
[`resources` attribute](./reference.md#targetresources) for file configuration.
@z

@x
## Variables
@y
## Variables
@z

@x
Use `--var NAME=value` to override a declared Bake variable for a single
invocation. For example, set `TAG` without exporting it in your shell:
@y
Use `--var NAME=value` to override a declared Bake variable for a single
invocation. For example, set `TAG` without exporting it in your shell:
@z

% snip command...

@x
The value takes precedence over an environment variable with the same name.
Unlike `--set webapp.tags=...`, this changes the variable wherever the Bake
definition uses it. See
[Override variable values](./variables.md#override-variable-values) for
precedence, types, and repeated flags.
@y
The value takes precedence over an environment variable with the same name.
Unlike `--set webapp.tags=...`, this changes the variable wherever the Bake
definition uses it. See
[Override variable values](./variables.md#override-variable-values) for
precedence, types, and repeated flags.
@z

@x
## Environment variables
@y
## Environment variables
@z

@x
You can also use environment variables to override configurations.
@y
You can also use environment variables to override configurations.
@z

@x
Bake lets you use environment variables to override the value of a `variable`
block. Only `variable` blocks can be overridden with environment variables.
This means you need to define the variables in the bake file and then set the
environment variable with the same name to override it.
@y
Bake lets you use environment variables to override the value of a `variable`
block. Only `variable` blocks can be overridden with environment variables.
This means you need to define the variables in the bake file and then set the
environment variable with the same name to override it.
@z

@x
To disable these lookups, set `BUILDX_BAKE_DISABLE_VARS_ENV_LOOKUP=1`; see the
[variable reference](../building/variables.md#buildx_bake_disable_vars_env_lookup).
You can still provide variable values explicitly with `--var NAME=value`.
@y
To disable these lookups, set `BUILDX_BAKE_DISABLE_VARS_ENV_LOOKUP=1`; see the
[variable reference](../building/variables.md#buildx_bake_disable_vars_env_lookup).
You can still provide variable values explicitly with `--var NAME=value`.
@z

@x
The following example shows how you can define a `TAG` variable with a default
value in the Bake file, and override it with an environment variable.
@y
The following example shows how you can define a `TAG` variable with a default
value in the Bake file, and override it with an environment variable.
@z

% snip code...
% snip command...

@x
The `TAG` variable is overridden with the value of the environment variable,
which is the short commit hash generated by `git rev-parse --short HEAD`.
@y
The `TAG` variable is overridden with the value of the environment variable,
which is the short commit hash generated by `git rev-parse --short HEAD`.
@z

% snip code...

@x
### Type coercion
@y
### Type coercion
@z

@x
Overriding non-string variables with environment variables is supported. Values
passed as environment variables are coerced into suitable types first.
@y
Overriding non-string variables with environment variables is supported. Values
passed as environment variables are coerced into suitable types first.
@z

@x
The following example defines a `PORT` variable. The `backend` target uses the
`PORT` variable as-is, and the `frontend` target uses the value of `PORT`
incremented by one.
@y
The following example defines a `PORT` variable. The `backend` target uses the
`PORT` variable as-is, and the `frontend` target uses the value of `PORT`
incremented by one.
@z

% snip code...

@x
Overriding `PORT` using an environment variable will first coerce the value
into the expected type, an integer, before the expression in the `frontend`
target runs.
@y
Overriding `PORT` using an environment variable will first coerce the value
into the expected type, an integer, before the expression in the `frontend`
target runs.
@z

% snip command...
% snip code...
