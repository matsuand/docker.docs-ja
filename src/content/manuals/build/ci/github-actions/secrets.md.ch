%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
title: Using secrets with GitHub Actions
linkTitle: Build secrets
description: Example using secret mounts with GitHub Actions
keywords: ci, github actions, gha, buildkit, buildx, secret
@y
title: Using secrets with GitHub Actions
linkTitle: Build secrets
description: Example using secret mounts with GitHub Actions
keywords: ci, github actions, gha, buildkit, buildx, secret
@z

@x
A build secret is sensitive information, such as a password or API token, consumed as part of the build process.
Docker Build supports two forms of secrets:
@y
A build secret is sensitive information, such as a password or API token, consumed as part of the build process.
Docker Build supports two forms of secrets:
@z

@x
- [Secret mounts](#secret-mounts) add secrets as files in the build container
  (under `/run/secrets` by default).
- [SSH mounts](#ssh-mounts) add SSH agent sockets or keys into the build container.
@y
- [Secret mounts](#secret-mounts) add secrets as files in the build container
  (under `/run/secrets` by default).
- [SSH mounts](#ssh-mounts) add SSH agent sockets or keys into the build container.
@z

@x
This page shows how to use secrets with GitHub Actions.
For an introduction to secrets in general, see [Build secrets](/manuals/build/building/secrets.md).
@y
This page shows how to use secrets with GitHub Actions.
For an introduction to secrets in general, see [Build secrets](manuals/build/building/secrets.md).
@z

@x
## Secret mounts
@y
## Secret mounts
@z

@x
In the following example uses and exposes the [`GITHUB_TOKEN` secret](https://docs.github.com/en/actions/security-guides/automatic-token-authentication#about-the-github_token-secret)
as provided by GitHub in your workflow.
@y
In the following example uses and exposes the [`GITHUB_TOKEN` secret](https://docs.github.com/en/actions/security-guides/automatic-token-authentication#about-the-github_token-secret)
as provided by GitHub in your workflow.
@z

@x
First, create a `Dockerfile` that uses the secret:
@y
First, create a `Dockerfile` that uses the secret:
@z

% snip code...

@x
### Pass secret values with GitHub Builder {#pass-secret-values-with-builder}
@y
### Pass secret values with GitHub Builder {#pass-secret-values-with-builder}
@z

@x
Pass secret values to [Docker GitHub Builder](build-workflow.md) using
the `build-secrets` workflow secret. Its value is a YAML mapping from secret
IDs to values, rather than the action's `id=value` list:
@y
Pass secret values to [Docker GitHub Builder](build-workflow.md) using
the `build-secrets` workflow secret. Its value is a YAML mapping from secret
IDs to values, rather than the action's `id=value` list:
@z

% snip code...

@x
The Dockerfile consumes the `github_token` secret in the same way with either
workflow. `toJSON` quotes the value for the YAML mapping.
For files, environment variables, or SSH agents prepared by earlier steps,
use the individual-action examples below. The reusable build runs in separate
jobs and doesn't share the caller's filesystem or SSH agent.
@y
The Dockerfile consumes the `github_token` secret in the same way with either
workflow. `toJSON` quotes the value for the YAML mapping.
For files, environment variables, or SSH agents prepared by earlier steps,
use the individual-action examples below. The reusable build runs in separate
jobs and doesn't share the caller's filesystem or SSH agent.
@z

@x
### Pass secret values with individual actions
@y
### Pass secret values with individual actions
@z

@x
In this example, the secret name is `github_token`. The following workflow
exposes this secret using the `secrets` input:
@y
In this example, the secret name is `github_token`. The following workflow
exposes this secret using the `secrets` input:
@z

% snip code...

@x
> [!NOTE]
> Secrets are mounted as files in the build container.
> By default, they're available at `/run/secrets/<id>`.
> You can also use the `env` option to load a secret into an environment variable,
> or the `target` option to customize the mount path.
> For details on secret mounts, see [Build secrets](/manuals/build/building/secrets.md).
@y
> [!NOTE]
> Secrets are mounted as files in the build container.
> By default, they're available at `/run/secrets/<id>`.
> You can also use the `env` option to load a secret into an environment variable,
> or the `target` option to customize the mount path.
> For details on secret mounts, see [Build secrets](manuals/build/building/secrets.md).
@z

@x
### Secret sources
@y
### Secret sources
@z

@x
The `docker/build-push-action` inputs for secret mounts define where the secret
value comes from. The Dockerfile `RUN --mount=type=secret` options define how
the build step consumes the secret.
@y
The `docker/build-push-action` inputs for secret mounts define where the secret
value comes from. The Dockerfile `RUN --mount=type=secret` options define how
the build step consumes the secret.
@z

@x
| Action input                           | Source                             | Equivalent Buildx option                 |
| -------------------------------------- | ---------------------------------- | ---------------------------------------- |
| `secrets: MY_SECRET=value`             | Inline value from the workflow     | `--secret id=MY_SECRET,src=<temp-file>`  |
| `secret-envs: MY_SECRET=MY_ENV_VAR`    | Environment variable on the runner | `--secret id=MY_SECRET,env=MY_ENV_VAR`   |
| `secret-files: MY_SECRET=./secret.txt` | File on the runner                 | `--secret id=MY_SECRET,src=./secret.txt` |
@y
| Action input                           | Source                             | Equivalent Buildx option                 |
| -------------------------------------- | ---------------------------------- | ---------------------------------------- |
| `secrets: MY_SECRET=value`             | Inline value from the workflow     | `--secret id=MY_SECRET,src=<temp-file>`  |
| `secret-envs: MY_SECRET=MY_ENV_VAR`    | Environment variable on the runner | `--secret id=MY_SECRET,env=MY_ENV_VAR`   |
| `secret-files: MY_SECRET=./secret.txt` | File on the runner                 | `--secret id=MY_SECRET,src=./secret.txt` |
@z

@x
For example, `RUN --mount=type=secret,id=MY_SECRET` mounts the secret as a file
at `/run/secrets/MY_SECRET`. To expose the same secret as an environment
variable for a `RUN` instruction, use the `env` option in the Dockerfile:
`RUN --mount=type=secret,id=MY_SECRET,env=MY_SECRET`.
@y
For example, `RUN --mount=type=secret,id=MY_SECRET` mounts the secret as a file
at `/run/secrets/MY_SECRET`. To expose the same secret as an environment
variable for a `RUN` instruction, use the `env` option in the Dockerfile:
`RUN --mount=type=secret,id=MY_SECRET,env=MY_SECRET`.
@z

@x
### Using environment variables as secret sources
@y
### Using environment variables as secret sources
@z

@x
The `secret-envs` input reads secrets from environment variables on the GitHub
Actions runner. Use it when a previous workflow step sets an environment
variable, or when you want to map a runner environment variable to a different
secret ID for the build.
@y
The `secret-envs` input reads secrets from environment variables on the GitHub
Actions runner. Use it when a previous workflow step sets an environment
variable, or when you want to map a runner environment variable to a different
secret ID for the build.
@z

% snip code...

@x
In your Dockerfile, mount the secret and expose it as an environment variable
for the command that needs it:
@y
In your Dockerfile, mount the secret and expose it as an environment variable
for the command that needs it:
@z

% snip code...

@x
### Using secret files
@y
### Using secret files
@z

@x
The `secret-files` input lets you mount existing files as secrets in your build.
This is useful when you need to use credential files that are generated during your workflow,
or when you need to mount configuration files like `.npmrc` or `.pypirc` that are already in the expected format.
@y
The `secret-files` input lets you mount existing files as secrets in your build.
This is useful when you need to use credential files that are generated during your workflow,
or when you need to mount configuration files like `.npmrc` or `.pypirc` that are already in the expected format.
@z

@x
The key difference between `secrets`, `secret-envs`, and `secret-files`:
@y
The key difference between `secrets`, `secret-envs`, and `secret-files`:
@z

@x
- `secrets`: Pass secret values as strings from the workflow.
- `secret-envs`: Read secret values from environment variables on the runner.
- `secret-files`: Mount existing files from the runner's filesystem.
@y
- `secrets`: Pass secret values as strings from the workflow.
- `secret-envs`: Read secret values from environment variables on the runner.
- `secret-files`: Mount existing files from the runner's filesystem.
@z

@x
#### Example: Using .npmrc for private npm packages
@y
#### Example: Using .npmrc for private npm packages
@z

@x
If your build needs to install packages from a private npm registry,
you can create an `.npmrc` file and mount it as a secret:
@y
If your build needs to install packages from a private npm registry,
you can create an `.npmrc` file and mount it as a secret:
@z

% snip code...

@x
In your Dockerfile, mount the secret file to the expected location:
@y
In your Dockerfile, mount the secret file to the expected location:
@z

% snip code...

@x
If a `RUN` instruction uses a non-root user, set `uid`, `gid`, or `mode` on the
secret mount so the user can read the mounted file:
@y
If a `RUN` instruction uses a non-root user, set `uid`, `gid`, or `mode` on the
secret mount so the user can read the mounted file:
@z

% snip code...

@x
#### Example: Using dynamically generated credentials
@y
#### Example: Using dynamically generated credentials
@z

@x
You can generate credential files from multiple secrets and mount them:
@y
You can generate credential files from multiple secrets and mount them:
@z

% snip code...

@x
In your Dockerfile:
@y
In your Dockerfile:
@z

% snip code...

@x
### Multi-line secrets
@y
### Multi-line secrets
@z

@x
If you're using [GitHub secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets)
with individual actions, place multi-line key-value pairs between quotes:
@y
If you're using [GitHub secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets)
with individual actions, place multi-line key-value pairs between quotes:
@z

% snip code...

@x
| Key              | Value                               |
| ---------------- | ----------------------------------- |
| `MYSECRET`       | `***********************`           |
| `GIT_AUTH_TOKEN` | `abcdefghi,jklmno=0123456789`       |
| `MYSECRET`       | `aaaaaaaa\nbbbbbbb\nccccccccc`      |
| `FOO`            | `bar`                               |
| `EMPTYLINE`      | `aaaa\n\nbbbb\nccc`                 |
| `JSON_SECRET`    | `{"key1":"value1","key2":"value2"}` |
@y
| Key              | Value                               |
| ---------------- | ----------------------------------- |
| `MYSECRET`       | `***********************`           |
| `GIT_AUTH_TOKEN` | `abcdefghi,jklmno=0123456789`       |
| `MYSECRET`       | `aaaaaaaa\nbbbbbbb\nccccccccc`      |
| `FOO`            | `bar`                               |
| `EMPTYLINE`      | `aaaa\n\nbbbb\nccc`                 |
| `JSON_SECRET`    | `{"key1":"value1","key2":"value2"}` |
@z

@x
> [!NOTE]
>
> Double escapes are needed for quote signs.
@y
> [!NOTE]
>
> Double escapes are needed for quote signs.
@z

@x
## SSH mounts
@y
## SSH mounts
@z

@x
SSH mounts let you authenticate with SSH servers.
For example to perform a `git clone`,
or to fetch application packages from a private repository.
@y
SSH mounts let you authenticate with SSH servers.
For example to perform a `git clone`,
or to fetch application packages from a private repository.
@z

@x
The following Dockerfile example uses an SSH mount
to fetch Go modules from a private GitHub repository.
@y
The following Dockerfile example uses an SSH mount
to fetch Go modules from a private GitHub repository.
@z

% snip code...

@x
To build this Dockerfile, you must specify an SSH mount that the builder can
use in the steps with `--mount=type=ssh`.
@y
To build this Dockerfile, you must specify an SSH mount that the builder can
use in the steps with `--mount=type=ssh`.
@z

@x
The following GitHub Action workflow uses the `MrSquaare/ssh-setup-action`
third-party action to bootstrap SSH setup on the GitHub runner. The action
creates a private key defined by the GitHub Action secret `SSH_GITHUB_PPK` and
adds it to the SSH agent socket file at `SSH_AUTH_SOCK`. The SSH mount in the
build step assume `SSH_AUTH_SOCK` by default, so there's no need to specify the
ID or path for the SSH agent socket explicitly.
@y
The following GitHub Action workflow uses the `MrSquaare/ssh-setup-action`
third-party action to bootstrap SSH setup on the GitHub runner. The action
creates a private key defined by the GitHub Action secret `SSH_GITHUB_PPK` and
adds it to the SSH agent socket file at `SSH_AUTH_SOCK`. The SSH mount in the
build step assume `SSH_AUTH_SOCK` by default, so there's no need to specify the
ID or path for the SSH agent socket explicitly.
@z

@x
{{< tabs >}}
{{< tab name="`docker/build-push-action`" >}}
@y
{{< tabs >}}
{{< tab name="`docker/build-push-action`" >}}
@z

% snip code...

@x
{{< /tab >}}
{{< tab name="`docker/bake-action`" >}}
@y
{{< /tab >}}
{{< tab name="`docker/bake-action`" >}}
@z

% snip code...

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z
