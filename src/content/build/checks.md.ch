%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Checking your build configuration
description: Learn how to use build checks to validate your build configuration.
keywords: build, buildx, buildkit, checks, validate, configuration, lint
---
@y
---
title: Checking your build configuration
description: Learn how to use build checks to validate your build configuration.
keywords: build, buildx, buildkit, checks, validate, configuration, lint
---
@z

@x
{{< introduced buildx 0.15.0 >}}
@y
{{< introduced buildx 0.15.0 >}}
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
[Build checks reference](/reference/build-checks/).
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
Build checks are supported in Buildx version 0.15.0 and later. Invoking a build
runs the checks by default, and displays any violations in the build output.
For example, the following command both builds the image and runs the checks:
@y
Build checks are supported in Buildx version 0.15.0 and later. Invoking a build
runs the checks by default, and displays any violations in the build output.
For example, the following command both builds the image and runs the checks:
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
[JSONArgsRecommended](/reference/build-checks/json-args-recommended/) warning
was reported, because `CMD` instructions should use JSON array syntax.
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
$ docker build --debug .
[+] Building 3.5s (11/11) FINISHED
...
@y
```console
$ docker build --debug .
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
