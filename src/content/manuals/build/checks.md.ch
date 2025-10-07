%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Checking your build configuration
linkTitle: Build checks
@y
title: ビルド設定のチェック
linkTitle: ビルドチェック
@z

@x
description: Learn how to use build checks to validate your build configuration.
keywords: build, buildx, buildkit, checks, validate, configuration, lint
@y
description: Learn how to use build checks to validate your build configuration.
keywords: build, buildx, buildkit, checks, validate, configuration, lint
@z

@x
{{< summary-bar feature_name="Build checks" >}}
@y
{{< summary-bar feature_name="Build checks" >}}
@z

@x
Build checks are a feature introduced in Dockerfile 1.8. It lets you validate
your build configuration and conduct a series of checks prior to executing your
build. Think of it as an advanced form of linting for your Dockerfile and build
options, or a dry-run mode for builds.
@y
Build checks are a feature introduced in Dockerfile 1.8. It lets you validate
your build configuration and conduct a series of checks prior to executing your
build. Think of it as an advanced form of linting for your Dockerfile and build
options, or a dry-run mode for builds.
@z

@x
You can find the list of checks available, and a description of each, in the
[Build checks reference](/reference/build-checks/).
@y
You can find the list of checks available, and a description of each, in the
[Build checks reference](__SUBDIR__/reference/build-checks/).
@z

@x
## How build checks work
@y
## How build checks work
@z

@x
Typically, when you run a build, Docker executes the build steps in your
Dockerfile and build options as specified. With build checks, rather than
executing the build steps, Docker checks the Dockerfile and options you provide
and reports any issues it detects.
@y
Typically, when you run a build, Docker executes the build steps in your
Dockerfile and build options as specified. With build checks, rather than
executing the build steps, Docker checks the Dockerfile and options you provide
and reports any issues it detects.
@z

@x
Build checks are useful for:
@y
Build checks are useful for:
@z

@x
- Validating your Dockerfile and build options before running a build.
- Ensuring that your Dockerfile and build options are up-to-date with the
  latest best practices.
- Identifying potential issues or anti-patterns in your Dockerfile and build
  options.
@y
- Validating your Dockerfile and build options before running a build.
- Ensuring that your Dockerfile and build options are up-to-date with the
  latest best practices.
- Identifying potential issues or anti-patterns in your Dockerfile and build
  options.
@z

@x
## Build with checks
@y
## Build with checks
@z

@x
Build checks are supported in:
@y
Build checks are supported in:
@z

@x
- Buildx version 0.15.0 and later
- [docker/build-push-action](https://github.com/docker/build-push-action) version 6.6.0 and later
- [docker/bake-action](https://github.com/docker/bake-action) version 5.6.0 and later
@y
- Buildx version 0.15.0 and later
- [docker/build-push-action](https://github.com/docker/build-push-action) version 6.6.0 and later
- [docker/bake-action](https://github.com/docker/bake-action) version 5.6.0 and later
@z

@x
Invoking a build runs the checks by default, and displays any violations in the
build output. For example, the following command both builds the image and runs
the checks:
@y
Invoking a build runs the checks by default, and displays any violations in the
build output. For example, the following command both builds the image and runs
the checks:
@z

@x
```console
$ docker build .
[+] Building 3.5s (11/11) FINISHED
...
@y
```console
$ docker build .
[+] Building 3.5s (11/11) FINISHED
...
@z

@x
1 warning found (use --debug to expand):
  - Lint Rule 'JSONArgsRecommended': JSON arguments recommended for CMD to prevent unintended behavior related to OS signals (line 7)
@y
1 warning found (use --debug to expand):
  - Lint Rule 'JSONArgsRecommended': JSON arguments recommended for CMD to prevent unintended behavior related to OS signals (line 7)
@z

@x
```
@y
```
@z

@x
In this example, the build ran successfully, but a
[JSONArgsRecommended](/reference/build-checks/json-args-recommended/) warning
was reported, because `CMD` instructions should use JSON array syntax.
@y
In this example, the build ran successfully, but a
[JSONArgsRecommended](__SUBDIR__/reference/build-checks/json-args-recommended/) warning
was reported, because `CMD` instructions should use JSON array syntax.
@z

@x
With the GitHub Actions, the checks display in the diff view of pull requests.
@y
With the GitHub Actions, the checks display in the diff view of pull requests.
@z

@x
```yaml
name: Build and push Docker images
on:
  push:
@y
```yaml
name: Build and push Docker images
on:
  push:
@z

@x
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Build and push
        uses: docker/build-push-action@v6.6.0
```
@y
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Build and push
        uses: docker/build-push-action@v6.6.0
```
@z

@x
![GitHub Actions build check annotations](./images/gha-check-annotations.png)
@y
![GitHub Actions build check annotations](./images/gha-check-annotations.png)
@z

@x
### More verbose output
@y
### More verbose output
@z

@x
Check warnings for a regular `docker build` display a concise message
containing the rule name, the message, and the line number of where in the
Dockerfile the issue originated. If you want to see more detailed information
about the checks, you can use the `--debug` flag. For example:
@y
Check warnings for a regular `docker build` display a concise message
containing the rule name, the message, and the line number of where in the
Dockerfile the issue originated. If you want to see more detailed information
about the checks, you can use the `--debug` flag. For example:
@z

@x
```console
$ docker --debug build .
[+] Building 3.5s (11/11) FINISHED
...
@y
```console
$ docker --debug build .
[+] Building 3.5s (11/11) FINISHED
...
@z

@x
 1 warning found:
 - JSONArgsRecommended: JSON arguments recommended for CMD to prevent unintended behavior related to OS signals (line 4)
JSON arguments recommended for ENTRYPOINT/CMD to prevent unintended behavior related to OS signals
More info: https://docs.docker.com/go/dockerfile/rule/json-args-recommended/
Dockerfile:4
--------------------
   2 |
   3 |     FROM alpine
   4 | >>> CMD echo "Hello, world!"
   5 |
--------------------
@y
 1 warning found:
 - JSONArgsRecommended: JSON arguments recommended for CMD to prevent unintended behavior related to OS signals (line 4)
JSON arguments recommended for ENTRYPOINT/CMD to prevent unintended behavior related to OS signals
More info: https://docs.docker.com/go/dockerfile/rule/json-args-recommended/
Dockerfile:4
--------------------
   2 |
   3 |     FROM alpine
   4 | >>> CMD echo "Hello, world!"
   5 |
--------------------
@z

@x
```
@y
```
@z

@x
With the `--debug` flag, the output includes a link to the documentation for
the check, and a snippet of the Dockerfile where the issue was found.
@y
With the `--debug` flag, the output includes a link to the documentation for
the check, and a snippet of the Dockerfile where the issue was found.
@z

@x
## Check a build without building
@y
## Check a build without building
@z

@x
To run build checks without actually building, you can use the `docker build`
command as you typically would, but with the addition of the `--check` flag.
Here's an example:
@y
To run build checks without actually building, you can use the `docker build`
command as you typically would, but with the addition of the `--check` flag.
Here's an example:
@z

@x
```console
$ docker build --check .
```
@y
```console
$ docker build --check .
```
@z

@x
Instead of executing the build steps, this command only runs the checks and
reports any issues it finds. If there are any issues, they will be reported in
the output. For example:
@y
Instead of executing the build steps, this command only runs the checks and
reports any issues it finds. If there are any issues, they will be reported in
the output. For example:
@z

@x
```text {title="Output with --check"}
[+] Building 1.5s (5/5) FINISHED
=> [internal] connecting to local controller
=> [internal] load build definition from Dockerfile
=> => transferring dockerfile: 253B
=> [internal] load metadata for docker.io/library/node:22
=> [auth] library/node:pull token for registry-1.docker.io
=> [internal] load .dockerignore
=> => transferring context: 50B
JSONArgsRecommended - https://docs.docker.com/go/dockerfile/rule/json-args-recommended/
JSON arguments recommended for ENTRYPOINT/CMD to prevent unintended behavior related to OS signals
Dockerfile:7
--------------------
5 |
6 |     COPY index.js .
7 | >>> CMD node index.js
8 |
--------------------
```
@y
```text {title="Output with --check"}
[+] Building 1.5s (5/5) FINISHED
=> [internal] connecting to local controller
=> [internal] load build definition from Dockerfile
=> => transferring dockerfile: 253B
=> [internal] load metadata for docker.io/library/node:22
=> [auth] library/node:pull token for registry-1.docker.io
=> [internal] load .dockerignore
=> => transferring context: 50B
JSONArgsRecommended - https://docs.docker.com/go/dockerfile/rule/json-args-recommended/
JSON arguments recommended for ENTRYPOINT/CMD to prevent unintended behavior related to OS signals
Dockerfile:7
--------------------
5 |
6 |     COPY index.js .
7 | >>> CMD node index.js
8 |
--------------------
```
@z

@x
This output with `--check` shows the [verbose message](#more-verbose-output)
for the check.
@y
This output with `--check` shows the [verbose message](#more-verbose-output)
for the check.
@z

@x
Unlike a regular build, if any violations are reported when using the `--check`
flag, the command exits with a non-zero status code.
@y
Unlike a regular build, if any violations are reported when using the `--check`
flag, the command exits with a non-zero status code.
@z

@x
## Fail build on check violations
@y
## Fail build on check violations
@z

@x
Check violations for builds are reported as warnings, with exit code 0, by
default. You can configure Docker to fail the build when violations are
reported, using a `check=error=true` directive in your Dockerfile. This will
cause the build to error out when after the build checks are run, before the
actual build gets executed.
@y
Check violations for builds are reported as warnings, with exit code 0, by
default. You can configure Docker to fail the build when violations are
reported, using a `check=error=true` directive in your Dockerfile. This will
cause the build to error out when after the build checks are run, before the
actual build gets executed.
@z

@x
```dockerfile {title=Dockerfile,linenos=true,hl_lines=2}
# syntax=docker/dockerfile:1
# check=error=true
@y
```dockerfile {title=Dockerfile,linenos=true,hl_lines=2}
# syntax=docker/dockerfile:1
# check=error=true
@z

@x
FROM alpine
CMD echo "Hello, world!"
```
@y
FROM alpine
CMD echo "Hello, world!"
```
@z

@x
Without the `# check=error=true` directive, this build would complete with an
exit code of 0. However, with the directive, build check violation results in
non-zero exit code:
@y
Without the `# check=error=true` directive, this build would complete with an
exit code of 0. However, with the directive, build check violation results in
non-zero exit code:
@z

@x
```console
$ docker build .
[+] Building 1.5s (5/5) FINISHED
...
@y
```console
$ docker build .
[+] Building 1.5s (5/5) FINISHED
...
@z

@x
 1 warning found (use --debug to expand):
 - JSONArgsRecommended: JSON arguments recommended for CMD to prevent unintended behavior related to OS signals (line 5)
Dockerfile:1
--------------------
   1 | >>> # syntax=docker/dockerfile:1
   2 |     # check=error=true
   3 |
--------------------
ERROR: lint violation found for rules: JSONArgsRecommended
$ echo $?
1
```
@y
 1 warning found (use --debug to expand):
 - JSONArgsRecommended: JSON arguments recommended for CMD to prevent unintended behavior related to OS signals (line 5)
Dockerfile:1
--------------------
   1 | >>> # syntax=docker/dockerfile:1
   2 |     # check=error=true
   3 |
--------------------
ERROR: lint violation found for rules: JSONArgsRecommended
$ echo $?
1
```
@z

@x
You can also set the error directive on the CLI by passing the
`BUILDKIT_DOCKERFILE_CHECK` build argument:
@y
You can also set the error directive on the CLI by passing the
`BUILDKIT_DOCKERFILE_CHECK` build argument:
@z

@x
```console
$ docker build --check --build-arg "BUILDKIT_DOCKERFILE_CHECK=error=true" .
```
@y
```console
$ docker build --check --build-arg "BUILDKIT_DOCKERFILE_CHECK=error=true" .
```
@z

@x
## Skip checks
@y
## Skip checks
@z

@x
By default, all checks are run when you build an image. If you want to skip
specific checks, you can use the `check=skip` directive in your Dockerfile.
The `skip` parameter takes a CSV string of the check IDs you want to skip.
For example:
@y
By default, all checks are run when you build an image. If you want to skip
specific checks, you can use the `check=skip` directive in your Dockerfile.
The `skip` parameter takes a CSV string of the check IDs you want to skip.
For example:
@z

@x
```dockerfile {title=Dockerfile}
# syntax=docker/dockerfile:1
# check=skip=JSONArgsRecommended,StageNameCasing
@y
```dockerfile {title=Dockerfile}
# syntax=docker/dockerfile:1
# check=skip=JSONArgsRecommended,StageNameCasing
@z

@x
FROM alpine AS BASE_STAGE
CMD echo "Hello, world!"
```
@y
FROM alpine AS BASE_STAGE
CMD echo "Hello, world!"
```
@z

@x
Building this Dockerfile results in no check violations.
@y
Building this Dockerfile results in no check violations.
@z

@x
You can also skip checks by passing the `BUILDKIT_DOCKERFILE_CHECK` build
argument with a CSV string of check IDs you want to skip. For example:
@y
You can also skip checks by passing the `BUILDKIT_DOCKERFILE_CHECK` build
argument with a CSV string of check IDs you want to skip. For example:
@z

@x
```console
$ docker build --check --build-arg "BUILDKIT_DOCKERFILE_CHECK=skip=JSONArgsRecommended,StageNameCasing" .
```
@y
```console
$ docker build --check --build-arg "BUILDKIT_DOCKERFILE_CHECK=skip=JSONArgsRecommended,StageNameCasing" .
```
@z

@x
To skip all checks, use the `skip=all` parameter:
@y
To skip all checks, use the `skip=all` parameter:
@z

@x
```dockerfile {title=Dockerfile}
# syntax=docker/dockerfile:1
# check=skip=all
```
@y
```dockerfile {title=Dockerfile}
# syntax=docker/dockerfile:1
# check=skip=all
```
@z

@x
## Combine error and skip parameters for check directives
@y
## Combine error and skip parameters for check directives
@z

@x
To both skip specific checks and error on check violations, pass both the
`skip` and `error` parameters separated by a semi-colon (`;`) to the `check`
directive in your Dockerfile or in a build argument. For example:
@y
To both skip specific checks and error on check violations, pass both the
`skip` and `error` parameters separated by a semi-colon (`;`) to the `check`
directive in your Dockerfile or in a build argument. For example:
@z

@x
```dockerfile {title=Dockerfile}
# syntax=docker/dockerfile:1
# check=skip=JSONArgsRecommended,StageNameCasing;error=true
```
@y
```dockerfile {title=Dockerfile}
# syntax=docker/dockerfile:1
# check=skip=JSONArgsRecommended,StageNameCasing;error=true
```
@z

@x
```console {title="Build argument"}
$ docker build --check --build-arg "BUILDKIT_DOCKERFILE_CHECK=skip=JSONArgsRecommended,StageNameCasing;error=true" .
```
@y
```console {title="Build argument"}
$ docker build --check --build-arg "BUILDKIT_DOCKERFILE_CHECK=skip=JSONArgsRecommended,StageNameCasing;error=true" .
```
@z

@x
## Experimental checks
@y
## Experimental checks
@z

@x
Before checks are promoted to stable, they may be available as experimental
checks. Experimental checks are disabled by default. To see the list of
experimental checks available, refer to the [Build checks reference](/reference/build-checks/).
@y
Before checks are promoted to stable, they may be available as experimental
checks. Experimental checks are disabled by default. To see the list of
experimental checks available, refer to the [Build checks reference](__SUBDIR__/reference/build-checks/).
@z

@x
To enable all experimental checks, set the `BUILDKIT_DOCKERFILE_CHECK` build
argument to `experimental=all`:
@y
To enable all experimental checks, set the `BUILDKIT_DOCKERFILE_CHECK` build
argument to `experimental=all`:
@z

@x
```console
$ docker build --check --build-arg "BUILDKIT_DOCKERFILE_CHECK=experimental=all" .
```
@y
```console
$ docker build --check --build-arg "BUILDKIT_DOCKERFILE_CHECK=experimental=all" .
```
@z

@x
You can also enable experimental checks in your Dockerfile using the `check`
directive:
@y
You can also enable experimental checks in your Dockerfile using the `check`
directive:
@z

@x
```dockerfile {title=Dockerfile}
# syntax=docker/dockerfile:1
# check=experimental=all
```
@y
```dockerfile {title=Dockerfile}
# syntax=docker/dockerfile:1
# check=experimental=all
```
@z

@x
To selectively enable experimental checks, you can pass a CSV string of the
check IDs you want to enable, either to the `check` directive in your Dockerfile
or as a build argument. For example:
@y
To selectively enable experimental checks, you can pass a CSV string of the
check IDs you want to enable, either to the `check` directive in your Dockerfile
or as a build argument. For example:
@z

@x
```dockerfile {title=Dockerfile}
# syntax=docker/dockerfile:1
# check=experimental=JSONArgsRecommended,StageNameCasing
```
@y
```dockerfile {title=Dockerfile}
# syntax=docker/dockerfile:1
# check=experimental=JSONArgsRecommended,StageNameCasing
```
@z

@x
Note that the `experimental` directive takes precedence over the `skip`
directive, meaning that experimental checks will run regardless of the `skip`
directive you have set. For example, if you set `skip=all` and enable
experimental checks, the experimental checks will still run:
@y
Note that the `experimental` directive takes precedence over the `skip`
directive, meaning that experimental checks will run regardless of the `skip`
directive you have set. For example, if you set `skip=all` and enable
experimental checks, the experimental checks will still run:
@z

@x
```dockerfile {title=Dockerfile}
# syntax=docker/dockerfile:1
# check=skip=all;experimental=all
```
@y
```dockerfile {title=Dockerfile}
# syntax=docker/dockerfile:1
# check=skip=all;experimental=all
```
@z

@x
## Further reading
@y
## Further reading
@z

@x
For more information about using build checks, see:
@y
For more information about using build checks, see:
@z

@x
- [Build checks reference](/reference/build-checks/)
- [Validating build configuration with GitHub Actions](/manuals/build/ci/github-actions/checks.md)
@y
- [Build checks reference](__SUBDIR__/reference/build-checks/)
- [Validating build configuration with GitHub Actions](manuals/build/ci/github-actions/checks.md)
@z
