%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# buildkitd.toml
@y
# buildkitd.toml
@z

@x
The TOML file used to configure the buildkitd daemon settings has a short
list of global settings followed by a series of sections for specific areas
of daemon configuration.
@y
The TOML file used to configure the buildkitd daemon settings has a short
list of global settings followed by a series of sections for specific areas
of daemon configuration.
@z

@x
The file path is `/etc/buildkit/buildkitd.toml` for rootful mode,
`~/.config/buildkit/buildkitd.toml` for rootless mode.
@y
The file path is `/etc/buildkit/buildkitd.toml` for rootful mode,
`~/.config/buildkit/buildkitd.toml` for rootless mode.
@z

@x
The following is a complete `buildkitd.toml` configuration example, please
note some configuration is only good for edge cases, please take care of it
carefully.
@y
The following is a complete `buildkitd.toml` configuration example, please
note some configuration is only good for edge cases, please take care of it
carefully.
@z

@x
```toml
# debug enables additional debug logging
debug = true
# trace enables additional trace logging (very verbose, with potential performance impacts)
trace = true
# root is where all buildkit state is stored.
root = "/var/lib/buildkit"
# insecure-entitlements allows insecure entitlements, disabled by default.
insecure-entitlements = [ "network.host", "security.insecure" ]
@y
```toml
# debug enables additional debug logging
debug = true
# trace enables additional trace logging (very verbose, with potential performance impacts)
trace = true
# root is where all buildkit state is stored.
root = "/var/lib/buildkit"
# insecure-entitlements allows insecure entitlements, disabled by default.
insecure-entitlements = [ "network.host", "security.insecure" ]
@z

@x
[log]
  # log formatter: json or text
  format = "text"
@y
[log]
  # log formatter: json or text
  format = "text"
@z

@x
[dns]
  nameservers=["1.1.1.1","8.8.8.8"]
  options=["edns0"]
  searchDomains=["example.com"]
@y
[dns]
  nameservers=["1.1.1.1","8.8.8.8"]
  options=["edns0"]
  searchDomains=["example.com"]
@z

@x
[grpc]
  address = [ "tcp://0.0.0.0:1234" ]
  # debugAddress is address for attaching go profiles and debuggers.
  debugAddress = "0.0.0.0:6060"
  uid = 0
  gid = 0
  [grpc.tls]
    cert = "/etc/buildkit/tls.crt"
    key = "/etc/buildkit/tls.key"
    ca = "/etc/buildkit/tlsca.crt"
@y
[grpc]
  address = [ "tcp://0.0.0.0:1234" ]
  # debugAddress is address for attaching go profiles and debuggers.
  debugAddress = "0.0.0.0:6060"
  uid = 0
  gid = 0
  [grpc.tls]
    cert = "/etc/buildkit/tls.crt"
    key = "/etc/buildkit/tls.key"
    ca = "/etc/buildkit/tlsca.crt"
@z

@x
[otel]
  # OTEL collector trace socket path
  socketPath = "/run/buildkit/otel-grpc.sock"
@y
[otel]
  # OTEL collector trace socket path
  socketPath = "/run/buildkit/otel-grpc.sock"
@z

@x
# config for build history API that stores information about completed build commands
[history]
  # maxAge is the maximum age of history entries to keep, in seconds.
  maxAge = 172800
  # maxEntries is the maximum number of history entries to keep.
  maxEntries = 50
@y
# config for build history API that stores information about completed build commands
[history]
  # maxAge is the maximum age of history entries to keep, in seconds.
  maxAge = 172800
  # maxEntries is the maximum number of history entries to keep.
  maxEntries = 50
@z

@x
[worker.oci]
  enabled = true
  # platforms is manually configure platforms, detected automatically if unset.
  platforms = [ "linux/amd64", "linux/arm64" ]
  snapshotter = "auto" # overlayfs or native, default value is "auto".
  rootless = false # see docs/rootless.md for the details on rootless mode.
  # Whether run subprocesses in main pid namespace or not, this is useful for
  # running rootless buildkit inside a container.
  noProcessSandbox = false
  gc = true
  # gckeepstorage can be an integer number of bytes (e.g. 512000000), a string
  # with a unit (e.g. "512MB"), or a string percentage of the total disk
  # space (e.g. "10%")
  gckeepstorage = 9000
  # alternate OCI worker binary name(example 'crun'), by default either 
  # buildkit-runc or runc binary is used
  binary = ""
  # name of the apparmor profile that should be used to constrain build containers.
  # the profile should already be loaded (by a higher level system) before creating a worker.
  apparmor-profile = ""
  # limit the number of parallel build steps that can run at the same time
  max-parallelism = 4
  # maintain a pool of reusable CNI network namespaces to amortize the overhead
  # of allocating and releasing the namespaces
  cniPoolSize = 16
@y
[worker.oci]
  enabled = true
  # platforms is manually configure platforms, detected automatically if unset.
  platforms = [ "linux/amd64", "linux/arm64" ]
  snapshotter = "auto" # overlayfs or native, default value is "auto".
  rootless = false # see docs/rootless.md for the details on rootless mode.
  # Whether run subprocesses in main pid namespace or not, this is useful for
  # running rootless buildkit inside a container.
  noProcessSandbox = false
  gc = true
  # gckeepstorage can be an integer number of bytes (e.g. 512000000), a string
  # with a unit (e.g. "512MB"), or a string percentage of the total disk
  # space (e.g. "10%")
  gckeepstorage = 9000
  # alternate OCI worker binary name(example 'crun'), by default either 
  # buildkit-runc or runc binary is used
  binary = ""
  # name of the apparmor profile that should be used to constrain build containers.
  # the profile should already be loaded (by a higher level system) before creating a worker.
  apparmor-profile = ""
  # limit the number of parallel build steps that can run at the same time
  max-parallelism = 4
  # maintain a pool of reusable CNI network namespaces to amortize the overhead
  # of allocating and releasing the namespaces
  cniPoolSize = 16
@z

@x
  [worker.oci.labels]
    "foo" = "bar"
@y
  [worker.oci.labels]
    "foo" = "bar"
@z

@x
  [[worker.oci.gcpolicy]]
    # keepBytes can be an integer number of bytes (e.g. 512000000), a string
    # with a unit (e.g. "512MB"), or a string percentage of the total disk
    # space (e.g. "10%")
    keepBytes = "512MB"
    # keepDuration can be an integer number of seconds (e.g. 172800), or a
    # string duration (e.g. "48h")
    keepDuration = "48h"
    filters = [ "type==source.local", "type==exec.cachemount", "type==source.git.checkout"]
  [[worker.oci.gcpolicy]]
    all = true
    keepBytes = 1024000000
@y
  [[worker.oci.gcpolicy]]
    # keepBytes can be an integer number of bytes (e.g. 512000000), a string
    # with a unit (e.g. "512MB"), or a string percentage of the total disk
    # space (e.g. "10%")
    keepBytes = "512MB"
    # keepDuration can be an integer number of seconds (e.g. 172800), or a
    # string duration (e.g. "48h")
    keepDuration = "48h"
    filters = [ "type==source.local", "type==exec.cachemount", "type==source.git.checkout"]
  [[worker.oci.gcpolicy]]
    all = true
    keepBytes = 1024000000
@z

@x
[worker.containerd]
  address = "/run/containerd/containerd.sock"
  enabled = true
  platforms = [ "linux/amd64", "linux/arm64" ]
  namespace = "buildkit"
  gc = true
  # gckeepstorage sets storage limit for default gc profile, in bytes.
  gckeepstorage = 9000
  # maintain a pool of reusable CNI network namespaces to amortize the overhead
  # of allocating and releasing the namespaces
  cniPoolSize = 16
@y
[worker.containerd]
  address = "/run/containerd/containerd.sock"
  enabled = true
  platforms = [ "linux/amd64", "linux/arm64" ]
  namespace = "buildkit"
  gc = true
  # gckeepstorage sets storage limit for default gc profile, in bytes.
  gckeepstorage = 9000
  # maintain a pool of reusable CNI network namespaces to amortize the overhead
  # of allocating and releasing the namespaces
  cniPoolSize = 16
@z

@x
  [worker.containerd.labels]
    "foo" = "bar"
@y
  [worker.containerd.labels]
    "foo" = "bar"
@z

@x
  # configure the containerd runtime
  [worker.containerd.runtime]
    name = "io.containerd.runc.v2"
    path = "/path/to/containerd/runc/shim"
    options = { BinaryName = "runc" }
@y
  # configure the containerd runtime
  [worker.containerd.runtime]
    name = "io.containerd.runc.v2"
    path = "/path/to/containerd/runc/shim"
    options = { BinaryName = "runc" }
@z

@x
  [[worker.containerd.gcpolicy]]
    keepBytes = 512000000
    keepDuration = 172800
    filters = [ "type==source.local", "type==exec.cachemount", "type==source.git.checkout"]
  [[worker.containerd.gcpolicy]]
    all = true
    keepBytes = 1024000000
@y
  [[worker.containerd.gcpolicy]]
    keepBytes = 512000000
    keepDuration = 172800
    filters = [ "type==source.local", "type==exec.cachemount", "type==source.git.checkout"]
  [[worker.containerd.gcpolicy]]
    all = true
    keepBytes = 1024000000
@z

@x
# registry configures a new Docker register used for cache import or output.
[registry."docker.io"]
  # mirror configuration to handle path in case a mirror registry requires a /project path rather than just a host:port
  mirrors = ["yourmirror.local:5000", "core.harbor.domain/proxy.docker.io"]
  http = true
  insecure = true
  ca=["/etc/config/myca.pem"]
  [[registry."docker.io".keypair]]
    key="/etc/config/key.pem"
    cert="/etc/config/cert.pem"
@y
# registry configures a new Docker register used for cache import or output.
[registry."docker.io"]
  # mirror configuration to handle path in case a mirror registry requires a /project path rather than just a host:port
  mirrors = ["yourmirror.local:5000", "core.harbor.domain/proxy.docker.io"]
  http = true
  insecure = true
  ca=["/etc/config/myca.pem"]
  [[registry."docker.io".keypair]]
    key="/etc/config/key.pem"
    cert="/etc/config/cert.pem"
@z

@x
# optionally mirror configuration can be done by defining it as a registry.
[registry."yourmirror.local:5000"]
  http = true
```
@y
# optionally mirror configuration can be done by defining it as a registry.
[registry."yourmirror.local:5000"]
  http = true
```
@z
