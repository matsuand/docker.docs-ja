%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: Integrate Docker Compose directly into your applications with the Compose SDK.
keywords: docker compose sdk, compose api, Docker developer SDK
title: Using the Compose SDK
linkTitle: Compose SDK 
@y
description: Integrate Docker Compose directly into your applications with the Compose SDK.
keywords: docker compose sdk, compose api, Docker developer SDK
title: Using the Compose SDK
linkTitle: Compose SDK 
@z

@x
{{< summary-bar feature_name="Compose SDK" >}}
@y
{{< summary-bar feature_name="Compose SDK" >}}
@z

@x
The `docker/compose` package can be used as a Go library by third-party applications to programmatically manage
containerized applications defined in Compose files. This SDK provides a comprehensive API that lets you
integrate Compose functionality directly into your applications, allowing you to load, validate, and manage
multi-container environments without relying on the Compose CLI. 
@y
The `docker/compose` package can be used as a Go library by third-party applications to programmatically manage
containerized applications defined in Compose files. This SDK provides a comprehensive API that lets you
integrate Compose functionality directly into your applications, allowing you to load, validate, and manage
multi-container environments without relying on the Compose CLI. 
@z

@x
Whether you need to orchestrate containers as part of
a deployment pipeline, build custom management tools, or embed container orchestration into your application, the
Compose SDK offers the same powerful capabilities that drive the Docker Compose command-line tool.
@y
Whether you need to orchestrate containers as part of
a deployment pipeline, build custom management tools, or embed container orchestration into your application, the
Compose SDK offers the same powerful capabilities that drive the Docker Compose command-line tool.
@z

@x
## Set up the SDK
@y
## Set up the SDK
@z

@x
To get started, create an SDK instance using the `NewComposeService()` function, which initializes a service with the
necessary configuration to interact with the Docker daemon and manage Compose projects. This service instance provides
methods for all core Compose operations including creating, starting, stopping, and removing containers, as well as
loading and validating Compose files. The service handles the underlying Docker API interactions and resource
management, allowing you to focus on your application logic.
@y
To get started, create an SDK instance using the `NewComposeService()` function, which initializes a service with the
necessary configuration to interact with the Docker daemon and manage Compose projects. This service instance provides
methods for all core Compose operations including creating, starting, stopping, and removing containers, as well as
loading and validating Compose files. The service handles the underlying Docker API interactions and resource
management, allowing you to focus on your application logic.
@z

@x
### Requirements
@y
### Requirements
@z

@x
Before using the SDK, make sure you're using a compatible version of the Docker CLI. 
@y
Before using the SDK, make sure you're using a compatible version of the Docker CLI. 
@z

@x
```go
require (
    github.com/docker/cli v28.5.2+incompatible
)
```
@y
```go
require (
    github.com/docker/cli v28.5.2+incompatible
)
```
@z

@x
Docker CLI version 29.0.0 and later depends on the new `github.com/moby/moby` module, whereas Docker Compose v5 currently depends on `github.com/docker/docker`. This means you need to pin `docker/cli v28.5.2+incompatible` to ensure compatibility and avoid build errors.
@y
Docker CLI version 29.0.0 and later depends on the new `github.com/moby/moby` module, whereas Docker Compose v5 currently depends on `github.com/docker/docker`. This means you need to pin `docker/cli v28.5.2+incompatible` to ensure compatibility and avoid build errors.
@z

@x
### Example usage
@y
### Example usage
@z

@x
Here's a basic example demonstrating how to load a Compose project and start the services:
@y
Here's a basic example demonstrating how to load a Compose project and start the services:
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
    "log"
@y
import (
    "context"
    "log"
@z

@x
	"github.com/docker/cli/cli/command"
	"github.com/docker/cli/cli/flags"
    "github.com/docker/compose/v5/pkg/api"
    "github.com/docker/compose/v5/pkg/compose"
)
@y
	"github.com/docker/cli/cli/command"
	"github.com/docker/cli/cli/flags"
    "github.com/docker/compose/v5/pkg/api"
    "github.com/docker/compose/v5/pkg/compose"
)
@z

@x
func main() {
    ctx := context.Background()
@y
func main() {
    ctx := context.Background()
@z

@x
	dockerCLI, err := command.NewDockerCli()
	if err != nil {
		log.Fatalf("Failed to create docker CLI: %v", err)
	}
	err = dockerCLI.Initialize(&flags.ClientOptions{})
	if err != nil {
		log.Fatalf("Failed to initialize docker CLI: %v", err)
	}
@y
	dockerCLI, err := command.NewDockerCli()
	if err != nil {
		log.Fatalf("Failed to create docker CLI: %v", err)
	}
	err = dockerCLI.Initialize(&flags.ClientOptions{})
	if err != nil {
		log.Fatalf("Failed to initialize docker CLI: %v", err)
	}
@z

@x
    // Create a new Compose service instance
    service, err := compose.NewComposeService(dockerCLI)
    if err != nil {
        log.Fatalf("Failed to create compose service: %v", err)
    }
@y
    // Create a new Compose service instance
    service, err := compose.NewComposeService(dockerCLI)
    if err != nil {
        log.Fatalf("Failed to create compose service: %v", err)
    }
@z

@x
    // Load the Compose project from a compose file
    project, err := service.LoadProject(ctx, api.ProjectLoadOptions{
        ConfigPaths: []string{"compose.yaml"},
        ProjectName: "my-app",
    })
    if err != nil {
        log.Fatalf("Failed to load project: %v", err)
    }
@y
    // Load the Compose project from a compose file
    project, err := service.LoadProject(ctx, api.ProjectLoadOptions{
        ConfigPaths: []string{"compose.yaml"},
        ProjectName: "my-app",
    })
    if err != nil {
        log.Fatalf("Failed to load project: %v", err)
    }
@z

@x
    // Start the services defined in the Compose file
    err = service.Up(ctx, project, api.UpOptions{
        Create: api.CreateOptions{},
        Start:  api.StartOptions{},
    })
    if err != nil {
        log.Fatalf("Failed to start services: %v", err)
    }
@y
    // Start the services defined in the Compose file
    err = service.Up(ctx, project, api.UpOptions{
        Create: api.CreateOptions{},
        Start:  api.StartOptions{},
    })
    if err != nil {
        log.Fatalf("Failed to start services: %v", err)
    }
@z

@x
    log.Printf("Successfully started project: %s", project.Name)
}
```
@y
    log.Printf("Successfully started project: %s", project.Name)
}
```
@z

@x
This example demonstrates the core workflow - creating a service instance, loading a project from a Compose file, and
starting the services. The SDK provides many additional operations for managing the lifecycle of your containerized
application.
@y
This example demonstrates the core workflow - creating a service instance, loading a project from a Compose file, and
starting the services. The SDK provides many additional operations for managing the lifecycle of your containerized
application.
@z

@x
## Customizing the SDK
@y
## Customizing the SDK
@z

@x
The `NewComposeService()` function accepts optional `compose.Option` parameters to customize the SDK behavior. These
options allow you to configure I/O streams, concurrency limits, dry-run mode, and other advanced features.
@y
The `NewComposeService()` function accepts optional `compose.Option` parameters to customize the SDK behavior. These
options allow you to configure I/O streams, concurrency limits, dry-run mode, and other advanced features.
@z

@x
```go
    // Create a custom output buffer to capture logs
    var outputBuffer bytes.Buffer
@y
```go
    // Create a custom output buffer to capture logs
    var outputBuffer bytes.Buffer
@z

@x
    // Create a compose service with custom options
    service, err := compose.NewComposeService(dockerCLI,
        compose.WithOutputStream(&outputBuffer),          // Redirect output to custom writer
        compose.WithErrorStream(os.Stderr),               // Use stderr for errors
        compose.WithMaxConcurrency(4),                    // Limit concurrent operations
        compose.WithPrompt(compose.AlwaysOkPrompt()),     // Auto-confirm all prompts
    )
```
@y
    // Create a compose service with custom options
    service, err := compose.NewComposeService(dockerCLI,
        compose.WithOutputStream(&outputBuffer),          // Redirect output to custom writer
        compose.WithErrorStream(os.Stderr),               // Use stderr for errors
        compose.WithMaxConcurrency(4),                    // Limit concurrent operations
        compose.WithPrompt(compose.AlwaysOkPrompt()),     // Auto-confirm all prompts
    )
```
@z

@x
### Available options
@y
### Available options
@z

@x
- `WithOutputStream(io.Writer)`: Redirect standard output to a custom writer
- `WithErrorStream(io.Writer)`: Redirect error output to a custom writer
- `WithInputStream(io.Reader)`: Provide a custom input stream for interactive prompts
- `WithStreams(out, err, in)`: Set all I/O streams at once
- `WithMaxConcurrency(int)`: Limit the number of concurrent operations against the Docker API
- `WithPrompt(Prompt)`: Customize user confirmation behavior (use `AlwaysOkPrompt()` for non-interactive mode)
- `WithDryRun`: Run operations in dry-run mode without actually applying changes
- `WithContextInfo(api.ContextInfo)`: Set custom Docker context information
- `WithProxyConfig(map[string]string)`: Configure HTTP proxy settings for builds
- `WithEventProcessor(progress.EventProcessor)`: Receive progress events and operation notifications
@y
- `WithOutputStream(io.Writer)`: Redirect standard output to a custom writer
- `WithErrorStream(io.Writer)`: Redirect error output to a custom writer
- `WithInputStream(io.Reader)`: Provide a custom input stream for interactive prompts
- `WithStreams(out, err, in)`: Set all I/O streams at once
- `WithMaxConcurrency(int)`: Limit the number of concurrent operations against the Docker API
- `WithPrompt(Prompt)`: Customize user confirmation behavior (use `AlwaysOkPrompt()` for non-interactive mode)
- `WithDryRun`: Run operations in dry-run mode without actually applying changes
- `WithContextInfo(api.ContextInfo)`: Set custom Docker context information
- `WithProxyConfig(map[string]string)`: Configure HTTP proxy settings for builds
- `WithEventProcessor(progress.EventProcessor)`: Receive progress events and operation notifications
@z

@x
These options provide fine-grained control over the SDK's behavior, making it suitable for various integration
scenarios including CLI tools, web services, automation scripts, and testing environments.
@y
These options provide fine-grained control over the SDK's behavior, making it suitable for various integration
scenarios including CLI tools, web services, automation scripts, and testing environments.
@z

@x
## Tracking operations with `EventProcessor`
@y
## Tracking operations with `EventProcessor`
@z

@x
The `EventProcessor` interface allows you to monitor Compose operations in real-time by receiving events about changes
applied to Docker resources such as images, containers, volumes, and networks. This is particularly useful for building
user interfaces, logging systems, or monitoring tools that need to track the progress of Compose operations.
@y
The `EventProcessor` interface allows you to monitor Compose operations in real-time by receiving events about changes
applied to Docker resources such as images, containers, volumes, and networks. This is particularly useful for building
user interfaces, logging systems, or monitoring tools that need to track the progress of Compose operations.
@z

@x
### Understanding `EventProcessor`
@y
### Understanding `EventProcessor`
@z

@x
A Compose operation, such as `up`, `down`, `build`, performs a series of changes to Docker resources. The
`EventProcessor` receives notifications about these changes through three key methods:
@y
A Compose operation, such as `up`, `down`, `build`, performs a series of changes to Docker resources. The
`EventProcessor` receives notifications about these changes through three key methods:
@z

@x
- `Start(ctx, operation)`: Called when a Compose operation begins, for example `up`
- `On(events...)`: Called with progress events for individual resource changes, for example, container starting, image
  being pulled
- `Done(operation, success)`: Called when the operation completes, indicating success or failure
@y
- `Start(ctx, operation)`: Called when a Compose operation begins, for example `up`
- `On(events...)`: Called with progress events for individual resource changes, for example, container starting, image
  being pulled
- `Done(operation, success)`: Called when the operation completes, indicating success or failure
@z

@x
Each event contains information about the resource being modified, its current status, and progress indicators when
applicable (such as download progress for image pulls).
@y
Each event contains information about the resource being modified, its current status, and progress indicators when
applicable (such as download progress for image pulls).
@z

@x
### Event status types
@y
### Event status types
@z

@x
Events report resource changes with the following status types:
@y
Events report resource changes with the following status types:
@z

@x
- Working: Operation is in progress, for example, creating, starting, pulling
- Done: Operation completed successfully
- Warning: Operation completed with warnings
- Error: Operation failed
@y
- Working: Operation is in progress, for example, creating, starting, pulling
- Done: Operation completed successfully
- Warning: Operation completed with warnings
- Error: Operation failed
@z

@x
Common status text values include: `Creating`, `Created`, `Starting`, `Started`, `Running`, `Stopping`, `Stopped`,
`Removing`, `Removed`, `Building`, `Built`, `Pulling`, `Pulled`, and more.
@y
Common status text values include: `Creating`, `Created`, `Starting`, `Started`, `Running`, `Stopping`, `Stopped`,
`Removing`, `Removed`, `Building`, `Built`, `Pulling`, `Pulled`, and more.
@z

@x
### Built-in `EventProcessor` implementations
@y
### Built-in `EventProcessor` implementations
@z

@x
The SDK provides three ready-to-use `EventProcessor` implementations:
@y
The SDK provides three ready-to-use `EventProcessor` implementations:
@z

@x
- `progress.NewTTYWriter(io.Writer)`: Renders an interactive terminal UI with progress bars and task lists
  (similar to the Docker Compose CLI output)
- `progress.NewPlainWriter(io.Writer)`: Outputs simple text-based progress messages suitable for non-interactive
  environments or log files
- `progress.NewJSONWriter()`: Render events as JSON objects
- `progress.NewQuietWriter()`: (Default) Silently processes events without producing any output
@y
- `progress.NewTTYWriter(io.Writer)`: Renders an interactive terminal UI with progress bars and task lists
  (similar to the Docker Compose CLI output)
- `progress.NewPlainWriter(io.Writer)`: Outputs simple text-based progress messages suitable for non-interactive
  environments or log files
- `progress.NewJSONWriter()`: Render events as JSON objects
- `progress.NewQuietWriter()`: (Default) Silently processes events without producing any output
@z

@x
Using `EventProcessor`, a custom UI can be plugged into `docker/compose`.
@y
Using `EventProcessor`, a custom UI can be plugged into `docker/compose`.
@z
