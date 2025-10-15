%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
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
The following list of attributes can be overridden:
@y
The following list of attributes can be overridden:
@z

% snip attributes...

@x
To override these attributes, you can use the following methods:
@y
To override these attributes, you can use the following methods:
@z

@x
- [File overrides](#file-overrides)
- [CLI overrides](#command-line)
- [Environment variable overrides](#environment-variables)
@y
- [File overrides](#file-overrides)
- [CLI overrides](#command-line)
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
[`--set` flag](/reference/cli/docker/buildx/bake.md#set):
@y
You can also override target configurations from the command line with the
[`--set` flag](reference/cli/docker/buildx/bake.md#set):
@z

% snip code...
% snip command...
% snip output...

@x
> [!NOTE]
>
> `--set` is a repeatable flag. For array fields such as `tags`, repeat `--set` to provide multiple values or use the `+=` operator to append without replacing.
> Array literal syntax like `--set target.tags=[a,b]` is not supported.
> The `platform` field is a special case. It also accepts a comma-separated list.
@y
> [!NOTE]
>
> `--set` is a repeatable flag. For array fields such as `tags`, repeat `--set` to provide multiple values or use the `+=` operator to append without replacing.
> Array literal syntax like `--set target.tags=[a,b]` is not supported.
> The `platform` field is a special case. It also accepts a comma-separated list.
@z

@x
Pattern matching syntax defined in [https://golang.org/pkg/path/#Match](https://golang.org/pkg/path/#Match)
is also supported:
@y
Pattern matching syntax defined in [https://golang.org/pkg/path/#Match](https://golang.org/pkg/path/#Match)
is also supported:
@z

% snip command...

@x
Complete list of attributes that can be overridden with `--set` are:
@y
Complete list of attributes that can be overridden with `--set` are:
@z

% snip attributes...

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
% snip output...
