%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Examples using the Docker Engine SDKs and Docker API
description: Examples on how to perform a given Docker operation using the Go and
  Python SDKs and the HTTP API using curl.
keywords: developing, api, sdk, developers, rest, curl, python, go
aliases:
- /engine/api/getting-started/
- /engine/api/client-libraries/
- /engine/reference/api/remote_api_client_libraries/
- /reference/api/remote_api_client_libraries/
- /develop/sdk/examples/
---
@y
---
title: Examples using the Docker Engine SDKs and Docker API
description: Examples on how to perform a given Docker operation using the Go and
  Python SDKs and the HTTP API using curl.
keywords: developing, api, sdk, developers, rest, curl, python, go
aliases:
- /engine/api/getting-started/
- /engine/api/client-libraries/
- /engine/reference/api/remote_api_client_libraries/
- /reference/api/remote_api_client_libraries/
- /develop/sdk/examples/
---
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

@x
```go
package main
@y
```go
package main
@z

@x
import (
	"context"
	"io"
	"os"
@y
import (
	"context"
	"io"
	"os"
@z

@x
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/api/types/container"
	"github.com/docker/docker/client"
	"github.com/docker/docker/pkg/stdcopy"
)
@y
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/api/types/container"
	"github.com/docker/docker/client"
	"github.com/docker/docker/pkg/stdcopy"
)
@z

@x
func main() {
	ctx := context.Background()
	cli, err := client.NewClientWithOpts(client.FromEnv, client.WithAPIVersionNegotiation())
	if err != nil {
		panic(err)
	}
	defer cli.Close()
@y
func main() {
	ctx := context.Background()
	cli, err := client.NewClientWithOpts(client.FromEnv, client.WithAPIVersionNegotiation())
	if err != nil {
		panic(err)
	}
	defer cli.Close()
@z

@x
	reader, err := cli.ImagePull(ctx, "docker.io/library/alpine", types.ImagePullOptions{})
	if err != nil {
		panic(err)
	}
@y
	reader, err := cli.ImagePull(ctx, "docker.io/library/alpine", types.ImagePullOptions{})
	if err != nil {
		panic(err)
	}
@z

@x
	defer reader.Close()
	// cli.ImagePull is asynchronous.
	// The reader needs to be read completely for the pull operation to complete.
	// If stdout is not required, consider using io.Discard instead of os.Stdout.
	io.Copy(os.Stdout, reader)
@y
	defer reader.Close()
	// cli.ImagePull is asynchronous.
	// The reader needs to be read completely for the pull operation to complete.
	// If stdout is not required, consider using io.Discard instead of os.Stdout.
	io.Copy(os.Stdout, reader)
@z

@x
	resp, err := cli.ContainerCreate(ctx, &container.Config{
		Image: "alpine",
		Cmd:   []string{"echo", "hello world"},
		Tty:   false,
	}, nil, nil, nil, "")
	if err != nil {
		panic(err)
	}
@y
	resp, err := cli.ContainerCreate(ctx, &container.Config{
		Image: "alpine",
		Cmd:   []string{"echo", "hello world"},
		Tty:   false,
	}, nil, nil, nil, "")
	if err != nil {
		panic(err)
	}
@z

@x
	if err := cli.ContainerStart(ctx, resp.ID, types.ContainerStartOptions{}); err != nil {
		panic(err)
	}
@y
	if err := cli.ContainerStart(ctx, resp.ID, types.ContainerStartOptions{}); err != nil {
		panic(err)
	}
@z

@x
	statusCh, errCh := cli.ContainerWait(ctx, resp.ID, container.WaitConditionNotRunning)
	select {
	case err := <-errCh:
		if err != nil {
			panic(err)
		}
	case <-statusCh:
	}
@y
	statusCh, errCh := cli.ContainerWait(ctx, resp.ID, container.WaitConditionNotRunning)
	select {
	case err := <-errCh:
		if err != nil {
			panic(err)
		}
	case <-statusCh:
	}
@z

@x
	out, err := cli.ContainerLogs(ctx, resp.ID, types.ContainerLogsOptions{ShowStdout: true})
	if err != nil {
		panic(err)
	}
@y
	out, err := cli.ContainerLogs(ctx, resp.ID, types.ContainerLogsOptions{ShowStdout: true})
	if err != nil {
		panic(err)
	}
@z

@x
	stdcopy.StdCopy(os.Stdout, os.Stderr, out)
}
```
@y
	stdcopy.StdCopy(os.Stdout, os.Stderr, out)
}
```
@z

@x
{{< /tab >}}
{{< tab name="Python" >}}
@y
{{< /tab >}}
{{< tab name="Python" >}}
@z

@x
```python
import docker
client = docker.from_env()
print(client.containers.run("alpine", ["echo", "hello", "world"]))
```
@y
```python
import docker
client = docker.from_env()
print(client.containers.run("alpine", ["echo", "hello", "world"]))
```
@z

@x
{{< /tab >}}
{{< tab name="HTTP" >}}
@y
{{< /tab >}}
{{< tab name="HTTP" >}}
@z

@x
```console
$ curl --unix-socket /var/run/docker.sock -H "Content-Type: application/json" \
  -d '{"Image": "alpine", "Cmd": ["echo", "hello world"]}' \
  -X POST http://localhost/v{{% param "latest_engine_api_version" %}}/containers/create
{"Id":"1c6594faf5","Warnings":null}
@y
```console
$ curl --unix-socket /var/run/docker.sock -H "Content-Type: application/json" \
  -d '{"Image": "alpine", "Cmd": ["echo", "hello world"]}' \
  -X POST http://localhost/v{{% param "latest_engine_api_version" %}}/containers/create
{"Id":"1c6594faf5","Warnings":null}
@z

@x
$ curl --unix-socket /var/run/docker.sock -X POST http://localhost/v{{% param "latest_engine_api_version" %}}/containers/1c6594faf5/start
@y
$ curl --unix-socket /var/run/docker.sock -X POST http://localhost/v{{% param "latest_engine_api_version" %}}/containers/1c6594faf5/start
@z

@x
$ curl --unix-socket /var/run/docker.sock -X POST http://localhost/v{{% param "latest_engine_api_version" %}}/containers/1c6594faf5/wait
{"StatusCode":0}
@y
$ curl --unix-socket /var/run/docker.sock -X POST http://localhost/v{{% param "latest_engine_api_version" %}}/containers/1c6594faf5/wait
{"StatusCode":0}
@z

@x
$ curl --unix-socket /var/run/docker.sock "http://localhost/v{{% param "latest_engine_api_version" %}}/containers/1c6594faf5/logs?stdout=1"
hello world
```
@y
$ curl --unix-socket /var/run/docker.sock "http://localhost/v{{% param "latest_engine_api_version" %}}/containers/1c6594faf5/logs?stdout=1"
hello world
```
@z

@x
When using cURL to connect over a unix socket, the hostname is not important. The
examples above use `localhost`, but any hostname would work.
@y
When using cURL to connect over a unix socket, the hostname is not important. The
examples above use `localhost`, but any hostname would work.
@z

@x
> **Using cURL 7.47.0 or below?**
>
> The examples above assume you are using cURL 7.50.0 or above. Older versions of
> cURL used a [non-standard URL notation](https://github.com/moby/moby/issues/17960)
> when using a socket connection.
> 
> If you are using an older version of cURL, use `http:/<API version>/` instead,
> for example, `http:/v{{% param "latest_engine_api_version" %}}/containers/1c6594faf5/start`
{ .important }
@y
> **Using cURL 7.47.0 or below?**
>
> The examples above assume you are using cURL 7.50.0 or above. Older versions of
> cURL used a [non-standard URL notation](https://github.com/moby/moby/issues/17960)
> when using a socket connection.
> 
> If you are using an older version of cURL, use `http:/<API version>/` instead,
> for example, `http:/v{{% param "latest_engine_api_version" %}}/containers/1c6594faf5/start`
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

@x
```go
package main
@y
```go
package main
@z

@x
import (
	"context"
	"fmt"
	"io"
	"os"
@y
import (
	"context"
	"fmt"
	"io"
	"os"
@z

@x
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/api/types/container"
	"github.com/docker/docker/client"
)
@y
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/api/types/container"
	"github.com/docker/docker/client"
)
@z

@x
func main() {
	ctx := context.Background()
	cli, err := client.NewClientWithOpts(client.FromEnv, client.WithAPIVersionNegotiation())
	if err != nil {
		panic(err)
	}
	defer cli.Close()
@y
func main() {
	ctx := context.Background()
	cli, err := client.NewClientWithOpts(client.FromEnv, client.WithAPIVersionNegotiation())
	if err != nil {
		panic(err)
	}
	defer cli.Close()
@z

@x
	imageName := "bfirsh/reticulate-splines"
@y
	imageName := "bfirsh/reticulate-splines"
@z

@x
	out, err := cli.ImagePull(ctx, imageName, types.ImagePullOptions{})
	if err != nil {
		panic(err)
	}
	defer out.Close()
	io.Copy(os.Stdout, out)
@y
	out, err := cli.ImagePull(ctx, imageName, types.ImagePullOptions{})
	if err != nil {
		panic(err)
	}
	defer out.Close()
	io.Copy(os.Stdout, out)
@z

@x
	resp, err := cli.ContainerCreate(ctx, &container.Config{
		Image: imageName,
	}, nil, nil, nil, "")
	if err != nil {
		panic(err)
	}
@y
	resp, err := cli.ContainerCreate(ctx, &container.Config{
		Image: imageName,
	}, nil, nil, nil, "")
	if err != nil {
		panic(err)
	}
@z

@x
	if err := cli.ContainerStart(ctx, resp.ID, types.ContainerStartOptions{}); err != nil {
		panic(err)
	}
@y
	if err := cli.ContainerStart(ctx, resp.ID, types.ContainerStartOptions{}); err != nil {
		panic(err)
	}
@z

@x
	fmt.Println(resp.ID)
}
```
@y
	fmt.Println(resp.ID)
}
```
@z

@x
{{< /tab >}}
{{< tab name="Python" >}}
@y
{{< /tab >}}
{{< tab name="Python" >}}
@z

@x
```python
import docker
client = docker.from_env()
container = client.containers.run("bfirsh/reticulate-splines", detach=True)
print(container.id)
```
@y
```python
import docker
client = docker.from_env()
container = client.containers.run("bfirsh/reticulate-splines", detach=True)
print(container.id)
```
@z

@x
{{< /tab >}}
{{< tab name="HTTP" >}}
@y
{{< /tab >}}
{{< tab name="HTTP" >}}
@z

@x
```console
$ curl --unix-socket /var/run/docker.sock -H "Content-Type: application/json" \
  -d '{"Image": "bfirsh/reticulate-splines"}' \
  -X POST http://localhost/v{{% param "latest_engine_api_version" %}}/containers/create
{"Id":"1c6594faf5","Warnings":null}
@y
```console
$ curl --unix-socket /var/run/docker.sock -H "Content-Type: application/json" \
  -d '{"Image": "bfirsh/reticulate-splines"}' \
  -X POST http://localhost/v{{% param "latest_engine_api_version" %}}/containers/create
{"Id":"1c6594faf5","Warnings":null}
@z

@x
$ curl --unix-socket /var/run/docker.sock -X POST http://localhost/v{{% param "latest_engine_api_version" %}}/containers/1c6594faf5/start
```
@y
$ curl --unix-socket /var/run/docker.sock -X POST http://localhost/v{{% param "latest_engine_api_version" %}}/containers/1c6594faf5/start
```
@z

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

@x
```go
package main
@y
```go
package main
@z

@x
import (
	"context"
	"fmt"
@y
import (
	"context"
	"fmt"
@z

@x
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/client"
)
@y
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/client"
)
@z

@x
func main() {
	ctx := context.Background()
	cli, err := client.NewClientWithOpts(client.FromEnv, client.WithAPIVersionNegotiation())
	if err != nil {
		panic(err)
	}
	defer cli.Close()
@y
func main() {
	ctx := context.Background()
	cli, err := client.NewClientWithOpts(client.FromEnv, client.WithAPIVersionNegotiation())
	if err != nil {
		panic(err)
	}
	defer cli.Close()
@z

@x
	containers, err := cli.ContainerList(ctx, types.ContainerListOptions{})
	if err != nil {
		panic(err)
	}
@y
	containers, err := cli.ContainerList(ctx, types.ContainerListOptions{})
	if err != nil {
		panic(err)
	}
@z

@x
	for _, container := range containers {
		fmt.Println(container.ID)
	}
}
```
@y
	for _, container := range containers {
		fmt.Println(container.ID)
	}
}
```
@z

@x
{{< /tab >}}
{{< tab name="Python" >}}
@y
{{< /tab >}}
{{< tab name="Python" >}}
@z

@x
```python
import docker
client = docker.from_env()
for container in client.containers.list():
  print(container.id)
```
@y
```python
import docker
client = docker.from_env()
for container in client.containers.list():
  print(container.id)
```
@z

@x
{{< /tab >}}
{{< tab name="HTTP" >}}
@y
{{< /tab >}}
{{< tab name="HTTP" >}}
@z

@x
```console
$ curl --unix-socket /var/run/docker.sock http://localhost/v{{% param "latest_engine_api_version" %}}/containers/json
[{
  "Id":"ae63e8b89a26f01f6b4b2c9a7817c31a1b6196acf560f66586fbc8809ffcd772",
  "Names":["/tender_wing"],
  "Image":"bfirsh/reticulate-splines",
  ...
}]
```
@y
```console
$ curl --unix-socket /var/run/docker.sock http://localhost/v{{% param "latest_engine_api_version" %}}/containers/json
[{
  "Id":"ae63e8b89a26f01f6b4b2c9a7817c31a1b6196acf560f66586fbc8809ffcd772",
  "Names":["/tender_wing"],
  "Image":"bfirsh/reticulate-splines",
  ...
}]
```
@z

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
> **Note**: Don't run this on a production server. Also, if you are using swarm
> services, the containers stop, but Docker creates new ones to keep
> the service running in its configured state.
@y
> **Note**: Don't run this on a production server. Also, if you are using swarm
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

@x
```go
package main
@y
```go
package main
@z

@x
import (
	"context"
	"fmt"
@y
import (
	"context"
	"fmt"
@z

@x
	"github.com/docker/docker/api/types"
	containertypes "github.com/docker/docker/api/types/container"
	"github.com/docker/docker/client"
)
@y
	"github.com/docker/docker/api/types"
	containertypes "github.com/docker/docker/api/types/container"
	"github.com/docker/docker/client"
)
@z

@x
func main() {
	ctx := context.Background()
	cli, err := client.NewClientWithOpts(client.FromEnv, client.WithAPIVersionNegotiation())
	if err != nil {
		panic(err)
	}
	defer cli.Close()
@y
func main() {
	ctx := context.Background()
	cli, err := client.NewClientWithOpts(client.FromEnv, client.WithAPIVersionNegotiation())
	if err != nil {
		panic(err)
	}
	defer cli.Close()
@z

@x
	containers, err := cli.ContainerList(ctx, types.ContainerListOptions{})
	if err != nil {
		panic(err)
	}
@y
	containers, err := cli.ContainerList(ctx, types.ContainerListOptions{})
	if err != nil {
		panic(err)
	}
@z

@x
	for _, container := range containers {
		fmt.Print("Stopping container ", container.ID[:10], "... ")
		noWaitTimeout := 0 // to not wait for the container to exit gracefully
		if err := cli.ContainerStop(ctx, container.ID, containertypes.StopOptions{Timeout: &noWaitTimeout}); err != nil {
			panic(err)
		}
		fmt.Println("Success")
	}
}
```
@y
	for _, container := range containers {
		fmt.Print("Stopping container ", container.ID[:10], "... ")
		noWaitTimeout := 0 // to not wait for the container to exit gracefully
		if err := cli.ContainerStop(ctx, container.ID, containertypes.StopOptions{Timeout: &noWaitTimeout}); err != nil {
			panic(err)
		}
		fmt.Println("Success")
	}
}
```
@z

@x
{{< /tab >}}
{{< tab name="Python" >}}
@y
{{< /tab >}}
{{< tab name="Python" >}}
@z

@x
```python
import docker
client = docker.from_env()
for container in client.containers.list():
  container.stop()
```
@y
```python
import docker
client = docker.from_env()
for container in client.containers.list():
  container.stop()
```
@z

@x
{{< /tab >}}
{{< tab name="HTTP" >}}
@y
{{< /tab >}}
{{< tab name="HTTP" >}}
@z

@x
```console
$ curl --unix-socket /var/run/docker.sock http://localhost/v{{% param "latest_engine_api_version" %}}/containers/json
[{
  "Id":"ae63e8b89a26f01f6b4b2c9a7817c31a1b6196acf560f66586fbc8809ffcd772",
  "Names":["/tender_wing"],
  "Image":"bfirsh/reticulate-splines",
  ...
}]
@y
```console
$ curl --unix-socket /var/run/docker.sock http://localhost/v{{% param "latest_engine_api_version" %}}/containers/json
[{
  "Id":"ae63e8b89a26f01f6b4b2c9a7817c31a1b6196acf560f66586fbc8809ffcd772",
  "Names":["/tender_wing"],
  "Image":"bfirsh/reticulate-splines",
  ...
}]
@z

@x
$ curl --unix-socket /var/run/docker.sock \
  -X POST http://localhost/v{{% param "latest_engine_api_version" %}}/containers/ae63e8b89a26/stop
```
@y
$ curl --unix-socket /var/run/docker.sock \
  -X POST http://localhost/v{{% param "latest_engine_api_version" %}}/containers/ae63e8b89a26/stop
```
@z

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

@x
```go
package main
@y
```go
package main
@z

@x
import (
	"context"
	"io"
	"os"
@y
import (
	"context"
	"io"
	"os"
@z

@x
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/client"
)
@y
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/client"
)
@z

@x
func main() {
	ctx := context.Background()
	cli, err := client.NewClientWithOpts(client.FromEnv, client.WithAPIVersionNegotiation())
	if err != nil {
		panic(err)
	}
	defer cli.Close()
@y
func main() {
	ctx := context.Background()
	cli, err := client.NewClientWithOpts(client.FromEnv, client.WithAPIVersionNegotiation())
	if err != nil {
		panic(err)
	}
	defer cli.Close()
@z

@x
	options := types.ContainerLogsOptions{ShowStdout: true}
	// Replace this ID with a container that really exists
	out, err := cli.ContainerLogs(ctx, "f1064a8a4c82", options)
	if err != nil {
		panic(err)
	}
@y
	options := types.ContainerLogsOptions{ShowStdout: true}
	// Replace this ID with a container that really exists
	out, err := cli.ContainerLogs(ctx, "f1064a8a4c82", options)
	if err != nil {
		panic(err)
	}
@z

@x
	io.Copy(os.Stdout, out)
}
```
@y
	io.Copy(os.Stdout, out)
}
```
@z

@x
{{< /tab >}}
{{< tab name="Python" >}}
@y
{{< /tab >}}
{{< tab name="Python" >}}
@z

@x
```python
import docker
client = docker.from_env()
container = client.containers.get('f1064a8a4c82')
print(container.logs())
```
@y
```python
import docker
client = docker.from_env()
container = client.containers.get('f1064a8a4c82')
print(container.logs())
```
@z

@x
{{< /tab >}}
{{< tab name="HTTP" >}}
@y
{{< /tab >}}
{{< tab name="HTTP" >}}
@z

@x
```console
$ curl --unix-socket /var/run/docker.sock "http://localhost/v{{% param "latest_engine_api_version" %}}/containers/ca5f55cdb/logs?stdout=1"
Reticulating spline 1...
Reticulating spline 2...
Reticulating spline 3...
Reticulating spline 4...
Reticulating spline 5...
```
@y
```console
$ curl --unix-socket /var/run/docker.sock "http://localhost/v{{% param "latest_engine_api_version" %}}/containers/ca5f55cdb/logs?stdout=1"
Reticulating spline 1...
Reticulating spline 2...
Reticulating spline 3...
Reticulating spline 4...
Reticulating spline 5...
```
@z

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

@x
```go
package main
@y
```go
package main
@z

@x
import (
	"context"
	"fmt"
@y
import (
	"context"
	"fmt"
@z

@x
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/client"
)
@y
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/client"
)
@z

@x
func main() {
	ctx := context.Background()
	cli, err := client.NewClientWithOpts(client.FromEnv, client.WithAPIVersionNegotiation())
	if err != nil {
		panic(err)
	}
	defer cli.Close()
@y
func main() {
	ctx := context.Background()
	cli, err := client.NewClientWithOpts(client.FromEnv, client.WithAPIVersionNegotiation())
	if err != nil {
		panic(err)
	}
	defer cli.Close()
@z

@x
	images, err := cli.ImageList(ctx, types.ImageListOptions{})
	if err != nil {
		panic(err)
	}
@y
	images, err := cli.ImageList(ctx, types.ImageListOptions{})
	if err != nil {
		panic(err)
	}
@z

@x
	for _, image := range images {
		fmt.Println(image.ID)
	}
}
```
@y
	for _, image := range images {
		fmt.Println(image.ID)
	}
}
```
@z

@x
{{< /tab >}}
{{< tab name="Python" >}}
@y
{{< /tab >}}
{{< tab name="Python" >}}
@z

@x
```python
import docker
client = docker.from_env()
for image in client.images.list():
  print(image.id)
```
@y
```python
import docker
client = docker.from_env()
for image in client.images.list():
  print(image.id)
```
@z

@x
{{< /tab >}}
{{< tab name="HTTP" >}}
@y
{{< /tab >}}
{{< tab name="HTTP" >}}
@z

@x
```console
$ curl --unix-socket /var/run/docker.sock http://localhost/v{{% param "latest_engine_api_version" %}}/images/json
[{
  "Id":"sha256:31d9a31e1dd803470c5a151b8919ef1988ac3efd44281ac59d43ad623f275dcd",
  "ParentId":"sha256:ee4603260daafe1a8c2f3b78fd760922918ab2441cbb2853ed5c439e59c52f96",
  ...
}]
```
@y
```console
$ curl --unix-socket /var/run/docker.sock http://localhost/v{{% param "latest_engine_api_version" %}}/images/json
[{
  "Id":"sha256:31d9a31e1dd803470c5a151b8919ef1988ac3efd44281ac59d43ad623f275dcd",
  "ParentId":"sha256:ee4603260daafe1a8c2f3b78fd760922918ab2441cbb2853ed5c439e59c52f96",
  ...
}]
```
@z

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

@x
```go
package main
@y
```go
package main
@z

@x
import (
	"context"
	"io"
	"os"
@y
import (
	"context"
	"io"
	"os"
@z

@x
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/client"
)
@y
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/client"
)
@z

@x
func main() {
	ctx := context.Background()
	cli, err := client.NewClientWithOpts(client.FromEnv, client.WithAPIVersionNegotiation())
	if err != nil {
		panic(err)
	}
	defer cli.Close()
@y
func main() {
	ctx := context.Background()
	cli, err := client.NewClientWithOpts(client.FromEnv, client.WithAPIVersionNegotiation())
	if err != nil {
		panic(err)
	}
	defer cli.Close()
@z

@x
	out, err := cli.ImagePull(ctx, "alpine", types.ImagePullOptions{})
	if err != nil {
		panic(err)
	}
@y
	out, err := cli.ImagePull(ctx, "alpine", types.ImagePullOptions{})
	if err != nil {
		panic(err)
	}
@z

@x
	defer out.Close()
@y
	defer out.Close()
@z

@x
	io.Copy(os.Stdout, out)
}
```
@y
	io.Copy(os.Stdout, out)
}
```
@z

@x
{{< /tab >}}
{{< tab name="Python" >}}
@y
{{< /tab >}}
{{< tab name="Python" >}}
@z

@x
```python
import docker
client = docker.from_env()
image = client.images.pull("alpine")
print(image.id)
```
@y
```python
import docker
client = docker.from_env()
image = client.images.pull("alpine")
print(image.id)
```
@z

@x
{{< /tab >}}
{{< tab name="HTTP" >}}
@y
{{< /tab >}}
{{< tab name="HTTP" >}}
@z

@x
```console
$ curl --unix-socket /var/run/docker.sock \
  -X POST "http://localhost/v{{% param "latest_engine_api_version" %}}/images/create?fromImage=alpine"
{"status":"Pulling from library/alpine","id":"3.1"}
{"status":"Pulling fs layer","progressDetail":{},"id":"8f13703509f7"}
{"status":"Downloading","progressDetail":{"current":32768,"total":2244027},"progress":"[\u003e                                                  ] 32.77 kB/2.244 MB","id":"8f13703509f7"}
...
```
@y
```console
$ curl --unix-socket /var/run/docker.sock \
  -X POST "http://localhost/v{{% param "latest_engine_api_version" %}}/images/create?fromImage=alpine"
{"status":"Pulling from library/alpine","id":"3.1"}
{"status":"Pulling fs layer","progressDetail":{},"id":"8f13703509f7"}
{"status":"Downloading","progressDetail":{"current":32768,"total":2244027},"progress":"[\u003e                                                  ] 32.77 kB/2.244 MB","id":"8f13703509f7"}
...
```
@z

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
> **Note**: Credentials are sent in the clear. Docker's official registries use
> HTTPS. Private registries should also be configured to use HTTPS.
@y
> **Note**: Credentials are sent in the clear. Docker's official registries use
> HTTPS. Private registries should also be configured to use HTTPS.
@z

@x
{{< tabs group="lang" >}}
{{< tab name="Go" >}}
@y
{{< tabs group="lang" >}}
{{< tab name="Go" >}}
@z

@x
```go
package main
@y
```go
package main
@z

@x
import (
	"context"
	"encoding/base64"
	"encoding/json"
	"io"
	"os"
@y
import (
	"context"
	"encoding/base64"
	"encoding/json"
	"io"
	"os"
@z

@x
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/client"
)
@y
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/client"
)
@z

@x
func main() {
	ctx := context.Background()
	cli, err := client.NewClientWithOpts(client.FromEnv, client.WithAPIVersionNegotiation())
	if err != nil {
		panic(err)
	}
	defer cli.Close()
@y
func main() {
	ctx := context.Background()
	cli, err := client.NewClientWithOpts(client.FromEnv, client.WithAPIVersionNegotiation())
	if err != nil {
		panic(err)
	}
	defer cli.Close()
@z

@x
	authConfig := types.AuthConfig{
		Username: "username",
		Password: "password",
	}
	encodedJSON, err := json.Marshal(authConfig)
	if err != nil {
		panic(err)
	}
	authStr := base64.URLEncoding.EncodeToString(encodedJSON)
@y
	authConfig := types.AuthConfig{
		Username: "username",
		Password: "password",
	}
	encodedJSON, err := json.Marshal(authConfig)
	if err != nil {
		panic(err)
	}
	authStr := base64.URLEncoding.EncodeToString(encodedJSON)
@z

@x
	out, err := cli.ImagePull(ctx, "alpine", types.ImagePullOptions{RegistryAuth: authStr})
	if err != nil {
		panic(err)
	}
@y
	out, err := cli.ImagePull(ctx, "alpine", types.ImagePullOptions{RegistryAuth: authStr})
	if err != nil {
		panic(err)
	}
@z

@x
	defer out.Close()
	io.Copy(os.Stdout, out)
}
```
@y
	defer out.Close()
	io.Copy(os.Stdout, out)
}
```
@z

@x
{{< /tab >}}
{{< tab name="Python" >}}
@y
{{< /tab >}}
{{< tab name="Python" >}}
@z

@x
The Python SDK retrieves authentication information from the [credentials
store](/engine/reference/commandline/login/#credentials-store) file and
integrates with [credential
helpers](https://github.com/docker/docker-credential-helpers). It is possible to override these credentials, but that is out of
scope for this Getting Started guide. After using `docker login`, the Python SDK
uses these credentials automatically.
@y
The Python SDK retrieves authentication information from the [credentials
store](/engine/reference/commandline/login/#credentials-store) file and
integrates with [credential
helpers](https://github.com/docker/docker-credential-helpers). It is possible to override these credentials, but that is out of
scope for this Getting Started guide. After using `docker login`, the Python SDK
uses these credentials automatically.
@z

@x
```python
import docker
client = docker.from_env()
image = client.images.pull("alpine")
print(image.id)
```
@y
```python
import docker
client = docker.from_env()
image = client.images.pull("alpine")
print(image.id)
```
@z

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

@x
```console
$ JSON=$(echo '{"username": "string", "password": "string", "serveraddress": "string"}' | base64)
@y
```console
$ JSON=$(echo '{"username": "string", "password": "string", "serveraddress": "string"}' | base64)
@z

@x
$ curl --unix-socket /var/run/docker.sock \
  -H "Content-Type: application/tar"
  -X POST "http://localhost/v{{% param "latest_engine_api_version" %}}/images/create?fromImage=alpine"
  -H "X-Registry-Auth"
  -d "$JSON"
{"status":"Pulling from library/alpine","id":"3.1"}
{"status":"Pulling fs layer","progressDetail":{},"id":"8f13703509f7"}
{"status":"Downloading","progressDetail":{"current":32768,"total":2244027},"progress":"[\u003e                                                  ] 32.77 kB/2.244 MB","id":"8f13703509f7"}
...
```
@y
$ curl --unix-socket /var/run/docker.sock \
  -H "Content-Type: application/tar"
  -X POST "http://localhost/v{{% param "latest_engine_api_version" %}}/images/create?fromImage=alpine"
  -H "X-Registry-Auth"
  -d "$JSON"
{"status":"Pulling from library/alpine","id":"3.1"}
{"status":"Pulling fs layer","progressDetail":{},"id":"8f13703509f7"}
{"status":"Downloading","progressDetail":{"current":32768,"total":2244027},"progress":"[\u003e                                                  ] 32.77 kB/2.244 MB","id":"8f13703509f7"}
...
```
@z

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

@x
```go
package main
@y
```go
package main
@z

@x
import (
	"context"
	"fmt"
@y
import (
	"context"
	"fmt"
@z

@x
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/api/types/container"
	"github.com/docker/docker/client"
)
@y
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/api/types/container"
	"github.com/docker/docker/client"
)
@z

@x
func main() {
	ctx := context.Background()
	cli, err := client.NewClientWithOpts(client.FromEnv, client.WithAPIVersionNegotiation())
	if err != nil {
		panic(err)
	}
	defer cli.Close()
@y
func main() {
	ctx := context.Background()
	cli, err := client.NewClientWithOpts(client.FromEnv, client.WithAPIVersionNegotiation())
	if err != nil {
		panic(err)
	}
	defer cli.Close()
@z

@x
	createResp, err := cli.ContainerCreate(ctx, &container.Config{
		Image: "alpine",
		Cmd:   []string{"touch", "/helloworld"},
	}, nil, nil, nil, "")
	if err != nil {
		panic(err)
	}
@y
	createResp, err := cli.ContainerCreate(ctx, &container.Config{
		Image: "alpine",
		Cmd:   []string{"touch", "/helloworld"},
	}, nil, nil, nil, "")
	if err != nil {
		panic(err)
	}
@z

@x
	if err := cli.ContainerStart(ctx, createResp.ID, types.ContainerStartOptions{}); err != nil {
		panic(err)
	}
@y
	if err := cli.ContainerStart(ctx, createResp.ID, types.ContainerStartOptions{}); err != nil {
		panic(err)
	}
@z

@x
	statusCh, errCh := cli.ContainerWait(ctx, createResp.ID, container.WaitConditionNotRunning)
	select {
	case err := <-errCh:
		if err != nil {
			panic(err)
		}
	case <-statusCh:
	}
@y
	statusCh, errCh := cli.ContainerWait(ctx, createResp.ID, container.WaitConditionNotRunning)
	select {
	case err := <-errCh:
		if err != nil {
			panic(err)
		}
	case <-statusCh:
	}
@z

@x
	commitResp, err := cli.ContainerCommit(ctx, createResp.ID, types.ContainerCommitOptions{Reference: "helloworld"})
	if err != nil {
		panic(err)
	}
@y
	commitResp, err := cli.ContainerCommit(ctx, createResp.ID, types.ContainerCommitOptions{Reference: "helloworld"})
	if err != nil {
		panic(err)
	}
@z

@x
	fmt.Println(commitResp.ID)
}
```
@y
	fmt.Println(commitResp.ID)
}
```
@z

@x
{{< /tab >}}
{{< tab name="Python" >}}
@y
{{< /tab >}}
{{< tab name="Python" >}}
@z

@x
```python
import docker
client = docker.from_env()
container = client.containers.run("alpine", ["touch", "/helloworld"], detach=True)
container.wait()
image = container.commit("helloworld")
print(image.id)
```
@y
```python
import docker
client = docker.from_env()
container = client.containers.run("alpine", ["touch", "/helloworld"], detach=True)
container.wait()
image = container.commit("helloworld")
print(image.id)
```
@z

@x
{{< /tab >}}
{{< tab name="HTTP" >}}
@y
{{< /tab >}}
{{< tab name="HTTP" >}}
@z

@x
```console
$ docker run -d alpine touch /helloworld
0888269a9d584f0fa8fc96b3c0d8d57969ceea3a64acf47cd34eebb4744dbc52
$ curl --unix-socket /var/run/docker.sock\
  -X POST "http://localhost/v{{% param "latest_engine_api_version" %}}/commit?container=0888269a9d&repo=helloworld"
{"Id":"sha256:6c86a5cd4b87f2771648ce619e319f3e508394b5bfc2cdbd2d60f59d52acda6c"}
```
@y
```console
$ docker run -d alpine touch /helloworld
0888269a9d584f0fa8fc96b3c0d8d57969ceea3a64acf47cd34eebb4744dbc52
$ curl --unix-socket /var/run/docker.sock\
  -X POST "http://localhost/v{{% param "latest_engine_api_version" %}}/commit?container=0888269a9d&repo=helloworld"
{"Id":"sha256:6c86a5cd4b87f2771648ce619e319f3e508394b5bfc2cdbd2d60f59d52acda6c"}
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z
