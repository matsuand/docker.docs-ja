%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: JSONArgsRecommended
description: >-
  JSON arguments recommended for ENTRYPOINT/CMD to prevent unintended behavior related to OS signals
@y
title: JSONArgsRecommended
description: >-
  JSON arguments recommended for ENTRYPOINT/CMD to prevent unintended behavior related to OS signals
@z

@x
## Output
@y
## Output
@z

@x
```text
JSON arguments recommended for ENTRYPOINT/CMD to prevent unintended behavior related to OS signals
```
@y
```text
JSON arguments recommended for ENTRYPOINT/CMD to prevent unintended behavior related to OS signals
```
@z

@x
## Description
@y
## Description
@z

@x
`ENTRYPOINT` and `CMD` instructions both support two different syntaxes for
arguments:
@y
`ENTRYPOINT` and `CMD` instructions both support two different syntaxes for
arguments:
@z

@x
- Shell form: `CMD my-cmd start`
- Exec form: `CMD ["my-cmd", "start"]`
@y
- Shell form: `CMD my-cmd start`
- Exec form: `CMD ["my-cmd", "start"]`
@z

@x
When you use shell form, the executable runs as a child process to a shell,
which doesn't pass signals. This means that the program running in the
container can't detect OS signals like `SIGTERM` and `SIGKILL` and respond to
them correctly.
@y
When you use shell form, the executable runs as a child process to a shell,
which doesn't pass signals. This means that the program running in the
container can't detect OS signals like `SIGTERM` and `SIGKILL` and respond to
them correctly.
@z

@x
## Examples
@y
## Examples
@z

@x
❌ Bad: the `ENTRYPOINT` command doesn't receive OS signals.
@y
❌ Bad: the `ENTRYPOINT` command doesn't receive OS signals.
@z

@x
```dockerfile
FROM alpine
ENTRYPOINT my-program start
# entrypoint becomes: /bin/sh -c my-program start
```
@y
```dockerfile
FROM alpine
ENTRYPOINT my-program start
# entrypoint becomes: /bin/sh -c my-program start
```
@z

@x
To make sure the executable can receive OS signals, use the exec form for `CMD`
and `ENTRYPOINT`, which lets you run the executable as the main process (`PID
1`) in the container, avoiding a shell parent process.
@y
To make sure the executable can receive OS signals, use the exec form for `CMD`
and `ENTRYPOINT`, which lets you run the executable as the main process (`PID
1`) in the container, avoiding a shell parent process.
@z

@x
✅ Good: the `ENTRYPOINT` receives OS signals.
@y
✅ Good: the `ENTRYPOINT` receives OS signals.
@z

@x
```dockerfile
FROM alpine
ENTRYPOINT ["my-program", "start"]
# entrypoint becomes: my-program start
```
@y
```dockerfile
FROM alpine
ENTRYPOINT ["my-program", "start"]
# entrypoint becomes: my-program start
```
@z

@x
Note that running programs as PID 1 means the program now has the special
responsibilities and behaviors associated with PID 1 in Linux, such as reaping
child processes.
@y
Note that running programs as PID 1 means the program now has the special
responsibilities and behaviors associated with PID 1 in Linux, such as reaping
child processes.
@z

@x
### Workarounds
@y
### Workarounds
@z

@x
There might still be cases when you want to run your containers under a shell.
When using exec form, shell features such as variable expansion, piping (`|`)
and command chaining (`&&`, `||`, `;`), are not available. To use such
features, you need to use shell form.
@y
There might still be cases when you want to run your containers under a shell.
When using exec form, shell features such as variable expansion, piping (`|`)
and command chaining (`&&`, `||`, `;`), are not available. To use such
features, you need to use shell form.
@z

@x
Here are some ways you can achieve that. Note that this still means that
executables run as child-processes of a shell.
@y
Here are some ways you can achieve that. Note that this still means that
executables run as child-processes of a shell.
@z

@x
#### Create a wrapper script
@y
#### Create a wrapper script
@z

@x
You can create an entrypoint script that wraps your startup commands, and
execute that script with a JSON-formatted `ENTRYPOINT` command.
@y
You can create an entrypoint script that wraps your startup commands, and
execute that script with a JSON-formatted `ENTRYPOINT` command.
@z

@x
✅ Good: the `ENTRYPOINT` uses JSON format.
@y
✅ Good: the `ENTRYPOINT` uses JSON format.
@z

@x
```dockerfile
FROM alpine
RUN apk add bash
COPY --chmod=755 <<EOT /entrypoint.sh
#!/usr/bin/env bash
set -e
my-background-process &
my-program start
EOT
ENTRYPOINT ["/entrypoint.sh"]
```
@y
```dockerfile
FROM alpine
RUN apk add bash
COPY --chmod=755 <<EOT /entrypoint.sh
#!/usr/bin/env bash
set -e
my-background-process &
my-program start
EOT
ENTRYPOINT ["/entrypoint.sh"]
```
@z

@x
#### Explicitly specify the shell
@y
#### Explicitly specify the shell
@z

@x
You can use the [`SHELL`](https://docs.docker.com/reference/dockerfile/#shell)
Dockerfile instruction to explicitly specify a shell to use. This will suppress
the warning since setting the `SHELL` instruction indicates that using shell
form is a conscious decision.
@y
You can use the [`SHELL`](https://docs.docker.com/reference/dockerfile/#shell)
Dockerfile instruction to explicitly specify a shell to use. This will suppress
the warning since setting the `SHELL` instruction indicates that using shell
form is a conscious decision.
@z

@x
✅ Good: shell is explicitly defined.
@y
✅ Good: shell is explicitly defined.
@z

@x
```dockerfile
FROM alpine
RUN apk add bash
SHELL ["/bin/bash", "-c"]
ENTRYPOINT echo "hello world"
```
@y
```dockerfile
FROM alpine
RUN apk add bash
SHELL ["/bin/bash", "-c"]
ENTRYPOINT echo "hello world"
```
@z
