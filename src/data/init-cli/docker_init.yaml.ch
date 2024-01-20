%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

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
  Docker Desktop 4.18 and later provides the Docker Init plugin with the `docker init` CLI command. Run `docker init` in your project directory to be walked through the creation of the following files with sensible defaults for your project:
@y
  Docker Desktop 4.18 and later provides the Docker Init plugin with the `docker init` CLI command. Run `docker init` in your project directory to be walked through the creation of the following files with sensible defaults for your project:
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
    If any of the files already exist, a prompt appears and provides a warning as well as giving you the option to overwrite all the files.
@y
    If any of the files already exist, a prompt appears and provides a warning as well as giving you the option to overwrite all the files.
@z

@x
    > **Warning**
    >
    > You can't recover overwritten files.
    > To back up an existing file before selecting to overwrite it, rename the file or copy it to another directory.
    { .warning }
@y
    > **Warning**
    >
    > You can't recover overwritten files.
    > To back up an existing file before selecting to overwrite it, rename the file or copy it to another directory.
    { .warning }
@z

@x
  After running `docker init`, you can choose one of the following templates:
@y
  After running `docker init`, you can choose one of the following templates:
@z

@x
    * ASP.NET Core: Suitable for an ASP.NET Core application.
    * Go: Suitable for a Go server application.
    * Node: Suitable for a Node server application.
    * PHP with Apache: Suitable for a PHP web application.
    * Python: Suitable for a Python server application.
    * Rust: Suitable for a Rust server application.
    * Other: General purpose starting point for containerizing your application.
@y
    * ASP.NET Core: Suitable for an ASP.NET Core application.
    * Go: Suitable for a Go server application.
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
    * [.dockerignore](../../../engine/reference/builder.md#dockerignore-file)
    * [Dockerfile](../../../engine/reference/builder.md)
    * [compose.yaml](../../../compose/compose-application-model.md)
@y
    * [.dockerignore](../../../engine/reference/builder.md#dockerignore-file)
    * [Dockerfile](../../../engine/reference/builder.md)
    * [compose.yaml](../../../compose/compose-application-model.md)
@z

@x
usage: docker init [OPTIONS]
pname: docker
plink: docker.yaml
options:
    - option: version
      value_type: bool
      default_value: "false"
      description: Display version of the init plugin
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
examples: |-
  ### Example of running `docker init`
@y
usage: docker init [OPTIONS]
pname: docker
plink: docker.yaml
options:
    - option: version
      value_type: bool
      default_value: "false"
      description: Display version of the init plugin
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
examples: |-
  ### Example of running `docker init`
@z

@x
  The following example shows the initial menu after running `docker init`. See the additional examples to view the options for each language or framework.
@y
  The following example shows the initial menu after running `docker init`. See the additional examples to view the options for each language or framework.
@z

@x
  ```console
  $ docker init
@y
  ```console
  $ docker init
@z

@x
  Welcome to the Docker Init CLI!
@y
  Welcome to the Docker Init CLI!
@z

@x
  This utility will walk you through creating the following files with sensible defaults for your project:
    - .dockerignore
    - Dockerfile
    - compose.yaml
    - README.Docker.md
@y
  This utility will walk you through creating the following files with sensible defaults for your project:
    - .dockerignore
    - Dockerfile
    - compose.yaml
    - README.Docker.md
@z

@x
  Let's get started!
@y
  Let's get started!
@z

@x
  ? What application platform does your project use?  [Use arrows to move, type to filter]
  > PHP with Apache - (detected) suitable for a PHP web application
    Go - (detected) suitable for a Go server application
    Python - suitable for a Python server application
    Node - suitable for a Node server application
    Rust - suitable for a Rust server application
    ASP.NET Core - suitable for an ASP.NET Core application
    Other - general purpose starting point for containerizing your application
    Don't see something you need? Let us know!
    Quit
  ```
@y
  ? What application platform does your project use?  [Use arrows to move, type to filter]
  > PHP with Apache - (detected) suitable for a PHP web application
    Go - (detected) suitable for a Go server application
    Python - suitable for a Python server application
    Node - suitable for a Node server application
    Rust - suitable for a Rust server application
    ASP.NET Core - suitable for an ASP.NET Core application
    Other - general purpose starting point for containerizing your application
    Don't see something you need? Let us know!
    Quit
  ```
@z

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

@x
  ```console
  ? What application platform does your project use? Go
  ? What version of Go do you want to use? 1.20
  ? What's the relative directory (with a leading .) of your main package? .
  ? What port does your server listen on? 3333
@y
  ```console
  ? What application platform does your project use? Go
  ? What version of Go do you want to use? 1.20
  ? What's the relative directory (with a leading .) of your main package? .
  ? What port does your server listen on? 3333
@z

@x
  CREATED: .dockerignore
  CREATED: Dockerfile
  CREATED: compose.yaml
  CREATED: README.Docker.md
@y
  CREATED: .dockerignore
  CREATED: Dockerfile
  CREATED: compose.yaml
  CREATED: README.Docker.md
@z

@x
  ✔ Your Docker files are ready!
@y
  ✔ Your Docker files are ready!
@z

@x
  Take a moment to review them and tailor them to your application.
@y
  Take a moment to review them and tailor them to your application.
@z

@x
  When you're ready, start your application by running: docker compose up --build
@y
  When you're ready, start your application by running: docker compose up --build
@z

@x
  Your application will be available at http://localhost:3333
@y
  Your application will be available at http://localhost:3333
@z

@x
  Consult README.Docker.md for more information about using the generated files.
  ```
@y
  Consult README.Docker.md for more information about using the generated files.
  ```
@z

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

@x
  ```console
  ? What application platform does your project use? Node
  ? What version of Node do you want to use? 18
  ? Which package manager do you want to use? yarn
  ? Do you want to run "yarn run build" before starting your server? Yes
  ? What directory is your build output to? (comma-separate if multiple) output
  ? What command do you want to use to start the app? node index.js
  ? What port does your server listen on? 8000
@y
  ```console
  ? What application platform does your project use? Node
  ? What version of Node do you want to use? 18
  ? Which package manager do you want to use? yarn
  ? Do you want to run "yarn run build" before starting your server? Yes
  ? What directory is your build output to? (comma-separate if multiple) output
  ? What command do you want to use to start the app? node index.js
  ? What port does your server listen on? 8000
@z

@x
  CREATED: .dockerignore
  CREATED: Dockerfile
  CREATED: compose.yaml
  CREATED: README.Docker.md
@y
  CREATED: .dockerignore
  CREATED: Dockerfile
  CREATED: compose.yaml
  CREATED: README.Docker.md
@z

@x
  ✔ Your Docker files are ready!
@y
  ✔ Your Docker files are ready!
@z

@x
  Take a moment to review them and tailor them to your application.
@y
  Take a moment to review them and tailor them to your application.
@z

@x
  When you're ready, start your application by running: docker compose up --build
@y
  When you're ready, start your application by running: docker compose up --build
@z

@x
  Your application will be available at http://localhost:8000
@y
  Your application will be available at http://localhost:8000
@z

@x
  Consult README.Docker.md for more information about using the generated files.
  ```
@y
  Consult README.Docker.md for more information about using the generated files.
  ```
@z

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

@x
  ```console
  ? What application platform does your project use? Python
  ? What version of Python do you want to use? 3.8
  ? What port do you want your app to listen on? 8000
  ? What is the command to run your app (e.g., gunicorn 'myapp.example:app' --bind=0.0.0.0:8000)? python ./app.py
@y
  ```console
  ? What application platform does your project use? Python
  ? What version of Python do you want to use? 3.8
  ? What port do you want your app to listen on? 8000
  ? What is the command to run your app (e.g., gunicorn 'myapp.example:app' --bind=0.0.0.0:8000)? python ./app.py
@z

@x
  CREATED: .dockerignore
  CREATED: Dockerfile
  CREATED: compose.yaml
  CREATED: README.Docker.md
@y
  CREATED: .dockerignore
  CREATED: Dockerfile
  CREATED: compose.yaml
  CREATED: README.Docker.md
@z

@x
  ✔ Your Docker files are ready!
@y
  ✔ Your Docker files are ready!
@z

@x
  Take a moment to review them and tailor them to your application.
@y
  Take a moment to review them and tailor them to your application.
@z

@x
  When you're ready, start your application by running: docker compose up --build
@y
  When you're ready, start your application by running: docker compose up --build
@z

@x
  Your application will be available at http://localhost:8000
@y
  Your application will be available at http://localhost:8000
@z

@x
  Consult README.Docker.md for more information about using the generated files.
  ```
@y
  Consult README.Docker.md for more information about using the generated files.
  ```
@z

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

@x
  ```console
  ? What application platform does your project use? Rust
  ? What version of Rust do you want to use? 1.70.0
  ? What port does your server listen on? 8000
@y
  ```console
  ? What application platform does your project use? Rust
  ? What version of Rust do you want to use? 1.70.0
  ? What port does your server listen on? 8000
@z

@x
  CREATED: .dockerignore
  CREATED: Dockerfile
  CREATED: compose.yaml
  CREATED: README.Docker.md
@y
  CREATED: .dockerignore
  CREATED: Dockerfile
  CREATED: compose.yaml
  CREATED: README.Docker.md
@z

@x
  ✔ Your Docker files are ready!
@y
  ✔ Your Docker files are ready!
@z

@x
  Take a moment to review them and tailor them to your application.
@y
  Take a moment to review them and tailor them to your application.
@z

@x
  When you're ready, start your application by running: docker compose up --build
@y
  When you're ready, start your application by running: docker compose up --build
@z

@x
  Your application will be available at http://localhost:8000
@y
  Your application will be available at http://localhost:8000
@z

@x
  Consult README.Docker.md for more information about using the generated files.
  ```
@y
  Consult README.Docker.md for more information about using the generated files.
  ```
@z

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

@x
  ```console
  ? What application platform does your project use? ASP.NET Core
  ? What's the name of your solution's main project? myapp
  ? What version of .NET do you want to use? 6.0
  ? What local port do you want to use to access your server? 8000
@y
  ```console
  ? What application platform does your project use? ASP.NET Core
  ? What's the name of your solution's main project? myapp
  ? What version of .NET do you want to use? 6.0
  ? What local port do you want to use to access your server? 8000
@z

@x
  CREATED: .dockerignore
  CREATED: Dockerfile
  CREATED: compose.yaml
  CREATED: README.Docker.md
@y
  CREATED: .dockerignore
  CREATED: Dockerfile
  CREATED: compose.yaml
  CREATED: README.Docker.md
@z

@x
  ✔ Your Docker files are ready!
@y
  ✔ Your Docker files are ready!
@z

@x
  Take a moment to review them and tailor them to your application.
@y
  Take a moment to review them and tailor them to your application.
@z

@x
  When you're ready, start your application by running: docker compose up --build
@y
  When you're ready, start your application by running: docker compose up --build
@z

@x
  Your application will be available at http://localhost:8000
@y
  Your application will be available at http://localhost:8000
@z

@x
  Consult README.Docker.md for more information about using the generated files.
  ```
@y
  Consult README.Docker.md for more information about using the generated files.
  ```
@z

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

@x
  ```console
  ? What application platform does your project use? PHP with Apache
  ? What version of PHP do you want to use? 8.2
  ? What's the relative directory (with a leading .) for your app? ./src
  ? What local port do you want to use to access your server? 9000
@y
  ```console
  ? What application platform does your project use? PHP with Apache
  ? What version of PHP do you want to use? 8.2
  ? What's the relative directory (with a leading .) for your app? ./src
  ? What local port do you want to use to access your server? 9000
@z

@x
  CREATED: .dockerignore
  CREATED: Dockerfile
  CREATED: compose.yaml
  CREATED: README.Docker.md
@y
  CREATED: .dockerignore
  CREATED: Dockerfile
  CREATED: compose.yaml
  CREATED: README.Docker.md
@z

@x
  ✔ Your Docker files are ready!
@y
  ✔ Your Docker files are ready!
@z

@x
  Take a moment to review them and tailor them to your application.
@y
  Take a moment to review them and tailor them to your application.
@z

@x
  If your application requires specific PHP extensions, you can follow the instructions in the Dockerfile to add them.
@y
  If your application requires specific PHP extensions, you can follow the instructions in the Dockerfile to add them.
@z

@x
  When you're ready, start your application by running: docker compose up --build
@y
  When you're ready, start your application by running: docker compose up --build
@z

@x
  Your application will be available at http://localhost:9000
@y
  Your application will be available at http://localhost:9000
@z

@x
  Consult README.Docker.md for more information about using the generated files.
  ```
@y
  Consult README.Docker.md for more information about using the generated files.
  ```
@z

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

@x
  ```console
  ? What application platform does your project use? Other
@y
  ```console
  ? What application platform does your project use? Other
@z

@x
  CREATED: .dockerignore
  CREATED: Dockerfile
  CREATED: compose.yaml
  CREATED: README.Docker.md
@y
  CREATED: .dockerignore
  CREATED: Dockerfile
  CREATED: compose.yaml
  CREATED: README.Docker.md
@z

@x
  ✔ Your Docker files are ready!
@y
  ✔ Your Docker files are ready!
@z

@x
  Take a moment to review them and tailor them to your application.
@y
  Take a moment to review them and tailor them to your application.
@z

@x
  When you're ready, start your application by running: docker compose up --build
@y
  When you're ready, start your application by running: docker compose up --build
@z

@x
  Consult README.Docker.md for more information about using the generated files.
  ```
@y
  Consult README.Docker.md for more information about using the generated files.
  ```
@z
