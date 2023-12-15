%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
It is possible to re-use configuration fragments using extension fields. Those
special fields can be of any format as long as they are located at the root of
your Compose file and their name start with the `x-` character sequence.
@y
It is possible to re-use configuration fragments using extension fields. Those
special fields can be of any format as long as they are located at the root of
your Compose file and their name start with the `x-` character sequence.
@z

@x
> **Note**
>
> Starting with the 3.7 format (for the 3.x series) and 2.4 format
> (for the 2.x series), extension fields are also allowed at the root
> of service, volume, network, config and secret definitions.
@y
> **Note**
>
> Starting with the 3.7 format (for the 3.x series) and 2.4 format
> (for the 2.x series), extension fields are also allowed at the root
> of service, volume, network, config and secret definitions.
@z

@x
```yaml
version: "{{% param "compose_file_v3" %}}"
x-custom:
  items:
    - a
    - b
  options:
    max-size: '12m'
  name: "custom"
```
@y
```yaml
version: "{{% param "compose_file_v3" %}}"
x-custom:
  items:
    - a
    - b
  options:
    max-size: '12m'
  name: "custom"
```
@z

@x
The contents of those fields are ignored by Compose, but they can be
inserted in your resource definitions using [YAML anchors](https://yaml.org/spec/1.2/spec.html#id2765878).
For example, if you want several of your services to use the same logging
configuration:
@y
The contents of those fields are ignored by Compose, but they can be
inserted in your resource definitions using [YAML anchors](https://yaml.org/spec/1.2/spec.html#id2765878).
For example, if you want several of your services to use the same logging
configuration:
@z

@x
```yaml
logging:
  options:
    max-size: '12m'
    max-file: '5'
  driver: json-file
```
@y
```yaml
logging:
  options:
    max-size: '12m'
    max-file: '5'
  driver: json-file
```
@z

@x
You may write your Compose file as follows:
@y
You may write your Compose file as follows:
@z

@x
```yaml
version: "{{% param "compose_file_v3" %}}"
x-logging:
  &default-logging
  options:
    max-size: '12m'
    max-file: '5'
  driver: json-file
@y
```yaml
version: "{{% param "compose_file_v3" %}}"
x-logging:
  &default-logging
  options:
    max-size: '12m'
    max-file: '5'
  driver: json-file
@z

@x
services:
  web:
    image: myapp/web:latest
    logging: *default-logging
  db:
    image: mysql:latest
    logging: *default-logging
```
@y
services:
  web:
    image: myapp/web:latest
    logging: *default-logging
  db:
    image: mysql:latest
    logging: *default-logging
```
@z

@x
It is also possible to partially override values in extension fields using
the [YAML merge type](https://yaml.org/type/merge.html). For example:
@y
It is also possible to partially override values in extension fields using
the [YAML merge type](https://yaml.org/type/merge.html). For example:
@z

@x
```yaml
version: "{{% param "compose_file_v3" %}}"
x-volumes:
  &default-volume
  driver: foobar-storage
@y
```yaml
version: "{{% param "compose_file_v3" %}}"
x-volumes:
  &default-volume
  driver: foobar-storage
@z

@x
services:
  web:
    image: myapp/web:latest
    volumes: ["vol1", "vol2", "vol3"]
volumes:
  vol1: *default-volume
  vol2:
    << : *default-volume
    name: volume02
  vol3:
    << : *default-volume
    driver: default
    name: volume-local
```
@y
services:
  web:
    image: myapp/web:latest
    volumes: ["vol1", "vol2", "vol3"]
volumes:
  vol1: *default-volume
  vol2:
    << : *default-volume
    name: volume02
  vol3:
    << : *default-volume
    driver: default
    name: volume-local
```
@z
