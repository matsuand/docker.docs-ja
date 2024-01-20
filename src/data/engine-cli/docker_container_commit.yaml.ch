%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker container commit
aliases: docker container commit, docker commit
short: Create a new image from a container's changes
long: |-
    It can be useful to commit a container's file changes or settings into a new
    image. This lets you debug a container by running an interactive shell, or
    export a working dataset to another server.
@y
command: docker container commit
aliases: docker container commit, docker commit
short: Create a new image from a container's changes
long: |-
    It can be useful to commit a container's file changes or settings into a new
    image. This lets you debug a container by running an interactive shell, or
    export a working dataset to another server.
@z

@x
    Commits do not include any data contained in mounted volumes.
@y
    Commits do not include any data contained in mounted volumes.
@z

@x
    By default, the container being committed and its processes will be paused
    while the image is committed. This reduces the likelihood of encountering data
    corruption during the process of creating the commit. If this behavior is
    undesired, set the `--pause` option to false.
@y
    By default, the container being committed and its processes will be paused
    while the image is committed. This reduces the likelihood of encountering data
    corruption during the process of creating the commit. If this behavior is
    undesired, set the `--pause` option to false.
@z

@x
    The `--change` option will apply `Dockerfile` instructions to the image that's
    created. Supported `Dockerfile` instructions:
    `CMD`|`ENTRYPOINT`|`ENV`|`EXPOSE`|`LABEL`|`ONBUILD`|`USER`|`VOLUME`|`WORKDIR`
usage: docker container commit [OPTIONS] CONTAINER [REPOSITORY[:TAG]]
pname: docker container
plink: docker_container.yaml
options:
    - option: author
      shorthand: a
      value_type: string
      description: Author (e.g., `John Hannibal Smith <hannibal@a-team.com>`)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: change
      shorthand: c
      value_type: list
      description: Apply Dockerfile instruction to the created image
      details_url: '#change'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: message
      shorthand: m
      value_type: string
      description: Commit message
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: pause
      shorthand: p
      value_type: bool
      default_value: "true"
      description: Pause container during commit
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
    ### Commit a container
@y
    The `--change` option will apply `Dockerfile` instructions to the image that's
    created. Supported `Dockerfile` instructions:
    `CMD`|`ENTRYPOINT`|`ENV`|`EXPOSE`|`LABEL`|`ONBUILD`|`USER`|`VOLUME`|`WORKDIR`
usage: docker container commit [OPTIONS] CONTAINER [REPOSITORY[:TAG]]
pname: docker container
plink: docker_container.yaml
options:
    - option: author
      shorthand: a
      value_type: string
      description: Author (e.g., `John Hannibal Smith <hannibal@a-team.com>`)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: change
      shorthand: c
      value_type: list
      description: Apply Dockerfile instruction to the created image
      details_url: '#change'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: message
      shorthand: m
      value_type: string
      description: Commit message
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: pause
      shorthand: p
      value_type: bool
      default_value: "true"
      description: Pause container during commit
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
    ### Commit a container
@z

@x
    ```console
    $ docker ps
@y
    ```console
    $ docker ps
@z

@x
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS              NAMES
    c3f279d17e0a        ubuntu:22.04        /bin/bash           7 days ago          Up 25 hours                            desperate_dubinsky
    197387f1b436        ubuntu:22.04        /bin/bash           7 days ago          Up 25 hours                            focused_hamilton
@y
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS              NAMES
    c3f279d17e0a        ubuntu:22.04        /bin/bash           7 days ago          Up 25 hours                            desperate_dubinsky
    197387f1b436        ubuntu:22.04        /bin/bash           7 days ago          Up 25 hours                            focused_hamilton
@z

@x
    $ docker commit c3f279d17e0a  svendowideit/testimage:version3
@y
    $ docker commit c3f279d17e0a  svendowideit/testimage:version3
@z

@x
    f5283438590d
@y
    f5283438590d
@z

@x
    $ docker images
@y
    $ docker images
@z

@x
    REPOSITORY                        TAG                 ID                  CREATED             SIZE
    svendowideit/testimage            version3            f5283438590d        16 seconds ago      335.7 MB
    ```
@y
    REPOSITORY                        TAG                 ID                  CREATED             SIZE
    svendowideit/testimage            version3            f5283438590d        16 seconds ago      335.7 MB
    ```
@z

@x
    ### Commit a container with new configurations (--change) {#change}
@y
    ### Commit a container with new configurations (--change) {#change}
@z

@x
    ```console
    $ docker ps
@y
    ```console
    $ docker ps
@z

@x
    CONTAINER ID       IMAGE               COMMAND             CREATED             STATUS              PORTS              NAMES
    c3f279d17e0a       ubuntu:22.04        /bin/bash           7 days ago          Up 25 hours                            desperate_dubinsky
    197387f1b436       ubuntu:22.04        /bin/bash           7 days ago          Up 25 hours                            focused_hamilton
@y
    CONTAINER ID       IMAGE               COMMAND             CREATED             STATUS              PORTS              NAMES
    c3f279d17e0a       ubuntu:22.04        /bin/bash           7 days ago          Up 25 hours                            desperate_dubinsky
    197387f1b436       ubuntu:22.04        /bin/bash           7 days ago          Up 25 hours                            focused_hamilton
@z

@x
    $ docker inspect -f "{{ .Config.Env }}" c3f279d17e0a
@y
    $ docker inspect -f "{{ .Config.Env }}" c3f279d17e0a
@z

@x
    [HOME=/ PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin]
@y
    [HOME=/ PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin]
@z

@x
    $ docker commit --change "ENV DEBUG=true" c3f279d17e0a  svendowideit/testimage:version3
@y
    $ docker commit --change "ENV DEBUG=true" c3f279d17e0a  svendowideit/testimage:version3
@z

@x
    f5283438590d
@y
    f5283438590d
@z

@x
    $ docker inspect -f "{{ .Config.Env }}" f5283438590d
@y
    $ docker inspect -f "{{ .Config.Env }}" f5283438590d
@z

@x
    [HOME=/ PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin DEBUG=true]
    ```
@y
    [HOME=/ PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin DEBUG=true]
    ```
@z

@x
    ### Commit a container with new `CMD` and `EXPOSE` instructions
@y
    ### Commit a container with new `CMD` and `EXPOSE` instructions
@z

@x
    ```console
    $ docker ps
@y
    ```console
    $ docker ps
@z

@x
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS              NAMES
    c3f279d17e0a        ubuntu:22.04        /bin/bash           7 days ago          Up 25 hours                            desperate_dubinsky
    197387f1b436        ubuntu:22.04        /bin/bash           7 days ago          Up 25 hours                            focused_hamilton
@y
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS              NAMES
    c3f279d17e0a        ubuntu:22.04        /bin/bash           7 days ago          Up 25 hours                            desperate_dubinsky
    197387f1b436        ubuntu:22.04        /bin/bash           7 days ago          Up 25 hours                            focused_hamilton
@z

@x
    $ docker commit --change='CMD ["apachectl", "-DFOREGROUND"]' -c "EXPOSE 80" c3f279d17e0a  svendowideit/testimage:version4
@y
    $ docker commit --change='CMD ["apachectl", "-DFOREGROUND"]' -c "EXPOSE 80" c3f279d17e0a  svendowideit/testimage:version4
@z

@x
    f5283438590d
@y
    f5283438590d
@z

@x
    $ docker run -d svendowideit/testimage:version4
@y
    $ docker run -d svendowideit/testimage:version4
@z

@x
    89373736e2e7f00bc149bd783073ac43d0507da250e999f3f1036e0db60817c0
@y
    89373736e2e7f00bc149bd783073ac43d0507da250e999f3f1036e0db60817c0
@z

@x
    $ docker ps
@y
    $ docker ps
@z

@x
    CONTAINER ID        IMAGE               COMMAND                 CREATED             STATUS              PORTS              NAMES
    89373736e2e7        testimage:version4  "apachectl -DFOREGROU"  3 seconds ago       Up 2 seconds        80/tcp             distracted_fermat
    c3f279d17e0a        ubuntu:22.04        /bin/bash               7 days ago          Up 25 hours                            desperate_dubinsky
    197387f1b436        ubuntu:22.04        /bin/bash               7 days ago          Up 25 hours                            focused_hamilton
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    CONTAINER ID        IMAGE               COMMAND                 CREATED             STATUS              PORTS              NAMES
    89373736e2e7        testimage:version4  "apachectl -DFOREGROU"  3 seconds ago       Up 2 seconds        80/tcp             distracted_fermat
    c3f279d17e0a        ubuntu:22.04        /bin/bash               7 days ago          Up 25 hours                            desperate_dubinsky
    197387f1b436        ubuntu:22.04        /bin/bash               7 days ago          Up 25 hours                            focused_hamilton
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
