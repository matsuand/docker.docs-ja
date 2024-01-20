%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker buildx du
short: Disk usage
long: Disk usage
usage: docker buildx du
pname: docker buildx
plink: docker_buildx.yaml
options:
    - option: filter
      value_type: filter
      description: Provide filter values
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: verbose
      value_type: bool
      default_value: "false"
      description: Provide a more verbose output
      details_url: '#verbose'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: builder
      value_type: string
      description: Override the configured builder instance
      details_url: '#builder'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Show disk usage
@y
command: docker buildx du
short: Disk usage
long: Disk usage
usage: docker buildx du
pname: docker buildx
plink: docker_buildx.yaml
options:
    - option: filter
      value_type: filter
      description: Provide filter values
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: verbose
      value_type: bool
      default_value: "false"
      description: Provide a more verbose output
      details_url: '#verbose'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: builder
      value_type: string
      description: Override the configured builder instance
      details_url: '#builder'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Show disk usage
@z

@x
    The `docker buildx du` command shows the disk usage for the currently selected
    builder.
@y
    The `docker buildx du` command shows the disk usage for the currently selected
    builder.
@z

@x
    ```console
    $ docker buildx du
    ID                                RECLAIMABLE    SIZE          LAST ACCESSED
    12wgll9os87pazzft8lt0yztp*        true           1.704GB       13 days ago
    iupsv3it5ubh92aweb7c1wojc*        true           1.297GB       36 minutes ago
    ek4ve8h4obyv5kld6vicmtqyn         true           811.7MB       13 days ago
    isovrfnmkelzhtdx942w9vjcb*        true           811.7MB       13 days ago
    0jty7mjrndi1yo7xkv1baralh         true           810.5MB       13 days ago
    jyzkefmsysqiaakgwmjgxjpcz*        true           810.5MB       13 days ago
    z8w1y95jn93gvj92jtaj6uhwk         true           318MB         2 weeks ago
    rz2zgfcwlfxsxd7d41w2sz2tt         true           8.224kB*      43 hours ago
    n5bkzpewmk2eiu6hn9tzx18jd         true           8.224kB*      43 hours ago
    ao94g6vtbzdl6k5zgdmrmnwpt         true           8.224kB*      43 hours ago
    2pyjep7njm0wh39vcingxb97i         true           8.224kB*      43 hours ago
    Shared:        115.5MB
    Private:       10.25GB
    Reclaimable:   10.36GB
    Total:         10.36GB
    ```
@y
    ```console
    $ docker buildx du
    ID                                RECLAIMABLE    SIZE          LAST ACCESSED
    12wgll9os87pazzft8lt0yztp*        true           1.704GB       13 days ago
    iupsv3it5ubh92aweb7c1wojc*        true           1.297GB       36 minutes ago
    ek4ve8h4obyv5kld6vicmtqyn         true           811.7MB       13 days ago
    isovrfnmkelzhtdx942w9vjcb*        true           811.7MB       13 days ago
    0jty7mjrndi1yo7xkv1baralh         true           810.5MB       13 days ago
    jyzkefmsysqiaakgwmjgxjpcz*        true           810.5MB       13 days ago
    z8w1y95jn93gvj92jtaj6uhwk         true           318MB         2 weeks ago
    rz2zgfcwlfxsxd7d41w2sz2tt         true           8.224kB*      43 hours ago
    n5bkzpewmk2eiu6hn9tzx18jd         true           8.224kB*      43 hours ago
    ao94g6vtbzdl6k5zgdmrmnwpt         true           8.224kB*      43 hours ago
    2pyjep7njm0wh39vcingxb97i         true           8.224kB*      43 hours ago
    Shared:        115.5MB
    Private:       10.25GB
    Reclaimable:   10.36GB
    Total:         10.36GB
    ```
@z

@x
    If `RECLAIMABLE` is false, the `docker buildx du prune` command won't delete
    the record, even if you use `--all`. That's because the record is actively in
    use by some component of the builder.
@y
    If `RECLAIMABLE` is false, the `docker buildx du prune` command won't delete
    the record, even if you use `--all`. That's because the record is actively in
    use by some component of the builder.
@z

@x
    The asterisks (\*) in the default output indicate the following:
@y
    The asterisks (\*) in the default output indicate the following:
@z

@x
    - An asterisk next to an ID (`zu7m6evdpebh5h8kfkpw9dlf2*`) indicates that the record
      is mutable. The size of the record may change, or another build can take ownership of
      it and change or commit to it. If you run the `du` command again, this item may
      not be there anymore, or the size might be different.
    - An asterisk next to a size (`8.288kB*`) indicates that the record is shared.
      Storage of the record is shared with some other resource, typically an image.
      If you prune such a record then you will lose build cache but only metadata
      will be deleted as the image still needs to actual storage layers.
@y
    - An asterisk next to an ID (`zu7m6evdpebh5h8kfkpw9dlf2*`) indicates that the record
      is mutable. The size of the record may change, or another build can take ownership of
      it and change or commit to it. If you run the `du` command again, this item may
      not be there anymore, or the size might be different.
    - An asterisk next to a size (`8.288kB*`) indicates that the record is shared.
      Storage of the record is shared with some other resource, typically an image.
      If you prune such a record then you will lose build cache but only metadata
      will be deleted as the image still needs to actual storage layers.
@z

@x
    ### Use verbose output (--verbose) {#verbose}
@y
    ### Use verbose output (--verbose) {#verbose}
@z

@x
    The verbose output of the `docker buildx du` command is useful for inspecting
    the disk usage records in more detail. The verbose output shows the mutable and
    shared states more clearly, as well as additional information about the
    corresponding layer.
@y
    The verbose output of the `docker buildx du` command is useful for inspecting
    the disk usage records in more detail. The verbose output shows the mutable and
    shared states more clearly, as well as additional information about the
    corresponding layer.
@z

@x
    ```console
    $ docker buildx du --verbose
    ...
    Last used:      2 days ago
    Type:           regular
@y
    ```console
    $ docker buildx du --verbose
    ...
    Last used:      2 days ago
    Type:           regular
@z

@x
    ID:             05d0elirb4mmvpmnzbrp3ssrg
    Parent:         e8sfdn4mygrg7msi9ak1dy6op
    Created at:     2023-11-20 09:53:30.881558721 +0000 UTC
    Mutable:        false
    Reclaimable:    true
    Shared:         false
    Size:           0B
    Description:    [gobase 3/3] WORKDIR /src
    Usage count:    3
    Last used:      24 hours ago
    Type:           regular
@y
    ID:             05d0elirb4mmvpmnzbrp3ssrg
    Parent:         e8sfdn4mygrg7msi9ak1dy6op
    Created at:     2023-11-20 09:53:30.881558721 +0000 UTC
    Mutable:        false
    Reclaimable:    true
    Shared:         false
    Size:           0B
    Description:    [gobase 3/3] WORKDIR /src
    Usage count:    3
    Last used:      24 hours ago
    Type:           regular
@z

@x
    Reclaimable:    4.453GB
    Total:          4.453GB
    ```
@y
    Reclaimable:    4.453GB
    Total:          4.453GB
    ```
@z

@x
    ### Override the configured builder instance (--builder) {#builder}
@y
    ### Override the configured builder instance (--builder) {#builder}
@z

@x
    Use the `--builder` flag to inspect the disk usage of a particular builder.
@y
    Use the `--builder` flag to inspect the disk usage of a particular builder.
@z

@x
    ```console
    $ docker buildx du --builder youthful_shtern
    ID                                RECLAIMABLE    SIZE          LAST ACCESSED
    g41agepgdczekxg2mtw0dujsv*        true           1.312GB       47 hours ago
    e6ycrsa0bn9akigqgzu0sc6kr         true           318MB         47 hours ago
    our9zg4ndly65ze1ccczdksiz         true           204.9MB       45 hours ago
    b7xv3xpxnwupc81tc9ya3mgq6*        true           120.6MB       47 hours ago
    zihgye15ss6vum3wmck9egdoy*        true           79.81MB       2 days ago
    aaydharssv1ug98yhuwclkfrh*        true           79.81MB       2 days ago
    ta1r4vmnjug5dhub76as4kkol*        true           74.51MB       47 hours ago
    murma9f83j9h8miifbq68udjf*        true           74.51MB       47 hours ago
    47f961866a49g5y8myz80ixw1*        true           74.51MB       47 hours ago
    tzh99xtzlaf6txllh3cobag8t         true           74.49MB       47 hours ago
    ld6laoeuo1kwapysu6afwqybl*        true           59.89MB       47 hours ago
    yitxizi5kaplpyomqpos2cryp*        true           59.83MB       47 hours ago
    iy8aa4b7qjn0qmy9wiga9cj8w         true           33.65MB       47 hours ago
    mci7okeijyp8aqqk16j80dy09         true           19.86MB       47 hours ago
    lqvj091he652slxdla4wom3pz         true           14.08MB       47 hours ago
    fkt31oiv793nd26h42llsjcw7*        true           11.87MB       2 days ago
    uj802yxtvkcjysnjb4kgwvn2v         true           11.68MB       45 hours ago
    Reclaimable:    2.627GB
    Total:          2.627GB
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    ```console
    $ docker buildx du --builder youthful_shtern
    ID                                RECLAIMABLE    SIZE          LAST ACCESSED
    g41agepgdczekxg2mtw0dujsv*        true           1.312GB       47 hours ago
    e6ycrsa0bn9akigqgzu0sc6kr         true           318MB         47 hours ago
    our9zg4ndly65ze1ccczdksiz         true           204.9MB       45 hours ago
    b7xv3xpxnwupc81tc9ya3mgq6*        true           120.6MB       47 hours ago
    zihgye15ss6vum3wmck9egdoy*        true           79.81MB       2 days ago
    aaydharssv1ug98yhuwclkfrh*        true           79.81MB       2 days ago
    ta1r4vmnjug5dhub76as4kkol*        true           74.51MB       47 hours ago
    murma9f83j9h8miifbq68udjf*        true           74.51MB       47 hours ago
    47f961866a49g5y8myz80ixw1*        true           74.51MB       47 hours ago
    tzh99xtzlaf6txllh3cobag8t         true           74.49MB       47 hours ago
    ld6laoeuo1kwapysu6afwqybl*        true           59.89MB       47 hours ago
    yitxizi5kaplpyomqpos2cryp*        true           59.83MB       47 hours ago
    iy8aa4b7qjn0qmy9wiga9cj8w         true           33.65MB       47 hours ago
    mci7okeijyp8aqqk16j80dy09         true           19.86MB       47 hours ago
    lqvj091he652slxdla4wom3pz         true           14.08MB       47 hours ago
    fkt31oiv793nd26h42llsjcw7*        true           11.87MB       2 days ago
    uj802yxtvkcjysnjb4kgwvn2v         true           11.68MB       45 hours ago
    Reclaimable:    2.627GB
    Total:          2.627GB
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
