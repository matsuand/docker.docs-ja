%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker container diff
aliases: docker container diff, docker diff
short: Inspect changes to files or directories on a container's filesystem
long: |-
    List the changed files and directories in a container᾿s filesystem since the
    container was created. Three different types of change are tracked:
@y
command: docker container diff
aliases: docker container diff, docker diff
short: Inspect changes to files or directories on a container's filesystem
long: |-
    List the changed files and directories in a container᾿s filesystem since the
    container was created. Three different types of change are tracked:
@z

@x
    | Symbol | Description                     |
    |--------|---------------------------------|
    | `A`    | A file or directory was added   |
    | `D`    | A file or directory was deleted |
    | `C`    | A file or directory was changed |
@y
    | Symbol | Description                     |
    |--------|---------------------------------|
    | `A`    | A file or directory was added   |
    | `D`    | A file or directory was deleted |
    | `C`    | A file or directory was changed |
@z

@x
    You can use the full or shortened container ID or the container name set using
    `docker run --name` option.
usage: docker container diff CONTAINER
pname: docker container
plink: docker_container.yaml
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
    Inspect the changes to an `nginx` container:
@y
    You can use the full or shortened container ID or the container name set using
    `docker run --name` option.
usage: docker container diff CONTAINER
pname: docker container
plink: docker_container.yaml
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
    Inspect the changes to an `nginx` container:
@z

@x
    ```console
    $ docker diff 1fdfd1f54c1b
@y
    ```console
    $ docker diff 1fdfd1f54c1b
@z

@x
    C /dev
    C /dev/console
    C /dev/core
    C /dev/stdout
    C /dev/fd
    C /dev/ptmx
    C /dev/stderr
    C /dev/stdin
    C /run
    A /run/nginx.pid
    C /var/lib/nginx/tmp
    A /var/lib/nginx/tmp/client_body
    A /var/lib/nginx/tmp/fastcgi
    A /var/lib/nginx/tmp/proxy
    A /var/lib/nginx/tmp/scgi
    A /var/lib/nginx/tmp/uwsgi
    C /var/log/nginx
    A /var/log/nginx/access.log
    A /var/log/nginx/error.log
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    C /dev
    C /dev/console
    C /dev/core
    C /dev/stdout
    C /dev/fd
    C /dev/ptmx
    C /dev/stderr
    C /dev/stdin
    C /run
    A /run/nginx.pid
    C /var/lib/nginx/tmp
    A /var/lib/nginx/tmp/client_body
    A /var/lib/nginx/tmp/fastcgi
    A /var/lib/nginx/tmp/proxy
    A /var/lib/nginx/tmp/scgi
    A /var/lib/nginx/tmp/uwsgi
    C /var/log/nginx
    A /var/log/nginx/access.log
    A /var/log/nginx/error.log
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
