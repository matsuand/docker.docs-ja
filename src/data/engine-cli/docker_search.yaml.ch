%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker search
short: Search Docker Hub for images
long: Search [Docker Hub](https://hub.docker.com) for images
usage: docker search [OPTIONS] TERM
pname: docker
plink: docker.yaml
options:
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
      description: Pretty-print search using a Go template
      details_url: '#format'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: limit
      value_type: int
      default_value: "0"
      description: Max number of search results
      details_url: '#limit'
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
    ### Search images by name
@y
command: docker search
short: Search Docker Hub for images
long: Search [Docker Hub](https://hub.docker.com) for images
usage: docker search [OPTIONS] TERM
pname: docker
plink: docker.yaml
options:
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
      description: Pretty-print search using a Go template
      details_url: '#format'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: limit
      value_type: int
      default_value: "0"
      description: Max number of search results
      details_url: '#limit'
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
    ### Search images by name
@z

@x
    This example displays images with a name containing 'busybox':
@y
    This example displays images with a name containing 'busybox':
@z

@x
    ```console
    $ docker search busybox
@y
    ```console
    $ docker search busybox
@z

@x
    NAME                             DESCRIPTION                                     STARS     OFFICIAL
    busybox                          Busybox base image.                             316       [OK]
    progrium/busybox                                                                 50
    radial/busyboxplus               Full-chain, Internet enabled, busybox made...   8
    odise/busybox-python                                                             2
    azukiapp/busybox                 This image is meant to be used as the base...   2
    ofayau/busybox-jvm               Prepare busybox to install a 32 bits JVM.       1
    shingonoide/archlinux-busybox    Arch Linux, a lightweight and flexible Lin...   1
    odise/busybox-curl                                                               1
    ofayau/busybox-libc32            Busybox with 32 bits (and 64 bits) libs         1
    peelsky/zulu-openjdk-busybox                                                     1
    skomma/busybox-data              Docker image suitable for data volume cont...   1
    elektritter/busybox-teamspeak    Lightweight teamspeak3 container based on...    1
    socketplane/busybox                                                              1
    oveits/docker-nginx-busybox      This is a tiny NginX docker image based on...   0
    ggtools/busybox-ubuntu           Busybox ubuntu version with extra goodies       0
    nikfoundas/busybox-confd         Minimal busybox based distribution of confd     0
    openshift/busybox-http-app                                                       0
    jllopis/busybox                                                                  0
    swyckoff/busybox                                                                 0
    powellquiring/busybox                                                            0
    williamyeh/busybox-sh            Docker image for BusyBox's sh                   0
    simplexsys/busybox-cli-powered   Docker busybox images, with a few often us...   0
    fhisamoto/busybox-java           Busybox java                                    0
    scottabernethy/busybox                                                           0
    marclop/busybox-solr
    ```
@y
    NAME                             DESCRIPTION                                     STARS     OFFICIAL
    busybox                          Busybox base image.                             316       [OK]
    progrium/busybox                                                                 50
    radial/busyboxplus               Full-chain, Internet enabled, busybox made...   8
    odise/busybox-python                                                             2
    azukiapp/busybox                 This image is meant to be used as the base...   2
    ofayau/busybox-jvm               Prepare busybox to install a 32 bits JVM.       1
    shingonoide/archlinux-busybox    Arch Linux, a lightweight and flexible Lin...   1
    odise/busybox-curl                                                               1
    ofayau/busybox-libc32            Busybox with 32 bits (and 64 bits) libs         1
    peelsky/zulu-openjdk-busybox                                                     1
    skomma/busybox-data              Docker image suitable for data volume cont...   1
    elektritter/busybox-teamspeak    Lightweight teamspeak3 container based on...    1
    socketplane/busybox                                                              1
    oveits/docker-nginx-busybox      This is a tiny NginX docker image based on...   0
    ggtools/busybox-ubuntu           Busybox ubuntu version with extra goodies       0
    nikfoundas/busybox-confd         Minimal busybox based distribution of confd     0
    openshift/busybox-http-app                                                       0
    jllopis/busybox                                                                  0
    swyckoff/busybox                                                                 0
    powellquiring/busybox                                                            0
    williamyeh/busybox-sh            Docker image for BusyBox's sh                   0
    simplexsys/busybox-cli-powered   Docker busybox images, with a few often us...   0
    fhisamoto/busybox-java           Busybox java                                    0
    scottabernethy/busybox                                                           0
    marclop/busybox-solr
    ```
@z

@x
    ### Display non-truncated description (--no-trunc) {#no-trunc}
@y
    ### Display non-truncated description (--no-trunc) {#no-trunc}
@z

@x
    This example displays images with a name containing 'busybox',
    at least 3 stars and the description isn't truncated in the output:
@y
    This example displays images with a name containing 'busybox',
    at least 3 stars and the description isn't truncated in the output:
@z

@x
    ```console
    $ docker search --filter=stars=3 --no-trunc busybox
@y
    ```console
    $ docker search --filter=stars=3 --no-trunc busybox
@z

@x
    NAME                 DESCRIPTION                                                                               STARS     OFFICIAL
    busybox              Busybox base image.                                                                       325       [OK]
    progrium/busybox                                                                                               50
    radial/busyboxplus   Full-chain, Internet enabled, busybox made from scratch. Comes in git and cURL flavors.   8
    ```
@y
    NAME                 DESCRIPTION                                                                               STARS     OFFICIAL
    busybox              Busybox base image.                                                                       325       [OK]
    progrium/busybox                                                                                               50
    radial/busyboxplus   Full-chain, Internet enabled, busybox made from scratch. Comes in git and cURL flavors.   8
    ```
@z

@x
    ### Limit search results (--limit) {#limit}
@y
    ### Limit search results (--limit) {#limit}
@z

@x
    The flag `--limit` is the maximum number of results returned by a search. If no
    value is set, the default is set by the daemon.
@y
    The flag `--limit` is the maximum number of results returned by a search. If no
    value is set, the default is set by the daemon.
@z

@x
    ### Filtering (--filter) {#filter}
@y
    ### Filtering (--filter) {#filter}
@z

@x
    The filtering flag (`-f` or `--filter`) format is a `key=value` pair. If there is more
    than one filter, then pass multiple flags (e.g. `--filter is-official=true --filter stars=3`).
@y
    The filtering flag (`-f` or `--filter`) format is a `key=value` pair. If there is more
    than one filter, then pass multiple flags (e.g. `--filter is-official=true --filter stars=3`).
@z

@x
    The currently supported filters are:
@y
    The currently supported filters are:
@z

@x
    - stars (int - number of stars the image has)
    - is-automated (boolean - true or false) - is the image automated or not (deprecated)
    - is-official (boolean - true or false) - is the image official or not
@y
    - stars (int - number of stars the image has)
    - is-automated (boolean - true or false) - is the image automated or not (deprecated)
    - is-official (boolean - true or false) - is the image official or not
@z

@x
    #### stars
@y
    #### stars
@z

@x
    This example displays images with a name containing 'busybox' and at
    least 3 stars:
@y
    This example displays images with a name containing 'busybox' and at
    least 3 stars:
@z

@x
    ```console
    $ docker search --filter stars=3 busybox
@y
    ```console
    $ docker search --filter stars=3 busybox
@z

@x
    NAME                 DESCRIPTION                                     STARS     OFFICIAL
    busybox              Busybox base image.                             325       [OK]
    progrium/busybox                                                     50
    radial/busyboxplus   Full-chain, Internet enabled, busybox made...   8
    ```
@y
    NAME                 DESCRIPTION                                     STARS     OFFICIAL
    busybox              Busybox base image.                             325       [OK]
    progrium/busybox                                                     50
    radial/busyboxplus   Full-chain, Internet enabled, busybox made...   8
    ```
@z

@x
    #### is-official
@y
    #### is-official
@z

@x
    This example displays images with a name containing 'busybox', at least
    3 stars and are official builds:
@y
    This example displays images with a name containing 'busybox', at least
    3 stars and are official builds:
@z

@x
    ```console
    $ docker search --filter is-official=true --filter stars=3 busybox
@y
    ```console
    $ docker search --filter is-official=true --filter stars=3 busybox
@z

@x
    NAME      DESCRIPTION           STARS     OFFICIAL
    busybox   Busybox base image.   325       [OK]
    ```
@y
    NAME      DESCRIPTION           STARS     OFFICIAL
    busybox   Busybox base image.   325       [OK]
    ```
@z

@x
    ### Format the output (--format) {#format}
@y
    ### Format the output (--format) {#format}
@z

@x
    The formatting option (`--format`) pretty-prints search output
    using a Go template.
@y
    The formatting option (`--format`) pretty-prints search output
    using a Go template.
@z

@x
    Valid placeholders for the Go template are:
@y
    Valid placeholders for the Go template are:
@z

@x
    | Placeholder    | Description                                    |
    |----------------|------------------------------------------------|
    | `.Name`        | Image Name                                     |
    | `.Description` | Image description                              |
    | `.StarCount`   | Number of stars for the image                  |
    | `.IsOfficial`  | "OK" if image is official                      |
    | `.IsAutomated` | "OK" if image build was automated (deprecated) |
@y
    | Placeholder    | Description                                    |
    |----------------|------------------------------------------------|
    | `.Name`        | Image Name                                     |
    | `.Description` | Image description                              |
    | `.StarCount`   | Number of stars for the image                  |
    | `.IsOfficial`  | "OK" if image is official                      |
    | `.IsAutomated` | "OK" if image build was automated (deprecated) |
@z

@x
    When you use the `--format` option, the `search` command will
    output the data exactly as the template declares. If you use the
    `table` directive, column headers are included as well.
@y
    When you use the `--format` option, the `search` command will
    output the data exactly as the template declares. If you use the
    `table` directive, column headers are included as well.
@z

@x
    The following example uses a template without headers and outputs the
    `Name` and `StarCount` entries separated by a colon (`:`) for all images:
@y
    The following example uses a template without headers and outputs the
    `Name` and `StarCount` entries separated by a colon (`:`) for all images:
@z

@x
    ```console
    $ docker search --format "{{.Name}}: {{.StarCount}}" nginx
@y
    ```console
    $ docker search --format "{{.Name}}: {{.StarCount}}" nginx
@z

@x
    nginx: 5441
    jwilder/nginx-proxy: 953
    richarvey/nginx-php-fpm: 353
    million12/nginx-php: 75
    webdevops/php-nginx: 70
    h3nrik/nginx-ldap: 35
    bitnami/nginx: 23
    evild/alpine-nginx: 14
    million12/nginx: 9
    maxexcloo/nginx: 7
    ```
@y
    nginx: 5441
    jwilder/nginx-proxy: 953
    richarvey/nginx-php-fpm: 353
    million12/nginx-php: 75
    webdevops/php-nginx: 70
    h3nrik/nginx-ldap: 35
    bitnami/nginx: 23
    evild/alpine-nginx: 14
    million12/nginx: 9
    maxexcloo/nginx: 7
    ```
@z

@x
    This example outputs a table format:
@y
    This example outputs a table format:
@z

@x
    ```console
    $ docker search --format "table {{.Name}}\t{{.IsOfficial}}" nginx
@y
    ```console
    $ docker search --format "table {{.Name}}\t{{.IsOfficial}}" nginx
@z

@x
    NAME                                     OFFICIAL
    nginx                                    [OK]
    jwilder/nginx-proxy
    richarvey/nginx-php-fpm
    jrcs/letsencrypt-nginx-proxy-companion
    million12/nginx-php
    webdevops/php-nginx
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    NAME                                     OFFICIAL
    nginx                                    [OK]
    jwilder/nginx-proxy
    richarvey/nginx-php-fpm
    jrcs/letsencrypt-nginx-proxy-companion
    million12/nginx-php
    webdevops/php-nginx
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
