%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker image prune
short: Remove unused images
long: |
    Remove all dangling images. If `-a` is specified, also remove all images not referenced by any container.
usage: docker image prune [OPTIONS]
@y
command: docker image prune
short: Remove unused images
long: |
    Remove all dangling images. If `-a` is specified, also remove all images not referenced by any container.
usage: docker image prune [OPTIONS]
@z

% options:

@x all
      description: Remove all unused images, not just dangling ones
@y
      description: Remove all unused images, not just dangling ones
@z

@x filter
      description: Provide filter values (e.g. `until=<timestamp>`)
@y
      description: Provide filter values (e.g. `until=<timestamp>`)
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
    Example output:
@y
examples: |-
    Example output:
@z

% snip command...

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
    * until (`<timestamp>`) - only remove images created before given timestamp
    * label (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or `label!=<key>=<value>`) - only remove images with (or without, in case `label!=...` is used) the specified labels.
@y
    * until (`<timestamp>`) - only remove images created before given timestamp
    * label (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or `label!=<key>=<value>`) - only remove images with (or without, in case `label!=...` is used) the specified labels.
@z

@x
    The `until` filter can be Unix timestamps, date formatted
    timestamps, or Go duration strings supported by [ParseDuration](https://pkg.go.dev/time#ParseDuration) (e.g. `10m`, `1h30m`) computed
    relative to the daemon machine’s time. Supported formats for date
    formatted time stamps include RFC3339Nano, RFC3339, `2006-01-02T15:04:05`,
    `2006-01-02T15:04:05.999999999`, `2006-01-02T07:00`, and `2006-01-02`. The local
    timezone on the daemon will be used if you do not provide either a `Z` or a
    `+-00:00` timezone offset at the end of the timestamp.  When providing Unix
    timestamps enter seconds[.nanoseconds], where seconds is the number of seconds
    that have elapsed since January 1, 1970 (midnight UTC/GMT), not counting leap
    seconds (aka Unix epoch or Unix time), and the optional .nanoseconds field is a
    fraction of a second no more than nine digits long.
@y
    The `until` filter can be Unix timestamps, date formatted
    timestamps, or Go duration strings supported by [ParseDuration](https://pkg.go.dev/time#ParseDuration) (e.g. `10m`, `1h30m`) computed
    relative to the daemon machine’s time. Supported formats for date
    formatted time stamps include RFC3339Nano, RFC3339, `2006-01-02T15:04:05`,
    `2006-01-02T15:04:05.999999999`, `2006-01-02T07:00`, and `2006-01-02`. The local
    timezone on the daemon will be used if you do not provide either a `Z` or a
    `+-00:00` timezone offset at the end of the timestamp.  When providing Unix
    timestamps enter seconds[.nanoseconds], where seconds is the number of seconds
    that have elapsed since January 1, 1970 (midnight UTC/GMT), not counting leap
    seconds (aka Unix epoch or Unix time), and the optional .nanoseconds field is a
    fraction of a second no more than nine digits long.
@z

@x
    The `label` filter accepts two formats. One is the `label=...` (`label=<key>` or `label=<key>=<value>`),
    which removes images with the specified labels. The other
    format is the `label!=...` (`label!=<key>` or `label!=<key>=<value>`), which removes
    images without the specified labels.
@y
    The `label` filter accepts two formats. One is the `label=...` (`label=<key>` or `label=<key>=<value>`),
    which removes images with the specified labels. The other
    format is the `label!=...` (`label!=<key>` or `label!=<key>=<value>`), which removes
    images without the specified labels.
@z

@x
    > **Predicting what will be removed**
    >
    > If you are using positive filtering (testing for the existence of a label or
    > that a label has a specific value), you can use `docker image ls` with the
    > same filtering syntax to see which images match your filter.
    >
    > However, if you are using negative filtering (testing for the absence of a
    > label or that a label doesn't have a specific value), this type of filter
    > doesn't work with `docker image ls` so you cannot easily predict which images
    > will be removed. In addition, the confirmation prompt for `docker image prune`
    > always warns that all dangling images will be removed, even if you are using
    > `--filter`.
@y
    > **Predicting what will be removed**
    >
    > If you are using positive filtering (testing for the existence of a label or
    > that a label has a specific value), you can use `docker image ls` with the
    > same filtering syntax to see which images match your filter.
    >
    > However, if you are using negative filtering (testing for the absence of a
    > label or that a label doesn't have a specific value), this type of filter
    > doesn't work with `docker image ls` so you cannot easily predict which images
    > will be removed. In addition, the confirmation prompt for `docker image prune`
    > always warns that all dangling images will be removed, even if you are using
    > `--filter`.
@z

@x
    The following removes images created before `2017-01-04T00:00:00`:
@y
    The following removes images created before `2017-01-04T00:00:00`:
@z

% snip command...

@x
    The following removes images created more than 10 days (`240h`) ago:
@y
    The following removes images created more than 10 days (`240h`) ago:
@z

% snip command...

@x
    The following example removes images with the label `deprecated`:
@y
    The following example removes images with the label `deprecated`:
@z

% snip command...

@x
    The following example removes images with the label `maintainer` set to `john`:
@y
    The following example removes images with the label `maintainer` set to `john`:
@z

% snip command...

@x
    This example removes images which have no `maintainer` label:
@y
    This example removes images which have no `maintainer` label:
@z

% snip command...

@x
    This example removes images which have a maintainer label not set to `john`:
@y
    This example removes images which have a maintainer label not set to `john`:
@z

% snip command...

@x
    > [!NOTE]
    > You are prompted for confirmation before the `prune` removes
    > anything, but you are not shown a list of what will potentially be removed.
    > In addition, `docker image ls` doesn't support negative filtering, so it
    > difficult to predict what images will actually be removed.
@y
    > [!NOTE]
    > You are prompted for confirmation before the `prune` removes
    > anything, but you are not shown a list of what will potentially be removed.
    > In addition, `docker image ls` doesn't support negative filtering, so it
    > difficult to predict what images will actually be removed.
@z

% snip directives...
