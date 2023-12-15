%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker volume prune
short: Remove unused local volumes
long: |-
    Remove all unused local volumes. Unused local volumes are those which are not
    referenced by any containers. By default, it only removes anonymous volumes.
usage: docker volume prune [OPTIONS]
pname: docker volume
plink: docker_volume.yaml
options:
    - option: all
      shorthand: a
      value_type: bool
      default_value: "false"
      description: Remove all unused volumes, not just anonymous ones
      details_url: '#all'
      deprecated: false
      hidden: false
      min_api_version: "1.42"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: filter
      value_type: filter
      description: Provide filter values (e.g. `label=<label>`)
      details_url: '#filter'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Do not prompt for confirmation
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
    ```console
    $ docker volume prune
@y
command: docker volume prune
short: Remove unused local volumes
long: |-
    Remove all unused local volumes. Unused local volumes are those which are not
    referenced by any containers. By default, it only removes anonymous volumes.
usage: docker volume prune [OPTIONS]
pname: docker volume
plink: docker_volume.yaml
options:
    - option: all
      shorthand: a
      value_type: bool
      default_value: "false"
      description: Remove all unused volumes, not just anonymous ones
      details_url: '#all'
      deprecated: false
      hidden: false
      min_api_version: "1.42"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: filter
      value_type: filter
      description: Provide filter values (e.g. `label=<label>`)
      details_url: '#filter'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Do not prompt for confirmation
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
    ```console
    $ docker volume prune
@z

@x
    WARNING! This will remove anonymous local volumes not used by at least one container.
    Are you sure you want to continue? [y/N] y
    Deleted Volumes:
    07c7bdf3e34ab76d921894c2b834f073721fccfbbcba792aa7648e3a7a664c2e
    my-named-vol
@y
    WARNING! This will remove anonymous local volumes not used by at least one container.
    Are you sure you want to continue? [y/N] y
    Deleted Volumes:
    07c7bdf3e34ab76d921894c2b834f073721fccfbbcba792aa7648e3a7a664c2e
    my-named-vol
@z

@x
    Total reclaimed space: 36 B
    ```
@y
    Total reclaimed space: 36 B
    ```
@z

@x
    ### Filtering (--all, -a) {#all}
@y
    ### Filtering (--all, -a) {#all}
@z

@x
    Use the `--all` flag to prune both unused anonymous and named volumes.
@y
    Use the `--all` flag to prune both unused anonymous and named volumes.
@z

@x
    ### Filtering (--filter) {#filter}
@y
    ### Filtering (--filter) {#filter}
@z

@x
    The filtering flag (`--filter`) format is of "key=value". If there is more
    than one filter, then pass multiple flags (e.g., `--filter "foo=bar" --filter "bif=baz"`)
@y
    The filtering flag (`--filter`) format is of "key=value". If there is more
    than one filter, then pass multiple flags (e.g., `--filter "foo=bar" --filter "bif=baz"`)
@z

@x
    The currently supported filters are:
@y
    The currently supported filters are:
@z

@x
    * label (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or `label!=<key>=<value>`) - only remove volumes with (or without, in case `label!=...` is used) the specified labels.
@y
    * label (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or `label!=<key>=<value>`) - only remove volumes with (or without, in case `label!=...` is used) the specified labels.
@z

@x
    The `label` filter accepts two formats. One is the `label=...` (`label=<key>` or `label=<key>=<value>`),
    which removes volumes with the specified labels. The other
    format is the `label!=...` (`label!=<key>` or `label!=<key>=<value>`), which removes
    volumes without the specified labels.
deprecated: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    The `label` filter accepts two formats. One is the `label=...` (`label=<key>` or `label=<key>=<value>`),
    which removes volumes with the specified labels. The other
    format is the `label!=...` (`label!=<key>` or `label!=<key>=<value>`), which removes
    volumes without the specified labels.
deprecated: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
