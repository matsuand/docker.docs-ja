%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker volume prune
short: Remove unused local volumes
long: |-
    Remove all unused local volumes. Unused local volumes are those which are not
    referenced by any containers. By default, it only removes anonymous volumes.
usage: docker volume prune [OPTIONS]
@y
command: docker volume prune
short: Remove unused local volumes
long: |-
    Remove all unused local volumes. Unused local volumes are those which are not
    referenced by any containers. By default, it only removes anonymous volumes.
usage: docker volume prune [OPTIONS]
@z

% pname
% plink
% options:

@x all
      description: Remove all unused volumes, not just anonymous ones
@y
      description: Remove all unused volumes, not just anonymous ones
@z

@x filter
      description: Provide filter values (e.g. `label=<label>`)
@y
      description: Provide filter values (e.g. `label=<label>`)
@z

@x force
      description: Do not prompt for confirmation
@y
      description: Do not prompt for confirmation
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
@y
examples: |-
@z

% snip command...

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
    than one filter, then pass multiple flags (e.g., `--filter "foo=bar" --filter "bif=baz"`).
@y
    The filtering flag (`--filter`) format is of "key=value". If there is more
    than one filter, then pass multiple flags (e.g., `--filter "foo=bar" --filter "bif=baz"`).
@z

@x
    When multiple filters are provided, they are combined as follows:
@y
    When multiple filters are provided, they are combined as follows:
@z

@x
    - Multiple filters with **different keys** are combined using AND logic.
      A volume must satisfy all filter conditions to be pruned.
    - Multiple filters with the **same key** are combined using OR logic.
      A volume is pruned if it matches any of the values for that key.
@y
    - Multiple filters with **different keys** are combined using AND logic.
      A volume must satisfy all filter conditions to be pruned.
    - Multiple filters with the **same key** are combined using OR logic.
      A volume is pruned if it matches any of the values for that key.
@z

@x
    For example, `--filter "label=foo" --filter "label=bar"` prunes volumes that
    have **either** the `foo` **or** `bar` label, while
    `--filter "label=foo" --filter "label!=bar"` prunes volumes that have the
    `foo` label **and** do not have the `bar` label.
@y
    For example, `--filter "label=foo" --filter "label=bar"` prunes volumes that
    have **either** the `foo` **or** `bar` label, while
    `--filter "label=foo" --filter "label!=bar"` prunes volumes that have the
    `foo` label **and** do not have the `bar` label.
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
@y
    The `label` filter accepts two formats. One is the `label=...` (`label=<key>` or `label=<key>=<value>`),
    which removes volumes with the specified labels. The other
    format is the `label!=...` (`label!=<key>` or `label!=<key>=<value>`), which removes
    volumes without the specified labels.
@z

% snip directives...
