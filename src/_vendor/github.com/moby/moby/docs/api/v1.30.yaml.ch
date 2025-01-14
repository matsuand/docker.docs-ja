%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# A Swagger 2.0 (a.k.a. OpenAPI) definition of the Engine API.
#
# This is used for generating API documentation and the types used by the
# client/server. See api/README.md for more information.
#
# Some style notes:
# - This file is used by ReDoc, which allows GitHub Flavored Markdown in
#   descriptions.
# - There is no maximum line length, for ease of editing and pretty diffs.
# - operationIds are in the format "NounVerb", with a singular noun.
@y
# A Swagger 2.0 (a.k.a. OpenAPI) definition of the Engine API.
#
# This is used for generating API documentation and the types used by the
# client/server. See api/README.md for more information.
#
# Some style notes:
# - This file is used by ReDoc, which allows GitHub Flavored Markdown in
#   descriptions.
# - There is no maximum line length, for ease of editing and pretty diffs.
# - operationIds are in the format "NounVerb", with a singular noun.
@z

@x
swagger: "2.0"
schemes:
  - "http"
  - "https"
produces:
  - "application/json"
  - "text/plain"
consumes:
  - "application/json"
  - "text/plain"
basePath: "/v1.30"
info:
  title: "Docker Engine API"
  version: "1.30"
  x-logo:
    url: "https://docs.docker.com/assets/images/logo-docker-main.png"
  description: |
    The Engine API is an HTTP API served by Docker Engine. It is the API the Docker client uses to communicate with the Engine, so everything the Docker client can do can be done with the API.
@y
swagger: "2.0"
schemes:
  - "http"
  - "https"
produces:
  - "application/json"
  - "text/plain"
consumes:
  - "application/json"
  - "text/plain"
basePath: "/v1.30"
info:
  title: "Docker Engine API"
  version: "1.30"
  x-logo:
    url: "https://docs.docker.com/assets/images/logo-docker-main.png"
  description: |
    The Engine API is an HTTP API served by Docker Engine. It is the API the Docker client uses to communicate with the Engine, so everything the Docker client can do can be done with the API.
@z

@x
    Most of the client's commands map directly to API endpoints (e.g. `docker ps` is `GET /containers/json`). The notable exception is running containers, which consists of several API calls.
@y
    Most of the client's commands map directly to API endpoints (e.g. `docker ps` is `GET /containers/json`). The notable exception is running containers, which consists of several API calls.
@z

@x
    # Errors
@y
    # Errors
@z

@x
    The API uses standard HTTP status codes to indicate the success or failure of the API call. The body of the response will be JSON in the following format:
@y
    The API uses standard HTTP status codes to indicate the success or failure of the API call. The body of the response will be JSON in the following format:
@z

@x
    ```
    {
      "message": "page not found"
    }
    ```
@y
    ```
    {
      "message": "page not found"
    }
    ```
@z

@x
    # Versioning
@y
    # Versioning
@z

@x
    The API is usually changed in each release of Docker, so API calls are versioned to ensure that clients don't break.
@y
    The API is usually changed in each release of Docker, so API calls are versioned to ensure that clients don't break.
@z

@x
    For Docker Engine 17.06, the API version is 1.30. To lock to this version, you prefix the URL with `/v1.30`. For example, calling `/info` is the same as calling `/v1.30/info`.
@y
    For Docker Engine 17.06, the API version is 1.30. To lock to this version, you prefix the URL with `/v1.30`. For example, calling `/info` is the same as calling `/v1.30/info`.
@z

@x
    Engine releases in the near future should support this version of the API, so your client will continue to work even if it is talking to a newer Engine.
@y
    Engine releases in the near future should support this version of the API, so your client will continue to work even if it is talking to a newer Engine.
@z

@x
    In previous versions of Docker, it was possible to access the API without providing a version. This behaviour is now deprecated will be removed in a future version of Docker.
@y
    In previous versions of Docker, it was possible to access the API without providing a version. This behaviour is now deprecated will be removed in a future version of Docker.
@z

@x
    The API uses an open schema model, which means server may add extra properties to responses. Likewise, the server will ignore any extra query parameters and request body properties. When you write clients, you need to ignore additional properties in responses to ensure they do not break when talking to newer Docker daemons.
@y
    The API uses an open schema model, which means server may add extra properties to responses. Likewise, the server will ignore any extra query parameters and request body properties. When you write clients, you need to ignore additional properties in responses to ensure they do not break when talking to newer Docker daemons.
@z

@x
    # Authentication
@y
    # Authentication
@z

@x
    Authentication for registries is handled client side. The client has to send authentication details to various endpoints that need to communicate with registries, such as `POST /images/(name)/push`. These are sent as `X-Registry-Auth` header as a Base64 encoded (JSON) string with the following structure:
@y
    Authentication for registries is handled client side. The client has to send authentication details to various endpoints that need to communicate with registries, such as `POST /images/(name)/push`. These are sent as `X-Registry-Auth` header as a Base64 encoded (JSON) string with the following structure:
@z

@x
    ```
    {
      "username": "string",
      "password": "string",
      "email": "string",
      "serveraddress": "string"
    }
    ```
@y
    ```
    {
      "username": "string",
      "password": "string",
      "email": "string",
      "serveraddress": "string"
    }
    ```
@z

@x
    The `serveraddress` is a domain/IP without a protocol. Throughout this structure, double quotes are required.
@y
    The `serveraddress` is a domain/IP without a protocol. Throughout this structure, double quotes are required.
@z

@x
    If you have already got an identity token from the [`/auth` endpoint](#operation/SystemAuth), you can just pass this instead of credentials:
@y
    If you have already got an identity token from the [`/auth` endpoint](#operation/SystemAuth), you can just pass this instead of credentials:
@z

@x
    ```
    {
      "identitytoken": "9cbaf023786cd7..."
    }
    ```
@y
    ```
    {
      "identitytoken": "9cbaf023786cd7..."
    }
    ```
@z

@x
# The tags on paths define the menu sections in the ReDoc documentation, so
# the usage of tags must make sense for that:
# - They should be singular, not plural.
# - There should not be too many tags, or the menu becomes unwieldy. For
#   example, it is preferable to add a path to the "System" tag instead of
#   creating a tag with a single path in it.
# - The order of tags in this list defines the order in the menu.
tags:
  # Primary objects
  - name: "Container"
    x-displayName: "Containers"
    description: |
      Create and manage containers.
  - name: "Image"
    x-displayName: "Images"
  - name: "Network"
    x-displayName: "Networks"
    description: |
      Networks are user-defined networks that containers can be attached to. See the [networking documentation](https://docs.docker.com/network/) for more information.
  - name: "Volume"
    x-displayName: "Volumes"
    description: |
      Create and manage persistent storage that can be attached to containers.
  - name: "Exec"
    x-displayName: "Exec"
    description: |
      Run new commands inside running containers. See the [command-line reference](https://docs.docker.com/engine/reference/commandline/exec/) for more information.
@y
# The tags on paths define the menu sections in the ReDoc documentation, so
# the usage of tags must make sense for that:
# - They should be singular, not plural.
# - There should not be too many tags, or the menu becomes unwieldy. For
#   example, it is preferable to add a path to the "System" tag instead of
#   creating a tag with a single path in it.
# - The order of tags in this list defines the order in the menu.
tags:
  # Primary objects
  - name: "Container"
    x-displayName: "Containers"
    description: |
      Create and manage containers.
  - name: "Image"
    x-displayName: "Images"
  - name: "Network"
    x-displayName: "Networks"
    description: |
      Networks are user-defined networks that containers can be attached to. See the [networking documentation](https://docs.docker.com/network/) for more information.
  - name: "Volume"
    x-displayName: "Volumes"
    description: |
      Create and manage persistent storage that can be attached to containers.
  - name: "Exec"
    x-displayName: "Exec"
    description: |
      Run new commands inside running containers. See the [command-line reference](https://docs.docker.com/engine/reference/commandline/exec/) for more information.
@z

@x
      To exec a command in a container, you first need to create an exec instance, then start it. These two API endpoints are wrapped up in a single command-line command, `docker exec`.
  # Swarm things
  - name: "Swarm"
    x-displayName: "Swarm"
    description: |
      Engines can be clustered together in a swarm. See [the swarm mode documentation](https://docs.docker.com/engine/swarm/) for more information.
  - name: "Node"
    x-displayName: "Nodes"
    description: |
      Nodes are instances of the Engine participating in a swarm. Swarm mode must be enabled for these endpoints to work.
  - name: "Service"
    x-displayName: "Services"
    description: |
      Services are the definitions of tasks to run on a swarm. Swarm mode must be enabled for these endpoints to work.
  - name: "Task"
    x-displayName: "Tasks"
    description: |
      A task is a container running on a swarm. It is the atomic scheduling unit of swarm. Swarm mode must be enabled for these endpoints to work.
  - name: "Secret"
    x-displayName: "Secrets"
    description: |
      Secrets are sensitive data that can be used by services. Swarm mode must be enabled for these endpoints to work.
  # System things
  - name: "Plugin"
    x-displayName: "Plugins"
  - name: "System"
    x-displayName: "System"
@y
      To exec a command in a container, you first need to create an exec instance, then start it. These two API endpoints are wrapped up in a single command-line command, `docker exec`.
  # Swarm things
  - name: "Swarm"
    x-displayName: "Swarm"
    description: |
      Engines can be clustered together in a swarm. See [the swarm mode documentation](https://docs.docker.com/engine/swarm/) for more information.
  - name: "Node"
    x-displayName: "Nodes"
    description: |
      Nodes are instances of the Engine participating in a swarm. Swarm mode must be enabled for these endpoints to work.
  - name: "Service"
    x-displayName: "Services"
    description: |
      Services are the definitions of tasks to run on a swarm. Swarm mode must be enabled for these endpoints to work.
  - name: "Task"
    x-displayName: "Tasks"
    description: |
      A task is a container running on a swarm. It is the atomic scheduling unit of swarm. Swarm mode must be enabled for these endpoints to work.
  - name: "Secret"
    x-displayName: "Secrets"
    description: |
      Secrets are sensitive data that can be used by services. Swarm mode must be enabled for these endpoints to work.
  # System things
  - name: "Plugin"
    x-displayName: "Plugins"
  - name: "System"
    x-displayName: "System"
@z

@x
definitions:
  Port:
    type: "object"
    description: "An open port on a container"
    required: [PrivatePort, Type]
    properties:
      IP:
        type: "string"
        format: "ip-address"
      PrivatePort:
        type: "integer"
        format: "uint16"
        x-nullable: false
        description: "Port on the container"
      PublicPort:
        type: "integer"
        format: "uint16"
        description: "Port exposed on the host"
      Type:
        type: "string"
        x-nullable: false
        enum: ["tcp", "udp"]
    example:
      PrivatePort: 8080
      PublicPort: 80
      Type: "tcp"
@y
definitions:
  Port:
    type: "object"
    description: "An open port on a container"
    required: [PrivatePort, Type]
    properties:
      IP:
        type: "string"
        format: "ip-address"
      PrivatePort:
        type: "integer"
        format: "uint16"
        x-nullable: false
        description: "Port on the container"
      PublicPort:
        type: "integer"
        format: "uint16"
        description: "Port exposed on the host"
      Type:
        type: "string"
        x-nullable: false
        enum: ["tcp", "udp"]
    example:
      PrivatePort: 8080
      PublicPort: 80
      Type: "tcp"
@z

@x
  MountPoint:
    type: "object"
    description: |
      MountPoint represents a mount point configuration inside the container.
      This is used for reporting the mountpoints in use by a container.
    properties:
      Type:
        description: |
          The mount type:
@y
  MountPoint:
    type: "object"
    description: |
      MountPoint represents a mount point configuration inside the container.
      This is used for reporting the mountpoints in use by a container.
    properties:
      Type:
        description: |
          The mount type:
@z

@x
          - `bind` a mount of a file or directory from the host into the container.
          - `volume` a docker volume with the given `Name`.
          - `tmpfs` a `tmpfs`.
        type: "string"
        enum:
          - "bind"
          - "volume"
          - "tmpfs"
        example: "volume"
      Name:
        description: |
          Name is the name reference to the underlying data defined by `Source`
          e.g., the volume name.
        type: "string"
        example: "myvolume"
      Source:
        description: |
          Source location of the mount.
@y
          - `bind` a mount of a file or directory from the host into the container.
          - `volume` a docker volume with the given `Name`.
          - `tmpfs` a `tmpfs`.
        type: "string"
        enum:
          - "bind"
          - "volume"
          - "tmpfs"
        example: "volume"
      Name:
        description: |
          Name is the name reference to the underlying data defined by `Source`
          e.g., the volume name.
        type: "string"
        example: "myvolume"
      Source:
        description: |
          Source location of the mount.
@z

@x
          For volumes, this contains the storage location of the volume (within
          `/var/lib/docker/volumes/`). For bind-mounts, and `npipe`, this contains
          the source (host) part of the bind-mount. For `tmpfs` mount points, this
          field is empty.
        type: "string"
        example: "/var/lib/docker/volumes/myvolume/_data"
      Destination:
        description: |
          Destination is the path relative to the container root (`/`) where
          the `Source` is mounted inside the container.
        type: "string"
        example: "/usr/share/nginx/html/"
      Driver:
        description: |
          Driver is the volume driver used to create the volume (if it is a volume).
        type: "string"
        example: "local"
      Mode:
        description: |
          Mode is a comma separated list of options supplied by the user when
          creating the bind/volume mount.
@y
          For volumes, this contains the storage location of the volume (within
          `/var/lib/docker/volumes/`). For bind-mounts, and `npipe`, this contains
          the source (host) part of the bind-mount. For `tmpfs` mount points, this
          field is empty.
        type: "string"
        example: "/var/lib/docker/volumes/myvolume/_data"
      Destination:
        description: |
          Destination is the path relative to the container root (`/`) where
          the `Source` is mounted inside the container.
        type: "string"
        example: "/usr/share/nginx/html/"
      Driver:
        description: |
          Driver is the volume driver used to create the volume (if it is a volume).
        type: "string"
        example: "local"
      Mode:
        description: |
          Mode is a comma separated list of options supplied by the user when
          creating the bind/volume mount.
@z

@x
          The default is platform-specific (`"z"` on Linux, empty on Windows).
        type: "string"
        example: "z"
      RW:
        description: |
          Whether the mount is mounted writable (read-write).
        type: "boolean"
        example: true
      Propagation:
        description: |
          Propagation describes how mounts are propagated from the host into the
          mount point, and vice-versa. Refer to the [Linux kernel documentation](https://www.kernel.org/doc/Documentation/filesystems/sharedsubtree.txt)
          for details. This field is not used on Windows.
        type: "string"
        example: ""
@y
          The default is platform-specific (`"z"` on Linux, empty on Windows).
        type: "string"
        example: "z"
      RW:
        description: |
          Whether the mount is mounted writable (read-write).
        type: "boolean"
        example: true
      Propagation:
        description: |
          Propagation describes how mounts are propagated from the host into the
          mount point, and vice-versa. Refer to the [Linux kernel documentation](https://www.kernel.org/doc/Documentation/filesystems/sharedsubtree.txt)
          for details. This field is not used on Windows.
        type: "string"
        example: ""
@z

@x
  DeviceMapping:
    type: "object"
    description: "A device mapping between the host and container"
    properties:
      PathOnHost:
        type: "string"
      PathInContainer:
        type: "string"
      CgroupPermissions:
        type: "string"
    example:
      PathOnHost: "/dev/deviceName"
      PathInContainer: "/dev/deviceName"
      CgroupPermissions: "mrw"
@y
  DeviceMapping:
    type: "object"
    description: "A device mapping between the host and container"
    properties:
      PathOnHost:
        type: "string"
      PathInContainer:
        type: "string"
      CgroupPermissions:
        type: "string"
    example:
      PathOnHost: "/dev/deviceName"
      PathInContainer: "/dev/deviceName"
      CgroupPermissions: "mrw"
@z

@x
  ThrottleDevice:
    type: "object"
    properties:
      Path:
        description: "Device path"
        type: "string"
      Rate:
        description: "Rate"
        type: "integer"
        format: "int64"
        minimum: 0
@y
  ThrottleDevice:
    type: "object"
    properties:
      Path:
        description: "Device path"
        type: "string"
      Rate:
        description: "Rate"
        type: "integer"
        format: "int64"
        minimum: 0
@z

@x
  Mount:
    type: "object"
    properties:
      Target:
        description: "Container path."
        type: "string"
      Source:
        description: "Mount source (e.g. a volume name, a host path)."
        type: "string"
      Type:
        description: |
          The mount type. Available types:
@y
  Mount:
    type: "object"
    properties:
      Target:
        description: "Container path."
        type: "string"
      Source:
        description: "Mount source (e.g. a volume name, a host path)."
        type: "string"
      Type:
        description: |
          The mount type. Available types:
@z

@x
          - `bind` Mounts a file or directory from the host into the container. Must exist prior to creating the container.
          - `volume` Creates a volume with the given name and options (or uses a pre-existing volume with the same name and options). These are **not** removed when the container is removed.
          - `tmpfs` Create a tmpfs with the given options. The mount source cannot be specified for tmpfs.
        type: "string"
        enum:
          - "bind"
          - "volume"
          - "tmpfs"
      ReadOnly:
        description: "Whether the mount should be read-only."
        type: "boolean"
      Consistency:
        description: "The consistency requirement for the mount: `default`, `consistent`, `cached`, or `delegated`."
        type: "string"
      BindOptions:
        description: "Optional configuration for the `bind` type."
        type: "object"
        properties:
          Propagation:
            description: "A propagation mode with the value `[r]private`, `[r]shared`, or `[r]slave`."
            enum:
              - "private"
              - "rprivate"
              - "shared"
              - "rshared"
              - "slave"
              - "rslave"
      VolumeOptions:
        description: "Optional configuration for the `volume` type."
        type: "object"
        properties:
          NoCopy:
            description: "Populate volume with data from the target."
            type: "boolean"
            default: false
          Labels:
            description: "User-defined key/value metadata."
            type: "object"
            additionalProperties:
              type: "string"
          DriverConfig:
            description: "Map of driver specific options"
            type: "object"
            properties:
              Name:
                description: "Name of the driver to use to create the volume."
                type: "string"
              Options:
                description: "key/value map of driver specific options."
                type: "object"
                additionalProperties:
                  type: "string"
      TmpfsOptions:
        description: "Optional configuration for the `tmpfs` type."
        type: "object"
        properties:
          SizeBytes:
            description: "The size for the tmpfs mount in bytes."
            type: "integer"
            format: "int64"
          Mode:
            description: "The permission mode for the tmpfs mount in an integer."
            type: "integer"
  RestartPolicy:
    description: |
      The behavior to apply when the container exits. The default is not to restart.
@y
          - `bind` Mounts a file or directory from the host into the container. Must exist prior to creating the container.
          - `volume` Creates a volume with the given name and options (or uses a pre-existing volume with the same name and options). These are **not** removed when the container is removed.
          - `tmpfs` Create a tmpfs with the given options. The mount source cannot be specified for tmpfs.
        type: "string"
        enum:
          - "bind"
          - "volume"
          - "tmpfs"
      ReadOnly:
        description: "Whether the mount should be read-only."
        type: "boolean"
      Consistency:
        description: "The consistency requirement for the mount: `default`, `consistent`, `cached`, or `delegated`."
        type: "string"
      BindOptions:
        description: "Optional configuration for the `bind` type."
        type: "object"
        properties:
          Propagation:
            description: "A propagation mode with the value `[r]private`, `[r]shared`, or `[r]slave`."
            enum:
              - "private"
              - "rprivate"
              - "shared"
              - "rshared"
              - "slave"
              - "rslave"
      VolumeOptions:
        description: "Optional configuration for the `volume` type."
        type: "object"
        properties:
          NoCopy:
            description: "Populate volume with data from the target."
            type: "boolean"
            default: false
          Labels:
            description: "User-defined key/value metadata."
            type: "object"
            additionalProperties:
              type: "string"
          DriverConfig:
            description: "Map of driver specific options"
            type: "object"
            properties:
              Name:
                description: "Name of the driver to use to create the volume."
                type: "string"
              Options:
                description: "key/value map of driver specific options."
                type: "object"
                additionalProperties:
                  type: "string"
      TmpfsOptions:
        description: "Optional configuration for the `tmpfs` type."
        type: "object"
        properties:
          SizeBytes:
            description: "The size for the tmpfs mount in bytes."
            type: "integer"
            format: "int64"
          Mode:
            description: "The permission mode for the tmpfs mount in an integer."
            type: "integer"
  RestartPolicy:
    description: |
      The behavior to apply when the container exits. The default is not to restart.
@z

@x
      An ever increasing delay (double the previous delay, starting at 100ms) is added before each restart to prevent flooding the server.
    type: "object"
    properties:
      Name:
        type: "string"
        description: |
          - Empty string means not to restart
          - `always` Always restart
          - `unless-stopped` Restart always except when the user has manually stopped the container
          - `on-failure` Restart only when the container exit code is non-zero
        enum:
          - ""
          - "always"
          - "unless-stopped"
          - "on-failure"
      MaximumRetryCount:
        type: "integer"
        description: "If `on-failure` is used, the number of times to retry before giving up"
@y
      An ever increasing delay (double the previous delay, starting at 100ms) is added before each restart to prevent flooding the server.
    type: "object"
    properties:
      Name:
        type: "string"
        description: |
          - Empty string means not to restart
          - `always` Always restart
          - `unless-stopped` Restart always except when the user has manually stopped the container
          - `on-failure` Restart only when the container exit code is non-zero
        enum:
          - ""
          - "always"
          - "unless-stopped"
          - "on-failure"
      MaximumRetryCount:
        type: "integer"
        description: "If `on-failure` is used, the number of times to retry before giving up"
@z

@x
  Resources:
    description: "A container's resources (cgroups config, ulimits, etc)"
    type: "object"
    properties:
      # Applicable to all platforms
      CpuShares:
        description: "An integer value representing this container's relative CPU weight versus other containers."
        type: "integer"
      Memory:
        description: "Memory limit in bytes."
        type: "integer"
        default: 0
      # Applicable to UNIX platforms
      CgroupParent:
        description: "Path to `cgroups` under which the container's `cgroup` is created. If the path is not absolute, the path is considered to be relative to the `cgroups` path of the init process. Cgroups are created if they do not already exist."
        type: "string"
      BlkioWeight:
        description: "Block IO weight (relative weight)."
        type: "integer"
        minimum: 0
        maximum: 1000
      BlkioWeightDevice:
        description: |
          Block IO weight (relative device weight) in the form `[{"Path": "device_path", "Weight": weight}]`.
        type: "array"
        items:
          type: "object"
          properties:
            Path:
              type: "string"
            Weight:
              type: "integer"
              minimum: 0
      BlkioDeviceReadBps:
        description: |
          Limit read rate (bytes per second) from a device, in the form `[{"Path": "device_path", "Rate": rate}]`.
        type: "array"
        items:
          $ref: "#/definitions/ThrottleDevice"
      BlkioDeviceWriteBps:
        description: |
          Limit write rate (bytes per second) to a device, in the form `[{"Path": "device_path", "Rate": rate}]`.
        type: "array"
        items:
          $ref: "#/definitions/ThrottleDevice"
      BlkioDeviceReadIOps:
        description: |
          Limit read rate (IO per second) from a device, in the form `[{"Path": "device_path", "Rate": rate}]`.
        type: "array"
        items:
          $ref: "#/definitions/ThrottleDevice"
      BlkioDeviceWriteIOps:
        description: |
          Limit write rate (IO per second) to a device, in the form `[{"Path": "device_path", "Rate": rate}]`.
        type: "array"
        items:
          $ref: "#/definitions/ThrottleDevice"
      CpuPeriod:
        description: "The length of a CPU period in microseconds."
        type: "integer"
        format: "int64"
      CpuQuota:
        description: "Microseconds of CPU time that the container can get in a CPU period."
        type: "integer"
        format: "int64"
      CpuRealtimePeriod:
        description: "The length of a CPU real-time period in microseconds. Set to 0 to allocate no time allocated to real-time tasks."
        type: "integer"
        format: "int64"
      CpuRealtimeRuntime:
        description: "The length of a CPU real-time runtime in microseconds. Set to 0 to allocate no time allocated to real-time tasks."
        type: "integer"
        format: "int64"
      CpusetCpus:
        description: "CPUs in which to allow execution (e.g., `0-3`, `0,1`)"
        type: "string"
      CpusetMems:
        description: "Memory nodes (MEMs) in which to allow execution (0-3, 0,1). Only effective on NUMA systems."
        type: "string"
      Devices:
        description: "A list of devices to add to the container."
        type: "array"
        items:
          $ref: "#/definitions/DeviceMapping"
      DeviceCgroupRules:
        description: "a list of cgroup rules to apply to the container"
        type: "array"
        items:
          type: "string"
          example: "c 13:* rwm"
      DiskQuota:
        description: "Disk limit (in bytes)."
        type: "integer"
        format: "int64"
      KernelMemory:
        description: "Kernel memory limit in bytes."
        type: "integer"
        format: "int64"
      MemoryReservation:
        description: "Memory soft limit in bytes."
        type: "integer"
        format: "int64"
      MemorySwap:
        description: "Total memory limit (memory + swap). Set as `-1` to enable unlimited swap."
        type: "integer"
        format: "int64"
      MemorySwappiness:
        description: "Tune a container's memory swappiness behavior. Accepts an integer between 0 and 100."
        type: "integer"
        format: "int64"
        minimum: 0
        maximum: 100
      NanoCpus:
        description: "CPU quota in units of 10<sup>-9</sup> CPUs."
        type: "integer"
        format: "int64"
      OomKillDisable:
        description: "Disable OOM Killer for the container."
        type: "boolean"
      PidsLimit:
        description: "Tune a container's pids limit. Set -1 for unlimited."
        type: "integer"
        format: "int64"
      Ulimits:
        description: |
          A list of resource limits to set in the container. For example: `{"Name": "nofile", "Soft": 1024, "Hard": 2048}`"
        type: "array"
        items:
          type: "object"
          properties:
            Name:
              description: "Name of ulimit"
              type: "string"
            Soft:
              description: "Soft limit"
              type: "integer"
            Hard:
              description: "Hard limit"
              type: "integer"
      # Applicable to Windows
      CpuCount:
        description: |
          The number of usable CPUs (Windows only).
@y
  Resources:
    description: "A container's resources (cgroups config, ulimits, etc)"
    type: "object"
    properties:
      # Applicable to all platforms
      CpuShares:
        description: "An integer value representing this container's relative CPU weight versus other containers."
        type: "integer"
      Memory:
        description: "Memory limit in bytes."
        type: "integer"
        default: 0
      # Applicable to UNIX platforms
      CgroupParent:
        description: "Path to `cgroups` under which the container's `cgroup` is created. If the path is not absolute, the path is considered to be relative to the `cgroups` path of the init process. Cgroups are created if they do not already exist."
        type: "string"
      BlkioWeight:
        description: "Block IO weight (relative weight)."
        type: "integer"
        minimum: 0
        maximum: 1000
      BlkioWeightDevice:
        description: |
          Block IO weight (relative device weight) in the form `[{"Path": "device_path", "Weight": weight}]`.
        type: "array"
        items:
          type: "object"
          properties:
            Path:
              type: "string"
            Weight:
              type: "integer"
              minimum: 0
      BlkioDeviceReadBps:
        description: |
          Limit read rate (bytes per second) from a device, in the form `[{"Path": "device_path", "Rate": rate}]`.
        type: "array"
        items:
          $ref: "#/definitions/ThrottleDevice"
      BlkioDeviceWriteBps:
        description: |
          Limit write rate (bytes per second) to a device, in the form `[{"Path": "device_path", "Rate": rate}]`.
        type: "array"
        items:
          $ref: "#/definitions/ThrottleDevice"
      BlkioDeviceReadIOps:
        description: |
          Limit read rate (IO per second) from a device, in the form `[{"Path": "device_path", "Rate": rate}]`.
        type: "array"
        items:
          $ref: "#/definitions/ThrottleDevice"
      BlkioDeviceWriteIOps:
        description: |
          Limit write rate (IO per second) to a device, in the form `[{"Path": "device_path", "Rate": rate}]`.
        type: "array"
        items:
          $ref: "#/definitions/ThrottleDevice"
      CpuPeriod:
        description: "The length of a CPU period in microseconds."
        type: "integer"
        format: "int64"
      CpuQuota:
        description: "Microseconds of CPU time that the container can get in a CPU period."
        type: "integer"
        format: "int64"
      CpuRealtimePeriod:
        description: "The length of a CPU real-time period in microseconds. Set to 0 to allocate no time allocated to real-time tasks."
        type: "integer"
        format: "int64"
      CpuRealtimeRuntime:
        description: "The length of a CPU real-time runtime in microseconds. Set to 0 to allocate no time allocated to real-time tasks."
        type: "integer"
        format: "int64"
      CpusetCpus:
        description: "CPUs in which to allow execution (e.g., `0-3`, `0,1`)"
        type: "string"
      CpusetMems:
        description: "Memory nodes (MEMs) in which to allow execution (0-3, 0,1). Only effective on NUMA systems."
        type: "string"
      Devices:
        description: "A list of devices to add to the container."
        type: "array"
        items:
          $ref: "#/definitions/DeviceMapping"
      DeviceCgroupRules:
        description: "a list of cgroup rules to apply to the container"
        type: "array"
        items:
          type: "string"
          example: "c 13:* rwm"
      DiskQuota:
        description: "Disk limit (in bytes)."
        type: "integer"
        format: "int64"
      KernelMemory:
        description: "Kernel memory limit in bytes."
        type: "integer"
        format: "int64"
      MemoryReservation:
        description: "Memory soft limit in bytes."
        type: "integer"
        format: "int64"
      MemorySwap:
        description: "Total memory limit (memory + swap). Set as `-1` to enable unlimited swap."
        type: "integer"
        format: "int64"
      MemorySwappiness:
        description: "Tune a container's memory swappiness behavior. Accepts an integer between 0 and 100."
        type: "integer"
        format: "int64"
        minimum: 0
        maximum: 100
      NanoCpus:
        description: "CPU quota in units of 10<sup>-9</sup> CPUs."
        type: "integer"
        format: "int64"
      OomKillDisable:
        description: "Disable OOM Killer for the container."
        type: "boolean"
      PidsLimit:
        description: "Tune a container's pids limit. Set -1 for unlimited."
        type: "integer"
        format: "int64"
      Ulimits:
        description: |
          A list of resource limits to set in the container. For example: `{"Name": "nofile", "Soft": 1024, "Hard": 2048}`"
        type: "array"
        items:
          type: "object"
          properties:
            Name:
              description: "Name of ulimit"
              type: "string"
            Soft:
              description: "Soft limit"
              type: "integer"
            Hard:
              description: "Hard limit"
              type: "integer"
      # Applicable to Windows
      CpuCount:
        description: |
          The number of usable CPUs (Windows only).
@z

@x
          On Windows Server containers, the processor resource controls are mutually exclusive. The order of precedence is `CPUCount` first, then `CPUShares`, and `CPUPercent` last.
        type: "integer"
        format: "int64"
      CpuPercent:
        description: |
          The usable percentage of the available CPUs (Windows only).
@y
          On Windows Server containers, the processor resource controls are mutually exclusive. The order of precedence is `CPUCount` first, then `CPUShares`, and `CPUPercent` last.
        type: "integer"
        format: "int64"
      CpuPercent:
        description: |
          The usable percentage of the available CPUs (Windows only).
@z

@x
          On Windows Server containers, the processor resource controls are mutually exclusive. The order of precedence is `CPUCount` first, then `CPUShares`, and `CPUPercent` last.
        type: "integer"
        format: "int64"
      IOMaximumIOps:
        description: "Maximum IOps for the container system drive (Windows only)"
        type: "integer"
        format: "int64"
      IOMaximumBandwidth:
        description: "Maximum IO in bytes per second for the container system drive (Windows only)"
        type: "integer"
        format: "int64"
@y
          On Windows Server containers, the processor resource controls are mutually exclusive. The order of precedence is `CPUCount` first, then `CPUShares`, and `CPUPercent` last.
        type: "integer"
        format: "int64"
      IOMaximumIOps:
        description: "Maximum IOps for the container system drive (Windows only)"
        type: "integer"
        format: "int64"
      IOMaximumBandwidth:
        description: "Maximum IO in bytes per second for the container system drive (Windows only)"
        type: "integer"
        format: "int64"
@z

@x
  HealthConfig:
    description: "A test to perform to check that the container is healthy."
    type: "object"
    properties:
      Test:
        description: |
          The test to perform. Possible values are:
@y
  HealthConfig:
    description: "A test to perform to check that the container is healthy."
    type: "object"
    properties:
      Test:
        description: |
          The test to perform. Possible values are:
@z

@x
          - `[]` inherit healthcheck from image or parent image
          - `["NONE"]` disable healthcheck
          - `["CMD", args...]` exec arguments directly
          - `["CMD-SHELL", command]` run command with system's default shell
        type: "array"
        items:
          type: "string"
      Interval:
        description: "The time to wait between checks in nanoseconds. It should be 0 or at least 1000000 (1 ms). 0 means inherit."
        type: "integer"
      Timeout:
        description: "The time to wait before considering the check to have hung. It should be 0 or at least 1000000 (1 ms). 0 means inherit."
        type: "integer"
      Retries:
        description: "The number of consecutive failures needed to consider a container as unhealthy. 0 means inherit."
        type: "integer"
      StartPeriod:
        description: "Start period for the container to initialize before starting health-retries countdown in nanoseconds. It should be 0 or at least 1000000 (1 ms). 0 means inherit."
        type: "integer"
@y
          - `[]` inherit healthcheck from image or parent image
          - `["NONE"]` disable healthcheck
          - `["CMD", args...]` exec arguments directly
          - `["CMD-SHELL", command]` run command with system's default shell
        type: "array"
        items:
          type: "string"
      Interval:
        description: "The time to wait between checks in nanoseconds. It should be 0 or at least 1000000 (1 ms). 0 means inherit."
        type: "integer"
      Timeout:
        description: "The time to wait before considering the check to have hung. It should be 0 or at least 1000000 (1 ms). 0 means inherit."
        type: "integer"
      Retries:
        description: "The number of consecutive failures needed to consider a container as unhealthy. 0 means inherit."
        type: "integer"
      StartPeriod:
        description: "Start period for the container to initialize before starting health-retries countdown in nanoseconds. It should be 0 or at least 1000000 (1 ms). 0 means inherit."
        type: "integer"
@z

@x
  HostConfig:
    description: "Container configuration that depends on the host we are running on"
    allOf:
      - $ref: "#/definitions/Resources"
      - type: "object"
        properties:
          # Applicable to all platforms
          Binds:
            type: "array"
            description: |
              A list of volume bindings for this container. Each volume binding is a string in one of these forms:
@y
  HostConfig:
    description: "Container configuration that depends on the host we are running on"
    allOf:
      - $ref: "#/definitions/Resources"
      - type: "object"
        properties:
          # Applicable to all platforms
          Binds:
            type: "array"
            description: |
              A list of volume bindings for this container. Each volume binding is a string in one of these forms:
@z

@x
              - `host-src:container-dest` to bind-mount a host path into the container. Both `host-src`, and `container-dest` must be an _absolute_ path.
              - `host-src:container-dest:ro` to make the bind-mount read-only inside the container. Both `host-src`, and `container-dest` must be an _absolute_ path.
              - `volume-name:container-dest` to bind-mount a volume managed by a volume driver into the container. `container-dest` must be an _absolute_ path.
              - `volume-name:container-dest:ro` to mount the volume read-only inside the container.  `container-dest` must be an _absolute_ path.
            items:
              type: "string"
          ContainerIDFile:
            type: "string"
            description: "Path to a file where the container ID is written"
          LogConfig:
            type: "object"
            description: "The logging configuration for this container"
            properties:
              Type:
                type: "string"
                enum:
                  - "json-file"
                  - "syslog"
                  - "journald"
                  - "gelf"
                  - "fluentd"
                  - "awslogs"
                  - "splunk"
                  - "etwlogs"
                  - "none"
              Config:
                type: "object"
                additionalProperties:
                  type: "string"
          NetworkMode:
            type: "string"
            description: "Network mode to use for this container. Supported standard values are: `bridge`, `host`, `none`, and `container:<name|id>`. Any other value is taken
              as a custom network's name to which this container should connect to."
          PortBindings:
            type: "object"
            description: "A map of exposed container ports and the host port they should map to."
            additionalProperties:
              type: "object"
              properties:
                HostIp:
                  type: "string"
                  description: "The host IP address"
                HostPort:
                  type: "string"
                  description: "The host port number, as a string"
          RestartPolicy:
            $ref: "#/definitions/RestartPolicy"
          AutoRemove:
            type: "boolean"
            description: "Automatically remove the container when the container's process exits. This has no effect if `RestartPolicy` is set."
          VolumeDriver:
            type: "string"
            description: "Driver that this container uses to mount volumes."
          VolumesFrom:
            type: "array"
            description: "A list of volumes to inherit from another container, specified in the form `<container name>[:<ro|rw>]`."
            items:
              type: "string"
          Mounts:
            description: "Specification for mounts to be added to the container."
            type: "array"
            items:
              $ref: "#/definitions/Mount"
@y
              - `host-src:container-dest` to bind-mount a host path into the container. Both `host-src`, and `container-dest` must be an _absolute_ path.
              - `host-src:container-dest:ro` to make the bind-mount read-only inside the container. Both `host-src`, and `container-dest` must be an _absolute_ path.
              - `volume-name:container-dest` to bind-mount a volume managed by a volume driver into the container. `container-dest` must be an _absolute_ path.
              - `volume-name:container-dest:ro` to mount the volume read-only inside the container.  `container-dest` must be an _absolute_ path.
            items:
              type: "string"
          ContainerIDFile:
            type: "string"
            description: "Path to a file where the container ID is written"
          LogConfig:
            type: "object"
            description: "The logging configuration for this container"
            properties:
              Type:
                type: "string"
                enum:
                  - "json-file"
                  - "syslog"
                  - "journald"
                  - "gelf"
                  - "fluentd"
                  - "awslogs"
                  - "splunk"
                  - "etwlogs"
                  - "none"
              Config:
                type: "object"
                additionalProperties:
                  type: "string"
          NetworkMode:
            type: "string"
            description: "Network mode to use for this container. Supported standard values are: `bridge`, `host`, `none`, and `container:<name|id>`. Any other value is taken
              as a custom network's name to which this container should connect to."
          PortBindings:
            type: "object"
            description: "A map of exposed container ports and the host port they should map to."
            additionalProperties:
              type: "object"
              properties:
                HostIp:
                  type: "string"
                  description: "The host IP address"
                HostPort:
                  type: "string"
                  description: "The host port number, as a string"
          RestartPolicy:
            $ref: "#/definitions/RestartPolicy"
          AutoRemove:
            type: "boolean"
            description: "Automatically remove the container when the container's process exits. This has no effect if `RestartPolicy` is set."
          VolumeDriver:
            type: "string"
            description: "Driver that this container uses to mount volumes."
          VolumesFrom:
            type: "array"
            description: "A list of volumes to inherit from another container, specified in the form `<container name>[:<ro|rw>]`."
            items:
              type: "string"
          Mounts:
            description: "Specification for mounts to be added to the container."
            type: "array"
            items:
              $ref: "#/definitions/Mount"
@z

@x
          # Applicable to UNIX platforms
          CapAdd:
            type: "array"
            description: "A list of kernel capabilities to add to the container."
            items:
              type: "string"
          CapDrop:
            type: "array"
            description: "A list of kernel capabilities to drop from the container."
            items:
              type: "string"
          Dns:
            type: "array"
            description: "A list of DNS servers for the container to use."
            items:
              type: "string"
          DnsOptions:
            type: "array"
            description: "A list of DNS options."
            items:
              type: "string"
          DnsSearch:
            type: "array"
            description: "A list of DNS search domains."
            items:
              type: "string"
          ExtraHosts:
            type: "array"
            description: |
              A list of hostnames/IP mappings to add to the container's `/etc/hosts` file. Specified in the form `["hostname:IP"]`.
            items:
              type: "string"
          GroupAdd:
            type: "array"
            description: "A list of additional groups that the container process will run as."
            items:
              type: "string"
          IpcMode:
            type: "string"
            description: "IPC namespace to use for the container."
          Cgroup:
            type: "string"
            description: "Cgroup to use for the container."
          Links:
            type: "array"
            description: "A list of links for the container in the form `container_name:alias`."
            items:
              type: "string"
          OomScoreAdj:
            type: "integer"
            description: "An integer value containing the score given to the container in order to tune OOM killer preferences."
          PidMode:
            type: "string"
            description: |
              Set the PID (Process) Namespace mode for the container. It can be either:
@y
          # Applicable to UNIX platforms
          CapAdd:
            type: "array"
            description: "A list of kernel capabilities to add to the container."
            items:
              type: "string"
          CapDrop:
            type: "array"
            description: "A list of kernel capabilities to drop from the container."
            items:
              type: "string"
          Dns:
            type: "array"
            description: "A list of DNS servers for the container to use."
            items:
              type: "string"
          DnsOptions:
            type: "array"
            description: "A list of DNS options."
            items:
              type: "string"
          DnsSearch:
            type: "array"
            description: "A list of DNS search domains."
            items:
              type: "string"
          ExtraHosts:
            type: "array"
            description: |
              A list of hostnames/IP mappings to add to the container's `/etc/hosts` file. Specified in the form `["hostname:IP"]`.
            items:
              type: "string"
          GroupAdd:
            type: "array"
            description: "A list of additional groups that the container process will run as."
            items:
              type: "string"
          IpcMode:
            type: "string"
            description: "IPC namespace to use for the container."
          Cgroup:
            type: "string"
            description: "Cgroup to use for the container."
          Links:
            type: "array"
            description: "A list of links for the container in the form `container_name:alias`."
            items:
              type: "string"
          OomScoreAdj:
            type: "integer"
            description: "An integer value containing the score given to the container in order to tune OOM killer preferences."
          PidMode:
            type: "string"
            description: |
              Set the PID (Process) Namespace mode for the container. It can be either:
@z

@x
              - `"container:<name|id>"`: joins another container's PID namespace
              - `"host"`: use the host's PID namespace inside the container
          Privileged:
            type: "boolean"
            description: "Gives the container full access to the host."
          PublishAllPorts:
            type: "boolean"
            description: "Allocates a random host port for all of a container's exposed ports."
          ReadonlyRootfs:
            type: "boolean"
            description: "Mount the container's root filesystem as read only."
          SecurityOpt:
            type: "array"
            description: "A list of string values to customize labels for MLS
            systems, such as SELinux."
            items:
              type: "string"
          StorageOpt:
            type: "object"
            description: |
              Storage driver options for this container, in the form `{"size": "120G"}`.
            additionalProperties:
              type: "string"
          Tmpfs:
            type: "object"
            description: |
              A map of container directories which should be replaced by tmpfs mounts, and their corresponding mount options. For example: `{ "/run": "rw,noexec,nosuid,size=65536k" }`.
            additionalProperties:
              type: "string"
          UTSMode:
            type: "string"
            description: "UTS namespace to use for the container."
          UsernsMode:
            type: "string"
            description: "Sets the usernamespace mode for the container when usernamespace remapping option is enabled."
          ShmSize:
            type: "integer"
            description: "Size of `/dev/shm` in bytes. If omitted, the system uses 64MB."
            minimum: 0
          Sysctls:
            type: "object"
            description: |
              A list of kernel parameters (sysctls) to set in the container. For example: `{"net.ipv4.ip_forward": "1"}`
            additionalProperties:
              type: "string"
          Runtime:
            type: "string"
            description: "Runtime to use with this container."
          # Applicable to Windows
          ConsoleSize:
            type: "array"
            description: "Initial console size, as an `[height, width]` array. (Windows only)"
            minItems: 2
            maxItems: 2
            items:
              type: "integer"
              minimum: 0
          Isolation:
            type: "string"
            description: "Isolation technology of the container. (Windows only)"
            enum:
              - "default"
              - "process"
              - "hyperv"
              - ""
@y
              - `"container:<name|id>"`: joins another container's PID namespace
              - `"host"`: use the host's PID namespace inside the container
          Privileged:
            type: "boolean"
            description: "Gives the container full access to the host."
          PublishAllPorts:
            type: "boolean"
            description: "Allocates a random host port for all of a container's exposed ports."
          ReadonlyRootfs:
            type: "boolean"
            description: "Mount the container's root filesystem as read only."
          SecurityOpt:
            type: "array"
            description: "A list of string values to customize labels for MLS
            systems, such as SELinux."
            items:
              type: "string"
          StorageOpt:
            type: "object"
            description: |
              Storage driver options for this container, in the form `{"size": "120G"}`.
            additionalProperties:
              type: "string"
          Tmpfs:
            type: "object"
            description: |
              A map of container directories which should be replaced by tmpfs mounts, and their corresponding mount options. For example: `{ "/run": "rw,noexec,nosuid,size=65536k" }`.
            additionalProperties:
              type: "string"
          UTSMode:
            type: "string"
            description: "UTS namespace to use for the container."
          UsernsMode:
            type: "string"
            description: "Sets the usernamespace mode for the container when usernamespace remapping option is enabled."
          ShmSize:
            type: "integer"
            description: "Size of `/dev/shm` in bytes. If omitted, the system uses 64MB."
            minimum: 0
          Sysctls:
            type: "object"
            description: |
              A list of kernel parameters (sysctls) to set in the container. For example: `{"net.ipv4.ip_forward": "1"}`
            additionalProperties:
              type: "string"
          Runtime:
            type: "string"
            description: "Runtime to use with this container."
          # Applicable to Windows
          ConsoleSize:
            type: "array"
            description: "Initial console size, as an `[height, width]` array. (Windows only)"
            minItems: 2
            maxItems: 2
            items:
              type: "integer"
              minimum: 0
          Isolation:
            type: "string"
            description: "Isolation technology of the container. (Windows only)"
            enum:
              - "default"
              - "process"
              - "hyperv"
              - ""
@z

@x
  ContainerConfig:
    description: |
      Configuration for a container that is portable between hosts.
@y
  ContainerConfig:
    description: |
      Configuration for a container that is portable between hosts.
@z

@x
      When used as `ContainerConfig` field in an image, `ContainerConfig` is an
      optional field containing the configuration of the container that was last
      committed when creating the image.
@y
      When used as `ContainerConfig` field in an image, `ContainerConfig` is an
      optional field containing the configuration of the container that was last
      committed when creating the image.
@z

@x
      Previous versions of Docker builder used this field to store build cache,
      and it is not in active use anymore.
    type: "object"
    properties:
      Hostname:
        description: "The hostname to use for the container, as a valid RFC 1123 hostname."
        type: "string"
      Domainname:
        description: "The domain name to use for the container."
        type: "string"
      User:
        description: "The user that commands are run as inside the container."
        type: "string"
      AttachStdin:
        description: "Whether to attach to `stdin`."
        type: "boolean"
        default: false
      AttachStdout:
        description: "Whether to attach to `stdout`."
        type: "boolean"
        default: true
      AttachStderr:
        description: "Whether to attach to `stderr`."
        type: "boolean"
        default: true
      ExposedPorts:
        description: |
          An object mapping ports to an empty object in the form:
@y
      Previous versions of Docker builder used this field to store build cache,
      and it is not in active use anymore.
    type: "object"
    properties:
      Hostname:
        description: "The hostname to use for the container, as a valid RFC 1123 hostname."
        type: "string"
      Domainname:
        description: "The domain name to use for the container."
        type: "string"
      User:
        description: "The user that commands are run as inside the container."
        type: "string"
      AttachStdin:
        description: "Whether to attach to `stdin`."
        type: "boolean"
        default: false
      AttachStdout:
        description: "Whether to attach to `stdout`."
        type: "boolean"
        default: true
      AttachStderr:
        description: "Whether to attach to `stderr`."
        type: "boolean"
        default: true
      ExposedPorts:
        description: |
          An object mapping ports to an empty object in the form:
@z

@x
          `{"<port>/<tcp|udp>": {}}`
        type: "object"
        additionalProperties:
          type: "object"
          enum:
            - {}
          default: {}
      Tty:
        description: "Attach standard streams to a TTY, including `stdin` if it is not closed."
        type: "boolean"
        default: false
      OpenStdin:
        description: "Open `stdin`"
        type: "boolean"
        default: false
      StdinOnce:
        description: "Close `stdin` after one attached client disconnects"
        type: "boolean"
        default: false
      Env:
        description: |
          A list of environment variables to set inside the container in the form `["VAR=value", ...]`. A variable without `=` is removed from the environment, rather than to have an empty value.
        type: "array"
        items:
          type: "string"
      Cmd:
        description: "Command to run specified as a string or an array of strings."
        type:
          - "array"
          - "string"
        items:
          type: "string"
      Healthcheck:
        $ref: "#/definitions/HealthConfig"
      ArgsEscaped:
        description: "Command is already escaped (Windows only)"
        type: "boolean"
      Image:
        description: "The name of the image to use when creating the container"
        type: "string"
      Volumes:
        description: "An object mapping mount point paths inside the container to empty objects."
        type: "object"
        properties:
          additionalProperties:
            type: "object"
            enum:
              - {}
            default: {}
      WorkingDir:
        description: "The working directory for commands to run in."
        type: "string"
      Entrypoint:
        description: |
          The entry point for the container as a string or an array of strings.
@y
          `{"<port>/<tcp|udp>": {}}`
        type: "object"
        additionalProperties:
          type: "object"
          enum:
            - {}
          default: {}
      Tty:
        description: "Attach standard streams to a TTY, including `stdin` if it is not closed."
        type: "boolean"
        default: false
      OpenStdin:
        description: "Open `stdin`"
        type: "boolean"
        default: false
      StdinOnce:
        description: "Close `stdin` after one attached client disconnects"
        type: "boolean"
        default: false
      Env:
        description: |
          A list of environment variables to set inside the container in the form `["VAR=value", ...]`. A variable without `=` is removed from the environment, rather than to have an empty value.
        type: "array"
        items:
          type: "string"
      Cmd:
        description: "Command to run specified as a string or an array of strings."
        type:
          - "array"
          - "string"
        items:
          type: "string"
      Healthcheck:
        $ref: "#/definitions/HealthConfig"
      ArgsEscaped:
        description: "Command is already escaped (Windows only)"
        type: "boolean"
      Image:
        description: "The name of the image to use when creating the container"
        type: "string"
      Volumes:
        description: "An object mapping mount point paths inside the container to empty objects."
        type: "object"
        properties:
          additionalProperties:
            type: "object"
            enum:
              - {}
            default: {}
      WorkingDir:
        description: "The working directory for commands to run in."
        type: "string"
      Entrypoint:
        description: |
          The entry point for the container as a string or an array of strings.
@z

@x
          If the array consists of exactly one empty string (`[""]`) then the entry point is reset to system default (i.e., the entry point used by docker when there is no `ENTRYPOINT` instruction in the `Dockerfile`).
        type:
          - "array"
          - "string"
        items:
          type: "string"
      NetworkDisabled:
        description: "Disable networking for the container."
        type: "boolean"
      MacAddress:
        description: "MAC address of the container."
        type: "string"
      OnBuild:
        description: "`ONBUILD` metadata that were defined in the image's `Dockerfile`."
        type: "array"
        items:
          type: "string"
      Labels:
        description: "User-defined key/value metadata."
        type: "object"
        additionalProperties:
          type: "string"
      StopSignal:
        description: "Signal to stop a container as a string or unsigned integer."
        type: "string"
        default: "SIGTERM"
      StopTimeout:
        description: "Timeout to stop a container in seconds."
        type: "integer"
        default: 10
      Shell:
        description: "Shell for when `RUN`, `CMD`, and `ENTRYPOINT` uses a shell."
        type: "array"
        items:
          type: "string"
@y
          If the array consists of exactly one empty string (`[""]`) then the entry point is reset to system default (i.e., the entry point used by docker when there is no `ENTRYPOINT` instruction in the `Dockerfile`).
        type:
          - "array"
          - "string"
        items:
          type: "string"
      NetworkDisabled:
        description: "Disable networking for the container."
        type: "boolean"
      MacAddress:
        description: "MAC address of the container."
        type: "string"
      OnBuild:
        description: "`ONBUILD` metadata that were defined in the image's `Dockerfile`."
        type: "array"
        items:
          type: "string"
      Labels:
        description: "User-defined key/value metadata."
        type: "object"
        additionalProperties:
          type: "string"
      StopSignal:
        description: "Signal to stop a container as a string or unsigned integer."
        type: "string"
        default: "SIGTERM"
      StopTimeout:
        description: "Timeout to stop a container in seconds."
        type: "integer"
        default: 10
      Shell:
        description: "Shell for when `RUN`, `CMD`, and `ENTRYPOINT` uses a shell."
        type: "array"
        items:
          type: "string"
@z

@x
  NetworkConfig:
    description: "TODO: check is correct"
    type: "object"
    properties:
      Bridge:
        type: "string"
      Gateway:
        type: "string"
      Address:
        type: "string"
      IPPrefixLen:
        type: "integer"
      MacAddress:
        type: "string"
      PortMapping:
        type: "string"
      Ports:
        type: "array"
        items:
          $ref: "#/definitions/Port"
@y
  NetworkConfig:
    description: "TODO: check is correct"
    type: "object"
    properties:
      Bridge:
        type: "string"
      Gateway:
        type: "string"
      Address:
        type: "string"
      IPPrefixLen:
        type: "integer"
      MacAddress:
        type: "string"
      PortMapping:
        type: "string"
      Ports:
        type: "array"
        items:
          $ref: "#/definitions/Port"
@z

@x
  GraphDriverData:
    description: "Information about a container's graph driver."
    type: "object"
    required: [Name, Data]
    properties:
      Name:
        type: "string"
        x-nullable: false
      Data:
        type: "object"
        x-nullable: false
        additionalProperties:
          type: "string"
@y
  GraphDriverData:
    description: "Information about a container's graph driver."
    type: "object"
    required: [Name, Data]
    properties:
      Name:
        type: "string"
        x-nullable: false
      Data:
        type: "object"
        x-nullable: false
        additionalProperties:
          type: "string"
@z

@x
  Image:
    type: "object"
    required:
      - Id
      - Parent
      - Comment
      - Created
      - Container
      - DockerVersion
      - Author
      - Architecture
      - Os
      - Size
      - VirtualSize
      - GraphDriver
      - RootFS
    properties:
      Id:
        type: "string"
        x-nullable: false
      RepoTags:
        type: "array"
        items:
          type: "string"
      RepoDigests:
        type: "array"
        items:
          type: "string"
      Parent:
        type: "string"
        x-nullable: false
      Comment:
        type: "string"
        x-nullable: false
      Created:
        type: "string"
        x-nullable: false
      Container:
        type: "string"
        x-nullable: false
      ContainerConfig:
        $ref: "#/definitions/ContainerConfig"
      DockerVersion:
        type: "string"
        x-nullable: false
      Author:
        type: "string"
        x-nullable: false
      Config:
        $ref: "#/definitions/ContainerConfig"
      Architecture:
        type: "string"
        x-nullable: false
      Os:
        type: "string"
        x-nullable: false
      OsVersion:
        type: "string"
      Size:
        type: "integer"
        format: "int64"
        x-nullable: false
      VirtualSize:
        type: "integer"
        format: "int64"
        x-nullable: false
      GraphDriver:
        $ref: "#/definitions/GraphDriverData"
      RootFS:
        type: "object"
        required: [Type]
        properties:
          Type:
            type: "string"
            x-nullable: false
          Layers:
            type: "array"
            items:
              type: "string"
@y
  Image:
    type: "object"
    required:
      - Id
      - Parent
      - Comment
      - Created
      - Container
      - DockerVersion
      - Author
      - Architecture
      - Os
      - Size
      - VirtualSize
      - GraphDriver
      - RootFS
    properties:
      Id:
        type: "string"
        x-nullable: false
      RepoTags:
        type: "array"
        items:
          type: "string"
      RepoDigests:
        type: "array"
        items:
          type: "string"
      Parent:
        type: "string"
        x-nullable: false
      Comment:
        type: "string"
        x-nullable: false
      Created:
        type: "string"
        x-nullable: false
      Container:
        type: "string"
        x-nullable: false
      ContainerConfig:
        $ref: "#/definitions/ContainerConfig"
      DockerVersion:
        type: "string"
        x-nullable: false
      Author:
        type: "string"
        x-nullable: false
      Config:
        $ref: "#/definitions/ContainerConfig"
      Architecture:
        type: "string"
        x-nullable: false
      Os:
        type: "string"
        x-nullable: false
      OsVersion:
        type: "string"
      Size:
        type: "integer"
        format: "int64"
        x-nullable: false
      VirtualSize:
        type: "integer"
        format: "int64"
        x-nullable: false
      GraphDriver:
        $ref: "#/definitions/GraphDriverData"
      RootFS:
        type: "object"
        required: [Type]
        properties:
          Type:
            type: "string"
            x-nullable: false
          Layers:
            type: "array"
            items:
              type: "string"
@z

@x
  ImageSummary:
    type: "object"
    required:
      - Id
      - ParentId
      - RepoTags
      - RepoDigests
      - Created
      - Size
      - SharedSize
      - VirtualSize
      - Labels
      - Containers
    properties:
      Id:
        type: "string"
        x-nullable: false
      ParentId:
        type: "string"
        x-nullable: false
      RepoTags:
        type: "array"
        x-nullable: false
        items:
          type: "string"
      RepoDigests:
        type: "array"
        x-nullable: false
        items:
          type: "string"
      Created:
        type: "integer"
        x-nullable: false
      Size:
        type: "integer"
        x-nullable: false
      SharedSize:
        type: "integer"
        x-nullable: false
      VirtualSize:
        type: "integer"
        x-nullable: false
      Labels:
        type: "object"
        x-nullable: false
        additionalProperties:
          type: "string"
      Containers:
        x-nullable: false
        type: "integer"
@y
  ImageSummary:
    type: "object"
    required:
      - Id
      - ParentId
      - RepoTags
      - RepoDigests
      - Created
      - Size
      - SharedSize
      - VirtualSize
      - Labels
      - Containers
    properties:
      Id:
        type: "string"
        x-nullable: false
      ParentId:
        type: "string"
        x-nullable: false
      RepoTags:
        type: "array"
        x-nullable: false
        items:
          type: "string"
      RepoDigests:
        type: "array"
        x-nullable: false
        items:
          type: "string"
      Created:
        type: "integer"
        x-nullable: false
      Size:
        type: "integer"
        x-nullable: false
      SharedSize:
        type: "integer"
        x-nullable: false
      VirtualSize:
        type: "integer"
        x-nullable: false
      Labels:
        type: "object"
        x-nullable: false
        additionalProperties:
          type: "string"
      Containers:
        x-nullable: false
        type: "integer"
@z

@x
  AuthConfig:
    type: "object"
    properties:
      username:
        type: "string"
      password:
        type: "string"
      email:
        type: "string"
      serveraddress:
        type: "string"
    example:
      username: "hannibal"
      password: "xxxx"
      serveraddress: "https://index.docker.io/v1/"
@y
  AuthConfig:
    type: "object"
    properties:
      username:
        type: "string"
      password:
        type: "string"
      email:
        type: "string"
      serveraddress:
        type: "string"
    example:
      username: "hannibal"
      password: "xxxx"
      serveraddress: "https://index.docker.io/v1/"
@z

@x
  ProcessConfig:
    type: "object"
    properties:
      privileged:
        type: "boolean"
      user:
        type: "string"
      tty:
        type: "boolean"
      entrypoint:
        type: "string"
      arguments:
        type: "array"
        items:
          type: "string"
@y
  ProcessConfig:
    type: "object"
    properties:
      privileged:
        type: "boolean"
      user:
        type: "string"
      tty:
        type: "boolean"
      entrypoint:
        type: "string"
      arguments:
        type: "array"
        items:
          type: "string"
@z

@x
  Volume:
    type: "object"
    required: [Name, Driver, Mountpoint, Labels, Scope, Options]
    properties:
      Name:
        type: "string"
        description: "Name of the volume."
        x-nullable: false
      Driver:
        type: "string"
        description: "Name of the volume driver used by the volume."
        x-nullable: false
      Mountpoint:
        type: "string"
        description: "Mount path of the volume on the host."
        x-nullable: false
      Status:
        type: "object"
        description: |
          Low-level details about the volume, provided by the volume driver.
          Details are returned as a map with key/value pairs:
          `{"key":"value","key2":"value2"}`.
@y
  Volume:
    type: "object"
    required: [Name, Driver, Mountpoint, Labels, Scope, Options]
    properties:
      Name:
        type: "string"
        description: "Name of the volume."
        x-nullable: false
      Driver:
        type: "string"
        description: "Name of the volume driver used by the volume."
        x-nullable: false
      Mountpoint:
        type: "string"
        description: "Mount path of the volume on the host."
        x-nullable: false
      Status:
        type: "object"
        description: |
          Low-level details about the volume, provided by the volume driver.
          Details are returned as a map with key/value pairs:
          `{"key":"value","key2":"value2"}`.
@z

@x
          The `Status` field is optional, and is omitted if the volume driver
          does not support this feature.
        additionalProperties:
          type: "object"
      Labels:
        type: "object"
        description: "User-defined key/value metadata."
        x-nullable: false
        additionalProperties:
          type: "string"
      Scope:
        type: "string"
        description: "The level at which the volume exists. Either `global` for cluster-wide, or `local` for machine level."
        default: "local"
        x-nullable: false
        enum: ["local", "global"]
      Options:
        type: "object"
        description: "The driver specific options used when creating the volume."
        additionalProperties:
          type: "string"
      UsageData:
        type: "object"
        x-nullable: true
        required: [Size, RefCount]
        description: |
          Usage details about the volume. This information is used by the
          `GET /system/df` endpoint, and omitted in other endpoints.
        properties:
          Size:
            type: "integer"
            default: -1
            description: |
              Amount of disk space used by the volume (in bytes). This information
              is only available for volumes created with the `"local"` volume
              driver. For volumes created with other volume drivers, this field
              is set to `-1` ("not available")
            x-nullable: false
          RefCount:
            type: "integer"
            default: -1
            description: |
              The number of containers referencing this volume. This field
              is set to `-1` if the reference-count is not available.
            x-nullable: false
@y
          The `Status` field is optional, and is omitted if the volume driver
          does not support this feature.
        additionalProperties:
          type: "object"
      Labels:
        type: "object"
        description: "User-defined key/value metadata."
        x-nullable: false
        additionalProperties:
          type: "string"
      Scope:
        type: "string"
        description: "The level at which the volume exists. Either `global` for cluster-wide, or `local` for machine level."
        default: "local"
        x-nullable: false
        enum: ["local", "global"]
      Options:
        type: "object"
        description: "The driver specific options used when creating the volume."
        additionalProperties:
          type: "string"
      UsageData:
        type: "object"
        x-nullable: true
        required: [Size, RefCount]
        description: |
          Usage details about the volume. This information is used by the
          `GET /system/df` endpoint, and omitted in other endpoints.
        properties:
          Size:
            type: "integer"
            default: -1
            description: |
              Amount of disk space used by the volume (in bytes). This information
              is only available for volumes created with the `"local"` volume
              driver. For volumes created with other volume drivers, this field
              is set to `-1` ("not available")
            x-nullable: false
          RefCount:
            type: "integer"
            default: -1
            description: |
              The number of containers referencing this volume. This field
              is set to `-1` if the reference-count is not available.
            x-nullable: false
@z

@x
    example:
      Name: "tardis"
      Driver: "custom"
      Mountpoint: "/var/lib/docker/volumes/tardis"
      Status:
        hello: "world"
      Labels:
        com.example.some-label: "some-value"
        com.example.some-other-label: "some-other-value"
      Scope: "local"
@y
    example:
      Name: "tardis"
      Driver: "custom"
      Mountpoint: "/var/lib/docker/volumes/tardis"
      Status:
        hello: "world"
      Labels:
        com.example.some-label: "some-value"
        com.example.some-other-label: "some-other-value"
      Scope: "local"
@z

@x
  Network:
    type: "object"
    properties:
      Name:
        type: "string"
      Id:
        type: "string"
      Created:
        type: "string"
        format: "dateTime"
      Scope:
        type: "string"
      Driver:
        type: "string"
      EnableIPv6:
        type: "boolean"
      IPAM:
        $ref: "#/definitions/IPAM"
      Internal:
        type: "boolean"
      Attachable:
        type: "boolean"
      Ingress:
        type: "boolean"
      Containers:
        type: "object"
        additionalProperties:
          $ref: "#/definitions/NetworkContainer"
      Options:
        type: "object"
        additionalProperties:
          type: "string"
      Labels:
        type: "object"
        additionalProperties:
          type: "string"
    example:
      Name: "net01"
      Id: "7d86d31b1478e7cca9ebed7e73aa0fdeec46c5ca29497431d3007d2d9e15ed99"
      Created: "2016-10-19T04:33:30.360899459Z"
      Scope: "local"
      Driver: "bridge"
      EnableIPv6: false
      IPAM:
        Driver: "default"
        Config:
          - Subnet: "172.19.0.0/16"
            Gateway: "172.19.0.1"
        Options:
          foo: "bar"
      Internal: false
      Attachable: false
      Ingress: false
      Containers:
        19a4d5d687db25203351ed79d478946f861258f018fe384f229f2efa4b23513c:
          Name: "test"
          EndpointID: "628cadb8bcb92de107b2a1e516cbffe463e321f548feb37697cce00ad694f21a"
          MacAddress: "02:42:ac:13:00:02"
          IPv4Address: "172.19.0.2/16"
          IPv6Address: ""
      Options:
        com.docker.network.bridge.default_bridge: "true"
        com.docker.network.bridge.enable_icc: "true"
        com.docker.network.bridge.enable_ip_masquerade: "true"
        com.docker.network.bridge.host_binding_ipv4: "0.0.0.0"
        com.docker.network.bridge.name: "docker0"
        com.docker.network.driver.mtu: "1500"
      Labels:
        com.example.some-label: "some-value"
        com.example.some-other-label: "some-other-value"
  IPAM:
    type: "object"
    properties:
      Driver:
        description: "Name of the IPAM driver to use."
        type: "string"
        default: "default"
      Config:
        description: "List of IPAM configuration options, specified as a map: `{\"Subnet\": <CIDR>, \"IPRange\": <CIDR>, \"Gateway\": <IP address>, \"AuxAddress\": <device_name:IP address>}`"
        type: "array"
        items:
          type: "object"
          additionalProperties:
            type: "string"
      Options:
        description: "Driver-specific options, specified as a map."
        type: "array"
        items:
          type: "object"
          additionalProperties:
            type: "string"
  NetworkContainer:
    type: "object"
    properties:
      Name:
        type: "string"
      EndpointID:
        type: "string"
      MacAddress:
        type: "string"
      IPv4Address:
        type: "string"
      IPv6Address:
        type: "string"
@y
  Network:
    type: "object"
    properties:
      Name:
        type: "string"
      Id:
        type: "string"
      Created:
        type: "string"
        format: "dateTime"
      Scope:
        type: "string"
      Driver:
        type: "string"
      EnableIPv6:
        type: "boolean"
      IPAM:
        $ref: "#/definitions/IPAM"
      Internal:
        type: "boolean"
      Attachable:
        type: "boolean"
      Ingress:
        type: "boolean"
      Containers:
        type: "object"
        additionalProperties:
          $ref: "#/definitions/NetworkContainer"
      Options:
        type: "object"
        additionalProperties:
          type: "string"
      Labels:
        type: "object"
        additionalProperties:
          type: "string"
    example:
      Name: "net01"
      Id: "7d86d31b1478e7cca9ebed7e73aa0fdeec46c5ca29497431d3007d2d9e15ed99"
      Created: "2016-10-19T04:33:30.360899459Z"
      Scope: "local"
      Driver: "bridge"
      EnableIPv6: false
      IPAM:
        Driver: "default"
        Config:
          - Subnet: "172.19.0.0/16"
            Gateway: "172.19.0.1"
        Options:
          foo: "bar"
      Internal: false
      Attachable: false
      Ingress: false
      Containers:
        19a4d5d687db25203351ed79d478946f861258f018fe384f229f2efa4b23513c:
          Name: "test"
          EndpointID: "628cadb8bcb92de107b2a1e516cbffe463e321f548feb37697cce00ad694f21a"
          MacAddress: "02:42:ac:13:00:02"
          IPv4Address: "172.19.0.2/16"
          IPv6Address: ""
      Options:
        com.docker.network.bridge.default_bridge: "true"
        com.docker.network.bridge.enable_icc: "true"
        com.docker.network.bridge.enable_ip_masquerade: "true"
        com.docker.network.bridge.host_binding_ipv4: "0.0.0.0"
        com.docker.network.bridge.name: "docker0"
        com.docker.network.driver.mtu: "1500"
      Labels:
        com.example.some-label: "some-value"
        com.example.some-other-label: "some-other-value"
  IPAM:
    type: "object"
    properties:
      Driver:
        description: "Name of the IPAM driver to use."
        type: "string"
        default: "default"
      Config:
        description: "List of IPAM configuration options, specified as a map: `{\"Subnet\": <CIDR>, \"IPRange\": <CIDR>, \"Gateway\": <IP address>, \"AuxAddress\": <device_name:IP address>}`"
        type: "array"
        items:
          type: "object"
          additionalProperties:
            type: "string"
      Options:
        description: "Driver-specific options, specified as a map."
        type: "array"
        items:
          type: "object"
          additionalProperties:
            type: "string"
  NetworkContainer:
    type: "object"
    properties:
      Name:
        type: "string"
      EndpointID:
        type: "string"
      MacAddress:
        type: "string"
      IPv4Address:
        type: "string"
      IPv6Address:
        type: "string"
@z

@x
  BuildInfo:
    type: "object"
    properties:
      id:
        type: "string"
      stream:
        type: "string"
      error:
        type: "string"
      errorDetail:
        $ref: "#/definitions/ErrorDetail"
      status:
        type: "string"
      progress:
        type: "string"
      progressDetail:
        $ref: "#/definitions/ProgressDetail"
@y
  BuildInfo:
    type: "object"
    properties:
      id:
        type: "string"
      stream:
        type: "string"
      error:
        type: "string"
      errorDetail:
        $ref: "#/definitions/ErrorDetail"
      status:
        type: "string"
      progress:
        type: "string"
      progressDetail:
        $ref: "#/definitions/ProgressDetail"
@z

@x
  CreateImageInfo:
    type: "object"
    properties:
      error:
        type: "string"
      status:
        type: "string"
      progress:
        type: "string"
      progressDetail:
        $ref: "#/definitions/ProgressDetail"
@y
  CreateImageInfo:
    type: "object"
    properties:
      error:
        type: "string"
      status:
        type: "string"
      progress:
        type: "string"
      progressDetail:
        $ref: "#/definitions/ProgressDetail"
@z

@x
  PushImageInfo:
    type: "object"
    properties:
      error:
        type: "string"
      status:
        type: "string"
      progress:
        type: "string"
      progressDetail:
        $ref: "#/definitions/ProgressDetail"
  ErrorDetail:
    type: "object"
    properties:
      code:
        type: "integer"
      message:
        type: "string"
  ProgressDetail:
    type: "object"
    properties:
      code:
        type: "integer"
      message:
        type: "integer"
@y
  PushImageInfo:
    type: "object"
    properties:
      error:
        type: "string"
      status:
        type: "string"
      progress:
        type: "string"
      progressDetail:
        $ref: "#/definitions/ProgressDetail"
  ErrorDetail:
    type: "object"
    properties:
      code:
        type: "integer"
      message:
        type: "string"
  ProgressDetail:
    type: "object"
    properties:
      code:
        type: "integer"
      message:
        type: "integer"
@z

@x
  ErrorResponse:
    description: "Represents an error."
    type: "object"
    required: ["message"]
    properties:
      message:
        description: "The error message."
        type: "string"
        x-nullable: false
    example:
      message: "Something went wrong."
@y
  ErrorResponse:
    description: "Represents an error."
    type: "object"
    required: ["message"]
    properties:
      message:
        description: "The error message."
        type: "string"
        x-nullable: false
    example:
      message: "Something went wrong."
@z

@x
  IdResponse:
    description: "Response to an API call that returns just an Id"
    type: "object"
    required: ["Id"]
    properties:
      Id:
        description: "The id of the newly created object."
        type: "string"
        x-nullable: false
@y
  IdResponse:
    description: "Response to an API call that returns just an Id"
    type: "object"
    required: ["Id"]
    properties:
      Id:
        description: "The id of the newly created object."
        type: "string"
        x-nullable: false
@z

@x
  EndpointSettings:
    description: "Configuration for a network endpoint."
    type: "object"
    properties:
      IPAMConfig:
        description: "IPAM configurations for the endpoint"
        type: "object"
        properties:
          IPv4Address:
            type: "string"
          IPv6Address:
            type: "string"
          LinkLocalIPs:
            type: "array"
            items:
              type: "string"
      Links:
        type: "array"
        items:
          type: "string"
      Aliases:
        type: "array"
        items:
          type: "string"
      NetworkID:
        type: "string"
      EndpointID:
        type: "string"
      Gateway:
        type: "string"
      IPAddress:
        type: "string"
      IPPrefixLen:
        type: "integer"
      IPv6Gateway:
        type: "string"
      GlobalIPv6Address:
        type: "string"
      GlobalIPv6PrefixLen:
        type: "integer"
        format: "int64"
      MacAddress:
        type: "string"
@y
  EndpointSettings:
    description: "Configuration for a network endpoint."
    type: "object"
    properties:
      IPAMConfig:
        description: "IPAM configurations for the endpoint"
        type: "object"
        properties:
          IPv4Address:
            type: "string"
          IPv6Address:
            type: "string"
          LinkLocalIPs:
            type: "array"
            items:
              type: "string"
      Links:
        type: "array"
        items:
          type: "string"
      Aliases:
        type: "array"
        items:
          type: "string"
      NetworkID:
        type: "string"
      EndpointID:
        type: "string"
      Gateway:
        type: "string"
      IPAddress:
        type: "string"
      IPPrefixLen:
        type: "integer"
      IPv6Gateway:
        type: "string"
      GlobalIPv6Address:
        type: "string"
      GlobalIPv6PrefixLen:
        type: "integer"
        format: "int64"
      MacAddress:
        type: "string"
@z

@x
  PluginMount:
    type: "object"
    x-nullable: false
    required: [Name, Description, Settable, Source, Destination, Type, Options]
    properties:
      Name:
        type: "string"
        x-nullable: false
        example: "some-mount"
      Description:
        type: "string"
        x-nullable: false
        example: "This is a mount that's used by the plugin."
      Settable:
        type: "array"
        items:
          type: "string"
      Source:
        type: "string"
        example: "/var/lib/docker/plugins/"
      Destination:
        type: "string"
        x-nullable: false
        example: "/mnt/state"
      Type:
        type: "string"
        x-nullable: false
        example: "bind"
      Options:
        type: "array"
        items:
          type: "string"
        example:
          - "rbind"
          - "rw"
  PluginDevice:
    type: "object"
    required: [Name, Description, Settable, Path]
    x-nullable: false
    properties:
      Name:
        type: "string"
        x-nullable: false
      Description:
        type: "string"
        x-nullable: false
      Settable:
        type: "array"
        items:
          type: "string"
      Path:
        type: "string"
        example: "/dev/fuse"
@y
  PluginMount:
    type: "object"
    x-nullable: false
    required: [Name, Description, Settable, Source, Destination, Type, Options]
    properties:
      Name:
        type: "string"
        x-nullable: false
        example: "some-mount"
      Description:
        type: "string"
        x-nullable: false
        example: "This is a mount that's used by the plugin."
      Settable:
        type: "array"
        items:
          type: "string"
      Source:
        type: "string"
        example: "/var/lib/docker/plugins/"
      Destination:
        type: "string"
        x-nullable: false
        example: "/mnt/state"
      Type:
        type: "string"
        x-nullable: false
        example: "bind"
      Options:
        type: "array"
        items:
          type: "string"
        example:
          - "rbind"
          - "rw"
  PluginDevice:
    type: "object"
    required: [Name, Description, Settable, Path]
    x-nullable: false
    properties:
      Name:
        type: "string"
        x-nullable: false
      Description:
        type: "string"
        x-nullable: false
      Settable:
        type: "array"
        items:
          type: "string"
      Path:
        type: "string"
        example: "/dev/fuse"
@z

@x
  PluginEnv:
    type: "object"
    x-nullable: false
    required: [Name, Description, Settable, Value]
    properties:
      Name:
        x-nullable: false
        type: "string"
      Description:
        x-nullable: false
        type: "string"
      Settable:
        type: "array"
        items:
          type: "string"
      Value:
        type: "string"
@y
  PluginEnv:
    type: "object"
    x-nullable: false
    required: [Name, Description, Settable, Value]
    properties:
      Name:
        x-nullable: false
        type: "string"
      Description:
        x-nullable: false
        type: "string"
      Settable:
        type: "array"
        items:
          type: "string"
      Value:
        type: "string"
@z

@x
  PluginInterfaceType:
    type: "object"
    x-nullable: false
    required: [Prefix, Capability, Version]
    properties:
      Prefix:
        type: "string"
        x-nullable: false
      Capability:
        type: "string"
        x-nullable: false
      Version:
        type: "string"
        x-nullable: false
@y
  PluginInterfaceType:
    type: "object"
    x-nullable: false
    required: [Prefix, Capability, Version]
    properties:
      Prefix:
        type: "string"
        x-nullable: false
      Capability:
        type: "string"
        x-nullable: false
      Version:
        type: "string"
        x-nullable: false
@z

@x
  Plugin:
    description: "A plugin for the Engine API"
    type: "object"
    required: [Settings, Enabled, Config, Name]
    properties:
      Id:
        type: "string"
        example: "5724e2c8652da337ab2eedd19fc6fc0ec908e4bd907c7421bf6a8dfc70c4c078"
      Name:
        type: "string"
        x-nullable: false
        example: "tiborvass/sample-volume-plugin"
      Enabled:
        description: "True if the plugin is running. False if the plugin is not running, only installed."
        type: "boolean"
        x-nullable: false
        example: true
      Settings:
        description: "Settings that can be modified by users."
        type: "object"
        x-nullable: false
        required: [Args, Devices, Env, Mounts]
        properties:
          Mounts:
            type: "array"
            items:
              $ref: "#/definitions/PluginMount"
          Env:
            type: "array"
            items:
              type: "string"
            example:
              - "DEBUG=0"
          Args:
            type: "array"
            items:
              type: "string"
          Devices:
            type: "array"
            items:
              $ref: "#/definitions/PluginDevice"
      PluginReference:
        description: "plugin remote reference used to push/pull the plugin"
        type: "string"
        x-nullable: false
        example: "localhost:5000/tiborvass/sample-volume-plugin:latest"
      Config:
        description: "The config of a plugin."
        type: "object"
        x-nullable: false
        required:
          - Description
          - Documentation
          - Interface
          - Entrypoint
          - WorkDir
          - Network
          - Linux
          - PidHost
          - PropagatedMount
          - IpcHost
          - Mounts
          - Env
          - Args
        properties:
          DockerVersion:
            description: "Docker Version used to create the plugin"
            type: "string"
            x-nullable: false
            example: "17.06.0-ce"
          Description:
            type: "string"
            x-nullable: false
            example: "A sample volume plugin for Docker"
          Documentation:
            type: "string"
            x-nullable: false
            example: "https://docs.docker.com/engine/extend/plugins/"
          Interface:
            description: "The interface between Docker and the plugin"
            x-nullable: false
            type: "object"
            required: [Types, Socket]
            properties:
              Types:
                type: "array"
                items:
                  $ref: "#/definitions/PluginInterfaceType"
                example:
                  - "docker.volumedriver/1.0"
              Socket:
                type: "string"
                x-nullable: false
                example: "plugins.sock"
          Entrypoint:
            type: "array"
            items:
              type: "string"
            example:
              - "/usr/bin/sample-volume-plugin"
              - "/data"
          WorkDir:
            type: "string"
            x-nullable: false
            example: "/bin/"
          User:
            type: "object"
            x-nullable: false
            properties:
              UID:
                type: "integer"
                format: "uint32"
                example: 1000
              GID:
                type: "integer"
                format: "uint32"
                example: 1000
          Network:
            type: "object"
            x-nullable: false
            required: [Type]
            properties:
              Type:
                x-nullable: false
                type: "string"
                example: "host"
          Linux:
            type: "object"
            x-nullable: false
            required: [Capabilities, AllowAllDevices, Devices]
            properties:
              Capabilities:
                type: "array"
                items:
                  type: "string"
                example:
                  - "CAP_SYS_ADMIN"
                  - "CAP_SYSLOG"
              AllowAllDevices:
                type: "boolean"
                x-nullable: false
                example: false
              Devices:
                type: "array"
                items:
                  $ref: "#/definitions/PluginDevice"
          PropagatedMount:
            type: "string"
            x-nullable: false
            example: "/mnt/volumes"
          IpcHost:
            type: "boolean"
            x-nullable: false
            example: false
          PidHost:
            type: "boolean"
            x-nullable: false
            example: false
          Mounts:
            type: "array"
            items:
              $ref: "#/definitions/PluginMount"
          Env:
            type: "array"
            items:
              $ref: "#/definitions/PluginEnv"
            example:
              - Name: "DEBUG"
                Description: "If set, prints debug messages"
                Settable: null
                Value: "0"
          Args:
            type: "object"
            x-nullable: false
            required: [Name, Description, Settable, Value]
            properties:
              Name:
                x-nullable: false
                type: "string"
                example: "args"
              Description:
                x-nullable: false
                type: "string"
                example: "command line arguments"
              Settable:
                type: "array"
                items:
                  type: "string"
              Value:
                type: "array"
                items:
                  type: "string"
          rootfs:
            type: "object"
            properties:
              type:
                type: "string"
                example: "layers"
              diff_ids:
                type: "array"
                items:
                  type: "string"
                example:
                  - "sha256:675532206fbf3030b8458f88d6e26d4eb1577688a25efec97154c94e8b6b4887"
                  - "sha256:e216a057b1cb1efc11f8a268f37ef62083e70b1b38323ba252e25ac88904a7e8"
@y
  Plugin:
    description: "A plugin for the Engine API"
    type: "object"
    required: [Settings, Enabled, Config, Name]
    properties:
      Id:
        type: "string"
        example: "5724e2c8652da337ab2eedd19fc6fc0ec908e4bd907c7421bf6a8dfc70c4c078"
      Name:
        type: "string"
        x-nullable: false
        example: "tiborvass/sample-volume-plugin"
      Enabled:
        description: "True if the plugin is running. False if the plugin is not running, only installed."
        type: "boolean"
        x-nullable: false
        example: true
      Settings:
        description: "Settings that can be modified by users."
        type: "object"
        x-nullable: false
        required: [Args, Devices, Env, Mounts]
        properties:
          Mounts:
            type: "array"
            items:
              $ref: "#/definitions/PluginMount"
          Env:
            type: "array"
            items:
              type: "string"
            example:
              - "DEBUG=0"
          Args:
            type: "array"
            items:
              type: "string"
          Devices:
            type: "array"
            items:
              $ref: "#/definitions/PluginDevice"
      PluginReference:
        description: "plugin remote reference used to push/pull the plugin"
        type: "string"
        x-nullable: false
        example: "localhost:5000/tiborvass/sample-volume-plugin:latest"
      Config:
        description: "The config of a plugin."
        type: "object"
        x-nullable: false
        required:
          - Description
          - Documentation
          - Interface
          - Entrypoint
          - WorkDir
          - Network
          - Linux
          - PidHost
          - PropagatedMount
          - IpcHost
          - Mounts
          - Env
          - Args
        properties:
          DockerVersion:
            description: "Docker Version used to create the plugin"
            type: "string"
            x-nullable: false
            example: "17.06.0-ce"
          Description:
            type: "string"
            x-nullable: false
            example: "A sample volume plugin for Docker"
          Documentation:
            type: "string"
            x-nullable: false
            example: "https://docs.docker.com/engine/extend/plugins/"
          Interface:
            description: "The interface between Docker and the plugin"
            x-nullable: false
            type: "object"
            required: [Types, Socket]
            properties:
              Types:
                type: "array"
                items:
                  $ref: "#/definitions/PluginInterfaceType"
                example:
                  - "docker.volumedriver/1.0"
              Socket:
                type: "string"
                x-nullable: false
                example: "plugins.sock"
          Entrypoint:
            type: "array"
            items:
              type: "string"
            example:
              - "/usr/bin/sample-volume-plugin"
              - "/data"
          WorkDir:
            type: "string"
            x-nullable: false
            example: "/bin/"
          User:
            type: "object"
            x-nullable: false
            properties:
              UID:
                type: "integer"
                format: "uint32"
                example: 1000
              GID:
                type: "integer"
                format: "uint32"
                example: 1000
          Network:
            type: "object"
            x-nullable: false
            required: [Type]
            properties:
              Type:
                x-nullable: false
                type: "string"
                example: "host"
          Linux:
            type: "object"
            x-nullable: false
            required: [Capabilities, AllowAllDevices, Devices]
            properties:
              Capabilities:
                type: "array"
                items:
                  type: "string"
                example:
                  - "CAP_SYS_ADMIN"
                  - "CAP_SYSLOG"
              AllowAllDevices:
                type: "boolean"
                x-nullable: false
                example: false
              Devices:
                type: "array"
                items:
                  $ref: "#/definitions/PluginDevice"
          PropagatedMount:
            type: "string"
            x-nullable: false
            example: "/mnt/volumes"
          IpcHost:
            type: "boolean"
            x-nullable: false
            example: false
          PidHost:
            type: "boolean"
            x-nullable: false
            example: false
          Mounts:
            type: "array"
            items:
              $ref: "#/definitions/PluginMount"
          Env:
            type: "array"
            items:
              $ref: "#/definitions/PluginEnv"
            example:
              - Name: "DEBUG"
                Description: "If set, prints debug messages"
                Settable: null
                Value: "0"
          Args:
            type: "object"
            x-nullable: false
            required: [Name, Description, Settable, Value]
            properties:
              Name:
                x-nullable: false
                type: "string"
                example: "args"
              Description:
                x-nullable: false
                type: "string"
                example: "command line arguments"
              Settable:
                type: "array"
                items:
                  type: "string"
              Value:
                type: "array"
                items:
                  type: "string"
          rootfs:
            type: "object"
            properties:
              type:
                type: "string"
                example: "layers"
              diff_ids:
                type: "array"
                items:
                  type: "string"
                example:
                  - "sha256:675532206fbf3030b8458f88d6e26d4eb1577688a25efec97154c94e8b6b4887"
                  - "sha256:e216a057b1cb1efc11f8a268f37ef62083e70b1b38323ba252e25ac88904a7e8"
@z

@x
  ObjectVersion:
    description: |
      The version number of the object such as node, service, etc. This is needed to avoid conflicting writes.
      The client must send the version number along with the modified specification when updating these objects.
      This approach ensures safe concurrency and determinism in that the change on the object
      may not be applied if the version number has changed from the last read. In other words,
      if two update requests specify the same base version, only one of the requests can succeed.
      As a result, two separate update requests that happen at the same time will not
      unintentionally overwrite each other.
    type: "object"
    properties:
      Index:
        type: "integer"
        format: "int64"
@y
  ObjectVersion:
    description: |
      The version number of the object such as node, service, etc. This is needed to avoid conflicting writes.
      The client must send the version number along with the modified specification when updating these objects.
      This approach ensures safe concurrency and determinism in that the change on the object
      may not be applied if the version number has changed from the last read. In other words,
      if two update requests specify the same base version, only one of the requests can succeed.
      As a result, two separate update requests that happen at the same time will not
      unintentionally overwrite each other.
    type: "object"
    properties:
      Index:
        type: "integer"
        format: "int64"
@z

@x
  NodeSpec:
    type: "object"
    properties:
      Name:
        description: "Name for the node."
        type: "string"
      Labels:
        description: "User-defined key/value metadata."
        type: "object"
        additionalProperties:
          type: "string"
      Role:
        description: "Role of the node."
        type: "string"
        enum:
          - "worker"
          - "manager"
      Availability:
        description: "Availability of the node."
        type: "string"
        enum:
          - "active"
          - "pause"
          - "drain"
    example:
      Availability: "active"
      Name: "node-name"
      Role: "manager"
      Labels:
        foo: "bar"
  Node:
    type: "object"
    properties:
      ID:
        type: "string"
      Version:
        $ref: "#/definitions/ObjectVersion"
      CreatedAt:
        type: "string"
        format: "dateTime"
      UpdatedAt:
        type: "string"
        format: "dateTime"
      Spec:
        $ref: "#/definitions/NodeSpec"
      Description:
        type: "object"
        properties:
          Hostname:
            type: "string"
          Platform:
            type: "object"
            properties:
              Architecture:
                type: "string"
              OS:
                type: "string"
          Resources:
            type: "object"
            properties:
              NanoCPUs:
                type: "integer"
                format: "int64"
              MemoryBytes:
                type: "integer"
                format: "int64"
          Engine:
            type: "object"
            properties:
              EngineVersion:
                type: "string"
              Labels:
                type: "object"
                additionalProperties:
                  type: "string"
              Plugins:
                type: "array"
                items:
                  type: "object"
                  properties:
                    Type:
                      type: "string"
                    Name:
                      type: "string"
          TLSInfo:
            $ref: "#/definitions/SwarmSpec"
    example:
      ID: "24ifsmvkjbyhk"
      Version:
        Index: 8
      CreatedAt: "2016-06-07T20:31:11.853781916Z"
      UpdatedAt: "2016-06-07T20:31:11.999868824Z"
      Spec:
        Name: "my-node"
        Role: "manager"
        Availability: "active"
        Labels:
          foo: "bar"
      Description:
        Hostname: "bf3067039e47"
        Platform:
          Architecture: "x86_64"
          OS: "linux"
        Resources:
          NanoCPUs: 4000000000
          MemoryBytes: 8272408576
        Engine:
          EngineVersion: "17.04.0"
          Labels:
            foo: "bar"
          Plugins:
            - Type: "Volume"
              Name: "local"
            - Type: "Network"
              Name: "bridge"
            - Type: "Network"
              Name: "null"
            - Type: "Network"
              Name: "overlay"
      Status:
        State: "ready"
        Addr: "172.17.0.2"
      ManagerStatus:
        Leader: true
        Reachability: "reachable"
        Addr: "172.17.0.2:2377"
      TLSInfo:
        TrustRoot: |
          -----BEGIN CERTIFICATE-----
          MIIBajCCARCgAwIBAgIUbYqrLSOSQHoxD8CwG6Bi2PJi9c8wCgYIKoZIzj0EAwIw
          EzERMA8GA1UEAxMIc3dhcm0tY2EwHhcNMTcwNDI0MjE0MzAwWhcNMzcwNDE5MjE0
          MzAwWjATMREwDwYDVQQDEwhzd2FybS1jYTBZMBMGByqGSM49AgEGCCqGSM49AwEH
          A0IABJk/VyMPYdaqDXJb/VXh5n/1Yuv7iNrxV3Qb3l06XD46seovcDWs3IZNV1lf
          3Skyr0ofcchipoiHkXBODojJydSjQjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMB
          Af8EBTADAQH/MB0GA1UdDgQWBBRUXxuRcnFjDfR/RIAUQab8ZV/n4jAKBggqhkjO
          PQQDAgNIADBFAiAy+JTe6Uc3KyLCMiqGl2GyWGQqQDEcO3/YG36x7om65AIhAJvz
          pxv6zFeVEkAEEkqIYi0omA9+CjanB/6Bz4n1uw8H
          -----END CERTIFICATE-----
        CertIssuerSubject: "MBMxETAPBgNVBAMTCHN3YXJtLWNh"
        CertIssuerPublicKey: "MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEmT9XIw9h1qoNclv9VeHmf/Vi6/uI2vFXdBveXTpcPjqx6i9wNazchk1XWV/dKTKvSh9xyGKmiIeRcE4OiMnJ1A=="
  TLSInfo:
    description: "Information about the issuer of leaf TLS certificates and the trusted root CA certificate"
    type: "object"
    properties:
      TrustRoot:
        description: "The root CA certificate(s) that are used to validate leaf TLS certificates"
        type: "string"
      CertIssuerSubject:
        description: "The base64-url-safe-encoded raw subject bytes of the issuer"
        type: "string"
      CertIssuerPublicKey:
        description: "The base64-url-safe-encoded raw public key bytes of the issuer"
        type: "string"
    example:
      TrustRoot: |
        -----BEGIN CERTIFICATE-----
        MIIBajCCARCgAwIBAgIUbYqrLSOSQHoxD8CwG6Bi2PJi9c8wCgYIKoZIzj0EAwIw
        EzERMA8GA1UEAxMIc3dhcm0tY2EwHhcNMTcwNDI0MjE0MzAwWhcNMzcwNDE5MjE0
        MzAwWjATMREwDwYDVQQDEwhzd2FybS1jYTBZMBMGByqGSM49AgEGCCqGSM49AwEH
        A0IABJk/VyMPYdaqDXJb/VXh5n/1Yuv7iNrxV3Qb3l06XD46seovcDWs3IZNV1lf
        3Skyr0ofcchipoiHkXBODojJydSjQjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMB
        Af8EBTADAQH/MB0GA1UdDgQWBBRUXxuRcnFjDfR/RIAUQab8ZV/n4jAKBggqhkjO
        PQQDAgNIADBFAiAy+JTe6Uc3KyLCMiqGl2GyWGQqQDEcO3/YG36x7om65AIhAJvz
        pxv6zFeVEkAEEkqIYi0omA9+CjanB/6Bz4n1uw8H
        -----END CERTIFICATE-----
      CertIssuerSubject: "MBMxETAPBgNVBAMTCHN3YXJtLWNh"
      CertIssuerPublicKey: "MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEmT9XIw9h1qoNclv9VeHmf/Vi6/uI2vFXdBveXTpcPjqx6i9wNazchk1XWV/dKTKvSh9xyGKmiIeRcE4OiMnJ1A=="
  SwarmSpec:
    description: "User modifiable swarm configuration."
    type: "object"
    properties:
      Name:
        description: "Name of the swarm."
        type: "string"
      Labels:
        description: "User-defined key/value metadata."
        type: "object"
        additionalProperties:
          type: "string"
      Orchestration:
        description: "Orchestration configuration."
        type: "object"
        properties:
          TaskHistoryRetentionLimit:
            description: "The number of historic tasks to keep per instance or node. If negative, never remove completed or failed tasks."
            type: "integer"
            format: "int64"
      Raft:
        description: "Raft configuration."
        type: "object"
        properties:
          SnapshotInterval:
            description: "The number of log entries between snapshots."
            type: "integer"
            format: "int64"
          KeepOldSnapshots:
            description: "The number of snapshots to keep beyond the current snapshot."
            type: "integer"
            format: "int64"
          LogEntriesForSlowFollowers:
            description: "The number of log entries to keep around to sync up slow followers after a snapshot is created."
            type: "integer"
            format: "int64"
          ElectionTick:
            description: |
              The number of ticks that a follower will wait for a message from the leader before becoming a candidate and starting an election. `ElectionTick` must be greater than `HeartbeatTick`.
@y
  NodeSpec:
    type: "object"
    properties:
      Name:
        description: "Name for the node."
        type: "string"
      Labels:
        description: "User-defined key/value metadata."
        type: "object"
        additionalProperties:
          type: "string"
      Role:
        description: "Role of the node."
        type: "string"
        enum:
          - "worker"
          - "manager"
      Availability:
        description: "Availability of the node."
        type: "string"
        enum:
          - "active"
          - "pause"
          - "drain"
    example:
      Availability: "active"
      Name: "node-name"
      Role: "manager"
      Labels:
        foo: "bar"
  Node:
    type: "object"
    properties:
      ID:
        type: "string"
      Version:
        $ref: "#/definitions/ObjectVersion"
      CreatedAt:
        type: "string"
        format: "dateTime"
      UpdatedAt:
        type: "string"
        format: "dateTime"
      Spec:
        $ref: "#/definitions/NodeSpec"
      Description:
        type: "object"
        properties:
          Hostname:
            type: "string"
          Platform:
            type: "object"
            properties:
              Architecture:
                type: "string"
              OS:
                type: "string"
          Resources:
            type: "object"
            properties:
              NanoCPUs:
                type: "integer"
                format: "int64"
              MemoryBytes:
                type: "integer"
                format: "int64"
          Engine:
            type: "object"
            properties:
              EngineVersion:
                type: "string"
              Labels:
                type: "object"
                additionalProperties:
                  type: "string"
              Plugins:
                type: "array"
                items:
                  type: "object"
                  properties:
                    Type:
                      type: "string"
                    Name:
                      type: "string"
          TLSInfo:
            $ref: "#/definitions/SwarmSpec"
    example:
      ID: "24ifsmvkjbyhk"
      Version:
        Index: 8
      CreatedAt: "2016-06-07T20:31:11.853781916Z"
      UpdatedAt: "2016-06-07T20:31:11.999868824Z"
      Spec:
        Name: "my-node"
        Role: "manager"
        Availability: "active"
        Labels:
          foo: "bar"
      Description:
        Hostname: "bf3067039e47"
        Platform:
          Architecture: "x86_64"
          OS: "linux"
        Resources:
          NanoCPUs: 4000000000
          MemoryBytes: 8272408576
        Engine:
          EngineVersion: "17.04.0"
          Labels:
            foo: "bar"
          Plugins:
            - Type: "Volume"
              Name: "local"
            - Type: "Network"
              Name: "bridge"
            - Type: "Network"
              Name: "null"
            - Type: "Network"
              Name: "overlay"
      Status:
        State: "ready"
        Addr: "172.17.0.2"
      ManagerStatus:
        Leader: true
        Reachability: "reachable"
        Addr: "172.17.0.2:2377"
      TLSInfo:
        TrustRoot: |
          -----BEGIN CERTIFICATE-----
          MIIBajCCARCgAwIBAgIUbYqrLSOSQHoxD8CwG6Bi2PJi9c8wCgYIKoZIzj0EAwIw
          EzERMA8GA1UEAxMIc3dhcm0tY2EwHhcNMTcwNDI0MjE0MzAwWhcNMzcwNDE5MjE0
          MzAwWjATMREwDwYDVQQDEwhzd2FybS1jYTBZMBMGByqGSM49AgEGCCqGSM49AwEH
          A0IABJk/VyMPYdaqDXJb/VXh5n/1Yuv7iNrxV3Qb3l06XD46seovcDWs3IZNV1lf
          3Skyr0ofcchipoiHkXBODojJydSjQjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMB
          Af8EBTADAQH/MB0GA1UdDgQWBBRUXxuRcnFjDfR/RIAUQab8ZV/n4jAKBggqhkjO
          PQQDAgNIADBFAiAy+JTe6Uc3KyLCMiqGl2GyWGQqQDEcO3/YG36x7om65AIhAJvz
          pxv6zFeVEkAEEkqIYi0omA9+CjanB/6Bz4n1uw8H
          -----END CERTIFICATE-----
        CertIssuerSubject: "MBMxETAPBgNVBAMTCHN3YXJtLWNh"
        CertIssuerPublicKey: "MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEmT9XIw9h1qoNclv9VeHmf/Vi6/uI2vFXdBveXTpcPjqx6i9wNazchk1XWV/dKTKvSh9xyGKmiIeRcE4OiMnJ1A=="
  TLSInfo:
    description: "Information about the issuer of leaf TLS certificates and the trusted root CA certificate"
    type: "object"
    properties:
      TrustRoot:
        description: "The root CA certificate(s) that are used to validate leaf TLS certificates"
        type: "string"
      CertIssuerSubject:
        description: "The base64-url-safe-encoded raw subject bytes of the issuer"
        type: "string"
      CertIssuerPublicKey:
        description: "The base64-url-safe-encoded raw public key bytes of the issuer"
        type: "string"
    example:
      TrustRoot: |
        -----BEGIN CERTIFICATE-----
        MIIBajCCARCgAwIBAgIUbYqrLSOSQHoxD8CwG6Bi2PJi9c8wCgYIKoZIzj0EAwIw
        EzERMA8GA1UEAxMIc3dhcm0tY2EwHhcNMTcwNDI0MjE0MzAwWhcNMzcwNDE5MjE0
        MzAwWjATMREwDwYDVQQDEwhzd2FybS1jYTBZMBMGByqGSM49AgEGCCqGSM49AwEH
        A0IABJk/VyMPYdaqDXJb/VXh5n/1Yuv7iNrxV3Qb3l06XD46seovcDWs3IZNV1lf
        3Skyr0ofcchipoiHkXBODojJydSjQjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMB
        Af8EBTADAQH/MB0GA1UdDgQWBBRUXxuRcnFjDfR/RIAUQab8ZV/n4jAKBggqhkjO
        PQQDAgNIADBFAiAy+JTe6Uc3KyLCMiqGl2GyWGQqQDEcO3/YG36x7om65AIhAJvz
        pxv6zFeVEkAEEkqIYi0omA9+CjanB/6Bz4n1uw8H
        -----END CERTIFICATE-----
      CertIssuerSubject: "MBMxETAPBgNVBAMTCHN3YXJtLWNh"
      CertIssuerPublicKey: "MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEmT9XIw9h1qoNclv9VeHmf/Vi6/uI2vFXdBveXTpcPjqx6i9wNazchk1XWV/dKTKvSh9xyGKmiIeRcE4OiMnJ1A=="
  SwarmSpec:
    description: "User modifiable swarm configuration."
    type: "object"
    properties:
      Name:
        description: "Name of the swarm."
        type: "string"
      Labels:
        description: "User-defined key/value metadata."
        type: "object"
        additionalProperties:
          type: "string"
      Orchestration:
        description: "Orchestration configuration."
        type: "object"
        properties:
          TaskHistoryRetentionLimit:
            description: "The number of historic tasks to keep per instance or node. If negative, never remove completed or failed tasks."
            type: "integer"
            format: "int64"
      Raft:
        description: "Raft configuration."
        type: "object"
        properties:
          SnapshotInterval:
            description: "The number of log entries between snapshots."
            type: "integer"
            format: "int64"
          KeepOldSnapshots:
            description: "The number of snapshots to keep beyond the current snapshot."
            type: "integer"
            format: "int64"
          LogEntriesForSlowFollowers:
            description: "The number of log entries to keep around to sync up slow followers after a snapshot is created."
            type: "integer"
            format: "int64"
          ElectionTick:
            description: |
              The number of ticks that a follower will wait for a message from the leader before becoming a candidate and starting an election. `ElectionTick` must be greater than `HeartbeatTick`.
@z

@x
              A tick currently defaults to one second, so these translate directly to seconds currently, but this is NOT guaranteed.
            type: "integer"
          HeartbeatTick:
            description: |
              The number of ticks between heartbeats. Every HeartbeatTick ticks, the leader will send a heartbeat to the followers.
@y
              A tick currently defaults to one second, so these translate directly to seconds currently, but this is NOT guaranteed.
            type: "integer"
          HeartbeatTick:
            description: |
              The number of ticks between heartbeats. Every HeartbeatTick ticks, the leader will send a heartbeat to the followers.
@z

@x
              A tick currently defaults to one second, so these translate directly to seconds currently, but this is NOT guaranteed.
            type: "integer"
      Dispatcher:
        description: "Dispatcher configuration."
        type: "object"
        properties:
          HeartbeatPeriod:
            description: "The delay for an agent to send a heartbeat to the dispatcher."
            type: "integer"
            format: "int64"
      CAConfig:
        description: "CA configuration."
        type: "object"
        properties:
          NodeCertExpiry:
            description: "The duration node certificates are issued for."
            type: "integer"
            format: "int64"
          ExternalCAs:
            description: "Configuration for forwarding signing requests to an external certificate authority."
            type: "array"
            items:
              type: "object"
              properties:
                Protocol:
                  description: "Protocol for communication with the external CA (currently only `cfssl` is supported)."
                  type: "string"
                  enum:
                    - "cfssl"
                  default: "cfssl"
                URL:
                  description: "URL where certificate signing requests should be sent."
                  type: "string"
                Options:
                  description: "An object with key/value pairs that are interpreted as protocol-specific options for the external CA driver."
                  type: "object"
                  additionalProperties:
                    type: "string"
                CACert:
                  description: "The root CA certificate (in PEM format) this external CA uses to issue TLS certificates (assumed to be to the current swarm root CA certificate if not provided)."
                  type: "string"
          SigningCACert:
            description: "The desired signing CA certificate for all swarm node TLS leaf certificates, in PEM format."
            type: "string"
          SigningCAKey:
            description: "The desired signing CA key for all swarm node TLS leaf certificates, in PEM format."
            type: "string"
          ForceRotate:
            description: "An integer whose purpose is to force swarm to generate a new signing CA certificate and key, if none have been specified in `SigningCACert` and `SigningCAKey`"
      EncryptionConfig:
        description: "Parameters related to encryption-at-rest."
        type: "object"
        properties:
          AutoLockManagers:
            description: "If set, generate a key and use it to lock data stored on the managers."
            type: "boolean"
      TaskDefaults:
        description: "Defaults for creating tasks in this cluster."
        type: "object"
        properties:
          LogDriver:
            description: |
              The log driver to use for tasks created in the orchestrator if unspecified by a service.
@y
              A tick currently defaults to one second, so these translate directly to seconds currently, but this is NOT guaranteed.
            type: "integer"
      Dispatcher:
        description: "Dispatcher configuration."
        type: "object"
        properties:
          HeartbeatPeriod:
            description: "The delay for an agent to send a heartbeat to the dispatcher."
            type: "integer"
            format: "int64"
      CAConfig:
        description: "CA configuration."
        type: "object"
        properties:
          NodeCertExpiry:
            description: "The duration node certificates are issued for."
            type: "integer"
            format: "int64"
          ExternalCAs:
            description: "Configuration for forwarding signing requests to an external certificate authority."
            type: "array"
            items:
              type: "object"
              properties:
                Protocol:
                  description: "Protocol for communication with the external CA (currently only `cfssl` is supported)."
                  type: "string"
                  enum:
                    - "cfssl"
                  default: "cfssl"
                URL:
                  description: "URL where certificate signing requests should be sent."
                  type: "string"
                Options:
                  description: "An object with key/value pairs that are interpreted as protocol-specific options for the external CA driver."
                  type: "object"
                  additionalProperties:
                    type: "string"
                CACert:
                  description: "The root CA certificate (in PEM format) this external CA uses to issue TLS certificates (assumed to be to the current swarm root CA certificate if not provided)."
                  type: "string"
          SigningCACert:
            description: "The desired signing CA certificate for all swarm node TLS leaf certificates, in PEM format."
            type: "string"
          SigningCAKey:
            description: "The desired signing CA key for all swarm node TLS leaf certificates, in PEM format."
            type: "string"
          ForceRotate:
            description: "An integer whose purpose is to force swarm to generate a new signing CA certificate and key, if none have been specified in `SigningCACert` and `SigningCAKey`"
      EncryptionConfig:
        description: "Parameters related to encryption-at-rest."
        type: "object"
        properties:
          AutoLockManagers:
            description: "If set, generate a key and use it to lock data stored on the managers."
            type: "boolean"
      TaskDefaults:
        description: "Defaults for creating tasks in this cluster."
        type: "object"
        properties:
          LogDriver:
            description: |
              The log driver to use for tasks created in the orchestrator if unspecified by a service.
@z

@x
              Updating this value will only have an affect on new tasks. Old tasks will continue use their previously configured log driver until recreated.
            type: "object"
            properties:
              Name:
                type: "string"
              Options:
                type: "object"
                additionalProperties:
                  type: "string"
    example:
      Name: "default"
      Orchestration:
        TaskHistoryRetentionLimit: 10
      Raft:
        SnapshotInterval: 10000
        LogEntriesForSlowFollowers: 500
        HeartbeatTick: 1
        ElectionTick: 3
      Dispatcher:
        HeartbeatPeriod: 5000000000
      CAConfig:
        NodeCertExpiry: 7776000000000000
      JoinTokens:
        Worker: "SWMTKN-1-3pu6hszjas19xyp7ghgosyx9k8atbfcr8p2is99znpy26u2lkl-1awxwuwd3z9j1z3puu7rcgdbx"
        Manager: "SWMTKN-1-3pu6hszjas19xyp7ghgosyx9k8atbfcr8p2is99znpy26u2lkl-7p73s1dx5in4tatdymyhg9hu2"
      EncryptionConfig:
        AutoLockManagers: false
  # The Swarm information for `GET /info`. It is the same as `GET /swarm`, but
  # without `JoinTokens`.
  ClusterInfo:
    type: "object"
    properties:
      ID:
        description: "The ID of the swarm."
        type: "string"
      Version:
        $ref: "#/definitions/ObjectVersion"
      CreatedAt:
        type: "string"
        format: "dateTime"
      UpdatedAt:
        type: "string"
        format: "dateTime"
      Spec:
        $ref: "#/definitions/SwarmSpec"
      TLSInfo:
        $ref: "#/definitions/TLSInfo"
      RootRotationInProgress:
        description: "Whether there is currently a root CA rotation in progress for the swarm"
        type: "boolean"
  TaskSpec:
    description: "User modifiable task configuration."
    type: "object"
    properties:
      ContainerSpec:
        type: "object"
        properties:
          Image:
            description: "The image name to use for the container."
            type: "string"
          Labels:
            description: "User-defined key/value data."
            type: "object"
            additionalProperties:
              type: "string"
          Command:
            description: "The command to be run in the image."
            type: "array"
            items:
              type: "string"
          Args:
            description: "Arguments to the command."
            type: "array"
            items:
              type: "string"
          Hostname:
            description: "The hostname to use for the container, as a valid RFC 1123 hostname."
            type: "string"
          Env:
            description: "A list of environment variables in the form `VAR=value`."
            type: "array"
            items:
              type: "string"
          Dir:
            description: "The working directory for commands to run in."
            type: "string"
          User:
            description: "The user inside the container."
            type: "string"
          Groups:
            type: "array"
            description: "A list of additional groups that the container process will run as."
            items:
              type: "string"
          Privileges:
            type: "object"
            description: "Security options for the container"
            properties:
              CredentialSpec:
                type: "object"
                description: "CredentialSpec for managed service account (Windows only)"
                properties:
                  File:
                    type: "string"
                    description: |
                      Load credential spec from this file. The file is read by the daemon, and must be present in the
                      `CredentialSpecs` subdirectory in the docker data directory, which defaults to
                      `C:\ProgramData\Docker\` on Windows.
@y
              Updating this value will only have an affect on new tasks. Old tasks will continue use their previously configured log driver until recreated.
            type: "object"
            properties:
              Name:
                type: "string"
              Options:
                type: "object"
                additionalProperties:
                  type: "string"
    example:
      Name: "default"
      Orchestration:
        TaskHistoryRetentionLimit: 10
      Raft:
        SnapshotInterval: 10000
        LogEntriesForSlowFollowers: 500
        HeartbeatTick: 1
        ElectionTick: 3
      Dispatcher:
        HeartbeatPeriod: 5000000000
      CAConfig:
        NodeCertExpiry: 7776000000000000
      JoinTokens:
        Worker: "SWMTKN-1-3pu6hszjas19xyp7ghgosyx9k8atbfcr8p2is99znpy26u2lkl-1awxwuwd3z9j1z3puu7rcgdbx"
        Manager: "SWMTKN-1-3pu6hszjas19xyp7ghgosyx9k8atbfcr8p2is99znpy26u2lkl-7p73s1dx5in4tatdymyhg9hu2"
      EncryptionConfig:
        AutoLockManagers: false
  # The Swarm information for `GET /info`. It is the same as `GET /swarm`, but
  # without `JoinTokens`.
  ClusterInfo:
    type: "object"
    properties:
      ID:
        description: "The ID of the swarm."
        type: "string"
      Version:
        $ref: "#/definitions/ObjectVersion"
      CreatedAt:
        type: "string"
        format: "dateTime"
      UpdatedAt:
        type: "string"
        format: "dateTime"
      Spec:
        $ref: "#/definitions/SwarmSpec"
      TLSInfo:
        $ref: "#/definitions/TLSInfo"
      RootRotationInProgress:
        description: "Whether there is currently a root CA rotation in progress for the swarm"
        type: "boolean"
  TaskSpec:
    description: "User modifiable task configuration."
    type: "object"
    properties:
      ContainerSpec:
        type: "object"
        properties:
          Image:
            description: "The image name to use for the container."
            type: "string"
          Labels:
            description: "User-defined key/value data."
            type: "object"
            additionalProperties:
              type: "string"
          Command:
            description: "The command to be run in the image."
            type: "array"
            items:
              type: "string"
          Args:
            description: "Arguments to the command."
            type: "array"
            items:
              type: "string"
          Hostname:
            description: "The hostname to use for the container, as a valid RFC 1123 hostname."
            type: "string"
          Env:
            description: "A list of environment variables in the form `VAR=value`."
            type: "array"
            items:
              type: "string"
          Dir:
            description: "The working directory for commands to run in."
            type: "string"
          User:
            description: "The user inside the container."
            type: "string"
          Groups:
            type: "array"
            description: "A list of additional groups that the container process will run as."
            items:
              type: "string"
          Privileges:
            type: "object"
            description: "Security options for the container"
            properties:
              CredentialSpec:
                type: "object"
                description: "CredentialSpec for managed service account (Windows only)"
                properties:
                  File:
                    type: "string"
                    description: |
                      Load credential spec from this file. The file is read by the daemon, and must be present in the
                      `CredentialSpecs` subdirectory in the docker data directory, which defaults to
                      `C:\ProgramData\Docker\` on Windows.
@z

@x
                      For example, specifying `spec.json` loads `C:\ProgramData\Docker\CredentialSpecs\spec.json`.
@y
                      For example, specifying `spec.json` loads `C:\ProgramData\Docker\CredentialSpecs\spec.json`.
@z

@x
                      <p><br /></p>
@y
                      <p><br /></p>
@z

@x
                      > **Note**: `CredentialSpec.File` and `CredentialSpec.Registry` are mutually exclusive.
                  Registry:
                    type: "string"
                    description: |
                      Load credential spec from this value in the Windows registry. The specified registry value must be
                      located in:
@y
                      > **Note**: `CredentialSpec.File` and `CredentialSpec.Registry` are mutually exclusive.
                  Registry:
                    type: "string"
                    description: |
                      Load credential spec from this value in the Windows registry. The specified registry value must be
                      located in:
@z

@x
                      `HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization\Containers\CredentialSpecs`
@y
                      `HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization\Containers\CredentialSpecs`
@z

@x
                      <p><br /></p>
@y
                      <p><br /></p>
@z

@x
                      > **Note**: `CredentialSpec.File` and `CredentialSpec.Registry` are mutually exclusive.
              SELinuxContext:
                type: "object"
                description: "SELinux labels of the container"
                properties:
                  Disable:
                    type: "boolean"
                    description: "Disable SELinux"
                  User:
                    type: "string"
                    description: "SELinux user label"
                  Role:
                    type: "string"
                    description: "SELinux role label"
                  Type:
                    type: "string"
                    description: "SELinux type label"
                  Level:
                    type: "string"
                    description: "SELinux level label"
          TTY:
            description: "Whether a pseudo-TTY should be allocated."
            type: "boolean"
          OpenStdin:
            description: "Open `stdin`"
            type: "boolean"
          ReadOnly:
            description: "Mount the container's root filesystem as read only."
            type: "boolean"
          Mounts:
            description: "Specification for mounts to be added to containers created as part of the service."
            type: "array"
            items:
              $ref: "#/definitions/Mount"
          StopSignal:
            description: "Signal to stop the container."
            type: "string"
          StopGracePeriod:
            description: "Amount of time to wait for the container to terminate before forcefully killing it."
            type: "integer"
            format: "int64"
          HealthCheck:
            $ref: "#/definitions/HealthConfig"
          Hosts:
            type: "array"
            description: |
              A list of hostnames/IP mappings to add to the container's `/etc/hosts` file.
              The format of extra hosts on swarmkit is specified in:
              http://man7.org/linux/man-pages/man5/hosts.5.html
                IP_address canonical_hostname [aliases...]
            items:
              type: "string"
          DNSConfig:
            description: "Specification for DNS related configurations in resolver configuration file (`resolv.conf`)."
            type: "object"
            properties:
              Nameservers:
                description: "The IP addresses of the name servers."
                type: "array"
                items:
                  type: "string"
              Search:
                description: "A search list for host-name lookup."
                type: "array"
                items:
                  type: "string"
              Options:
                description: "A list of internal resolver variables to be modified (e.g., `debug`, `ndots:3`, etc.)."
                type: "array"
                items:
                  type: "string"
          Secrets:
            description: "Secrets contains references to zero or more secrets that will be exposed to the service."
            type: "array"
            items:
              type: "object"
              properties:
                File:
                  description: "File represents a specific target that is backed by a file."
                  type: "object"
                  properties:
                    Name:
                      description: "Name represents the final filename in the filesystem."
                      type: "string"
                    UID:
                      description: "UID represents the file UID."
                      type: "string"
                    GID:
                      description: "GID represents the file GID."
                      type: "string"
                    Mode:
                      description: "Mode represents the FileMode of the file."
                      type: "integer"
                      format: "uint32"
                SecretID:
                  description: "SecretID represents the ID of the specific secret that we're referencing."
                  type: "string"
                SecretName:
                  description: |
                    SecretName is the name of the secret that this references, but this is just provided for
                    lookup/display purposes. The secret in the reference will be identified by its ID.
                  type: "string"
          Configs:
            description: "Configs contains references to zero or more configs that will be exposed to the service."
            type: "array"
            items:
              type: "object"
              properties:
                File:
                  description: "File represents a specific target that is backed by a file."
                  type: "object"
                  properties:
                    Name:
                      description: "Name represents the final filename in the filesystem."
                      type: "string"
                    UID:
                      description: "UID represents the file UID."
                      type: "string"
                    GID:
                      description: "GID represents the file GID."
                      type: "string"
                    Mode:
                      description: "Mode represents the FileMode of the file."
                      type: "integer"
                      format: "uint32"
                ConfigID:
                  description: "ConfigID represents the ID of the specific config that we're referencing."
                  type: "string"
                ConfigName:
                  description: |
                    ConfigName is the name of the config that this references, but this is just provided for
                    lookup/display purposes. The config in the reference will be identified by its ID.
                  type: "string"
@y
                      > **Note**: `CredentialSpec.File` and `CredentialSpec.Registry` are mutually exclusive.
              SELinuxContext:
                type: "object"
                description: "SELinux labels of the container"
                properties:
                  Disable:
                    type: "boolean"
                    description: "Disable SELinux"
                  User:
                    type: "string"
                    description: "SELinux user label"
                  Role:
                    type: "string"
                    description: "SELinux role label"
                  Type:
                    type: "string"
                    description: "SELinux type label"
                  Level:
                    type: "string"
                    description: "SELinux level label"
          TTY:
            description: "Whether a pseudo-TTY should be allocated."
            type: "boolean"
          OpenStdin:
            description: "Open `stdin`"
            type: "boolean"
          ReadOnly:
            description: "Mount the container's root filesystem as read only."
            type: "boolean"
          Mounts:
            description: "Specification for mounts to be added to containers created as part of the service."
            type: "array"
            items:
              $ref: "#/definitions/Mount"
          StopSignal:
            description: "Signal to stop the container."
            type: "string"
          StopGracePeriod:
            description: "Amount of time to wait for the container to terminate before forcefully killing it."
            type: "integer"
            format: "int64"
          HealthCheck:
            $ref: "#/definitions/HealthConfig"
          Hosts:
            type: "array"
            description: |
              A list of hostnames/IP mappings to add to the container's `/etc/hosts` file.
              The format of extra hosts on swarmkit is specified in:
              http://man7.org/linux/man-pages/man5/hosts.5.html
                IP_address canonical_hostname [aliases...]
            items:
              type: "string"
          DNSConfig:
            description: "Specification for DNS related configurations in resolver configuration file (`resolv.conf`)."
            type: "object"
            properties:
              Nameservers:
                description: "The IP addresses of the name servers."
                type: "array"
                items:
                  type: "string"
              Search:
                description: "A search list for host-name lookup."
                type: "array"
                items:
                  type: "string"
              Options:
                description: "A list of internal resolver variables to be modified (e.g., `debug`, `ndots:3`, etc.)."
                type: "array"
                items:
                  type: "string"
          Secrets:
            description: "Secrets contains references to zero or more secrets that will be exposed to the service."
            type: "array"
            items:
              type: "object"
              properties:
                File:
                  description: "File represents a specific target that is backed by a file."
                  type: "object"
                  properties:
                    Name:
                      description: "Name represents the final filename in the filesystem."
                      type: "string"
                    UID:
                      description: "UID represents the file UID."
                      type: "string"
                    GID:
                      description: "GID represents the file GID."
                      type: "string"
                    Mode:
                      description: "Mode represents the FileMode of the file."
                      type: "integer"
                      format: "uint32"
                SecretID:
                  description: "SecretID represents the ID of the specific secret that we're referencing."
                  type: "string"
                SecretName:
                  description: |
                    SecretName is the name of the secret that this references, but this is just provided for
                    lookup/display purposes. The secret in the reference will be identified by its ID.
                  type: "string"
          Configs:
            description: "Configs contains references to zero or more configs that will be exposed to the service."
            type: "array"
            items:
              type: "object"
              properties:
                File:
                  description: "File represents a specific target that is backed by a file."
                  type: "object"
                  properties:
                    Name:
                      description: "Name represents the final filename in the filesystem."
                      type: "string"
                    UID:
                      description: "UID represents the file UID."
                      type: "string"
                    GID:
                      description: "GID represents the file GID."
                      type: "string"
                    Mode:
                      description: "Mode represents the FileMode of the file."
                      type: "integer"
                      format: "uint32"
                ConfigID:
                  description: "ConfigID represents the ID of the specific config that we're referencing."
                  type: "string"
                ConfigName:
                  description: |
                    ConfigName is the name of the config that this references, but this is just provided for
                    lookup/display purposes. The config in the reference will be identified by its ID.
                  type: "string"
@z

@x
      Resources:
        description: "Resource requirements which apply to each individual container created as part of the service."
        type: "object"
        properties:
          Limits:
            description: "Define resources limits."
            type: "object"
            properties:
              NanoCPUs:
                description: "CPU limit in units of 10<sup>-9</sup> CPU shares."
                type: "integer"
                format: "int64"
              MemoryBytes:
                description: "Memory limit in Bytes."
                type: "integer"
                format: "int64"
          Reservations:
            description: "Define resources reservation."
            properties:
              NanoCPUs:
                description: "CPU reservation in units of 10<sup>-9</sup> CPU shares."
                type: "integer"
                format: "int64"
              MemoryBytes:
                description: "Memory reservation in Bytes."
                type: "integer"
                format: "int64"
      RestartPolicy:
        description: "Specification for the restart policy which applies to containers created as part of this service."
        type: "object"
        properties:
          Condition:
            description: "Condition for restart."
            type: "string"
            enum:
              - "none"
              - "on-failure"
              - "any"
          Delay:
            description: "Delay between restart attempts."
            type: "integer"
            format: "int64"
          MaxAttempts:
            description: "Maximum attempts to restart a given container before giving up (default value is 0, which is ignored)."
            type: "integer"
            format: "int64"
            default: 0
          Window:
            description: "Windows is the time window used to evaluate the restart policy (default value is 0, which is unbounded)."
            type: "integer"
            format: "int64"
            default: 0
      Placement:
        type: "object"
        properties:
          Constraints:
            description: "An array of constraints."
            type: "array"
            items:
              type: "string"
          Preferences:
            description: "Preferences provide a way to make the scheduler aware of factors such as topology. They are provided in order from highest to lowest precedence."
            type: "array"
            items:
              type: "object"
              properties:
                Spread:
                  type: "object"
                  properties:
                    SpreadDescriptor:
                      description: "label descriptor, such as engine.labels.az"
                      type: "string"
          Platforms:
            description: "An array of supported platforms."
            type: "array"
            items:
              type: "object"
              properties:
                Architecture:
                  type: "string"
                OS:
                  type: "string"
      ForceUpdate:
        description: "A counter that triggers an update even if no relevant parameters have been changed."
        type: "integer"
      Runtime:
        description: "Runtime is the type of runtime specified for the task executor."
        type: "string"
      Networks:
        type: "array"
        items:
          type: "object"
          properties:
            Target:
              type: "string"
            Aliases:
              type: "array"
              items:
                type: "string"
      LogDriver:
        description: "Specifies the log driver to use for tasks created from this spec. If not present, the default one for the swarm will be used, finally falling back to the engine default if not specified."
        type: "object"
        properties:
          Name:
            type: "string"
          Options:
            type: "object"
            additionalProperties:
              type: "string"
  TaskState:
    type: "string"
    enum:
      - "new"
      - "allocated"
      - "pending"
      - "assigned"
      - "accepted"
      - "preparing"
      - "ready"
      - "starting"
      - "running"
      - "complete"
      - "shutdown"
      - "failed"
      - "rejected"
  Task:
    type: "object"
    properties:
      ID:
        description: "The ID of the task."
        type: "string"
      Version:
        $ref: "#/definitions/ObjectVersion"
      CreatedAt:
        type: "string"
        format: "dateTime"
      UpdatedAt:
        type: "string"
        format: "dateTime"
      Name:
        description: "Name of the task."
        type: "string"
      Labels:
        description: "User-defined key/value metadata."
        type: "object"
        additionalProperties:
          type: "string"
      Spec:
        $ref: "#/definitions/TaskSpec"
      ServiceID:
        description: "The ID of the service this task is part of."
        type: "string"
      Slot:
        type: "integer"
      NodeID:
        description: "The ID of the node that this task is on."
        type: "string"
      Status:
        type: "object"
        properties:
          Timestamp:
            type: "string"
            format: "dateTime"
          State:
            $ref: "#/definitions/TaskState"
          Message:
            type: "string"
          Err:
            type: "string"
          ContainerStatus:
            type: "object"
            properties:
              ContainerID:
                type: "string"
              PID:
                type: "integer"
              ExitCode:
                type: "integer"
      DesiredState:
        $ref: "#/definitions/TaskState"
    example:
      ID: "0kzzo1i0y4jz6027t0k7aezc7"
      Version:
        Index: 71
      CreatedAt: "2016-06-07T21:07:31.171892745Z"
      UpdatedAt: "2016-06-07T21:07:31.376370513Z"
      Spec:
        ContainerSpec:
          Image: "redis"
        Resources:
          Limits: {}
          Reservations: {}
        RestartPolicy:
          Condition: "any"
          MaxAttempts: 0
        Placement: {}
      ServiceID: "9mnpnzenvg8p8tdbtq4wvbkcz"
      Slot: 1
      NodeID: "60gvrl6tm78dmak4yl7srz94v"
      Status:
        Timestamp: "2016-06-07T21:07:31.290032978Z"
        State: "running"
        Message: "started"
        ContainerStatus:
          ContainerID: "e5d62702a1b48d01c3e02ca1e0212a250801fa8d67caca0b6f35919ebc12f035"
          PID: 677
      DesiredState: "running"
      NetworksAttachments:
        - Network:
            ID: "4qvuz4ko70xaltuqbt8956gd1"
            Version:
              Index: 18
            CreatedAt: "2016-06-07T20:31:11.912919752Z"
            UpdatedAt: "2016-06-07T21:07:29.955277358Z"
            Spec:
              Name: "ingress"
              Labels:
                com.docker.swarm.internal: "true"
              DriverConfiguration: {}
              IPAMOptions:
                Driver: {}
                Configs:
                  - Subnet: "10.255.0.0/16"
                    Gateway: "10.255.0.1"
            DriverState:
              Name: "overlay"
              Options:
                com.docker.network.driver.overlay.vxlanid_list: "256"
            IPAMOptions:
              Driver:
                Name: "default"
              Configs:
                - Subnet: "10.255.0.0/16"
                  Gateway: "10.255.0.1"
          Addresses:
            - "10.255.0.10/16"
  ServiceSpec:
    description: "User modifiable configuration for a service."
    type: object
    properties:
      Name:
        description: "Name of the service."
        type: "string"
      Labels:
        description: "User-defined key/value metadata."
        type: "object"
        additionalProperties:
          type: "string"
      TaskTemplate:
        $ref: "#/definitions/TaskSpec"
      Mode:
        description: "Scheduling mode for the service."
        type: "object"
        properties:
          Replicated:
            type: "object"
            properties:
              Replicas:
                type: "integer"
                format: "int64"
          Global:
            type: "object"
      UpdateConfig:
        description: "Specification for the update strategy of the service."
        type: "object"
        properties:
          Parallelism:
            description: "Maximum number of tasks to be updated in one iteration (0 means unlimited parallelism)."
            type: "integer"
            format: "int64"
          Delay:
            description: "Amount of time between updates, in nanoseconds."
            type: "integer"
            format: "int64"
          FailureAction:
            description: "Action to take if an updated task fails to run, or stops running during the update."
            type: "string"
            enum:
              - "continue"
              - "pause"
              - "rollback"
          Monitor:
            description: "Amount of time to monitor each updated task for failures, in nanoseconds."
            type: "integer"
            format: "int64"
          MaxFailureRatio:
            description: "The fraction of tasks that may fail during an update before the failure action is invoked, specified as a floating point number between 0 and 1."
            type: "number"
            default: 0
          Order:
            description: "The order of operations when rolling out an updated task. Either the old task is shut down before the new task is started, or the new task is started before the old task is shut down."
            type: "string"
            enum:
              - "stop-first"
              - "start-first"
      RollbackConfig:
        description: "Specification for the rollback strategy of the service."
        type: "object"
        properties:
          Parallelism:
            description: "Maximum number of tasks to be rolled back in one iteration (0 means unlimited parallelism)."
            type: "integer"
            format: "int64"
          Delay:
            description: "Amount of time between rollback iterations, in nanoseconds."
            type: "integer"
            format: "int64"
          FailureAction:
            description: "Action to take if an rolled back task fails to run, or stops running during the rollback."
            type: "string"
            enum:
              - "continue"
              - "pause"
          Monitor:
            description: "Amount of time to monitor each rolled back task for failures, in nanoseconds."
            type: "integer"
            format: "int64"
          MaxFailureRatio:
            description: "The fraction of tasks that may fail during a rollback before the failure action is invoked, specified as a floating point number between 0 and 1."
            type: "number"
            default: 0
          Order:
            description: "The order of operations when rolling back a task. Either the old task is shut down before the new task is started, or the new task is started before the old task is shut down."
            type: "string"
            enum:
              - "stop-first"
              - "start-first"
      Networks:
        description: "Array of network names or IDs to attach the service to."
        type: "array"
        items:
          type: "object"
          properties:
            Target:
              type: "string"
            Aliases:
              type: "array"
              items:
                type: "string"
      EndpointSpec:
        $ref: "#/definitions/EndpointSpec"
  EndpointPortConfig:
    type: "object"
    properties:
      Name:
        type: "string"
      Protocol:
        type: "string"
        enum:
          - "tcp"
          - "udp"
      TargetPort:
        description: "The port inside the container."
        type: "integer"
      PublishedPort:
        description: "The port on the swarm hosts."
        type: "integer"
  EndpointSpec:
    description: "Properties that can be configured to access and load balance a service."
    type: "object"
    properties:
      Mode:
        description: "The mode of resolution to use for internal load balancing
      between tasks."
        type: "string"
        enum:
          - "vip"
          - "dnsrr"
        default: "vip"
      Ports:
        description: "List of exposed ports that this service is accessible on from the outside. Ports can only be provided if `vip` resolution mode is used."
        type: "array"
        items:
          $ref: "#/definitions/EndpointPortConfig"
  Service:
    type: "object"
    properties:
      ID:
        type: "string"
      Version:
        $ref: "#/definitions/ObjectVersion"
      CreatedAt:
        type: "string"
        format: "dateTime"
      UpdatedAt:
        type: "string"
        format: "dateTime"
      Spec:
        $ref: "#/definitions/ServiceSpec"
      Endpoint:
        type: "object"
        properties:
          Spec:
            $ref: "#/definitions/EndpointSpec"
          Ports:
            type: "array"
            items:
              $ref: "#/definitions/EndpointPortConfig"
          VirtualIPs:
            type: "array"
            items:
              type: "object"
              properties:
                NetworkID:
                  type: "string"
                Addr:
                  type: "string"
      UpdateStatus:
        description: "The status of a service update."
        type: "object"
        properties:
          State:
            type: "string"
            enum:
              - "updating"
              - "paused"
              - "completed"
          StartedAt:
            type: "string"
            format: "dateTime"
          CompletedAt:
            type: "string"
            format: "dateTime"
          Message:
            type: "string"
    example:
      ID: "9mnpnzenvg8p8tdbtq4wvbkcz"
      Version:
        Index: 19
      CreatedAt: "2016-06-07T21:05:51.880065305Z"
      UpdatedAt: "2016-06-07T21:07:29.962229872Z"
      Spec:
        Name: "hopeful_cori"
        TaskTemplate:
          ContainerSpec:
            Image: "redis"
          Resources:
            Limits: {}
            Reservations: {}
          RestartPolicy:
            Condition: "any"
            MaxAttempts: 0
          Placement: {}
          ForceUpdate: 0
        Mode:
          Replicated:
            Replicas: 1
        UpdateConfig:
          Parallelism: 1
          Delay: 1000000000
          FailureAction: "pause"
          Monitor: 15000000000
          MaxFailureRatio: 0.15
        RollbackConfig:
          Parallelism: 1
          Delay: 1000000000
          FailureAction: "pause"
          Monitor: 15000000000
          MaxFailureRatio: 0.15
        EndpointSpec:
          Mode: "vip"
          Ports:
            -
              Protocol: "tcp"
              TargetPort: 6379
              PublishedPort: 30001
      Endpoint:
        Spec:
          Mode: "vip"
          Ports:
            -
              Protocol: "tcp"
              TargetPort: 6379
              PublishedPort: 30001
        Ports:
          -
            Protocol: "tcp"
            TargetPort: 6379
            PublishedPort: 30001
        VirtualIPs:
          -
            NetworkID: "4qvuz4ko70xaltuqbt8956gd1"
            Addr: "10.255.0.2/16"
          -
            NetworkID: "4qvuz4ko70xaltuqbt8956gd1"
            Addr: "10.255.0.3/16"
  ImageDeleteResponseItem:
    type: "object"
    properties:
      Untagged:
        description: "The image ID of an image that was untagged"
        type: "string"
      Deleted:
        description: "The image ID of an image that was deleted"
        type: "string"
  ServiceUpdateResponse:
    type: "object"
    properties:
      Warnings:
        description: "Optional warning messages"
        type: "array"
        items:
          type: "string"
    example:
      Warning: "unable to pin image doesnotexist:latest to digest: image library/doesnotexist:latest not found"
  ContainerSummary:
    type: "array"
    items:
      type: "object"
      properties:
        Id:
          description: "The ID of this container"
          type: "string"
          x-go-name: "ID"
        Names:
          description: "The names that this container has been given"
          type: "array"
          items:
            type: "string"
        Image:
          description: "The name of the image used when creating this container"
          type: "string"
        ImageID:
          description: "The ID of the image that this container was created from"
          type: "string"
        Command:
          description: "Command to run when starting the container"
          type: "string"
        Created:
          description: "When the container was created"
          type: "integer"
          format: "int64"
        Ports:
          description: "The ports exposed by this container"
          type: "array"
          items:
            $ref: "#/definitions/Port"
        SizeRw:
          description: "The size of files that have been created or changed by this container"
          type: "integer"
          format: "int64"
        SizeRootFs:
          description: "The total size of all the files in this container"
          type: "integer"
          format: "int64"
        Labels:
          description: "User-defined key/value metadata."
          type: "object"
          additionalProperties:
            type: "string"
        State:
          description: "The state of this container (e.g. `Exited`)"
          type: "string"
        Status:
          description: "Additional human-readable status of this container (e.g. `Exit 0`)"
          type: "string"
        HostConfig:
          type: "object"
          properties:
            NetworkMode:
              type: "string"
        NetworkSettings:
          description: "A summary of the container's network settings"
          type: "object"
          properties:
            Networks:
              type: "object"
              additionalProperties:
                $ref: "#/definitions/EndpointSettings"
        Mounts:
          type: "array"
          items:
            $ref: "#/definitions/MountPoint"
  SecretSpec:
    type: "object"
    properties:
      Name:
        description: "User-defined name of the secret."
        type: "string"
      Labels:
        description: "User-defined key/value metadata."
        type: "object"
        additionalProperties:
          type: "string"
      Data:
        description: "Base64-url-safe-encoded secret data"
        type: "array"
        items:
          type: "string"
  Secret:
    type: "object"
    properties:
      ID:
        type: "string"
      Version:
        $ref: "#/definitions/ObjectVersion"
      CreatedAt:
        type: "string"
        format: "dateTime"
      UpdatedAt:
        type: "string"
        format: "dateTime"
      Spec:
        $ref: "#/definitions/SecretSpec"
  ConfigSpec:
    type: "object"
    properties:
      Name:
        description: "User-defined name of the config."
        type: "string"
      Labels:
        description: "User-defined key/value metadata."
        type: "object"
        additionalProperties:
          type: "string"
      Data:
        description: "Base64-url-safe-encoded config data"
        type: "array"
        items:
          type: "string"
  Config:
    type: "object"
    properties:
      ID:
        type: "string"
      Version:
        $ref: "#/definitions/ObjectVersion"
      CreatedAt:
        type: "string"
        format: "dateTime"
      UpdatedAt:
        type: "string"
        format: "dateTime"
      Spec:
        $ref: "#/definitions/ConfigSpec"
@y
      Resources:
        description: "Resource requirements which apply to each individual container created as part of the service."
        type: "object"
        properties:
          Limits:
            description: "Define resources limits."
            type: "object"
            properties:
              NanoCPUs:
                description: "CPU limit in units of 10<sup>-9</sup> CPU shares."
                type: "integer"
                format: "int64"
              MemoryBytes:
                description: "Memory limit in Bytes."
                type: "integer"
                format: "int64"
          Reservations:
            description: "Define resources reservation."
            properties:
              NanoCPUs:
                description: "CPU reservation in units of 10<sup>-9</sup> CPU shares."
                type: "integer"
                format: "int64"
              MemoryBytes:
                description: "Memory reservation in Bytes."
                type: "integer"
                format: "int64"
      RestartPolicy:
        description: "Specification for the restart policy which applies to containers created as part of this service."
        type: "object"
        properties:
          Condition:
            description: "Condition for restart."
            type: "string"
            enum:
              - "none"
              - "on-failure"
              - "any"
          Delay:
            description: "Delay between restart attempts."
            type: "integer"
            format: "int64"
          MaxAttempts:
            description: "Maximum attempts to restart a given container before giving up (default value is 0, which is ignored)."
            type: "integer"
            format: "int64"
            default: 0
          Window:
            description: "Windows is the time window used to evaluate the restart policy (default value is 0, which is unbounded)."
            type: "integer"
            format: "int64"
            default: 0
      Placement:
        type: "object"
        properties:
          Constraints:
            description: "An array of constraints."
            type: "array"
            items:
              type: "string"
          Preferences:
            description: "Preferences provide a way to make the scheduler aware of factors such as topology. They are provided in order from highest to lowest precedence."
            type: "array"
            items:
              type: "object"
              properties:
                Spread:
                  type: "object"
                  properties:
                    SpreadDescriptor:
                      description: "label descriptor, such as engine.labels.az"
                      type: "string"
          Platforms:
            description: "An array of supported platforms."
            type: "array"
            items:
              type: "object"
              properties:
                Architecture:
                  type: "string"
                OS:
                  type: "string"
      ForceUpdate:
        description: "A counter that triggers an update even if no relevant parameters have been changed."
        type: "integer"
      Runtime:
        description: "Runtime is the type of runtime specified for the task executor."
        type: "string"
      Networks:
        type: "array"
        items:
          type: "object"
          properties:
            Target:
              type: "string"
            Aliases:
              type: "array"
              items:
                type: "string"
      LogDriver:
        description: "Specifies the log driver to use for tasks created from this spec. If not present, the default one for the swarm will be used, finally falling back to the engine default if not specified."
        type: "object"
        properties:
          Name:
            type: "string"
          Options:
            type: "object"
            additionalProperties:
              type: "string"
  TaskState:
    type: "string"
    enum:
      - "new"
      - "allocated"
      - "pending"
      - "assigned"
      - "accepted"
      - "preparing"
      - "ready"
      - "starting"
      - "running"
      - "complete"
      - "shutdown"
      - "failed"
      - "rejected"
  Task:
    type: "object"
    properties:
      ID:
        description: "The ID of the task."
        type: "string"
      Version:
        $ref: "#/definitions/ObjectVersion"
      CreatedAt:
        type: "string"
        format: "dateTime"
      UpdatedAt:
        type: "string"
        format: "dateTime"
      Name:
        description: "Name of the task."
        type: "string"
      Labels:
        description: "User-defined key/value metadata."
        type: "object"
        additionalProperties:
          type: "string"
      Spec:
        $ref: "#/definitions/TaskSpec"
      ServiceID:
        description: "The ID of the service this task is part of."
        type: "string"
      Slot:
        type: "integer"
      NodeID:
        description: "The ID of the node that this task is on."
        type: "string"
      Status:
        type: "object"
        properties:
          Timestamp:
            type: "string"
            format: "dateTime"
          State:
            $ref: "#/definitions/TaskState"
          Message:
            type: "string"
          Err:
            type: "string"
          ContainerStatus:
            type: "object"
            properties:
              ContainerID:
                type: "string"
              PID:
                type: "integer"
              ExitCode:
                type: "integer"
      DesiredState:
        $ref: "#/definitions/TaskState"
    example:
      ID: "0kzzo1i0y4jz6027t0k7aezc7"
      Version:
        Index: 71
      CreatedAt: "2016-06-07T21:07:31.171892745Z"
      UpdatedAt: "2016-06-07T21:07:31.376370513Z"
      Spec:
        ContainerSpec:
          Image: "redis"
        Resources:
          Limits: {}
          Reservations: {}
        RestartPolicy:
          Condition: "any"
          MaxAttempts: 0
        Placement: {}
      ServiceID: "9mnpnzenvg8p8tdbtq4wvbkcz"
      Slot: 1
      NodeID: "60gvrl6tm78dmak4yl7srz94v"
      Status:
        Timestamp: "2016-06-07T21:07:31.290032978Z"
        State: "running"
        Message: "started"
        ContainerStatus:
          ContainerID: "e5d62702a1b48d01c3e02ca1e0212a250801fa8d67caca0b6f35919ebc12f035"
          PID: 677
      DesiredState: "running"
      NetworksAttachments:
        - Network:
            ID: "4qvuz4ko70xaltuqbt8956gd1"
            Version:
              Index: 18
            CreatedAt: "2016-06-07T20:31:11.912919752Z"
            UpdatedAt: "2016-06-07T21:07:29.955277358Z"
            Spec:
              Name: "ingress"
              Labels:
                com.docker.swarm.internal: "true"
              DriverConfiguration: {}
              IPAMOptions:
                Driver: {}
                Configs:
                  - Subnet: "10.255.0.0/16"
                    Gateway: "10.255.0.1"
            DriverState:
              Name: "overlay"
              Options:
                com.docker.network.driver.overlay.vxlanid_list: "256"
            IPAMOptions:
              Driver:
                Name: "default"
              Configs:
                - Subnet: "10.255.0.0/16"
                  Gateway: "10.255.0.1"
          Addresses:
            - "10.255.0.10/16"
  ServiceSpec:
    description: "User modifiable configuration for a service."
    type: object
    properties:
      Name:
        description: "Name of the service."
        type: "string"
      Labels:
        description: "User-defined key/value metadata."
        type: "object"
        additionalProperties:
          type: "string"
      TaskTemplate:
        $ref: "#/definitions/TaskSpec"
      Mode:
        description: "Scheduling mode for the service."
        type: "object"
        properties:
          Replicated:
            type: "object"
            properties:
              Replicas:
                type: "integer"
                format: "int64"
          Global:
            type: "object"
      UpdateConfig:
        description: "Specification for the update strategy of the service."
        type: "object"
        properties:
          Parallelism:
            description: "Maximum number of tasks to be updated in one iteration (0 means unlimited parallelism)."
            type: "integer"
            format: "int64"
          Delay:
            description: "Amount of time between updates, in nanoseconds."
            type: "integer"
            format: "int64"
          FailureAction:
            description: "Action to take if an updated task fails to run, or stops running during the update."
            type: "string"
            enum:
              - "continue"
              - "pause"
              - "rollback"
          Monitor:
            description: "Amount of time to monitor each updated task for failures, in nanoseconds."
            type: "integer"
            format: "int64"
          MaxFailureRatio:
            description: "The fraction of tasks that may fail during an update before the failure action is invoked, specified as a floating point number between 0 and 1."
            type: "number"
            default: 0
          Order:
            description: "The order of operations when rolling out an updated task. Either the old task is shut down before the new task is started, or the new task is started before the old task is shut down."
            type: "string"
            enum:
              - "stop-first"
              - "start-first"
      RollbackConfig:
        description: "Specification for the rollback strategy of the service."
        type: "object"
        properties:
          Parallelism:
            description: "Maximum number of tasks to be rolled back in one iteration (0 means unlimited parallelism)."
            type: "integer"
            format: "int64"
          Delay:
            description: "Amount of time between rollback iterations, in nanoseconds."
            type: "integer"
            format: "int64"
          FailureAction:
            description: "Action to take if an rolled back task fails to run, or stops running during the rollback."
            type: "string"
            enum:
              - "continue"
              - "pause"
          Monitor:
            description: "Amount of time to monitor each rolled back task for failures, in nanoseconds."
            type: "integer"
            format: "int64"
          MaxFailureRatio:
            description: "The fraction of tasks that may fail during a rollback before the failure action is invoked, specified as a floating point number between 0 and 1."
            type: "number"
            default: 0
          Order:
            description: "The order of operations when rolling back a task. Either the old task is shut down before the new task is started, or the new task is started before the old task is shut down."
            type: "string"
            enum:
              - "stop-first"
              - "start-first"
      Networks:
        description: "Array of network names or IDs to attach the service to."
        type: "array"
        items:
          type: "object"
          properties:
            Target:
              type: "string"
            Aliases:
              type: "array"
              items:
                type: "string"
      EndpointSpec:
        $ref: "#/definitions/EndpointSpec"
  EndpointPortConfig:
    type: "object"
    properties:
      Name:
        type: "string"
      Protocol:
        type: "string"
        enum:
          - "tcp"
          - "udp"
      TargetPort:
        description: "The port inside the container."
        type: "integer"
      PublishedPort:
        description: "The port on the swarm hosts."
        type: "integer"
  EndpointSpec:
    description: "Properties that can be configured to access and load balance a service."
    type: "object"
    properties:
      Mode:
        description: "The mode of resolution to use for internal load balancing
      between tasks."
        type: "string"
        enum:
          - "vip"
          - "dnsrr"
        default: "vip"
      Ports:
        description: "List of exposed ports that this service is accessible on from the outside. Ports can only be provided if `vip` resolution mode is used."
        type: "array"
        items:
          $ref: "#/definitions/EndpointPortConfig"
  Service:
    type: "object"
    properties:
      ID:
        type: "string"
      Version:
        $ref: "#/definitions/ObjectVersion"
      CreatedAt:
        type: "string"
        format: "dateTime"
      UpdatedAt:
        type: "string"
        format: "dateTime"
      Spec:
        $ref: "#/definitions/ServiceSpec"
      Endpoint:
        type: "object"
        properties:
          Spec:
            $ref: "#/definitions/EndpointSpec"
          Ports:
            type: "array"
            items:
              $ref: "#/definitions/EndpointPortConfig"
          VirtualIPs:
            type: "array"
            items:
              type: "object"
              properties:
                NetworkID:
                  type: "string"
                Addr:
                  type: "string"
      UpdateStatus:
        description: "The status of a service update."
        type: "object"
        properties:
          State:
            type: "string"
            enum:
              - "updating"
              - "paused"
              - "completed"
          StartedAt:
            type: "string"
            format: "dateTime"
          CompletedAt:
            type: "string"
            format: "dateTime"
          Message:
            type: "string"
    example:
      ID: "9mnpnzenvg8p8tdbtq4wvbkcz"
      Version:
        Index: 19
      CreatedAt: "2016-06-07T21:05:51.880065305Z"
      UpdatedAt: "2016-06-07T21:07:29.962229872Z"
      Spec:
        Name: "hopeful_cori"
        TaskTemplate:
          ContainerSpec:
            Image: "redis"
          Resources:
            Limits: {}
            Reservations: {}
          RestartPolicy:
            Condition: "any"
            MaxAttempts: 0
          Placement: {}
          ForceUpdate: 0
        Mode:
          Replicated:
            Replicas: 1
        UpdateConfig:
          Parallelism: 1
          Delay: 1000000000
          FailureAction: "pause"
          Monitor: 15000000000
          MaxFailureRatio: 0.15
        RollbackConfig:
          Parallelism: 1
          Delay: 1000000000
          FailureAction: "pause"
          Monitor: 15000000000
          MaxFailureRatio: 0.15
        EndpointSpec:
          Mode: "vip"
          Ports:
            -
              Protocol: "tcp"
              TargetPort: 6379
              PublishedPort: 30001
      Endpoint:
        Spec:
          Mode: "vip"
          Ports:
            -
              Protocol: "tcp"
              TargetPort: 6379
              PublishedPort: 30001
        Ports:
          -
            Protocol: "tcp"
            TargetPort: 6379
            PublishedPort: 30001
        VirtualIPs:
          -
            NetworkID: "4qvuz4ko70xaltuqbt8956gd1"
            Addr: "10.255.0.2/16"
          -
            NetworkID: "4qvuz4ko70xaltuqbt8956gd1"
            Addr: "10.255.0.3/16"
  ImageDeleteResponseItem:
    type: "object"
    properties:
      Untagged:
        description: "The image ID of an image that was untagged"
        type: "string"
      Deleted:
        description: "The image ID of an image that was deleted"
        type: "string"
  ServiceUpdateResponse:
    type: "object"
    properties:
      Warnings:
        description: "Optional warning messages"
        type: "array"
        items:
          type: "string"
    example:
      Warning: "unable to pin image doesnotexist:latest to digest: image library/doesnotexist:latest not found"
  ContainerSummary:
    type: "array"
    items:
      type: "object"
      properties:
        Id:
          description: "The ID of this container"
          type: "string"
          x-go-name: "ID"
        Names:
          description: "The names that this container has been given"
          type: "array"
          items:
            type: "string"
        Image:
          description: "The name of the image used when creating this container"
          type: "string"
        ImageID:
          description: "The ID of the image that this container was created from"
          type: "string"
        Command:
          description: "Command to run when starting the container"
          type: "string"
        Created:
          description: "When the container was created"
          type: "integer"
          format: "int64"
        Ports:
          description: "The ports exposed by this container"
          type: "array"
          items:
            $ref: "#/definitions/Port"
        SizeRw:
          description: "The size of files that have been created or changed by this container"
          type: "integer"
          format: "int64"
        SizeRootFs:
          description: "The total size of all the files in this container"
          type: "integer"
          format: "int64"
        Labels:
          description: "User-defined key/value metadata."
          type: "object"
          additionalProperties:
            type: "string"
        State:
          description: "The state of this container (e.g. `Exited`)"
          type: "string"
        Status:
          description: "Additional human-readable status of this container (e.g. `Exit 0`)"
          type: "string"
        HostConfig:
          type: "object"
          properties:
            NetworkMode:
              type: "string"
        NetworkSettings:
          description: "A summary of the container's network settings"
          type: "object"
          properties:
            Networks:
              type: "object"
              additionalProperties:
                $ref: "#/definitions/EndpointSettings"
        Mounts:
          type: "array"
          items:
            $ref: "#/definitions/MountPoint"
  SecretSpec:
    type: "object"
    properties:
      Name:
        description: "User-defined name of the secret."
        type: "string"
      Labels:
        description: "User-defined key/value metadata."
        type: "object"
        additionalProperties:
          type: "string"
      Data:
        description: "Base64-url-safe-encoded secret data"
        type: "array"
        items:
          type: "string"
  Secret:
    type: "object"
    properties:
      ID:
        type: "string"
      Version:
        $ref: "#/definitions/ObjectVersion"
      CreatedAt:
        type: "string"
        format: "dateTime"
      UpdatedAt:
        type: "string"
        format: "dateTime"
      Spec:
        $ref: "#/definitions/SecretSpec"
  ConfigSpec:
    type: "object"
    properties:
      Name:
        description: "User-defined name of the config."
        type: "string"
      Labels:
        description: "User-defined key/value metadata."
        type: "object"
        additionalProperties:
          type: "string"
      Data:
        description: "Base64-url-safe-encoded config data"
        type: "array"
        items:
          type: "string"
  Config:
    type: "object"
    properties:
      ID:
        type: "string"
      Version:
        $ref: "#/definitions/ObjectVersion"
      CreatedAt:
        type: "string"
        format: "dateTime"
      UpdatedAt:
        type: "string"
        format: "dateTime"
      Spec:
        $ref: "#/definitions/ConfigSpec"
@z

@x
paths:
  /containers/json:
    get:
      summary: "List containers"
      operationId: "ContainerList"
      produces:
        - "application/json"
      parameters:
        - name: "all"
          in: "query"
          description: "Return all containers. By default, only running containers are shown"
          type: "boolean"
          default: false
        - name: "limit"
          in: "query"
          description: "Return this number of most recently created containers, including non-running ones."
          type: "integer"
        - name: "size"
          in: "query"
          description: "Return the size of container as fields `SizeRw` and `SizeRootFs`."
          type: "boolean"
          default: false
        - name: "filters"
          in: "query"
          description: |
            Filters to process on the container list, encoded as JSON (a `map[string][]string`). For example, `{"status": ["paused"]}` will only return paused containers. Available filters:
@y
paths:
  /containers/json:
    get:
      summary: "List containers"
      operationId: "ContainerList"
      produces:
        - "application/json"
      parameters:
        - name: "all"
          in: "query"
          description: "Return all containers. By default, only running containers are shown"
          type: "boolean"
          default: false
        - name: "limit"
          in: "query"
          description: "Return this number of most recently created containers, including non-running ones."
          type: "integer"
        - name: "size"
          in: "query"
          description: "Return the size of container as fields `SizeRw` and `SizeRootFs`."
          type: "boolean"
          default: false
        - name: "filters"
          in: "query"
          description: |
            Filters to process on the container list, encoded as JSON (a `map[string][]string`). For example, `{"status": ["paused"]}` will only return paused containers. Available filters:
@z

@x
            - `ancestor`=(`<image-name>[:<tag>]`, `<image id>`, or `<image@digest>`)
            - `before`=(`<container id>` or `<container name>`)
            - `expose`=(`<port>[/<proto>]`|`<startport-endport>/[<proto>]`)
            - `exited=<int>` containers with exit code of `<int>`
            - `health`=(`starting`|`healthy`|`unhealthy`|`none`)
            - `id=<ID>` a container's ID
            - `isolation=`(`default`|`process`|`hyperv`) (Windows daemon only)
            - `is-task=`(`true`|`false`)
            - `label=key` or `label="key=value"` of a container label
            - `name=<name>` a container's name
            - `network`=(`<network id>` or `<network name>`)
            - `publish`=(`<port>[/<proto>]`|`<startport-endport>/[<proto>]`)
            - `since`=(`<container id>` or `<container name>`)
            - `status=`(`created`|`restarting`|`running`|`removing`|`paused`|`exited`|`dead`)
            - `volume`=(`<volume name>` or `<mount point destination>`)
          type: "string"
      responses:
        200:
          description: "no error"
          schema:
            $ref: "#/definitions/ContainerSummary"
          examples:
            application/json:
              - Id: "8dfafdbc3a40"
                Names:
                  - "/boring_feynman"
                Image: "ubuntu:latest"
                ImageID: "d74508fb6632491cea586a1fd7d748dfc5274cd6fdfedee309ecdcbc2bf5cb82"
                Command: "echo 1"
                Created: 1367854155
                State: "Exited"
                Status: "Exit 0"
                Ports:
                  - PrivatePort: 2222
                    PublicPort: 3333
                    Type: "tcp"
                Labels:
                  com.example.vendor: "Acme"
                  com.example.license: "GPL"
                  com.example.version: "1.0"
                SizeRw: 12288
                SizeRootFs: 0
                HostConfig:
                  NetworkMode: "default"
                NetworkSettings:
                  Networks:
                    bridge:
                      NetworkID: "7ea29fc1412292a2d7bba362f9253545fecdfa8ce9a6e37dd10ba8bee7129812"
                      EndpointID: "2cdc4edb1ded3631c81f57966563e5c8525b81121bb3706a9a9a3ae102711f3f"
                      Gateway: "172.17.0.1"
                      IPAddress: "172.17.0.2"
                      IPPrefixLen: 16
                      IPv6Gateway: ""
                      GlobalIPv6Address: ""
                      GlobalIPv6PrefixLen: 0
                      MacAddress: "02:42:ac:11:00:02"
                Mounts:
                  - Name: "fac362...80535"
                    Source: "/data"
                    Destination: "/data"
                    Driver: "local"
                    Mode: "ro,Z"
                    RW: false
                    Propagation: ""
              - Id: "9cd87474be90"
                Names:
                  - "/coolName"
                Image: "ubuntu:latest"
                ImageID: "d74508fb6632491cea586a1fd7d748dfc5274cd6fdfedee309ecdcbc2bf5cb82"
                Command: "echo 222222"
                Created: 1367854155
                State: "Exited"
                Status: "Exit 0"
                Ports: []
                Labels: {}
                SizeRw: 12288
                SizeRootFs: 0
                HostConfig:
                  NetworkMode: "default"
                NetworkSettings:
                  Networks:
                    bridge:
                      NetworkID: "7ea29fc1412292a2d7bba362f9253545fecdfa8ce9a6e37dd10ba8bee7129812"
                      EndpointID: "88eaed7b37b38c2a3f0c4bc796494fdf51b270c2d22656412a2ca5d559a64d7a"
                      Gateway: "172.17.0.1"
                      IPAddress: "172.17.0.8"
                      IPPrefixLen: 16
                      IPv6Gateway: ""
                      GlobalIPv6Address: ""
                      GlobalIPv6PrefixLen: 0
                      MacAddress: "02:42:ac:11:00:08"
                Mounts: []
              - Id: "3176a2479c92"
                Names:
                  - "/sleepy_dog"
                Image: "ubuntu:latest"
                ImageID: "d74508fb6632491cea586a1fd7d748dfc5274cd6fdfedee309ecdcbc2bf5cb82"
                Command: "echo 3333333333333333"
                Created: 1367854154
                State: "Exited"
                Status: "Exit 0"
                Ports: []
                Labels: {}
                SizeRw: 12288
                SizeRootFs: 0
                HostConfig:
                  NetworkMode: "default"
                NetworkSettings:
                  Networks:
                    bridge:
                      NetworkID: "7ea29fc1412292a2d7bba362f9253545fecdfa8ce9a6e37dd10ba8bee7129812"
                      EndpointID: "8b27c041c30326d59cd6e6f510d4f8d1d570a228466f956edf7815508f78e30d"
                      Gateway: "172.17.0.1"
                      IPAddress: "172.17.0.6"
                      IPPrefixLen: 16
                      IPv6Gateway: ""
                      GlobalIPv6Address: ""
                      GlobalIPv6PrefixLen: 0
                      MacAddress: "02:42:ac:11:00:06"
                Mounts: []
              - Id: "4cb07b47f9fb"
                Names:
                  - "/running_cat"
                Image: "ubuntu:latest"
                ImageID: "d74508fb6632491cea586a1fd7d748dfc5274cd6fdfedee309ecdcbc2bf5cb82"
                Command: "echo 444444444444444444444444444444444"
                Created: 1367854152
                State: "Exited"
                Status: "Exit 0"
                Ports: []
                Labels: {}
                SizeRw: 12288
                SizeRootFs: 0
                HostConfig:
                  NetworkMode: "default"
                NetworkSettings:
                  Networks:
                    bridge:
                      NetworkID: "7ea29fc1412292a2d7bba362f9253545fecdfa8ce9a6e37dd10ba8bee7129812"
                      EndpointID: "d91c7b2f0644403d7ef3095985ea0e2370325cd2332ff3a3225c4247328e66e9"
                      Gateway: "172.17.0.1"
                      IPAddress: "172.17.0.5"
                      IPPrefixLen: 16
                      IPv6Gateway: ""
                      GlobalIPv6Address: ""
                      GlobalIPv6PrefixLen: 0
                      MacAddress: "02:42:ac:11:00:05"
                Mounts: []
        400:
          description: "bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      tags: ["Container"]
  /containers/create:
    post:
      summary: "Create a container"
      operationId: "ContainerCreate"
      consumes:
        - "application/json"
        - "application/octet-stream"
      produces:
        - "application/json"
      parameters:
        - name: "name"
          in: "query"
          description: "Assign the specified name to the container. Must match `/?[a-zA-Z0-9_-]+`."
          type: "string"
          pattern: "/?[a-zA-Z0-9_-]+"
        - name: "body"
          in: "body"
          description: "Container to create"
          schema:
            allOf:
              - $ref: "#/definitions/ContainerConfig"
              - type: "object"
                properties:
                  HostConfig:
                    $ref: "#/definitions/HostConfig"
                  NetworkingConfig:
                    description: "This container's networking configuration."
                    type: "object"
                    properties:
                      EndpointsConfig:
                        description: "A mapping of network name to endpoint configuration for that network."
                        type: "object"
                        additionalProperties:
                          $ref: "#/definitions/EndpointSettings"
            example:
              Hostname: ""
              Domainname: ""
              User: ""
              AttachStdin: false
              AttachStdout: true
              AttachStderr: true
              Tty: false
              OpenStdin: false
              StdinOnce: false
              Env:
                - "FOO=bar"
                - "BAZ=quux"
              Cmd:
                - "date"
              Entrypoint: ""
              Image: "ubuntu"
              Labels:
                com.example.vendor: "Acme"
                com.example.license: "GPL"
                com.example.version: "1.0"
              Volumes:
                /volumes/data: {}
              WorkingDir: ""
              NetworkDisabled: false
              MacAddress: "12:34:56:78:9a:bc"
              ExposedPorts:
                22/tcp: {}
              StopSignal: "SIGTERM"
              StopTimeout: 10
              HostConfig:
                Binds:
                  - "/tmp:/tmp"
                Links:
                  - "redis3:redis"
                Memory: 0
                MemorySwap: 0
                MemoryReservation: 0
                KernelMemory: 0
                NanoCpus: 500000
                CpuPercent: 80
                CpuShares: 512
                CpuPeriod: 100000
                CpuRealtimePeriod: 1000000
                CpuRealtimeRuntime: 10000
                CpuQuota: 50000
                CpusetCpus: "0,1"
                CpusetMems: "0,1"
                MaximumIOps: 0
                MaximumIOBps: 0
                BlkioWeight: 300
                BlkioWeightDevice:
                  - {}
                BlkioDeviceReadBps:
                  - {}
                BlkioDeviceReadIOps:
                  - {}
                BlkioDeviceWriteBps:
                  - {}
                BlkioDeviceWriteIOps:
                  - {}
                MemorySwappiness: 60
                OomKillDisable: false
                OomScoreAdj: 500
                PidMode: ""
                PidsLimit: -1
                PortBindings:
                  22/tcp:
                    - HostPort: "11022"
                PublishAllPorts: false
                Privileged: false
                ReadonlyRootfs: false
                Dns:
                  - "8.8.8.8"
                DnsOptions:
                  - ""
                DnsSearch:
                  - ""
                VolumesFrom:
                  - "parent"
                  - "other:ro"
                CapAdd:
                  - "NET_ADMIN"
                CapDrop:
                  - "MKNOD"
                GroupAdd:
                  - "newgroup"
                RestartPolicy:
                  Name: ""
                  MaximumRetryCount: 0
                AutoRemove: true
                NetworkMode: "bridge"
                Devices: []
                Ulimits:
                  - {}
                LogConfig:
                  Type: "json-file"
                  Config: {}
                SecurityOpt: []
                StorageOpt: {}
                CgroupParent: ""
                VolumeDriver: ""
                ShmSize: 67108864
              NetworkingConfig:
                EndpointsConfig:
                  isolated_nw:
                    IPAMConfig:
                      IPv4Address: "172.20.30.33"
                      IPv6Address: "2001:db8:abcd::3033"
                      LinkLocalIPs:
                        - "169.254.34.68"
                        - "fe80::3468"
                    Links:
                      - "container_1"
                      - "container_2"
                    Aliases:
                      - "server_x"
                      - "server_y"
@y
            - `ancestor`=(`<image-name>[:<tag>]`, `<image id>`, or `<image@digest>`)
            - `before`=(`<container id>` or `<container name>`)
            - `expose`=(`<port>[/<proto>]`|`<startport-endport>/[<proto>]`)
            - `exited=<int>` containers with exit code of `<int>`
            - `health`=(`starting`|`healthy`|`unhealthy`|`none`)
            - `id=<ID>` a container's ID
            - `isolation=`(`default`|`process`|`hyperv`) (Windows daemon only)
            - `is-task=`(`true`|`false`)
            - `label=key` or `label="key=value"` of a container label
            - `name=<name>` a container's name
            - `network`=(`<network id>` or `<network name>`)
            - `publish`=(`<port>[/<proto>]`|`<startport-endport>/[<proto>]`)
            - `since`=(`<container id>` or `<container name>`)
            - `status=`(`created`|`restarting`|`running`|`removing`|`paused`|`exited`|`dead`)
            - `volume`=(`<volume name>` or `<mount point destination>`)
          type: "string"
      responses:
        200:
          description: "no error"
          schema:
            $ref: "#/definitions/ContainerSummary"
          examples:
            application/json:
              - Id: "8dfafdbc3a40"
                Names:
                  - "/boring_feynman"
                Image: "ubuntu:latest"
                ImageID: "d74508fb6632491cea586a1fd7d748dfc5274cd6fdfedee309ecdcbc2bf5cb82"
                Command: "echo 1"
                Created: 1367854155
                State: "Exited"
                Status: "Exit 0"
                Ports:
                  - PrivatePort: 2222
                    PublicPort: 3333
                    Type: "tcp"
                Labels:
                  com.example.vendor: "Acme"
                  com.example.license: "GPL"
                  com.example.version: "1.0"
                SizeRw: 12288
                SizeRootFs: 0
                HostConfig:
                  NetworkMode: "default"
                NetworkSettings:
                  Networks:
                    bridge:
                      NetworkID: "7ea29fc1412292a2d7bba362f9253545fecdfa8ce9a6e37dd10ba8bee7129812"
                      EndpointID: "2cdc4edb1ded3631c81f57966563e5c8525b81121bb3706a9a9a3ae102711f3f"
                      Gateway: "172.17.0.1"
                      IPAddress: "172.17.0.2"
                      IPPrefixLen: 16
                      IPv6Gateway: ""
                      GlobalIPv6Address: ""
                      GlobalIPv6PrefixLen: 0
                      MacAddress: "02:42:ac:11:00:02"
                Mounts:
                  - Name: "fac362...80535"
                    Source: "/data"
                    Destination: "/data"
                    Driver: "local"
                    Mode: "ro,Z"
                    RW: false
                    Propagation: ""
              - Id: "9cd87474be90"
                Names:
                  - "/coolName"
                Image: "ubuntu:latest"
                ImageID: "d74508fb6632491cea586a1fd7d748dfc5274cd6fdfedee309ecdcbc2bf5cb82"
                Command: "echo 222222"
                Created: 1367854155
                State: "Exited"
                Status: "Exit 0"
                Ports: []
                Labels: {}
                SizeRw: 12288
                SizeRootFs: 0
                HostConfig:
                  NetworkMode: "default"
                NetworkSettings:
                  Networks:
                    bridge:
                      NetworkID: "7ea29fc1412292a2d7bba362f9253545fecdfa8ce9a6e37dd10ba8bee7129812"
                      EndpointID: "88eaed7b37b38c2a3f0c4bc796494fdf51b270c2d22656412a2ca5d559a64d7a"
                      Gateway: "172.17.0.1"
                      IPAddress: "172.17.0.8"
                      IPPrefixLen: 16
                      IPv6Gateway: ""
                      GlobalIPv6Address: ""
                      GlobalIPv6PrefixLen: 0
                      MacAddress: "02:42:ac:11:00:08"
                Mounts: []
              - Id: "3176a2479c92"
                Names:
                  - "/sleepy_dog"
                Image: "ubuntu:latest"
                ImageID: "d74508fb6632491cea586a1fd7d748dfc5274cd6fdfedee309ecdcbc2bf5cb82"
                Command: "echo 3333333333333333"
                Created: 1367854154
                State: "Exited"
                Status: "Exit 0"
                Ports: []
                Labels: {}
                SizeRw: 12288
                SizeRootFs: 0
                HostConfig:
                  NetworkMode: "default"
                NetworkSettings:
                  Networks:
                    bridge:
                      NetworkID: "7ea29fc1412292a2d7bba362f9253545fecdfa8ce9a6e37dd10ba8bee7129812"
                      EndpointID: "8b27c041c30326d59cd6e6f510d4f8d1d570a228466f956edf7815508f78e30d"
                      Gateway: "172.17.0.1"
                      IPAddress: "172.17.0.6"
                      IPPrefixLen: 16
                      IPv6Gateway: ""
                      GlobalIPv6Address: ""
                      GlobalIPv6PrefixLen: 0
                      MacAddress: "02:42:ac:11:00:06"
                Mounts: []
              - Id: "4cb07b47f9fb"
                Names:
                  - "/running_cat"
                Image: "ubuntu:latest"
                ImageID: "d74508fb6632491cea586a1fd7d748dfc5274cd6fdfedee309ecdcbc2bf5cb82"
                Command: "echo 444444444444444444444444444444444"
                Created: 1367854152
                State: "Exited"
                Status: "Exit 0"
                Ports: []
                Labels: {}
                SizeRw: 12288
                SizeRootFs: 0
                HostConfig:
                  NetworkMode: "default"
                NetworkSettings:
                  Networks:
                    bridge:
                      NetworkID: "7ea29fc1412292a2d7bba362f9253545fecdfa8ce9a6e37dd10ba8bee7129812"
                      EndpointID: "d91c7b2f0644403d7ef3095985ea0e2370325cd2332ff3a3225c4247328e66e9"
                      Gateway: "172.17.0.1"
                      IPAddress: "172.17.0.5"
                      IPPrefixLen: 16
                      IPv6Gateway: ""
                      GlobalIPv6Address: ""
                      GlobalIPv6PrefixLen: 0
                      MacAddress: "02:42:ac:11:00:05"
                Mounts: []
        400:
          description: "bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      tags: ["Container"]
  /containers/create:
    post:
      summary: "Create a container"
      operationId: "ContainerCreate"
      consumes:
        - "application/json"
        - "application/octet-stream"
      produces:
        - "application/json"
      parameters:
        - name: "name"
          in: "query"
          description: "Assign the specified name to the container. Must match `/?[a-zA-Z0-9_-]+`."
          type: "string"
          pattern: "/?[a-zA-Z0-9_-]+"
        - name: "body"
          in: "body"
          description: "Container to create"
          schema:
            allOf:
              - $ref: "#/definitions/ContainerConfig"
              - type: "object"
                properties:
                  HostConfig:
                    $ref: "#/definitions/HostConfig"
                  NetworkingConfig:
                    description: "This container's networking configuration."
                    type: "object"
                    properties:
                      EndpointsConfig:
                        description: "A mapping of network name to endpoint configuration for that network."
                        type: "object"
                        additionalProperties:
                          $ref: "#/definitions/EndpointSettings"
            example:
              Hostname: ""
              Domainname: ""
              User: ""
              AttachStdin: false
              AttachStdout: true
              AttachStderr: true
              Tty: false
              OpenStdin: false
              StdinOnce: false
              Env:
                - "FOO=bar"
                - "BAZ=quux"
              Cmd:
                - "date"
              Entrypoint: ""
              Image: "ubuntu"
              Labels:
                com.example.vendor: "Acme"
                com.example.license: "GPL"
                com.example.version: "1.0"
              Volumes:
                /volumes/data: {}
              WorkingDir: ""
              NetworkDisabled: false
              MacAddress: "12:34:56:78:9a:bc"
              ExposedPorts:
                22/tcp: {}
              StopSignal: "SIGTERM"
              StopTimeout: 10
              HostConfig:
                Binds:
                  - "/tmp:/tmp"
                Links:
                  - "redis3:redis"
                Memory: 0
                MemorySwap: 0
                MemoryReservation: 0
                KernelMemory: 0
                NanoCpus: 500000
                CpuPercent: 80
                CpuShares: 512
                CpuPeriod: 100000
                CpuRealtimePeriod: 1000000
                CpuRealtimeRuntime: 10000
                CpuQuota: 50000
                CpusetCpus: "0,1"
                CpusetMems: "0,1"
                MaximumIOps: 0
                MaximumIOBps: 0
                BlkioWeight: 300
                BlkioWeightDevice:
                  - {}
                BlkioDeviceReadBps:
                  - {}
                BlkioDeviceReadIOps:
                  - {}
                BlkioDeviceWriteBps:
                  - {}
                BlkioDeviceWriteIOps:
                  - {}
                MemorySwappiness: 60
                OomKillDisable: false
                OomScoreAdj: 500
                PidMode: ""
                PidsLimit: -1
                PortBindings:
                  22/tcp:
                    - HostPort: "11022"
                PublishAllPorts: false
                Privileged: false
                ReadonlyRootfs: false
                Dns:
                  - "8.8.8.8"
                DnsOptions:
                  - ""
                DnsSearch:
                  - ""
                VolumesFrom:
                  - "parent"
                  - "other:ro"
                CapAdd:
                  - "NET_ADMIN"
                CapDrop:
                  - "MKNOD"
                GroupAdd:
                  - "newgroup"
                RestartPolicy:
                  Name: ""
                  MaximumRetryCount: 0
                AutoRemove: true
                NetworkMode: "bridge"
                Devices: []
                Ulimits:
                  - {}
                LogConfig:
                  Type: "json-file"
                  Config: {}
                SecurityOpt: []
                StorageOpt: {}
                CgroupParent: ""
                VolumeDriver: ""
                ShmSize: 67108864
              NetworkingConfig:
                EndpointsConfig:
                  isolated_nw:
                    IPAMConfig:
                      IPv4Address: "172.20.30.33"
                      IPv6Address: "2001:db8:abcd::3033"
                      LinkLocalIPs:
                        - "169.254.34.68"
                        - "fe80::3468"
                    Links:
                      - "container_1"
                      - "container_2"
                    Aliases:
                      - "server_x"
                      - "server_y"
@z

@x
          required: true
      responses:
        201:
          description: "Container created successfully"
          schema:
            type: "object"
            required: [Id, Warnings]
            properties:
              Id:
                description: "The ID of the created container"
                type: "string"
                x-nullable: false
              Warnings:
                description: "Warnings encountered when creating the container"
                type: "array"
                x-nullable: false
                items:
                  type: "string"
          examples:
            application/json:
              Id: "e90e34656806"
              Warnings: []
        400:
          description: "bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "no such image"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such image: c2ada9df5af8"
        406:
          description: "impossible to attach"
          schema:
            $ref: "#/definitions/ErrorResponse"
        409:
          description: "conflict"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      tags: ["Container"]
  /containers/{id}/json:
    get:
      summary: "Inspect a container"
      description: "Return low-level information about a container."
      operationId: "ContainerInspect"
      produces:
        - "application/json"
      responses:
        200:
          description: "no error"
          schema:
            type: "object"
            properties:
              Id:
                description: "The ID of the container"
                type: "string"
              Created:
                description: "The time the container was created"
                type: "string"
              Path:
                description: "The path to the command being run"
                type: "string"
              Args:
                description: "The arguments to the command being run"
                type: "array"
                items:
                  type: "string"
              State:
                description: "The state of the container."
                type: "object"
                properties:
                  Status:
                    description: |
                      The status of the container. For example, `"running"` or `"exited"`.
                    type: "string"
                    enum: ["created", "running", "paused", "restarting", "removing", "exited", "dead"]
                  Running:
                    description: |
                      Whether this container is running.
@y
          required: true
      responses:
        201:
          description: "Container created successfully"
          schema:
            type: "object"
            required: [Id, Warnings]
            properties:
              Id:
                description: "The ID of the created container"
                type: "string"
                x-nullable: false
              Warnings:
                description: "Warnings encountered when creating the container"
                type: "array"
                x-nullable: false
                items:
                  type: "string"
          examples:
            application/json:
              Id: "e90e34656806"
              Warnings: []
        400:
          description: "bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "no such image"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such image: c2ada9df5af8"
        406:
          description: "impossible to attach"
          schema:
            $ref: "#/definitions/ErrorResponse"
        409:
          description: "conflict"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      tags: ["Container"]
  /containers/{id}/json:
    get:
      summary: "Inspect a container"
      description: "Return low-level information about a container."
      operationId: "ContainerInspect"
      produces:
        - "application/json"
      responses:
        200:
          description: "no error"
          schema:
            type: "object"
            properties:
              Id:
                description: "The ID of the container"
                type: "string"
              Created:
                description: "The time the container was created"
                type: "string"
              Path:
                description: "The path to the command being run"
                type: "string"
              Args:
                description: "The arguments to the command being run"
                type: "array"
                items:
                  type: "string"
              State:
                description: "The state of the container."
                type: "object"
                properties:
                  Status:
                    description: |
                      The status of the container. For example, `"running"` or `"exited"`.
                    type: "string"
                    enum: ["created", "running", "paused", "restarting", "removing", "exited", "dead"]
                  Running:
                    description: |
                      Whether this container is running.
@z

@x
                      Note that a running container can be _paused_. The `Running` and `Paused`
                      booleans are not mutually exclusive:
@y
                      Note that a running container can be _paused_. The `Running` and `Paused`
                      booleans are not mutually exclusive:
@z

@x
                      When pausing a container (on Linux), the cgroups freezer is used to suspend
                      all processes in the container. Freezing the process requires the process to
                      be running. As a result, paused containers are both `Running` _and_ `Paused`.
@y
                      When pausing a container (on Linux), the cgroups freezer is used to suspend
                      all processes in the container. Freezing the process requires the process to
                      be running. As a result, paused containers are both `Running` _and_ `Paused`.
@z

@x
                      Use the `Status` field instead to determine if a container's state is "running".
                    type: "boolean"
                  Paused:
                    description: "Whether this container is paused."
                    type: "boolean"
                  Restarting:
                    description: "Whether this container is restarting."
                    type: "boolean"
                  OOMKilled:
                    description: "Whether this container has been killed because it ran out of memory."
                    type: "boolean"
                  Dead:
                    type: "boolean"
                  Pid:
                    description: "The process ID of this container"
                    type: "integer"
                  ExitCode:
                    description: "The last exit code of this container"
                    type: "integer"
                  Error:
                    type: "string"
                  StartedAt:
                    description: "The time when this container was last started."
                    type: "string"
                  FinishedAt:
                    description: "The time when this container last exited."
                    type: "string"
              Image:
                description: "The container's image"
                type: "string"
              ResolvConfPath:
                type: "string"
              HostnamePath:
                type: "string"
              HostsPath:
                type: "string"
              LogPath:
                type: "string"
              Node:
                description: "TODO"
                type: "object"
              Name:
                type: "string"
              RestartCount:
                type: "integer"
              Driver:
                type: "string"
              MountLabel:
                type: "string"
              ProcessLabel:
                type: "string"
              AppArmorProfile:
                type: "string"
              ExecIDs:
                type: "string"
              HostConfig:
                $ref: "#/definitions/HostConfig"
              GraphDriver:
                $ref: "#/definitions/GraphDriverData"
              SizeRw:
                description: "The size of files that have been created or changed by this container."
                type: "integer"
                format: "int64"
              SizeRootFs:
                description: "The total size of all the files in this container."
                type: "integer"
                format: "int64"
              Mounts:
                type: "array"
                items:
                  $ref: "#/definitions/MountPoint"
              Config:
                $ref: "#/definitions/ContainerConfig"
              NetworkSettings:
                $ref: "#/definitions/NetworkConfig"
          examples:
            application/json:
              AppArmorProfile: ""
              Args:
                - "-c"
                - "exit 9"
              Config:
                AttachStderr: true
                AttachStdin: false
                AttachStdout: true
                Cmd:
                  - "/bin/sh"
                  - "-c"
                  - "exit 9"
                Domainname: ""
                Env:
                  - "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
                Hostname: "ba033ac44011"
                Image: "ubuntu"
                Labels:
                  com.example.vendor: "Acme"
                  com.example.license: "GPL"
                  com.example.version: "1.0"
                MacAddress: ""
                NetworkDisabled: false
                OpenStdin: false
                StdinOnce: false
                Tty: false
                User: ""
                Volumes:
                  /volumes/data: {}
                WorkingDir: ""
                StopSignal: "SIGTERM"
                StopTimeout: 10
              Created: "2015-01-06T15:47:31.485331387Z"
              Driver: "overlay2"
              HostConfig:
                MaximumIOps: 0
                MaximumIOBps: 0
                BlkioWeight: 0
                BlkioWeightDevice:
                  - {}
                BlkioDeviceReadBps:
                  - {}
                BlkioDeviceWriteBps:
                  - {}
                BlkioDeviceReadIOps:
                  - {}
                BlkioDeviceWriteIOps:
                  - {}
                ContainerIDFile: ""
                CpusetCpus: ""
                CpusetMems: ""
                CpuPercent: 80
                CpuShares: 0
                CpuPeriod: 100000
                CpuRealtimePeriod: 1000000
                CpuRealtimeRuntime: 10000
                Devices: []
                IpcMode: ""
                Memory: 0
                MemorySwap: 0
                MemoryReservation: 0
                KernelMemory: 0
                OomKillDisable: false
                OomScoreAdj: 500
                NetworkMode: "bridge"
                PidMode: ""
                PortBindings: {}
                Privileged: false
                ReadonlyRootfs: false
                PublishAllPorts: false
                RestartPolicy:
                  MaximumRetryCount: 2
                  Name: "on-failure"
                LogConfig:
                  Type: "json-file"
                Sysctls:
                  net.ipv4.ip_forward: "1"
                Ulimits:
                  - {}
                VolumeDriver: ""
                ShmSize: 67108864
              HostnamePath: "/var/lib/docker/containers/ba033ac4401106a3b513bc9d639eee123ad78ca3616b921167cd74b20e25ed39/hostname"
              HostsPath: "/var/lib/docker/containers/ba033ac4401106a3b513bc9d639eee123ad78ca3616b921167cd74b20e25ed39/hosts"
              LogPath: "/var/lib/docker/containers/1eb5fabf5a03807136561b3c00adcd2992b535d624d5e18b6cdc6a6844d9767b/1eb5fabf5a03807136561b3c00adcd2992b535d624d5e18b6cdc6a6844d9767b-json.log"
              Id: "ba033ac4401106a3b513bc9d639eee123ad78ca3616b921167cd74b20e25ed39"
              Image: "04c5d3b7b0656168630d3ba35d8889bd0e9caafcaeb3004d2bfbc47e7c5d35d2"
              MountLabel: ""
              Name: "/boring_euclid"
              NetworkSettings:
                Bridge: ""
                SandboxID: ""
                HairpinMode: false
                LinkLocalIPv6Address: ""
                LinkLocalIPv6PrefixLen: 0
                SandboxKey: ""
                SecondaryIPAddresses: null
                SecondaryIPv6Addresses: null
                EndpointID: ""
                Gateway: ""
                GlobalIPv6Address: ""
                GlobalIPv6PrefixLen: 0
                IPAddress: ""
                IPPrefixLen: 0
                IPv6Gateway: ""
                MacAddress: ""
                Networks:
                  bridge:
                    NetworkID: "7ea29fc1412292a2d7bba362f9253545fecdfa8ce9a6e37dd10ba8bee7129812"
                    EndpointID: "7587b82f0dada3656fda26588aee72630c6fab1536d36e394b2bfbcf898c971d"
                    Gateway: "172.17.0.1"
                    IPAddress: "172.17.0.2"
                    IPPrefixLen: 16
                    IPv6Gateway: ""
                    GlobalIPv6Address: ""
                    GlobalIPv6PrefixLen: 0
                    MacAddress: "02:42:ac:12:00:02"
              Path: "/bin/sh"
              ProcessLabel: ""
              ResolvConfPath: "/var/lib/docker/containers/ba033ac4401106a3b513bc9d639eee123ad78ca3616b921167cd74b20e25ed39/resolv.conf"
              RestartCount: 1
              State:
                Error: ""
                ExitCode: 9
                FinishedAt: "2015-01-06T15:47:32.080254511Z"
                OOMKilled: false
                Dead: false
                Paused: false
                Pid: 0
                Restarting: false
                Running: true
                StartedAt: "2015-01-06T15:47:32.072697474Z"
                Status: "running"
              Mounts:
                - Name: "fac362...80535"
                  Source: "/data"
                  Destination: "/data"
                  Driver: "local"
                  Mode: "ro,Z"
                  RW: false
                  Propagation: ""
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "size"
          in: "query"
          type: "boolean"
          default: false
          description: "Return the size of container as fields `SizeRw` and `SizeRootFs`"
      tags: ["Container"]
  /containers/{id}/top:
    get:
      summary: "List processes running inside a container"
      description: "On Unix systems, this is done by running the `ps` command. This endpoint is not supported on Windows."
      operationId: "ContainerTop"
      responses:
        200:
          description: "no error"
          schema:
            type: "object"
            properties:
              Titles:
                description: "The ps column titles"
                type: "array"
                items:
                  type: "string"
              Processes:
                description: "Each process running in the container, where each is process is an array of values corresponding to the titles"
                type: "array"
                items:
                  type: "array"
                  items:
                    type: "string"
          examples:
            application/json:
              Titles:
                - "UID"
                - "PID"
                - "PPID"
                - "C"
                - "STIME"
                - "TTY"
                - "TIME"
                - "CMD"
              Processes:
                -
                  - "root"
                  - "13642"
                  - "882"
                  - "0"
                  - "17:03"
                  - "pts/0"
                  - "00:00:00"
                  - "/bin/bash"
                -
                  - "root"
                  - "13735"
                  - "13642"
                  - "0"
                  - "17:06"
                  - "pts/0"
                  - "00:00:00"
                  - "sleep 10"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "ps_args"
          in: "query"
          description: "The arguments to pass to `ps`. For example, `aux`"
          type: "string"
          default: "-ef"
      tags: ["Container"]
  /containers/{id}/logs:
    get:
      summary: "Get container logs"
      description: |
        Get `stdout` and `stderr` logs from a container.
@y
                      Use the `Status` field instead to determine if a container's state is "running".
                    type: "boolean"
                  Paused:
                    description: "Whether this container is paused."
                    type: "boolean"
                  Restarting:
                    description: "Whether this container is restarting."
                    type: "boolean"
                  OOMKilled:
                    description: "Whether this container has been killed because it ran out of memory."
                    type: "boolean"
                  Dead:
                    type: "boolean"
                  Pid:
                    description: "The process ID of this container"
                    type: "integer"
                  ExitCode:
                    description: "The last exit code of this container"
                    type: "integer"
                  Error:
                    type: "string"
                  StartedAt:
                    description: "The time when this container was last started."
                    type: "string"
                  FinishedAt:
                    description: "The time when this container last exited."
                    type: "string"
              Image:
                description: "The container's image"
                type: "string"
              ResolvConfPath:
                type: "string"
              HostnamePath:
                type: "string"
              HostsPath:
                type: "string"
              LogPath:
                type: "string"
              Node:
                description: "TODO"
                type: "object"
              Name:
                type: "string"
              RestartCount:
                type: "integer"
              Driver:
                type: "string"
              MountLabel:
                type: "string"
              ProcessLabel:
                type: "string"
              AppArmorProfile:
                type: "string"
              ExecIDs:
                type: "string"
              HostConfig:
                $ref: "#/definitions/HostConfig"
              GraphDriver:
                $ref: "#/definitions/GraphDriverData"
              SizeRw:
                description: "The size of files that have been created or changed by this container."
                type: "integer"
                format: "int64"
              SizeRootFs:
                description: "The total size of all the files in this container."
                type: "integer"
                format: "int64"
              Mounts:
                type: "array"
                items:
                  $ref: "#/definitions/MountPoint"
              Config:
                $ref: "#/definitions/ContainerConfig"
              NetworkSettings:
                $ref: "#/definitions/NetworkConfig"
          examples:
            application/json:
              AppArmorProfile: ""
              Args:
                - "-c"
                - "exit 9"
              Config:
                AttachStderr: true
                AttachStdin: false
                AttachStdout: true
                Cmd:
                  - "/bin/sh"
                  - "-c"
                  - "exit 9"
                Domainname: ""
                Env:
                  - "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
                Hostname: "ba033ac44011"
                Image: "ubuntu"
                Labels:
                  com.example.vendor: "Acme"
                  com.example.license: "GPL"
                  com.example.version: "1.0"
                MacAddress: ""
                NetworkDisabled: false
                OpenStdin: false
                StdinOnce: false
                Tty: false
                User: ""
                Volumes:
                  /volumes/data: {}
                WorkingDir: ""
                StopSignal: "SIGTERM"
                StopTimeout: 10
              Created: "2015-01-06T15:47:31.485331387Z"
              Driver: "overlay2"
              HostConfig:
                MaximumIOps: 0
                MaximumIOBps: 0
                BlkioWeight: 0
                BlkioWeightDevice:
                  - {}
                BlkioDeviceReadBps:
                  - {}
                BlkioDeviceWriteBps:
                  - {}
                BlkioDeviceReadIOps:
                  - {}
                BlkioDeviceWriteIOps:
                  - {}
                ContainerIDFile: ""
                CpusetCpus: ""
                CpusetMems: ""
                CpuPercent: 80
                CpuShares: 0
                CpuPeriod: 100000
                CpuRealtimePeriod: 1000000
                CpuRealtimeRuntime: 10000
                Devices: []
                IpcMode: ""
                Memory: 0
                MemorySwap: 0
                MemoryReservation: 0
                KernelMemory: 0
                OomKillDisable: false
                OomScoreAdj: 500
                NetworkMode: "bridge"
                PidMode: ""
                PortBindings: {}
                Privileged: false
                ReadonlyRootfs: false
                PublishAllPorts: false
                RestartPolicy:
                  MaximumRetryCount: 2
                  Name: "on-failure"
                LogConfig:
                  Type: "json-file"
                Sysctls:
                  net.ipv4.ip_forward: "1"
                Ulimits:
                  - {}
                VolumeDriver: ""
                ShmSize: 67108864
              HostnamePath: "/var/lib/docker/containers/ba033ac4401106a3b513bc9d639eee123ad78ca3616b921167cd74b20e25ed39/hostname"
              HostsPath: "/var/lib/docker/containers/ba033ac4401106a3b513bc9d639eee123ad78ca3616b921167cd74b20e25ed39/hosts"
              LogPath: "/var/lib/docker/containers/1eb5fabf5a03807136561b3c00adcd2992b535d624d5e18b6cdc6a6844d9767b/1eb5fabf5a03807136561b3c00adcd2992b535d624d5e18b6cdc6a6844d9767b-json.log"
              Id: "ba033ac4401106a3b513bc9d639eee123ad78ca3616b921167cd74b20e25ed39"
              Image: "04c5d3b7b0656168630d3ba35d8889bd0e9caafcaeb3004d2bfbc47e7c5d35d2"
              MountLabel: ""
              Name: "/boring_euclid"
              NetworkSettings:
                Bridge: ""
                SandboxID: ""
                HairpinMode: false
                LinkLocalIPv6Address: ""
                LinkLocalIPv6PrefixLen: 0
                SandboxKey: ""
                SecondaryIPAddresses: null
                SecondaryIPv6Addresses: null
                EndpointID: ""
                Gateway: ""
                GlobalIPv6Address: ""
                GlobalIPv6PrefixLen: 0
                IPAddress: ""
                IPPrefixLen: 0
                IPv6Gateway: ""
                MacAddress: ""
                Networks:
                  bridge:
                    NetworkID: "7ea29fc1412292a2d7bba362f9253545fecdfa8ce9a6e37dd10ba8bee7129812"
                    EndpointID: "7587b82f0dada3656fda26588aee72630c6fab1536d36e394b2bfbcf898c971d"
                    Gateway: "172.17.0.1"
                    IPAddress: "172.17.0.2"
                    IPPrefixLen: 16
                    IPv6Gateway: ""
                    GlobalIPv6Address: ""
                    GlobalIPv6PrefixLen: 0
                    MacAddress: "02:42:ac:12:00:02"
              Path: "/bin/sh"
              ProcessLabel: ""
              ResolvConfPath: "/var/lib/docker/containers/ba033ac4401106a3b513bc9d639eee123ad78ca3616b921167cd74b20e25ed39/resolv.conf"
              RestartCount: 1
              State:
                Error: ""
                ExitCode: 9
                FinishedAt: "2015-01-06T15:47:32.080254511Z"
                OOMKilled: false
                Dead: false
                Paused: false
                Pid: 0
                Restarting: false
                Running: true
                StartedAt: "2015-01-06T15:47:32.072697474Z"
                Status: "running"
              Mounts:
                - Name: "fac362...80535"
                  Source: "/data"
                  Destination: "/data"
                  Driver: "local"
                  Mode: "ro,Z"
                  RW: false
                  Propagation: ""
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "size"
          in: "query"
          type: "boolean"
          default: false
          description: "Return the size of container as fields `SizeRw` and `SizeRootFs`"
      tags: ["Container"]
  /containers/{id}/top:
    get:
      summary: "List processes running inside a container"
      description: "On Unix systems, this is done by running the `ps` command. This endpoint is not supported on Windows."
      operationId: "ContainerTop"
      responses:
        200:
          description: "no error"
          schema:
            type: "object"
            properties:
              Titles:
                description: "The ps column titles"
                type: "array"
                items:
                  type: "string"
              Processes:
                description: "Each process running in the container, where each is process is an array of values corresponding to the titles"
                type: "array"
                items:
                  type: "array"
                  items:
                    type: "string"
          examples:
            application/json:
              Titles:
                - "UID"
                - "PID"
                - "PPID"
                - "C"
                - "STIME"
                - "TTY"
                - "TIME"
                - "CMD"
              Processes:
                -
                  - "root"
                  - "13642"
                  - "882"
                  - "0"
                  - "17:03"
                  - "pts/0"
                  - "00:00:00"
                  - "/bin/bash"
                -
                  - "root"
                  - "13735"
                  - "13642"
                  - "0"
                  - "17:06"
                  - "pts/0"
                  - "00:00:00"
                  - "sleep 10"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "ps_args"
          in: "query"
          description: "The arguments to pass to `ps`. For example, `aux`"
          type: "string"
          default: "-ef"
      tags: ["Container"]
  /containers/{id}/logs:
    get:
      summary: "Get container logs"
      description: |
        Get `stdout` and `stderr` logs from a container.
@z

@x
        Note: This endpoint works only for containers with the `json-file` or `journald` logging driver.
      operationId: "ContainerLogs"
      responses:
        101:
          description: "logs returned as a stream"
          schema:
            type: "string"
            format: "binary"
        200:
          description: "logs returned as a string in response body"
          schema:
            type: "string"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "follow"
          in: "query"
          description: |
            Return the logs as a stream.
@y
        Note: This endpoint works only for containers with the `json-file` or `journald` logging driver.
      operationId: "ContainerLogs"
      responses:
        101:
          description: "logs returned as a stream"
          schema:
            type: "string"
            format: "binary"
        200:
          description: "logs returned as a string in response body"
          schema:
            type: "string"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "follow"
          in: "query"
          description: |
            Return the logs as a stream.
@z

@x
            This will return a `101` HTTP response with a `Connection: upgrade` header, then hijack the HTTP connection to send raw output. For more information about hijacking and the stream format, [see the documentation for the attach endpoint](#operation/ContainerAttach).
          type: "boolean"
          default: false
        - name: "stdout"
          in: "query"
          description: "Return logs from `stdout`"
          type: "boolean"
          default: false
        - name: "stderr"
          in: "query"
          description: "Return logs from `stderr`"
          type: "boolean"
          default: false
        - name: "since"
          in: "query"
          description: "Only return logs since this time, as a UNIX timestamp"
          type: "integer"
          default: 0
        - name: "timestamps"
          in: "query"
          description: "Add timestamps to every log line"
          type: "boolean"
          default: false
        - name: "tail"
          in: "query"
          description: "Only return this number of log lines from the end of the logs. Specify as an integer or `all` to output all log lines."
          type: "string"
          default: "all"
      tags: ["Container"]
  /containers/{id}/changes:
    get:
      summary: "Get changes on a container’s filesystem"
      description: |
        Returns which files in a container's filesystem have been added, deleted,
        or modified. The `Kind` of modification can be one of:
@y
            This will return a `101` HTTP response with a `Connection: upgrade` header, then hijack the HTTP connection to send raw output. For more information about hijacking and the stream format, [see the documentation for the attach endpoint](#operation/ContainerAttach).
          type: "boolean"
          default: false
        - name: "stdout"
          in: "query"
          description: "Return logs from `stdout`"
          type: "boolean"
          default: false
        - name: "stderr"
          in: "query"
          description: "Return logs from `stderr`"
          type: "boolean"
          default: false
        - name: "since"
          in: "query"
          description: "Only return logs since this time, as a UNIX timestamp"
          type: "integer"
          default: 0
        - name: "timestamps"
          in: "query"
          description: "Add timestamps to every log line"
          type: "boolean"
          default: false
        - name: "tail"
          in: "query"
          description: "Only return this number of log lines from the end of the logs. Specify as an integer or `all` to output all log lines."
          type: "string"
          default: "all"
      tags: ["Container"]
  /containers/{id}/changes:
    get:
      summary: "Get changes on a container’s filesystem"
      description: |
        Returns which files in a container's filesystem have been added, deleted,
        or modified. The `Kind` of modification can be one of:
@z

@x
        - `0`: Modified
        - `1`: Added
        - `2`: Deleted
      operationId: "ContainerChanges"
      produces: ["application/json"]
      responses:
        200:
          description: "The list of changes"
          schema:
            type: "array"
            items:
              type: "object"
              x-go-name: "ContainerChangeResponseItem"
              required: [Path, Kind]
              properties:
                Path:
                  description: "Path to file that has changed"
                  type: "string"
                  x-nullable: false
                Kind:
                  description: "Kind of change"
                  type: "integer"
                  format: "uint8"
                  enum: [0, 1, 2]
                  x-nullable: false
          examples:
            application/json:
              - Path: "/dev"
                Kind: 0
              - Path: "/dev/kmsg"
                Kind: 1
              - Path: "/test"
                Kind: 1
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
      tags: ["Container"]
  /containers/{id}/export:
    get:
      summary: "Export a container"
      description: "Export the contents of a container as a tarball."
      operationId: "ContainerExport"
      produces:
        - "application/octet-stream"
      responses:
        200:
          description: "no error"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
      tags: ["Container"]
  /containers/{id}/stats:
    get:
      summary: "Get container stats based on resource usage"
      description: |
        This endpoint returns a live stream of a container’s resource usage
        statistics.
@y
        - `0`: Modified
        - `1`: Added
        - `2`: Deleted
      operationId: "ContainerChanges"
      produces: ["application/json"]
      responses:
        200:
          description: "The list of changes"
          schema:
            type: "array"
            items:
              type: "object"
              x-go-name: "ContainerChangeResponseItem"
              required: [Path, Kind]
              properties:
                Path:
                  description: "Path to file that has changed"
                  type: "string"
                  x-nullable: false
                Kind:
                  description: "Kind of change"
                  type: "integer"
                  format: "uint8"
                  enum: [0, 1, 2]
                  x-nullable: false
          examples:
            application/json:
              - Path: "/dev"
                Kind: 0
              - Path: "/dev/kmsg"
                Kind: 1
              - Path: "/test"
                Kind: 1
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
      tags: ["Container"]
  /containers/{id}/export:
    get:
      summary: "Export a container"
      description: "Export the contents of a container as a tarball."
      operationId: "ContainerExport"
      produces:
        - "application/octet-stream"
      responses:
        200:
          description: "no error"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
      tags: ["Container"]
  /containers/{id}/stats:
    get:
      summary: "Get container stats based on resource usage"
      description: |
        This endpoint returns a live stream of a container’s resource usage
        statistics.
@z

@x
        The `precpu_stats` is the CPU statistic of last read, which is used
        for calculating the CPU usage percentage. It is not the same as the
        `cpu_stats` field.
@y
        The `precpu_stats` is the CPU statistic of last read, which is used
        for calculating the CPU usage percentage. It is not the same as the
        `cpu_stats` field.
@z

@x
        If either `precpu_stats.online_cpus` or `cpu_stats.online_cpus` is
        nil then for compatibility with older daemons the length of the
        corresponding `cpu_usage.percpu_usage` array should be used.
      operationId: "ContainerStats"
      produces: ["application/json"]
      responses:
        200:
          description: "no error"
          schema:
            type: "object"
          examples:
            application/json:
              read: "2015-01-08T22:57:31.547920715Z"
              pids_stats:
                current: 3
              networks:
                eth0:
                  rx_bytes: 5338
                  rx_dropped: 0
                  rx_errors: 0
                  rx_packets: 36
                  tx_bytes: 648
                  tx_dropped: 0
                  tx_errors: 0
                  tx_packets: 8
                eth5:
                  rx_bytes: 4641
                  rx_dropped: 0
                  rx_errors: 0
                  rx_packets: 26
                  tx_bytes: 690
                  tx_dropped: 0
                  tx_errors: 0
                  tx_packets: 9
              memory_stats:
                stats:
                  total_pgmajfault: 0
                  cache: 0
                  mapped_file: 0
                  total_inactive_file: 0
                  pgpgout: 414
                  rss: 6537216
                  total_mapped_file: 0
                  writeback: 0
                  unevictable: 0
                  pgpgin: 477
                  total_unevictable: 0
                  pgmajfault: 0
                  total_rss: 6537216
                  total_rss_huge: 6291456
                  total_writeback: 0
                  total_inactive_anon: 0
                  rss_huge: 6291456
                  hierarchical_memory_limit: 67108864
                  total_pgfault: 964
                  total_active_file: 0
                  active_anon: 6537216
                  total_active_anon: 6537216
                  total_pgpgout: 414
                  total_cache: 0
                  inactive_anon: 0
                  active_file: 0
                  pgfault: 964
                  inactive_file: 0
                  total_pgpgin: 477
                max_usage: 6651904
                usage: 6537216
                failcnt: 0
                limit: 67108864
              blkio_stats: {}
              cpu_stats:
                cpu_usage:
                  percpu_usage:
                    - 8646879
                    - 24472255
                    - 36438778
                    - 30657443
                  usage_in_usermode: 50000000
                  total_usage: 100215355
                  usage_in_kernelmode: 30000000
                system_cpu_usage: 739306590000000
                online_cpus: 4
                throttling_data:
                  periods: 0
                  throttled_periods: 0
                  throttled_time: 0
              precpu_stats:
                cpu_usage:
                  percpu_usage:
                    - 8646879
                    - 24350896
                    - 36438778
                    - 30657443
                  usage_in_usermode: 50000000
                  total_usage: 100093996
                  usage_in_kernelmode: 30000000
                system_cpu_usage: 9492140000000
                online_cpus: 4
                throttling_data:
                  periods: 0
                  throttled_periods: 0
                  throttled_time: 0
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "stream"
          in: "query"
          description: "Stream the output. If false, the stats will be output once and then it will disconnect."
          type: "boolean"
          default: true
      tags: ["Container"]
  /containers/{id}/resize:
    post:
      summary: "Resize a container TTY"
      description: "Resize the TTY for a container. You must restart the container for the resize to take effect."
      operationId: "ContainerResize"
      consumes:
        - "application/octet-stream"
      produces:
        - "text/plain"
      responses:
        200:
          description: "no error"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "cannot resize container"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "h"
          in: "query"
          required: true
          description: "Height of the tty session in characters"
          type: "integer"
        - name: "w"
          in: "query"
          required: true
          description: "Width of the tty session in characters"
          type: "integer"
      tags: ["Container"]
  /containers/{id}/start:
    post:
      summary: "Start a container"
      operationId: "ContainerStart"
      responses:
        204:
          description: "no error"
        304:
          description: "container already started"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "detachKeys"
          in: "query"
          description: "Override the key sequence for detaching a container. Format is a single character `[a-Z]` or `ctrl-<value>` where `<value>` is one of: `a-z`, `@`, `^`, `[`, `,` or `_`."
          type: "string"
      tags: ["Container"]
  /containers/{id}/stop:
    post:
      summary: "Stop a container"
      operationId: "ContainerStop"
      responses:
        204:
          description: "no error"
        304:
          description: "container already stopped"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "t"
          in: "query"
          description: "Number of seconds to wait before killing the container"
          type: "integer"
      tags: ["Container"]
  /containers/{id}/restart:
    post:
      summary: "Restart a container"
      operationId: "ContainerRestart"
      responses:
        204:
          description: "no error"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "t"
          in: "query"
          description: "Number of seconds to wait before killing the container"
          type: "integer"
      tags: ["Container"]
  /containers/{id}/kill:
    post:
      summary: "Kill a container"
      description: "Send a POSIX signal to a container, defaulting to killing to the container."
      operationId: "ContainerKill"
      responses:
        204:
          description: "no error"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "signal"
          in: "query"
          description: "Signal to send to the container as an integer or string (e.g. `SIGINT`)"
          type: "string"
          default: "SIGKILL"
      tags: ["Container"]
  /containers/{id}/update:
    post:
      summary: "Update a container"
      description: "Change various configuration options of a container without having to recreate it."
      operationId: "ContainerUpdate"
      consumes: ["application/json"]
      produces: ["application/json"]
      responses:
        200:
          description: "The container has been updated."
          schema:
            type: "object"
            properties:
              Warnings:
                type: "array"
                items:
                  type: "string"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "update"
          in: "body"
          required: true
          schema:
            allOf:
              - $ref: "#/definitions/Resources"
              - type: "object"
                properties:
                  RestartPolicy:
                    $ref: "#/definitions/RestartPolicy"
            example:
              BlkioWeight: 300
              CpuShares: 512
              CpuPeriod: 100000
              CpuQuota: 50000
              CpuRealtimePeriod: 1000000
              CpuRealtimeRuntime: 10000
              CpusetCpus: "0,1"
              CpusetMems: "0"
              Memory: 314572800
              MemorySwap: 514288000
              MemoryReservation: 209715200
              KernelMemory: 52428800
              RestartPolicy:
                MaximumRetryCount: 4
                Name: "on-failure"
      tags: ["Container"]
  /containers/{id}/rename:
    post:
      summary: "Rename a container"
      operationId: "ContainerRename"
      responses:
        204:
          description: "no error"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        409:
          description: "name already in use"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "name"
          in: "query"
          required: true
          description: "New name for the container"
          type: "string"
      tags: ["Container"]
  /containers/{id}/pause:
    post:
      summary: "Pause a container"
      description: |
        Use the cgroups freezer to suspend all processes in a container.
@y
        If either `precpu_stats.online_cpus` or `cpu_stats.online_cpus` is
        nil then for compatibility with older daemons the length of the
        corresponding `cpu_usage.percpu_usage` array should be used.
      operationId: "ContainerStats"
      produces: ["application/json"]
      responses:
        200:
          description: "no error"
          schema:
            type: "object"
          examples:
            application/json:
              read: "2015-01-08T22:57:31.547920715Z"
              pids_stats:
                current: 3
              networks:
                eth0:
                  rx_bytes: 5338
                  rx_dropped: 0
                  rx_errors: 0
                  rx_packets: 36
                  tx_bytes: 648
                  tx_dropped: 0
                  tx_errors: 0
                  tx_packets: 8
                eth5:
                  rx_bytes: 4641
                  rx_dropped: 0
                  rx_errors: 0
                  rx_packets: 26
                  tx_bytes: 690
                  tx_dropped: 0
                  tx_errors: 0
                  tx_packets: 9
              memory_stats:
                stats:
                  total_pgmajfault: 0
                  cache: 0
                  mapped_file: 0
                  total_inactive_file: 0
                  pgpgout: 414
                  rss: 6537216
                  total_mapped_file: 0
                  writeback: 0
                  unevictable: 0
                  pgpgin: 477
                  total_unevictable: 0
                  pgmajfault: 0
                  total_rss: 6537216
                  total_rss_huge: 6291456
                  total_writeback: 0
                  total_inactive_anon: 0
                  rss_huge: 6291456
                  hierarchical_memory_limit: 67108864
                  total_pgfault: 964
                  total_active_file: 0
                  active_anon: 6537216
                  total_active_anon: 6537216
                  total_pgpgout: 414
                  total_cache: 0
                  inactive_anon: 0
                  active_file: 0
                  pgfault: 964
                  inactive_file: 0
                  total_pgpgin: 477
                max_usage: 6651904
                usage: 6537216
                failcnt: 0
                limit: 67108864
              blkio_stats: {}
              cpu_stats:
                cpu_usage:
                  percpu_usage:
                    - 8646879
                    - 24472255
                    - 36438778
                    - 30657443
                  usage_in_usermode: 50000000
                  total_usage: 100215355
                  usage_in_kernelmode: 30000000
                system_cpu_usage: 739306590000000
                online_cpus: 4
                throttling_data:
                  periods: 0
                  throttled_periods: 0
                  throttled_time: 0
              precpu_stats:
                cpu_usage:
                  percpu_usage:
                    - 8646879
                    - 24350896
                    - 36438778
                    - 30657443
                  usage_in_usermode: 50000000
                  total_usage: 100093996
                  usage_in_kernelmode: 30000000
                system_cpu_usage: 9492140000000
                online_cpus: 4
                throttling_data:
                  periods: 0
                  throttled_periods: 0
                  throttled_time: 0
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "stream"
          in: "query"
          description: "Stream the output. If false, the stats will be output once and then it will disconnect."
          type: "boolean"
          default: true
      tags: ["Container"]
  /containers/{id}/resize:
    post:
      summary: "Resize a container TTY"
      description: "Resize the TTY for a container. You must restart the container for the resize to take effect."
      operationId: "ContainerResize"
      consumes:
        - "application/octet-stream"
      produces:
        - "text/plain"
      responses:
        200:
          description: "no error"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "cannot resize container"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "h"
          in: "query"
          required: true
          description: "Height of the tty session in characters"
          type: "integer"
        - name: "w"
          in: "query"
          required: true
          description: "Width of the tty session in characters"
          type: "integer"
      tags: ["Container"]
  /containers/{id}/start:
    post:
      summary: "Start a container"
      operationId: "ContainerStart"
      responses:
        204:
          description: "no error"
        304:
          description: "container already started"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "detachKeys"
          in: "query"
          description: "Override the key sequence for detaching a container. Format is a single character `[a-Z]` or `ctrl-<value>` where `<value>` is one of: `a-z`, `@`, `^`, `[`, `,` or `_`."
          type: "string"
      tags: ["Container"]
  /containers/{id}/stop:
    post:
      summary: "Stop a container"
      operationId: "ContainerStop"
      responses:
        204:
          description: "no error"
        304:
          description: "container already stopped"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "t"
          in: "query"
          description: "Number of seconds to wait before killing the container"
          type: "integer"
      tags: ["Container"]
  /containers/{id}/restart:
    post:
      summary: "Restart a container"
      operationId: "ContainerRestart"
      responses:
        204:
          description: "no error"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "t"
          in: "query"
          description: "Number of seconds to wait before killing the container"
          type: "integer"
      tags: ["Container"]
  /containers/{id}/kill:
    post:
      summary: "Kill a container"
      description: "Send a POSIX signal to a container, defaulting to killing to the container."
      operationId: "ContainerKill"
      responses:
        204:
          description: "no error"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "signal"
          in: "query"
          description: "Signal to send to the container as an integer or string (e.g. `SIGINT`)"
          type: "string"
          default: "SIGKILL"
      tags: ["Container"]
  /containers/{id}/update:
    post:
      summary: "Update a container"
      description: "Change various configuration options of a container without having to recreate it."
      operationId: "ContainerUpdate"
      consumes: ["application/json"]
      produces: ["application/json"]
      responses:
        200:
          description: "The container has been updated."
          schema:
            type: "object"
            properties:
              Warnings:
                type: "array"
                items:
                  type: "string"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "update"
          in: "body"
          required: true
          schema:
            allOf:
              - $ref: "#/definitions/Resources"
              - type: "object"
                properties:
                  RestartPolicy:
                    $ref: "#/definitions/RestartPolicy"
            example:
              BlkioWeight: 300
              CpuShares: 512
              CpuPeriod: 100000
              CpuQuota: 50000
              CpuRealtimePeriod: 1000000
              CpuRealtimeRuntime: 10000
              CpusetCpus: "0,1"
              CpusetMems: "0"
              Memory: 314572800
              MemorySwap: 514288000
              MemoryReservation: 209715200
              KernelMemory: 52428800
              RestartPolicy:
                MaximumRetryCount: 4
                Name: "on-failure"
      tags: ["Container"]
  /containers/{id}/rename:
    post:
      summary: "Rename a container"
      operationId: "ContainerRename"
      responses:
        204:
          description: "no error"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        409:
          description: "name already in use"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "name"
          in: "query"
          required: true
          description: "New name for the container"
          type: "string"
      tags: ["Container"]
  /containers/{id}/pause:
    post:
      summary: "Pause a container"
      description: |
        Use the cgroups freezer to suspend all processes in a container.
@z

@x
        Traditionally, when suspending a process the `SIGSTOP` signal is used, which is observable by the process being suspended. With the cgroups freezer the process is unaware, and unable to capture, that it is being suspended, and subsequently resumed.
      operationId: "ContainerPause"
      responses:
        204:
          description: "no error"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
      tags: ["Container"]
  /containers/{id}/unpause:
    post:
      summary: "Unpause a container"
      description: "Resume a container which has been paused."
      operationId: "ContainerUnpause"
      responses:
        204:
          description: "no error"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
      tags: ["Container"]
  /containers/{id}/attach:
    post:
      summary: "Attach to a container"
      description: |
        Attach to a container to read its output or send it input. You can attach to the same container multiple times and you can reattach to containers that have been detached.
@y
        Traditionally, when suspending a process the `SIGSTOP` signal is used, which is observable by the process being suspended. With the cgroups freezer the process is unaware, and unable to capture, that it is being suspended, and subsequently resumed.
      operationId: "ContainerPause"
      responses:
        204:
          description: "no error"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
      tags: ["Container"]
  /containers/{id}/unpause:
    post:
      summary: "Unpause a container"
      description: "Resume a container which has been paused."
      operationId: "ContainerUnpause"
      responses:
        204:
          description: "no error"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
      tags: ["Container"]
  /containers/{id}/attach:
    post:
      summary: "Attach to a container"
      description: |
        Attach to a container to read its output or send it input. You can attach to the same container multiple times and you can reattach to containers that have been detached.
@z

@x
        Either the `stream` or `logs` parameter must be `true` for this endpoint to do anything.
@y
        Either the `stream` or `logs` parameter must be `true` for this endpoint to do anything.
@z

@x
        See [the documentation for the `docker attach` command](https://docs.docker.com/engine/reference/commandline/attach/) for more details.
@y
        See [the documentation for the `docker attach` command](https://docs.docker.com/engine/reference/commandline/attach/) for more details.
@z

@x
        ### Hijacking
@y
        ### Hijacking
@z

@x
        This endpoint hijacks the HTTP connection to transport `stdin`, `stdout`, and `stderr` on the same socket.
@y
        This endpoint hijacks the HTTP connection to transport `stdin`, `stdout`, and `stderr` on the same socket.
@z

@x
        This is the response from the daemon for an attach request:
@y
        This is the response from the daemon for an attach request:
@z

@x
        ```
        HTTP/1.1 200 OK
        Content-Type: application/vnd.docker.raw-stream
@y
        ```
        HTTP/1.1 200 OK
        Content-Type: application/vnd.docker.raw-stream
@z

@x
        [STREAM]
        ```
@y
        [STREAM]
        ```
@z

@x
        After the headers and two new lines, the TCP connection can now be used for raw, bidirectional communication between the client and server.
@y
        After the headers and two new lines, the TCP connection can now be used for raw, bidirectional communication between the client and server.
@z

@x
        To hint potential proxies about connection hijacking, the Docker client can also optionally send connection upgrade headers.
@y
        To hint potential proxies about connection hijacking, the Docker client can also optionally send connection upgrade headers.
@z

@x
        For example, the client sends this request to upgrade the connection:
@y
        For example, the client sends this request to upgrade the connection:
@z

@x
        ```
        POST /containers/16253994b7c4/attach?stream=1&stdout=1 HTTP/1.1
        Upgrade: tcp
        Connection: Upgrade
        ```
@y
        ```
        POST /containers/16253994b7c4/attach?stream=1&stdout=1 HTTP/1.1
        Upgrade: tcp
        Connection: Upgrade
        ```
@z

@x
        The Docker daemon will respond with a `101 UPGRADED` response, and will similarly follow with the raw stream:
@y
        The Docker daemon will respond with a `101 UPGRADED` response, and will similarly follow with the raw stream:
@z

@x
        ```
        HTTP/1.1 101 UPGRADED
        Content-Type: application/vnd.docker.raw-stream
        Connection: Upgrade
        Upgrade: tcp
@y
        ```
        HTTP/1.1 101 UPGRADED
        Content-Type: application/vnd.docker.raw-stream
        Connection: Upgrade
        Upgrade: tcp
@z

@x
        [STREAM]
        ```
@y
        [STREAM]
        ```
@z

@x
        ### Stream format
@y
        ### Stream format
@z

@x
        When the TTY setting is disabled in [`POST /containers/create`](#operation/ContainerCreate), the stream over the hijacked connected is multiplexed to separate out `stdout` and `stderr`. The stream consists of a series of frames, each containing a header and a payload.
@y
        When the TTY setting is disabled in [`POST /containers/create`](#operation/ContainerCreate), the stream over the hijacked connected is multiplexed to separate out `stdout` and `stderr`. The stream consists of a series of frames, each containing a header and a payload.
@z

@x
        The header contains the information which the stream writes (`stdout` or `stderr`). It also contains the size of the associated frame encoded in the last four bytes (`uint32`).
@y
        The header contains the information which the stream writes (`stdout` or `stderr`). It also contains the size of the associated frame encoded in the last four bytes (`uint32`).
@z

@x
        It is encoded on the first eight bytes like this:
@y
        It is encoded on the first eight bytes like this:
@z

@x
        ```go
        header := [8]byte{STREAM_TYPE, 0, 0, 0, SIZE1, SIZE2, SIZE3, SIZE4}
        ```
@y
        ```go
        header := [8]byte{STREAM_TYPE, 0, 0, 0, SIZE1, SIZE2, SIZE3, SIZE4}
        ```
@z

@x
        `STREAM_TYPE` can be:
@y
        `STREAM_TYPE` can be:
@z

@x
        - 0: `stdin` (is written on `stdout`)
        - 1: `stdout`
        - 2: `stderr`
@y
        - 0: `stdin` (is written on `stdout`)
        - 1: `stdout`
        - 2: `stderr`
@z

@x
        `SIZE1, SIZE2, SIZE3, SIZE4` are the four bytes of the `uint32` size encoded as big endian.
@y
        `SIZE1, SIZE2, SIZE3, SIZE4` are the four bytes of the `uint32` size encoded as big endian.
@z

@x
        Following the header is the payload, which is the specified number of bytes of `STREAM_TYPE`.
@y
        Following the header is the payload, which is the specified number of bytes of `STREAM_TYPE`.
@z

@x
        The simplest way to implement this protocol is the following:
@y
        The simplest way to implement this protocol is the following:
@z

@x
        1. Read 8 bytes.
        2. Choose `stdout` or `stderr` depending on the first byte.
        3. Extract the frame size from the last four bytes.
        4. Read the extracted size and output it on the correct output.
        5. Goto 1.
@y
        1. Read 8 bytes.
        2. Choose `stdout` or `stderr` depending on the first byte.
        3. Extract the frame size from the last four bytes.
        4. Read the extracted size and output it on the correct output.
        5. Goto 1.
@z

@x
        ### Stream format when using a TTY
@y
        ### Stream format when using a TTY
@z

@x
        When the TTY setting is enabled in [`POST /containers/create`](#operation/ContainerCreate), the stream is not multiplexed. The data exchanged over the hijacked connection is simply the raw data from the process PTY and client's `stdin`.
@y
        When the TTY setting is enabled in [`POST /containers/create`](#operation/ContainerCreate), the stream is not multiplexed. The data exchanged over the hijacked connection is simply the raw data from the process PTY and client's `stdin`.
@z

@x
      operationId: "ContainerAttach"
      produces:
        - "application/vnd.docker.raw-stream"
      responses:
        101:
          description: "no error, hints proxy about hijacking"
        200:
          description: "no error, no upgrade header found"
        400:
          description: "bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "detachKeys"
          in: "query"
          description: "Override the key sequence for detaching a container.Format is a single character `[a-Z]` or `ctrl-<value>` where `<value>` is one of: `a-z`, `@`, `^`, `[`, `,` or `_`."
          type: "string"
        - name: "logs"
          in: "query"
          description: |
            Replay previous logs from the container.
@y
      operationId: "ContainerAttach"
      produces:
        - "application/vnd.docker.raw-stream"
      responses:
        101:
          description: "no error, hints proxy about hijacking"
        200:
          description: "no error, no upgrade header found"
        400:
          description: "bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "detachKeys"
          in: "query"
          description: "Override the key sequence for detaching a container.Format is a single character `[a-Z]` or `ctrl-<value>` where `<value>` is one of: `a-z`, `@`, `^`, `[`, `,` or `_`."
          type: "string"
        - name: "logs"
          in: "query"
          description: |
            Replay previous logs from the container.
@z

@x
            This is useful for attaching to a container that has started and you want to output everything since the container started.
@y
            This is useful for attaching to a container that has started and you want to output everything since the container started.
@z

@x
            If `stream` is also enabled, once all the previous output has been returned, it will seamlessly transition into streaming current output.
          type: "boolean"
          default: false
        - name: "stream"
          in: "query"
          description: "Stream attached streams from the time the request was made onwards"
          type: "boolean"
          default: false
        - name: "stdin"
          in: "query"
          description: "Attach to `stdin`"
          type: "boolean"
          default: false
        - name: "stdout"
          in: "query"
          description: "Attach to `stdout`"
          type: "boolean"
          default: false
        - name: "stderr"
          in: "query"
          description: "Attach to `stderr`"
          type: "boolean"
          default: false
      tags: ["Container"]
  /containers/{id}/attach/ws:
    get:
      summary: "Attach to a container via a websocket"
      operationId: "ContainerAttachWebsocket"
      responses:
        101:
          description: "no error, hints proxy about hijacking"
        200:
          description: "no error, no upgrade header found"
        400:
          description: "bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "detachKeys"
          in: "query"
          description: "Override the key sequence for detaching a container.Format is a single character `[a-Z]` or `ctrl-<value>` where `<value>` is one of: `a-z`, `@`, `^`, `[`, `,`, or `_`."
          type: "string"
        - name: "logs"
          in: "query"
          description: "Return logs"
          type: "boolean"
          default: false
        - name: "stream"
          in: "query"
          description: "Return stream"
          type: "boolean"
          default: false
      tags: ["Container"]
  /containers/{id}/wait:
    post:
      summary: "Wait for a container"
      description: "Block until a container stops, then returns the exit code."
      operationId: "ContainerWait"
      produces: ["application/json"]
      responses:
        200:
          description: "The container has exit."
          schema:
            type: "object"
            required: [StatusCode]
            properties:
              StatusCode:
                description: "Exit code of the container"
                type: "integer"
                x-nullable: false
        400:
          description: "bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "condition"
          in: "query"
          description: |
            Wait until a container state reaches the given condition.
@y
            If `stream` is also enabled, once all the previous output has been returned, it will seamlessly transition into streaming current output.
          type: "boolean"
          default: false
        - name: "stream"
          in: "query"
          description: "Stream attached streams from the time the request was made onwards"
          type: "boolean"
          default: false
        - name: "stdin"
          in: "query"
          description: "Attach to `stdin`"
          type: "boolean"
          default: false
        - name: "stdout"
          in: "query"
          description: "Attach to `stdout`"
          type: "boolean"
          default: false
        - name: "stderr"
          in: "query"
          description: "Attach to `stderr`"
          type: "boolean"
          default: false
      tags: ["Container"]
  /containers/{id}/attach/ws:
    get:
      summary: "Attach to a container via a websocket"
      operationId: "ContainerAttachWebsocket"
      responses:
        101:
          description: "no error, hints proxy about hijacking"
        200:
          description: "no error, no upgrade header found"
        400:
          description: "bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "detachKeys"
          in: "query"
          description: "Override the key sequence for detaching a container.Format is a single character `[a-Z]` or `ctrl-<value>` where `<value>` is one of: `a-z`, `@`, `^`, `[`, `,`, or `_`."
          type: "string"
        - name: "logs"
          in: "query"
          description: "Return logs"
          type: "boolean"
          default: false
        - name: "stream"
          in: "query"
          description: "Return stream"
          type: "boolean"
          default: false
      tags: ["Container"]
  /containers/{id}/wait:
    post:
      summary: "Wait for a container"
      description: "Block until a container stops, then returns the exit code."
      operationId: "ContainerWait"
      produces: ["application/json"]
      responses:
        200:
          description: "The container has exit."
          schema:
            type: "object"
            required: [StatusCode]
            properties:
              StatusCode:
                description: "Exit code of the container"
                type: "integer"
                x-nullable: false
        400:
          description: "bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "condition"
          in: "query"
          description: |
            Wait until a container state reaches the given condition.
@z

@x
            Defaults to `not-running` if omitted or empty.
          type: "string"
          enum:
            - "not-running"
            - "next-exit"
            - "removed"
          default: "not-running"
      tags: ["Container"]
  /containers/{id}:
    delete:
      summary: "Remove a container"
      operationId: "ContainerDelete"
      responses:
        204:
          description: "no error"
        400:
          description: "bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        409:
          description: "conflict"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "You cannot remove a running container: c2ada9df5af8. Stop the container before attempting removal or force remove"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "v"
          in: "query"
          description: "Remove anonymous volumes associated with the container."
          type: "boolean"
          default: false
        - name: "force"
          in: "query"
          description: "If the container is running, kill it before removing it."
          type: "boolean"
          default: false
        - name: "link"
          in: "query"
          description: "Remove the specified link associated with the container."
          type: "boolean"
          default: false
      tags: ["Container"]
  /containers/{id}/archive:
    head:
      summary: "Get information about files in a container"
      description: "A response header `X-Docker-Container-Path-Stat` is return containing a base64 - encoded JSON object with some filesystem header information about the path."
      operationId: "ContainerArchiveInfo"
      responses:
        200:
          description: "no error"
          headers:
            X-Docker-Container-Path-Stat:
              type: "string"
              description: "TODO"
        400:
          description: "Bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "Container or path does not exist"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "path"
          in: "query"
          required: true
          description: "Resource in the container’s filesystem to archive."
          type: "string"
      tags: ["Container"]
    get:
      summary: "Get an archive of a filesystem resource in a container"
      description: "Get a tar archive of a resource in the filesystem of container id."
      operationId: "ContainerArchive"
      produces: ["application/x-tar"]
      responses:
        200:
          description: "no error"
        400:
          description: "Bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "Container or path does not exist"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "path"
          in: "query"
          required: true
          description: "Resource in the container’s filesystem to archive."
          type: "string"
      tags: ["Container"]
    put:
      summary: "Extract an archive of files or folders to a directory in a container"
      description: |
        Upload a tar archive to be extracted to a path in the filesystem of container id.
        `path` parameter is asserted to be a directory. If it exists as a file, 400 error
        will be returned with message "not a directory".
      operationId: "PutContainerArchive"
      consumes: ["application/x-tar", "application/octet-stream"]
      responses:
        200:
          description: "The content was extracted successfully"
        400:
          description: "Bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "not a directory"
        403:
          description: "Permission denied, the volume or container rootfs is marked as read-only."
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "No such container or path does not exist inside the container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "path"
          in: "query"
          required: true
          description: "Path to a directory in the container to extract the archive’s contents into. "
          type: "string"
        - name: "noOverwriteDirNonDir"
          in: "query"
          description: "If “1”, “true”, or “True” then it will be an error if unpacking the given content would cause an existing directory to be replaced with a non-directory and vice versa."
          type: "string"
        - name: "inputStream"
          in: "body"
          required: true
          description: "The input stream must be a tar archive compressed with one of the following algorithms: identity (no compression), gzip, bzip2, xz."
          schema:
            type: "string"
      tags: ["Container"]
  /containers/prune:
    post:
      summary: "Delete stopped containers"
      produces:
        - "application/json"
      operationId: "ContainerPrune"
      parameters:
        - name: "filters"
          in: "query"
          description: |
            Filters to process on the prune list, encoded as JSON (a `map[string][]string`).
@y
            Defaults to `not-running` if omitted or empty.
          type: "string"
          enum:
            - "not-running"
            - "next-exit"
            - "removed"
          default: "not-running"
      tags: ["Container"]
  /containers/{id}:
    delete:
      summary: "Remove a container"
      operationId: "ContainerDelete"
      responses:
        204:
          description: "no error"
        400:
          description: "bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        409:
          description: "conflict"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "You cannot remove a running container: c2ada9df5af8. Stop the container before attempting removal or force remove"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "v"
          in: "query"
          description: "Remove anonymous volumes associated with the container."
          type: "boolean"
          default: false
        - name: "force"
          in: "query"
          description: "If the container is running, kill it before removing it."
          type: "boolean"
          default: false
        - name: "link"
          in: "query"
          description: "Remove the specified link associated with the container."
          type: "boolean"
          default: false
      tags: ["Container"]
  /containers/{id}/archive:
    head:
      summary: "Get information about files in a container"
      description: "A response header `X-Docker-Container-Path-Stat` is return containing a base64 - encoded JSON object with some filesystem header information about the path."
      operationId: "ContainerArchiveInfo"
      responses:
        200:
          description: "no error"
          headers:
            X-Docker-Container-Path-Stat:
              type: "string"
              description: "TODO"
        400:
          description: "Bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "Container or path does not exist"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "path"
          in: "query"
          required: true
          description: "Resource in the container’s filesystem to archive."
          type: "string"
      tags: ["Container"]
    get:
      summary: "Get an archive of a filesystem resource in a container"
      description: "Get a tar archive of a resource in the filesystem of container id."
      operationId: "ContainerArchive"
      produces: ["application/x-tar"]
      responses:
        200:
          description: "no error"
        400:
          description: "Bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "Container or path does not exist"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "path"
          in: "query"
          required: true
          description: "Resource in the container’s filesystem to archive."
          type: "string"
      tags: ["Container"]
    put:
      summary: "Extract an archive of files or folders to a directory in a container"
      description: |
        Upload a tar archive to be extracted to a path in the filesystem of container id.
        `path` parameter is asserted to be a directory. If it exists as a file, 400 error
        will be returned with message "not a directory".
      operationId: "PutContainerArchive"
      consumes: ["application/x-tar", "application/octet-stream"]
      responses:
        200:
          description: "The content was extracted successfully"
        400:
          description: "Bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "not a directory"
        403:
          description: "Permission denied, the volume or container rootfs is marked as read-only."
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "No such container or path does not exist inside the container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the container"
          type: "string"
        - name: "path"
          in: "query"
          required: true
          description: "Path to a directory in the container to extract the archive’s contents into. "
          type: "string"
        - name: "noOverwriteDirNonDir"
          in: "query"
          description: "If “1”, “true”, or “True” then it will be an error if unpacking the given content would cause an existing directory to be replaced with a non-directory and vice versa."
          type: "string"
        - name: "inputStream"
          in: "body"
          required: true
          description: "The input stream must be a tar archive compressed with one of the following algorithms: identity (no compression), gzip, bzip2, xz."
          schema:
            type: "string"
      tags: ["Container"]
  /containers/prune:
    post:
      summary: "Delete stopped containers"
      produces:
        - "application/json"
      operationId: "ContainerPrune"
      parameters:
        - name: "filters"
          in: "query"
          description: |
            Filters to process on the prune list, encoded as JSON (a `map[string][]string`).
@z

@x
            Available filters:
            - `until=<timestamp>` Prune containers created before this timestamp. The `<timestamp>` can be Unix timestamps, date formatted timestamps, or Go duration strings (e.g. `10m`, `1h30m`) computed relative to the daemon machine’s time.
            - `label` (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or `label!=<key>=<value>`) Prune containers with (or without, in case `label!=...` is used) the specified labels.
          type: "string"
      responses:
        200:
          description: "No error"
          schema:
            type: "object"
            properties:
              ContainersDeleted:
                description: "Container IDs that were deleted"
                type: "array"
                items:
                  type: "string"
              SpaceReclaimed:
                description: "Disk space reclaimed in bytes"
                type: "integer"
                format: "int64"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      tags: ["Container"]
  /images/json:
    get:
      summary: "List Images"
      description: "Returns a list of images on the server. Note that it uses a different, smaller representation of an image than inspecting a single image."
      operationId: "ImageList"
      produces:
        - "application/json"
      responses:
        200:
          description: "Summary image data for the images matching the query"
          schema:
            type: "array"
            items:
              $ref: "#/definitions/ImageSummary"
          examples:
            application/json:
              - Id: "sha256:e216a057b1cb1efc11f8a268f37ef62083e70b1b38323ba252e25ac88904a7e8"
                ParentId: ""
                RepoTags:
                  - "ubuntu:12.04"
                  - "ubuntu:precise"
                RepoDigests:
                  - "ubuntu@sha256:992069aee4016783df6345315302fa59681aae51a8eeb2f889dea59290f21787"
                Created: 1474925151
                Size: 103579269
                VirtualSize: 103579269
                SharedSize: 0
                Labels: {}
                Containers: 2
              - Id: "sha256:3e314f95dcace0f5e4fd37b10862fe8398e3c60ed36600bc0ca5fda78b087175"
                ParentId: ""
                RepoTags:
                  - "ubuntu:12.10"
                  - "ubuntu:quantal"
                RepoDigests:
                  - "ubuntu@sha256:002fba3e3255af10be97ea26e476692a7ebed0bb074a9ab960b2e7a1526b15d7"
                  - "ubuntu@sha256:68ea0200f0b90df725d99d823905b04cf844f6039ef60c60bf3e019915017bd3"
                Created: 1403128455
                Size: 172064416
                VirtualSize: 172064416
                SharedSize: 0
                Labels: {}
                Containers: 5
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "all"
          in: "query"
          description: "Show all images. Only images from a final layer (no children) are shown by default."
          type: "boolean"
          default: false
        - name: "filters"
          in: "query"
          description: |
            A JSON encoded value of the filters (a `map[string][]string`) to process on the images list. Available filters:
@y
            Available filters:
            - `until=<timestamp>` Prune containers created before this timestamp. The `<timestamp>` can be Unix timestamps, date formatted timestamps, or Go duration strings (e.g. `10m`, `1h30m`) computed relative to the daemon machine’s time.
            - `label` (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or `label!=<key>=<value>`) Prune containers with (or without, in case `label!=...` is used) the specified labels.
          type: "string"
      responses:
        200:
          description: "No error"
          schema:
            type: "object"
            properties:
              ContainersDeleted:
                description: "Container IDs that were deleted"
                type: "array"
                items:
                  type: "string"
              SpaceReclaimed:
                description: "Disk space reclaimed in bytes"
                type: "integer"
                format: "int64"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      tags: ["Container"]
  /images/json:
    get:
      summary: "List Images"
      description: "Returns a list of images on the server. Note that it uses a different, smaller representation of an image than inspecting a single image."
      operationId: "ImageList"
      produces:
        - "application/json"
      responses:
        200:
          description: "Summary image data for the images matching the query"
          schema:
            type: "array"
            items:
              $ref: "#/definitions/ImageSummary"
          examples:
            application/json:
              - Id: "sha256:e216a057b1cb1efc11f8a268f37ef62083e70b1b38323ba252e25ac88904a7e8"
                ParentId: ""
                RepoTags:
                  - "ubuntu:12.04"
                  - "ubuntu:precise"
                RepoDigests:
                  - "ubuntu@sha256:992069aee4016783df6345315302fa59681aae51a8eeb2f889dea59290f21787"
                Created: 1474925151
                Size: 103579269
                VirtualSize: 103579269
                SharedSize: 0
                Labels: {}
                Containers: 2
              - Id: "sha256:3e314f95dcace0f5e4fd37b10862fe8398e3c60ed36600bc0ca5fda78b087175"
                ParentId: ""
                RepoTags:
                  - "ubuntu:12.10"
                  - "ubuntu:quantal"
                RepoDigests:
                  - "ubuntu@sha256:002fba3e3255af10be97ea26e476692a7ebed0bb074a9ab960b2e7a1526b15d7"
                  - "ubuntu@sha256:68ea0200f0b90df725d99d823905b04cf844f6039ef60c60bf3e019915017bd3"
                Created: 1403128455
                Size: 172064416
                VirtualSize: 172064416
                SharedSize: 0
                Labels: {}
                Containers: 5
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "all"
          in: "query"
          description: "Show all images. Only images from a final layer (no children) are shown by default."
          type: "boolean"
          default: false
        - name: "filters"
          in: "query"
          description: |
            A JSON encoded value of the filters (a `map[string][]string`) to process on the images list. Available filters:
@z

@x
            - `before`=(`<image-name>[:<tag>]`,  `<image id>` or `<image@digest>`)
            - `dangling=true`
            - `label=key` or `label="key=value"` of an image label
            - `reference`=(`<image-name>[:<tag>]`)
            - `since`=(`<image-name>[:<tag>]`,  `<image id>` or `<image@digest>`)
          type: "string"
        - name: "digests"
          in: "query"
          description: "Show digest information as a `RepoDigests` field on each image."
          type: "boolean"
          default: false
      tags: ["Image"]
  /build:
    post:
      summary: "Build an image"
      description: |
        Build an image from a tar archive with a `Dockerfile` in it.
@y
            - `before`=(`<image-name>[:<tag>]`,  `<image id>` or `<image@digest>`)
            - `dangling=true`
            - `label=key` or `label="key=value"` of an image label
            - `reference`=(`<image-name>[:<tag>]`)
            - `since`=(`<image-name>[:<tag>]`,  `<image id>` or `<image@digest>`)
          type: "string"
        - name: "digests"
          in: "query"
          description: "Show digest information as a `RepoDigests` field on each image."
          type: "boolean"
          default: false
      tags: ["Image"]
  /build:
    post:
      summary: "Build an image"
      description: |
        Build an image from a tar archive with a `Dockerfile` in it.
@z

@x
        The `Dockerfile` specifies how the image is built from the tar archive. It is typically in the archive's root, but can be at a different path or have a different name by specifying the `dockerfile` parameter. [See the `Dockerfile` reference for more information](https://docs.docker.com/engine/reference/builder/).
@y
        The `Dockerfile` specifies how the image is built from the tar archive. It is typically in the archive's root, but can be at a different path or have a different name by specifying the `dockerfile` parameter. [See the `Dockerfile` reference for more information](https://docs.docker.com/engine/reference/builder/).
@z

@x
        The Docker daemon performs a preliminary validation of the `Dockerfile` before starting the build, and returns an error if the syntax is incorrect. After that, each instruction is run one-by-one until the ID of the new image is output.
@y
        The Docker daemon performs a preliminary validation of the `Dockerfile` before starting the build, and returns an error if the syntax is incorrect. After that, each instruction is run one-by-one until the ID of the new image is output.
@z

@x
        The build is canceled if the client drops the connection by quitting or being killed.
      operationId: "ImageBuild"
      consumes:
        - "application/octet-stream"
      produces:
        - "application/json"
      parameters:
        - name: "inputStream"
          in: "body"
          description: "A tar archive compressed with one of the following algorithms: identity (no compression), gzip, bzip2, xz."
          schema:
            type: "string"
            format: "binary"
        - name: "dockerfile"
          in: "query"
          description: "Path within the build context to the `Dockerfile`. This is ignored if `remote` is specified and points to an external `Dockerfile`."
          type: "string"
          default: "Dockerfile"
        - name: "t"
          in: "query"
          description: "A name and optional tag to apply to the image in the `name:tag` format. If you omit the tag the default `latest` value is assumed. You can provide several `t` parameters."
          type: "string"
        - name: "extrahosts"
          in: "query"
          description: "Extra hosts to add to /etc/hosts"
          type: "string"
        - name: "remote"
          in: "query"
          description: "A Git repository URI or HTTP/HTTPS context URI. If the URI points to a single text file, the file’s contents are placed into a file called `Dockerfile` and the image is built from that file. If the URI points to a tarball, the file is downloaded by the daemon and the contents therein used as the context for the build. If the URI points to a tarball and the `dockerfile` parameter is also specified, there must be a file with the corresponding path inside the tarball."
          type: "string"
        - name: "q"
          in: "query"
          description: "Suppress verbose build output."
          type: "boolean"
          default: false
        - name: "nocache"
          in: "query"
          description: "Do not use the cache when building the image."
          type: "boolean"
          default: false
        - name: "cachefrom"
          in: "query"
          description: "JSON array of images used for build cache resolution."
          type: "string"
        - name: "pull"
          in: "query"
          description: "Attempt to pull the image even if an older image exists locally."
          type: "string"
        - name: "rm"
          in: "query"
          description: "Remove intermediate containers after a successful build."
          type: "boolean"
          default: true
        - name: "forcerm"
          in: "query"
          description: "Always remove intermediate containers, even upon failure."
          type: "boolean"
          default: false
        - name: "memory"
          in: "query"
          description: "Set memory limit for build."
          type: "integer"
        - name: "memswap"
          in: "query"
          description: "Total memory (memory + swap). Set as `-1` to disable swap."
          type: "integer"
        - name: "cpushares"
          in: "query"
          description: "CPU shares (relative weight)."
          type: "integer"
        - name: "cpusetcpus"
          in: "query"
          description: "CPUs in which to allow execution (e.g., `0-3`, `0,1`)."
          type: "string"
        - name: "cpuperiod"
          in: "query"
          description: "The length of a CPU period in microseconds."
          type: "integer"
        - name: "cpuquota"
          in: "query"
          description: "Microseconds of CPU time that the container can get in a CPU period."
          type: "integer"
        - name: "buildargs"
          in: "query"
          description: "JSON map of string pairs for build-time variables. Users pass these values at build-time. Docker uses the buildargs as the environment context for commands run via the `Dockerfile` RUN instruction, or for variable expansion in other `Dockerfile` instructions. This is not meant for passing secret values. [Read more about the buildargs instruction.](https://docs.docker.com/engine/reference/builder/#arg)"
          type: "integer"
        - name: "shmsize"
          in: "query"
          description: "Size of `/dev/shm` in bytes. The size must be greater than 0. If omitted the system uses 64MB."
          type: "integer"
        - name: "squash"
          in: "query"
          description: "Squash the resulting images layers into a single layer. *(Experimental release only.)*"
          type: "boolean"
        - name: "labels"
          in: "query"
          description: "Arbitrary key/value labels to set on the image, as a JSON map of string pairs."
          type: "string"
        - name: "networkmode"
          in: "query"
          description: "Sets the networking mode for the run commands during
        build. Supported standard values are: `bridge`, `host`, `none`, and
        `container:<name|id>`. Any other value is taken as a custom network's
        name to which this container should connect to."
          type: "string"
        - name: "Content-type"
          in: "header"
          type: "string"
          enum:
            - "application/x-tar"
          default: "application/x-tar"
        - name: "X-Registry-Config"
          in: "header"
          description: |
            This is a base64-encoded JSON object with auth configurations for multiple registries that a build may refer to.
@y
        The build is canceled if the client drops the connection by quitting or being killed.
      operationId: "ImageBuild"
      consumes:
        - "application/octet-stream"
      produces:
        - "application/json"
      parameters:
        - name: "inputStream"
          in: "body"
          description: "A tar archive compressed with one of the following algorithms: identity (no compression), gzip, bzip2, xz."
          schema:
            type: "string"
            format: "binary"
        - name: "dockerfile"
          in: "query"
          description: "Path within the build context to the `Dockerfile`. This is ignored if `remote` is specified and points to an external `Dockerfile`."
          type: "string"
          default: "Dockerfile"
        - name: "t"
          in: "query"
          description: "A name and optional tag to apply to the image in the `name:tag` format. If you omit the tag the default `latest` value is assumed. You can provide several `t` parameters."
          type: "string"
        - name: "extrahosts"
          in: "query"
          description: "Extra hosts to add to /etc/hosts"
          type: "string"
        - name: "remote"
          in: "query"
          description: "A Git repository URI or HTTP/HTTPS context URI. If the URI points to a single text file, the file’s contents are placed into a file called `Dockerfile` and the image is built from that file. If the URI points to a tarball, the file is downloaded by the daemon and the contents therein used as the context for the build. If the URI points to a tarball and the `dockerfile` parameter is also specified, there must be a file with the corresponding path inside the tarball."
          type: "string"
        - name: "q"
          in: "query"
          description: "Suppress verbose build output."
          type: "boolean"
          default: false
        - name: "nocache"
          in: "query"
          description: "Do not use the cache when building the image."
          type: "boolean"
          default: false
        - name: "cachefrom"
          in: "query"
          description: "JSON array of images used for build cache resolution."
          type: "string"
        - name: "pull"
          in: "query"
          description: "Attempt to pull the image even if an older image exists locally."
          type: "string"
        - name: "rm"
          in: "query"
          description: "Remove intermediate containers after a successful build."
          type: "boolean"
          default: true
        - name: "forcerm"
          in: "query"
          description: "Always remove intermediate containers, even upon failure."
          type: "boolean"
          default: false
        - name: "memory"
          in: "query"
          description: "Set memory limit for build."
          type: "integer"
        - name: "memswap"
          in: "query"
          description: "Total memory (memory + swap). Set as `-1` to disable swap."
          type: "integer"
        - name: "cpushares"
          in: "query"
          description: "CPU shares (relative weight)."
          type: "integer"
        - name: "cpusetcpus"
          in: "query"
          description: "CPUs in which to allow execution (e.g., `0-3`, `0,1`)."
          type: "string"
        - name: "cpuperiod"
          in: "query"
          description: "The length of a CPU period in microseconds."
          type: "integer"
        - name: "cpuquota"
          in: "query"
          description: "Microseconds of CPU time that the container can get in a CPU period."
          type: "integer"
        - name: "buildargs"
          in: "query"
          description: "JSON map of string pairs for build-time variables. Users pass these values at build-time. Docker uses the buildargs as the environment context for commands run via the `Dockerfile` RUN instruction, or for variable expansion in other `Dockerfile` instructions. This is not meant for passing secret values. [Read more about the buildargs instruction.](https://docs.docker.com/engine/reference/builder/#arg)"
          type: "integer"
        - name: "shmsize"
          in: "query"
          description: "Size of `/dev/shm` in bytes. The size must be greater than 0. If omitted the system uses 64MB."
          type: "integer"
        - name: "squash"
          in: "query"
          description: "Squash the resulting images layers into a single layer. *(Experimental release only.)*"
          type: "boolean"
        - name: "labels"
          in: "query"
          description: "Arbitrary key/value labels to set on the image, as a JSON map of string pairs."
          type: "string"
        - name: "networkmode"
          in: "query"
          description: "Sets the networking mode for the run commands during
        build. Supported standard values are: `bridge`, `host`, `none`, and
        `container:<name|id>`. Any other value is taken as a custom network's
        name to which this container should connect to."
          type: "string"
        - name: "Content-type"
          in: "header"
          type: "string"
          enum:
            - "application/x-tar"
          default: "application/x-tar"
        - name: "X-Registry-Config"
          in: "header"
          description: |
            This is a base64-encoded JSON object with auth configurations for multiple registries that a build may refer to.
@z

@x
            The key is a registry URL, and the value is an auth configuration object, [as described in the authentication section](#section/Authentication). For example:
@y
            The key is a registry URL, and the value is an auth configuration object, [as described in the authentication section](#section/Authentication). For example:
@z

@x
            ```
            {
              "docker.example.com": {
                "username": "janedoe",
                "password": "hunter2"
              },
              "https://index.docker.io/v1/": {
                "username": "mobydock",
                "password": "conta1n3rize14"
              }
            }
            ```
@y
            ```
            {
              "docker.example.com": {
                "username": "janedoe",
                "password": "hunter2"
              },
              "https://index.docker.io/v1/": {
                "username": "mobydock",
                "password": "conta1n3rize14"
              }
            }
            ```
@z

@x
            Only the registry domain name (and port if not the default 443) are required. However, for legacy reasons, the Docker Hub registry must be specified with both a `https://` prefix and a `/v1/` suffix even though Docker will prefer to use the v2 registry API.
          type: "string"
      responses:
        200:
          description: "no error"
        400:
          description: "Bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      tags: ["Image"]
  /images/create:
    post:
      summary: "Create an image"
      description: "Create an image by either pulling it from a registry or importing it."
      operationId: "ImageCreate"
      consumes:
        - "text/plain"
        - "application/octet-stream"
      produces:
        - "application/json"
      responses:
        200:
          description: "no error"
        404:
          description: "repository does not exist or no read access"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "fromImage"
          in: "query"
          description: "Name of the image to pull. The name may include a tag or digest. This parameter may only be used when pulling an image. The pull is cancelled if the HTTP connection is closed."
          type: "string"
        - name: "fromSrc"
          in: "query"
          description: "Source to import. The value may be a URL from which the image can be retrieved or `-` to read the image from the request body. This parameter may only be used when importing an image."
          type: "string"
        - name: "repo"
          in: "query"
          description: "Repository name given to an image when it is imported. The repo may include a tag. This parameter may only be used when importing an image."
          type: "string"
        - name: "tag"
          in: "query"
          description: "Tag or digest. If empty when pulling an image, this causes all tags for the given image to be pulled."
          type: "string"
        - name: "inputImage"
          in: "body"
          description: "Image content if the value `-` has been specified in fromSrc query parameter"
          schema:
            type: "string"
          required: false
        - name: "X-Registry-Auth"
          in: "header"
          description: "A base64-encoded auth configuration. [See the authentication section for details.](#section/Authentication)"
          type: "string"
      tags: ["Image"]
  /images/{name}/json:
    get:
      summary: "Inspect an image"
      description: "Return low-level information about an image."
      operationId: "ImageInspect"
      produces:
        - "application/json"
      responses:
        200:
          description: "No error"
          schema:
            $ref: "#/definitions/Image"
          examples:
            application/json:
              Id: "sha256:85f05633ddc1c50679be2b16a0479ab6f7637f8884e0cfe0f4d20e1ebb3d6e7c"
              Container: "cb91e48a60d01f1e27028b4fc6819f4f290b3cf12496c8176ec714d0d390984a"
              Comment: ""
              Os: "linux"
              Architecture: "amd64"
              Parent: "sha256:91e54dfb11794fad694460162bf0cb0a4fa710cfa3f60979c177d920813e267c"
              ContainerConfig:
                Tty: false
                Hostname: "e611e15f9c9d"
                Domainname: ""
                AttachStdout: false
                PublishService: ""
                AttachStdin: false
                OpenStdin: false
                StdinOnce: false
                NetworkDisabled: false
                OnBuild: []
                Image: "91e54dfb11794fad694460162bf0cb0a4fa710cfa3f60979c177d920813e267c"
                User: ""
                WorkingDir: ""
                MacAddress: ""
                AttachStderr: false
                Labels:
                  com.example.license: "GPL"
                  com.example.version: "1.0"
                  com.example.vendor: "Acme"
                Env:
                  - "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
                Cmd:
                  - "/bin/sh"
                  - "-c"
                  - "#(nop) LABEL com.example.vendor=Acme com.example.license=GPL com.example.version=1.0"
              DockerVersion: "1.9.0-dev"
              VirtualSize: 188359297
              Size: 0
              Author: ""
              Created: "2015-09-10T08:30:53.26995814Z"
              GraphDriver:
                Name: "aufs"
                Data: {}
              RepoDigests:
                - "localhost:5000/test/busybox/example@sha256:cbbf2f9a99b47fc460d422812b6a5adff7dfee951d8fa2e4a98caa0382cfbdbf"
              RepoTags:
                - "example:1.0"
                - "example:latest"
                - "example:stable"
              Config:
                Image: "91e54dfb11794fad694460162bf0cb0a4fa710cfa3f60979c177d920813e267c"
                NetworkDisabled: false
                OnBuild: []
                StdinOnce: false
                PublishService: ""
                AttachStdin: false
                OpenStdin: false
                Domainname: ""
                AttachStdout: false
                Tty: false
                Hostname: "e611e15f9c9d"
                Cmd:
                  - "/bin/bash"
                Env:
                  - "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
                Labels:
                  com.example.vendor: "Acme"
                  com.example.version: "1.0"
                  com.example.license: "GPL"
                MacAddress: ""
                AttachStderr: false
                WorkingDir: ""
                User: ""
              RootFS:
                Type: "layers"
                Layers:
                  - "sha256:1834950e52ce4d5a88a1bbd131c537f4d0e56d10ff0dd69e66be3b7dfa9df7e6"
                  - "sha256:5f70bf18a086007016e948b04aed3b82103a36bea41755b6cddfaf10ace3c6ef"
        404:
          description: "No such image"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such image: someimage (tag: latest)"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "name"
          in: "path"
          description: "Image name or id"
          type: "string"
          required: true
      tags: ["Image"]
  /images/{name}/history:
    get:
      summary: "Get the history of an image"
      description: "Return parent layers of an image."
      operationId: "ImageHistory"
      produces: ["application/json"]
      responses:
        200:
          description: "List of image layers"
          schema:
            type: "array"
            items:
              type: "object"
              x-go-name: HistoryResponseItem
              required: [Id, Created, CreatedBy, Tags, Size, Comment]
              properties:
                Id:
                  type: "string"
                  x-nullable: false
                Created:
                  type: "integer"
                  format: "int64"
                  x-nullable: false
                CreatedBy:
                  type: "string"
                  x-nullable: false
                Tags:
                  type: "array"
                  items:
                    type: "string"
                Size:
                  type: "integer"
                  format: "int64"
                  x-nullable: false
                Comment:
                  type: "string"
                  x-nullable: false
          examples:
            application/json:
              - Id: "3db9c44f45209632d6050b35958829c3a2aa256d81b9a7be45b362ff85c54710"
                Created: 1398108230
                CreatedBy: "/bin/sh -c #(nop) ADD file:eb15dbd63394e063b805a3c32ca7bf0266ef64676d5a6fab4801f2e81e2a5148 in /"
                Tags:
                  - "ubuntu:lucid"
                  - "ubuntu:10.04"
                Size: 182964289
                Comment: ""
              - Id: "6cfa4d1f33fb861d4d114f43b25abd0ac737509268065cdfd69d544a59c85ab8"
                Created: 1398108222
                CreatedBy: "/bin/sh -c #(nop) MAINTAINER Tianon Gravi <admwiggin@gmail.com> - mkimage-debootstrap.sh -i iproute,iputils-ping,ubuntu-minimal -t lucid.tar.xz lucid http://archive.ubuntu.com/ubuntu/"
                Tags: []
                Size: 0
                Comment: ""
              - Id: "511136ea3c5a64f264b78b5433614aec563103b4d4702f3ba7d4d2698e22c158"
                Created: 1371157430
                CreatedBy: ""
                Tags:
                  - "scratch12:latest"
                  - "scratch:latest"
                Size: 0
                Comment: "Imported from -"
        404:
          description: "No such image"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "name"
          in: "path"
          description: "Image name or ID"
          type: "string"
          required: true
      tags: ["Image"]
  /images/{name}/push:
    post:
      summary: "Push an image"
      description: |
        Push an image to a registry.
@y
            Only the registry domain name (and port if not the default 443) are required. However, for legacy reasons, the Docker Hub registry must be specified with both a `https://` prefix and a `/v1/` suffix even though Docker will prefer to use the v2 registry API.
          type: "string"
      responses:
        200:
          description: "no error"
        400:
          description: "Bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      tags: ["Image"]
  /images/create:
    post:
      summary: "Create an image"
      description: "Create an image by either pulling it from a registry or importing it."
      operationId: "ImageCreate"
      consumes:
        - "text/plain"
        - "application/octet-stream"
      produces:
        - "application/json"
      responses:
        200:
          description: "no error"
        404:
          description: "repository does not exist or no read access"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "fromImage"
          in: "query"
          description: "Name of the image to pull. The name may include a tag or digest. This parameter may only be used when pulling an image. The pull is cancelled if the HTTP connection is closed."
          type: "string"
        - name: "fromSrc"
          in: "query"
          description: "Source to import. The value may be a URL from which the image can be retrieved or `-` to read the image from the request body. This parameter may only be used when importing an image."
          type: "string"
        - name: "repo"
          in: "query"
          description: "Repository name given to an image when it is imported. The repo may include a tag. This parameter may only be used when importing an image."
          type: "string"
        - name: "tag"
          in: "query"
          description: "Tag or digest. If empty when pulling an image, this causes all tags for the given image to be pulled."
          type: "string"
        - name: "inputImage"
          in: "body"
          description: "Image content if the value `-` has been specified in fromSrc query parameter"
          schema:
            type: "string"
          required: false
        - name: "X-Registry-Auth"
          in: "header"
          description: "A base64-encoded auth configuration. [See the authentication section for details.](#section/Authentication)"
          type: "string"
      tags: ["Image"]
  /images/{name}/json:
    get:
      summary: "Inspect an image"
      description: "Return low-level information about an image."
      operationId: "ImageInspect"
      produces:
        - "application/json"
      responses:
        200:
          description: "No error"
          schema:
            $ref: "#/definitions/Image"
          examples:
            application/json:
              Id: "sha256:85f05633ddc1c50679be2b16a0479ab6f7637f8884e0cfe0f4d20e1ebb3d6e7c"
              Container: "cb91e48a60d01f1e27028b4fc6819f4f290b3cf12496c8176ec714d0d390984a"
              Comment: ""
              Os: "linux"
              Architecture: "amd64"
              Parent: "sha256:91e54dfb11794fad694460162bf0cb0a4fa710cfa3f60979c177d920813e267c"
              ContainerConfig:
                Tty: false
                Hostname: "e611e15f9c9d"
                Domainname: ""
                AttachStdout: false
                PublishService: ""
                AttachStdin: false
                OpenStdin: false
                StdinOnce: false
                NetworkDisabled: false
                OnBuild: []
                Image: "91e54dfb11794fad694460162bf0cb0a4fa710cfa3f60979c177d920813e267c"
                User: ""
                WorkingDir: ""
                MacAddress: ""
                AttachStderr: false
                Labels:
                  com.example.license: "GPL"
                  com.example.version: "1.0"
                  com.example.vendor: "Acme"
                Env:
                  - "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
                Cmd:
                  - "/bin/sh"
                  - "-c"
                  - "#(nop) LABEL com.example.vendor=Acme com.example.license=GPL com.example.version=1.0"
              DockerVersion: "1.9.0-dev"
              VirtualSize: 188359297
              Size: 0
              Author: ""
              Created: "2015-09-10T08:30:53.26995814Z"
              GraphDriver:
                Name: "aufs"
                Data: {}
              RepoDigests:
                - "localhost:5000/test/busybox/example@sha256:cbbf2f9a99b47fc460d422812b6a5adff7dfee951d8fa2e4a98caa0382cfbdbf"
              RepoTags:
                - "example:1.0"
                - "example:latest"
                - "example:stable"
              Config:
                Image: "91e54dfb11794fad694460162bf0cb0a4fa710cfa3f60979c177d920813e267c"
                NetworkDisabled: false
                OnBuild: []
                StdinOnce: false
                PublishService: ""
                AttachStdin: false
                OpenStdin: false
                Domainname: ""
                AttachStdout: false
                Tty: false
                Hostname: "e611e15f9c9d"
                Cmd:
                  - "/bin/bash"
                Env:
                  - "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
                Labels:
                  com.example.vendor: "Acme"
                  com.example.version: "1.0"
                  com.example.license: "GPL"
                MacAddress: ""
                AttachStderr: false
                WorkingDir: ""
                User: ""
              RootFS:
                Type: "layers"
                Layers:
                  - "sha256:1834950e52ce4d5a88a1bbd131c537f4d0e56d10ff0dd69e66be3b7dfa9df7e6"
                  - "sha256:5f70bf18a086007016e948b04aed3b82103a36bea41755b6cddfaf10ace3c6ef"
        404:
          description: "No such image"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such image: someimage (tag: latest)"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "name"
          in: "path"
          description: "Image name or id"
          type: "string"
          required: true
      tags: ["Image"]
  /images/{name}/history:
    get:
      summary: "Get the history of an image"
      description: "Return parent layers of an image."
      operationId: "ImageHistory"
      produces: ["application/json"]
      responses:
        200:
          description: "List of image layers"
          schema:
            type: "array"
            items:
              type: "object"
              x-go-name: HistoryResponseItem
              required: [Id, Created, CreatedBy, Tags, Size, Comment]
              properties:
                Id:
                  type: "string"
                  x-nullable: false
                Created:
                  type: "integer"
                  format: "int64"
                  x-nullable: false
                CreatedBy:
                  type: "string"
                  x-nullable: false
                Tags:
                  type: "array"
                  items:
                    type: "string"
                Size:
                  type: "integer"
                  format: "int64"
                  x-nullable: false
                Comment:
                  type: "string"
                  x-nullable: false
          examples:
            application/json:
              - Id: "3db9c44f45209632d6050b35958829c3a2aa256d81b9a7be45b362ff85c54710"
                Created: 1398108230
                CreatedBy: "/bin/sh -c #(nop) ADD file:eb15dbd63394e063b805a3c32ca7bf0266ef64676d5a6fab4801f2e81e2a5148 in /"
                Tags:
                  - "ubuntu:lucid"
                  - "ubuntu:10.04"
                Size: 182964289
                Comment: ""
              - Id: "6cfa4d1f33fb861d4d114f43b25abd0ac737509268065cdfd69d544a59c85ab8"
                Created: 1398108222
                CreatedBy: "/bin/sh -c #(nop) MAINTAINER Tianon Gravi <admwiggin@gmail.com> - mkimage-debootstrap.sh -i iproute,iputils-ping,ubuntu-minimal -t lucid.tar.xz lucid http://archive.ubuntu.com/ubuntu/"
                Tags: []
                Size: 0
                Comment: ""
              - Id: "511136ea3c5a64f264b78b5433614aec563103b4d4702f3ba7d4d2698e22c158"
                Created: 1371157430
                CreatedBy: ""
                Tags:
                  - "scratch12:latest"
                  - "scratch:latest"
                Size: 0
                Comment: "Imported from -"
        404:
          description: "No such image"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "name"
          in: "path"
          description: "Image name or ID"
          type: "string"
          required: true
      tags: ["Image"]
  /images/{name}/push:
    post:
      summary: "Push an image"
      description: |
        Push an image to a registry.
@z

@x
        If you wish to push an image on to a private registry, that image must already have a tag which references the registry. For example, `registry.example.com/myimage:latest`.
@y
        If you wish to push an image on to a private registry, that image must already have a tag which references the registry. For example, `registry.example.com/myimage:latest`.
@z

@x
        The push is cancelled if the HTTP connection is closed.
      operationId: "ImagePush"
      consumes:
        - "application/octet-stream"
      responses:
        200:
          description: "No error"
        404:
          description: "No such image"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "name"
          in: "path"
          description: |
            Name of the image to push. For example, `registry.example.com/myimage`.
            The image must be present in the local image store with the same name.
@y
        The push is cancelled if the HTTP connection is closed.
      operationId: "ImagePush"
      consumes:
        - "application/octet-stream"
      responses:
        200:
          description: "No error"
        404:
          description: "No such image"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "name"
          in: "path"
          description: |
            Name of the image to push. For example, `registry.example.com/myimage`.
            The image must be present in the local image store with the same name.
@z

@x
            The name should be provided without tag; if a tag is provided, it
            is ignored. For example, `registry.example.com/myimage:latest` is
            considered equivalent to `registry.example.com/myimage`.
@y
            The name should be provided without tag; if a tag is provided, it
            is ignored. For example, `registry.example.com/myimage:latest` is
            considered equivalent to `registry.example.com/myimage`.
@z

@x
            Use the `tag` parameter to specify the tag to push.
          type: "string"
          required: true
        - name: "tag"
          in: "query"
          description: |
            Tag of the image to push. For example, `latest`. If no tag is provided,
            all tags of the given image that are present in the local image store
            are pushed.
          type: "string"
        - name: "X-Registry-Auth"
          in: "header"
          description: "A base64-encoded auth configuration. [See the authentication section for details.](#section/Authentication)"
          type: "string"
          required: true
      tags: ["Image"]
  /images/{name}/tag:
    post:
      summary: "Tag an image"
      description: "Tag an image so that it becomes part of a repository."
      operationId: "ImageTag"
      responses:
        201:
          description: "No error"
        400:
          description: "Bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "No such image"
          schema:
            $ref: "#/definitions/ErrorResponse"
        409:
          description: "Conflict"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "name"
          in: "path"
          description: "Image name or ID to tag."
          type: "string"
          required: true
        - name: "repo"
          in: "query"
          description: "The repository to tag in. For example, `someuser/someimage`."
          type: "string"
        - name: "tag"
          in: "query"
          description: "The name of the new tag."
          type: "string"
      tags: ["Image"]
  /images/{name}:
    delete:
      summary: "Remove an image"
      description: |
        Remove an image, along with any untagged parent images that were
        referenced by that image.
@y
            Use the `tag` parameter to specify the tag to push.
          type: "string"
          required: true
        - name: "tag"
          in: "query"
          description: |
            Tag of the image to push. For example, `latest`. If no tag is provided,
            all tags of the given image that are present in the local image store
            are pushed.
          type: "string"
        - name: "X-Registry-Auth"
          in: "header"
          description: "A base64-encoded auth configuration. [See the authentication section for details.](#section/Authentication)"
          type: "string"
          required: true
      tags: ["Image"]
  /images/{name}/tag:
    post:
      summary: "Tag an image"
      description: "Tag an image so that it becomes part of a repository."
      operationId: "ImageTag"
      responses:
        201:
          description: "No error"
        400:
          description: "Bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "No such image"
          schema:
            $ref: "#/definitions/ErrorResponse"
        409:
          description: "Conflict"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "name"
          in: "path"
          description: "Image name or ID to tag."
          type: "string"
          required: true
        - name: "repo"
          in: "query"
          description: "The repository to tag in. For example, `someuser/someimage`."
          type: "string"
        - name: "tag"
          in: "query"
          description: "The name of the new tag."
          type: "string"
      tags: ["Image"]
  /images/{name}:
    delete:
      summary: "Remove an image"
      description: |
        Remove an image, along with any untagged parent images that were
        referenced by that image.
@z

@x
        Images can't be removed if they have descendant images, are being
        used by a running container or are being used by a build.
      operationId: "ImageDelete"
      produces: ["application/json"]
      responses:
        200:
          description: "The image was deleted successfully"
          schema:
            type: "array"
            items:
              $ref: "#/definitions/ImageDeleteResponseItem"
          examples:
            application/json:
              - Untagged: "3e2f21a89f"
              - Deleted: "3e2f21a89f"
              - Deleted: "53b4f83ac9"
        404:
          description: "No such image"
          schema:
            $ref: "#/definitions/ErrorResponse"
        409:
          description: "Conflict"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "name"
          in: "path"
          description: "Image name or ID"
          type: "string"
          required: true
        - name: "force"
          in: "query"
          description: "Remove the image even if it is being used by stopped containers or has other tags"
          type: "boolean"
          default: false
        - name: "noprune"
          in: "query"
          description: "Do not delete untagged parent images"
          type: "boolean"
          default: false
      tags: ["Image"]
  /images/search:
    get:
      summary: "Search images"
      description: "Search for an image on Docker Hub."
      operationId: "ImageSearch"
      produces:
        - "application/json"
      responses:
        200:
          description: "No error"
          schema:
            type: "array"
            items:
              type: "object"
              properties:
                description:
                  type: "string"
                is_official:
                  type: "boolean"
                is_automated:
                  type: "boolean"
                name:
                  type: "string"
                star_count:
                  type: "integer"
          examples:
            application/json:
              - description: ""
                is_official: false
                is_automated: false
                name: "wma55/u1210sshd"
                star_count: 0
              - description: ""
                is_official: false
                is_automated: false
                name: "jdswinbank/sshd"
                star_count: 0
              - description: ""
                is_official: false
                is_automated: false
                name: "vgauthier/sshd"
                star_count: 0
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "term"
          in: "query"
          description: "Term to search"
          type: "string"
          required: true
        - name: "limit"
          in: "query"
          description: "Maximum number of results to return"
          type: "integer"
        - name: "filters"
          in: "query"
          description: |
            A JSON encoded value of the filters (a `map[string][]string`) to process on the images list. Available filters:
@y
        Images can't be removed if they have descendant images, are being
        used by a running container or are being used by a build.
      operationId: "ImageDelete"
      produces: ["application/json"]
      responses:
        200:
          description: "The image was deleted successfully"
          schema:
            type: "array"
            items:
              $ref: "#/definitions/ImageDeleteResponseItem"
          examples:
            application/json:
              - Untagged: "3e2f21a89f"
              - Deleted: "3e2f21a89f"
              - Deleted: "53b4f83ac9"
        404:
          description: "No such image"
          schema:
            $ref: "#/definitions/ErrorResponse"
        409:
          description: "Conflict"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "name"
          in: "path"
          description: "Image name or ID"
          type: "string"
          required: true
        - name: "force"
          in: "query"
          description: "Remove the image even if it is being used by stopped containers or has other tags"
          type: "boolean"
          default: false
        - name: "noprune"
          in: "query"
          description: "Do not delete untagged parent images"
          type: "boolean"
          default: false
      tags: ["Image"]
  /images/search:
    get:
      summary: "Search images"
      description: "Search for an image on Docker Hub."
      operationId: "ImageSearch"
      produces:
        - "application/json"
      responses:
        200:
          description: "No error"
          schema:
            type: "array"
            items:
              type: "object"
              properties:
                description:
                  type: "string"
                is_official:
                  type: "boolean"
                is_automated:
                  type: "boolean"
                name:
                  type: "string"
                star_count:
                  type: "integer"
          examples:
            application/json:
              - description: ""
                is_official: false
                is_automated: false
                name: "wma55/u1210sshd"
                star_count: 0
              - description: ""
                is_official: false
                is_automated: false
                name: "jdswinbank/sshd"
                star_count: 0
              - description: ""
                is_official: false
                is_automated: false
                name: "vgauthier/sshd"
                star_count: 0
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "term"
          in: "query"
          description: "Term to search"
          type: "string"
          required: true
        - name: "limit"
          in: "query"
          description: "Maximum number of results to return"
          type: "integer"
        - name: "filters"
          in: "query"
          description: |
            A JSON encoded value of the filters (a `map[string][]string`) to process on the images list. Available filters:
@z

@x
            - `is-automated=(true|false)`
            - `is-official=(true|false)`
            - `stars=<number>` Matches images that has at least 'number' stars.
          type: "string"
      tags: ["Image"]
  /images/prune:
    post:
      summary: "Delete unused images"
      produces:
        - "application/json"
      operationId: "ImagePrune"
      parameters:
        - name: "filters"
          in: "query"
          description: |
            Filters to process on the prune list, encoded as JSON (a `map[string][]string`). Available filters:
@y
            - `is-automated=(true|false)`
            - `is-official=(true|false)`
            - `stars=<number>` Matches images that has at least 'number' stars.
          type: "string"
      tags: ["Image"]
  /images/prune:
    post:
      summary: "Delete unused images"
      produces:
        - "application/json"
      operationId: "ImagePrune"
      parameters:
        - name: "filters"
          in: "query"
          description: |
            Filters to process on the prune list, encoded as JSON (a `map[string][]string`). Available filters:
@z

@x
            - `dangling=<boolean>` When set to `true` (or `1`), prune only
               unused *and* untagged images. When set to `false`
               (or `0`), all unused images are pruned.
            - `until=<string>` Prune images created before this timestamp. The `<timestamp>` can be Unix timestamps, date formatted timestamps, or Go duration strings (e.g. `10m`, `1h30m`) computed relative to the daemon machine’s time.
            - `label` (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or `label!=<key>=<value>`) Prune images with (or without, in case `label!=...` is used) the specified labels.
          type: "string"
      responses:
        200:
          description: "No error"
          schema:
            type: "object"
            properties:
              ImagesDeleted:
                description: "Images that were deleted"
                type: "array"
                items:
                  $ref: "#/definitions/ImageDeleteResponseItem"
              SpaceReclaimed:
                description: "Disk space reclaimed in bytes"
                type: "integer"
                format: "int64"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      tags: ["Image"]
  /auth:
    post:
      summary: "Check auth configuration"
      description: "Validate credentials for a registry and, if available, get an identity token for accessing the registry without password."
      operationId: "SystemAuth"
      consumes: ["application/json"]
      produces: ["application/json"]
      responses:
        200:
          description: "An identity token was generated successfully."
          schema:
            type: "object"
            required: [Status]
            properties:
              Status:
                description: "The status of the authentication"
                type: "string"
                x-nullable: false
              IdentityToken:
                description: "An opaque token used to authenticate a user after a successful login"
                type: "string"
                x-nullable: false
          examples:
            application/json:
              Status: "Login Succeeded"
              IdentityToken: "9cbaf023786cd7..."
        204:
          description: "No error"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "authConfig"
          in: "body"
          description: "Authentication to check"
          schema:
            $ref: "#/definitions/AuthConfig"
      tags: ["System"]
  /info:
    get:
      summary: "Get system information"
      operationId: "SystemInfo"
      produces:
        - "application/json"
      responses:
        200:
          description: "No error"
          schema:
            type: "object"
            properties:
              Architecture:
                type: "string"
              Containers:
                type: "integer"
              ContainersRunning:
                type: "integer"
              ContainersStopped:
                type: "integer"
              ContainersPaused:
                type: "integer"
              CpuCfsPeriod:
                type: "boolean"
              CpuCfsQuota:
                type: "boolean"
              Debug:
                type: "boolean"
              DiscoveryBackend:
                type: "string"
              DockerRootDir:
                type: "string"
              Driver:
                type: "string"
              DriverStatus:
                type: "array"
                items:
                  type: "array"
                  items:
                    type: "string"
              SystemStatus:
                type: "array"
                items:
                  type: "array"
                  items:
                    type: "string"
              Plugins:
                type: "object"
                properties:
                  Volume:
                    type: "array"
                    items:
                      type: "string"
                  Network:
                    type: "array"
                    items:
                      type: "string"
                  Log:
                    type: "array"
                    items:
                      type: "string"
              ExperimentalBuild:
                type: "boolean"
              HttpProxy:
                type: "string"
              HttpsProxy:
                type: "string"
              ID:
                type: "string"
              IPv4Forwarding:
                type: "boolean"
              Images:
                type: "integer"
              IndexServerAddress:
                type: "string"
              InitPath:
                type: "string"
              InitSha1:
                type: "string"
              KernelVersion:
                type: "string"
              Labels:
                type: "array"
                items:
                  type: "string"
              MemTotal:
                type: "integer"
              MemoryLimit:
                type: "boolean"
              NCPU:
                type: "integer"
              NEventsListener:
                type: "integer"
              NFd:
                type: "integer"
              NGoroutines:
                type: "integer"
              Name:
                type: "string"
              NoProxy:
                type: "string"
              OomKillDisable:
                type: "boolean"
              OSType:
                type: "string"
              OomScoreAdj:
                type: "integer"
              OperatingSystem:
                type: "string"
              RegistryConfig:
                type: "object"
                properties:
                  IndexConfigs:
                    type: "object"
                    additionalProperties:
                      type: "object"
                      properties:
                        Mirrors:
                          type: "array"
                          items:
                            type: "string"
                        Name:
                          type: "string"
                        Official:
                          type: "boolean"
                        Secure:
                          type: "boolean"
                  InsecureRegistryCIDRs:
                    type: "array"
                    items:
                      type: "string"
              SwapLimit:
                type: "boolean"
              SystemTime:
                type: "string"
              ServerVersion:
                type: "string"
          examples:
            application/json:
              Architecture: "x86_64"
              ClusterStore: "etcd://localhost:2379"
              CgroupDriver: "cgroupfs"
              Containers: 11
              ContainersRunning: 7
              ContainersStopped: 3
              ContainersPaused: 1
              CpuCfsPeriod: true
              CpuCfsQuota: true
              Debug: false
              DockerRootDir: "/var/lib/docker"
              Driver: "btrfs"
              DriverStatus:
                -
                  - ""
              ExperimentalBuild: false
              HttpProxy: "http://test:test@localhost:8080"
              HttpsProxy: "https://test:test@localhost:8080"
              ID: "7TRN:IPZB:QYBB:VPBQ:UMPP:KARE:6ZNR:XE6T:7EWV:PKF4:ZOJD:TPYS"
              IPv4Forwarding: true
              Images: 16
              IndexServerAddress: "https://index.docker.io/v1/"
              InitPath: "/usr/bin/docker"
              InitSha1: ""
              KernelMemory: true
              KernelVersion: "3.12.0-1-amd64"
              Labels:
                - "storage=ssd"
              MemTotal: 2099236864
              MemoryLimit: true
              NCPU: 1
              NEventsListener: 0
              NFd: 11
              NGoroutines: 21
              Name: "prod-server-42"
              NoProxy: "9.81.1.160"
              OomKillDisable: true
              OSType: "linux"
              OperatingSystem: "Boot2Docker"
              Plugins:
                Volume:
                  - "local"
                Network:
                  - "null"
                  - "host"
                  - "bridge"
              RegistryConfig:
                IndexConfigs:
                  docker.io:
                    Name: "docker.io"
                    Official: true
                    Secure: true
                InsecureRegistryCIDRs:
                  - "127.0.0.0/8"
              SecurityOptions:
                - Key: "Name"
                  Value: "seccomp"
                - Key: "Profile"
                  Value: "default"
                - Key: "Name"
                  Value: "apparmor"
                - Key: "Name"
                  Value: "selinux"
                - Key: "Name"
                  Value: "userns"
              ServerVersion: "1.9.0"
              SwapLimit: false
              SystemStatus:
                -
                  - "State"
                  - "Healthy"
              SystemTime: "2015-03-10T11:11:23.730591467-07:00"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      tags: ["System"]
  /version:
    get:
      summary: "Get version"
      description: "Returns the version of Docker that is running and various information about the system that Docker is running on."
      operationId: "SystemVersion"
      produces: ["application/json"]
      responses:
        200:
          description: "no error"
          schema:
            type: "object"
            properties:
              Version:
                type: "string"
              ApiVersion:
                type: "string"
              MinAPIVersion:
                type: "string"
              GitCommit:
                type: "string"
              GoVersion:
                type: "string"
              Os:
                type: "string"
              Arch:
                type: "string"
              KernelVersion:
                type: "string"
              Experimental:
                type: "boolean"
              BuildTime:
                type: "string"
          examples:
            application/json:
              Version: "17.04.0"
              Os: "linux"
              KernelVersion: "3.19.0-23-generic"
              GoVersion: "go1.7.5"
              GitCommit: "deadbee"
              Arch: "amd64"
              ApiVersion: "1.27"
              MinAPIVersion: "1.12"
              BuildTime: "2016-06-14T07:09:13.444803460+00:00"
              Experimental: true
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      tags: ["System"]
  /_ping:
    get:
      summary: "Ping"
      description: "This is a dummy endpoint you can use to test if the server is accessible."
      operationId: "SystemPing"
      produces: ["text/plain"]
      responses:
        200:
          description: "no error"
          schema:
            type: "string"
            example: "OK"
          headers:
            Api-Version:
              type: "string"
              description: "Max API Version the server supports"
            Docker-Experimental:
              type: "boolean"
              description: "If the server is running with experimental mode enabled"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      tags: ["System"]
  /commit:
    post:
      summary: "Create a new image from a container"
      operationId: "ImageCommit"
      consumes:
        - "application/json"
      produces:
        - "application/json"
      responses:
        201:
          description: "no error"
          schema:
            $ref: "#/definitions/IdResponse"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "containerConfig"
          in: "body"
          description: "The container configuration"
          schema:
            $ref: "#/definitions/ContainerConfig"
        - name: "container"
          in: "query"
          description: "The ID or name of the container to commit"
          type: "string"
        - name: "repo"
          in: "query"
          description: "Repository name for the created image"
          type: "string"
        - name: "tag"
          in: "query"
          description: "Tag name for the create image"
          type: "string"
        - name: "comment"
          in: "query"
          description: "Commit message"
          type: "string"
        - name: "author"
          in: "query"
          description: "Author of the image (e.g., `John Hannibal Smith <hannibal@a-team.com>`)"
          type: "string"
        - name: "pause"
          in: "query"
          description: "Whether to pause the container before committing"
          type: "boolean"
          default: true
        - name: "changes"
          in: "query"
          description: "`Dockerfile` instructions to apply while committing"
          type: "string"
      tags: ["Image"]
  /events:
    get:
      summary: "Monitor events"
      description: |
        Stream real-time events from the server.
@y
            - `dangling=<boolean>` When set to `true` (or `1`), prune only
               unused *and* untagged images. When set to `false`
               (or `0`), all unused images are pruned.
            - `until=<string>` Prune images created before this timestamp. The `<timestamp>` can be Unix timestamps, date formatted timestamps, or Go duration strings (e.g. `10m`, `1h30m`) computed relative to the daemon machine’s time.
            - `label` (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or `label!=<key>=<value>`) Prune images with (or without, in case `label!=...` is used) the specified labels.
          type: "string"
      responses:
        200:
          description: "No error"
          schema:
            type: "object"
            properties:
              ImagesDeleted:
                description: "Images that were deleted"
                type: "array"
                items:
                  $ref: "#/definitions/ImageDeleteResponseItem"
              SpaceReclaimed:
                description: "Disk space reclaimed in bytes"
                type: "integer"
                format: "int64"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      tags: ["Image"]
  /auth:
    post:
      summary: "Check auth configuration"
      description: "Validate credentials for a registry and, if available, get an identity token for accessing the registry without password."
      operationId: "SystemAuth"
      consumes: ["application/json"]
      produces: ["application/json"]
      responses:
        200:
          description: "An identity token was generated successfully."
          schema:
            type: "object"
            required: [Status]
            properties:
              Status:
                description: "The status of the authentication"
                type: "string"
                x-nullable: false
              IdentityToken:
                description: "An opaque token used to authenticate a user after a successful login"
                type: "string"
                x-nullable: false
          examples:
            application/json:
              Status: "Login Succeeded"
              IdentityToken: "9cbaf023786cd7..."
        204:
          description: "No error"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "authConfig"
          in: "body"
          description: "Authentication to check"
          schema:
            $ref: "#/definitions/AuthConfig"
      tags: ["System"]
  /info:
    get:
      summary: "Get system information"
      operationId: "SystemInfo"
      produces:
        - "application/json"
      responses:
        200:
          description: "No error"
          schema:
            type: "object"
            properties:
              Architecture:
                type: "string"
              Containers:
                type: "integer"
              ContainersRunning:
                type: "integer"
              ContainersStopped:
                type: "integer"
              ContainersPaused:
                type: "integer"
              CpuCfsPeriod:
                type: "boolean"
              CpuCfsQuota:
                type: "boolean"
              Debug:
                type: "boolean"
              DiscoveryBackend:
                type: "string"
              DockerRootDir:
                type: "string"
              Driver:
                type: "string"
              DriverStatus:
                type: "array"
                items:
                  type: "array"
                  items:
                    type: "string"
              SystemStatus:
                type: "array"
                items:
                  type: "array"
                  items:
                    type: "string"
              Plugins:
                type: "object"
                properties:
                  Volume:
                    type: "array"
                    items:
                      type: "string"
                  Network:
                    type: "array"
                    items:
                      type: "string"
                  Log:
                    type: "array"
                    items:
                      type: "string"
              ExperimentalBuild:
                type: "boolean"
              HttpProxy:
                type: "string"
              HttpsProxy:
                type: "string"
              ID:
                type: "string"
              IPv4Forwarding:
                type: "boolean"
              Images:
                type: "integer"
              IndexServerAddress:
                type: "string"
              InitPath:
                type: "string"
              InitSha1:
                type: "string"
              KernelVersion:
                type: "string"
              Labels:
                type: "array"
                items:
                  type: "string"
              MemTotal:
                type: "integer"
              MemoryLimit:
                type: "boolean"
              NCPU:
                type: "integer"
              NEventsListener:
                type: "integer"
              NFd:
                type: "integer"
              NGoroutines:
                type: "integer"
              Name:
                type: "string"
              NoProxy:
                type: "string"
              OomKillDisable:
                type: "boolean"
              OSType:
                type: "string"
              OomScoreAdj:
                type: "integer"
              OperatingSystem:
                type: "string"
              RegistryConfig:
                type: "object"
                properties:
                  IndexConfigs:
                    type: "object"
                    additionalProperties:
                      type: "object"
                      properties:
                        Mirrors:
                          type: "array"
                          items:
                            type: "string"
                        Name:
                          type: "string"
                        Official:
                          type: "boolean"
                        Secure:
                          type: "boolean"
                  InsecureRegistryCIDRs:
                    type: "array"
                    items:
                      type: "string"
              SwapLimit:
                type: "boolean"
              SystemTime:
                type: "string"
              ServerVersion:
                type: "string"
          examples:
            application/json:
              Architecture: "x86_64"
              ClusterStore: "etcd://localhost:2379"
              CgroupDriver: "cgroupfs"
              Containers: 11
              ContainersRunning: 7
              ContainersStopped: 3
              ContainersPaused: 1
              CpuCfsPeriod: true
              CpuCfsQuota: true
              Debug: false
              DockerRootDir: "/var/lib/docker"
              Driver: "btrfs"
              DriverStatus:
                -
                  - ""
              ExperimentalBuild: false
              HttpProxy: "http://test:test@localhost:8080"
              HttpsProxy: "https://test:test@localhost:8080"
              ID: "7TRN:IPZB:QYBB:VPBQ:UMPP:KARE:6ZNR:XE6T:7EWV:PKF4:ZOJD:TPYS"
              IPv4Forwarding: true
              Images: 16
              IndexServerAddress: "https://index.docker.io/v1/"
              InitPath: "/usr/bin/docker"
              InitSha1: ""
              KernelMemory: true
              KernelVersion: "3.12.0-1-amd64"
              Labels:
                - "storage=ssd"
              MemTotal: 2099236864
              MemoryLimit: true
              NCPU: 1
              NEventsListener: 0
              NFd: 11
              NGoroutines: 21
              Name: "prod-server-42"
              NoProxy: "9.81.1.160"
              OomKillDisable: true
              OSType: "linux"
              OperatingSystem: "Boot2Docker"
              Plugins:
                Volume:
                  - "local"
                Network:
                  - "null"
                  - "host"
                  - "bridge"
              RegistryConfig:
                IndexConfigs:
                  docker.io:
                    Name: "docker.io"
                    Official: true
                    Secure: true
                InsecureRegistryCIDRs:
                  - "127.0.0.0/8"
              SecurityOptions:
                - Key: "Name"
                  Value: "seccomp"
                - Key: "Profile"
                  Value: "default"
                - Key: "Name"
                  Value: "apparmor"
                - Key: "Name"
                  Value: "selinux"
                - Key: "Name"
                  Value: "userns"
              ServerVersion: "1.9.0"
              SwapLimit: false
              SystemStatus:
                -
                  - "State"
                  - "Healthy"
              SystemTime: "2015-03-10T11:11:23.730591467-07:00"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      tags: ["System"]
  /version:
    get:
      summary: "Get version"
      description: "Returns the version of Docker that is running and various information about the system that Docker is running on."
      operationId: "SystemVersion"
      produces: ["application/json"]
      responses:
        200:
          description: "no error"
          schema:
            type: "object"
            properties:
              Version:
                type: "string"
              ApiVersion:
                type: "string"
              MinAPIVersion:
                type: "string"
              GitCommit:
                type: "string"
              GoVersion:
                type: "string"
              Os:
                type: "string"
              Arch:
                type: "string"
              KernelVersion:
                type: "string"
              Experimental:
                type: "boolean"
              BuildTime:
                type: "string"
          examples:
            application/json:
              Version: "17.04.0"
              Os: "linux"
              KernelVersion: "3.19.0-23-generic"
              GoVersion: "go1.7.5"
              GitCommit: "deadbee"
              Arch: "amd64"
              ApiVersion: "1.27"
              MinAPIVersion: "1.12"
              BuildTime: "2016-06-14T07:09:13.444803460+00:00"
              Experimental: true
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      tags: ["System"]
  /_ping:
    get:
      summary: "Ping"
      description: "This is a dummy endpoint you can use to test if the server is accessible."
      operationId: "SystemPing"
      produces: ["text/plain"]
      responses:
        200:
          description: "no error"
          schema:
            type: "string"
            example: "OK"
          headers:
            Api-Version:
              type: "string"
              description: "Max API Version the server supports"
            Docker-Experimental:
              type: "boolean"
              description: "If the server is running with experimental mode enabled"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      tags: ["System"]
  /commit:
    post:
      summary: "Create a new image from a container"
      operationId: "ImageCommit"
      consumes:
        - "application/json"
      produces:
        - "application/json"
      responses:
        201:
          description: "no error"
          schema:
            $ref: "#/definitions/IdResponse"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "containerConfig"
          in: "body"
          description: "The container configuration"
          schema:
            $ref: "#/definitions/ContainerConfig"
        - name: "container"
          in: "query"
          description: "The ID or name of the container to commit"
          type: "string"
        - name: "repo"
          in: "query"
          description: "Repository name for the created image"
          type: "string"
        - name: "tag"
          in: "query"
          description: "Tag name for the create image"
          type: "string"
        - name: "comment"
          in: "query"
          description: "Commit message"
          type: "string"
        - name: "author"
          in: "query"
          description: "Author of the image (e.g., `John Hannibal Smith <hannibal@a-team.com>`)"
          type: "string"
        - name: "pause"
          in: "query"
          description: "Whether to pause the container before committing"
          type: "boolean"
          default: true
        - name: "changes"
          in: "query"
          description: "`Dockerfile` instructions to apply while committing"
          type: "string"
      tags: ["Image"]
  /events:
    get:
      summary: "Monitor events"
      description: |
        Stream real-time events from the server.
@z

@x
        Various objects within Docker report events when something happens to them.
@y
        Various objects within Docker report events when something happens to them.
@z

@x
        Containers report these events: `attach`, `commit`, `copy`, `create`, `destroy`, `detach`, `die`, `exec_create`, `exec_detach`, `exec_start`, `export`, `health_status`, `kill`, `oom`, `pause`, `rename`, `resize`, `restart`, `start`, `stop`, `top`, `unpause`, and `update`
@y
        Containers report these events: `attach`, `commit`, `copy`, `create`, `destroy`, `detach`, `die`, `exec_create`, `exec_detach`, `exec_start`, `export`, `health_status`, `kill`, `oom`, `pause`, `rename`, `resize`, `restart`, `start`, `stop`, `top`, `unpause`, and `update`
@z

@x
        Images report these events: `delete`, `import`, `load`, `pull`, `push`, `save`, `tag`, and `untag`
@y
        Images report these events: `delete`, `import`, `load`, `pull`, `push`, `save`, `tag`, and `untag`
@z

@x
        Volumes report these events: `create`, `mount`, `unmount`, and `destroy`
@y
        Volumes report these events: `create`, `mount`, `unmount`, and `destroy`
@z

@x
        Networks report these events: `create`, `connect`, `disconnect`, `destroy`, `update`, and `remove`
@y
        Networks report these events: `create`, `connect`, `disconnect`, `destroy`, `update`, and `remove`
@z

@x
        The Docker daemon reports these events: `reload`
@y
        The Docker daemon reports these events: `reload`
@z

@x
        Services report these events: `create`, `update`, and `remove`
@y
        Services report these events: `create`, `update`, and `remove`
@z

@x
        Nodes report these events: `create`, `update`, and `remove`
@y
        Nodes report these events: `create`, `update`, and `remove`
@z

@x
        Secrets report these events: `create`, `update`, and `remove`
@y
        Secrets report these events: `create`, `update`, and `remove`
@z

@x
      operationId: "SystemEvents"
      produces:
        - "application/json"
      responses:
        200:
          description: "no error"
          schema:
            type: "object"
            properties:
              Type:
                description: "The type of object emitting the event"
                type: "string"
              Action:
                description: "The type of event"
                type: "string"
              Actor:
                type: "object"
                properties:
                  ID:
                    description: "The ID of the object emitting the event"
                    type: "string"
                  Attributes:
                    description: "Various key/value attributes of the object, depending on its type"
                    type: "object"
                    additionalProperties:
                      type: "string"
              time:
                description: "Timestamp of event"
                type: "integer"
              timeNano:
                description: "Timestamp of event, with nanosecond accuracy"
                type: "integer"
                format: "int64"
          examples:
            application/json:
              Type: "container"
              Action: "create"
              Actor:
                ID: "ede54ee1afda366ab42f824e8a5ffd195155d853ceaec74a927f249ea270c743"
                Attributes:
                  com.example.some-label: "some-label-value"
                  image: "alpine"
                  name: "my-container"
              time: 1461943101
        400:
          description: "bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "since"
          in: "query"
          description: "Show events created since this timestamp then stream new events."
          type: "string"
        - name: "until"
          in: "query"
          description: "Show events created until this timestamp then stop streaming."
          type: "string"
        - name: "filters"
          in: "query"
          description: |
            A JSON encoded value of filters (a `map[string][]string`) to process on the event list. Available filters:
@y
      operationId: "SystemEvents"
      produces:
        - "application/json"
      responses:
        200:
          description: "no error"
          schema:
            type: "object"
            properties:
              Type:
                description: "The type of object emitting the event"
                type: "string"
              Action:
                description: "The type of event"
                type: "string"
              Actor:
                type: "object"
                properties:
                  ID:
                    description: "The ID of the object emitting the event"
                    type: "string"
                  Attributes:
                    description: "Various key/value attributes of the object, depending on its type"
                    type: "object"
                    additionalProperties:
                      type: "string"
              time:
                description: "Timestamp of event"
                type: "integer"
              timeNano:
                description: "Timestamp of event, with nanosecond accuracy"
                type: "integer"
                format: "int64"
          examples:
            application/json:
              Type: "container"
              Action: "create"
              Actor:
                ID: "ede54ee1afda366ab42f824e8a5ffd195155d853ceaec74a927f249ea270c743"
                Attributes:
                  com.example.some-label: "some-label-value"
                  image: "alpine"
                  name: "my-container"
              time: 1461943101
        400:
          description: "bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "since"
          in: "query"
          description: "Show events created since this timestamp then stream new events."
          type: "string"
        - name: "until"
          in: "query"
          description: "Show events created until this timestamp then stop streaming."
          type: "string"
        - name: "filters"
          in: "query"
          description: |
            A JSON encoded value of filters (a `map[string][]string`) to process on the event list. Available filters:
@z

@x
            - `container=<string>` container name or ID
            - `daemon=<string>` daemon name or ID
            - `event=<string>` event type
            - `image=<string>` image name or ID
            - `label=<string>` image or container label
            - `network=<string>` network name or ID
            - `plugin`=<string> plugin name or ID
            - `scope`＝<string> local or swarm
            - `type=<string>` object to filter by, one of `container`, `image`, `volume`, `network`, `daemon`, `plugin`, `node`, `service` or `secret`
            - `volume=<string>` volume name or ID
          type: "string"
      tags: ["System"]
  /system/df:
    get:
      summary: "Get data usage information"
      operationId: "SystemDataUsage"
      responses:
        200:
          description: "no error"
          schema:
            type: "object"
            properties:
              LayersSize:
                type: "integer"
                format: "int64"
              Images:
                type: "array"
                items:
                  $ref: "#/definitions/ImageSummary"
              Containers:
                type: "array"
                items:
                  $ref: "#/definitions/ContainerSummary"
              Volumes:
                type: "array"
                items:
                  $ref: "#/definitions/Volume"
            example:
              LayersSize: 1092588
              Images:
                -
                  Id: "sha256:2b8fd9751c4c0f5dd266fcae00707e67a2545ef34f9a29354585f93dac906749"
                  ParentId: ""
                  RepoTags:
                    - "busybox:latest"
                  RepoDigests:
                    - "busybox@sha256:a59906e33509d14c036c8678d687bd4eec81ed7c4b8ce907b888c607f6a1e0e6"
                  Created: 1466724217
                  Size: 1092588
                  SharedSize: 0
                  VirtualSize: 1092588
                  Labels: {}
                  Containers: 1
              Containers:
                -
                  Id: "e575172ed11dc01bfce087fb27bee502db149e1a0fad7c296ad300bbff178148"
                  Names:
                    - "/top"
                  Image: "busybox"
                  ImageID: "sha256:2b8fd9751c4c0f5dd266fcae00707e67a2545ef34f9a29354585f93dac906749"
                  Command: "top"
                  Created: 1472592424
                  Ports: []
                  SizeRootFs: 1092588
                  Labels: {}
                  State: "exited"
                  Status: "Exited (0) 56 minutes ago"
                  HostConfig:
                    NetworkMode: "default"
                  NetworkSettings:
                    Networks:
                      bridge:
                        IPAMConfig: null
                        Links: null
                        Aliases: null
                        NetworkID: "d687bc59335f0e5c9ee8193e5612e8aee000c8c62ea170cfb99c098f95899d92"
                        EndpointID: "8ed5115aeaad9abb174f68dcf135b49f11daf597678315231a32ca28441dec6a"
                        Gateway: "172.18.0.1"
                        IPAddress: "172.18.0.2"
                        IPPrefixLen: 16
                        IPv6Gateway: ""
                        GlobalIPv6Address: ""
                        GlobalIPv6PrefixLen: 0
                        MacAddress: "02:42:ac:12:00:02"
                  Mounts: []
              Volumes:
                -
                  Name: "my-volume"
                  Driver: "local"
                  Mountpoint: "/var/lib/docker/volumes/my-volume/_data"
                  Labels: null
                  Scope: "local"
                  Options: null
                  UsageData:
                    Size: 10920104
                    RefCount: 2
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      tags: ["System"]
  /images/{name}/get:
    get:
      summary: "Export an image"
      description: |
        Get a tarball containing all images and metadata for a repository.
@y
            - `container=<string>` container name or ID
            - `daemon=<string>` daemon name or ID
            - `event=<string>` event type
            - `image=<string>` image name or ID
            - `label=<string>` image or container label
            - `network=<string>` network name or ID
            - `plugin`=<string> plugin name or ID
            - `scope`＝<string> local or swarm
            - `type=<string>` object to filter by, one of `container`, `image`, `volume`, `network`, `daemon`, `plugin`, `node`, `service` or `secret`
            - `volume=<string>` volume name or ID
          type: "string"
      tags: ["System"]
  /system/df:
    get:
      summary: "Get data usage information"
      operationId: "SystemDataUsage"
      responses:
        200:
          description: "no error"
          schema:
            type: "object"
            properties:
              LayersSize:
                type: "integer"
                format: "int64"
              Images:
                type: "array"
                items:
                  $ref: "#/definitions/ImageSummary"
              Containers:
                type: "array"
                items:
                  $ref: "#/definitions/ContainerSummary"
              Volumes:
                type: "array"
                items:
                  $ref: "#/definitions/Volume"
            example:
              LayersSize: 1092588
              Images:
                -
                  Id: "sha256:2b8fd9751c4c0f5dd266fcae00707e67a2545ef34f9a29354585f93dac906749"
                  ParentId: ""
                  RepoTags:
                    - "busybox:latest"
                  RepoDigests:
                    - "busybox@sha256:a59906e33509d14c036c8678d687bd4eec81ed7c4b8ce907b888c607f6a1e0e6"
                  Created: 1466724217
                  Size: 1092588
                  SharedSize: 0
                  VirtualSize: 1092588
                  Labels: {}
                  Containers: 1
              Containers:
                -
                  Id: "e575172ed11dc01bfce087fb27bee502db149e1a0fad7c296ad300bbff178148"
                  Names:
                    - "/top"
                  Image: "busybox"
                  ImageID: "sha256:2b8fd9751c4c0f5dd266fcae00707e67a2545ef34f9a29354585f93dac906749"
                  Command: "top"
                  Created: 1472592424
                  Ports: []
                  SizeRootFs: 1092588
                  Labels: {}
                  State: "exited"
                  Status: "Exited (0) 56 minutes ago"
                  HostConfig:
                    NetworkMode: "default"
                  NetworkSettings:
                    Networks:
                      bridge:
                        IPAMConfig: null
                        Links: null
                        Aliases: null
                        NetworkID: "d687bc59335f0e5c9ee8193e5612e8aee000c8c62ea170cfb99c098f95899d92"
                        EndpointID: "8ed5115aeaad9abb174f68dcf135b49f11daf597678315231a32ca28441dec6a"
                        Gateway: "172.18.0.1"
                        IPAddress: "172.18.0.2"
                        IPPrefixLen: 16
                        IPv6Gateway: ""
                        GlobalIPv6Address: ""
                        GlobalIPv6PrefixLen: 0
                        MacAddress: "02:42:ac:12:00:02"
                  Mounts: []
              Volumes:
                -
                  Name: "my-volume"
                  Driver: "local"
                  Mountpoint: "/var/lib/docker/volumes/my-volume/_data"
                  Labels: null
                  Scope: "local"
                  Options: null
                  UsageData:
                    Size: 10920104
                    RefCount: 2
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      tags: ["System"]
  /images/{name}/get:
    get:
      summary: "Export an image"
      description: |
        Get a tarball containing all images and metadata for a repository.
@z

@x
        If `name` is a specific name and tag (e.g. `ubuntu:latest`), then only that image (and its parents) are returned. If `name` is an image ID, similarly only that image (and its parents) are returned, but with the exclusion of the `repositories` file in the tarball, as there were no image names referenced.
@y
        If `name` is a specific name and tag (e.g. `ubuntu:latest`), then only that image (and its parents) are returned. If `name` is an image ID, similarly only that image (and its parents) are returned, but with the exclusion of the `repositories` file in the tarball, as there were no image names referenced.
@z

@x
        ### Image tarball format
@y
        ### Image tarball format
@z

@x
        An image tarball contains one directory per image layer (named using its long ID), each containing these files:
@y
        An image tarball contains one directory per image layer (named using its long ID), each containing these files:
@z

@x
        - `VERSION`: currently `1.0` - the file format version
        - `json`: detailed layer information, similar to `docker inspect layer_id`
        - `layer.tar`: A tarfile containing the filesystem changes in this layer
@y
        - `VERSION`: currently `1.0` - the file format version
        - `json`: detailed layer information, similar to `docker inspect layer_id`
        - `layer.tar`: A tarfile containing the filesystem changes in this layer
@z

@x
        The `layer.tar` file contains `aufs` style `.wh..wh.aufs` files and directories for storing attribute changes and deletions.
@y
        The `layer.tar` file contains `aufs` style `.wh..wh.aufs` files and directories for storing attribute changes and deletions.
@z

@x
        If the tarball defines a repository, the tarball should also include a `repositories` file at the root that contains a list of repository and tag names mapped to layer IDs.
@y
        If the tarball defines a repository, the tarball should also include a `repositories` file at the root that contains a list of repository and tag names mapped to layer IDs.
@z

@x
        ```json
        {
          "hello-world": {
            "latest": "565a9d68a73f6706862bfe8409a7f659776d4d60a8d096eb4a3cbce6999cc2a1"
          }
        }
        ```
      operationId: "ImageGet"
      produces:
        - "application/x-tar"
      responses:
        200:
          description: "no error"
          schema:
            type: "string"
            format: "binary"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "name"
          in: "path"
          description: "Image name or ID"
          type: "string"
          required: true
      tags: ["Image"]
  /images/get:
    get:
      summary: "Export several images"
      description: |
        Get a tarball containing all images and metadata for several image repositories.
@y
        ```json
        {
          "hello-world": {
            "latest": "565a9d68a73f6706862bfe8409a7f659776d4d60a8d096eb4a3cbce6999cc2a1"
          }
        }
        ```
      operationId: "ImageGet"
      produces:
        - "application/x-tar"
      responses:
        200:
          description: "no error"
          schema:
            type: "string"
            format: "binary"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "name"
          in: "path"
          description: "Image name or ID"
          type: "string"
          required: true
      tags: ["Image"]
  /images/get:
    get:
      summary: "Export several images"
      description: |
        Get a tarball containing all images and metadata for several image repositories.
@z

@x
        For each value of the `names` parameter: if it is a specific name and tag (e.g. `ubuntu:latest`), then only that image (and its parents) are returned; if it is an image ID, similarly only that image (and its parents) are returned and there would be no names referenced in the 'repositories' file for this image ID.
@y
        For each value of the `names` parameter: if it is a specific name and tag (e.g. `ubuntu:latest`), then only that image (and its parents) are returned; if it is an image ID, similarly only that image (and its parents) are returned and there would be no names referenced in the 'repositories' file for this image ID.
@z

@x
        For details on the format, see [the export image endpoint](#operation/ImageGet).
      operationId: "ImageGetAll"
      produces:
        - "application/x-tar"
      responses:
        200:
          description: "no error"
          schema:
            type: "string"
            format: "binary"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "names"
          in: "query"
          description: "Image names to filter by"
          type: "array"
          items:
            type: "string"
      tags: ["Image"]
  /images/load:
    post:
      summary: "Import images"
      description: |
        Load a set of images and tags into a repository.
@y
        For details on the format, see [the export image endpoint](#operation/ImageGet).
      operationId: "ImageGetAll"
      produces:
        - "application/x-tar"
      responses:
        200:
          description: "no error"
          schema:
            type: "string"
            format: "binary"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "names"
          in: "query"
          description: "Image names to filter by"
          type: "array"
          items:
            type: "string"
      tags: ["Image"]
  /images/load:
    post:
      summary: "Import images"
      description: |
        Load a set of images and tags into a repository.
@z

@x
        For details on the format, see [the export image endpoint](#operation/ImageGet).
      operationId: "ImageLoad"
      consumes:
        - "application/x-tar"
      produces:
        - "application/json"
      responses:
        200:
          description: "no error"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "imagesTarball"
          in: "body"
          description: "Tar archive containing images"
          schema:
            type: "string"
            format: "binary"
        - name: "quiet"
          in: "query"
          description: "Suppress progress details during load."
          type: "boolean"
          default: false
      tags: ["Image"]
  /containers/{id}/exec:
    post:
      summary: "Create an exec instance"
      description: "Run a command inside a running container."
      operationId: "ContainerExec"
      consumes:
        - "application/json"
      produces:
        - "application/json"
      responses:
        201:
          description: "no error"
          schema:
            $ref: "#/definitions/IdResponse"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        409:
          description: "container is paused"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "execConfig"
          in: "body"
          description: "Exec configuration"
          schema:
            type: "object"
            properties:
              AttachStdin:
                type: "boolean"
                description: "Attach to `stdin` of the exec command."
              AttachStdout:
                type: "boolean"
                description: "Attach to `stdout` of the exec command."
              AttachStderr:
                type: "boolean"
                description: "Attach to `stderr` of the exec command."
              DetachKeys:
                type: "string"
                description: "Override the key sequence for detaching a container. Format is a single character `[a-Z]` or `ctrl-<value>` where `<value>` is one of: `a-z`, `@`, `^`, `[`, `,` or `_`."
              Tty:
                type: "boolean"
                description: "Allocate a pseudo-TTY."
              Env:
                description: "A list of environment variables in the form `[\"VAR=value\", ...]`."
                type: "array"
                items:
                  type: "string"
              Cmd:
                type: "array"
                description: "Command to run, as a string or array of strings."
                items:
                  type: "string"
              Privileged:
                type: "boolean"
                description: "Runs the exec process with extended privileges."
                default: false
              User:
                type: "string"
                description: "The user, and optionally, group to run the exec process inside the container. Format is one of: `user`, `user:group`, `uid`, or `uid:gid`."
            example:
              AttachStdin: false
              AttachStdout: true
              AttachStderr: true
              DetachKeys: "ctrl-p,ctrl-q"
              Tty: false
              Cmd:
                - "date"
              Env:
                - "FOO=bar"
                - "BAZ=quux"
          required: true
        - name: "id"
          in: "path"
          description: "ID or name of container"
          type: "string"
          required: true
      tags: ["Exec"]
  /exec/{id}/start:
    post:
      summary: "Start an exec instance"
      description: "Starts a previously set up exec instance. If detach is true, this endpoint returns immediately after starting the command. Otherwise, it sets up an interactive session with the command."
      operationId: "ExecStart"
      consumes:
        - "application/json"
      produces:
        - "application/vnd.docker.raw-stream"
      responses:
        200:
          description: "No error"
        404:
          description: "No such exec instance"
          schema:
            $ref: "#/definitions/ErrorResponse"
        409:
          description: "Container is stopped or paused"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "execStartConfig"
          in: "body"
          schema:
            type: "object"
            properties:
              Detach:
                type: "boolean"
                description: "Detach from the command."
              Tty:
                type: "boolean"
                description: "Allocate a pseudo-TTY."
            example:
              Detach: false
              Tty: false
        - name: "id"
          in: "path"
          description: "Exec instance ID"
          required: true
          type: "string"
      tags: ["Exec"]
  /exec/{id}/resize:
    post:
      summary: "Resize an exec instance"
      description: "Resize the TTY session used by an exec instance. This endpoint only works if `tty` was specified as part of creating and starting the exec instance."
      operationId: "ExecResize"
      responses:
        200:
          description: "No error"
        400:
          description: "bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "No such exec instance"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          description: "Exec instance ID"
          required: true
          type: "string"
        - name: "h"
          in: "query"
          required: true
          description: "Height of the TTY session in characters"
          type: "integer"
        - name: "w"
          in: "query"
          required: true
          description: "Width of the TTY session in characters"
          type: "integer"
      tags: ["Exec"]
  /exec/{id}/json:
    get:
      summary: "Inspect an exec instance"
      description: "Return low-level information about an exec instance."
      operationId: "ExecInspect"
      produces:
        - "application/json"
      responses:
        200:
          description: "No error"
          schema:
            type: "object"
            properties:
              ID:
                type: "string"
              Running:
                type: "boolean"
              ExitCode:
                type: "integer"
              ProcessConfig:
                $ref: "#/definitions/ProcessConfig"
              OpenStdin:
                type: "boolean"
              OpenStderr:
                type: "boolean"
              OpenStdout:
                type: "boolean"
              ContainerID:
                type: "string"
              Pid:
                type: "integer"
                description: "The system process ID for the exec process."
          examples:
            application/json:
              CanRemove: false
              ContainerID: "b53ee82b53a40c7dca428523e34f741f3abc51d9f297a14ff874bf761b995126"
              DetachKeys: ""
              ExitCode: 2
              ID: "f33bbfb39f5b142420f4759b2348913bd4a8d1a6d7fd56499cb41a1bb91d7b3b"
              OpenStderr: true
              OpenStdin: true
              OpenStdout: true
              ProcessConfig:
                arguments:
                  - "-c"
                  - "exit 2"
                entrypoint: "sh"
                privileged: false
                tty: true
                user: "1000"
              Running: false
              Pid: 42000
        404:
          description: "No such exec instance"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          description: "Exec instance ID"
          required: true
          type: "string"
      tags: ["Exec"]
@y
        For details on the format, see [the export image endpoint](#operation/ImageGet).
      operationId: "ImageLoad"
      consumes:
        - "application/x-tar"
      produces:
        - "application/json"
      responses:
        200:
          description: "no error"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "imagesTarball"
          in: "body"
          description: "Tar archive containing images"
          schema:
            type: "string"
            format: "binary"
        - name: "quiet"
          in: "query"
          description: "Suppress progress details during load."
          type: "boolean"
          default: false
      tags: ["Image"]
  /containers/{id}/exec:
    post:
      summary: "Create an exec instance"
      description: "Run a command inside a running container."
      operationId: "ContainerExec"
      consumes:
        - "application/json"
      produces:
        - "application/json"
      responses:
        201:
          description: "no error"
          schema:
            $ref: "#/definitions/IdResponse"
        404:
          description: "no such container"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such container: c2ada9df5af8"
        409:
          description: "container is paused"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "execConfig"
          in: "body"
          description: "Exec configuration"
          schema:
            type: "object"
            properties:
              AttachStdin:
                type: "boolean"
                description: "Attach to `stdin` of the exec command."
              AttachStdout:
                type: "boolean"
                description: "Attach to `stdout` of the exec command."
              AttachStderr:
                type: "boolean"
                description: "Attach to `stderr` of the exec command."
              DetachKeys:
                type: "string"
                description: "Override the key sequence for detaching a container. Format is a single character `[a-Z]` or `ctrl-<value>` where `<value>` is one of: `a-z`, `@`, `^`, `[`, `,` or `_`."
              Tty:
                type: "boolean"
                description: "Allocate a pseudo-TTY."
              Env:
                description: "A list of environment variables in the form `[\"VAR=value\", ...]`."
                type: "array"
                items:
                  type: "string"
              Cmd:
                type: "array"
                description: "Command to run, as a string or array of strings."
                items:
                  type: "string"
              Privileged:
                type: "boolean"
                description: "Runs the exec process with extended privileges."
                default: false
              User:
                type: "string"
                description: "The user, and optionally, group to run the exec process inside the container. Format is one of: `user`, `user:group`, `uid`, or `uid:gid`."
            example:
              AttachStdin: false
              AttachStdout: true
              AttachStderr: true
              DetachKeys: "ctrl-p,ctrl-q"
              Tty: false
              Cmd:
                - "date"
              Env:
                - "FOO=bar"
                - "BAZ=quux"
          required: true
        - name: "id"
          in: "path"
          description: "ID or name of container"
          type: "string"
          required: true
      tags: ["Exec"]
  /exec/{id}/start:
    post:
      summary: "Start an exec instance"
      description: "Starts a previously set up exec instance. If detach is true, this endpoint returns immediately after starting the command. Otherwise, it sets up an interactive session with the command."
      operationId: "ExecStart"
      consumes:
        - "application/json"
      produces:
        - "application/vnd.docker.raw-stream"
      responses:
        200:
          description: "No error"
        404:
          description: "No such exec instance"
          schema:
            $ref: "#/definitions/ErrorResponse"
        409:
          description: "Container is stopped or paused"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "execStartConfig"
          in: "body"
          schema:
            type: "object"
            properties:
              Detach:
                type: "boolean"
                description: "Detach from the command."
              Tty:
                type: "boolean"
                description: "Allocate a pseudo-TTY."
            example:
              Detach: false
              Tty: false
        - name: "id"
          in: "path"
          description: "Exec instance ID"
          required: true
          type: "string"
      tags: ["Exec"]
  /exec/{id}/resize:
    post:
      summary: "Resize an exec instance"
      description: "Resize the TTY session used by an exec instance. This endpoint only works if `tty` was specified as part of creating and starting the exec instance."
      operationId: "ExecResize"
      responses:
        200:
          description: "No error"
        400:
          description: "bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "No such exec instance"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          description: "Exec instance ID"
          required: true
          type: "string"
        - name: "h"
          in: "query"
          required: true
          description: "Height of the TTY session in characters"
          type: "integer"
        - name: "w"
          in: "query"
          required: true
          description: "Width of the TTY session in characters"
          type: "integer"
      tags: ["Exec"]
  /exec/{id}/json:
    get:
      summary: "Inspect an exec instance"
      description: "Return low-level information about an exec instance."
      operationId: "ExecInspect"
      produces:
        - "application/json"
      responses:
        200:
          description: "No error"
          schema:
            type: "object"
            properties:
              ID:
                type: "string"
              Running:
                type: "boolean"
              ExitCode:
                type: "integer"
              ProcessConfig:
                $ref: "#/definitions/ProcessConfig"
              OpenStdin:
                type: "boolean"
              OpenStderr:
                type: "boolean"
              OpenStdout:
                type: "boolean"
              ContainerID:
                type: "string"
              Pid:
                type: "integer"
                description: "The system process ID for the exec process."
          examples:
            application/json:
              CanRemove: false
              ContainerID: "b53ee82b53a40c7dca428523e34f741f3abc51d9f297a14ff874bf761b995126"
              DetachKeys: ""
              ExitCode: 2
              ID: "f33bbfb39f5b142420f4759b2348913bd4a8d1a6d7fd56499cb41a1bb91d7b3b"
              OpenStderr: true
              OpenStdin: true
              OpenStdout: true
              ProcessConfig:
                arguments:
                  - "-c"
                  - "exit 2"
                entrypoint: "sh"
                privileged: false
                tty: true
                user: "1000"
              Running: false
              Pid: 42000
        404:
          description: "No such exec instance"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          description: "Exec instance ID"
          required: true
          type: "string"
      tags: ["Exec"]
@z

@x
  /volumes:
    get:
      summary: "List volumes"
      operationId: "VolumeList"
      produces: ["application/json"]
      responses:
        200:
          description: "Summary volume data that matches the query"
          schema:
            type: "object"
            required: [Volumes, Warnings]
            properties:
              Volumes:
                type: "array"
                x-nullable: false
                description: "List of volumes"
                items:
                  $ref: "#/definitions/Volume"
              Warnings:
                type: "array"
                x-nullable: false
                description: "Warnings that occurred when fetching the list of volumes"
                items:
                  type: "string"
@y
  /volumes:
    get:
      summary: "List volumes"
      operationId: "VolumeList"
      produces: ["application/json"]
      responses:
        200:
          description: "Summary volume data that matches the query"
          schema:
            type: "object"
            required: [Volumes, Warnings]
            properties:
              Volumes:
                type: "array"
                x-nullable: false
                description: "List of volumes"
                items:
                  $ref: "#/definitions/Volume"
              Warnings:
                type: "array"
                x-nullable: false
                description: "Warnings that occurred when fetching the list of volumes"
                items:
                  type: "string"
@z

@x
          examples:
            application/json:
              Volumes:
                - Name: "tardis"
                  Driver: "local"
                  Mountpoint: "/var/lib/docker/volumes/tardis"
                  Labels:
                    com.example.some-label: "some-value"
                    com.example.some-other-label: "some-other-value"
                  Scope: "local"
                  Options:
                    device: "tmpfs"
                    o: "size=100m,uid=1000"
                    type: "tmpfs"
              Warnings: []
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "filters"
          in: "query"
          description: |
            JSON encoded value of the filters (a `map[string][]string`) to
            process on the volumes list. Available filters:
@y
          examples:
            application/json:
              Volumes:
                - Name: "tardis"
                  Driver: "local"
                  Mountpoint: "/var/lib/docker/volumes/tardis"
                  Labels:
                    com.example.some-label: "some-value"
                    com.example.some-other-label: "some-other-value"
                  Scope: "local"
                  Options:
                    device: "tmpfs"
                    o: "size=100m,uid=1000"
                    type: "tmpfs"
              Warnings: []
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "filters"
          in: "query"
          description: |
            JSON encoded value of the filters (a `map[string][]string`) to
            process on the volumes list. Available filters:
@z

@x
            - `dangling=<boolean>` When set to `true` (or `1`), returns all
               volumes that are not in use by a container. When set to `false`
               (or `0`), only volumes that are in use by one or more
               containers are returned.
            - `driver=<volume-driver-name>` Matches volumes based on their driver.
            - `label=<key>` or `label=<key>:<value>` Matches volumes based on
               the presence of a `label` alone or a `label` and a value.
            - `name=<volume-name>` Matches all or part of a volume name.
          type: "string"
          format: "json"
      tags: ["Volume"]
@y
            - `dangling=<boolean>` When set to `true` (or `1`), returns all
               volumes that are not in use by a container. When set to `false`
               (or `0`), only volumes that are in use by one or more
               containers are returned.
            - `driver=<volume-driver-name>` Matches volumes based on their driver.
            - `label=<key>` or `label=<key>:<value>` Matches volumes based on
               the presence of a `label` alone or a `label` and a value.
            - `name=<volume-name>` Matches all or part of a volume name.
          type: "string"
          format: "json"
      tags: ["Volume"]
@z

@x
  /volumes/create:
    post:
      summary: "Create a volume"
      operationId: "VolumeCreate"
      consumes: ["application/json"]
      produces: ["application/json"]
      responses:
        201:
          description: "The volume was created successfully"
          schema:
            $ref: "#/definitions/Volume"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "volumeConfig"
          in: "body"
          required: true
          description: "Volume configuration"
          schema:
            type: "object"
            properties:
              Name:
                description: "The new volume's name. If not specified, Docker generates a name."
                type: "string"
                x-nullable: false
              Driver:
                description: "Name of the volume driver to use."
                type: "string"
                default: "local"
                x-nullable: false
              DriverOpts:
                description: "A mapping of driver options and values. These options are passed directly to the driver and are driver specific."
                type: "object"
                additionalProperties:
                  type: "string"
              Labels:
                description: "User-defined key/value metadata."
                type: "object"
                additionalProperties:
                  type: "string"
            example:
              Name: "tardis"
              Labels:
                com.example.some-label: "some-value"
                com.example.some-other-label: "some-other-value"
              Driver: "custom"
      tags: ["Volume"]
@y
  /volumes/create:
    post:
      summary: "Create a volume"
      operationId: "VolumeCreate"
      consumes: ["application/json"]
      produces: ["application/json"]
      responses:
        201:
          description: "The volume was created successfully"
          schema:
            $ref: "#/definitions/Volume"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "volumeConfig"
          in: "body"
          required: true
          description: "Volume configuration"
          schema:
            type: "object"
            properties:
              Name:
                description: "The new volume's name. If not specified, Docker generates a name."
                type: "string"
                x-nullable: false
              Driver:
                description: "Name of the volume driver to use."
                type: "string"
                default: "local"
                x-nullable: false
              DriverOpts:
                description: "A mapping of driver options and values. These options are passed directly to the driver and are driver specific."
                type: "object"
                additionalProperties:
                  type: "string"
              Labels:
                description: "User-defined key/value metadata."
                type: "object"
                additionalProperties:
                  type: "string"
            example:
              Name: "tardis"
              Labels:
                com.example.some-label: "some-value"
                com.example.some-other-label: "some-other-value"
              Driver: "custom"
      tags: ["Volume"]
@z

@x
  /volumes/{name}:
    get:
      summary: "Inspect a volume"
      operationId: "VolumeInspect"
      produces: ["application/json"]
      responses:
        200:
          description: "No error"
          schema:
            $ref: "#/definitions/Volume"
        404:
          description: "No such volume"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "name"
          in: "path"
          required: true
          description: "Volume name or ID"
          type: "string"
      tags: ["Volume"]
@y
  /volumes/{name}:
    get:
      summary: "Inspect a volume"
      operationId: "VolumeInspect"
      produces: ["application/json"]
      responses:
        200:
          description: "No error"
          schema:
            $ref: "#/definitions/Volume"
        404:
          description: "No such volume"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "name"
          in: "path"
          required: true
          description: "Volume name or ID"
          type: "string"
      tags: ["Volume"]
@z

@x
    delete:
      summary: "Remove a volume"
      description: "Instruct the driver to remove the volume."
      operationId: "VolumeDelete"
      responses:
        204:
          description: "The volume was removed"
        404:
          description: "No such volume or volume driver"
          schema:
            $ref: "#/definitions/ErrorResponse"
        409:
          description: "Volume is in use and cannot be removed"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "name"
          in: "path"
          required: true
          description: "Volume name or ID"
          type: "string"
        - name: "force"
          in: "query"
          description: "Force the removal of the volume"
          type: "boolean"
          default: false
      tags: ["Volume"]
  /volumes/prune:
    post:
      summary: "Delete unused volumes"
      produces:
        - "application/json"
      operationId: "VolumePrune"
      parameters:
        - name: "filters"
          in: "query"
          description: |
            Filters to process on the prune list, encoded as JSON (a `map[string][]string`).
@y
    delete:
      summary: "Remove a volume"
      description: "Instruct the driver to remove the volume."
      operationId: "VolumeDelete"
      responses:
        204:
          description: "The volume was removed"
        404:
          description: "No such volume or volume driver"
          schema:
            $ref: "#/definitions/ErrorResponse"
        409:
          description: "Volume is in use and cannot be removed"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "name"
          in: "path"
          required: true
          description: "Volume name or ID"
          type: "string"
        - name: "force"
          in: "query"
          description: "Force the removal of the volume"
          type: "boolean"
          default: false
      tags: ["Volume"]
  /volumes/prune:
    post:
      summary: "Delete unused volumes"
      produces:
        - "application/json"
      operationId: "VolumePrune"
      parameters:
        - name: "filters"
          in: "query"
          description: |
            Filters to process on the prune list, encoded as JSON (a `map[string][]string`).
@z

@x
            Available filters:
            - `label` (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or `label!=<key>=<value>`) Prune volumes with (or without, in case `label!=...` is used) the specified labels.
          type: "string"
      responses:
        200:
          description: "No error"
          schema:
            type: "object"
            properties:
              VolumesDeleted:
                description: "Volumes that were deleted"
                type: "array"
                items:
                  type: "string"
              SpaceReclaimed:
                description: "Disk space reclaimed in bytes"
                type: "integer"
                format: "int64"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      tags: ["Volume"]
  /networks:
    get:
      summary: "List networks"
      description: |
        Returns a list of networks. For details on the format, see [the network inspect endpoint](#operation/NetworkInspect).
@y
            Available filters:
            - `label` (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or `label!=<key>=<value>`) Prune volumes with (or without, in case `label!=...` is used) the specified labels.
          type: "string"
      responses:
        200:
          description: "No error"
          schema:
            type: "object"
            properties:
              VolumesDeleted:
                description: "Volumes that were deleted"
                type: "array"
                items:
                  type: "string"
              SpaceReclaimed:
                description: "Disk space reclaimed in bytes"
                type: "integer"
                format: "int64"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      tags: ["Volume"]
  /networks:
    get:
      summary: "List networks"
      description: |
        Returns a list of networks. For details on the format, see [the network inspect endpoint](#operation/NetworkInspect).
@z

@x
        Note that it uses a different, smaller representation of a network than inspecting a single network. For example,
        the list of containers attached to the network is not propagated in API versions 1.28 and up.
      operationId: "NetworkList"
      produces:
        - "application/json"
      responses:
        200:
          description: "No error"
          schema:
            type: "array"
            items:
              $ref: "#/definitions/Network"
          examples:
            application/json:
              - Name: "bridge"
                Id: "f2de39df4171b0dc801e8002d1d999b77256983dfc63041c0f34030aa3977566"
                Created: "2016-10-19T06:21:00.416543526Z"
                Scope: "local"
                Driver: "bridge"
                EnableIPv6: false
                Internal: false
                Attachable: false
                Ingress: false
                IPAM:
                  Driver: "default"
                  Config:
                    -
                      Subnet: "172.17.0.0/16"
                Options:
                  com.docker.network.bridge.default_bridge: "true"
                  com.docker.network.bridge.enable_icc: "true"
                  com.docker.network.bridge.enable_ip_masquerade: "true"
                  com.docker.network.bridge.host_binding_ipv4: "0.0.0.0"
                  com.docker.network.bridge.name: "docker0"
                  com.docker.network.driver.mtu: "1500"
              - Name: "none"
                Id: "e086a3893b05ab69242d3c44e49483a3bbbd3a26b46baa8f61ab797c1088d794"
                Created: "0001-01-01T00:00:00Z"
                Scope: "local"
                Driver: "null"
                EnableIPv6: false
                Internal: false
                Attachable: false
                Ingress: false
                IPAM:
                  Driver: "default"
                  Config: []
                Containers: {}
                Options: {}
              - Name: "host"
                Id: "13e871235c677f196c4e1ecebb9dc733b9b2d2ab589e30c539efeda84a24215e"
                Created: "0001-01-01T00:00:00Z"
                Scope: "local"
                Driver: "host"
                EnableIPv6: false
                Internal: false
                Attachable: false
                Ingress: false
                IPAM:
                  Driver: "default"
                  Config: []
                Containers: {}
                Options: {}
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "filters"
          in: "query"
          description: |
            JSON encoded value of the filters (a `map[string][]string`) to process on the networks list. Available filters:
@y
        Note that it uses a different, smaller representation of a network than inspecting a single network. For example,
        the list of containers attached to the network is not propagated in API versions 1.28 and up.
      operationId: "NetworkList"
      produces:
        - "application/json"
      responses:
        200:
          description: "No error"
          schema:
            type: "array"
            items:
              $ref: "#/definitions/Network"
          examples:
            application/json:
              - Name: "bridge"
                Id: "f2de39df4171b0dc801e8002d1d999b77256983dfc63041c0f34030aa3977566"
                Created: "2016-10-19T06:21:00.416543526Z"
                Scope: "local"
                Driver: "bridge"
                EnableIPv6: false
                Internal: false
                Attachable: false
                Ingress: false
                IPAM:
                  Driver: "default"
                  Config:
                    -
                      Subnet: "172.17.0.0/16"
                Options:
                  com.docker.network.bridge.default_bridge: "true"
                  com.docker.network.bridge.enable_icc: "true"
                  com.docker.network.bridge.enable_ip_masquerade: "true"
                  com.docker.network.bridge.host_binding_ipv4: "0.0.0.0"
                  com.docker.network.bridge.name: "docker0"
                  com.docker.network.driver.mtu: "1500"
              - Name: "none"
                Id: "e086a3893b05ab69242d3c44e49483a3bbbd3a26b46baa8f61ab797c1088d794"
                Created: "0001-01-01T00:00:00Z"
                Scope: "local"
                Driver: "null"
                EnableIPv6: false
                Internal: false
                Attachable: false
                Ingress: false
                IPAM:
                  Driver: "default"
                  Config: []
                Containers: {}
                Options: {}
              - Name: "host"
                Id: "13e871235c677f196c4e1ecebb9dc733b9b2d2ab589e30c539efeda84a24215e"
                Created: "0001-01-01T00:00:00Z"
                Scope: "local"
                Driver: "host"
                EnableIPv6: false
                Internal: false
                Attachable: false
                Ingress: false
                IPAM:
                  Driver: "default"
                  Config: []
                Containers: {}
                Options: {}
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "filters"
          in: "query"
          description: |
            JSON encoded value of the filters (a `map[string][]string`) to process on the networks list. Available filters:
@z

@x
            - `driver=<driver-name>` Matches a network's driver.
            - `id=<network-id>` Matches all or part of a network ID.
            - `label=<key>` or `label=<key>=<value>` of a network label.
            - `name=<network-name>` Matches all or part of a network name.
            - `scope=["swarm"|"global"|"local"]` Filters networks by scope (`swarm`, `global`, or `local`).
            - `type=["custom"|"builtin"]` Filters networks by type. The `custom` keyword returns all user-defined networks.
          type: "string"
      tags: ["Network"]
@y
            - `driver=<driver-name>` Matches a network's driver.
            - `id=<network-id>` Matches all or part of a network ID.
            - `label=<key>` or `label=<key>=<value>` of a network label.
            - `name=<network-name>` Matches all or part of a network name.
            - `scope=["swarm"|"global"|"local"]` Filters networks by scope (`swarm`, `global`, or `local`).
            - `type=["custom"|"builtin"]` Filters networks by type. The `custom` keyword returns all user-defined networks.
          type: "string"
      tags: ["Network"]
@z

@x
  /networks/{id}:
    get:
      summary: "Inspect a network"
      operationId: "NetworkInspect"
      produces:
        - "application/json"
      responses:
        200:
          description: "No error"
          schema:
            $ref: "#/definitions/Network"
        404:
          description: "Network not found"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          description: "Network ID or name"
          required: true
          type: "string"
        - name: "verbose"
          in: "query"
          description: "Detailed inspect output for troubleshooting"
          type: "boolean"
          default: false
      tags: ["Network"]
@y
  /networks/{id}:
    get:
      summary: "Inspect a network"
      operationId: "NetworkInspect"
      produces:
        - "application/json"
      responses:
        200:
          description: "No error"
          schema:
            $ref: "#/definitions/Network"
        404:
          description: "Network not found"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          description: "Network ID or name"
          required: true
          type: "string"
        - name: "verbose"
          in: "query"
          description: "Detailed inspect output for troubleshooting"
          type: "boolean"
          default: false
      tags: ["Network"]
@z

@x
    delete:
      summary: "Remove a network"
      operationId: "NetworkDelete"
      responses:
        204:
          description: "No error"
        403:
          description: "operation not supported for pre-defined networks"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "no such network"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          description: "Network ID or name"
          required: true
          type: "string"
      tags: ["Network"]
@y
    delete:
      summary: "Remove a network"
      operationId: "NetworkDelete"
      responses:
        204:
          description: "No error"
        403:
          description: "operation not supported for pre-defined networks"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "no such network"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          description: "Network ID or name"
          required: true
          type: "string"
      tags: ["Network"]
@z

@x
  /networks/create:
    post:
      summary: "Create a network"
      operationId: "NetworkCreate"
      consumes:
        - "application/json"
      produces:
        - "application/json"
      responses:
        201:
          description: "No error"
          schema:
            type: "object"
            properties:
              Id:
                description: "The ID of the created network."
                type: "string"
              Warning:
                type: "string"
            example:
              Id: "22be93d5babb089c5aab8dbc369042fad48ff791584ca2da2100db837a1c7c30"
              Warning: ""
        400:
          description: "bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        403:
          description: "operation not supported for pre-defined networks"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "plugin not found"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "networkConfig"
          in: "body"
          description: "Network configuration"
          required: true
          schema:
            type: "object"
            required: ["Name"]
            properties:
              Name:
                description: "The network's name."
                type: "string"
              CheckDuplicate:
                description: "Check for networks with duplicate names. Since Network is primarily keyed based on a random ID and not on the name, and network name is strictly a user-friendly alias to the network which is uniquely identified using ID, there is no guaranteed way to check for duplicates. CheckDuplicate is there to provide a best effort checking of any networks which has the same name but it is not guaranteed to catch all name collisions."
                type: "boolean"
              Driver:
                description: "Name of the network driver plugin to use."
                type: "string"
                default: "bridge"
              Internal:
                description: "Restrict external access to the network."
                type: "boolean"
              Attachable:
                description: "Globally scoped network is manually attachable by regular containers from workers in swarm mode."
                type: "boolean"
              Ingress:
                description: "Ingress network is the network which provides the routing-mesh in swarm mode."
                type: "boolean"
              IPAM:
                description: "Optional custom IP scheme for the network."
                $ref: "#/definitions/IPAM"
              EnableIPv6:
                description: "Enable IPv6 on the network."
                type: "boolean"
              Options:
                description: "Network specific options to be used by the drivers."
                type: "object"
                additionalProperties:
                  type: "string"
              Labels:
                description: "User-defined key/value metadata."
                type: "object"
                additionalProperties:
                  type: "string"
            example:
              Name: "isolated_nw"
              CheckDuplicate: false
              Driver: "bridge"
              EnableIPv6: true
              IPAM:
                Driver: "default"
                Config:
                  - Subnet: "172.20.0.0/16"
                    IPRange: "172.20.10.0/24"
                    Gateway: "172.20.10.11"
                  - Subnet: "2001:db8:abcd::/64"
                    Gateway: "2001:db8:abcd::1011"
                Options:
                  foo: "bar"
              Internal: true
              Attachable: false
              Ingress: false
              Options:
                com.docker.network.bridge.default_bridge: "true"
                com.docker.network.bridge.enable_icc: "true"
                com.docker.network.bridge.enable_ip_masquerade: "true"
                com.docker.network.bridge.host_binding_ipv4: "0.0.0.0"
                com.docker.network.bridge.name: "docker0"
                com.docker.network.driver.mtu: "1500"
              Labels:
                com.example.some-label: "some-value"
                com.example.some-other-label: "some-other-value"
      tags: ["Network"]
@y
  /networks/create:
    post:
      summary: "Create a network"
      operationId: "NetworkCreate"
      consumes:
        - "application/json"
      produces:
        - "application/json"
      responses:
        201:
          description: "No error"
          schema:
            type: "object"
            properties:
              Id:
                description: "The ID of the created network."
                type: "string"
              Warning:
                type: "string"
            example:
              Id: "22be93d5babb089c5aab8dbc369042fad48ff791584ca2da2100db837a1c7c30"
              Warning: ""
        400:
          description: "bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        403:
          description: "operation not supported for pre-defined networks"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "plugin not found"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "networkConfig"
          in: "body"
          description: "Network configuration"
          required: true
          schema:
            type: "object"
            required: ["Name"]
            properties:
              Name:
                description: "The network's name."
                type: "string"
              CheckDuplicate:
                description: "Check for networks with duplicate names. Since Network is primarily keyed based on a random ID and not on the name, and network name is strictly a user-friendly alias to the network which is uniquely identified using ID, there is no guaranteed way to check for duplicates. CheckDuplicate is there to provide a best effort checking of any networks which has the same name but it is not guaranteed to catch all name collisions."
                type: "boolean"
              Driver:
                description: "Name of the network driver plugin to use."
                type: "string"
                default: "bridge"
              Internal:
                description: "Restrict external access to the network."
                type: "boolean"
              Attachable:
                description: "Globally scoped network is manually attachable by regular containers from workers in swarm mode."
                type: "boolean"
              Ingress:
                description: "Ingress network is the network which provides the routing-mesh in swarm mode."
                type: "boolean"
              IPAM:
                description: "Optional custom IP scheme for the network."
                $ref: "#/definitions/IPAM"
              EnableIPv6:
                description: "Enable IPv6 on the network."
                type: "boolean"
              Options:
                description: "Network specific options to be used by the drivers."
                type: "object"
                additionalProperties:
                  type: "string"
              Labels:
                description: "User-defined key/value metadata."
                type: "object"
                additionalProperties:
                  type: "string"
            example:
              Name: "isolated_nw"
              CheckDuplicate: false
              Driver: "bridge"
              EnableIPv6: true
              IPAM:
                Driver: "default"
                Config:
                  - Subnet: "172.20.0.0/16"
                    IPRange: "172.20.10.0/24"
                    Gateway: "172.20.10.11"
                  - Subnet: "2001:db8:abcd::/64"
                    Gateway: "2001:db8:abcd::1011"
                Options:
                  foo: "bar"
              Internal: true
              Attachable: false
              Ingress: false
              Options:
                com.docker.network.bridge.default_bridge: "true"
                com.docker.network.bridge.enable_icc: "true"
                com.docker.network.bridge.enable_ip_masquerade: "true"
                com.docker.network.bridge.host_binding_ipv4: "0.0.0.0"
                com.docker.network.bridge.name: "docker0"
                com.docker.network.driver.mtu: "1500"
              Labels:
                com.example.some-label: "some-value"
                com.example.some-other-label: "some-other-value"
      tags: ["Network"]
@z

@x
  /networks/{id}/connect:
    post:
      summary: "Connect a container to a network"
      operationId: "NetworkConnect"
      consumes:
        - "application/octet-stream"
      responses:
        200:
          description: "No error"
        403:
          description: "Operation not supported for swarm scoped networks"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "Network or container not found"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          description: "Network ID or name"
          required: true
          type: "string"
        - name: "container"
          in: "body"
          required: true
          schema:
            type: "object"
            properties:
              Container:
                type: "string"
                description: "The ID or name of the container to connect to the network."
              EndpointConfig:
                $ref: "#/definitions/EndpointSettings"
            example:
              Container: "3613f73ba0e4"
              EndpointConfig:
                IPAMConfig:
                  IPv4Address: "172.24.56.89"
                  IPv6Address: "2001:db8::5689"
      tags: ["Network"]
@y
  /networks/{id}/connect:
    post:
      summary: "Connect a container to a network"
      operationId: "NetworkConnect"
      consumes:
        - "application/octet-stream"
      responses:
        200:
          description: "No error"
        403:
          description: "Operation not supported for swarm scoped networks"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "Network or container not found"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          description: "Network ID or name"
          required: true
          type: "string"
        - name: "container"
          in: "body"
          required: true
          schema:
            type: "object"
            properties:
              Container:
                type: "string"
                description: "The ID or name of the container to connect to the network."
              EndpointConfig:
                $ref: "#/definitions/EndpointSettings"
            example:
              Container: "3613f73ba0e4"
              EndpointConfig:
                IPAMConfig:
                  IPv4Address: "172.24.56.89"
                  IPv6Address: "2001:db8::5689"
      tags: ["Network"]
@z

@x
  /networks/{id}/disconnect:
    post:
      summary: "Disconnect a container from a network"
      operationId: "NetworkDisconnect"
      consumes:
        - "application/json"
      responses:
        200:
          description: "No error"
        403:
          description: "Operation not supported for swarm scoped networks"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "Network or container not found"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          description: "Network ID or name"
          required: true
          type: "string"
        - name: "container"
          in: "body"
          required: true
          schema:
            type: "object"
            properties:
              Container:
                type: "string"
                description: "The ID or name of the container to disconnect from the network."
              Force:
                type: "boolean"
                description: "Force the container to disconnect from the network."
      tags: ["Network"]
  /networks/prune:
    post:
      summary: "Delete unused networks"
      produces:
        - "application/json"
      operationId: "NetworkPrune"
      parameters:
        - name: "filters"
          in: "query"
          description: |
            Filters to process on the prune list, encoded as JSON (a `map[string][]string`).
@y
  /networks/{id}/disconnect:
    post:
      summary: "Disconnect a container from a network"
      operationId: "NetworkDisconnect"
      consumes:
        - "application/json"
      responses:
        200:
          description: "No error"
        403:
          description: "Operation not supported for swarm scoped networks"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "Network or container not found"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          description: "Network ID or name"
          required: true
          type: "string"
        - name: "container"
          in: "body"
          required: true
          schema:
            type: "object"
            properties:
              Container:
                type: "string"
                description: "The ID or name of the container to disconnect from the network."
              Force:
                type: "boolean"
                description: "Force the container to disconnect from the network."
      tags: ["Network"]
  /networks/prune:
    post:
      summary: "Delete unused networks"
      produces:
        - "application/json"
      operationId: "NetworkPrune"
      parameters:
        - name: "filters"
          in: "query"
          description: |
            Filters to process on the prune list, encoded as JSON (a `map[string][]string`).
@z

@x
            Available filters:
            - `until=<timestamp>` Prune networks created before this timestamp. The `<timestamp>` can be Unix timestamps, date formatted timestamps, or Go duration strings (e.g. `10m`, `1h30m`) computed relative to the daemon machine’s time.
            - `label` (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or `label!=<key>=<value>`) Prune networks with (or without, in case `label!=...` is used) the specified labels.
          type: "string"
      responses:
        200:
          description: "No error"
          schema:
            type: "object"
            properties:
              NetworksDeleted:
                description: "Networks that were deleted"
                type: "array"
                items:
                  type: "string"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      tags: ["Network"]
  /plugins:
    get:
      summary: "List plugins"
      operationId: "PluginList"
      description: "Returns information about installed plugins."
      produces: ["application/json"]
      responses:
        200:
          description: "No error"
          schema:
            type: "array"
            items:
              $ref: "#/definitions/Plugin"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "filters"
          in: "query"
          type: "string"
          description: |
            A JSON encoded value of the filters (a `map[string][]string`) to process on the plugin list. Available filters:
@y
            Available filters:
            - `until=<timestamp>` Prune networks created before this timestamp. The `<timestamp>` can be Unix timestamps, date formatted timestamps, or Go duration strings (e.g. `10m`, `1h30m`) computed relative to the daemon machine’s time.
            - `label` (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or `label!=<key>=<value>`) Prune networks with (or without, in case `label!=...` is used) the specified labels.
          type: "string"
      responses:
        200:
          description: "No error"
          schema:
            type: "object"
            properties:
              NetworksDeleted:
                description: "Networks that were deleted"
                type: "array"
                items:
                  type: "string"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      tags: ["Network"]
  /plugins:
    get:
      summary: "List plugins"
      operationId: "PluginList"
      description: "Returns information about installed plugins."
      produces: ["application/json"]
      responses:
        200:
          description: "No error"
          schema:
            type: "array"
            items:
              $ref: "#/definitions/Plugin"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "filters"
          in: "query"
          type: "string"
          description: |
            A JSON encoded value of the filters (a `map[string][]string`) to process on the plugin list. Available filters:
@z

@x
            - `capability=<capability name>`
            - `enable=<true>|<false>`
      tags: ["Plugin"]
@y
            - `capability=<capability name>`
            - `enable=<true>|<false>`
      tags: ["Plugin"]
@z

@x
  /plugins/privileges:
    get:
      summary: "Get plugin privileges"
      operationId: "GetPluginPrivileges"
      responses:
        200:
          description: "no error"
          schema:
            type: "array"
            items:
              description: "Describes a permission the user has to accept upon installing the plugin."
              type: "object"
              properties:
                Name:
                  type: "string"
                Description:
                  type: "string"
                Value:
                  type: "array"
                  items:
                    type: "string"
            example:
              - Name: "network"
                Description: ""
                Value:
                  - "host"
              - Name: "mount"
                Description: ""
                Value:
                  - "/data"
              - Name: "device"
                Description: ""
                Value:
                  - "/dev/cpu_dma_latency"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "remote"
          in: "query"
          description: "The name of the plugin. The `:latest` tag is optional, and is the default if omitted."
          required: true
          type: "string"
      tags:
        - "Plugin"
@y
  /plugins/privileges:
    get:
      summary: "Get plugin privileges"
      operationId: "GetPluginPrivileges"
      responses:
        200:
          description: "no error"
          schema:
            type: "array"
            items:
              description: "Describes a permission the user has to accept upon installing the plugin."
              type: "object"
              properties:
                Name:
                  type: "string"
                Description:
                  type: "string"
                Value:
                  type: "array"
                  items:
                    type: "string"
            example:
              - Name: "network"
                Description: ""
                Value:
                  - "host"
              - Name: "mount"
                Description: ""
                Value:
                  - "/data"
              - Name: "device"
                Description: ""
                Value:
                  - "/dev/cpu_dma_latency"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "remote"
          in: "query"
          description: "The name of the plugin. The `:latest` tag is optional, and is the default if omitted."
          required: true
          type: "string"
      tags:
        - "Plugin"
@z

@x
  /plugins/pull:
    post:
      summary: "Install a plugin"
      operationId: "PluginPull"
      description: |
        Pulls and installs a plugin. After the plugin is installed, it can be enabled using the [`POST /plugins/{name}/enable` endpoint](#operation/PostPluginsEnable).
      produces:
        - "application/json"
      responses:
        204:
          description: "no error"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "remote"
          in: "query"
          description: |
            Remote reference for plugin to install.
@y
  /plugins/pull:
    post:
      summary: "Install a plugin"
      operationId: "PluginPull"
      description: |
        Pulls and installs a plugin. After the plugin is installed, it can be enabled using the [`POST /plugins/{name}/enable` endpoint](#operation/PostPluginsEnable).
      produces:
        - "application/json"
      responses:
        204:
          description: "no error"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "remote"
          in: "query"
          description: |
            Remote reference for plugin to install.
@z

@x
            The `:latest` tag is optional, and is used as the default if omitted.
          required: true
          type: "string"
        - name: "name"
          in: "query"
          description: |
            Local name for the pulled plugin.
@y
            The `:latest` tag is optional, and is used as the default if omitted.
          required: true
          type: "string"
        - name: "name"
          in: "query"
          description: |
            Local name for the pulled plugin.
@z

@x
            The `:latest` tag is optional, and is used as the default if omitted.
          required: false
          type: "string"
        - name: "X-Registry-Auth"
          in: "header"
          description: "A base64-encoded auth configuration to use when pulling a plugin from a registry. [See the authentication section for details.](#section/Authentication)"
          type: "string"
        - name: "body"
          in: "body"
          schema:
            type: "array"
            items:
              description: "Describes a permission accepted by the user upon installing the plugin."
              type: "object"
              properties:
                Name:
                  type: "string"
                Description:
                  type: "string"
                Value:
                  type: "array"
                  items:
                    type: "string"
            example:
              - Name: "network"
                Description: ""
                Value:
                  - "host"
              - Name: "mount"
                Description: ""
                Value:
                  - "/data"
              - Name: "device"
                Description: ""
                Value:
                  - "/dev/cpu_dma_latency"
      tags: ["Plugin"]
  /plugins/{name}/json:
    get:
      summary: "Inspect a plugin"
      operationId: "PluginInspect"
      responses:
        200:
          description: "no error"
          schema:
            $ref: "#/definitions/Plugin"
        404:
          description: "plugin is not installed"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "name"
          in: "path"
          description: "The name of the plugin. The `:latest` tag is optional, and is the default if omitted."
          required: true
          type: "string"
      tags: ["Plugin"]
  /plugins/{name}:
    delete:
      summary: "Remove a plugin"
      operationId: "PluginDelete"
      responses:
        200:
          description: "no error"
          schema:
            $ref: "#/definitions/Plugin"
        404:
          description: "plugin is not installed"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "name"
          in: "path"
          description: "The name of the plugin. The `:latest` tag is optional, and is the default if omitted."
          required: true
          type: "string"
        - name: "force"
          in: "query"
          description: "Disable the plugin before removing. This may result in issues if the plugin is in use by a container."
          type: "boolean"
          default: false
      tags: ["Plugin"]
  /plugins/{name}/enable:
    post:
      summary: "Enable a plugin"
      operationId: "PluginEnable"
      responses:
        200:
          description: "no error"
        404:
          description: "plugin is not installed"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "name"
          in: "path"
          description: "The name of the plugin. The `:latest` tag is optional, and is the default if omitted."
          required: true
          type: "string"
        - name: "timeout"
          in: "query"
          description: "Set the HTTP client timeout (in seconds)"
          type: "integer"
          default: 0
      tags: ["Plugin"]
  /plugins/{name}/disable:
    post:
      summary: "Disable a plugin"
      operationId: "PluginDisable"
      responses:
        200:
          description: "no error"
        404:
          description: "plugin is not installed"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "name"
          in: "path"
          description: "The name of the plugin. The `:latest` tag is optional, and is the default if omitted."
          required: true
          type: "string"
        - name: "force"
          in: "query"
          description: |
            Force disable a plugin even if still in use.
          required: false
          type: "boolean"
      tags: ["Plugin"]
  /plugins/{name}/upgrade:
    post:
      summary: "Upgrade a plugin"
      operationId: "PluginUpgrade"
      responses:
        204:
          description: "no error"
        404:
          description: "plugin not installed"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "name"
          in: "path"
          description: "The name of the plugin. The `:latest` tag is optional, and is the default if omitted."
          required: true
          type: "string"
        - name: "remote"
          in: "query"
          description: |
            Remote reference to upgrade to.
@y
            The `:latest` tag is optional, and is used as the default if omitted.
          required: false
          type: "string"
        - name: "X-Registry-Auth"
          in: "header"
          description: "A base64-encoded auth configuration to use when pulling a plugin from a registry. [See the authentication section for details.](#section/Authentication)"
          type: "string"
        - name: "body"
          in: "body"
          schema:
            type: "array"
            items:
              description: "Describes a permission accepted by the user upon installing the plugin."
              type: "object"
              properties:
                Name:
                  type: "string"
                Description:
                  type: "string"
                Value:
                  type: "array"
                  items:
                    type: "string"
            example:
              - Name: "network"
                Description: ""
                Value:
                  - "host"
              - Name: "mount"
                Description: ""
                Value:
                  - "/data"
              - Name: "device"
                Description: ""
                Value:
                  - "/dev/cpu_dma_latency"
      tags: ["Plugin"]
  /plugins/{name}/json:
    get:
      summary: "Inspect a plugin"
      operationId: "PluginInspect"
      responses:
        200:
          description: "no error"
          schema:
            $ref: "#/definitions/Plugin"
        404:
          description: "plugin is not installed"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "name"
          in: "path"
          description: "The name of the plugin. The `:latest` tag is optional, and is the default if omitted."
          required: true
          type: "string"
      tags: ["Plugin"]
  /plugins/{name}:
    delete:
      summary: "Remove a plugin"
      operationId: "PluginDelete"
      responses:
        200:
          description: "no error"
          schema:
            $ref: "#/definitions/Plugin"
        404:
          description: "plugin is not installed"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "name"
          in: "path"
          description: "The name of the plugin. The `:latest` tag is optional, and is the default if omitted."
          required: true
          type: "string"
        - name: "force"
          in: "query"
          description: "Disable the plugin before removing. This may result in issues if the plugin is in use by a container."
          type: "boolean"
          default: false
      tags: ["Plugin"]
  /plugins/{name}/enable:
    post:
      summary: "Enable a plugin"
      operationId: "PluginEnable"
      responses:
        200:
          description: "no error"
        404:
          description: "plugin is not installed"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "name"
          in: "path"
          description: "The name of the plugin. The `:latest` tag is optional, and is the default if omitted."
          required: true
          type: "string"
        - name: "timeout"
          in: "query"
          description: "Set the HTTP client timeout (in seconds)"
          type: "integer"
          default: 0
      tags: ["Plugin"]
  /plugins/{name}/disable:
    post:
      summary: "Disable a plugin"
      operationId: "PluginDisable"
      responses:
        200:
          description: "no error"
        404:
          description: "plugin is not installed"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "name"
          in: "path"
          description: "The name of the plugin. The `:latest` tag is optional, and is the default if omitted."
          required: true
          type: "string"
        - name: "force"
          in: "query"
          description: |
            Force disable a plugin even if still in use.
          required: false
          type: "boolean"
      tags: ["Plugin"]
  /plugins/{name}/upgrade:
    post:
      summary: "Upgrade a plugin"
      operationId: "PluginUpgrade"
      responses:
        204:
          description: "no error"
        404:
          description: "plugin not installed"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "name"
          in: "path"
          description: "The name of the plugin. The `:latest` tag is optional, and is the default if omitted."
          required: true
          type: "string"
        - name: "remote"
          in: "query"
          description: |
            Remote reference to upgrade to.
@z

@x
            The `:latest` tag is optional, and is used as the default if omitted.
          required: true
          type: "string"
        - name: "X-Registry-Auth"
          in: "header"
          description: "A base64-encoded auth configuration to use when pulling a plugin from a registry. [See the authentication section for details.](#section/Authentication)"
          type: "string"
        - name: "body"
          in: "body"
          schema:
            type: "array"
            items:
              description: "Describes a permission accepted by the user upon installing the plugin."
              type: "object"
              properties:
                Name:
                  type: "string"
                Description:
                  type: "string"
                Value:
                  type: "array"
                  items:
                    type: "string"
            example:
              - Name: "network"
                Description: ""
                Value:
                  - "host"
              - Name: "mount"
                Description: ""
                Value:
                  - "/data"
              - Name: "device"
                Description: ""
                Value:
                  - "/dev/cpu_dma_latency"
      tags: ["Plugin"]
  /plugins/create:
    post:
      summary: "Create a plugin"
      operationId: "PluginCreate"
      consumes:
        - "application/x-tar"
      responses:
        204:
          description: "no error"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "name"
          in: "query"
          description: "The name of the plugin. The `:latest` tag is optional, and is the default if omitted."
          required: true
          type: "string"
        - name: "tarContext"
          in: "body"
          description: "Path to tar containing plugin rootfs and manifest"
          schema:
            type: "string"
            format: "binary"
      tags: ["Plugin"]
  /plugins/{name}/push:
    post:
      summary: "Push a plugin"
      operationId: "PluginPush"
      description: |
        Push a plugin to the registry.
      parameters:
        - name: "name"
          in: "path"
          description: "The name of the plugin. The `:latest` tag is optional, and is the default if omitted."
          required: true
          type: "string"
      responses:
        200:
          description: "no error"
        404:
          description: "plugin not installed"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      tags: ["Plugin"]
  /plugins/{name}/set:
    post:
      summary: "Configure a plugin"
      operationId: "PluginSet"
      consumes:
        - "application/json"
      parameters:
        - name: "name"
          in: "path"
          description: "The name of the plugin. The `:latest` tag is optional, and is the default if omitted."
          required: true
          type: "string"
        - name: "body"
          in: "body"
          schema:
            type: "array"
            items:
              type: "string"
            example: ["DEBUG=1"]
      responses:
        204:
          description: "No error"
        404:
          description: "Plugin not installed"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      tags: ["Plugin"]
  /nodes:
    get:
      summary: "List nodes"
      operationId: "NodeList"
      responses:
        200:
          description: "no error"
          schema:
            type: "array"
            items:
              $ref: "#/definitions/Node"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "filters"
          in: "query"
          description: |
            Filters to process on the nodes list, encoded as JSON (a `map[string][]string`).
@y
            The `:latest` tag is optional, and is used as the default if omitted.
          required: true
          type: "string"
        - name: "X-Registry-Auth"
          in: "header"
          description: "A base64-encoded auth configuration to use when pulling a plugin from a registry. [See the authentication section for details.](#section/Authentication)"
          type: "string"
        - name: "body"
          in: "body"
          schema:
            type: "array"
            items:
              description: "Describes a permission accepted by the user upon installing the plugin."
              type: "object"
              properties:
                Name:
                  type: "string"
                Description:
                  type: "string"
                Value:
                  type: "array"
                  items:
                    type: "string"
            example:
              - Name: "network"
                Description: ""
                Value:
                  - "host"
              - Name: "mount"
                Description: ""
                Value:
                  - "/data"
              - Name: "device"
                Description: ""
                Value:
                  - "/dev/cpu_dma_latency"
      tags: ["Plugin"]
  /plugins/create:
    post:
      summary: "Create a plugin"
      operationId: "PluginCreate"
      consumes:
        - "application/x-tar"
      responses:
        204:
          description: "no error"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "name"
          in: "query"
          description: "The name of the plugin. The `:latest` tag is optional, and is the default if omitted."
          required: true
          type: "string"
        - name: "tarContext"
          in: "body"
          description: "Path to tar containing plugin rootfs and manifest"
          schema:
            type: "string"
            format: "binary"
      tags: ["Plugin"]
  /plugins/{name}/push:
    post:
      summary: "Push a plugin"
      operationId: "PluginPush"
      description: |
        Push a plugin to the registry.
      parameters:
        - name: "name"
          in: "path"
          description: "The name of the plugin. The `:latest` tag is optional, and is the default if omitted."
          required: true
          type: "string"
      responses:
        200:
          description: "no error"
        404:
          description: "plugin not installed"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      tags: ["Plugin"]
  /plugins/{name}/set:
    post:
      summary: "Configure a plugin"
      operationId: "PluginSet"
      consumes:
        - "application/json"
      parameters:
        - name: "name"
          in: "path"
          description: "The name of the plugin. The `:latest` tag is optional, and is the default if omitted."
          required: true
          type: "string"
        - name: "body"
          in: "body"
          schema:
            type: "array"
            items:
              type: "string"
            example: ["DEBUG=1"]
      responses:
        204:
          description: "No error"
        404:
          description: "Plugin not installed"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      tags: ["Plugin"]
  /nodes:
    get:
      summary: "List nodes"
      operationId: "NodeList"
      responses:
        200:
          description: "no error"
          schema:
            type: "array"
            items:
              $ref: "#/definitions/Node"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "filters"
          in: "query"
          description: |
            Filters to process on the nodes list, encoded as JSON (a `map[string][]string`).
@z

@x
            Available filters:
            - `id=<node id>`
            - `label=<engine label>`
            - `membership=`(`accepted`|`pending`)`
            - `name=<node name>`
            - `role=`(`manager`|`worker`)`
          type: "string"
      tags: ["Node"]
  /nodes/{id}:
    get:
      summary: "Inspect a node"
      operationId: "NodeInspect"
      responses:
        200:
          description: "no error"
          schema:
            $ref: "#/definitions/Node"
        404:
          description: "no such node"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          description: "The ID or name of the node"
          type: "string"
          required: true
      tags: ["Node"]
    delete:
      summary: "Delete a node"
      operationId: "NodeDelete"
      responses:
        200:
          description: "no error"
        404:
          description: "no such node"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          description: "The ID or name of the node"
          type: "string"
          required: true
        - name: "force"
          in: "query"
          description: "Force remove a node from the swarm"
          default: false
          type: "boolean"
      tags: ["Node"]
  /nodes/{id}/update:
    post:
      summary: "Update a node"
      operationId: "NodeUpdate"
      responses:
        200:
          description: "no error"
        400:
          description: "bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "no such node"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          description: "The ID of the node"
          type: "string"
          required: true
        - name: "body"
          in: "body"
          schema:
            $ref: "#/definitions/NodeSpec"
        - name: "version"
          in: "query"
          description: "The version number of the node object being updated. This is required to avoid conflicting writes."
          type: "integer"
          format: "int64"
          required: true
      tags: ["Node"]
  /swarm:
    get:
      summary: "Inspect swarm"
      operationId: "SwarmInspect"
      responses:
        200:
          description: "no error"
          schema:
            allOf:
              - $ref: "#/definitions/ClusterInfo"
              - type: "object"
                properties:
                  JoinTokens:
                    description: "The tokens workers and managers need to join the swarm."
                    type: "object"
                    properties:
                      Worker:
                        description: "The token workers can use to join the swarm."
                        type: "string"
                      Manager:
                        description: "The token managers can use to join the swarm."
                        type: "string"
            example:
              CreatedAt: "2016-08-15T16:00:20.349727406Z"
              Spec:
                Dispatcher:
                  HeartbeatPeriod: 5000000000
                Orchestration:
                  TaskHistoryRetentionLimit: 10
                CAConfig:
                  NodeCertExpiry: 7776000000000000
                Raft:
                  LogEntriesForSlowFollowers: 500
                  HeartbeatTick: 1
                  SnapshotInterval: 10000
                  ElectionTick: 3
                TaskDefaults: {}
                EncryptionConfig:
                  AutoLockManagers: false
                Name: "default"
              JoinTokens:
                Worker: "SWMTKN-1-1h8aps2yszaiqmz2l3oc5392pgk8e49qhx2aj3nyv0ui0hez2a-6qmn92w6bu3jdvnglku58u11a"
                Manager: "SWMTKN-1-1h8aps2yszaiqmz2l3oc5392pgk8e49qhx2aj3nyv0ui0hez2a-8llk83c4wm9lwioey2s316r9l"
              ID: "70ilmkj2f6sp2137c753w2nmt"
              UpdatedAt: "2016-08-15T16:32:09.623207604Z"
              Version:
                Index: 51
              RootRotationInProgress: false
              TLSInfo:
                TrustRoot: |
                  -----BEGIN CERTIFICATE-----
                  MIIBajCCARCgAwIBAgIUbYqrLSOSQHoxD8CwG6Bi2PJi9c8wCgYIKoZIzj0EAwIw
                  EzERMA8GA1UEAxMIc3dhcm0tY2EwHhcNMTcwNDI0MjE0MzAwWhcNMzcwNDE5MjE0
                  MzAwWjATMREwDwYDVQQDEwhzd2FybS1jYTBZMBMGByqGSM49AgEGCCqGSM49AwEH
                  A0IABJk/VyMPYdaqDXJb/VXh5n/1Yuv7iNrxV3Qb3l06XD46seovcDWs3IZNV1lf
                  3Skyr0ofcchipoiHkXBODojJydSjQjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMB
                  Af8EBTADAQH/MB0GA1UdDgQWBBRUXxuRcnFjDfR/RIAUQab8ZV/n4jAKBggqhkjO
                  PQQDAgNIADBFAiAy+JTe6Uc3KyLCMiqGl2GyWGQqQDEcO3/YG36x7om65AIhAJvz
                  pxv6zFeVEkAEEkqIYi0omA9+CjanB/6Bz4n1uw8H
                  -----END CERTIFICATE-----
                CertIssuerSubject: "MBMxETAPBgNVBAMTCHN3YXJtLWNh"
                CertIssuerPublicKey: "MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEmT9XIw9h1qoNclv9VeHmf/Vi6/uI2vFXdBveXTpcPjqx6i9wNazchk1XWV/dKTKvSh9xyGKmiIeRcE4OiMnJ1A=="
        404:
          description: "no such swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      tags: ["Swarm"]
  /swarm/init:
    post:
      summary: "Initialize a new swarm"
      operationId: "SwarmInit"
      produces:
        - "application/json"
        - "text/plain"
      responses:
        200:
          description: "no error"
          schema:
            description: "The node ID"
            type: "string"
            example: "7v2t30z9blmxuhnyo6s4cpenp"
        400:
          description: "bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is already part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "body"
          in: "body"
          required: true
          schema:
            type: "object"
            properties:
              ListenAddr:
                description: "Listen address used for inter-manager communication, as well as determining the networking interface used for the VXLAN Tunnel Endpoint (VTEP). This can either be an address/port combination in the form `192.168.1.1:4567`, or an interface followed by a port number, like `eth0:4567`. If the port number is omitted, the default swarm listening port is used."
                type: "string"
              AdvertiseAddr:
                description: "Externally reachable address advertised to other nodes. This can either be an address/port combination in the form `192.168.1.1:4567`, or an interface followed by a port number, like `eth0:4567`. If the port number is omitted, the port number from the listen address is used. If `AdvertiseAddr` is not specified, it will be automatically detected when possible."
                type: "string"
              DataPathAddr:
                description: |
                  Address or interface to use for data path traffic (format: `<ip|interface>`), for example,  `192.168.1.1`,
                  or an interface, like `eth0`. If `DataPathAddr` is unspecified, the same address as `AdvertiseAddr`
                  is used.
@y
            Available filters:
            - `id=<node id>`
            - `label=<engine label>`
            - `membership=`(`accepted`|`pending`)`
            - `name=<node name>`
            - `role=`(`manager`|`worker`)`
          type: "string"
      tags: ["Node"]
  /nodes/{id}:
    get:
      summary: "Inspect a node"
      operationId: "NodeInspect"
      responses:
        200:
          description: "no error"
          schema:
            $ref: "#/definitions/Node"
        404:
          description: "no such node"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          description: "The ID or name of the node"
          type: "string"
          required: true
      tags: ["Node"]
    delete:
      summary: "Delete a node"
      operationId: "NodeDelete"
      responses:
        200:
          description: "no error"
        404:
          description: "no such node"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          description: "The ID or name of the node"
          type: "string"
          required: true
        - name: "force"
          in: "query"
          description: "Force remove a node from the swarm"
          default: false
          type: "boolean"
      tags: ["Node"]
  /nodes/{id}/update:
    post:
      summary: "Update a node"
      operationId: "NodeUpdate"
      responses:
        200:
          description: "no error"
        400:
          description: "bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "no such node"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          description: "The ID of the node"
          type: "string"
          required: true
        - name: "body"
          in: "body"
          schema:
            $ref: "#/definitions/NodeSpec"
        - name: "version"
          in: "query"
          description: "The version number of the node object being updated. This is required to avoid conflicting writes."
          type: "integer"
          format: "int64"
          required: true
      tags: ["Node"]
  /swarm:
    get:
      summary: "Inspect swarm"
      operationId: "SwarmInspect"
      responses:
        200:
          description: "no error"
          schema:
            allOf:
              - $ref: "#/definitions/ClusterInfo"
              - type: "object"
                properties:
                  JoinTokens:
                    description: "The tokens workers and managers need to join the swarm."
                    type: "object"
                    properties:
                      Worker:
                        description: "The token workers can use to join the swarm."
                        type: "string"
                      Manager:
                        description: "The token managers can use to join the swarm."
                        type: "string"
            example:
              CreatedAt: "2016-08-15T16:00:20.349727406Z"
              Spec:
                Dispatcher:
                  HeartbeatPeriod: 5000000000
                Orchestration:
                  TaskHistoryRetentionLimit: 10
                CAConfig:
                  NodeCertExpiry: 7776000000000000
                Raft:
                  LogEntriesForSlowFollowers: 500
                  HeartbeatTick: 1
                  SnapshotInterval: 10000
                  ElectionTick: 3
                TaskDefaults: {}
                EncryptionConfig:
                  AutoLockManagers: false
                Name: "default"
              JoinTokens:
                Worker: "SWMTKN-1-1h8aps2yszaiqmz2l3oc5392pgk8e49qhx2aj3nyv0ui0hez2a-6qmn92w6bu3jdvnglku58u11a"
                Manager: "SWMTKN-1-1h8aps2yszaiqmz2l3oc5392pgk8e49qhx2aj3nyv0ui0hez2a-8llk83c4wm9lwioey2s316r9l"
              ID: "70ilmkj2f6sp2137c753w2nmt"
              UpdatedAt: "2016-08-15T16:32:09.623207604Z"
              Version:
                Index: 51
              RootRotationInProgress: false
              TLSInfo:
                TrustRoot: |
                  -----BEGIN CERTIFICATE-----
                  MIIBajCCARCgAwIBAgIUbYqrLSOSQHoxD8CwG6Bi2PJi9c8wCgYIKoZIzj0EAwIw
                  EzERMA8GA1UEAxMIc3dhcm0tY2EwHhcNMTcwNDI0MjE0MzAwWhcNMzcwNDE5MjE0
                  MzAwWjATMREwDwYDVQQDEwhzd2FybS1jYTBZMBMGByqGSM49AgEGCCqGSM49AwEH
                  A0IABJk/VyMPYdaqDXJb/VXh5n/1Yuv7iNrxV3Qb3l06XD46seovcDWs3IZNV1lf
                  3Skyr0ofcchipoiHkXBODojJydSjQjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMB
                  Af8EBTADAQH/MB0GA1UdDgQWBBRUXxuRcnFjDfR/RIAUQab8ZV/n4jAKBggqhkjO
                  PQQDAgNIADBFAiAy+JTe6Uc3KyLCMiqGl2GyWGQqQDEcO3/YG36x7om65AIhAJvz
                  pxv6zFeVEkAEEkqIYi0omA9+CjanB/6Bz4n1uw8H
                  -----END CERTIFICATE-----
                CertIssuerSubject: "MBMxETAPBgNVBAMTCHN3YXJtLWNh"
                CertIssuerPublicKey: "MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEmT9XIw9h1qoNclv9VeHmf/Vi6/uI2vFXdBveXTpcPjqx6i9wNazchk1XWV/dKTKvSh9xyGKmiIeRcE4OiMnJ1A=="
        404:
          description: "no such swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      tags: ["Swarm"]
  /swarm/init:
    post:
      summary: "Initialize a new swarm"
      operationId: "SwarmInit"
      produces:
        - "application/json"
        - "text/plain"
      responses:
        200:
          description: "no error"
          schema:
            description: "The node ID"
            type: "string"
            example: "7v2t30z9blmxuhnyo6s4cpenp"
        400:
          description: "bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is already part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "body"
          in: "body"
          required: true
          schema:
            type: "object"
            properties:
              ListenAddr:
                description: "Listen address used for inter-manager communication, as well as determining the networking interface used for the VXLAN Tunnel Endpoint (VTEP). This can either be an address/port combination in the form `192.168.1.1:4567`, or an interface followed by a port number, like `eth0:4567`. If the port number is omitted, the default swarm listening port is used."
                type: "string"
              AdvertiseAddr:
                description: "Externally reachable address advertised to other nodes. This can either be an address/port combination in the form `192.168.1.1:4567`, or an interface followed by a port number, like `eth0:4567`. If the port number is omitted, the port number from the listen address is used. If `AdvertiseAddr` is not specified, it will be automatically detected when possible."
                type: "string"
              DataPathAddr:
                description: |
                  Address or interface to use for data path traffic (format: `<ip|interface>`), for example,  `192.168.1.1`,
                  or an interface, like `eth0`. If `DataPathAddr` is unspecified, the same address as `AdvertiseAddr`
                  is used.
@z

@x
                  The `DataPathAddr` specifies the address that global scope network drivers will publish towards other
                  nodes in order to reach the containers running on this node. Using this parameter it is possible to
                  separate the container data traffic from the management traffic of the cluster.
                type: "string"
              ForceNewCluster:
                description: "Force creation of a new swarm."
                type: "boolean"
              Spec:
                $ref: "#/definitions/SwarmSpec"
            example:
              ListenAddr: "0.0.0.0:2377"
              AdvertiseAddr: "192.168.1.1:2377"
              ForceNewCluster: false
              Spec:
                Orchestration: {}
                Raft: {}
                Dispatcher: {}
                CAConfig: {}
                EncryptionConfig:
                  AutoLockManagers: false
      tags: ["Swarm"]
  /swarm/join:
    post:
      summary: "Join an existing swarm"
      operationId: "SwarmJoin"
      responses:
        200:
          description: "no error"
        400:
          description: "bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is already part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "body"
          in: "body"
          required: true
          schema:
            type: "object"
            properties:
              ListenAddr:
                description: "Listen address used for inter-manager communication if the node gets promoted to manager, as well as determining the networking interface used for the VXLAN Tunnel Endpoint (VTEP)."
                type: "string"
              AdvertiseAddr:
                description: "Externally reachable address advertised to other nodes. This can either be an address/port combination in the form `192.168.1.1:4567`, or an interface followed by a port number, like `eth0:4567`. If the port number is omitted, the port number from the listen address is used. If `AdvertiseAddr` is not specified, it will be automatically detected when possible."
                type: "string"
              DataPathAddr:
                description: |
                  Address or interface to use for data path traffic (format: `<ip|interface>`), for example,  `192.168.1.1`,
                  or an interface, like `eth0`. If `DataPathAddr` is unspecified, the same address as `AdvertiseAddr`
                  is used.
@y
                  The `DataPathAddr` specifies the address that global scope network drivers will publish towards other
                  nodes in order to reach the containers running on this node. Using this parameter it is possible to
                  separate the container data traffic from the management traffic of the cluster.
                type: "string"
              ForceNewCluster:
                description: "Force creation of a new swarm."
                type: "boolean"
              Spec:
                $ref: "#/definitions/SwarmSpec"
            example:
              ListenAddr: "0.0.0.0:2377"
              AdvertiseAddr: "192.168.1.1:2377"
              ForceNewCluster: false
              Spec:
                Orchestration: {}
                Raft: {}
                Dispatcher: {}
                CAConfig: {}
                EncryptionConfig:
                  AutoLockManagers: false
      tags: ["Swarm"]
  /swarm/join:
    post:
      summary: "Join an existing swarm"
      operationId: "SwarmJoin"
      responses:
        200:
          description: "no error"
        400:
          description: "bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is already part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "body"
          in: "body"
          required: true
          schema:
            type: "object"
            properties:
              ListenAddr:
                description: "Listen address used for inter-manager communication if the node gets promoted to manager, as well as determining the networking interface used for the VXLAN Tunnel Endpoint (VTEP)."
                type: "string"
              AdvertiseAddr:
                description: "Externally reachable address advertised to other nodes. This can either be an address/port combination in the form `192.168.1.1:4567`, or an interface followed by a port number, like `eth0:4567`. If the port number is omitted, the port number from the listen address is used. If `AdvertiseAddr` is not specified, it will be automatically detected when possible."
                type: "string"
              DataPathAddr:
                description: |
                  Address or interface to use for data path traffic (format: `<ip|interface>`), for example,  `192.168.1.1`,
                  or an interface, like `eth0`. If `DataPathAddr` is unspecified, the same address as `AdvertiseAddr`
                  is used.
@z

@x
                  The `DataPathAddr` specifies the address that global scope network drivers will publish towards other
                  nodes in order to reach the containers running on this node. Using this parameter it is possible to
                  separate the container data traffic from the management traffic of the cluster.
@y
                  The `DataPathAddr` specifies the address that global scope network drivers will publish towards other
                  nodes in order to reach the containers running on this node. Using this parameter it is possible to
                  separate the container data traffic from the management traffic of the cluster.
@z

@x
                type: "string"
              RemoteAddrs:
                description: "Addresses of manager nodes already participating in the swarm."
                type: "string"
              JoinToken:
                description: "Secret token for joining this swarm."
                type: "string"
            example:
              ListenAddr: "0.0.0.0:2377"
              AdvertiseAddr: "192.168.1.1:2377"
              DataPathAddr: "192.168.1.1"
              RemoteAddrs:
                - "node1:2377"
              JoinToken: "SWMTKN-1-3pu6hszjas19xyp7ghgosyx9k8atbfcr8p2is99znpy26u2lkl-7p73s1dx5in4tatdymyhg9hu2"
      tags: ["Swarm"]
  /swarm/leave:
    post:
      summary: "Leave a swarm"
      operationId: "SwarmLeave"
      responses:
        200:
          description: "no error"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "force"
          description: "Force leave swarm, even if this is the last manager or that it will break the cluster."
          in: "query"
          type: "boolean"
          default: false
      tags: ["Swarm"]
  /swarm/update:
    post:
      summary: "Update a swarm"
      operationId: "SwarmUpdate"
      responses:
        200:
          description: "no error"
        400:
          description: "bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "body"
          in: "body"
          required: true
          schema:
            $ref: "#/definitions/SwarmSpec"
        - name: "version"
          in: "query"
          description: "The version number of the swarm object being updated. This is required to avoid conflicting writes."
          type: "integer"
          format: "int64"
          required: true
        - name: "rotateWorkerToken"
          in: "query"
          description: "Rotate the worker join token."
          type: "boolean"
          default: false
        - name: "rotateManagerToken"
          in: "query"
          description: "Rotate the manager join token."
          type: "boolean"
          default: false
        - name: "rotateManagerUnlockKey"
          in: "query"
          description: "Rotate the manager unlock key."
          type: "boolean"
          default: false
      tags: ["Swarm"]
  /swarm/unlockkey:
    get:
      summary: "Get the unlock key"
      operationId: "SwarmUnlockkey"
      consumes:
        - "application/json"
      responses:
        200:
          description: "no error"
          schema:
            type: "object"
            properties:
              UnlockKey:
                description: "The swarm's unlock key."
                type: "string"
            example:
              UnlockKey: "SWMKEY-1-7c37Cc8654o6p38HnroywCi19pllOnGtbdZEgtKxZu8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      tags: ["Swarm"]
  /swarm/unlock:
    post:
      summary: "Unlock a locked manager"
      operationId: "SwarmUnlock"
      consumes:
        - "application/json"
      produces:
        - "application/json"
      parameters:
        - name: "body"
          in: "body"
          required: true
          schema:
            type: "object"
            properties:
              UnlockKey:
                description: "The swarm's unlock key."
                type: "string"
            example:
              UnlockKey: "SWMKEY-1-7c37Cc8654o6p38HnroywCi19pllOnGtbdZEgtKxZu8"
      responses:
        200:
          description: "no error"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      tags: ["Swarm"]
  /services:
    get:
      summary: "List services"
      operationId: "ServiceList"
      responses:
        200:
          description: "no error"
          schema:
            type: "array"
            items:
              $ref: "#/definitions/Service"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "filters"
          in: "query"
          type: "string"
          description: |
            A JSON encoded value of the filters (a `map[string][]string`) to process on the services list. Available filters:
@y
                type: "string"
              RemoteAddrs:
                description: "Addresses of manager nodes already participating in the swarm."
                type: "string"
              JoinToken:
                description: "Secret token for joining this swarm."
                type: "string"
            example:
              ListenAddr: "0.0.0.0:2377"
              AdvertiseAddr: "192.168.1.1:2377"
              DataPathAddr: "192.168.1.1"
              RemoteAddrs:
                - "node1:2377"
              JoinToken: "SWMTKN-1-3pu6hszjas19xyp7ghgosyx9k8atbfcr8p2is99znpy26u2lkl-7p73s1dx5in4tatdymyhg9hu2"
      tags: ["Swarm"]
  /swarm/leave:
    post:
      summary: "Leave a swarm"
      operationId: "SwarmLeave"
      responses:
        200:
          description: "no error"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "force"
          description: "Force leave swarm, even if this is the last manager or that it will break the cluster."
          in: "query"
          type: "boolean"
          default: false
      tags: ["Swarm"]
  /swarm/update:
    post:
      summary: "Update a swarm"
      operationId: "SwarmUpdate"
      responses:
        200:
          description: "no error"
        400:
          description: "bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "body"
          in: "body"
          required: true
          schema:
            $ref: "#/definitions/SwarmSpec"
        - name: "version"
          in: "query"
          description: "The version number of the swarm object being updated. This is required to avoid conflicting writes."
          type: "integer"
          format: "int64"
          required: true
        - name: "rotateWorkerToken"
          in: "query"
          description: "Rotate the worker join token."
          type: "boolean"
          default: false
        - name: "rotateManagerToken"
          in: "query"
          description: "Rotate the manager join token."
          type: "boolean"
          default: false
        - name: "rotateManagerUnlockKey"
          in: "query"
          description: "Rotate the manager unlock key."
          type: "boolean"
          default: false
      tags: ["Swarm"]
  /swarm/unlockkey:
    get:
      summary: "Get the unlock key"
      operationId: "SwarmUnlockkey"
      consumes:
        - "application/json"
      responses:
        200:
          description: "no error"
          schema:
            type: "object"
            properties:
              UnlockKey:
                description: "The swarm's unlock key."
                type: "string"
            example:
              UnlockKey: "SWMKEY-1-7c37Cc8654o6p38HnroywCi19pllOnGtbdZEgtKxZu8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      tags: ["Swarm"]
  /swarm/unlock:
    post:
      summary: "Unlock a locked manager"
      operationId: "SwarmUnlock"
      consumes:
        - "application/json"
      produces:
        - "application/json"
      parameters:
        - name: "body"
          in: "body"
          required: true
          schema:
            type: "object"
            properties:
              UnlockKey:
                description: "The swarm's unlock key."
                type: "string"
            example:
              UnlockKey: "SWMKEY-1-7c37Cc8654o6p38HnroywCi19pllOnGtbdZEgtKxZu8"
      responses:
        200:
          description: "no error"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      tags: ["Swarm"]
  /services:
    get:
      summary: "List services"
      operationId: "ServiceList"
      responses:
        200:
          description: "no error"
          schema:
            type: "array"
            items:
              $ref: "#/definitions/Service"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "filters"
          in: "query"
          type: "string"
          description: |
            A JSON encoded value of the filters (a `map[string][]string`) to process on the services list. Available filters:
@z

@x
            - `id=<service id>`
            - `label=<service label>`
            - `mode=["replicated"|"global"]`
            - `name=<service name>`
      tags: ["Service"]
  /services/create:
    post:
      summary: "Create a service"
      operationId: "ServiceCreate"
      consumes:
        - "application/json"
      produces:
        - "application/json"
      responses:
        201:
          description: "no error"
          schema:
            type: "object"
            properties:
              ID:
                description: "The ID of the created service."
                type: "string"
              Warning:
                description: "Optional warning message"
                type: "string"
            example:
              ID: "ak7w3gjqoa3kuz8xcpnyy0pvl"
              Warning: "unable to pin image doesnotexist:latest to digest: image library/doesnotexist:latest not found"
        400:
          description: "bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        403:
          description: "network is not eligible for services"
          schema:
            $ref: "#/definitions/ErrorResponse"
        409:
          description: "name conflicts with an existing service"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "body"
          in: "body"
          required: true
          schema:
            allOf:
              - $ref: "#/definitions/ServiceSpec"
              - type: "object"
                example:
                  Name: "web"
                  TaskTemplate:
                    ContainerSpec:
                      Image: "nginx:alpine"
                      Mounts:
                        -
                          ReadOnly: true
                          Source: "web-data"
                          Target: "/usr/share/nginx/html"
                          Type: "volume"
                          VolumeOptions:
                            DriverConfig: {}
                            Labels:
                              com.example.something: "something-value"
                      Hosts: ["10.10.10.10 host1", "ABCD:EF01:2345:6789:ABCD:EF01:2345:6789 host2"]
                      User: "33"
                      DNSConfig:
                        Nameservers: ["8.8.8.8"]
                        Search: ["example.org"]
                        Options: ["timeout:3"]
                      Secrets:
                        -
                          File:
                            Name: "www.example.org.key"
                            UID: "33"
                            GID: "33"
                            Mode: 384
                          SecretID: "fpjqlhnwb19zds35k8wn80lq9"
                          SecretName: "example_org_domain_key"
                    LogDriver:
                      Name: "json-file"
                      Options:
                        max-file: "3"
                        max-size: "10M"
                    Placement: {}
                    Resources:
                      Limits:
                        MemoryBytes: 104857600
                      Reservations: {}
                    RestartPolicy:
                      Condition: "on-failure"
                      Delay: 10000000000
                      MaxAttempts: 10
                  Mode:
                    Replicated:
                      Replicas: 4
                  UpdateConfig:
                    Parallelism: 2
                    Delay: 1000000000
                    FailureAction: "pause"
                    Monitor: 15000000000
                    MaxFailureRatio: 0.15
                  RollbackConfig:
                    Parallelism: 1
                    Delay: 1000000000
                    FailureAction: "pause"
                    Monitor: 15000000000
                    MaxFailureRatio: 0.15
                  EndpointSpec:
                    Ports:
                      -
                        Protocol: "tcp"
                        PublishedPort: 8080
                        TargetPort: 80
                  Labels:
                    foo: "bar"
        - name: "X-Registry-Auth"
          in: "header"
          description: "A base64-encoded auth configuration for pulling from private registries. [See the authentication section for details.](#section/Authentication)"
          type: "string"
      tags: ["Service"]
  /services/{id}:
    get:
      summary: "Inspect a service"
      operationId: "ServiceInspect"
      responses:
        200:
          description: "no error"
          schema:
            $ref: "#/definitions/Service"
        404:
          description: "no such service"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          description: "ID or name of service."
          required: true
          type: "string"
        - name: "insertDefaults"
          in: "query"
          description: "Fill empty fields with default values."
          type: "boolean"
          default: false
      tags: ["Service"]
    delete:
      summary: "Delete a service"
      operationId: "ServiceDelete"
      responses:
        200:
          description: "no error"
        404:
          description: "no such service"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          description: "ID or name of service."
          required: true
          type: "string"
      tags: ["Service"]
  /services/{id}/update:
    post:
      summary: "Update a service"
      operationId: "ServiceUpdate"
      consumes: ["application/json"]
      produces: ["application/json"]
      responses:
        200:
          description: "no error"
          schema:
            $ref: "#/definitions/ServiceUpdateResponse"
        400:
          description: "bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "no such service"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          description: "ID or name of service."
          required: true
          type: "string"
        - name: "body"
          in: "body"
          required: true
          schema:
            allOf:
              - $ref: "#/definitions/ServiceSpec"
              - type: "object"
                example:
                  Name: "top"
                  TaskTemplate:
                    ContainerSpec:
                      Image: "busybox"
                      Args:
                        - "top"
                    Resources:
                      Limits: {}
                      Reservations: {}
                    RestartPolicy:
                      Condition: "any"
                      MaxAttempts: 0
                    Placement: {}
                    ForceUpdate: 0
                  Mode:
                    Replicated:
                      Replicas: 1
                  UpdateConfig:
                    Parallelism: 2
                    Delay: 1000000000
                    FailureAction: "pause"
                    Monitor: 15000000000
                    MaxFailureRatio: 0.15
                  RollbackConfig:
                    Parallelism: 1
                    Delay: 1000000000
                    FailureAction: "pause"
                    Monitor: 15000000000
                    MaxFailureRatio: 0.15
                  EndpointSpec:
                    Mode: "vip"
@y
            - `id=<service id>`
            - `label=<service label>`
            - `mode=["replicated"|"global"]`
            - `name=<service name>`
      tags: ["Service"]
  /services/create:
    post:
      summary: "Create a service"
      operationId: "ServiceCreate"
      consumes:
        - "application/json"
      produces:
        - "application/json"
      responses:
        201:
          description: "no error"
          schema:
            type: "object"
            properties:
              ID:
                description: "The ID of the created service."
                type: "string"
              Warning:
                description: "Optional warning message"
                type: "string"
            example:
              ID: "ak7w3gjqoa3kuz8xcpnyy0pvl"
              Warning: "unable to pin image doesnotexist:latest to digest: image library/doesnotexist:latest not found"
        400:
          description: "bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        403:
          description: "network is not eligible for services"
          schema:
            $ref: "#/definitions/ErrorResponse"
        409:
          description: "name conflicts with an existing service"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "body"
          in: "body"
          required: true
          schema:
            allOf:
              - $ref: "#/definitions/ServiceSpec"
              - type: "object"
                example:
                  Name: "web"
                  TaskTemplate:
                    ContainerSpec:
                      Image: "nginx:alpine"
                      Mounts:
                        -
                          ReadOnly: true
                          Source: "web-data"
                          Target: "/usr/share/nginx/html"
                          Type: "volume"
                          VolumeOptions:
                            DriverConfig: {}
                            Labels:
                              com.example.something: "something-value"
                      Hosts: ["10.10.10.10 host1", "ABCD:EF01:2345:6789:ABCD:EF01:2345:6789 host2"]
                      User: "33"
                      DNSConfig:
                        Nameservers: ["8.8.8.8"]
                        Search: ["example.org"]
                        Options: ["timeout:3"]
                      Secrets:
                        -
                          File:
                            Name: "www.example.org.key"
                            UID: "33"
                            GID: "33"
                            Mode: 384
                          SecretID: "fpjqlhnwb19zds35k8wn80lq9"
                          SecretName: "example_org_domain_key"
                    LogDriver:
                      Name: "json-file"
                      Options:
                        max-file: "3"
                        max-size: "10M"
                    Placement: {}
                    Resources:
                      Limits:
                        MemoryBytes: 104857600
                      Reservations: {}
                    RestartPolicy:
                      Condition: "on-failure"
                      Delay: 10000000000
                      MaxAttempts: 10
                  Mode:
                    Replicated:
                      Replicas: 4
                  UpdateConfig:
                    Parallelism: 2
                    Delay: 1000000000
                    FailureAction: "pause"
                    Monitor: 15000000000
                    MaxFailureRatio: 0.15
                  RollbackConfig:
                    Parallelism: 1
                    Delay: 1000000000
                    FailureAction: "pause"
                    Monitor: 15000000000
                    MaxFailureRatio: 0.15
                  EndpointSpec:
                    Ports:
                      -
                        Protocol: "tcp"
                        PublishedPort: 8080
                        TargetPort: 80
                  Labels:
                    foo: "bar"
        - name: "X-Registry-Auth"
          in: "header"
          description: "A base64-encoded auth configuration for pulling from private registries. [See the authentication section for details.](#section/Authentication)"
          type: "string"
      tags: ["Service"]
  /services/{id}:
    get:
      summary: "Inspect a service"
      operationId: "ServiceInspect"
      responses:
        200:
          description: "no error"
          schema:
            $ref: "#/definitions/Service"
        404:
          description: "no such service"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          description: "ID or name of service."
          required: true
          type: "string"
        - name: "insertDefaults"
          in: "query"
          description: "Fill empty fields with default values."
          type: "boolean"
          default: false
      tags: ["Service"]
    delete:
      summary: "Delete a service"
      operationId: "ServiceDelete"
      responses:
        200:
          description: "no error"
        404:
          description: "no such service"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          description: "ID or name of service."
          required: true
          type: "string"
      tags: ["Service"]
  /services/{id}/update:
    post:
      summary: "Update a service"
      operationId: "ServiceUpdate"
      consumes: ["application/json"]
      produces: ["application/json"]
      responses:
        200:
          description: "no error"
          schema:
            $ref: "#/definitions/ServiceUpdateResponse"
        400:
          description: "bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "no such service"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          description: "ID or name of service."
          required: true
          type: "string"
        - name: "body"
          in: "body"
          required: true
          schema:
            allOf:
              - $ref: "#/definitions/ServiceSpec"
              - type: "object"
                example:
                  Name: "top"
                  TaskTemplate:
                    ContainerSpec:
                      Image: "busybox"
                      Args:
                        - "top"
                    Resources:
                      Limits: {}
                      Reservations: {}
                    RestartPolicy:
                      Condition: "any"
                      MaxAttempts: 0
                    Placement: {}
                    ForceUpdate: 0
                  Mode:
                    Replicated:
                      Replicas: 1
                  UpdateConfig:
                    Parallelism: 2
                    Delay: 1000000000
                    FailureAction: "pause"
                    Monitor: 15000000000
                    MaxFailureRatio: 0.15
                  RollbackConfig:
                    Parallelism: 1
                    Delay: 1000000000
                    FailureAction: "pause"
                    Monitor: 15000000000
                    MaxFailureRatio: 0.15
                  EndpointSpec:
                    Mode: "vip"
@z

@x
        - name: "version"
          in: "query"
          description: "The version number of the service object being updated. This is required to avoid conflicting writes."
          required: true
          type: "integer"
        - name: "registryAuthFrom"
          in: "query"
          type: "string"
          description: "If the X-Registry-Auth header is not specified, this
  parameter indicates where to find registry authorization credentials. The
  valid values are `spec` and `previous-spec`."
          default: "spec"
        - name: "rollback"
          in: "query"
          type: "string"
          description: "Set to this parameter to `previous` to cause a
  server-side rollback to the previous service spec. The supplied spec will be
  ignored in this case."
        - name: "X-Registry-Auth"
          in: "header"
          description: "A base64-encoded auth configuration for pulling from private registries. [See the authentication section for details.](#section/Authentication)"
          type: "string"
@y
        - name: "version"
          in: "query"
          description: "The version number of the service object being updated. This is required to avoid conflicting writes."
          required: true
          type: "integer"
        - name: "registryAuthFrom"
          in: "query"
          type: "string"
          description: "If the X-Registry-Auth header is not specified, this
  parameter indicates where to find registry authorization credentials. The
  valid values are `spec` and `previous-spec`."
          default: "spec"
        - name: "rollback"
          in: "query"
          type: "string"
          description: "Set to this parameter to `previous` to cause a
  server-side rollback to the previous service spec. The supplied spec will be
  ignored in this case."
        - name: "X-Registry-Auth"
          in: "header"
          description: "A base64-encoded auth configuration for pulling from private registries. [See the authentication section for details.](#section/Authentication)"
          type: "string"
@z

@x
      tags: ["Service"]
  /services/{id}/logs:
    get:
      summary: "Get service logs"
      description: |
        Get `stdout` and `stderr` logs from a service.
@y
      tags: ["Service"]
  /services/{id}/logs:
    get:
      summary: "Get service logs"
      description: |
        Get `stdout` and `stderr` logs from a service.
@z

@x
        **Note**: This endpoint works only for services with the `json-file` or `journald` logging drivers.
      operationId: "ServiceLogs"
      produces:
        - "application/vnd.docker.raw-stream"
        - "application/json"
      responses:
        101:
          description: "logs returned as a stream"
          schema:
            type: "string"
            format: "binary"
        200:
          description: "logs returned as a string in response body"
          schema:
            type: "string"
        404:
          description: "no such service"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such service: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the service"
          type: "string"
        - name: "details"
          in: "query"
          description: "Show service context and extra details provided to logs."
          type: "boolean"
          default: false
        - name: "follow"
          in: "query"
          description: |
            Return the logs as a stream.
@y
        **Note**: This endpoint works only for services with the `json-file` or `journald` logging drivers.
      operationId: "ServiceLogs"
      produces:
        - "application/vnd.docker.raw-stream"
        - "application/json"
      responses:
        101:
          description: "logs returned as a stream"
          schema:
            type: "string"
            format: "binary"
        200:
          description: "logs returned as a string in response body"
          schema:
            type: "string"
        404:
          description: "no such service"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such service: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID or name of the service"
          type: "string"
        - name: "details"
          in: "query"
          description: "Show service context and extra details provided to logs."
          type: "boolean"
          default: false
        - name: "follow"
          in: "query"
          description: |
            Return the logs as a stream.
@z

@x
            This will return a `101` HTTP response with a `Connection: upgrade` header, then hijack the HTTP connection to send raw output. For more information about hijacking and the stream format, [see the documentation for the attach endpoint](#operation/ContainerAttach).
          type: "boolean"
          default: false
        - name: "stdout"
          in: "query"
          description: "Return logs from `stdout`"
          type: "boolean"
          default: false
        - name: "stderr"
          in: "query"
          description: "Return logs from `stderr`"
          type: "boolean"
          default: false
        - name: "since"
          in: "query"
          description: "Only return logs since this time, as a UNIX timestamp"
          type: "integer"
          default: 0
        - name: "timestamps"
          in: "query"
          description: "Add timestamps to every log line"
          type: "boolean"
          default: false
        - name: "tail"
          in: "query"
          description: "Only return this number of log lines from the end of the logs. Specify as an integer or `all` to output all log lines."
          type: "string"
          default: "all"
      tags: ["Service"]
  /tasks:
    get:
      summary: "List tasks"
      operationId: "TaskList"
      produces:
        - "application/json"
      responses:
        200:
          description: "no error"
          schema:
            type: "array"
            items:
              $ref: "#/definitions/Task"
            example:
              - ID: "0kzzo1i0y4jz6027t0k7aezc7"
                Version:
                  Index: 71
                CreatedAt: "2016-06-07T21:07:31.171892745Z"
                UpdatedAt: "2016-06-07T21:07:31.376370513Z"
                Spec:
                  ContainerSpec:
                    Image: "redis"
                  Resources:
                    Limits: {}
                    Reservations: {}
                  RestartPolicy:
                    Condition: "any"
                    MaxAttempts: 0
                  Placement: {}
                ServiceID: "9mnpnzenvg8p8tdbtq4wvbkcz"
                Slot: 1
                NodeID: "60gvrl6tm78dmak4yl7srz94v"
                Status:
                  Timestamp: "2016-06-07T21:07:31.290032978Z"
                  State: "running"
                  Message: "started"
                  ContainerStatus:
                    ContainerID: "e5d62702a1b48d01c3e02ca1e0212a250801fa8d67caca0b6f35919ebc12f035"
                    PID: 677
                DesiredState: "running"
                NetworksAttachments:
                  - Network:
                      ID: "4qvuz4ko70xaltuqbt8956gd1"
                      Version:
                        Index: 18
                      CreatedAt: "2016-06-07T20:31:11.912919752Z"
                      UpdatedAt: "2016-06-07T21:07:29.955277358Z"
                      Spec:
                        Name: "ingress"
                        Labels:
                          com.docker.swarm.internal: "true"
                        DriverConfiguration: {}
                        IPAMOptions:
                          Driver: {}
                          Configs:
                            - Subnet: "10.255.0.0/16"
                              Gateway: "10.255.0.1"
                      DriverState:
                        Name: "overlay"
                        Options:
                          com.docker.network.driver.overlay.vxlanid_list: "256"
                      IPAMOptions:
                        Driver:
                          Name: "default"
                        Configs:
                          - Subnet: "10.255.0.0/16"
                            Gateway: "10.255.0.1"
                    Addresses:
                      - "10.255.0.10/16"
              - ID: "1yljwbmlr8er2waf8orvqpwms"
                Version:
                  Index: 30
                CreatedAt: "2016-06-07T21:07:30.019104782Z"
                UpdatedAt: "2016-06-07T21:07:30.231958098Z"
                Name: "hopeful_cori"
                Spec:
                  ContainerSpec:
                    Image: "redis"
                  Resources:
                    Limits: {}
                    Reservations: {}
                  RestartPolicy:
                    Condition: "any"
                    MaxAttempts: 0
                  Placement: {}
                ServiceID: "9mnpnzenvg8p8tdbtq4wvbkcz"
                Slot: 1
                NodeID: "60gvrl6tm78dmak4yl7srz94v"
                Status:
                  Timestamp: "2016-06-07T21:07:30.202183143Z"
                  State: "shutdown"
                  Message: "shutdown"
                  ContainerStatus:
                    ContainerID: "1cf8d63d18e79668b0004a4be4c6ee58cddfad2dae29506d8781581d0688a213"
                DesiredState: "shutdown"
                NetworksAttachments:
                  - Network:
                      ID: "4qvuz4ko70xaltuqbt8956gd1"
                      Version:
                        Index: 18
                      CreatedAt: "2016-06-07T20:31:11.912919752Z"
                      UpdatedAt: "2016-06-07T21:07:29.955277358Z"
                      Spec:
                        Name: "ingress"
                        Labels:
                          com.docker.swarm.internal: "true"
                        DriverConfiguration: {}
                        IPAMOptions:
                          Driver: {}
                          Configs:
                            - Subnet: "10.255.0.0/16"
                              Gateway: "10.255.0.1"
                      DriverState:
                        Name: "overlay"
                        Options:
                          com.docker.network.driver.overlay.vxlanid_list: "256"
                      IPAMOptions:
                        Driver:
                          Name: "default"
                        Configs:
                          - Subnet: "10.255.0.0/16"
                            Gateway: "10.255.0.1"
                    Addresses:
                      - "10.255.0.5/16"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "filters"
          in: "query"
          type: "string"
          description: |
            A JSON encoded value of the filters (a `map[string][]string`) to process on the tasks list. Available filters:
@y
            This will return a `101` HTTP response with a `Connection: upgrade` header, then hijack the HTTP connection to send raw output. For more information about hijacking and the stream format, [see the documentation for the attach endpoint](#operation/ContainerAttach).
          type: "boolean"
          default: false
        - name: "stdout"
          in: "query"
          description: "Return logs from `stdout`"
          type: "boolean"
          default: false
        - name: "stderr"
          in: "query"
          description: "Return logs from `stderr`"
          type: "boolean"
          default: false
        - name: "since"
          in: "query"
          description: "Only return logs since this time, as a UNIX timestamp"
          type: "integer"
          default: 0
        - name: "timestamps"
          in: "query"
          description: "Add timestamps to every log line"
          type: "boolean"
          default: false
        - name: "tail"
          in: "query"
          description: "Only return this number of log lines from the end of the logs. Specify as an integer or `all` to output all log lines."
          type: "string"
          default: "all"
      tags: ["Service"]
  /tasks:
    get:
      summary: "List tasks"
      operationId: "TaskList"
      produces:
        - "application/json"
      responses:
        200:
          description: "no error"
          schema:
            type: "array"
            items:
              $ref: "#/definitions/Task"
            example:
              - ID: "0kzzo1i0y4jz6027t0k7aezc7"
                Version:
                  Index: 71
                CreatedAt: "2016-06-07T21:07:31.171892745Z"
                UpdatedAt: "2016-06-07T21:07:31.376370513Z"
                Spec:
                  ContainerSpec:
                    Image: "redis"
                  Resources:
                    Limits: {}
                    Reservations: {}
                  RestartPolicy:
                    Condition: "any"
                    MaxAttempts: 0
                  Placement: {}
                ServiceID: "9mnpnzenvg8p8tdbtq4wvbkcz"
                Slot: 1
                NodeID: "60gvrl6tm78dmak4yl7srz94v"
                Status:
                  Timestamp: "2016-06-07T21:07:31.290032978Z"
                  State: "running"
                  Message: "started"
                  ContainerStatus:
                    ContainerID: "e5d62702a1b48d01c3e02ca1e0212a250801fa8d67caca0b6f35919ebc12f035"
                    PID: 677
                DesiredState: "running"
                NetworksAttachments:
                  - Network:
                      ID: "4qvuz4ko70xaltuqbt8956gd1"
                      Version:
                        Index: 18
                      CreatedAt: "2016-06-07T20:31:11.912919752Z"
                      UpdatedAt: "2016-06-07T21:07:29.955277358Z"
                      Spec:
                        Name: "ingress"
                        Labels:
                          com.docker.swarm.internal: "true"
                        DriverConfiguration: {}
                        IPAMOptions:
                          Driver: {}
                          Configs:
                            - Subnet: "10.255.0.0/16"
                              Gateway: "10.255.0.1"
                      DriverState:
                        Name: "overlay"
                        Options:
                          com.docker.network.driver.overlay.vxlanid_list: "256"
                      IPAMOptions:
                        Driver:
                          Name: "default"
                        Configs:
                          - Subnet: "10.255.0.0/16"
                            Gateway: "10.255.0.1"
                    Addresses:
                      - "10.255.0.10/16"
              - ID: "1yljwbmlr8er2waf8orvqpwms"
                Version:
                  Index: 30
                CreatedAt: "2016-06-07T21:07:30.019104782Z"
                UpdatedAt: "2016-06-07T21:07:30.231958098Z"
                Name: "hopeful_cori"
                Spec:
                  ContainerSpec:
                    Image: "redis"
                  Resources:
                    Limits: {}
                    Reservations: {}
                  RestartPolicy:
                    Condition: "any"
                    MaxAttempts: 0
                  Placement: {}
                ServiceID: "9mnpnzenvg8p8tdbtq4wvbkcz"
                Slot: 1
                NodeID: "60gvrl6tm78dmak4yl7srz94v"
                Status:
                  Timestamp: "2016-06-07T21:07:30.202183143Z"
                  State: "shutdown"
                  Message: "shutdown"
                  ContainerStatus:
                    ContainerID: "1cf8d63d18e79668b0004a4be4c6ee58cddfad2dae29506d8781581d0688a213"
                DesiredState: "shutdown"
                NetworksAttachments:
                  - Network:
                      ID: "4qvuz4ko70xaltuqbt8956gd1"
                      Version:
                        Index: 18
                      CreatedAt: "2016-06-07T20:31:11.912919752Z"
                      UpdatedAt: "2016-06-07T21:07:29.955277358Z"
                      Spec:
                        Name: "ingress"
                        Labels:
                          com.docker.swarm.internal: "true"
                        DriverConfiguration: {}
                        IPAMOptions:
                          Driver: {}
                          Configs:
                            - Subnet: "10.255.0.0/16"
                              Gateway: "10.255.0.1"
                      DriverState:
                        Name: "overlay"
                        Options:
                          com.docker.network.driver.overlay.vxlanid_list: "256"
                      IPAMOptions:
                        Driver:
                          Name: "default"
                        Configs:
                          - Subnet: "10.255.0.0/16"
                            Gateway: "10.255.0.1"
                    Addresses:
                      - "10.255.0.5/16"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "filters"
          in: "query"
          type: "string"
          description: |
            A JSON encoded value of the filters (a `map[string][]string`) to process on the tasks list. Available filters:
@z

@x
            - `desired-state=(running | shutdown | accepted)`
            - `id=<task id>`
            - `label=key` or `label="key=value"`
            - `name=<task name>`
            - `node=<node id or name>`
            - `service=<service name>`
      tags: ["Task"]
  /tasks/{id}:
    get:
      summary: "Inspect a task"
      operationId: "TaskInspect"
      produces:
        - "application/json"
      responses:
        200:
          description: "no error"
          schema:
            $ref: "#/definitions/Task"
        404:
          description: "no such task"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          description: "ID of the task"
          required: true
          type: "string"
      tags: ["Task"]
  /tasks/{id}/logs:
    get:
      summary: "Get task logs"
      description: |
        Get `stdout` and `stderr` logs from a task.
@y
            - `desired-state=(running | shutdown | accepted)`
            - `id=<task id>`
            - `label=key` or `label="key=value"`
            - `name=<task name>`
            - `node=<node id or name>`
            - `service=<service name>`
      tags: ["Task"]
  /tasks/{id}:
    get:
      summary: "Inspect a task"
      operationId: "TaskInspect"
      produces:
        - "application/json"
      responses:
        200:
          description: "no error"
          schema:
            $ref: "#/definitions/Task"
        404:
          description: "no such task"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          description: "ID of the task"
          required: true
          type: "string"
      tags: ["Task"]
  /tasks/{id}/logs:
    get:
      summary: "Get task logs"
      description: |
        Get `stdout` and `stderr` logs from a task.
@z

@x
        **Note**: This endpoint works only for services with the `json-file` or `journald` logging drivers.
      operationId: "TaskLogs"
      produces:
        - "application/vnd.docker.raw-stream"
        - "application/json"
      responses:
        101:
          description: "logs returned as a stream"
          schema:
            type: "string"
            format: "binary"
        200:
          description: "logs returned as a string in response body"
          schema:
            type: "string"
        404:
          description: "no such task"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such task: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID of the task"
          type: "string"
        - name: "details"
          in: "query"
          description: "Show task context and extra details provided to logs."
          type: "boolean"
          default: false
        - name: "follow"
          in: "query"
          description: |
            Return the logs as a stream.
@y
        **Note**: This endpoint works only for services with the `json-file` or `journald` logging drivers.
      operationId: "TaskLogs"
      produces:
        - "application/vnd.docker.raw-stream"
        - "application/json"
      responses:
        101:
          description: "logs returned as a stream"
          schema:
            type: "string"
            format: "binary"
        200:
          description: "logs returned as a string in response body"
          schema:
            type: "string"
        404:
          description: "no such task"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such task: c2ada9df5af8"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          description: "ID of the task"
          type: "string"
        - name: "details"
          in: "query"
          description: "Show task context and extra details provided to logs."
          type: "boolean"
          default: false
        - name: "follow"
          in: "query"
          description: |
            Return the logs as a stream.
@z

@x
            This will return a `101` HTTP response with a `Connection: upgrade` header, then hijack the HTTP connection to send raw output. For more information about hijacking and the stream format, [see the documentation for the attach endpoint](#operation/ContainerAttach).
          type: "boolean"
          default: false
        - name: "stdout"
          in: "query"
          description: "Return logs from `stdout`"
          type: "boolean"
          default: false
        - name: "stderr"
          in: "query"
          description: "Return logs from `stderr`"
          type: "boolean"
          default: false
        - name: "since"
          in: "query"
          description: "Only return logs since this time, as a UNIX timestamp"
          type: "integer"
          default: 0
        - name: "timestamps"
          in: "query"
          description: "Add timestamps to every log line"
          type: "boolean"
          default: false
        - name: "tail"
          in: "query"
          description: "Only return this number of log lines from the end of the logs. Specify as an integer or `all` to output all log lines."
          type: "string"
          default: "all"
  /secrets:
    get:
      summary: "List secrets"
      operationId: "SecretList"
      produces:
        - "application/json"
      responses:
        200:
          description: "no error"
          schema:
            type: "array"
            items:
              $ref: "#/definitions/Secret"
            example:
              - ID: "ktnbjxoalbkvbvedmg1urrz8h"
                Version:
                  Index: 11
                CreatedAt: "2016-11-05T01:20:17.327670065Z"
                UpdatedAt: "2016-11-05T01:20:17.327670065Z"
                Spec:
                  Name: "app-dev.crt"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "filters"
          in: "query"
          type: "string"
          description: |
            A JSON encoded value of the filters (a `map[string][]string`) to process on the secrets list. Available filters:
@y
            This will return a `101` HTTP response with a `Connection: upgrade` header, then hijack the HTTP connection to send raw output. For more information about hijacking and the stream format, [see the documentation for the attach endpoint](#operation/ContainerAttach).
          type: "boolean"
          default: false
        - name: "stdout"
          in: "query"
          description: "Return logs from `stdout`"
          type: "boolean"
          default: false
        - name: "stderr"
          in: "query"
          description: "Return logs from `stderr`"
          type: "boolean"
          default: false
        - name: "since"
          in: "query"
          description: "Only return logs since this time, as a UNIX timestamp"
          type: "integer"
          default: 0
        - name: "timestamps"
          in: "query"
          description: "Add timestamps to every log line"
          type: "boolean"
          default: false
        - name: "tail"
          in: "query"
          description: "Only return this number of log lines from the end of the logs. Specify as an integer or `all` to output all log lines."
          type: "string"
          default: "all"
  /secrets:
    get:
      summary: "List secrets"
      operationId: "SecretList"
      produces:
        - "application/json"
      responses:
        200:
          description: "no error"
          schema:
            type: "array"
            items:
              $ref: "#/definitions/Secret"
            example:
              - ID: "ktnbjxoalbkvbvedmg1urrz8h"
                Version:
                  Index: 11
                CreatedAt: "2016-11-05T01:20:17.327670065Z"
                UpdatedAt: "2016-11-05T01:20:17.327670065Z"
                Spec:
                  Name: "app-dev.crt"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "filters"
          in: "query"
          type: "string"
          description: |
            A JSON encoded value of the filters (a `map[string][]string`) to process on the secrets list. Available filters:
@z

@x
            - `id=<secret id>`
            - `label=<key> or label=<key>=value`
            - `name=<secret name>`
            - `names=<secret name>`
      tags: ["Secret"]
  /secrets/create:
    post:
      summary: "Create a secret"
      operationId: "SecretCreate"
      consumes:
        - "application/json"
      produces:
        - "application/json"
      responses:
        201:
          description: "no error"
          schema:
            type: "object"
            properties:
              ID:
                description: "The ID of the created secret."
                type: "string"
            example:
              ID: "ktnbjxoalbkvbvedmg1urrz8h"
        409:
          description: "name conflicts with an existing object"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "body"
          in: "body"
          schema:
            allOf:
              - $ref: "#/definitions/SecretSpec"
              - type: "object"
                example:
                  Name: "app-key.crt"
                  Labels:
                    foo: "bar"
                  Data: "VEhJUyBJUyBOT1QgQSBSRUFMIENFUlRJRklDQVRFCg=="
      tags: ["Secret"]
  /secrets/{id}:
    get:
      summary: "Inspect a secret"
      operationId: "SecretInspect"
      produces:
        - "application/json"
      responses:
        200:
          description: "no error"
          schema:
            $ref: "#/definitions/Secret"
          examples:
            application/json:
              ID: "ktnbjxoalbkvbvedmg1urrz8h"
              Version:
                Index: 11
              CreatedAt: "2016-11-05T01:20:17.327670065Z"
              UpdatedAt: "2016-11-05T01:20:17.327670065Z"
              Spec:
                Name: "app-dev.crt"
        404:
          description: "secret not found"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          type: "string"
          description: "ID of the secret"
      tags: ["Secret"]
    delete:
      summary: "Delete a secret"
      operationId: "SecretDelete"
      produces:
        - "application/json"
      responses:
        204:
          description: "no error"
        404:
          description: "secret not found"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          type: "string"
          description: "ID of the secret"
      tags: ["Secret"]
  /secrets/{id}/update:
    post:
      summary: "Update a Secret"
      operationId: "SecretUpdate"
      responses:
        200:
          description: "no error"
        400:
          description: "bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "no such secret"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          description: "The ID or name of the secret"
          type: "string"
          required: true
        - name: "body"
          in: "body"
          schema:
            $ref: "#/definitions/SecretSpec"
          description: "The spec of the secret to update. Currently, only the Labels field can be updated. All other fields must remain unchanged from the [SecretInspect endpoint](#operation/SecretInspect) response values."
        - name: "version"
          in: "query"
          description: "The version number of the secret object being updated. This is required to avoid conflicting writes."
          type: "integer"
          format: "int64"
          required: true
      tags: ["Secret"]
  /configs:
    get:
      summary: "List configs"
      operationId: "ConfigList"
      produces:
        - "application/json"
      responses:
        200:
          description: "no error"
          schema:
            type: "array"
            items:
              $ref: "#/definitions/Config"
            example:
              - ID: "ktnbjxoalbkvbvedmg1urrz8h"
                Version:
                  Index: 11
                CreatedAt: "2016-11-05T01:20:17.327670065Z"
                UpdatedAt: "2016-11-05T01:20:17.327670065Z"
                Spec:
                  Name: "server.conf"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "filters"
          in: "query"
          type: "string"
          description: |
            A JSON encoded value of the filters (a `map[string][]string`) to process on the configs list. Available filters:
@y
            - `id=<secret id>`
            - `label=<key> or label=<key>=value`
            - `name=<secret name>`
            - `names=<secret name>`
      tags: ["Secret"]
  /secrets/create:
    post:
      summary: "Create a secret"
      operationId: "SecretCreate"
      consumes:
        - "application/json"
      produces:
        - "application/json"
      responses:
        201:
          description: "no error"
          schema:
            type: "object"
            properties:
              ID:
                description: "The ID of the created secret."
                type: "string"
            example:
              ID: "ktnbjxoalbkvbvedmg1urrz8h"
        409:
          description: "name conflicts with an existing object"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "body"
          in: "body"
          schema:
            allOf:
              - $ref: "#/definitions/SecretSpec"
              - type: "object"
                example:
                  Name: "app-key.crt"
                  Labels:
                    foo: "bar"
                  Data: "VEhJUyBJUyBOT1QgQSBSRUFMIENFUlRJRklDQVRFCg=="
      tags: ["Secret"]
  /secrets/{id}:
    get:
      summary: "Inspect a secret"
      operationId: "SecretInspect"
      produces:
        - "application/json"
      responses:
        200:
          description: "no error"
          schema:
            $ref: "#/definitions/Secret"
          examples:
            application/json:
              ID: "ktnbjxoalbkvbvedmg1urrz8h"
              Version:
                Index: 11
              CreatedAt: "2016-11-05T01:20:17.327670065Z"
              UpdatedAt: "2016-11-05T01:20:17.327670065Z"
              Spec:
                Name: "app-dev.crt"
        404:
          description: "secret not found"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          type: "string"
          description: "ID of the secret"
      tags: ["Secret"]
    delete:
      summary: "Delete a secret"
      operationId: "SecretDelete"
      produces:
        - "application/json"
      responses:
        204:
          description: "no error"
        404:
          description: "secret not found"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          type: "string"
          description: "ID of the secret"
      tags: ["Secret"]
  /secrets/{id}/update:
    post:
      summary: "Update a Secret"
      operationId: "SecretUpdate"
      responses:
        200:
          description: "no error"
        400:
          description: "bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "no such secret"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          description: "The ID or name of the secret"
          type: "string"
          required: true
        - name: "body"
          in: "body"
          schema:
            $ref: "#/definitions/SecretSpec"
          description: "The spec of the secret to update. Currently, only the Labels field can be updated. All other fields must remain unchanged from the [SecretInspect endpoint](#operation/SecretInspect) response values."
        - name: "version"
          in: "query"
          description: "The version number of the secret object being updated. This is required to avoid conflicting writes."
          type: "integer"
          format: "int64"
          required: true
      tags: ["Secret"]
  /configs:
    get:
      summary: "List configs"
      operationId: "ConfigList"
      produces:
        - "application/json"
      responses:
        200:
          description: "no error"
          schema:
            type: "array"
            items:
              $ref: "#/definitions/Config"
            example:
              - ID: "ktnbjxoalbkvbvedmg1urrz8h"
                Version:
                  Index: 11
                CreatedAt: "2016-11-05T01:20:17.327670065Z"
                UpdatedAt: "2016-11-05T01:20:17.327670065Z"
                Spec:
                  Name: "server.conf"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "filters"
          in: "query"
          type: "string"
          description: |
            A JSON encoded value of the filters (a `map[string][]string`) to process on the configs list. Available filters:
@z

@x
            - `id=<config id>`
            - `label=<key> or label=<key>=value`
            - `name=<config name>`
            - `names=<config name>`
      tags: ["Config"]
  /configs/create:
    post:
      summary: "Create a config"
      operationId: "ConfigCreate"
      consumes:
        - "application/json"
      produces:
        - "application/json"
      responses:
        201:
          description: "no error"
          schema:
            type: "object"
            properties:
              ID:
                description: "The ID of the created config."
                type: "string"
            example:
              ID: "ktnbjxoalbkvbvedmg1urrz8h"
        409:
          description: "name conflicts with an existing object"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "body"
          in: "body"
          schema:
            allOf:
              - $ref: "#/definitions/ConfigSpec"
              - type: "object"
                example:
                  Name: "server.conf"
                  Labels:
                    foo: "bar"
                  Data: "VEhJUyBJUyBOT1QgQSBSRUFMIENFUlRJRklDQVRFCg=="
      tags: ["Config"]
  /configs/{id}:
    get:
      summary: "Inspect a config"
      operationId: "ConfigInspect"
      produces:
        - "application/json"
      responses:
        200:
          description: "no error"
          schema:
            $ref: "#/definitions/Config"
          examples:
            application/json:
              ID: "ktnbjxoalbkvbvedmg1urrz8h"
              Version:
                Index: 11
              CreatedAt: "2016-11-05T01:20:17.327670065Z"
              UpdatedAt: "2016-11-05T01:20:17.327670065Z"
              Spec:
                Name: "app-dev.crt"
        404:
          description: "config not found"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          type: "string"
          description: "ID of the config"
      tags: ["Config"]
    delete:
      summary: "Delete a config"
      operationId: "ConfigDelete"
      produces:
        - "application/json"
      responses:
        204:
          description: "no error"
        404:
          description: "config not found"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          type: "string"
          description: "ID of the config"
      tags: ["Config"]
  /configs/{id}/update:
    post:
      summary: "Update a Config"
      operationId: "ConfigUpdate"
      responses:
        200:
          description: "no error"
        400:
          description: "bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "no such config"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          description: "The ID or name of the config"
          type: "string"
          required: true
        - name: "body"
          in: "body"
          schema:
            $ref: "#/definitions/ConfigSpec"
          description: "The spec of the config to update. Currently, only the Labels field can be updated. All other fields must remain unchanged from the [ConfigInspect endpoint](#operation/ConfigInspect) response values."
        - name: "version"
          in: "query"
          description: "The version number of the config object being updated. This is required to avoid conflicting writes."
          type: "integer"
          format: "int64"
          required: true
      tags: ["Config"]
  /distribution/{name}/json:
    get:
      summary: "Get image information from the registry"
      description: "Return image digest and platform information by contacting the registry."
      operationId: "DistributionInspect"
      produces:
        - "application/json"
      responses:
        200:
          description: "descriptor and platform information"
          schema:
            type: "object"
            x-go-name: DistributionInspect
            required: [Descriptor, Platforms]
            properties:
              Descriptor:
                type: "object"
                description: "A descriptor struct containing digest, media type, and size"
                properties:
                  MediaType:
                    type: "string"
                  Size:
                    type: "integer"
                    format: "int64"
                  Digest:
                    type: "string"
                  URLs:
                    type: "array"
                    items:
                      type: "string"
              Platforms:
                type: "array"
                description: "An array containing all platforms supported by the image"
                items:
                  type: "object"
                  properties:
                    Architecture:
                      type: "string"
                    OS:
                      type: "string"
                    OSVersion:
                      type: "string"
                    OSFeatures:
                      type: "array"
                      items:
                        type: "string"
                    Variant:
                      type: "string"
                    Features:
                      type: "array"
                      items:
                        type: "string"
          examples:
            application/json:
              Descriptor:
                MediaType: "application/vnd.docker.distribution.manifest.v2+json"
                Digest: "sha256:c0537ff6a5218ef531ece93d4984efc99bbf3f7497c0a7726c88e2bb7584dc96"
                Size: 3987495
                URLs:
                  - ""
              Platforms:
                - Architecture: "amd64"
                  OS: "linux"
                  OSVersion: ""
                  OSFeatures:
                    - ""
                  Variant: ""
                  Features:
                    - ""
        401:
          description: "Failed authentication or no image found"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such image: someimage (tag: latest)"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "name"
          in: "path"
          description: "Image name or id"
          type: "string"
          required: true
      tags: ["Distribution"]
@y
            - `id=<config id>`
            - `label=<key> or label=<key>=value`
            - `name=<config name>`
            - `names=<config name>`
      tags: ["Config"]
  /configs/create:
    post:
      summary: "Create a config"
      operationId: "ConfigCreate"
      consumes:
        - "application/json"
      produces:
        - "application/json"
      responses:
        201:
          description: "no error"
          schema:
            type: "object"
            properties:
              ID:
                description: "The ID of the created config."
                type: "string"
            example:
              ID: "ktnbjxoalbkvbvedmg1urrz8h"
        409:
          description: "name conflicts with an existing object"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "body"
          in: "body"
          schema:
            allOf:
              - $ref: "#/definitions/ConfigSpec"
              - type: "object"
                example:
                  Name: "server.conf"
                  Labels:
                    foo: "bar"
                  Data: "VEhJUyBJUyBOT1QgQSBSRUFMIENFUlRJRklDQVRFCg=="
      tags: ["Config"]
  /configs/{id}:
    get:
      summary: "Inspect a config"
      operationId: "ConfigInspect"
      produces:
        - "application/json"
      responses:
        200:
          description: "no error"
          schema:
            $ref: "#/definitions/Config"
          examples:
            application/json:
              ID: "ktnbjxoalbkvbvedmg1urrz8h"
              Version:
                Index: 11
              CreatedAt: "2016-11-05T01:20:17.327670065Z"
              UpdatedAt: "2016-11-05T01:20:17.327670065Z"
              Spec:
                Name: "app-dev.crt"
        404:
          description: "config not found"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          type: "string"
          description: "ID of the config"
      tags: ["Config"]
    delete:
      summary: "Delete a config"
      operationId: "ConfigDelete"
      produces:
        - "application/json"
      responses:
        204:
          description: "no error"
        404:
          description: "config not found"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          required: true
          type: "string"
          description: "ID of the config"
      tags: ["Config"]
  /configs/{id}/update:
    post:
      summary: "Update a Config"
      operationId: "ConfigUpdate"
      responses:
        200:
          description: "no error"
        400:
          description: "bad parameter"
          schema:
            $ref: "#/definitions/ErrorResponse"
        404:
          description: "no such config"
          schema:
            $ref: "#/definitions/ErrorResponse"
        500:
          description: "server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
        503:
          description: "node is not part of a swarm"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "id"
          in: "path"
          description: "The ID or name of the config"
          type: "string"
          required: true
        - name: "body"
          in: "body"
          schema:
            $ref: "#/definitions/ConfigSpec"
          description: "The spec of the config to update. Currently, only the Labels field can be updated. All other fields must remain unchanged from the [ConfigInspect endpoint](#operation/ConfigInspect) response values."
        - name: "version"
          in: "query"
          description: "The version number of the config object being updated. This is required to avoid conflicting writes."
          type: "integer"
          format: "int64"
          required: true
      tags: ["Config"]
  /distribution/{name}/json:
    get:
      summary: "Get image information from the registry"
      description: "Return image digest and platform information by contacting the registry."
      operationId: "DistributionInspect"
      produces:
        - "application/json"
      responses:
        200:
          description: "descriptor and platform information"
          schema:
            type: "object"
            x-go-name: DistributionInspect
            required: [Descriptor, Platforms]
            properties:
              Descriptor:
                type: "object"
                description: "A descriptor struct containing digest, media type, and size"
                properties:
                  MediaType:
                    type: "string"
                  Size:
                    type: "integer"
                    format: "int64"
                  Digest:
                    type: "string"
                  URLs:
                    type: "array"
                    items:
                      type: "string"
              Platforms:
                type: "array"
                description: "An array containing all platforms supported by the image"
                items:
                  type: "object"
                  properties:
                    Architecture:
                      type: "string"
                    OS:
                      type: "string"
                    OSVersion:
                      type: "string"
                    OSFeatures:
                      type: "array"
                      items:
                        type: "string"
                    Variant:
                      type: "string"
                    Features:
                      type: "array"
                      items:
                        type: "string"
          examples:
            application/json:
              Descriptor:
                MediaType: "application/vnd.docker.distribution.manifest.v2+json"
                Digest: "sha256:c0537ff6a5218ef531ece93d4984efc99bbf3f7497c0a7726c88e2bb7584dc96"
                Size: 3987495
                URLs:
                  - ""
              Platforms:
                - Architecture: "amd64"
                  OS: "linux"
                  OSVersion: ""
                  OSFeatures:
                    - ""
                  Variant: ""
                  Features:
                    - ""
        401:
          description: "Failed authentication or no image found"
          schema:
            $ref: "#/definitions/ErrorResponse"
          examples:
            application/json:
              message: "No such image: someimage (tag: latest)"
        500:
          description: "Server error"
          schema:
            $ref: "#/definitions/ErrorResponse"
      parameters:
        - name: "name"
          in: "path"
          description: "Image name or id"
          type: "string"
          required: true
      tags: ["Distribution"]
@z
