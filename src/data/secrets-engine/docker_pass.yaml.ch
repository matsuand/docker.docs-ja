%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker pass
short: Manage your local OS keychain secrets.
long: |-
  Docker Pass is a helper that allows you to store secrets securely in your
  local OS keychain and inject them into containers later.
@y
command: docker pass
short: Manage your local OS keychain secrets.
long: |-
  Docker Pass is a helper that allows you to store secrets securely in your
  local OS keychain and inject them into containers later.
@z

@x
  On Windows: Uses the Windows Credential Manager API.
@y
  On Windows: Uses the Windows Credential Manager API.
@z

@x
  On macOS: Uses macOS Keychain services API.
@y
  On macOS: Uses macOS Keychain services API.
@z

@x
  On Linux: `org.freedesktop.secrets` API (requires DBus and `gnome-keyring` or
  `kdewallet` to be installed).
usage: docker pass set|get|ls|rm
pname: docker
plink: docker.yaml
cname:
  - docker pass set
  - docker pass get
  - docker pass ls
  - docker pass rm
clink:
  - docker_pass_set.yaml
  - docker_pass_get.yaml
  - docker_pass_ls.yaml
  - docker_pass_rm.yaml
deprecated: false
experimental: true
experimentalcli: true
kubernetes: false
swarm: false
examples: |-
  ### Using keychain secrets in containers
@y
  On Linux: `org.freedesktop.secrets` API (requires DBus and `gnome-keyring` or
  `kdewallet` to be installed).
usage: docker pass set|get|ls|rm
pname: docker
plink: docker.yaml
cname:
  - docker pass set
  - docker pass get
  - docker pass ls
  - docker pass rm
clink:
  - docker_pass_set.yaml
  - docker_pass_get.yaml
  - docker_pass_ls.yaml
  - docker_pass_rm.yaml
deprecated: false
experimental: true
experimentalcli: true
kubernetes: false
swarm: false
examples: |-
  ### Using keychain secrets in containers
@z

@x
  Create a secret:
@y
  Create a secret:
@z

@x
  ```console
  $ docker pass set GH_TOKEN=123456789
  ```
@y
  ```console
  $ docker pass set GH_TOKEN=123456789
  ```
@z

@x
  Creating a secret from STDIN:
@y
  Creating a secret from STDIN:
@z

@x
  ```console
  echo 123456789 > token.txt
  cat token.txt | docker pass set GH_TOKEN
  ```
@y
  ```console
  echo 123456789 > token.txt
  cat token.txt | docker pass set GH_TOKEN
  ```
@z

@x
  Run a container that uses the secret:
@y
  Run a container that uses the secret:
@z

@x
  ```console
  $ docker run -e GH_TOKEN= -dt --name demo busybox
  ```
@y
  ```console
  $ docker run -e GH_TOKEN= -dt --name demo busybox
  ```
@z

@x
  Inspect your secret from inside the container
@y
  Inspect your secret from inside the container
@z

@x
  ```console
  $ docker exec demo sh -c 'echo $GH_TOKEN'
  123456789
  ```
@y
  ```console
  $ docker exec demo sh -c 'echo $GH_TOKEN'
  123456789
  ```
@z

@x
  Explicitly assigning a secret to another environment variable:
@y
  Explicitly assigning a secret to another environment variable:
@z

@x
  ```console
  $ docker run -e GITHUB_TOKEN=se://GH_TOKEN -dt --name demo busybox
  ```
@y
  ```console
  $ docker run -e GITHUB_TOKEN=se://GH_TOKEN -dt --name demo busybox
  ```
@z
