%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Bake file reference
@y
title: Bake ファイルリファレンス
@z

@x
The Bake file is a file for defining workflows that you run using `docker buildx bake`.
@y
Bake ファイルは `docker buildx bake` を使って実行するワークフローを定義するファイルです。
@z

@x
## File format
@y
## ファイルフォーマット {#file-format}
@z

@x
You can define your Bake file in the following file formats:
@y
Bake ファイルは以下に示すファイルフォーマットによって定義することができます。
@z

@x
- HashiCorp Configuration Language (HCL)
- JSON
- YAML (Compose file)
@y
- HashiCorp Configuration Language (HCL)
- JSON
- YAML (Compose ファイル)
@z

@x
By default, Bake uses the following lookup order to find the configuration file:
@y
デフォルトにおいて Bake では、以下の順に設定ファイルを探します。
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
You can specify the file location explicitly using the `--file` flag:
@y
`--file` フラグを使えば、ファイルの場所を明示的に指定することができます。
@z

% snip command...

@x
If you don't specify a file explicitly, Bake searches for the file in the
current working directory. If more than one Bake file is found, all files are
merged into a single definition. Files are merged according to the lookup
order. That means that if your project contains both a `compose.yaml` file and
a `docker-bake.hcl` file, Bake loads the `compose.yaml` file first, and then
the `docker-bake.hcl` file.
@y
If you don't specify a file explicitly, Bake searches for the file in the
current working directory. If more than one Bake file is found, all files are
merged into a single definition. Files are merged according to the lookup
order. That means that if your project contains both a `compose.yaml` file and
a `docker-bake.hcl` file, Bake loads the `compose.yaml` file first, and then
the `docker-bake.hcl` file.
@z

@x
If merged files contain duplicate attribute definitions, those definitions are
either merged or overridden by the last occurrence, depending on the attribute.
The following attributes are overridden by the last occurrence:
@y
If merged files contain duplicate attribute definitions, those definitions are
either merged or overridden by the last occurrence, depending on the attribute.
The following attributes are overridden by the last occurrence:
@z

@x
- `target.cache-to`
- `target.dockerfile-inline`
- `target.dockerfile`
- `target.outputs`
- `target.platforms`
- `target.pull`
- `target.tags`
- `target.target`
@y
- `target.cache-to`
- `target.dockerfile-inline`
- `target.dockerfile`
- `target.outputs`
- `target.platforms`
- `target.pull`
- `target.tags`
- `target.target`
@z

@x
For example, if `compose.yaml` and `docker-bake.hcl` both define the `tags`
attribute, the `docker-bake.hcl` is used.
@y
For example, if `compose.yaml` and `docker-bake.hcl` both define the `tags`
attribute, the `docker-bake.hcl` is used.
@z

% snip command...

@x
All other attributes are merged. For example, if `compose.yaml` and
`docker-bake.hcl` both define unique entries for the `labels` attribute, all
entries are included. Duplicate entries for the same label are overridden.
@y
All other attributes are merged. For example, if `compose.yaml` and
`docker-bake.hcl` both define unique entries for the `labels` attribute, all
entries are included. Duplicate entries for the same label are overridden.
@z

% snip command...

@x
## Syntax
@y
## Syntax
@z

@x
The Bake file supports the following property types:
@y
The Bake file supports the following property types:
@z

@x
- `target`: build targets
- `group`: collections of build targets
- `variable`: build arguments and variables
- `function`: custom Bake functions
@y
- `target`: build targets
- `group`: collections of build targets
- `variable`: build arguments and variables
- `function`: custom Bake functions
@z

@x
You define properties as hierarchical blocks in the Bake file.
You can assign one or more attributes to a property.
@y
You define properties as hierarchical blocks in the Bake file.
You can assign one or more attributes to a property.
@z

@x
The following snippet shows a JSON representation of a simple Bake file.
This Bake file defines three properties: a variable, a group, and a target.
@y
The following snippet shows a JSON representation of a simple Bake file.
This Bake file defines three properties: a variable, a group, and a target.
@z

% snip code...

@x
In the JSON representation of a Bake file, properties are objects,
and attributes are values assigned to those objects.
@y
In the JSON representation of a Bake file, properties are objects,
and attributes are values assigned to those objects.
@z

@x
The following example shows the same Bake file in the HCL format:
@y
The following example shows the same Bake file in the HCL format:
@z

% snip code...

@x
HCL is the preferred format for Bake files.
Aside from syntactic differences,
HCL lets you use features that the JSON and YAML formats don't support.
@y
HCL is the preferred format for Bake files.
Aside from syntactic differences,
HCL lets you use features that the JSON and YAML formats don't support.
@z

@x
The examples in this document use the HCL format.
@y
The examples in this document use the HCL format.
@z

@x
## Target
@y
## Target
@z

@x
A target reflects a single `docker build` invocation.
Consider the following build command:
@y
A target reflects a single `docker build` invocation.
Consider the following build command:
@z

% snip command...

@x
You can express this command in a Bake file as follows:
@y
You can express this command in a Bake file as follows:
@z

% snip code...

@x
The following table shows the complete list of attributes that you can assign to a target:
@y
The following table shows the complete list of attributes that you can assign to a target:
@z

@x
| Name                                            | Type    | Description                                                          |
|-------------------------------------------------|---------|----------------------------------------------------------------------|
| [`args`](#targetargs)                           | Map     | Build arguments                                                      |
| [`annotations`](#targetannotations)             | List    | Exporter annotations                                                 |
| [`attest`](#targetattest)                       | List    | Build attestations                                                   |
| [`cache-from`](#targetcache-from)               | List    | External cache sources                                               |
| [`cache-to`](#targetcache-to)                   | List    | External cache destinations                                          |
| [`call`](#targetcall)                           | String  | Specify the frontend method to call for the target.                  |
| [`context`](#targetcontext)                     | String  | Set of files located in the specified path or URL                    |
| [`contexts`](#targetcontexts)                   | Map     | Additional build contexts                                            |
| [`description`](#targetdescription)             | String  | Description of a target                                              |
| [`dockerfile-inline`](#targetdockerfile-inline) | String  | Inline Dockerfile string                                             |
| [`dockerfile`](#targetdockerfile)               | String  | Dockerfile location                                                  |
| [`entitlements`](#targetentitlements)           | List    | Permissions that the build process requires to run                   |
| [`extra-hosts`](#targetextra-hosts)             | List    | Customs host-to-IP mapping                                           |
| [`inherits`](#targetinherits)                   | List    | Inherit attributes from other targets                                |
| [`labels`](#targetlabels)                       | Map     | Metadata for images                                                  |
| [`matrix`](#targetmatrix)                       | Map     | Define a set of variables that forks a target into multiple targets. |
| [`name`](#targetname)                           | String  | Override the target name when using a matrix.                        |
| [`no-cache-filter`](#targetno-cache-filter)     | List    | Disable build cache for specific stages                              |
| [`no-cache`](#targetno-cache)                   | Boolean | Disable build cache completely                                       |
| [`output`](#targetoutput)                       | List    | Output destinations                                                  |
| [`platforms`](#targetplatforms)                 | List    | Target platforms                                                     |
| [`pull`](#targetpull)                           | Boolean | Always pull images                                                   |
| [`secret`](#targetsecret)                       | List    | Secrets to expose to the build                                       |
| [`shm-size`](#targetshm-size)                   | List    | Size of `/dev/shm`                                                   |
| [`ssh`](#targetssh)                             | List    | SSH agent sockets or keys to expose to the build                     |
| [`tags`](#targettags)                           | List    | Image names and tags                                                 |
| [`target`](#targettarget)                       | String  | Target build stage                                                   |
| [`ulimits`](#targetulimits)                     | List    | Ulimit options                                                       |
@y
| Name                                            | Type    | Description                                                          |
|-------------------------------------------------|---------|----------------------------------------------------------------------|
| [`args`](#targetargs)                           | Map     | Build arguments                                                      |
| [`annotations`](#targetannotations)             | List    | Exporter annotations                                                 |
| [`attest`](#targetattest)                       | List    | Build attestations                                                   |
| [`cache-from`](#targetcache-from)               | List    | External cache sources                                               |
| [`cache-to`](#targetcache-to)                   | List    | External cache destinations                                          |
| [`call`](#targetcall)                           | String  | Specify the frontend method to call for the target.                  |
| [`context`](#targetcontext)                     | String  | Set of files located in the specified path or URL                    |
| [`contexts`](#targetcontexts)                   | Map     | Additional build contexts                                            |
| [`description`](#targetdescription)             | String  | Description of a target                                              |
| [`dockerfile-inline`](#targetdockerfile-inline) | String  | Inline Dockerfile string                                             |
| [`dockerfile`](#targetdockerfile)               | String  | Dockerfile location                                                  |
| [`entitlements`](#targetentitlements)           | List    | Permissions that the build process requires to run                   |
| [`extra-hosts`](#targetextra-hosts)             | List    | Customs host-to-IP mapping                                           |
| [`inherits`](#targetinherits)                   | List    | Inherit attributes from other targets                                |
| [`labels`](#targetlabels)                       | Map     | Metadata for images                                                  |
| [`matrix`](#targetmatrix)                       | Map     | Define a set of variables that forks a target into multiple targets. |
| [`name`](#targetname)                           | String  | Override the target name when using a matrix.                        |
| [`no-cache-filter`](#targetno-cache-filter)     | List    | Disable build cache for specific stages                              |
| [`no-cache`](#targetno-cache)                   | Boolean | Disable build cache completely                                       |
| [`output`](#targetoutput)                       | List    | Output destinations                                                  |
| [`platforms`](#targetplatforms)                 | List    | Target platforms                                                     |
| [`pull`](#targetpull)                           | Boolean | Always pull images                                                   |
| [`secret`](#targetsecret)                       | List    | Secrets to expose to the build                                       |
| [`shm-size`](#targetshm-size)                   | List    | Size of `/dev/shm`                                                   |
| [`ssh`](#targetssh)                             | List    | SSH agent sockets or keys to expose to the build                     |
| [`tags`](#targettags)                           | List    | Image names and tags                                                 |
| [`target`](#targettarget)                       | String  | Target build stage                                                   |
| [`ulimits`](#targetulimits)                     | List    | Ulimit options                                                       |
@z

@x
### `target.args`
@y
### `target.args`
@z

@x
Use the `args` attribute to define build arguments for the target.
This has the same effect as passing a [`--build-arg`][build-arg] flag to the build command.
@y
Use the `args` attribute to define build arguments for the target.
This has the same effect as passing a [`--build-arg`][build-arg] flag to the build command.
@z

% snip code...

@x
You can set `args` attributes to use `null` values.
Doing so forces the `target` to use the `ARG` value specified in the Dockerfile.
@y
You can set `args` attributes to use `null` values.
Doing so forces the `target` to use the `ARG` value specified in the Dockerfile.
@z

% snip code...

@x
### `target.annotations`
@y
### `target.annotations`
@z

@x
The `annotations` attribute lets you add annotations to images built with bake.
The key takes a list of annotations, in the format of `KEY=VALUE`.
@y
The `annotations` attribute lets you add annotations to images built with bake.
The key takes a list of annotations, in the format of `KEY=VALUE`.
@z

% snip code...

@x
By default, the annotation is added to image manifests. You can configure the
level of the annotations by adding a prefix to the annotation, containing a
comma-separated list of all the levels that you want to annotate. The following
example adds annotations to both the image index and manifests.
@y
By default, the annotation is added to image manifests. You can configure the
level of the annotations by adding a prefix to the annotation, containing a
comma-separated list of all the levels that you want to annotate. The following
example adds annotations to both the image index and manifests.
@z

% snip code...

@x
Read about the supported levels in
[Specifying annotation levels](https://docs.docker.com/build/building/annotations/#specifying-annotation-levels).
@y
Read about the supported levels in
[Specifying annotation levels](https://docs.docker.com/build/building/annotations/#specifying-annotation-levels).
@z

@x
### `target.attest`
@y
### `target.attest`
@z

@x
The `attest` attribute lets you apply [build attestations][attestations] to the target.
This attribute accepts the long-form CSV version of attestation parameters.
@y
The `attest` attribute lets you apply [build attestations][attestations] to the target.
This attribute accepts the long-form CSV version of attestation parameters.
@z

% snip code...

@x
### `target.cache-from`
@y
### `target.cache-from`
@z

@x
Build cache sources.
The builder imports cache from the locations you specify.
It uses the [Buildx cache storage backends][cache-backends],
and it works the same way as the [`--cache-from`][cache-from] flag.
This takes a list value, so you can specify multiple cache sources.
@y
Build cache sources.
The builder imports cache from the locations you specify.
It uses the [Buildx cache storage backends][cache-backends],
and it works the same way as the [`--cache-from`][cache-from] flag.
This takes a list value, so you can specify multiple cache sources.
@z

% snip code...

@x
### `target.cache-to`
@y
### `target.cache-to`
@z

@x
Build cache export destinations.
The builder exports its build cache to the locations you specify.
It uses the [Buildx cache storage backends][cache-backends],
and it works the same way as the [`--cache-to` flag][cache-to].
This takes a list value, so you can specify multiple cache export targets.
@y
Build cache export destinations.
The builder exports its build cache to the locations you specify.
It uses the [Buildx cache storage backends][cache-backends],
and it works the same way as the [`--cache-to` flag][cache-to].
This takes a list value, so you can specify multiple cache export targets.
@z

% snip code...

@x
### `target.call`
@y
### `target.call`
@z

@x
Specifies the frontend method to use. Frontend methods let you, for example,
execute build checks only, instead of running a build. This is the same as the
`--call` flag.
@y
Specifies the frontend method to use. Frontend methods let you, for example,
execute build checks only, instead of running a build. This is the same as the
`--call` flag.
@z

% snip code...

@x
For more information about frontend methods, refer to the CLI reference for
[`docker buildx build --call`](https://docs.docker.com/reference/cli/docker/buildx/build/#call).
@y
For more information about frontend methods, refer to the CLI reference for
[`docker buildx build --call`](https://docs.docker.com/reference/cli/docker/buildx/build/#call).
@z

@x
### `target.context`
@y
### `target.context`
@z

@x
Specifies the location of the build context to use for this target.
Accepts a URL or a directory path.
This is the same as the [build context][context] positional argument
that you pass to the build command.
@y
Specifies the location of the build context to use for this target.
Accepts a URL or a directory path.
This is the same as the [build context][context] positional argument
that you pass to the build command.
@z

% snip code...

@x
This resolves to the current working directory (`"."`) by default.
@y
This resolves to the current working directory (`"."`) by default.
@z

% snip command...

@x
### `target.contexts`
@y
### `target.contexts`
@z

@x
Additional build contexts.
This is the same as the [`--build-context` flag][build-context].
This attribute takes a map, where keys result in named contexts that you can
reference in your builds.
@y
Additional build contexts.
This is the same as the [`--build-context` flag][build-context].
This attribute takes a map, where keys result in named contexts that you can
reference in your builds.
@z

@x
You can specify different types of contexts, such local directories, Git URLs,
and even other Bake targets. Bake automatically determines the type of
a context based on the pattern of the context value.
@y
You can specify different types of contexts, such local directories, Git URLs,
and even other Bake targets. Bake automatically determines the type of
a context based on the pattern of the context value.
@z

@x
| Context type    | Example                                   |
| --------------- | ----------------------------------------- |
| Container image | `docker-image://alpine@sha256:0123456789` |
| Git URL         | `https://github.com/user/proj.git`        |
| HTTP URL        | `https://example.com/files`               |
| Local directory | `../path/to/src`                          |
| Bake target     | `target:base`                             |
@y
| Context type    | Example                                   |
| --------------- | ----------------------------------------- |
| Container image | `docker-image://alpine@sha256:0123456789` |
| Git URL         | `https://github.com/user/proj.git`        |
| HTTP URL        | `https://example.com/files`               |
| Local directory | `../path/to/src`                          |
| Bake target     | `target:base`                             |
@z

@x
#### Pin an image version
@y
#### Pin an image version
@z

% snip code...
% snip code...

@x
#### Use a local directory
@y
#### Use a local directory
@z

% snip code...
% snip code...

@x
#### Use another target as base
@y
#### Use another target as base
@z

@x
> [!NOTE]
> You should prefer to use regular multi-stage builds over this option. You can
> Use this feature when you have multiple Dockerfiles that can't be easily
> merged into one.
@y
> [!NOTE]
> You should prefer to use regular multi-stage builds over this option. You can
> Use this feature when you have multiple Dockerfiles that can't be easily
> merged into one.
@z

% snip code...
% snip code...

@x
### `target.dockerfile-inline`
@y
### `target.dockerfile-inline`
@z

@x
Uses the string value as an inline Dockerfile for the build target.
@y
Uses the string value as an inline Dockerfile for the build target.
@z

% snip code...

@x
The `dockerfile-inline` takes precedence over the `dockerfile` attribute.
If you specify both, Bake uses the inline version.
@y
The `dockerfile-inline` takes precedence over the `dockerfile` attribute.
If you specify both, Bake uses the inline version.
@z

@x
### `target.dockerfile`
@y
### `target.dockerfile`
@z

@x
Name of the Dockerfile to use for the build.
This is the same as the [`--file` flag][file] for the `docker build` command.
@y
Name of the Dockerfile to use for the build.
This is the same as the [`--file` flag][file] for the `docker build` command.
@z

% snip code...

@x
Resolves to `"Dockerfile"` by default.
@y
Resolves to `"Dockerfile"` by default.
@z

% snip command...

@x
### `target.inherits`
@y
### `target.inherits`
@z

@x
A target can inherit attributes from other targets.
Use `inherits` to reference from one target to another.
@y
A target can inherit attributes from other targets.
Use `inherits` to reference from one target to another.
@z

@x
In the following example,
the `app-dev` target specifies an image name and tag.
The `app-release` target uses `inherits` to reuse the tag name.
@y
In the following example,
the `app-dev` target specifies an image name and tag.
The `app-release` target uses `inherits` to reuse the tag name.
@z

% snip code...

@x
The `inherits` attribute is a list,
meaning you can reuse attributes from multiple other targets.
In the following example, the `app-release` target reuses attributes
from both the `app-dev` and `_release` targets.
@y
The `inherits` attribute is a list,
meaning you can reuse attributes from multiple other targets.
In the following example, the `app-release` target reuses attributes
from both the `app-dev` and `_release` targets.
@z

% snip code...

@x
When inheriting attributes from multiple targets and there's a conflict,
the target that appears last in the `inherits` list takes precedence.
The previous example defines the `BUILDX_EXPERIMENTAL` argument twice for the `app-release` target.
It resolves to `0` because the `_release` target appears last in the inheritance chain:
@y
When inheriting attributes from multiple targets and there's a conflict,
the target that appears last in the `inherits` list takes precedence.
The previous example defines the `BUILDX_EXPERIMENTAL` argument twice for the `app-release` target.
It resolves to `0` because the `_release` target appears last in the inheritance chain:
@z

% snip command...

@x
### `target.labels`
@y
### `target.labels`
@z

@x
Assigns image labels to the build.
This is the same as the `--label` flag for `docker build`.
@y
Assigns image labels to the build.
This is the same as the `--label` flag for `docker build`.
@z

% snip code...

@x
It's possible to use a `null` value for labels.
If you do, the builder uses the label value specified in the Dockerfile.
@y
It's possible to use a `null` value for labels.
If you do, the builder uses the label value specified in the Dockerfile.
@z

@x
### `target.matrix`
@y
### `target.matrix`
@z

@x
A matrix strategy lets you fork a single target into multiple different
variants, based on parameters that you specify.
This works in a similar way to [Matrix strategies for GitHub Actions].
You can use this to reduce duplication in your bake definition.
@y
A matrix strategy lets you fork a single target into multiple different
variants, based on parameters that you specify.
This works in a similar way to [Matrix strategies for GitHub Actions].
You can use this to reduce duplication in your bake definition.
@z

@x
The `matrix` attribute is a map of parameter names to lists of values.
Bake builds each possible combination of values as a separate target.
@y
The `matrix` attribute is a map of parameter names to lists of values.
Bake builds each possible combination of values as a separate target.
@z

@x
Each generated target **must** have a unique name.
To specify how target names should resolve, use the `name` attribute.
@y
Each generated target **must** have a unique name.
To specify how target names should resolve, use the `name` attribute.
@z

@x
The following example resolves the `app` target to `app-foo` and `app-bar`.
It also uses the matrix value to define the [target build stage](#targettarget).
@y
The following example resolves the `app` target to `app-foo` and `app-bar`.
It also uses the matrix value to define the [target build stage](#targettarget).
@z

% snip code...
% snip command...

@x
#### Multiple axes
@y
#### Multiple axes
@z

@x
You can specify multiple keys in your matrix to fork a target on multiple axes.
When using multiple matrix keys, Bake builds every possible variant.
@y
You can specify multiple keys in your matrix to fork a target on multiple axes.
When using multiple matrix keys, Bake builds every possible variant.
@z

@x
The following example builds four targets:
@y
The following example builds four targets:
@z

@x
- `app-foo-1-0`
- `app-foo-2-0`
- `app-bar-1-0`
- `app-bar-2-0`
@y
- `app-foo-1-0`
- `app-foo-2-0`
- `app-bar-1-0`
- `app-bar-2-0`
@z

% snip code...

@x
#### Multiple values per matrix target
@y
#### Multiple values per matrix target
@z

@x
If you want to differentiate the matrix on more than just a single value,
you can use maps as matrix values. Bake creates a target for each map,
and you can access the nested values using dot notation.
@y
If you want to differentiate the matrix on more than just a single value,
you can use maps as matrix values. Bake creates a target for each map,
and you can access the nested values using dot notation.
@z

@x
The following example builds two targets:
@y
The following example builds two targets:
@z

@x
- `app-foo-1-0`
- `app-bar-2-0`
@y
- `app-foo-1-0`
- `app-bar-2-0`
@z

% snip code...

@x
### `target.name`
@y
### `target.name`
@z

@x
Specify name resolution for targets that use a matrix strategy.
The following example resolves the `app` target to `app-foo` and `app-bar`.
@y
Specify name resolution for targets that use a matrix strategy.
The following example resolves the `app` target to `app-foo` and `app-bar`.
@z

% snip code...

@x
### `target.no-cache-filter`
@y
### `target.no-cache-filter`
@z

@x
Don't use build cache for the specified stages.
This is the same as the `--no-cache-filter` flag for `docker build`.
The following example avoids build cache for the `foo` build stage.
@y
Don't use build cache for the specified stages.
This is the same as the `--no-cache-filter` flag for `docker build`.
The following example avoids build cache for the `foo` build stage.
@z

% snip code...

@x
### `target.no-cache`
@y
### `target.no-cache`
@z

@x
Don't use cache when building the image.
This is the same as the `--no-cache` flag for `docker build`.
@y
Don't use cache when building the image.
This is the same as the `--no-cache` flag for `docker build`.
@z

% snip code...

@x
### `target.output`
@y
### `target.output`
@z

@x
Configuration for exporting the build output.
This is the same as the [`--output` flag][output].
The following example configures the target to use a cache-only output,
@y
Configuration for exporting the build output.
This is the same as the [`--output` flag][output].
The following example configures the target to use a cache-only output,
@z

% snip code...

@x
### `target.platforms`
@y
### `target.platforms`
@z

@x
Set target platforms for the build target.
This is the same as the [`--platform` flag][platform].
The following example creates a multi-platform build for three architectures.
@y
Set target platforms for the build target.
This is the same as the [`--platform` flag][platform].
The following example creates a multi-platform build for three architectures.
@z

% snip code...

@x
### `target.pull`
@y
### `target.pull`
@z

@x
Configures whether the builder should attempt to pull images when building the target.
This is the same as the `--pull` flag for `docker build`.
The following example forces the builder to always pull all images referenced in the build target.
@y
Configures whether the builder should attempt to pull images when building the target.
This is the same as the `--pull` flag for `docker build`.
The following example forces the builder to always pull all images referenced in the build target.
@z

% snip code...

@x
### `target.secret`
@y
### `target.secret`
@z

@x
Defines secrets to expose to the build target.
This is the same as the [`--secret` flag][secret].
@y
Defines secrets to expose to the build target.
This is the same as the [`--secret` flag][secret].
@z

% snip code...

@x
This lets you [mount the secret][run_mount_secret] in your Dockerfile.
@y
This lets you [mount the secret][run_mount_secret] in your Dockerfile.
@z

% snip code...

@x
### `target.ssh`
@y
### `target.ssh`
@z

@x
Defines SSH agent sockets or keys to expose to the build.
This is the same as the [`--ssh` flag][ssh].
This can be useful if you need to access private repositories during a build.
@y
Defines SSH agent sockets or keys to expose to the build.
This is the same as the [`--ssh` flag][ssh].
This can be useful if you need to access private repositories during a build.
@z

% snip code...
% snip code...

@x
### `target.tags`
@y
### `target.tags`
@z

@x
Image names and tags to use for the build target.
This is the same as the [`--tag` flag][tag].
@y
Image names and tags to use for the build target.
This is the same as the [`--tag` flag][tag].
@z

% snip code...

@x
### `target.target`
@y
### `target.target`
@z

@x
Set the target build stage to build.
This is the same as the [`--target` flag][target].
@y
Set the target build stage to build.
This is the same as the [`--target` flag][target].
@z

% snip code...

@x
## Group
@y
## Group
@z

@x
Groups allow you to invoke multiple builds (targets) at once.
@y
Groups allow you to invoke multiple builds (targets) at once.
@z

% snip code...

@x
Groups take precedence over targets, if both exist with the same name.
The following bake file builds the `default` group.
Bake ignores the `default` target.
@y
Groups take precedence over targets, if both exist with the same name.
The following bake file builds the `default` group.
Bake ignores the `default` target.
@z

% snip code...

@x
## Variable
@y
## Variable
@z

@x
The HCL file format supports variable block definitions.
You can use variables as build arguments in your Dockerfile,
or interpolate them in attribute values in your Bake file.
@y
The HCL file format supports variable block definitions.
You can use variables as build arguments in your Dockerfile,
or interpolate them in attribute values in your Bake file.
@z

% snip code...

@x
You can assign a default value for a variable in the Bake file,
or assign a `null` value to it. If you assign a `null` value,
Buildx uses the default value from the Dockerfile instead.
@y
You can assign a default value for a variable in the Bake file,
or assign a `null` value to it. If you assign a `null` value,
Buildx uses the default value from the Dockerfile instead.
@z

@x
You can also add a description of the variable's purpose with the `description` field. This attribute is useful when combined with the `docker buildx bake --list=variables` option, providing a more informative output when listing the available variables in a Bake file.
@y
You can also add a description of the variable's purpose with the `description` field. This attribute is useful when combined with the `docker buildx bake --list=variables` option, providing a more informative output when listing the available variables in a Bake file.
@z

@x
You can override variable defaults set in the Bake file using environment variables.
The following example sets the `TAG` variable to `dev`,
overriding the default `latest` value shown in the previous example.
@y
You can override variable defaults set in the Bake file using environment variables.
The following example sets the `TAG` variable to `dev`,
overriding the default `latest` value shown in the previous example.
@z

% snip command...

@x
### Built-in variables
@y
### Built-in variables
@z

@x
The following variables are built-ins that you can use with Bake without having
to define them.
@y
The following variables are built-ins that you can use with Bake without having
to define them.
@z

@x
| Variable              | Description                                                                         |
| --------------------- | ----------------------------------------------------------------------------------- |
| `BAKE_CMD_CONTEXT`    | Holds the main context when building using a remote Bake file.                      |
| `BAKE_LOCAL_PLATFORM` | Returns the current platform’s default platform specification (e.g. `linux/amd64`). |
@y
| Variable              | Description                                                                         |
| --------------------- | ----------------------------------------------------------------------------------- |
| `BAKE_CMD_CONTEXT`    | Holds the main context when building using a remote Bake file.                      |
| `BAKE_LOCAL_PLATFORM` | Returns the current platform’s default platform specification (e.g. `linux/amd64`). |
@z

@x
### Use environment variable as default
@y
### Use environment variable as default
@z

@x
You can set a Bake variable to use the value of an environment variable as a default value:
@y
You can set a Bake variable to use the value of an environment variable as a default value:
@z

% snip code...

@x
### Interpolate variables into attributes
@y
### Interpolate variables into attributes
@z

@x
To interpolate a variable into an attribute string value,
you must use curly brackets.
The following doesn't work:
@y
To interpolate a variable into an attribute string value,
you must use curly brackets.
The following doesn't work:
@z

% snip code...

@x
Wrap the variable in curly brackets where you want to insert it:
@y
Wrap the variable in curly brackets where you want to insert it:
@z

% snip code...

@x
Before you can interpolate a variable into an attribute,
first you must declare it in the bake file,
as demonstrated in the following example.
@y
Before you can interpolate a variable into an attribute,
first you must declare it in the bake file,
as demonstrated in the following example.
@z

% snip command...

@x
## Function
@y
## Function
@z

@x
A [set of general-purpose functions][bake_stdlib] provided by [go-cty][go-cty]
are available for use in HCL files:
@y
A [set of general-purpose functions][bake_stdlib] provided by [go-cty][go-cty]
are available for use in HCL files:
@z

% snip code...

@x
In addition, [user defined functions][userfunc]
are also supported:
@y
In addition, [user defined functions][userfunc]
are also supported:
@z

% snip code...

@x
> [!NOTE]
> See [User defined HCL functions][hcl-funcs] page for more details.
@y
> [!NOTE]
> See [User defined HCL functions][hcl-funcs] page for more details.
@z

% snip links...
