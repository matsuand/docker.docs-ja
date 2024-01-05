%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# Compose file
@y
# Compose file
@z

@x
The Compose file is a [YAML](http://yaml.org/) file defining:
- [Version](04-version-and-name.md) (Optional)
- [Services](05-services.md) (Required)
- [Networks](06-networks.md)
- [Volumes](07-volumes.md)
- [Configs](08-configs.md) 
- [Secrets](09-secrets.md)
@y
The Compose file is a [YAML](http://yaml.org/) file defining:
- [Version](04-version-and-name.md) (Optional)
- [Services](05-services.md) (Required)
- [Networks](06-networks.md)
- [Volumes](07-volumes.md)
- [Configs](08-configs.md) 
- [Secrets](09-secrets.md)
@z

@x
The default path for a Compose file is `compose.yaml` (preferred) or `compose.yml` that is placed in the working directory.
Compose also supports `docker-compose.yaml` and `docker-compose.yml` for backwards compatibility of earlier versions.
If both files exist, Compose prefers the canonical `compose.yaml`.
@y
The default path for a Compose file is `compose.yaml` (preferred) or `compose.yml` that is placed in the working directory.
Compose also supports `docker-compose.yaml` and `docker-compose.yml` for backwards compatibility of earlier versions.
If both files exist, Compose prefers the canonical `compose.yaml`.
@z

@x
You can use [fragments](10-fragments.md) and [extensions](11-extension.md) to keep your Compose file efficient and easy to maintain.
@y
You can use [fragments](10-fragments.md) and [extensions](11-extension.md) to keep your Compose file efficient and easy to maintain.
@z

@x
Multiple Compose files can be [merged](13-merge.md) together to define the application model. The combination of YAML files are implemented by appending or overriding YAML elements based on the Compose file order you set. 
Simple attributes and maps get overridden by the highest order Compose file, lists get merged by appending. Relative
paths are resolved based on the first Compose file's parent folder, whenever complimentary files being
merged are hosted in other folders. As some Compose file elements can both be expressed as single strings or complex objects, merges apply to
the expanded form.
@y
Multiple Compose files can be [merged](13-merge.md) together to define the application model. The combination of YAML files are implemented by appending or overriding YAML elements based on the Compose file order you set. 
Simple attributes and maps get overridden by the highest order Compose file, lists get merged by appending. Relative
paths are resolved based on the first Compose file's parent folder, whenever complimentary files being
merged are hosted in other folders. As some Compose file elements can both be expressed as single strings or complex objects, merges apply to
the expanded form.
@z

@x
If you want to reuse other Compose files, or factor out parts of you application model into separate Compose files, you can also use [`include`](14-include.md). This is useful if your Compose application is dependent on another application which is managed by a different team, or needs to be shared with others.
@y
If you want to reuse other Compose files, or factor out parts of you application model into separate Compose files, you can also use [`include`](14-include.md). This is useful if your Compose application is dependent on another application which is managed by a different team, or needs to be shared with others.
@z
