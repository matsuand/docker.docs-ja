%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
title: Examples using the Docker Engine SDKs and Docker API
description: Examples on how to perform a given Docker operation using the Go and
  Python SDKs and the HTTP API using curl.
keywords: developing, api, sdk, developers, rest, curl, python, go
@y
title: Examples using the Docker Engine SDKs and Docker API
description: Examples on how to perform a given Docker operation using the Go and
  Python SDKs and the HTTP API using curl.
keywords: developing, api, sdk, developers, rest, curl, python, go
@z

@x
After you
[install Docker](../../../get-docker.md), you can
[install the Go or Python SDK](index.md#install-the-sdks) and
also try out the Docker Engine API.
@y
After you
[install Docker](../../../get-docker.md), you can
[install the Go or Python SDK](index.md#install-the-sdks) and
also try out the Docker Engine API.
@z

@x
Each of these examples show how to perform a given Docker operation using the Go
and Python SDKs and the HTTP API using `curl`.
@y
Each of these examples show how to perform a given Docker operation using the Go
and Python SDKs and the HTTP API using `curl`.
@z

@x
## Run a container
@y
## Run a container
@z

@x
This first example shows how to run a container using the Docker API. On the
command line, you would use the `docker run` command, but this is just as easy
to do from your own apps too.
@y
This first example shows how to run a container using the Docker API. On the
command line, you would use the `docker run` command, but this is just as easy
to do from your own apps too.
@z

@x
This is the equivalent of typing `docker run alpine echo hello world` at the
command prompt:
@y
This is the equivalent of typing `docker run alpine echo hello world` at the
command prompt:
@z

@x
{{< tabs group="lang" >}}
{{< tab name="Go" >}}
@y
{{< tabs group="lang" >}}
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
When using cURL to connect over a Unix socket, the hostname isn't important. The
previous examples use `localhost`, but any hostname would work.
@y
When using cURL to connect over a Unix socket, the hostname isn't important. The
previous examples use `localhost`, but any hostname would work.
@z

@x
> **Important**
>
> The previous examples assume you're using cURL 7.50.0 or above. Older versions of
> cURL used a [non-standard URL notation](https://github.com/moby/moby/issues/17960)
> when using a socket connection.
>
> If you're' using an older version of cURL, use `http:/<API version>/` instead,
> for example: `http:/v{{% param "latest_engine_api_version" %}}/containers/1c6594faf5/start`.
{ .important }
@y
> **Important**
>
> The previous examples assume you're using cURL 7.50.0 or above. Older versions of
> cURL used a [non-standard URL notation](https://github.com/moby/moby/issues/17960)
> when using a socket connection.
>
> If you're' using an older version of cURL, use `http:/<API version>/` instead,
> for example: `http:/v{{% param "latest_engine_api_version" %}}/containers/1c6594faf5/start`.
{ .important }
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Run a container in the background
@y
## Run a container in the background
@z

@x
You can also run containers in the background, the equivalent of typing
`docker run -d bfirsh/reticulate-splines`:
@y
You can also run containers in the background, the equivalent of typing
`docker run -d bfirsh/reticulate-splines`:
@z

@x
{{< tabs group="lang" >}}
{{< tab name="Go" >}}
@y
{{< tabs group="lang" >}}
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
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## List and manage containers
@y
## List and manage containers
@z

@x
You can use the API to list containers that are running, just like using
`docker ps`:
@y
You can use the API to list containers that are running, just like using
`docker ps`:
@z

@x
{{< tabs group="lang" >}}
{{< tab name="Go" >}}
@y
{{< tabs group="lang" >}}
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
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Stop all running containers
@y
## Stop all running containers
@z

@x
Now that you know what containers exist, you can perform operations on them.
This example stops all running containers.
@y
Now that you know what containers exist, you can perform operations on them.
This example stops all running containers.
@z

@x
> **Note**
>
> Don't run this on a production server. Also, if you're' using swarm
> services, the containers stop, but Docker creates new ones to keep
> the service running in its configured state.
@y
> **Note**
>
> Don't run this on a production server. Also, if you're' using swarm
> services, the containers stop, but Docker creates new ones to keep
> the service running in its configured state.
@z

@x
{{< tabs group="lang" >}}
{{< tab name="Go" >}}
@y
{{< tabs group="lang" >}}
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
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Print the logs of a specific container
@y
## Print the logs of a specific container
@z

@x
You can also perform actions on individual containers. This example prints the
logs of a container given its ID. You need to modify the code before running it
to change the hard-coded ID of the container to print the logs for.
@y
You can also perform actions on individual containers. This example prints the
logs of a container given its ID. You need to modify the code before running it
to change the hard-coded ID of the container to print the logs for.
@z

@x
{{< tabs group="lang" >}}
{{< tab name="Go" >}}
@y
{{< tabs group="lang" >}}
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
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## List all images
@y
## List all images
@z

@x
List the images on your Engine, similar to `docker image ls`:
@y
List the images on your Engine, similar to `docker image ls`:
@z

@x
{{< tabs group="lang" >}}
{{< tab name="Go" >}}
@y
{{< tabs group="lang" >}}
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
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Pull an image
@y
## Pull an image
@z

@x
Pull an image, like `docker pull`:
@y
Pull an image, like `docker pull`:
@z

@x
{{< tabs group="lang" >}}
{{< tab name="Go" >}}
@y
{{< tabs group="lang" >}}
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
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Pull an image with authentication
@y
## Pull an image with authentication
@z

@x
Pull an image, like `docker pull`, with authentication:
@y
Pull an image, like `docker pull`, with authentication:
@z

@x
> **Note**
>
> Credentials are sent in the clear. Docker's official registries use
> HTTPS. Private registries should also be configured to use HTTPS.
@y
> **Note**
>
> Credentials are sent in the clear. Docker's official registries use
> HTTPS. Private registries should also be configured to use HTTPS.
@z

@x
{{< tabs group="lang" >}}
{{< tab name="Go" >}}
@y
{{< tabs group="lang" >}}
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

@x
The Python SDK retrieves authentication information from the [credentials
store](/reference/cli/docker/login/#credentials-store) file and
integrates with [credential
helpers](https://github.com/docker/docker-credential-helpers). It's possible to override these credentials, but that's out of
scope for this example guide. After using `docker login`, the Python SDK
uses these credentials automatically.
@y
The Python SDK retrieves authentication information from the [credentials
store](__SUBDIR__/reference/cli/docker/login/#credentials-store) file and
integrates with [credential
helpers](https://github.com/docker/docker-credential-helpers). It's possible to override these credentials, but that's out of
scope for this example guide. After using `docker login`, the Python SDK
uses these credentials automatically.
@z

% snip code...

@x
{{< /tab >}}
{{< tab name="HTTP" >}}
@y
{{< /tab >}}
{{< tab name="HTTP" >}}
@z

@x
This example leaves the credentials in your shell's history, so consider
this a naive implementation. The credentials are passed as a Base-64-encoded
JSON structure.
@y
This example leaves the credentials in your shell's history, so consider
this a naive implementation. The credentials are passed as a Base-64-encoded
JSON structure.
@z

% snip command...

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Commit a container
@y
## Commit a container
@z

@x
Commit a container to create an image from its contents:
@y
Commit a container to create an image from its contents:
@z

@x
{{< tabs group="lang" >}}
{{< tab name="Go" >}}
@y
{{< tabs group="lang" >}}
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
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z
