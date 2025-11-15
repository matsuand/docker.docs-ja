%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
title: Develop with Docker Engine SDKs
linkTitle: SDK
@y
title: Develop with Docker Engine SDKs
linkTitle: SDK
@z

@x
description: Learn how to use Docker Engine SDKs to automate Docker tasks in your language of choice
keywords: developing, sdk, Docker Engine SDKs, install SDKs, SDK versions
@y
description: Learn how to use Docker Engine SDKs to automate Docker tasks in your language of choice
keywords: developing, sdk, Docker Engine SDKs, install SDKs, SDK versions
@z

@x
Docker provides an API for interacting with the Docker daemon (called the Docker
Engine API), as well as SDKs for Go and Python. The SDKs allow you to efficiently build and
scale Docker apps and solutions. If Go or Python don't work
for you, you can use the Docker Engine API directly.
@y
Docker provides an API for interacting with the Docker daemon (called the Docker
Engine API), as well as SDKs for Go and Python. The SDKs allow you to efficiently build and
scale Docker apps and solutions. If Go or Python don't work
for you, you can use the Docker Engine API directly.
@z

@x
The Docker Engine API is a RESTful API accessed by an HTTP client such as `wget` or
`curl`, or the HTTP library which is part of most modern programming languages.
@y
The Docker Engine API is a RESTful API accessed by an HTTP client such as `wget` or
`curl`, or the HTTP library which is part of most modern programming languages.
@z

@x
## Install the SDKs
@y
## Install the SDKs
@z

@x
Use the following commands to install the Go or Python SDK. Both SDKs can be
installed and coexist together.
@y
Use the following commands to install the Go or Python SDK. Both SDKs can be
installed and coexist together.
@z

@x
### Go SDK
@y
### Go SDK
@z

% snip command...

@x
The client requires a recent version of Go. Run `go version` and ensure that you're running a currently supported version of Go.
@y
The client requires a recent version of Go. Run `go version` and ensure that you're running a currently supported version of Go.
@z

@x
For more information, see [Docker Engine Go SDK reference](https://godoc.org/github.com/docker/docker/client).
@y
For more information, see [Docker Engine Go SDK reference](https://godoc.org/github.com/docker/docker/client).
@z

@x
### Python SDK
@y
### Python SDK
@z

@x
- Recommended: Run `pip install docker`.
@y
- Recommended: Run `pip install docker`.
@z

@x
- If you can't use `pip`:
@y
- If you can't use `pip`:
@z

@x
  1.  [Download the package directly](https://pypi.python.org/pypi/docker/).
  2.  Extract it and change to the extracted directory.
  3.  Run `python setup.py install`.
@y
  1.  [Download the package directly](https://pypi.python.org/pypi/docker/).
  2.  Extract it and change to the extracted directory.
  3.  Run `python setup.py install`.
@z

@x
For more information, see [Docker Engine Python SDK reference](https://docker-py.readthedocs.io/).
@y
For more information, see [Docker Engine Python SDK reference](https://docker-py.readthedocs.io/).
@z

@x
## View the API reference
@y
## View the API reference
@z

@x
You can
[view the reference for the latest version of the API](/reference/api/engine/latest/)
or [choose a specific version](/reference/api/engine/#api-version-matrix).
@y
You can
[view the reference for the latest version of the API](__SUBDIR__/reference/api/engine/latest/)
or [choose a specific version](__SUBDIR__/reference/api/engine/#api-version-matrix).
@z

@x
## Versioned API and SDK
@y
## Versioned API and SDK
@z

@x
The version of the Docker Engine API you should use depends on the version of
your Docker daemon and Docker client. See the [versioned API and SDK](/reference/api/engine/#versioned-api-and-sdk)
section in the API documentation for details.
@y
The version of the Docker Engine API you should use depends on the version of
your Docker daemon and Docker client. See the [versioned API and SDK](__SUBDIR__/reference/api/engine/#versioned-api-and-sdk)
section in the API documentation for details.
@z

@x
## SDK and API quickstart
@y
## SDK and API quickstart
@z

@x
Use the following guidelines to choose the SDK or API version to use in your
code:
@y
Use the following guidelines to choose the SDK or API version to use in your
code:
@z

@x
- If you're starting a new project, use the [latest version](/reference/api/engine/latest/),
  but use API version negotiation or specify the version you are using. This
  helps prevent surprises.
- If you need a new feature, update your code to use at least the minimum version
  that supports the feature, and prefer the latest version you can use.
- Otherwise, continue to use the version that your code is already using.
@y
- If you're starting a new project, use the [latest version](__SUBDIR__/reference/api/engine/latest/),
  but use API version negotiation or specify the version you are using. This
  helps prevent surprises.
- If you need a new feature, update your code to use at least the minimum version
  that supports the feature, and prefer the latest version you can use.
- Otherwise, continue to use the version that your code is already using.
@z

@x
As an example, the `docker run` command can be implemented using the
Docker API directly, or using the Python or Go SDK.
@y
As an example, the `docker run` command can be implemented using the
Docker API directly, or using the Python or Go SDK.
@z

@x
{{< tabs >}}
{{< tab name="Go" >}}
@y
{{< tabs >}}
{{< tab name="Go" >}}
@z

% snip code...

@x
{{< /tab >}}
{{< tab name="Python" >}}
@y
{{< /tab >}}
{{< tab name="Python" >}}
@z

% snip code...

@x
{{< /tab >}}
{{< tab name="HTTP" >}}
@y
{{< /tab >}}
{{< tab name="HTTP" >}}
@z

% snip command...

@x
When using cURL to connect over a Unix socket, the hostname is not important. The previous
examples use `localhost`, but any hostname would work.
@y
When using cURL to connect over a Unix socket, the hostname is not important. The previous
examples use `localhost`, but any hostname would work.
@z

@x
> [!IMPORTANT]
>
> The previous examples assume you're using cURL 7.50.0 or above. Older versions of
> cURL used a [non-standard URL notation](https://github.com/moby/moby/issues/17960)
> when using a socket connection.
>
> If you're' using an older version of cURL, use `http:/<API version>/` instead,
> for example: `http:/v{{% param "latest_engine_api_version" %}}/containers/1c6594faf5/start`.
@y
> [!IMPORTANT]
>
> The previous examples assume you're using cURL 7.50.0 or above. Older versions of
> cURL used a [non-standard URL notation](https://github.com/moby/moby/issues/17960)
> when using a socket connection.
>
> If you're' using an older version of cURL, use `http:/<API version>/` instead,
> for example: `http:/v{{% param "latest_engine_api_version" %}}/containers/1c6594faf5/start`.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
For more examples, take a look at the [SDK examples](examples.md).
@y
For more examples, take a look at the [SDK examples](examples.md).
@z

@x
## Unofficial libraries
@y
## Unofficial libraries
@z

@x
There are a number of community supported libraries available for other
languages. They haven't been tested by Docker, so if you run into any issues,
file them with the library maintainers.
@y
There are a number of community supported libraries available for other
languages. They haven't been tested by Docker, so if you run into any issues,
file them with the library maintainers.
@z

@x
| Language              | Library                                                                     |
|:----------------------|:----------------------------------------------------------------------------|
| C                     | [libdocker](https://github.com/danielsuo/libdocker)                         |
| C#                    | [Docker.DotNet](https://github.com/ahmetalpbalkan/Docker.DotNet)            |
| C++                   | [lasote/docker_client](https://github.com/lasote/docker_client)             |
| Clojure               | [clj-docker-client](https://github.com/into-docker/clj-docker-client)       |
| Clojure               | [contajners](https://github.com/lispyclouds/contajners)                     |
| Dart                  | [bwu_docker](https://github.com/bwu-dart/bwu_docker)                        |
| Erlang                | [erldocker](https://github.com/proger/erldocker)                            |
| Gradle                | [gradle-docker-plugin](https://github.com/gesellix/gradle-docker-plugin)    |
| Groovy                | [docker-client](https://github.com/gesellix/docker-client)                  |
| Haskell               | [docker-hs](https://github.com/denibertovic/docker-hs)                      |
| Java                  | [docker-client](https://github.com/spotify/docker-client)                   |
| Java                  | [docker-java](https://github.com/docker-java/docker-java)                   |
| Java                  | [docker-java-api](https://github.com/amihaiemil/docker-java-api)            |
| Java                  | [jocker](https://github.com/ndeloof/jocker)                                 |
| NodeJS                | [dockerode](https://github.com/apocas/dockerode)                            |
| NodeJS                | [harbor-master](https://github.com/arhea/harbor-master)                     |
| NodeJS                | [the-moby-effect](https://github.com/leonitousconforti/the-moby-effect)     |
| Perl                  | [Eixo::Docker](https://github.com/alambike/eixo-docker)                     |
| PHP                   | [Docker-PHP](https://github.com/docker-php/docker-php)                      |
| Ruby                  | [docker-api](https://github.com/swipely/docker-api)                         |
| Rust                  | [bollard](https://github.com/fussybeaver/bollard)                           |
| Rust                  | [docker-rust](https://github.com/abh1nav/docker-rust)                       |
| Rust                  | [shiplift](https://github.com/softprops/shiplift)                           |
| Scala                 | [tugboat](https://github.com/softprops/tugboat)                             |
| Scala                 | [reactive-docker](https://github.com/almoehi/reactive-docker)               |
| Swift                 | [docker-client-swift](https://github.com/valeriomazzeo/docker-client-swift) |
@y
| Language              | Library                                                                     |
|:----------------------|:----------------------------------------------------------------------------|
| C                     | [libdocker](https://github.com/danielsuo/libdocker)                         |
| C#                    | [Docker.DotNet](https://github.com/ahmetalpbalkan/Docker.DotNet)            |
| C++                   | [lasote/docker_client](https://github.com/lasote/docker_client)             |
| Clojure               | [clj-docker-client](https://github.com/into-docker/clj-docker-client)       |
| Clojure               | [contajners](https://github.com/lispyclouds/contajners)                     |
| Dart                  | [bwu_docker](https://github.com/bwu-dart/bwu_docker)                        |
| Erlang                | [erldocker](https://github.com/proger/erldocker)                            |
| Gradle                | [gradle-docker-plugin](https://github.com/gesellix/gradle-docker-plugin)    |
| Groovy                | [docker-client](https://github.com/gesellix/docker-client)                  |
| Haskell               | [docker-hs](https://github.com/denibertovic/docker-hs)                      |
| Java                  | [docker-client](https://github.com/spotify/docker-client)                   |
| Java                  | [docker-java](https://github.com/docker-java/docker-java)                   |
| Java                  | [docker-java-api](https://github.com/amihaiemil/docker-java-api)            |
| Java                  | [jocker](https://github.com/ndeloof/jocker)                                 |
| NodeJS                | [dockerode](https://github.com/apocas/dockerode)                            |
| NodeJS                | [harbor-master](https://github.com/arhea/harbor-master)                     |
| NodeJS                | [the-moby-effect](https://github.com/leonitousconforti/the-moby-effect)     |
| Perl                  | [Eixo::Docker](https://github.com/alambike/eixo-docker)                     |
| PHP                   | [Docker-PHP](https://github.com/docker-php/docker-php)                      |
| Ruby                  | [docker-api](https://github.com/swipely/docker-api)                         |
| Rust                  | [bollard](https://github.com/fussybeaver/bollard)                           |
| Rust                  | [docker-rust](https://github.com/abh1nav/docker-rust)                       |
| Rust                  | [shiplift](https://github.com/softprops/shiplift)                           |
| Scala                 | [tugboat](https://github.com/softprops/tugboat)                             |
| Scala                 | [reactive-docker](https://github.com/almoehi/reactive-docker)               |
| Swift                 | [docker-client-swift](https://github.com/valeriomazzeo/docker-client-swift) |
@z
