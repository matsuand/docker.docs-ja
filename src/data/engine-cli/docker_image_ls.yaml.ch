%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker image ls
aliases: docker image ls, docker image list, docker images
short: List images
long: |-
    The default `docker images` will show all top level
    images, their repository and tags, and their size.
@y
command: docker image ls
aliases: docker image ls, docker image list, docker images
short: List images
long: |-
    The default `docker images` will show all top level
    images, their repository and tags, and their size.
@z

@x
    Docker images have intermediate layers that increase reusability,
    decrease disk usage, and speed up `docker build` by
    allowing each step to be cached. These intermediate layers are not shown
    by default.
@y
    Docker images have intermediate layers that increase reusability,
    decrease disk usage, and speed up `docker build` by
    allowing each step to be cached. These intermediate layers are not shown
    by default.
@z

@x
    The `SIZE` is the cumulative space taken up by the image and all
    its parent images. This is also the disk space used by the contents of the
    Tar file created when you `docker save` an image.
@y
    The `SIZE` is the cumulative space taken up by the image and all
    its parent images. This is also the disk space used by the contents of the
    Tar file created when you `docker save` an image.
@z

@x
    An image will be listed more than once if it has multiple repository names
    or tags. This single image (identifiable by its matching `IMAGE ID`)
    uses up the `SIZE` listed only once.
usage: docker image ls [OPTIONS] [REPOSITORY[:TAG]]
pname: docker image
plink: docker_image.yaml
options:
    - option: all
      shorthand: a
      value_type: bool
      default_value: "false"
      description: Show all images (default hides intermediate images)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: digests
      value_type: bool
      default_value: "false"
      description: Show digests
      details_url: '#digests'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: filter
      shorthand: f
      value_type: filter
      description: Filter output based on conditions provided
      details_url: '#filter'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: format
      value_type: string
      description: |-
        Format output using a custom template:
        'table':            Print output in table format with column headers (default)
        'table TEMPLATE':   Print output in table format using the given Go template
        'json':             Print in JSON format
        'TEMPLATE':         Print output using the given Go template.
        Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates
      details_url: '#format'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-trunc
      value_type: bool
      default_value: "false"
      description: Don't truncate output
      details_url: '#no-trunc'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: Only show image IDs
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
    ### List the most recently created images
@y
    An image will be listed more than once if it has multiple repository names
    or tags. This single image (identifiable by its matching `IMAGE ID`)
    uses up the `SIZE` listed only once.
usage: docker image ls [OPTIONS] [REPOSITORY[:TAG]]
pname: docker image
plink: docker_image.yaml
options:
    - option: all
      shorthand: a
      value_type: bool
      default_value: "false"
      description: Show all images (default hides intermediate images)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: digests
      value_type: bool
      default_value: "false"
      description: Show digests
      details_url: '#digests'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: filter
      shorthand: f
      value_type: filter
      description: Filter output based on conditions provided
      details_url: '#filter'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: format
      value_type: string
      description: |-
        Format output using a custom template:
        'table':            Print output in table format with column headers (default)
        'table TEMPLATE':   Print output in table format using the given Go template
        'json':             Print in JSON format
        'TEMPLATE':         Print output using the given Go template.
        Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates
      details_url: '#format'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-trunc
      value_type: bool
      default_value: "false"
      description: Don't truncate output
      details_url: '#no-trunc'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: Only show image IDs
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
    ### List the most recently created images
@z

@x
    ```console
    $ docker images
@y
    ```console
    $ docker images
@z

@x
    REPOSITORY                TAG                 IMAGE ID            CREATED             SIZE
    <none>                    <none>              77af4d6b9913        19 hours ago        1.089 GB
    committ                   latest              b6fa739cedf5        19 hours ago        1.089 GB
    <none>                    <none>              78a85c484f71        19 hours ago        1.089 GB
    docker                    latest              30557a29d5ab        20 hours ago        1.089 GB
    <none>                    <none>              5ed6274db6ce        24 hours ago        1.089 GB
    postgres                  9                   746b819f315e        4 days ago          213.4 MB
    postgres                  9.3                 746b819f315e        4 days ago          213.4 MB
    postgres                  9.3.5               746b819f315e        4 days ago          213.4 MB
    postgres                  latest              746b819f315e        4 days ago          213.4 MB
    ```
@y
    REPOSITORY                TAG                 IMAGE ID            CREATED             SIZE
    <none>                    <none>              77af4d6b9913        19 hours ago        1.089 GB
    committ                   latest              b6fa739cedf5        19 hours ago        1.089 GB
    <none>                    <none>              78a85c484f71        19 hours ago        1.089 GB
    docker                    latest              30557a29d5ab        20 hours ago        1.089 GB
    <none>                    <none>              5ed6274db6ce        24 hours ago        1.089 GB
    postgres                  9                   746b819f315e        4 days ago          213.4 MB
    postgres                  9.3                 746b819f315e        4 days ago          213.4 MB
    postgres                  9.3.5               746b819f315e        4 days ago          213.4 MB
    postgres                  latest              746b819f315e        4 days ago          213.4 MB
    ```
@z

@x
    ### List images by name and tag
@y
    ### List images by name and tag
@z

@x
    The `docker images` command takes an optional `[REPOSITORY[:TAG]]` argument
    that restricts the list to images that match the argument. If you specify
    `REPOSITORY`but no `TAG`, the `docker images` command lists all images in the
    given repository.
@y
    The `docker images` command takes an optional `[REPOSITORY[:TAG]]` argument
    that restricts the list to images that match the argument. If you specify
    `REPOSITORY`but no `TAG`, the `docker images` command lists all images in the
    given repository.
@z

@x
    For example, to list all images in the `java` repository, run the following command:
@y
    For example, to list all images in the `java` repository, run the following command:
@z

@x
    ```console
    $ docker images java
@y
    ```console
    $ docker images java
@z

@x
    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    java                8                   308e519aac60        6 days ago          824.5 MB
    java                7                   493d82594c15        3 months ago        656.3 MB
    java                latest              2711b1d6f3aa        5 months ago        603.9 MB
    ```
@y
    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    java                8                   308e519aac60        6 days ago          824.5 MB
    java                7                   493d82594c15        3 months ago        656.3 MB
    java                latest              2711b1d6f3aa        5 months ago        603.9 MB
    ```
@z

@x
    The `[REPOSITORY[:TAG]]` value must be an exact match. This means that, for example,
    `docker images jav` does not match the image `java`.
@y
    The `[REPOSITORY[:TAG]]` value must be an exact match. This means that, for example,
    `docker images jav` does not match the image `java`.
@z

@x
    If both `REPOSITORY` and `TAG` are provided, only images matching that
    repository and tag are listed.  To find all local images in the `java`
    repository with tag `8` you can use:
@y
    If both `REPOSITORY` and `TAG` are provided, only images matching that
    repository and tag are listed.  To find all local images in the `java`
    repository with tag `8` you can use:
@z

@x
    ```console
    $ docker images java:8
@y
    ```console
    $ docker images java:8
@z

@x
    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    java                8                   308e519aac60        6 days ago          824.5 MB
    ```
@y
    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    java                8                   308e519aac60        6 days ago          824.5 MB
    ```
@z

@x
    If nothing matches `REPOSITORY[:TAG]`, the list is empty.
@y
    If nothing matches `REPOSITORY[:TAG]`, the list is empty.
@z

@x
    ```console
    $ docker images java:0
@y
    ```console
    $ docker images java:0
@z

@x
    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    ```
@y
    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    ```
@z

@x
    ### List the full length image IDs (--no-trunc) {#no-trunc}
@y
    ### List the full length image IDs (--no-trunc) {#no-trunc}
@z

@x
    ```console
    $ docker images --no-trunc
@y
    ```console
    $ docker images --no-trunc
@z

@x
    REPOSITORY                    TAG                 IMAGE ID                                                                  CREATED             SIZE
    <none>                        <none>              sha256:77af4d6b9913e693e8d0b4b294fa62ade6054e6b2f1ffb617ac955dd63fb0182   19 hours ago        1.089 GB
    committest                    latest              sha256:b6fa739cedf5ea12a620a439402b6004d057da800f91c7524b5086a5e4749c9f   19 hours ago        1.089 GB
    <none>                        <none>              sha256:78a85c484f71509adeaace20e72e941f6bdd2b25b4c75da8693efd9f61a37921   19 hours ago        1.089 GB
    docker                        latest              sha256:30557a29d5abc51e5f1d5b472e79b7e296f595abcf19fe6b9199dbbc809c6ff4   20 hours ago        1.089 GB
    <none>                        <none>              sha256:0124422dd9f9cf7ef15c0617cda3931ee68346455441d66ab8bdc5b05e9fdce5   20 hours ago        1.089 GB
    <none>                        <none>              sha256:18ad6fad340262ac2a636efd98a6d1f0ea775ae3d45240d3418466495a19a81b   22 hours ago        1.082 GB
    <none>                        <none>              sha256:f9f1e26352f0a3ba6a0ff68167559f64f3e21ff7ada60366e2d44a04befd1d3a   23 hours ago        1.089 GB
    tryout                        latest              sha256:2629d1fa0b81b222fca63371ca16cbf6a0772d07759ff80e8d1369b926940074   23 hours ago        131.5 MB
    <none>                        <none>              sha256:5ed6274db6ceb2397844896966ea239290555e74ef307030ebb01ff91b1914df   24 hours ago        1.089 GB
    ```
@y
    REPOSITORY                    TAG                 IMAGE ID                                                                  CREATED             SIZE
    <none>                        <none>              sha256:77af4d6b9913e693e8d0b4b294fa62ade6054e6b2f1ffb617ac955dd63fb0182   19 hours ago        1.089 GB
    committest                    latest              sha256:b6fa739cedf5ea12a620a439402b6004d057da800f91c7524b5086a5e4749c9f   19 hours ago        1.089 GB
    <none>                        <none>              sha256:78a85c484f71509adeaace20e72e941f6bdd2b25b4c75da8693efd9f61a37921   19 hours ago        1.089 GB
    docker                        latest              sha256:30557a29d5abc51e5f1d5b472e79b7e296f595abcf19fe6b9199dbbc809c6ff4   20 hours ago        1.089 GB
    <none>                        <none>              sha256:0124422dd9f9cf7ef15c0617cda3931ee68346455441d66ab8bdc5b05e9fdce5   20 hours ago        1.089 GB
    <none>                        <none>              sha256:18ad6fad340262ac2a636efd98a6d1f0ea775ae3d45240d3418466495a19a81b   22 hours ago        1.082 GB
    <none>                        <none>              sha256:f9f1e26352f0a3ba6a0ff68167559f64f3e21ff7ada60366e2d44a04befd1d3a   23 hours ago        1.089 GB
    tryout                        latest              sha256:2629d1fa0b81b222fca63371ca16cbf6a0772d07759ff80e8d1369b926940074   23 hours ago        131.5 MB
    <none>                        <none>              sha256:5ed6274db6ceb2397844896966ea239290555e74ef307030ebb01ff91b1914df   24 hours ago        1.089 GB
    ```
@z

@x
    ### List image digests (--digests) {#digests}
@y
    ### List image digests (--digests) {#digests}
@z

@x
    Images that use the v2 or later format have a content-addressable identifier
    called a `digest`. As long as the input used to generate the image is
    unchanged, the digest value is predictable. To list image digest values, use
    the `--digests` flag:
@y
    Images that use the v2 or later format have a content-addressable identifier
    called a `digest`. As long as the input used to generate the image is
    unchanged, the digest value is predictable. To list image digest values, use
    the `--digests` flag:
@z

@x
    ```console
    $ docker images --digests
    REPOSITORY                         TAG                 DIGEST                                                                    IMAGE ID            CREATED             SIZE
    localhost:5000/test/busybox        <none>              sha256:cbbf2f9a99b47fc460d422812b6a5adff7dfee951d8fa2e4a98caa0382cfbdbf   4986bf8c1536        9 weeks ago         2.43 MB
    ```
@y
    ```console
    $ docker images --digests
    REPOSITORY                         TAG                 DIGEST                                                                    IMAGE ID            CREATED             SIZE
    localhost:5000/test/busybox        <none>              sha256:cbbf2f9a99b47fc460d422812b6a5adff7dfee951d8fa2e4a98caa0382cfbdbf   4986bf8c1536        9 weeks ago         2.43 MB
    ```
@z

@x
    When pushing or pulling to a 2.0 registry, the `push` or `pull` command
    output includes the image digest. You can `pull` using a digest value. You can
    also reference by digest in `create`, `run`, and `rmi` commands, as well as the
    `FROM` image reference in a Dockerfile.
@y
    When pushing or pulling to a 2.0 registry, the `push` or `pull` command
    output includes the image digest. You can `pull` using a digest value. You can
    also reference by digest in `create`, `run`, and `rmi` commands, as well as the
    `FROM` image reference in a Dockerfile.
@z

@x
    ### Filtering (--filter) {#filter}
@y
    ### Filtering (--filter) {#filter}
@z

@x
    The filtering flag (`-f` or `--filter`) format is of "key=value". If there is more
    than one filter, then pass multiple flags (e.g., `--filter "foo=bar" --filter "bif=baz"`).
@y
    The filtering flag (`-f` or `--filter`) format is of "key=value". If there is more
    than one filter, then pass multiple flags (e.g., `--filter "foo=bar" --filter "bif=baz"`).
@z

@x
    The currently supported filters are:
@y
    The currently supported filters are:
@z

@x
    * dangling (boolean - true or false)
    * label (`label=<key>` or `label=<key>=<value>`)
    * before (`<image-name>[:<tag>]`,  `<image id>` or `<image@digest>`) - filter images created before given id or references
    * since (`<image-name>[:<tag>]`,  `<image id>` or `<image@digest>`) - filter images created since given id or references
    * reference (pattern of an image reference) - filter images whose reference matches the specified pattern
@y
    * dangling (boolean - true or false)
    * label (`label=<key>` or `label=<key>=<value>`)
    * before (`<image-name>[:<tag>]`,  `<image id>` or `<image@digest>`) - filter images created before given id or references
    * since (`<image-name>[:<tag>]`,  `<image id>` or `<image@digest>`) - filter images created since given id or references
    * reference (pattern of an image reference) - filter images whose reference matches the specified pattern
@z

@x
    #### Show untagged images (dangling)
@y
    #### Show untagged images (dangling)
@z

@x
    ```console
    $ docker images --filter "dangling=true"
@y
    ```console
    $ docker images --filter "dangling=true"
@z

@x
    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    <none>              <none>              8abc22fbb042        4 weeks ago         0 B
    <none>              <none>              48e5f45168b9        4 weeks ago         2.489 MB
    <none>              <none>              bf747efa0e2f        4 weeks ago         0 B
    <none>              <none>              980fe10e5736        12 weeks ago        101.4 MB
    <none>              <none>              dea752e4e117        12 weeks ago        101.4 MB
    <none>              <none>              511136ea3c5a        8 months ago        0 B
    ```
@y
    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    <none>              <none>              8abc22fbb042        4 weeks ago         0 B
    <none>              <none>              48e5f45168b9        4 weeks ago         2.489 MB
    <none>              <none>              bf747efa0e2f        4 weeks ago         0 B
    <none>              <none>              980fe10e5736        12 weeks ago        101.4 MB
    <none>              <none>              dea752e4e117        12 weeks ago        101.4 MB
    <none>              <none>              511136ea3c5a        8 months ago        0 B
    ```
@z

@x
    This will display untagged images that are the leaves of the images tree (not
    intermediary layers). These images occur when a new build of an image takes the
    `repo:tag` away from the image ID, leaving it as `<none>:<none>` or untagged.
    A warning will be issued if trying to remove an image when a container is presently
    using it. By having this flag it allows for batch cleanup.
@y
    This will display untagged images that are the leaves of the images tree (not
    intermediary layers). These images occur when a new build of an image takes the
    `repo:tag` away from the image ID, leaving it as `<none>:<none>` or untagged.
    A warning will be issued if trying to remove an image when a container is presently
    using it. By having this flag it allows for batch cleanup.
@z

@x
    You can use this in conjunction with `docker rmi`:
@y
    You can use this in conjunction with `docker rmi`:
@z

@x
    ```console
    $ docker rmi $(docker images -f "dangling=true" -q)
@y
    ```console
    $ docker rmi $(docker images -f "dangling=true" -q)
@z

@x
    8abc22fbb042
    48e5f45168b9
    bf747efa0e2f
    980fe10e5736
    dea752e4e117
    511136ea3c5a
    ```
@y
    8abc22fbb042
    48e5f45168b9
    bf747efa0e2f
    980fe10e5736
    dea752e4e117
    511136ea3c5a
    ```
@z

@x
    Docker warns you if any containers exist that are using these untagged images.
@y
    Docker warns you if any containers exist that are using these untagged images.
@z

@x
    #### Show images with a given label
@y
    #### Show images with a given label
@z

@x
    The `label` filter matches images based on the presence of a `label` alone or a `label` and a
    value.
@y
    The `label` filter matches images based on the presence of a `label` alone or a `label` and a
    value.
@z

@x
    The following filter matches images with the `com.example.version` label regardless of its value.
@y
    The following filter matches images with the `com.example.version` label regardless of its value.
@z

@x
    ```console
    $ docker images --filter "label=com.example.version"
@y
    ```console
    $ docker images --filter "label=com.example.version"
@z

@x
    REPOSITORY          TAG                 IMAGE ID            CREATED              SIZE
    match-me-1          latest              eeae25ada2aa        About a minute ago   188.3 MB
    match-me-2          latest              dea752e4e117        About a minute ago   188.3 MB
    ```
@y
    REPOSITORY          TAG                 IMAGE ID            CREATED              SIZE
    match-me-1          latest              eeae25ada2aa        About a minute ago   188.3 MB
    match-me-2          latest              dea752e4e117        About a minute ago   188.3 MB
    ```
@z

@x
    The following filter matches images with the `com.example.version` label with the `1.0` value.
@y
    The following filter matches images with the `com.example.version` label with the `1.0` value.
@z

@x
    ```console
    $ docker images --filter "label=com.example.version=1.0"
@y
    ```console
    $ docker images --filter "label=com.example.version=1.0"
@z

@x
    REPOSITORY          TAG                 IMAGE ID            CREATED              SIZE
    match-me            latest              511136ea3c5a        About a minute ago   188.3 MB
    ```
@y
    REPOSITORY          TAG                 IMAGE ID            CREATED              SIZE
    match-me            latest              511136ea3c5a        About a minute ago   188.3 MB
    ```
@z

@x
    In this example, with the `0.1` value, it returns an empty set because no matches were found.
@y
    In this example, with the `0.1` value, it returns an empty set because no matches were found.
@z

@x
    ```console
    $ docker images --filter "label=com.example.version=0.1"
    REPOSITORY          TAG                 IMAGE ID            CREATED              SIZE
    ```
@y
    ```console
    $ docker images --filter "label=com.example.version=0.1"
    REPOSITORY          TAG                 IMAGE ID            CREATED              SIZE
    ```
@z

@x
    #### Filter images by time
@y
    #### Filter images by time
@z

@x
    The `before` filter shows only images created before the image with
    a given ID or reference. For example, having these images:
@y
    The `before` filter shows only images created before the image with
    a given ID or reference. For example, having these images:
@z

@x
    ```console
    $ docker images
@y
    ```console
    $ docker images
@z

@x
    REPOSITORY          TAG                 IMAGE ID            CREATED              SIZE
    image1              latest              eeae25ada2aa        4 minutes ago        188.3 MB
    image2              latest              dea752e4e117        9 minutes ago        188.3 MB
    image3              latest              511136ea3c5a        25 minutes ago       188.3 MB
    ```
@y
    REPOSITORY          TAG                 IMAGE ID            CREATED              SIZE
    image1              latest              eeae25ada2aa        4 minutes ago        188.3 MB
    image2              latest              dea752e4e117        9 minutes ago        188.3 MB
    image3              latest              511136ea3c5a        25 minutes ago       188.3 MB
    ```
@z

@x
    Filtering with `before` would give:
@y
    Filtering with `before` would give:
@z

@x
    ```console
    $ docker images --filter "before=image1"
@y
    ```console
    $ docker images --filter "before=image1"
@z

@x
    REPOSITORY          TAG                 IMAGE ID            CREATED              SIZE
    image2              latest              dea752e4e117        9 minutes ago        188.3 MB
    image3              latest              511136ea3c5a        25 minutes ago       188.3 MB
    ```
@y
    REPOSITORY          TAG                 IMAGE ID            CREATED              SIZE
    image2              latest              dea752e4e117        9 minutes ago        188.3 MB
    image3              latest              511136ea3c5a        25 minutes ago       188.3 MB
    ```
@z

@x
    Filtering with `since` would give:
@y
    Filtering with `since` would give:
@z

@x
    ```console
    $ docker images --filter "since=image3"
    REPOSITORY          TAG                 IMAGE ID            CREATED              SIZE
    image1              latest              eeae25ada2aa        4 minutes ago        188.3 MB
    image2              latest              dea752e4e117        9 minutes ago        188.3 MB
    ```
@y
    ```console
    $ docker images --filter "since=image3"
    REPOSITORY          TAG                 IMAGE ID            CREATED              SIZE
    image1              latest              eeae25ada2aa        4 minutes ago        188.3 MB
    image2              latest              dea752e4e117        9 minutes ago        188.3 MB
    ```
@z

@x
    #### Filter images by reference
@y
    #### Filter images by reference
@z

@x
    The `reference` filter shows only images whose reference matches
    the specified pattern.
@y
    The `reference` filter shows only images whose reference matches
    the specified pattern.
@z

@x
    ```console
    $ docker images
@y
    ```console
    $ docker images
@z

@x
    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    busybox             latest              e02e811dd08f        5 weeks ago         1.09 MB
    busybox             uclibc              e02e811dd08f        5 weeks ago         1.09 MB
    busybox             musl                733eb3059dce        5 weeks ago         1.21 MB
    busybox             glibc               21c16b6787c6        5 weeks ago         4.19 MB
    ```
@y
    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    busybox             latest              e02e811dd08f        5 weeks ago         1.09 MB
    busybox             uclibc              e02e811dd08f        5 weeks ago         1.09 MB
    busybox             musl                733eb3059dce        5 weeks ago         1.21 MB
    busybox             glibc               21c16b6787c6        5 weeks ago         4.19 MB
    ```
@z

@x
    Filtering with `reference` would give:
@y
    Filtering with `reference` would give:
@z

@x
    ```console
    $ docker images --filter=reference='busy*:*libc'
@y
    ```console
    $ docker images --filter=reference='busy*:*libc'
@z

@x
    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    busybox             uclibc              e02e811dd08f        5 weeks ago         1.09 MB
    busybox             glibc               21c16b6787c6        5 weeks ago         4.19 MB
    ```
@y
    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    busybox             uclibc              e02e811dd08f        5 weeks ago         1.09 MB
    busybox             glibc               21c16b6787c6        5 weeks ago         4.19 MB
    ```
@z

@x
    Filtering with multiple `reference` would give, either match A or B:
@y
    Filtering with multiple `reference` would give, either match A or B:
@z

@x
    ```console
    $ docker images --filter=reference='busy*:uclibc' --filter=reference='busy*:glibc'
@y
    ```console
    $ docker images --filter=reference='busy*:uclibc' --filter=reference='busy*:glibc'
@z

@x
    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    busybox             uclibc              e02e811dd08f        5 weeks ago         1.09 MB
    busybox             glibc               21c16b6787c6        5 weeks ago         4.19 MB
    ```
@y
    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    busybox             uclibc              e02e811dd08f        5 weeks ago         1.09 MB
    busybox             glibc               21c16b6787c6        5 weeks ago         4.19 MB
    ```
@z

@x
    ### Format the output (--format) {#format}
@y
    ### Format the output (--format) {#format}
@z

@x
    The formatting option (`--format`) will pretty print container output
    using a Go template.
@y
    The formatting option (`--format`) will pretty print container output
    using a Go template.
@z

@x
    Valid placeholders for the Go template are listed below:
@y
    Valid placeholders for the Go template are listed below:
@z

@x
    | Placeholder     | Description                              |
    |-----------------|------------------------------------------|
    | `.ID`           | Image ID                                 |
    | `.Repository`   | Image repository                         |
    | `.Tag`          | Image tag                                |
    | `.Digest`       | Image digest                             |
    | `.CreatedSince` | Elapsed time since the image was created |
    | `.CreatedAt`    | Time when the image was created          |
    | `.Size`         | Image disk size                          |
@y
    | Placeholder     | Description                              |
    |-----------------|------------------------------------------|
    | `.ID`           | Image ID                                 |
    | `.Repository`   | Image repository                         |
    | `.Tag`          | Image tag                                |
    | `.Digest`       | Image digest                             |
    | `.CreatedSince` | Elapsed time since the image was created |
    | `.CreatedAt`    | Time when the image was created          |
    | `.Size`         | Image disk size                          |
@z

@x
    When using the `--format` option, the `image` command will either
    output the data exactly as the template declares or, when using the
    `table` directive, will include column headers as well.
@y
    When using the `--format` option, the `image` command will either
    output the data exactly as the template declares or, when using the
    `table` directive, will include column headers as well.
@z

@x
    The following example uses a template without headers and outputs the
    `ID` and `Repository` entries separated by a colon (`:`) for all images:
@y
    The following example uses a template without headers and outputs the
    `ID` and `Repository` entries separated by a colon (`:`) for all images:
@z

@x
    ```console
    $ docker images --format "{{.ID}}: {{.Repository}}"
@y
    ```console
    $ docker images --format "{{.ID}}: {{.Repository}}"
@z

@x
    77af4d6b9913: <none>
    b6fa739cedf5: committ
    78a85c484f71: <none>
    30557a29d5ab: docker
    5ed6274db6ce: <none>
    746b819f315e: postgres
    746b819f315e: postgres
    746b819f315e: postgres
    746b819f315e: postgres
    ```
@y
    77af4d6b9913: <none>
    b6fa739cedf5: committ
    78a85c484f71: <none>
    30557a29d5ab: docker
    5ed6274db6ce: <none>
    746b819f315e: postgres
    746b819f315e: postgres
    746b819f315e: postgres
    746b819f315e: postgres
    ```
@z

@x
    To list all images with their repository and tag in a table format you
    can use:
@y
    To list all images with their repository and tag in a table format you
    can use:
@z

@x
    ```console
    $ docker images --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}"
@y
    ```console
    $ docker images --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}"
@z

@x
    IMAGE ID            REPOSITORY                TAG
    77af4d6b9913        <none>                    <none>
    b6fa739cedf5        committ                   latest
    78a85c484f71        <none>                    <none>
    30557a29d5ab        docker                    latest
    5ed6274db6ce        <none>                    <none>
    746b819f315e        postgres                  9
    746b819f315e        postgres                  9.3
    746b819f315e        postgres                  9.3.5
    746b819f315e        postgres                  latest
    ```
@y
    IMAGE ID            REPOSITORY                TAG
    77af4d6b9913        <none>                    <none>
    b6fa739cedf5        committ                   latest
    78a85c484f71        <none>                    <none>
    30557a29d5ab        docker                    latest
    5ed6274db6ce        <none>                    <none>
    746b819f315e        postgres                  9
    746b819f315e        postgres                  9.3
    746b819f315e        postgres                  9.3.5
    746b819f315e        postgres                  latest
    ```
@z

@x
    To list all images in JSON format, use the `json` directive:
@y
    To list all images in JSON format, use the `json` directive:
@z

@x
    ```console
    $ docker images --format json
    {"Containers":"N/A","CreatedAt":"2021-03-04 03:24:42 +0100 CET","CreatedSince":"5 days ago","Digest":"\u003cnone\u003e","ID":"4dd97cefde62","Repository":"ubuntu","SharedSize":"N/A","Size":"72.9MB","Tag":"latest","UniqueSize":"N/A","VirtualSize":"72.9MB"}
    {"Containers":"N/A","CreatedAt":"2021-02-17 22:19:54 +0100 CET","CreatedSince":"2 weeks ago","Digest":"\u003cnone\u003e","ID":"28f6e2705743","Repository":"alpine","SharedSize":"N/A","Size":"5.61MB","Tag":"latest","UniqueSize":"N/A","VirtualSize":"5.613MB"}
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    ```console
    $ docker images --format json
    {"Containers":"N/A","CreatedAt":"2021-03-04 03:24:42 +0100 CET","CreatedSince":"5 days ago","Digest":"\u003cnone\u003e","ID":"4dd97cefde62","Repository":"ubuntu","SharedSize":"N/A","Size":"72.9MB","Tag":"latest","UniqueSize":"N/A","VirtualSize":"72.9MB"}
    {"Containers":"N/A","CreatedAt":"2021-02-17 22:19:54 +0100 CET","CreatedSince":"2 weeks ago","Digest":"\u003cnone\u003e","ID":"28f6e2705743","Repository":"alpine","SharedSize":"N/A","Size":"5.61MB","Tag":"latest","UniqueSize":"N/A","VirtualSize":"5.613MB"}
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
