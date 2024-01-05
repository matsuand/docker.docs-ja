%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# The Compose application model
@y
# The Compose application model
@z

@x
The Compose Specification lets you define a platform-agnostic container based application. Such an application is designed as a set of containers which have to both run together with adequate shared resources and communication channels.
@y
The Compose Specification lets you define a platform-agnostic container based application. Such an application is designed as a set of containers which have to both run together with adequate shared resources and communication channels.
@z

@x
Computing components of an application are defined as [services](05-services.md). A service is an abstract concept implemented on platforms by running the same container image, and configuration, one or more times.
@y
Computing components of an application are defined as [services](05-services.md). A service is an abstract concept implemented on platforms by running the same container image, and configuration, one or more times.
@z

@x
Services communicate with each other through [networks](06-networks.md). In the Compose Specification, a network is a platform capability abstraction to establish an IP route between containers within services connected together. Low-level, platform-specific networking options are grouped into the Network definition and may be partially implemented on some platforms.
@y
Services communicate with each other through [networks](06-networks.md). In the Compose Specification, a network is a platform capability abstraction to establish an IP route between containers within services connected together. Low-level, platform-specific networking options are grouped into the Network definition and may be partially implemented on some platforms.
@z

@x
Services store and share persistent data into [volumes](07-volumes.md). The Specification describes such a persistent data as a high-level filesystem mount with global options. Actual platform-specific implementation details are grouped into the volumes definition and may be partially implemented on some platforms.
@y
Services store and share persistent data into [volumes](07-volumes.md). The Specification describes such a persistent data as a high-level filesystem mount with global options. Actual platform-specific implementation details are grouped into the volumes definition and may be partially implemented on some platforms.
@z

@x
Some services require configuration data that is dependent on the runtime or platform. For this, the Specification defines a dedicated [configs](08-configs.md) concept. From a service container point of view, configs are comparable to volumes, in that they are files mounted into the container. But the actual definition involves distinct platform resources and services, which are abstracted by this type.
@y
Some services require configuration data that is dependent on the runtime or platform. For this, the Specification defines a dedicated [configs](08-configs.md) concept. From a service container point of view, configs are comparable to volumes, in that they are files mounted into the container. But the actual definition involves distinct platform resources and services, which are abstracted by this type.
@z

@x
A [secret](09-secrets.md) is a specific flavor of configuration data for sensitive data that should not be exposed without security considerations. Secrets are made available to services as files mounted into their containers, but the platform-specific resources to provide sensitive data are specific enough to deserve a distinct concept and definition within the Compose specification.
@y
A [secret](09-secrets.md) is a specific flavor of configuration data for sensitive data that should not be exposed without security considerations. Secrets are made available to services as files mounted into their containers, but the platform-specific resources to provide sensitive data are specific enough to deserve a distinct concept and definition within the Compose specification.
@z

@x
>**Note**
>
> With volumes, configs and secrets you can have a simple declaration at the top-level and then add more platform-specific information at the service level.
@y
>**Note**
>
> With volumes, configs and secrets you can have a simple declaration at the top-level and then add more platform-specific information at the service level.
@z

@x
A project is an individual deployment of an application specification on a platform. A project's name, set with the top-level [`name`](04-version-and-name.md) attribute, is used to group
resources together and isolate them from other applications or other installation of the same Compose specified application with distinct parameters. If you are creating resources on a platform, you must prefix resource names by project and
set the label `com.docker.compose.project`.
@y
A project is an individual deployment of an application specification on a platform. A project's name, set with the top-level [`name`](04-version-and-name.md) attribute, is used to group
resources together and isolate them from other applications or other installation of the same Compose specified application with distinct parameters. If you are creating resources on a platform, you must prefix resource names by project and
set the label `com.docker.compose.project`.
@z

@x
Compose offers a way for users to set a custom project name and override this name, so that the same `compose.yaml` file can be deployed twice on the same infrastructure, without changes, by just passing a distinct name.
@y
Compose offers a way for users to set a custom project name and override this name, so that the same `compose.yaml` file can be deployed twice on the same infrastructure, without changes, by just passing a distinct name.
@z

@x
Project names must contain only lowercase letters, decimal digits, dashes, and underscores, and must begin with a lowercase letter or decimal digit.
@y
Project names must contain only lowercase letters, decimal digits, dashes, and underscores, and must begin with a lowercase letter or decimal digit.
@z

@x
## Illustrative example
@y
## Illustrative example
@z

@x
The following example illustrates the Compose Specification concepts outlined above. The example is non-normative.
@y
The following example illustrates the Compose Specification concepts outlined above. The example is non-normative.
@z

@x
Consider an application split into a frontend web application and a backend service.
@y
Consider an application split into a frontend web application and a backend service.
@z

@x
The frontend is configured at runtime with an HTTP configuration file managed by infrastructure, providing an external domain name, and an HTTPS server certificate injected by the platform's secured secret store.
@y
The frontend is configured at runtime with an HTTP configuration file managed by infrastructure, providing an external domain name, and an HTTPS server certificate injected by the platform's secured secret store.
@z

@x
The backend stores data in a persistent volume.
@y
The backend stores data in a persistent volume.
@z

@x
Both services communicate with each other on an isolated back-tier network, while the frontend is also connected to a front-tier network and exposes port 443 for external usage.
@y
Both services communicate with each other on an isolated back-tier network, while the frontend is also connected to a front-tier network and exposes port 443 for external usage.
@z

@x
```mermaid
    %%{ init: { 'flowchart': { 'curve': 'linear' } } }%%
    flowchart LR
    subgraph A[INFRASTRUCTURE]
    direction TB
    subgraph TOP[" "]
        subgraph B1[Frontend Service]
            fs["`**webapp**`"]
        end
        style B1 fill:#ccd6e8, stroke-width:0px
        subgraph B2[Backend Service]
            bs["`**database**`"]
        end
        style B2 fill:#ccd6e8, stroke-width:0px
@y
```mermaid
    %%{ init: { 'flowchart': { 'curve': 'linear' } } }%%
    flowchart LR
    subgraph A[INFRASTRUCTURE]
    direction TB
    subgraph TOP[" "]
        subgraph B1[Frontend Service]
            fs["`**webapp**`"]
        end
        style B1 fill:#ccd6e8, stroke-width:0px
        subgraph B2[Backend Service]
            bs["`**database**`"]
        end
        style B2 fill:#ccd6e8, stroke-width:0px
@z

@x
    end
    style TOP fill:transparent, stroke-width:2px, stroke:#62affb, stroke-dasharray: 5 5
        key[ro= read only\nr+w = read write]
        style key fill:transparent, stroke-width:0px,text-align: left, size: 94px
@y
    end
    style TOP fill:transparent, stroke-width:2px, stroke:#62affb, stroke-dasharray: 5 5
        key[ro= read only\nr+w = read write]
        style key fill:transparent, stroke-width:0px,text-align: left, size: 94px
@z

@x
        direction TB
        id2(Server\nCertificate)
        id1(HTTP\nConfiguration)
        id1 & id2 -.-|ro| B1
        style id1 stroke:#000,stroke-width:1px,stroke-dasharray: 10
        style id2 stroke:#000,stroke-width:1px,stroke-dasharray: 10
        B2 ==r+w==> id3[(Persistent\nVolume)]
    end
    style A fill:#eeeeee, stroke-width:0px
    direction LR
    id4[External\nUser] ---id5(((443)))--->|Frontend\nNetwork| B1
    style id4 stroke:#000,stroke-width:2px
    B1 --Backend\nNetwork--> B2
```
@y
        direction TB
        id2(Server\nCertificate)
        id1(HTTP\nConfiguration)
        id1 & id2 -.-|ro| B1
        style id1 stroke:#000,stroke-width:1px,stroke-dasharray: 10
        style id2 stroke:#000,stroke-width:1px,stroke-dasharray: 10
        B2 ==r+w==> id3[(Persistent\nVolume)]
    end
    style A fill:#eeeeee, stroke-width:0px
    direction LR
    id4[External\nUser] ---id5(((443)))--->|Frontend\nNetwork| B1
    style id4 stroke:#000,stroke-width:2px
    B1 --Backend\nNetwork--> B2
```
@z

@x
The example application is composed of the following parts:
@y
The example application is composed of the following parts:
@z

@x
- 2 services, backed by Docker images: `webapp` and `database`
- 1 secret (HTTPS certificate), injected into the frontend
- 1 configuration (HTTP), injected into the frontend
- 1 persistent volume, attached to the backend
- 2 networks
@y
- 2 services, backed by Docker images: `webapp` and `database`
- 1 secret (HTTPS certificate), injected into the frontend
- 1 configuration (HTTP), injected into the frontend
- 1 persistent volume, attached to the backend
- 2 networks
@z

@x
```yml
services:
  frontend:
    image: example/webapp
    ports:
      - "443:8043"
    networks:
      - front-tier
      - back-tier
    configs:
      - httpd-config
    secrets:
      - server-certificate
@y
```yml
services:
  frontend:
    image: example/webapp
    ports:
      - "443:8043"
    networks:
      - front-tier
      - back-tier
    configs:
      - httpd-config
    secrets:
      - server-certificate
@z

@x
  backend:
    image: example/database
    volumes:
      - db-data:/etc/data
    networks:
      - back-tier
@y
  backend:
    image: example/database
    volumes:
      - db-data:/etc/data
    networks:
      - back-tier
@z

@x
volumes:
  db-data:
    driver: flocker
    driver_opts:
      size: "10GiB"
@y
volumes:
  db-data:
    driver: flocker
    driver_opts:
      size: "10GiB"
@z

@x
configs:
  httpd-config:
    external: true
@y
configs:
  httpd-config:
    external: true
@z

@x
secrets:
  server-certificate:
    external: true
@y
secrets:
  server-certificate:
    external: true
@z

@x
networks:
  # The presence of these objects is sufficient to define them
  front-tier: {}
  back-tier: {}
```
@y
networks:
  # The presence of these objects is sufficient to define them
  front-tier: {}
  back-tier: {}
```
@z

@x
This example illustrates the distinction between volumes, configs and secrets. While all of them are all exposed
to service containers as mounted files or directories, only a volume can be configured for read+write access.
Secrets and configs are read-only. The volume configuration allows you to select a volume driver and pass driver options
to tweak volume management according to the actual infrastructure. Configs and secrets rely on platform services,
and are declared `external` as they are not managed as part of the application lifecycle. Compose uses a platform-specific lookup mechanism to retrieve runtime values.
@y
This example illustrates the distinction between volumes, configs and secrets. While all of them are all exposed
to service containers as mounted files or directories, only a volume can be configured for read+write access.
Secrets and configs are read-only. The volume configuration allows you to select a volume driver and pass driver options
to tweak volume management according to the actual infrastructure. Configs and secrets rely on platform services,
and are declared `external` as they are not managed as part of the application lifecycle. Compose uses a platform-specific lookup mechanism to retrieve runtime values.
@z
