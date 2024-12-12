%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Build garbage collection
description: Learn about garbage collection in the BuildKit daemon
keywords: build, buildx, buildkit, garbage collection, prune, gc
@y
title: Build garbage collection
description: Learn about garbage collection in the BuildKit daemon
keywords: build, buildx, buildkit, garbage collection, prune, gc
@z

@x
While [`docker builder prune`](/reference/cli/docker/builder/prune.md)
or [`docker buildx prune`](/reference/cli/docker/buildx/prune.md)
commands run at once, garbage collection runs periodically and follows an
ordered list of prune policies.
@y
While [`docker builder prune`](reference/cli/docker/builder/prune.md)
or [`docker buildx prune`](reference/cli/docker/buildx/prune.md)
commands run at once, garbage collection runs periodically and follows an
ordered list of prune policies.
@z

@x
Garbage collection runs in the BuildKit daemon. The daemon clears the build
cache when the cache size becomes too big, or when the cache age expires. The
following sections describe how you can configure both the size and age
parameters by defining garbage collection policies.
@y
Garbage collection runs in the BuildKit daemon. The daemon clears the build
cache when the cache size becomes too big, or when the cache age expires. The
following sections describe how you can configure both the size and age
parameters by defining garbage collection policies.
@z

@x
Each of the policy's parameters corresponds with a `docker buildx prune` command line
argument. Details can be found in the
`docker buildx prune` [documentation](/reference/cli/docker/buildx/prune.md).
@y
Each of the policy's parameters corresponds with a `docker buildx prune` command line
argument. Details can be found in the
`docker buildx prune` [documentation](reference/cli/docker/buildx/prune.md).
@z

@x
## Configuration
@y
## Configuration
@z

@x
Depending on the [driver](../builders/drivers/_index.md) used by your builder instance,
the garbage collection will use a different configuration file.
@y
Depending on the [driver](../builders/drivers/_index.md) used by your builder instance,
the garbage collection will use a different configuration file.
@z

@x
If you're using the [`docker` driver](../builders/drivers/docker.md), garbage collection
can be configured in the [Docker Daemon configuration](/reference/cli/dockerd.md#daemon-configuration-file).
file:
@y
If you're using the [`docker` driver](../builders/drivers/docker.md), garbage collection
can be configured in the [Docker Daemon configuration](reference/cli/dockerd.md#daemon-configuration-file).
file:
@z

@x
```json
{
  "builder": {
    "gc": {
      "enabled": true,
      "defaultKeepStorage": "10GB",
      "policy": [
        { "keepStorage": "10GB", "filter": ["unused-for=2200h"] },
        { "keepStorage": "50GB", "filter": ["unused-for=3300h"] },
        { "keepStorage": "100GB", "all": true }
      ]
    }
  }
}
```
@y
```json
{
  "builder": {
    "gc": {
      "enabled": true,
      "defaultKeepStorage": "10GB",
      "policy": [
        { "keepStorage": "10GB", "filter": ["unused-for=2200h"] },
        { "keepStorage": "50GB", "filter": ["unused-for=3300h"] },
        { "keepStorage": "100GB", "all": true }
      ]
    }
  }
}
```
@z

@x
For other drivers, garbage collection can be configured using the
[BuildKit configuration](../buildkit/toml-configuration.md) file:
@y
For other drivers, garbage collection can be configured using the
[BuildKit configuration](../buildkit/toml-configuration.md) file:
@z

@x
```toml
[worker.oci]
  gc = true
  gckeepstorage = 10000
  [[worker.oci.gcpolicy]]
    keepBytes = 512000000
    keepDuration = 172800
    filters = [ "type==source.local", "type==exec.cachemount", "type==source.git.checkout"]
  [[worker.oci.gcpolicy]]
    all = true
    keepBytes = 1024000000
```
@y
```toml
[worker.oci]
  gc = true
  gckeepstorage = 10000
  [[worker.oci.gcpolicy]]
    keepBytes = 512000000
    keepDuration = 172800
    filters = [ "type==source.local", "type==exec.cachemount", "type==source.git.checkout"]
  [[worker.oci.gcpolicy]]
    all = true
    keepBytes = 1024000000
```
@z

@x
## Default policies
@y
## Default policies
@z

@x
Default garbage collection policies apply to all builders if not set:
@y
Default garbage collection policies apply to all builders if not set:
@z

@x
```text
GC Policy rule#0:
        All:            false
        Filters:        type==source.local,type==exec.cachemount,type==source.git.checkout
        Keep Duration:  48h0m0s
        Keep Bytes:     512MB
GC Policy rule#1:
        All:            false
        Keep Duration:  1440h0m0s
        Keep Bytes:     26GB
GC Policy rule#2:
        All:            false
        Keep Bytes:     26GB
GC Policy rule#3:
        All:            true
        Keep Bytes:     26GB
```
@y
```text
GC Policy rule#0:
        All:            false
        Filters:        type==source.local,type==exec.cachemount,type==source.git.checkout
        Keep Duration:  48h0m0s
        Keep Bytes:     512MB
GC Policy rule#1:
        All:            false
        Keep Duration:  1440h0m0s
        Keep Bytes:     26GB
GC Policy rule#2:
        All:            false
        Keep Bytes:     26GB
GC Policy rule#3:
        All:            true
        Keep Bytes:     26GB
```
@z

@x
- `rule#0`: if build cache uses more than 512MB delete the most easily
  reproducible data after it has not been used for 2 days.
- `rule#1`: remove any data not used for 60 days.
- `rule#2`: keep the unshared build cache under cap.
- `rule#3`: if previous policies were insufficient start deleting internal data
  to keep build cache under cap.
@y
- `rule#0`: if build cache uses more than 512MB delete the most easily
  reproducible data after it has not been used for 2 days.
- `rule#1`: remove any data not used for 60 days.
- `rule#2`: keep the unshared build cache under cap.
- `rule#3`: if previous policies were insufficient start deleting internal data
  to keep build cache under cap.
@z

@x
> [!NOTE]
>
> `Keep Bytes` defaults to 10% of the size of the disk. If the disk size cannot
> be determined, it uses 2GB as a fallback.
@y
> [!NOTE]
>
> `Keep Bytes` defaults to 10% of the size of the disk. If the disk size cannot
> be determined, it uses 2GB as a fallback.
@z
