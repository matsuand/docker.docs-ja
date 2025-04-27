%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: components and formatting examples used in Docker's docs
title: Code blocks
@y
description: components and formatting examples used in Docker's docs
title: Code blocks
@z

@x
Rouge provides lots of different code block "hints". If you leave off the hint,
it tries to guess and sometimes gets it wrong. These are just a few hints that
we use often.
@y
Rouge provides lots of different code block "hints". If you leave off the hint,
it tries to guess and sometimes gets it wrong. These are just a few hints that
we use often.
@z

@x
## Variables
@y
## Variables
@z

@x
If your example contains a placeholder value that's subject to change,
use the format `<[A-Z_]+>` for the placeholder value: `<MY_VARIABLE>`
@y
If your example contains a placeholder value that's subject to change,
use the format `<[A-Z_]+>` for the placeholder value: `<MY_VARIABLE>`
@z

@x
```none
export name=<MY_NAME>
```
@y
```none
export name=<MY_NAME>
```
@z

@x
This syntax is reserved for variable names, and will cause the variable to
be rendered in a special color and font style.
@y
This syntax is reserved for variable names, and will cause the variable to
be rendered in a special color and font style.
@z

@x
## Highlight lines
@y
## Highlight lines
@z

@x
```text {hl_lines=[7,8]}
incoming := map[string]interface{}{
    "asdf": 1,
    "qwer": []interface{}{},
    "zxcv": []interface{}{
        map[string]interface{}{},
        true,
        int(1e9),
        "tyui",
    },
}    
```
@y
```text {hl_lines=[7,8]}
incoming := map[string]interface{}{
    "asdf": 1,
    "qwer": []interface{}{},
    "zxcv": []interface{}{
        map[string]interface{}{},
        true,
        int(1e9),
        "tyui",
    },
}    
```
@z

@x
````markdown
```go {hl_lines=[7,8]}
incoming := map[string]interface{}{
    "asdf": 1,
    "qwer": []interface{}{},
    "zxcv": []interface{}{
        map[string]interface{}{},
        true,
        int(1e9),
        "tyui",
    },
}   
```
````
@y
````markdown
```go {hl_lines=[7,8]}
incoming := map[string]interface{}{
    "asdf": 1,
    "qwer": []interface{}{},
    "zxcv": []interface{}{
        map[string]interface{}{},
        true,
        int(1e9),
        "tyui",
    },
}   
```
````
@z

@x
## Collapsible code blocks
@y
## Collapsible code blocks
@z

@x
```dockerfile {collapse=true}
# syntax=docker/dockerfile:1
@y
```dockerfile {collapse=true}
# syntax=docker/dockerfile:1
@z

@x
ARG GO_VERSION="1.21"
@y
ARG GO_VERSION="1.21"
@z

@x
FROM golang:${GO_VERSION}-alpine AS base
ENV CGO_ENABLED=0
ENV GOPRIVATE="github.com/foo/*"
RUN apk add --no-cache file git rsync openssh-client
RUN mkdir -p -m 0700 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
WORKDIR /src
@y
FROM golang:${GO_VERSION}-alpine AS base
ENV CGO_ENABLED=0
ENV GOPRIVATE="github.com/foo/*"
RUN apk add --no-cache file git rsync openssh-client
RUN mkdir -p -m 0700 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
WORKDIR /src
@z

@x
FROM base AS vendor
# this step configure git and checks the ssh key is loaded
RUN --mount=type=ssh <<EOT
  set -e
  echo "Setting Git SSH protocol"
  git config --global url."git@github.com:".insteadOf "https://github.com/"
  (
    set +e
    ssh -T git@github.com
    if [ ! "$?" = "1" ]; then
      echo "No GitHub SSH key loaded exiting..."
      exit 1
    fi
  )
EOT
# this one download go modules
RUN --mount=type=bind,target=. \
    --mount=type=cache,target=/go/pkg/mod \
    --mount=type=ssh \
    go mod download -x
@y
FROM base AS vendor
# this step configure git and checks the ssh key is loaded
RUN --mount=type=ssh <<EOT
  set -e
  echo "Setting Git SSH protocol"
  git config --global url."git@github.com:".insteadOf "https://github.com/"
  (
    set +e
    ssh -T git@github.com
    if [ ! "$?" = "1" ]; then
      echo "No GitHub SSH key loaded exiting..."
      exit 1
    fi
  )
EOT
# this one download go modules
RUN --mount=type=bind,target=. \
    --mount=type=cache,target=/go/pkg/mod \
    --mount=type=ssh \
    go mod download -x
@z

@x
FROM vendor AS build
RUN --mount=type=bind,target=. \
    --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache \
    go build ...
```
@y
FROM vendor AS build
RUN --mount=type=bind,target=. \
    --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache \
    go build ...
```
@z

@x
## Bash
@y
## Bash
@z

@x
Use the `bash` language code block when you want to show a Bash script:
@y
Use the `bash` language code block when you want to show a Bash script:
@z

@x
```bash
#!/usr/bin/bash
echo "deb https://download.docker.com/linux/ubuntu noble stable" | sudo tee /etc/apt/sources.list.d/docker.list
```
@y
```bash
#!/usr/bin/bash
echo "deb https://download.docker.com/linux/ubuntu noble stable" | sudo tee /etc/apt/sources.list.d/docker.list
```
@z

@x
If you want to show an interactive shell, use `console` instead.
In cases where you use `console`, make sure to add a dollar character
for the user sign:
@y
If you want to show an interactive shell, use `console` instead.
In cases where you use `console`, make sure to add a dollar character
for the user sign:
@z

@x
```console
$ echo "deb https://download.docker.com/linux/ubuntu noble stable" | sudo tee /etc/apt/sources.list.d/docker.list
```
@y
```console
$ echo "deb https://download.docker.com/linux/ubuntu noble stable" | sudo tee /etc/apt/sources.list.d/docker.list
```
@z

@x
## Go
@y
## Go
@z

@x
```go
incoming := map[string]interface{}{
    "asdf": 1,
    "qwer": []interface{}{},
    "zxcv": []interface{}{
        map[string]interface{}{},
        true,
        int(1e9),
        "tyui",
    },
}
```
@y
```go
incoming := map[string]interface{}{
    "asdf": 1,
    "qwer": []interface{}{},
    "zxcv": []interface{}{
        map[string]interface{}{},
        true,
        int(1e9),
        "tyui",
    },
}
```
@z

@x
## PowerShell
@y
## PowerShell
@z

@x
```powershell
Install-Module DockerMsftProvider -Force
Install-Package Docker -ProviderName DockerMsftProvider -Force
[System.Environment]::SetEnvironmentVariable("DOCKER_FIPS", "1", "Machine")
Expand-Archive docker-18.09.1.zip -DestinationPath $Env:ProgramFiles -Force
```
@y
```powershell
Install-Module DockerMsftProvider -Force
Install-Package Docker -ProviderName DockerMsftProvider -Force
[System.Environment]::SetEnvironmentVariable("DOCKER_FIPS", "1", "Machine")
Expand-Archive docker-18.09.1.zip -DestinationPath $Env:ProgramFiles -Force
```
@z

@x
## Python
@y
## Python
@z

@x
```python
return html.format(name=os.getenv('NAME', "world"), hostname=socket.gethostname(), visits=visits)
```
@y
```python
return html.format(name=os.getenv('NAME', "world"), hostname=socket.gethostname(), visits=visits)
```
@z

@x
## Ruby
@y
## Ruby
@z

@x
```ruby
docker_service 'default' do
  action [:create, :start]
end
```
@y
```ruby
docker_service 'default' do
  action [:create, :start]
end
```
@z

@x
## JSON
@y
## JSON
@z

@x
```json
"server": {
  "http_addr": ":4443",
  "tls_key_file": "./fixtures/notary-server.key",
  "tls_cert_file": "./fixtures/notary-server.crt"
}
```
@y
```json
"server": {
  "http_addr": ":4443",
  "tls_key_file": "./fixtures/notary-server.key",
  "tls_cert_file": "./fixtures/notary-server.crt"
}
```
@z

@x
#### HTML
@y
#### HTML
@z

@x
```html
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
</head>
</html>
```
@y
```html
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
</head>
</html>
```
@z

@x
## Markdown
@y
## Markdown
@z

@x
```markdown
# Hello
```
@y
```markdown
# Hello
```
@z

@x
If you want to include a triple-fenced code block inside your code block,
you can wrap your block in a quadruple-fenced code block:
@y
If you want to include a triple-fenced code block inside your code block,
you can wrap your block in a quadruple-fenced code block:
@z

@x
`````markdown
````markdown
# Hello
@y
`````markdown
````markdown
# Hello
@z

@x
```go
log.Println("did something")
```
````
`````
@y
```go
log.Println("did something")
```
````
`````
@z

@x
## ini
@y
## ini
@z

@x
```ini
[supervisord]
nodaemon=true
@y
```ini
[supervisord]
nodaemon=true
@z

@x
[program:sshd]
command=/usr/sbin/sshd -D
```
@y
[program:sshd]
command=/usr/sbin/sshd -D
```
@z

@x
## Dockerfile
@y
## Dockerfile
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
@y
```dockerfile
# syntax=docker/dockerfile:1
@z

@x
FROM ubuntu
@y
FROM ubuntu
@z

@x
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8
@y
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8
@z

@x
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list
@y
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list
@z

@x
RUN apt-get update && apt-get install -y python-software-properties software-properties-common postgresql-9.3 postgresql-client-9.3 postgresql-contrib-9.3
@y
RUN apt-get update && apt-get install -y python-software-properties software-properties-common postgresql-9.3 postgresql-client-9.3 postgresql-contrib-9.3
@z

@x
# Note: The official Debian and Ubuntu images automatically ``apt-get clean``
# after each ``apt-get``
@y
# Note: The official Debian and Ubuntu images automatically ``apt-get clean``
# after each ``apt-get``
@z

@x
USER postgres
@y
USER postgres
@z

@x
RUN    /etc/init.d/postgresql start &&\
    psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" &&\
    createdb -O docker docker
@y
RUN    /etc/init.d/postgresql start &&\
    psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" &&\
    createdb -O docker docker
@z

@x
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.3/main/pg_hba.conf
@y
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.3/main/pg_hba.conf
@z

@x
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf
@y
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf
@z

@x
EXPOSE 5432
@y
EXPOSE 5432
@z

@x
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]
@y
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]
@z

@x
CMD ["/usr/lib/postgresql/9.3/bin/postgres", "-D", "/var/lib/postgresql/9.3/main", "-c", "config_file=/etc/postgresql/9.3/main/postgresql.conf"]
```
@y
CMD ["/usr/lib/postgresql/9.3/bin/postgres", "-D", "/var/lib/postgresql/9.3/main", "-c", "config_file=/etc/postgresql/9.3/main/postgresql.conf"]
```
@z

@x
## YAML
@y
## YAML
@z

@x
```yaml
authorizedkeys:
  image: dockercloud/authorizedkeys
  deployment_strategy: every_node
  autodestroy: always
  environment:
    - AUTHORIZED_KEYS=ssh-rsa AAAAB3Nsomelongsshkeystringhereu9UzQbVKy9o00NqXa5jkmZ9Yd0BJBjFmb3WwUR8sJWZVTPFL
  volumes:
    /root:/user:rw
```
@y
```yaml
authorizedkeys:
  image: dockercloud/authorizedkeys
  deployment_strategy: every_node
  autodestroy: always
  environment:
    - AUTHORIZED_KEYS=ssh-rsa AAAAB3Nsomelongsshkeystringhereu9UzQbVKy9o00NqXa5jkmZ9Yd0BJBjFmb3WwUR8sJWZVTPFL
  volumes:
    /root:/user:rw
```
@z
