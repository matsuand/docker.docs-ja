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
@y
    An image will be listed more than once if it has multiple repository names
    or tags. This single image (identifiable by its matching `IMAGE ID`)
    uses up the `SIZE` listed only once.
@z

@x
usage: docker image ls [OPTIONS] [REPOSITORY[:TAG]]
@y
usage: docker image ls [OPTIONS] [REPOSITORY[:TAG]]
@z

% options:

@x all
      description: Show all images (default hides intermediate images)
@y
      description: Show all images (default hides intermediate images)
@z

@x digests
      description: Show digests
@y
      description: Show digests
@z

@x filter
      description: Filter output based on conditions provided
@y
      description: Filter output based on conditions provided
@z

@x format
      description: |-
        Format output using a custom template:
        'table':            Print output in table format with column headers (default)
        'table TEMPLATE':   Print output in table format using the given Go template
        'json':             Print in JSON format
        'TEMPLATE':         Print output using the given Go template.
        Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates
@y
      description: |-
        Format output using a custom template:
        'table':            Print output in table format with column headers (default)
        'table TEMPLATE':   Print output in table format using the given Go template
        'json':             Print in JSON format
        'TEMPLATE':         Print output using the given Go template.
        Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates
@z

@x no-trunc
      description: Don't truncate output
@y
      description: Don't truncate output
@z

@x quiet
      description: Only show image IDs
@y
      description: Only show image IDs
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
    ### List the most recently created images
@y
examples: |-
    ### List the most recently created images
@z

% snip command...

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

% snip command...

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

% snip command...

@x
    If nothing matches `REPOSITORY[:TAG]`, the list is empty.
@y
    If nothing matches `REPOSITORY[:TAG]`, the list is empty.
@z

% snip command...

@x
    ### List the full length image IDs (--no-trunc) {#no-trunc}
@y
    ### List the full length image IDs (--no-trunc) {#no-trunc}
@z

% snip command...

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

% snip command...

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

% snip command...

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

% snip command...

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

% snip command...

@x
    The following filter matches images with the `com.example.version` label with the `1.0` value.
@y
    The following filter matches images with the `com.example.version` label with the `1.0` value.
@z

% snip command...

@x
    In this example, with the `0.1` value, it returns an empty set because no matches were found.
@y
    In this example, with the `0.1` value, it returns an empty set because no matches were found.
@z

% snip command...

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

% snip command...

@x
    Filtering with `before` would give:
@y
    Filtering with `before` would give:
@z

% snip command...

@x
    Filtering with `since` would give:
@y
    Filtering with `since` would give:
@z

% snip command...

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

% snip command...

@x
    Filtering with `reference` would give:
@y
    Filtering with `reference` would give:
@z

% snip command...

@x
    Filtering with multiple `reference` would give, either match A or B:
@y
    Filtering with multiple `reference` would give, either match A or B:
@z

% snip command...

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

% snip command...

@x
    To list all images with their repository and tag in a table format you
    can use:
@y
    To list all images with their repository and tag in a table format you
    can use:
@z

% snip command...

@x
    To list all images in JSON format, use the `json` directive:
@y
    To list all images in JSON format, use the `json` directive:
@z

% snip command...
% snip directives...
