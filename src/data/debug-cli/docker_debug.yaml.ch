%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker debug
short: Get a shell into any container or image. Replacement for `docker exec`.
long: |-
  > **Note**
  >
  > Docker Debug requires a [Pro, Team, or Business subcription](/subscription/details/).
  > You must [sign in](/desktop/get-started/) to use this command.
@y
command: docker debug
short: Get a shell into any container or image. Replacement for `docker exec`.
long: |-
  > **Note**
  >
  > Docker Debug requires a [Pro, Team, or Business subcription](__SUBDIR__/subscription/details/).
  > You must [sign in](__SUBDIR__/desktop/get-started/) to use this command.
@z

@x
  Docker Debug is a CLI command that helps you follow best practices by keeping your images small and secure. 
  With Docker Debug, you can debug your images while they contain the bare minimum to run your application.
  It does this by letting you create and work with slim images or containers that are often difficult to debug because all tools have been removed. 
  For example, while typical debug approaches like `docker exec -it my-app bash` may not work on a slim container, `docker debug` will work.
@y
  Docker Debug is a CLI command that helps you follow best practices by keeping your images small and secure. 
  With Docker Debug, you can debug your images while they contain the bare minimum to run your application.
  It does this by letting you create and work with slim images or containers that are often difficult to debug because all tools have been removed. 
  For example, while typical debug approaches like `docker exec -it my-app bash` may not work on a slim container, `docker debug` will work.
@z

@x
  With `docker debug` you can get a debug shell into any container or image, even if they don't contain a shell. 
  You don't need to modify the image to use Docker Debug. 
  However, using Docker Debug still won't modify your image.
  Docker Debug brings its own toolbox that you can easily customize.
  The toolbox comes with many standard Linux tools pre-installed, such as `vim`, `nano`, `htop`, and `curl`.
  Use the builtin `install` command to add additional tools available on https://search.nixos.org/packages.
  Docker Debug supports `bash`, `fish`, and `zsh`. 
  By default it tries to auto-detect your shell.
@y
  With `docker debug` you can get a debug shell into any container or image, even if they don't contain a shell. 
  You don't need to modify the image to use Docker Debug. 
  However, using Docker Debug still won't modify your image.
  Docker Debug brings its own toolbox that you can easily customize.
  The toolbox comes with many standard Linux tools pre-installed, such as `vim`, `nano`, `htop`, and `curl`.
  Use the builtin `install` command to add additional tools available on https://search.nixos.org/packages.
  Docker Debug supports `bash`, `fish`, and `zsh`. 
  By default it tries to auto-detect your shell.
@z

@x
  Custom builtin tools:
  - `install [tool1] [tool2]`: Add Nix packages from: https://search.nixos.org/packages, see [example](#managing-your-toolbox-using-the-install-command).
  - `uninstall [tool1] [tool2]`: Uninstall Nix packages.
  - `entrypoint`: Print, lint, or run the entrypoint, see [example](#understanding-the-default-startup-command-of-a-container-entry-points).
  - `builtins`: Show custom builtin tools.
@y
  Custom builtin tools:
  - `install [tool1] [tool2]`: Add Nix packages from: https://search.nixos.org/packages, see [example](#managing-your-toolbox-using-the-install-command).
  - `uninstall [tool1] [tool2]`: Uninstall Nix packages.
  - `entrypoint`: Print, lint, or run the entrypoint, see [example](#understanding-the-default-startup-command-of-a-container-entry-points).
  - `builtins`: Show custom builtin tools.
@z

@x
  > **Note**
  >
  > For images and stopped containers, all changes are discarded when leaving the shell. 
  > At no point, do changes affect the actual image or container. 
  > When accessing running or paused containers, all filesystem changes are directly visible to the container. 
  > The `/nix` directory is never visible to the actual image or container.
@y
  > **Note**
  >
  > For images and stopped containers, all changes are discarded when leaving the shell. 
  > At no point, do changes affect the actual image or container. 
  > When accessing running or paused containers, all filesystem changes are directly visible to the container. 
  > The `/nix` directory is never visible to the actual image or container.
@z

@x
usage: debug [OPTIONS] {CONTAINER|IMAGE}
pname: docker
plink: docker.yaml
options:
  - option: shell
    value_type: shell
    default_value: "auto"
    description: "Select a shell. Supported: `bash`, `fish`, `zsh`, `auto`."
    deprecated: false
    hidden: false
    experimental: false
    experimentalcli: false
    kubernetes: false
    swarm: false
  - option: command
    shorthand: c
    value_type: string
    default_value: false
    description: Evaluate the specified commands instead of starting an interactive session, see [example](#running-commands-directly-eg-for-scripting).
    deprecated: false
    hidden: false
    experimental: false
    experimentalcli: false
    kubernetes: false
    swarm: false
  - option: host
    value_type: string
    default_value: false
    description: "Daemon docker socket to connect to. E.g.: `ssh://root@example.org`, `unix:///some/path/docker.sock`, see [example](#remote-debugging-using-the---host-option)."
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
  ### Debugging containers that have no shell (slim containers)
@y
usage: debug [OPTIONS] {CONTAINER|IMAGE}
pname: docker
plink: docker.yaml
options:
  - option: shell
    value_type: shell
    default_value: "auto"
    description: "Select a shell. Supported: `bash`, `fish`, `zsh`, `auto`."
    deprecated: false
    hidden: false
    experimental: false
    experimentalcli: false
    kubernetes: false
    swarm: false
  - option: command
    shorthand: c
    value_type: string
    default_value: false
    description: Evaluate the specified commands instead of starting an interactive session, see [example](#running-commands-directly-eg-for-scripting).
    deprecated: false
    hidden: false
    experimental: false
    experimentalcli: false
    kubernetes: false
    swarm: false
  - option: host
    value_type: string
    default_value: false
    description: "Daemon docker socket to connect to. E.g.: `ssh://root@example.org`, `unix:///some/path/docker.sock`, see [example](#remote-debugging-using-the---host-option)."
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
  ### Debugging containers that have no shell (slim containers)
@z

@x
  The `hello-world` image is very simple and only contains the `/hello` binary.
  It's a good example of a slim image.
  There are no other tools and no shell.
@y
  The `hello-world` image is very simple and only contains the `/hello` binary.
  It's a good example of a slim image.
  There are no other tools and no shell.
@z

@x
  Run a container from the `hello-world` image:
@y
  Run a container from the `hello-world` image:
@z

@x
  ```console
  $ docker run --name my-app hello-world
  ```
@y
  ```console
  $ docker run --name my-app hello-world
  ```
@z

@x
  The container exits immediately. To get a debug shell inside, run:
@y
  The container exits immediately. To get a debug shell inside, run:
@z

@x
  ```console
  $ docker debug my-app
  ```
@y
  ```console
  $ docker debug my-app
  ```
@z

@x
  The debug shell allows you to inspect the filesystem:
@y
  The debug shell allows you to inspect the filesystem:
@z

@x
  ```console
  docker > ls
  dev  etc  hello  nix  proc  sys
  ```
@y
  ```console
  docker > ls
  dev  etc  hello  nix  proc  sys
  ```
@z

@x
  The file `/hello` is the binary that was executed when running the container.
  You can confirm this by running it directly:
@y
  The file `/hello` is the binary that was executed when running the container.
  You can confirm this by running it directly:
@z

@x
  ```console
  docker > /hello
  ```
@y
  ```console
  docker > /hello
  ```
@z

@x
  After running the binary, it produces the same output.
@y
  After running the binary, it produces the same output.
@z

@x
  ### Debugging (slim) images
@y
  ### Debugging (slim) images
@z

@x
  You can debug images directly by running:
@y
  You can debug images directly by running:
@z

@x
  ```console
  $ docker debug hello-world
  ...
  docker > ls
  dev  etc  hello  nix  proc  sys
  ```
@y
  ```console
  $ docker debug hello-world
  ...
  docker > ls
  dev  etc  hello  nix  proc  sys
  ```
@z

@x
  You don't even need to pull the image as `docker debug` will do this automatically like the `docker run` command.
@y
  You don't even need to pull the image as `docker debug` will do this automatically like the `docker run` command.
@z

@x
  ### Modifying files of a running container
@y
  ### Modifying files of a running container
@z

@x
  Docker debug lets you modify files in any running container. 
  The toolbox comes with `vim` and `nano` pre-installed.
@y
  Docker debug lets you modify files in any running container. 
  The toolbox comes with `vim` and `nano` pre-installed.
@z

@x
  Run an nginx container and change the default `index.html`:
@y
  Run an nginx container and change the default `index.html`:
@z

@x
  ```console
  $ docker run -d --name web-app -p 8080:80 nginx
  d3d6074d0ea901c96cac8e49e6dad21359616bef3dc0623b3c2dfa536c31dfdb
  ```
@y
  ```console
  $ docker run -d --name web-app -p 8080:80 nginx
  d3d6074d0ea901c96cac8e49e6dad21359616bef3dc0623b3c2dfa536c31dfdb
  ```
@z

@x
  To confirm nginx is running, open a browser and navigate to http://localhost:8080.
  You should see the default nginx page.
  Now, change it using vim:
@y
  To confirm nginx is running, open a browser and navigate to http://localhost:8080.
  You should see the default nginx page.
  Now, change it using vim:
@z

@x
  ```console
  vim /usr/share/nginx/html/index.html
  ```
@y
  ```console
  vim /usr/share/nginx/html/index.html
  ```
@z

@x
  Change the title to "Welcome to my app!" and save the file.
  Now, reload the page in the browser and you should see the updated page.
@y
  Change the title to "Welcome to my app!" and save the file.
  Now, reload the page in the browser and you should see the updated page.
@z

@x
  ### Managing your toolbox using the `install` command
@y
  ### Managing your toolbox using the `install` command
@z

@x
  The builtin `install` command lets you add any tool from https://search.nixos.org/packages to the toolbox.
  Keep in mind adding a tool never modifies the actual image or container.
  Tools get added to only your toolbox.
  Run `docker debug` and then install `nmap`:
@y
  The builtin `install` command lets you add any tool from https://search.nixos.org/packages to the toolbox.
  Keep in mind adding a tool never modifies the actual image or container.
  Tools get added to only your toolbox.
  Run `docker debug` and then install `nmap`:
@z

@x
  ```console
  $ docker debug nginx
  ...
  docker > install nmap
  Tip: You can install any package available at: https://search.nixos.org/packages.
  installing 'nmap-7.93'
  these 2 paths will be fetched (5.58 MiB download, 26.27 MiB unpacked):
  /nix/store/brqjf4i23fagizaq2gn4d6z0f406d0kg-lua-5.3.6
  /nix/store/xqd17rhgmn6pg85a3g18yqxpcya6d06r-nmap-7.93
  copying path '/nix/store/brqjf4i23fagizaq2gn4d6z0f406d0kg-lua-5.3.6' from 'https://cache.nixos.org'...
  copying path '/nix/store/xqd17rhgmn6pg85a3g18yqxpcya6d06r-nmap-7.93' from 'https://cache.nixos.org'...
  building '/nix/store/k8xw5wwarh8dc1dvh5zx8rlwamxfsk3d-user-environment.drv'...
@y
  ```console
  $ docker debug nginx
  ...
  docker > install nmap
  Tip: You can install any package available at: https://search.nixos.org/packages.
  installing 'nmap-7.93'
  these 2 paths will be fetched (5.58 MiB download, 26.27 MiB unpacked):
  /nix/store/brqjf4i23fagizaq2gn4d6z0f406d0kg-lua-5.3.6
  /nix/store/xqd17rhgmn6pg85a3g18yqxpcya6d06r-nmap-7.93
  copying path '/nix/store/brqjf4i23fagizaq2gn4d6z0f406d0kg-lua-5.3.6' from 'https://cache.nixos.org'...
  copying path '/nix/store/xqd17rhgmn6pg85a3g18yqxpcya6d06r-nmap-7.93' from 'https://cache.nixos.org'...
  building '/nix/store/k8xw5wwarh8dc1dvh5zx8rlwamxfsk3d-user-environment.drv'...
@z

@x
  docker > nmap --version
  Nmap version 7.93 ( https://nmap.org )
  Platform: x86_64-unknown-linux-gnu
  Compiled with: liblua-5.3.6 openssl-3.0.11 libssh2-1.11.0 nmap-libz-1.2.12 libpcre-8.45 libpcap-1.10.4 nmap-libdnet-1.12 ipv6
  Compiled without:
  Available nsock engines: epoll poll select
  ```
@y
  docker > nmap --version
  Nmap version 7.93 ( https://nmap.org )
  Platform: x86_64-unknown-linux-gnu
  Compiled with: liblua-5.3.6 openssl-3.0.11 libssh2-1.11.0 nmap-libz-1.2.12 libpcre-8.45 libpcap-1.10.4 nmap-libdnet-1.12 ipv6
  Compiled without:
  Available nsock engines: epoll poll select
  ```
@z

@x
  You can confirm `nmap` is now part of your toolbox by getting a debug shell into a different image:
@y
  You can confirm `nmap` is now part of your toolbox by getting a debug shell into a different image:
@z

@x
  ```console
  $ docker debug hello-world
  ...
  docker > nmap --version
@y
  ```console
  $ docker debug hello-world
  ...
  docker > nmap --version
@z

@x
  Nmap version 7.93 ( https://nmap.org )
  Platform: x86_64-unknown-linux-gnu
  Compiled with: liblua-5.3.6 openssl-3.0.11 libssh2-1.11.0 nmap-libz-1.2.12 libpcre-8.45 libpcap-1.10.4 nmap-libdnet-1.12 ipv6
  Compiled without:
  Available nsock engines: epoll poll select
@y
  Nmap version 7.93 ( https://nmap.org )
  Platform: x86_64-unknown-linux-gnu
  Compiled with: liblua-5.3.6 openssl-3.0.11 libssh2-1.11.0 nmap-libz-1.2.12 libpcre-8.45 libpcap-1.10.4 nmap-libdnet-1.12 ipv6
  Compiled without:
  Available nsock engines: epoll poll select
@z

@x
  docker > exit
  ```
@y
  docker > exit
  ```
@z

@x
  `nmap` is still there.
@y
  `nmap` is still there.
@z

@x
  ### Understanding the default startup command of a container (entry points)
@y
  ### Understanding the default startup command of a container (entry points)
@z

@x
  Docker Debug comes with a builtin tool, `entrypoint`.
  Enter the `hello-world` image and confirm the entrypoint is `/hello`:
@y
  Docker Debug comes with a builtin tool, `entrypoint`.
  Enter the `hello-world` image and confirm the entrypoint is `/hello`:
@z

@x
  ```console
  $ docker debug hello-world
  ...
  docker > entrypoint --print
  /hello
  ```
@y
  ```console
  $ docker debug hello-world
  ...
  docker > entrypoint --print
  /hello
  ```
@z

@x
  The `entrypoint` command evaluates the `ENTRYPOINT` and `CMD` statement of the underlying image 
  and lets you print, lint, or run the resulting entrypoint.
  However, it can be difficult to understand all the corner cases from [Understand how CMD and ENTRYPOINT interact](/engine/reference/builder/#understand-how-cmd-and-entrypoint-interact). 
  In these situations, `entrypoint` can help.
@y
  The `entrypoint` command evaluates the `ENTRYPOINT` and `CMD` statement of the underlying image 
  and lets you print, lint, or run the resulting entrypoint.
  However, it can be difficult to understand all the corner cases from [Understand how CMD and ENTRYPOINT interact](__SUBDIR__/engine/reference/builder/#understand-how-cmd-and-entrypoint-interact). 
  In these situations, `entrypoint` can help.
@z

@x
  Use `entrypoint` to investigate what actually happens when you run a container from the Nginx image:
@y
  Use `entrypoint` to investigate what actually happens when you run a container from the Nginx image:
@z

@x
  ```console
  $ docker debug nginx
  ...
  docker > entrypoint
  Understand how ENTRYPOINT/CMD work and if they are set correctly.
  From CMD in Dockerfile:
   ['nginx', '-g', 'daemon off;']
@y
  ```console
  $ docker debug nginx
  ...
  docker > entrypoint
  Understand how ENTRYPOINT/CMD work and if they are set correctly.
  From CMD in Dockerfile:
   ['nginx', '-g', 'daemon off;']
@z

@x
  From ENTRYPOINT in Dockerfile:
   ['/docker-entrypoint.sh']
@y
  From ENTRYPOINT in Dockerfile:
   ['/docker-entrypoint.sh']
@z

@x
  By default, any container from this image will be started with following   command:
@y
  By default, any container from this image will be started with following   command:
@z

@x
  /docker-entrypoint.sh nginx -g daemon off;
@y
  /docker-entrypoint.sh nginx -g daemon off;
@z

@x
  path: /docker-entrypoint.sh
  args: nginx -g daemon off;
  cwd:
  PATH: /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
@y
  path: /docker-entrypoint.sh
  args: nginx -g daemon off;
  cwd:
  PATH: /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
@z

@x
  Lint results:
   PASS: '/docker-entrypoint.sh' found
   PASS: no mixing of shell and exec form
   PASS: no double use of shell form
@y
  Lint results:
   PASS: '/docker-entrypoint.sh' found
   PASS: no mixing of shell and exec form
   PASS: no double use of shell form
@z

@x
  Docs:
  - https://docs.docker.com/engine/reference/builder/#cmd
  - https://docs.docker.com/engine/reference/builder/#entrypoint
  - https://docs.docker.com/engine/reference/builder/#understand-how-cmd-and-entrypoint-interact
  ```
@y
  Docs:
  - https://docs.docker.com/engine/reference/builder/#cmd
  - https://docs.docker.com/engine/reference/builder/#entrypoint
  - https://docs.docker.com/engine/reference/builder/#understand-how-cmd-and-entrypoint-interact
  ```
@z

@x
  The output tells you that on startup of the nginx image, a script `/docker-entrypoint.sh` is executed with the arguments `nginx -g daemon off;`.
  You can test the entrypoint by using the `--run` option:
@y
  The output tells you that on startup of the nginx image, a script `/docker-entrypoint.sh` is executed with the arguments `nginx -g daemon off;`.
  You can test the entrypoint by using the `--run` option:
@z

@x
  ```console
  $ docker debug nginx
  ...
  docker > entrypoint --run
  /docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
  /docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
  /docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
  10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
  10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
  /docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
  /docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
  /docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
  /docker-entrypoint.sh: Configuration complete; ready for start up
  2024/01/19 17:34:39 [notice] 50#50: using the "epoll" event method
  2024/01/19 17:34:39 [notice] 50#50: nginx/1.25.3
  2024/01/19 17:34:39 [notice] 50#50: built by gcc 12.2.0 (Debian 12.2.0-14)
  2024/01/19 17:34:39 [notice] 50#50: OS: Linux 5.15.133.1-microsoft-standard-WSL2
  2024/01/19 17:34:39 [notice] 50#50: getrlimit(RLIMIT_NOFILE): 1048576:1048576
  2024/01/19 17:34:39 [notice] 50#50: start worker processes
  2024/01/19 17:34:39 [notice] 50#50: start worker process 77
  ...
  ```
@y
  ```console
  $ docker debug nginx
  ...
  docker > entrypoint --run
  /docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
  /docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
  /docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
  10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
  10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
  /docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
  /docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
  /docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
  /docker-entrypoint.sh: Configuration complete; ready for start up
  2024/01/19 17:34:39 [notice] 50#50: using the "epoll" event method
  2024/01/19 17:34:39 [notice] 50#50: nginx/1.25.3
  2024/01/19 17:34:39 [notice] 50#50: built by gcc 12.2.0 (Debian 12.2.0-14)
  2024/01/19 17:34:39 [notice] 50#50: OS: Linux 5.15.133.1-microsoft-standard-WSL2
  2024/01/19 17:34:39 [notice] 50#50: getrlimit(RLIMIT_NOFILE): 1048576:1048576
  2024/01/19 17:34:39 [notice] 50#50: start worker processes
  2024/01/19 17:34:39 [notice] 50#50: start worker process 77
  ...
  ```
@z

@x
  This starts nginx in your debug shell without having to actually run a container.
  You can shutdown nginx by pressing `Ctrl`+`C`.
@y
  This starts nginx in your debug shell without having to actually run a container.
  You can shutdown nginx by pressing `Ctrl`+`C`.
@z

@x
  ### Running commands directly (e.g., for scripting)
@y
  ### Running commands directly (e.g., for scripting)
@z

@x
  Use the `--command` option to evaluate a command directly instead of starting an interactive session. 
  For example, this is similar to `bash -c "arg1 arg2 ..."`.
  The following example runs the `cat` command in the nginx image without starting an interactive session.
@y
  Use the `--command` option to evaluate a command directly instead of starting an interactive session. 
  For example, this is similar to `bash -c "arg1 arg2 ..."`.
  The following example runs the `cat` command in the nginx image without starting an interactive session.
@z

@x
  ```console
  $ docker debug --command "cat /usr/share/nginx/html/index.html" nginx
@y
  ```console
  $ docker debug --command "cat /usr/share/nginx/html/index.html" nginx
@z

@x
  <!DOCTYPE html>
  <html>
  <head>
  <title>Welcome to nginx!</title>
  <style>
  html { color-scheme: light dark; }
  body { width: 35em; margin: 0 auto;
  font-family: Tahoma, Verdana, Arial, sans-serif; }
  </style>
  </head>
  <body>
  <h1>Welcome to nginx!</h1>
  <p>If you see this page, the nginx web server is successfully installed and
  working. Further configuration is required.</p>
@y
  <!DOCTYPE html>
  <html>
  <head>
  <title>Welcome to nginx!</title>
  <style>
  html { color-scheme: light dark; }
  body { width: 35em; margin: 0 auto;
  font-family: Tahoma, Verdana, Arial, sans-serif; }
  </style>
  </head>
  <body>
  <h1>Welcome to nginx!</h1>
  <p>If you see this page, the nginx web server is successfully installed and
  working. Further configuration is required.</p>
@z

@x
  <p>For online documentation and support please refer to
  <a href="http://nginx.org/">nginx.org</a>.<br/>
  Commercial support is available at
  <a href="http://nginx.com/">nginx.com</a>.</p>
@y
  <p>For online documentation and support please refer to
  <a href="http://nginx.org/">nginx.org</a>.<br/>
  Commercial support is available at
  <a href="http://nginx.com/">nginx.com</a>.</p>
@z

@x
  <p><em>Thank you for using nginx.</em></p>
  </body>
  </html>
  ```
@y
  <p><em>Thank you for using nginx.</em></p>
  </body>
  </html>
  ```
@z

@x
  ### Remote debugging using the --host option
@y
  ### Remote debugging using the --host option
@z

@x
  The following examples shows how to use the `--host` option. The first example uses SSH to connect to a remote Docker instance at `example.org` as the `root` user, and get a shell into the `my-container` container.
@y
  The following examples shows how to use the `--host` option. The first example uses SSH to connect to a remote Docker instance at `example.org` as the `root` user, and get a shell into the `my-container` container.
@z

@x
  ```console
  $ docker debug --host ssh://root@example.org my-container
  ```
@y
  ```console
  $ docker debug --host ssh://root@example.org my-container
  ```
@z

@x
  The following example connects to a different local Docker Engine, and gets a
  shell into the `my-container` container.
@y
  The following example connects to a different local Docker Engine, and gets a
  shell into the `my-container` container.
@z

@x
  ```console
  $ docker debug --host=unix:///some/path/docker.sock my-container
  ```
@y
  ```console
  $ docker debug --host=unix:///some/path/docker.sock my-container
  ```
@z
