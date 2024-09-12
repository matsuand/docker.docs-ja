%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
description: Use File watch to automatically update running services as you work
keywords: compose, file watch, experimental
title: Use Compose Watch
@y
description: Use File watch to automatically update running services as you work
keywords: compose, file watch, experimental
title: Use Compose Watch
@z

@x
{{< introduced compose 2.22.0 "release-notes.md#2220" >}}
@y
{{< introduced compose 2.22.0 "release-notes.md#2220" >}}
@z

@x
{{< include "compose/watch.md" >}}
@y
{{< include "compose/watch.md" >}}
@z

@x
`watch` adheres to the following file path rules:
* All paths are relative to the project directory
* Directories are watched recursively
* Glob patterns aren't supported
* Rules from `.dockerignore` apply
  * Use `ignore` option to define additional paths to be ignored (same syntax)
  * Temporary/backup files for common IDEs (Vim, Emacs, JetBrains, & more) are ignored automatically
  * `.git` directories are ignored automatically
@y
`watch` adheres to the following file path rules:
* All paths are relative to the project directory
* Directories are watched recursively
* Glob patterns aren't supported
* Rules from `.dockerignore` apply
  * Use `ignore` option to define additional paths to be ignored (same syntax)
  * Temporary/backup files for common IDEs (Vim, Emacs, JetBrains, & more) are ignored automatically
  * `.git` directories are ignored automatically
@z

@x
You don't need to switch on `watch` for all services in a Compose project. In some instances, only part of the project, for example the Javascript frontend, might be suitable for automatic updates.
@y
You don't need to switch on `watch` for all services in a Compose project. In some instances, only part of the project, for example the Javascript frontend, might be suitable for automatic updates.
@z

@x
## Compose Watch versus bind mounts
@y
## Compose Watch versus bind mounts
@z

@x
Compose supports sharing a host directory inside service containers. Watch mode does not replace this functionality but exists as a companion specifically suited to developing in containers.
@y
Compose supports sharing a host directory inside service containers. Watch mode does not replace this functionality but exists as a companion specifically suited to developing in containers.
@z

@x
More importantly, `watch` allows for greater granularity than is practical with a bind mount. Watch rules let you ignore specific files or entire directories within the watched tree.
@y
More importantly, `watch` allows for greater granularity than is practical with a bind mount. Watch rules let you ignore specific files or entire directories within the watched tree.
@z

@x
For example, in a JavaScript project, ignoring the `node_modules/` directory has two benefits:
* Performance. File trees with many small files can cause high I/O load in some configurations
* Multi-platform. Compiled artifacts cannot be shared if the host OS or architecture is different to the container
@y
For example, in a JavaScript project, ignoring the `node_modules/` directory has two benefits:
* Performance. File trees with many small files can cause high I/O load in some configurations
* Multi-platform. Compiled artifacts cannot be shared if the host OS or architecture is different to the container
@z

@x
For example, in a Node.js project, it's not recommended to sync the `node_modules/` directory. Even though JavaScript is interpreted, `npm` packages can contain native code that is not portable across platforms.
@y
For example, in a Node.js project, it's not recommended to sync the `node_modules/` directory. Even though JavaScript is interpreted, `npm` packages can contain native code that is not portable across platforms.
@z

@x
## Configuration
@y
## Configuration
@z

@x
The `watch` attribute defines a list of rules that control automatic service updates based on local file changes.
@y
The `watch` attribute defines a list of rules that control automatic service updates based on local file changes.
@z

@x
Each rule requires, a `path` pattern and `action` to take when a modification is detected. There are two possible actions for `watch` and depending on
the `action`, additional fields might be accepted or required. 
@y
Each rule requires, a `path` pattern and `action` to take when a modification is detected. There are two possible actions for `watch` and depending on
the `action`, additional fields might be accepted or required. 
@z

@x
Watch mode can be used with many different languages and frameworks.
The specific paths and rules will vary from project to project, but the concepts remain the same. 
@y
Watch mode can be used with many different languages and frameworks.
The specific paths and rules will vary from project to project, but the concepts remain the same. 
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
In order to work properly, `watch` relies on common executables. Make sure your service image contains the following binaries:
* stat
* mkdir
* rmdir
@y
In order to work properly, `watch` relies on common executables. Make sure your service image contains the following binaries:
* stat
* mkdir
* rmdir
@z

@x
`watch` also requires that the container's `USER` can write to the target path so it can update files. A common pattern is for 
initial content to be copied into the container using the `COPY` instruction in a Dockerfile. To ensure such files are owned 
by the configured user, use the `COPY --chown` flag:
@y
`watch` also requires that the container's `USER` can write to the target path so it can update files. A common pattern is for 
initial content to be copied into the container using the `COPY` instruction in a Dockerfile. To ensure such files are owned 
by the configured user, use the `COPY --chown` flag:
@z

@x within code
# Run as a non-privileged user
@y
# Run as a non-privileged user
@z
@x
# Install dependencies
@y
# Install dependencies
@z
@x
# Copy source files into application directory
@y
# Copy source files into application directory
@z

@x
### `action`
@y
### `action`
@z

@x
#### Sync
@y
#### Sync
@z

@x
If `action` is set to `sync`, Compose makes sure any changes made to files on your host automatically match with the corresponding files within the service container.
@y
If `action` is set to `sync`, Compose makes sure any changes made to files on your host automatically match with the corresponding files within the service container.
@z

@x
`sync` is ideal for frameworks that support "Hot Reload" or equivalent functionality.
@y
`sync` is ideal for frameworks that support "Hot Reload" or equivalent functionality.
@z

@x
More generally, `sync` rules can be used in place of bind mounts for many development use cases.
@y
More generally, `sync` rules can be used in place of bind mounts for many development use cases.
@z

@x
#### Rebuild
@y
#### Rebuild
@z

@x
If `action` is set to `rebuild`, Compose automatically builds a new image with BuildKit and replaces the running service container.
@y
If `action` is set to `rebuild`, Compose automatically builds a new image with BuildKit and replaces the running service container.
@z

@x
The behavior is the same as running `docker compose up --build <svc>`.
@y
The behavior is the same as running `docker compose up --build <svc>`.
@z

@x
Rebuild is ideal for compiled languages or as fallbacks for modifications to particular files that require a full
image rebuild (e.g. `package.json`).
@y
Rebuild is ideal for compiled languages or as fallbacks for modifications to particular files that require a full
image rebuild (e.g. `package.json`).
@z

@x
#### Sync + Restart
@y
#### Sync + Restart
@z

@x
If `action` is set to `sync+restart`, Compose synchronizes your changes with the service containers and restarts it. 
@y
If `action` is set to `sync+restart`, Compose synchronizes your changes with the service containers and restarts it. 
@z

@x
`sync+restart` is ideal when config file changes, and you don't need to rebuild the image but just restart the main process of the service containers. 
It will work well when you update a database configuration or your `nginx.conf` file for example
@y
`sync+restart` is ideal when config file changes, and you don't need to rebuild the image but just restart the main process of the service containers. 
It will work well when you update a database configuration or your `nginx.conf` file for example
@z

@x
>**Tip**
>
> Optimize your `Dockerfile` for speedy
incremental rebuilds with [image layer caching](/build/cache)
and [multi-stage builds](/build/building/multi-stage/).
@y
>**Tip**
>
> Optimize your `Dockerfile` for speedy
incremental rebuilds with [image layer caching](__SUBDIR__/build/cache)
and [multi-stage builds](__SUBDIR__/build/building/multi-stage/).
@z

@x
### `path` and `target`
@y
### `path` and `target`
@z

@x
The `target` field controls how the path is mapped into the container.
@y
The `target` field controls how the path is mapped into the container.
@z

@x
For `path: ./app/html` and a change to `./app/html/index.html`:
@y
For `path: ./app/html` and a change to `./app/html/index.html`:
@z

@x
* `target: /app/html` -> `/app/html/index.html`
* `target: /app/static` -> `/app/static/index.html`
* `target: /assets` -> `/assets/index.html`
@y
* `target: /app/html` -> `/app/html/index.html`
* `target: /app/static` -> `/app/static/index.html`
* `target: /assets` -> `/assets/index.html`
@z

@x
## Example 1
@y
## Example 1
@z

@x
This minimal example targets a Node.js application with the following structure:
@y
This minimal example targets a Node.js application with the following structure:
@z

% snip text...
% snip code...

@x
In this example, when running `docker compose up --watch`, a container for the `web` service is launched using an image built from the `Dockerfile` in the project's root.
The `web` service runs `npm start` for its command, which then launches a development version of the application with Hot Module Reload enabled in the bundler (Webpack, Vite, Turbopack, etc).
@y
In this example, when running `docker compose up --watch`, a container for the `web` service is launched using an image built from the `Dockerfile` in the project's root.
The `web` service runs `npm start` for its command, which then launches a development version of the application with Hot Module Reload enabled in the bundler (Webpack, Vite, Turbopack, etc).
@z

@x
After the service is up, the watch mode starts monitoring the target directories and files.
Then, whenever a source file in the `web/` directory is changed, Compose syncs the file to the corresponding location under `/src/web` inside the container.
For example, `./web/App.jsx` is copied to `/src/web/App.jsx`.
@y
After the service is up, the watch mode starts monitoring the target directories and files.
Then, whenever a source file in the `web/` directory is changed, Compose syncs the file to the corresponding location under `/src/web` inside the container.
For example, `./web/App.jsx` is copied to `/src/web/App.jsx`.
@z

@x
Once copied, the bundler updates the running application without a restart.
@y
Once copied, the bundler updates the running application without a restart.
@z

@x
Unlike source code files, adding a new dependency can’t be done on-the-fly, so whenever `package.json` is changed, Compose
rebuilds the image and recreates the `web` service container.
@y
Unlike source code files, adding a new dependency can’t be done on-the-fly, so whenever `package.json` is changed, Compose
rebuilds the image and recreates the `web` service container.
@z

@x
This pattern can be followed for many languages and frameworks, such as Python with Flask: Python source files can be synced while a change to `requirements.txt` should trigger a rebuild.
@y
This pattern can be followed for many languages and frameworks, such as Python with Flask: Python source files can be synced while a change to `requirements.txt` should trigger a rebuild.
@z

@x
## Example 2 
@y
## Example 2 
@z

@x
Adapting the previous example to demonstrate `sync+restart`:
@y
Adapting the previous example to demonstrate `sync+restart`:
@z

% snip code...

@x
This setup demonstrates how to use the `sync+restart` action in Docker Compose to efficiently develop and test a Node.js application with a frontend web server and backend service. The configuration ensures that changes to the application code and configuration files are quickly synchronized and applied, with the `web` service restarting as needed to reflect the changes.
@y
This setup demonstrates how to use the `sync+restart` action in Docker Compose to efficiently develop and test a Node.js application with a frontend web server and backend service. The configuration ensures that changes to the application code and configuration files are quickly synchronized and applied, with the `web` service restarting as needed to reflect the changes.
@z

@x
## Use `watch`
@y
## Use `watch`
@z

@x
{{< include "compose/configure-watch.md" >}}
@y
{{< include "compose/configure-watch.md" >}}
@z

@x
> [!TIP]
>
> Watch can also be used with the dedicated `docker compose watch` command if you don't want to 
> get the application logs mixed with the (re)build logs and filesystem sync events.

> **Looking for a sample project to test things out?**
>
> Check out [`dockersamples/avatars`](https://github.com/dockersamples/avatars),
> or [local setup for Docker docs](https://github.com/docker/docs/blob/main/CONTRIBUTING.md)
> for a demonstration of Compose `watch`.
@y
> [!TIP]
>
> Watch can also be used with the dedicated `docker compose watch` command if you don't want to 
> get the application logs mixed with the (re)build logs and filesystem sync events.

> **Looking for a sample project to test things out?**
>
> Check out [`dockersamples/avatars`](https://github.com/dockersamples/avatars),
> or [local setup for Docker docs](https://github.com/docker/docs/blob/main/CONTRIBUTING.md)
> for a demonstration of Compose `watch`.
@z

@x
## Feedback
@y
## Feedback
@z

@x
We are actively looking for feedback on this feature. Give feedback or report any bugs you may find in the [Compose Specification repository](https://github.com/compose-spec/compose-spec/pull/253).
@y
We are actively looking for feedback on this feature. Give feedback or report any bugs you may find in the [Compose Specification repository](https://github.com/compose-spec/compose-spec/pull/253).
@z

@x
## Reference
@y
## Reference
@z

@x
- [Compose Develop Specification](/reference/compose-file/develop.md)
@y
- [Compose Develop Specification](reference/compose-file/develop.md)
@z
