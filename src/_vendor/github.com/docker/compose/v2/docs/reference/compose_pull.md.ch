%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker compose pull
@y
# docker compose pull
@z

@x
<!---MARKER_GEN_START-->
Pull service images
@y
<!---MARKER_GEN_START-->
Pull service images
@z

@x
### Options
@y
### Options
@z

@x
| Name                     | Type     | Default | Description                                             |
|:-------------------------|:---------|:--------|:--------------------------------------------------------|
| `--dry-run`              |          |         | Execute command in dry run mode                         |
| `--ignore-buildable`     |          |         | Ignore images that can be built.                        |
| `--ignore-pull-failures` |          |         | Pull what it can and ignores images with pull failures. |
| `--include-deps`         |          |         | Also pull services declared as dependencies.            |
| `--policy`               | `string` |         | Apply pull policy ("missing"\|"always").                |
| `-q`, `--quiet`          |          |         | Pull without printing progress information.             |
@y
| Name                     | Type     | Default | Description                                             |
|:-------------------------|:---------|:--------|:--------------------------------------------------------|
| `--dry-run`              |          |         | Execute command in dry run mode                         |
| `--ignore-buildable`     |          |         | Ignore images that can be built.                        |
| `--ignore-pull-failures` |          |         | Pull what it can and ignores images with pull failures. |
| `--include-deps`         |          |         | Also pull services declared as dependencies.            |
| `--policy`               | `string` |         | Apply pull policy ("missing"\|"always").                |
| `-q`, `--quiet`          |          |         | Pull without printing progress information.             |
@z

@x
<!---MARKER_GEN_END-->
@y
<!---MARKER_GEN_END-->
@z

@x
## Description
@y
## Description
@z

@x
Pulls an image associated with a service defined in a `compose.yaml` file, but does not start containers based on
those images.
@y
Pulls an image associated with a service defined in a `compose.yaml` file, but does not start containers based on
those images.
@z

@x
## Examples
@y
## Examples
@z

@x
Consider the following `compose.yaml`:
@y
Consider the following `compose.yaml`:
@z

@x
```yaml
services:
  db:
    image: postgres
  web:
    build: .
    command: bundle exec rails s -p 3000 -b '0.0.0.0'
    volumes:
      - .:/myapp
    ports:
      - "3000:3000"
    depends_on:
      - db
```
@y
```yaml
services:
  db:
    image: postgres
  web:
    build: .
    command: bundle exec rails s -p 3000 -b '0.0.0.0'
    volumes:
      - .:/myapp
    ports:
      - "3000:3000"
    depends_on:
      - db
```
@z

@x
If you run `docker compose pull ServiceName` in the same directory as the `compose.yaml` file that defines the service,
Docker pulls the associated image. For example, to call the postgres image configured as the db service in our example,
you would run `docker compose pull db`.
@y
If you run `docker compose pull ServiceName` in the same directory as the `compose.yaml` file that defines the service,
Docker pulls the associated image. For example, to call the postgres image configured as the db service in our example,
you would run `docker compose pull db`.
@z

@x
```console
$ docker compose pull db
[+] Running 1/15
 ⠸ db Pulling                                                             12.4s
   ⠿ 45b42c59be33 Already exists                                           0.0s
   ⠹ 40adec129f1a Downloading  3.374MB/4.178MB                             9.3s
   ⠹ b4c431d00c78 Download complete                                        9.3s
   ⠹ 2696974e2815 Download complete                                        9.3s
   ⠹ 564b77596399 Downloading  5.622MB/7.965MB                             9.3s
   ⠹ 5044045cf6f2 Downloading  216.7kB/391.1kB                             9.3s
   ⠹ d736e67e6ac3 Waiting                                                  9.3s
   ⠹ 390c1c9a5ae4 Waiting                                                  9.3s
   ⠹ c0e62f172284 Waiting                                                  9.3s
   ⠹ ebcdc659c5bf Waiting                                                  9.3s
   ⠹ 29be22cb3acc Waiting                                                  9.3s
   ⠹ f63c47038e66 Waiting                                                  9.3s
   ⠹ 77a0c198cde5 Waiting                                                  9.3s
   ⠹ c8752d5b785c Waiting                                                  9.3s
```
@y
```console
$ docker compose pull db
[+] Running 1/15
 ⠸ db Pulling                                                             12.4s
   ⠿ 45b42c59be33 Already exists                                           0.0s
   ⠹ 40adec129f1a Downloading  3.374MB/4.178MB                             9.3s
   ⠹ b4c431d00c78 Download complete                                        9.3s
   ⠹ 2696974e2815 Download complete                                        9.3s
   ⠹ 564b77596399 Downloading  5.622MB/7.965MB                             9.3s
   ⠹ 5044045cf6f2 Downloading  216.7kB/391.1kB                             9.3s
   ⠹ d736e67e6ac3 Waiting                                                  9.3s
   ⠹ 390c1c9a5ae4 Waiting                                                  9.3s
   ⠹ c0e62f172284 Waiting                                                  9.3s
   ⠹ ebcdc659c5bf Waiting                                                  9.3s
   ⠹ 29be22cb3acc Waiting                                                  9.3s
   ⠹ f63c47038e66 Waiting                                                  9.3s
   ⠹ 77a0c198cde5 Waiting                                                  9.3s
   ⠹ c8752d5b785c Waiting                                                  9.3s
```
@z

@x
`docker compose pull` tries to pull image for services with a build section. If pull fails, it lets you know this service image must be built. You can skip this by setting `--ignore-buildable` flag.
@y
`docker compose pull` tries to pull image for services with a build section. If pull fails, it lets you know this service image must be built. You can skip this by setting `--ignore-buildable` flag.
@z
