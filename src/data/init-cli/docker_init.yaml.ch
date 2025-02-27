%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
command: docker init
short: Creates Docker-related starter files for your project
long: |-
  Initialize a project with the files necessary to run the project in a container.
@y
command: docker init
short: Creates Docker-related starter files for your project
long: |-
  Initialize a project with the files necessary to run the project in a container.
@z

@x
  Docker Desktop provides the `docker init` CLI command. Run `docker init` in your project directory to be walked through the creation of the following files with sensible defaults for your project:
@y
  Docker Desktop provides the `docker init` CLI command. Run `docker init` in your project directory to be walked through the creation of the following files with sensible defaults for your project:
@z

@x
    * .dockerignore
    * Dockerfile
    * compose.yaml
    * README.Docker.md
@y
    * .dockerignore
    * Dockerfile
    * compose.yaml
    * README.Docker.md
@z

@x
    If any of the files already exist, a prompt appears and provides a warning
    as well as giving you the option to overwrite all the files. If
    `docker-compose.yaml` already exists instead of `compose.yaml`, `docker
    init` can overwrite it, using `docker-compose.yaml` as the name for the
    Compose file.
@y
    If any of the files already exist, a prompt appears and provides a warning
    as well as giving you the option to overwrite all the files. If
    `docker-compose.yaml` already exists instead of `compose.yaml`, `docker
    init` can overwrite it, using `docker-compose.yaml` as the name for the
    Compose file.
@z

@x
    > [!WARNING]
    >
    > You can't recover overwritten files.
    > To back up an existing file before selecting to overwrite it, rename the file or copy it to another directory.
@y
    > [!WARNING]
    >
    > You can't recover overwritten files.
    > To back up an existing file before selecting to overwrite it, rename the file or copy it to another directory.
@z

@x
  After running `docker init`, you can choose one of the following templates:
@y
  After running `docker init`, you can choose one of the following templates:
@z

@x
    * ASP.NET Core: Suitable for an ASP.NET Core application.
    * Go: Suitable for a Go server application.
    * Java: suitable for a Java application that uses Maven and packages as an uber jar.
    * Node: Suitable for a Node server application.
    * PHP with Apache: Suitable for a PHP web application.
    * Python: Suitable for a Python server application.
    * Rust: Suitable for a Rust server application.
    * Other: General purpose starting point for containerizing your application.
@y
    * ASP.NET Core: Suitable for an ASP.NET Core application.
    * Go: Suitable for a Go server application.
    * Java: suitable for a Java application that uses Maven and packages as an uber jar.
    * Node: Suitable for a Node server application.
    * PHP with Apache: Suitable for a PHP web application.
    * Python: Suitable for a Python server application.
    * Rust: Suitable for a Rust server application.
    * Other: General purpose starting point for containerizing your application.
@z

@x
  After `docker init` has completed, you may need to modify the created files and tailor them to your project. Visit the following topics to learn more about the files:
@y
  After `docker init` has completed, you may need to modify the created files and tailor them to your project. Visit the following topics to learn more about the files:
@z

@x
    * [.dockerignore](/reference/dockerfile.md#dockerignore-file)
    * [Dockerfile](/reference/dockerfile.md)
    * [compose.yaml](/manuals/compose/intro/compose-application-model.md)
@y
    * [.dockerignore](reference/dockerfile.md#dockerignore-file)
    * [Dockerfile](reference/dockerfile.md)
    * [compose.yaml](manuals/compose/intro/compose-application-model.md)
@z

@x
usage: docker init [OPTIONS]
@y
usage: docker init [OPTIONS]
@z

% options:
@x version
      description: Display version of the init plugin
@y
      description: Display version of the init plugin
@z

@x
examples: |-
  ### Example of running `docker init`
@y
examples: |-
  ### Example of running `docker init`
@z

@x
  The following example shows the initial menu after running `docker init`. See the additional examples to view the options for each language or framework.
@y
  The following example shows the initial menu after running `docker init`. See the additional examples to view the options for each language or framework.
@z

% snip command...

@x
  ### Example of selecting Go
@y
  ### Example of selecting Go
@z

@x
  The following example shows the prompts that appear after selecting `Go` and example input.
@y
  The following example shows the prompts that appear after selecting `Go` and example input.
@z

% snip output...

@x
  ### Example of selecting Node
@y
  ### Example of selecting Node
@z

@x
  The following example shows the prompts that appear after selecting `Node` and example input.
@y
  The following example shows the prompts that appear after selecting `Node` and example input.
@z

% snip output...

@x
  ### Example of selecting Python
@y
  ### Example of selecting Python
@z

@x
  The following example shows the prompts that appear after selecting `Python` and example input.
@y
  The following example shows the prompts that appear after selecting `Python` and example input.
@z

% snip output...

@x
  ### Example of selecting Rust
@y
  ### Example of selecting Rust
@z

@x
  The following example shows the prompts that appear after selecting `Rust` and example input.
@y
  The following example shows the prompts that appear after selecting `Rust` and example input.
@z

% snip output...

@x
  ### Example of selecting ASP.NET Core
@y
  ### Example of selecting ASP.NET Core
@z

@x
  The following example shows the prompts that appear after selecting `ASP.NET Core` and example input.
@y
  The following example shows the prompts that appear after selecting `ASP.NET Core` and example input.
@z

% snip output...

@x
  ### Example of selecting PHP with Apache
@y
  ### Example of selecting PHP with Apache
@z

@x
  The following example shows the prompts that appear after selecting `PHP with Apache` and example input. The PHP with Apache template is suitable for both pure PHP applications and applications using Composer as a dependency manager. After running `docker init`, you must manually add any PHP extensions that are required by your application to the Dockerfile.
@y
  The following example shows the prompts that appear after selecting `PHP with Apache` and example input. The PHP with Apache template is suitable for both pure PHP applications and applications using Composer as a dependency manager. After running `docker init`, you must manually add any PHP extensions that are required by your application to the Dockerfile.
@z

% snip output...

@x
  ### Example of selecting Java
@y
  ### Example of selecting Java
@z

@x
  The following example shows the prompts that appear after selecting `Java` and example input.
@y
  The following example shows the prompts that appear after selecting `Java` and example input.
@z

% snip output...

@x
  ### Example of selecting Other
@y
  ### Example of selecting Other
@z

@x
  The following example shows the output after selecting `Other`.
@y
  The following example shows the output after selecting `Other`.
@z

% snip output...
