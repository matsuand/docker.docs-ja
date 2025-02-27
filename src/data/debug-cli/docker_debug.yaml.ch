%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
command: docker debug
short: Get a shell into any container or image. An alternative to debugging with `docker exec`.
@y
command: docker debug
short: Get a shell into any container or image. An alternative to debugging with `docker exec`.
@z

@x
long: |-
  Docker Debug is a CLI command that helps you follow best practices by keeping your images small and secure. 
  With Docker Debug, you can debug your images while they contain the bare minimum to run your application.
  It does this by letting you create and work with slim images or containers that are often difficult to debug because all tools have been removed. 
  For example, while typical debug approaches like `docker exec -it my-app bash` may not work on a slim container, `docker debug` will work.
@y
long: |-
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
  > [!NOTE]
  >
  > For images and stopped containers, all changes are discarded when leaving the shell. 
  > At no point, do changes affect the actual image or container. 
  > When accessing running or paused containers, all filesystem changes are directly visible to the container. 
  > The `/nix` directory is never visible to the actual image or container.
@y
  > [!NOTE]
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
@y
usage: debug [OPTIONS] {CONTAINER|IMAGE}
pname: docker
plink: docker.yaml
@z

% options:

@x
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
@y
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
@z

@x
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
@y
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
@z

@x
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
@y
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
@z

% snip directives...

@x
examples: |-
  ### Debugging containers that have no shell (slim containers)
@y
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

% snip command...

@x
  The container exits immediately. To get a debug shell inside, run:
@y
  The container exits immediately. To get a debug shell inside, run:
@z

% snip command...

@x
  The debug shell allows you to inspect the filesystem:
@y
  The debug shell allows you to inspect the filesystem:
@z

% snip command...

@x
  The file `/hello` is the binary that was executed when running the container.
  You can confirm this by running it directly:
@y
  The file `/hello` is the binary that was executed when running the container.
  You can confirm this by running it directly:
@z

% snip command...

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

% snip command...

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

% snip command...

@x
  To confirm nginx is running, open a browser and navigate to http://localhost:8080.
  You should see the default nginx page.
  Now, change it using vim:
@y
  To confirm nginx is running, open a browser and navigate to http://localhost:8080.
  You should see the default nginx page.
  Now, change it using vim:
@z

% snip command...

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

% snip command...

@x
  You can confirm `nmap` is now part of your toolbox by getting a debug shell into a different image:
@y
  You can confirm `nmap` is now part of your toolbox by getting a debug shell into a different image:
@z

% snip command...

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

% snip command...

@x
  The `entrypoint` command evaluates the `ENTRYPOINT` and `CMD` statement of the underlying image 
  and lets you print, lint, or run the resulting entrypoint.
  However, it can be difficult to understand all the corner cases from [Understand how CMD and ENTRYPOINT interact](/reference/dockerfile/#understand-how-cmd-and-entrypoint-interact). 
  In these situations, `entrypoint` can help.
@y
  The `entrypoint` command evaluates the `ENTRYPOINT` and `CMD` statement of the underlying image 
  and lets you print, lint, or run the resulting entrypoint.
  However, it can be difficult to understand all the corner cases from [Understand how CMD and ENTRYPOINT interact](__SUBDIR__/reference/dockerfile/#understand-how-cmd-and-entrypoint-interact). 
  In these situations, `entrypoint` can help.
@z

@x
  Use `entrypoint` to investigate what actually happens when you run a container from the Nginx image:
@y
  Use `entrypoint` to investigate what actually happens when you run a container from the Nginx image:
@z

% snip command...

@x
  The output tells you that on startup of the nginx image, a script `/docker-entrypoint.sh` is executed with the arguments `nginx -g daemon off;`.
  You can test the entrypoint by using the `--run` option:
@y
  The output tells you that on startup of the nginx image, a script `/docker-entrypoint.sh` is executed with the arguments `nginx -g daemon off;`.
  You can test the entrypoint by using the `--run` option:
@z

% snip command...

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

% snip command...

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

% snip command...

@x
  The following example connects to a different local Docker Engine, and gets a
  shell into the `my-container` container.
@y
  The following example connects to a different local Docker Engine, and gets a
  shell into the `my-container` container.
@z

% snip command...
