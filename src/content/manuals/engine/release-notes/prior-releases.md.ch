%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Docker Engine prior releases
linkTitle: Prior releases
@y
title: Docker Engine prior releases
linkTitle: Prior releases
@z

@x
description: Release notes for Docker CE
keywords: release notes, community
@y
description: Release notes for Docker CE
keywords: release notes, community
@z

@x
## 1.13.1 (2017-02-08)
@y
## 1.13.1 (2017-02-08)
@z

@x
> [!IMPORTANT]
>
> On Linux distributions where `devicemapper` was the default storage driver, the `overlay2`, or `overlay` is now used by default (if the kernel supports it). To use devicemapper, you can manually configure the storage driver to use through the `--storage-driver` daemon option, or by setting "storage-driver" in the `daemon.json` configuration file.
@y
> [!IMPORTANT]
>
> On Linux distributions where `devicemapper` was the default storage driver, the `overlay2`, or `overlay` is now used by default (if the kernel supports it). To use devicemapper, you can manually configure the storage driver to use through the `--storage-driver` daemon option, or by setting "storage-driver" in the `daemon.json` configuration file.
@z

@x
> [!IMPORTANT]
>
> In Docker 1.13, the managed plugin api changed, as compared to the experimental version introduced in Docker 1.12. You must **uninstall** plugins which you installed with Docker 1.12 _before_ upgrading to Docker 1.13. You can uninstall plugins using the `docker plugin rm` command.
@y
> [!IMPORTANT]
>
> In Docker 1.13, the managed plugin api changed, as compared to the experimental version introduced in Docker 1.12. You must **uninstall** plugins which you installed with Docker 1.12 _before_ upgrading to Docker 1.13. You can uninstall plugins using the `docker plugin rm` command.
@z

@x
If you have already upgraded to Docker 1.13 without uninstalling
previously-installed plugins, you may see this message when the Docker daemon
starts:
@y
If you have already upgraded to Docker 1.13 without uninstalling
previously-installed plugins, you may see this message when the Docker daemon
starts:
@z

@x
    Error starting daemon: json: cannot unmarshal string into Go value of type types.PluginEnv
@y
    Error starting daemon: json: cannot unmarshal string into Go value of type types.PluginEnv
@z

@x
To manually remove all plugins and resolve this problem, take the following steps:
@y
To manually remove all plugins and resolve this problem, take the following steps:
@z

@x
1. Remove plugins.json from: `/var/lib/docker/plugins/`.
2. Restart Docker. Verify that the Docker daemon starts with no errors.
3. Reinstall your plugins.
@y
1. Remove plugins.json from: `/var/lib/docker/plugins/`.
2. Restart Docker. Verify that the Docker daemon starts with no errors.
3. Reinstall your plugins.
@z

@x
### Contrib
@y
### Contrib
@z

@x
* Do not require a custom build of tini [#28454](https://github.com/docker/docker/pull/28454)
* Upgrade to Go 1.7.5 [#30489](https://github.com/docker/docker/pull/30489)
@y
* Do not require a custom build of tini [#28454](https://github.com/docker/docker/pull/28454)
* Upgrade to Go 1.7.5 [#30489](https://github.com/docker/docker/pull/30489)
@z

@x
### Remote API (v1.26) & Client
@y
### Remote API (v1.26) & Client
@z

@x
+ Support secrets in docker stack deploy with compose file [#30144](https://github.com/docker/docker/pull/30144)
@y
+ Support secrets in docker stack deploy with compose file [#30144](https://github.com/docker/docker/pull/30144)
@z

@x
### Runtime
@y
### Runtime
@z

@x
* Fix size issue in `docker system df` [#30378](https://github.com/docker/docker/pull/30378)
* Fix error on `docker inspect` when Swarm certificates were expired. [#29246](https://github.com/docker/docker/pull/29246)
* Fix deadlock on v1 plugin with activate error [#30408](https://github.com/docker/docker/pull/30408)
* Fix SELinux regression [#30649](https://github.com/docker/docker/pull/30649)
@y
* Fix size issue in `docker system df` [#30378](https://github.com/docker/docker/pull/30378)
* Fix error on `docker inspect` when Swarm certificates were expired. [#29246](https://github.com/docker/docker/pull/29246)
* Fix deadlock on v1 plugin with activate error [#30408](https://github.com/docker/docker/pull/30408)
* Fix SELinux regression [#30649](https://github.com/docker/docker/pull/30649)
@z

@x
### Plugins
@y
### Plugins
@z

@x
* Support global scoped network plugins (v2) in swarm mode [#30332](https://github.com/docker/docker/pull/30332)
+ Add `docker plugin upgrade` [#29414](https://github.com/docker/docker/pull/29414)
@y
* Support global scoped network plugins (v2) in swarm mode [#30332](https://github.com/docker/docker/pull/30332)
+ Add `docker plugin upgrade` [#29414](https://github.com/docker/docker/pull/29414)
@z

@x
### Windows
@y
### Windows
@z

@x
* Fix small regression with old plugins in Windows [#30150](https://github.com/docker/docker/pull/30150)
* Fix warning on Windows [#30730](https://github.com/docker/docker/pull/30730)
@y
* Fix small regression with old plugins in Windows [#30150](https://github.com/docker/docker/pull/30150)
* Fix warning on Windows [#30730](https://github.com/docker/docker/pull/30730)
@z

@x
## 1.13.0 (2017-01-18)
@y
## 1.13.0 (2017-01-18)
@z

@x
> [!IMPORTANT]
>
> On Linux distributions where `devicemapper` was the default storage driver, the `overlay2`, or `overlay` is now used by default (if the kernel supports it). To use devicemapper, you can manually configure the storage driver to use through the `--storage-driver` daemon option, or by setting "storage-driver" in the `daemon.json` configuration file.
@y
> [!IMPORTANT]
>
> On Linux distributions where `devicemapper` was the default storage driver, the `overlay2`, or `overlay` is now used by default (if the kernel supports it). To use devicemapper, you can manually configure the storage driver to use through the `--storage-driver` daemon option, or by setting "storage-driver" in the `daemon.json` configuration file.
@z

@x
> [!IMPORTANT]
>
> In Docker 1.13, the managed plugin api changed, as compared to the experimental version introduced in Docker 1.12. You must **uninstall** plugins which you installed with Docker 1.12 _before_ upgrading to Docker 1.13. You can uninstall plugins using the `docker plugin rm` command.
@y
> [!IMPORTANT]
>
> In Docker 1.13, the managed plugin api changed, as compared to the experimental version introduced in Docker 1.12. You must **uninstall** plugins which you installed with Docker 1.12 _before_ upgrading to Docker 1.13. You can uninstall plugins using the `docker plugin rm` command.
@z

@x
If you have already upgraded to Docker 1.13 without uninstalling
previously-installed plugins, you may see this message when the Docker daemon
starts:
@y
If you have already upgraded to Docker 1.13 without uninstalling
previously-installed plugins, you may see this message when the Docker daemon
starts:
@z

@x
    Error starting daemon: json: cannot unmarshal string into Go value of type types.PluginEnv
@y
    Error starting daemon: json: cannot unmarshal string into Go value of type types.PluginEnv
@z

@x
To manually remove all plugins and resolve this problem, take the following steps:
@y
To manually remove all plugins and resolve this problem, take the following steps:
@z

@x
1. Remove plugins.json from: `/var/lib/docker/plugins/`.
2. Restart Docker. Verify that the Docker daemon starts with no errors.
3. Reinstall your plugins.
@y
1. Remove plugins.json from: `/var/lib/docker/plugins/`.
2. Restart Docker. Verify that the Docker daemon starts with no errors.
3. Reinstall your plugins.
@z

@x
### Builder
@y
### Builder
@z

@x
+ Add capability to specify images used as a cache source on build. These images do not need to have local parent chain and can be pulled from other registries [#26839](https://github.com/docker/docker/pull/26839)
+ (experimental) Add option to squash image layers to the FROM image after successful builds [#22641](https://github.com/docker/docker/pull/22641)
* Fix dockerfile parser with empty line after escape [#24725](https://github.com/docker/docker/pull/24725)
- Add step number on `docker build` [#24978](https://github.com/docker/docker/pull/24978)
+ Add support for compressing build context during image build [#25837](https://github.com/docker/docker/pull/25837)
+ add `--network` to `docker build` [#27702](https://github.com/docker/docker/pull/27702)
- Fix inconsistent behavior between `--label` flag on `docker build` and `docker run` [#26027](https://github.com/docker/docker/issues/26027)
- Fix image layer inconsistencies when using the overlay storage driver [#27209](https://github.com/docker/docker/pull/27209)
* Unused build-args are now allowed. A warning is presented instead of an error and failed build [#27412](https://github.com/docker/docker/pull/27412)
- Fix builder cache issue on Windows [#27805](https://github.com/docker/docker/pull/27805)
+ Allow `USER` in builder on Windows [#28415](https://github.com/docker/docker/pull/28415)
+ Handle env case-insensitive on Windows [#28725](https://github.com/docker/docker/pull/28725)
@y
+ Add capability to specify images used as a cache source on build. These images do not need to have local parent chain and can be pulled from other registries [#26839](https://github.com/docker/docker/pull/26839)
+ (experimental) Add option to squash image layers to the FROM image after successful builds [#22641](https://github.com/docker/docker/pull/22641)
* Fix dockerfile parser with empty line after escape [#24725](https://github.com/docker/docker/pull/24725)
- Add step number on `docker build` [#24978](https://github.com/docker/docker/pull/24978)
+ Add support for compressing build context during image build [#25837](https://github.com/docker/docker/pull/25837)
+ add `--network` to `docker build` [#27702](https://github.com/docker/docker/pull/27702)
- Fix inconsistent behavior between `--label` flag on `docker build` and `docker run` [#26027](https://github.com/docker/docker/issues/26027)
- Fix image layer inconsistencies when using the overlay storage driver [#27209](https://github.com/docker/docker/pull/27209)
* Unused build-args are now allowed. A warning is presented instead of an error and failed build [#27412](https://github.com/docker/docker/pull/27412)
- Fix builder cache issue on Windows [#27805](https://github.com/docker/docker/pull/27805)
+ Allow `USER` in builder on Windows [#28415](https://github.com/docker/docker/pull/28415)
+ Handle env case-insensitive on Windows [#28725](https://github.com/docker/docker/pull/28725)
@z

@x
### Contrib
@y
### Contrib
@z

@x
+ Add support for building docker debs for Ubuntu 16.04 Xenial on PPC64LE [#23438](https://github.com/docker/docker/pull/23438)
+ Add support for building docker debs for Ubuntu 16.04 Xenial on s390x [#26104](https://github.com/docker/docker/pull/26104)
+ Add support for building docker debs for Ubuntu 16.10 Yakkety Yak on PPC64LE [#28046](https://github.com/docker/docker/pull/28046)
- Add RPM builder for VMWare Photon OS [#24116](https://github.com/docker/docker/pull/24116)
+ Add shell completions to tgz [#27735](https://github.com/docker/docker/pull/27735)
* Update the install script to allow using the mirror in China [#27005](https://github.com/docker/docker/pull/27005)
+ Add DEB builder for Ubuntu 16.10 Yakkety Yak [#27993](https://github.com/docker/docker/pull/27993)
+ Add RPM builder for Fedora 25 [#28222](https://github.com/docker/docker/pull/28222)
+ Add `make deb` support for aarch64 [#27625](https://github.com/docker/docker/pull/27625)
@y
+ Add support for building docker debs for Ubuntu 16.04 Xenial on PPC64LE [#23438](https://github.com/docker/docker/pull/23438)
+ Add support for building docker debs for Ubuntu 16.04 Xenial on s390x [#26104](https://github.com/docker/docker/pull/26104)
+ Add support for building docker debs for Ubuntu 16.10 Yakkety Yak on PPC64LE [#28046](https://github.com/docker/docker/pull/28046)
- Add RPM builder for VMWare Photon OS [#24116](https://github.com/docker/docker/pull/24116)
+ Add shell completions to tgz [#27735](https://github.com/docker/docker/pull/27735)
* Update the install script to allow using the mirror in China [#27005](https://github.com/docker/docker/pull/27005)
+ Add DEB builder for Ubuntu 16.10 Yakkety Yak [#27993](https://github.com/docker/docker/pull/27993)
+ Add RPM builder for Fedora 25 [#28222](https://github.com/docker/docker/pull/28222)
+ Add `make deb` support for aarch64 [#27625](https://github.com/docker/docker/pull/27625)
@z

@x
### Distribution
@y
### Distribution
@z

@x
* Update notary dependency to 0.4.2 (full changelogs [here](https://github.com/docker/notary/releases/tag/v0.4.2)) [#27074](https://github.com/docker/docker/pull/27074)
  - Support for compilation on windows [docker/notary#970](https://github.com/docker/notary/pull/970)
  - Improved error messages for client authentication errors [docker/notary#972](https://github.com/docker/notary/pull/972)
  - Support for finding keys that are anywhere in the `~/.docker/trust/private` directory, not just under `~/.docker/trust/private/root_keys` or `~/.docker/trust/private/tuf_keys` [docker/notary#981](https://github.com/docker/notary/pull/981)
  - Previously, on any error updating, the client would fall back on the cache.  Now we only do so if there is a network error or if the server is unavailable or missing the TUF data. Invalid TUF data will cause the update to fail - for example if there was an invalid root rotation. [docker/notary#982](https://github.com/docker/notary/pull/982)
  - Improve root validation and yubikey debug logging [docker/notary#858](https://github.com/docker/notary/pull/858) [docker/notary#891](https://github.com/docker/notary/pull/891)
  - Warn if certificates for root or delegations are near expiry [docker/notary#802](https://github.com/docker/notary/pull/802)
  - Warn if role metadata is near expiry [docker/notary#786](https://github.com/docker/notary/pull/786)
  - Fix passphrase retrieval attempt counting and terminal detection [docker/notary#906](https://github.com/docker/notary/pull/906)
- Avoid unnecessary blob uploads when different users push same layers to authenticated registry [#26564](https://github.com/docker/docker/pull/26564)
* Allow external storage for registry credentials [#26354](https://github.com/docker/docker/pull/26354)
@y
* Update notary dependency to 0.4.2 (full changelogs [here](https://github.com/docker/notary/releases/tag/v0.4.2)) [#27074](https://github.com/docker/docker/pull/27074)
  - Support for compilation on windows [docker/notary#970](https://github.com/docker/notary/pull/970)
  - Improved error messages for client authentication errors [docker/notary#972](https://github.com/docker/notary/pull/972)
  - Support for finding keys that are anywhere in the `~/.docker/trust/private` directory, not just under `~/.docker/trust/private/root_keys` or `~/.docker/trust/private/tuf_keys` [docker/notary#981](https://github.com/docker/notary/pull/981)
  - Previously, on any error updating, the client would fall back on the cache.  Now we only do so if there is a network error or if the server is unavailable or missing the TUF data. Invalid TUF data will cause the update to fail - for example if there was an invalid root rotation. [docker/notary#982](https://github.com/docker/notary/pull/982)
  - Improve root validation and yubikey debug logging [docker/notary#858](https://github.com/docker/notary/pull/858) [docker/notary#891](https://github.com/docker/notary/pull/891)
  - Warn if certificates for root or delegations are near expiry [docker/notary#802](https://github.com/docker/notary/pull/802)
  - Warn if role metadata is near expiry [docker/notary#786](https://github.com/docker/notary/pull/786)
  - Fix passphrase retrieval attempt counting and terminal detection [docker/notary#906](https://github.com/docker/notary/pull/906)
- Avoid unnecessary blob uploads when different users push same layers to authenticated registry [#26564](https://github.com/docker/docker/pull/26564)
* Allow external storage for registry credentials [#26354](https://github.com/docker/docker/pull/26354)
@z

@x
### Logging
@y
### Logging
@z

@x
* Standardize the default logging tag value in all logging drivers [#22911](https://github.com/docker/docker/pull/22911)
- Improve performance and memory use when logging of long log lines [#22982](https://github.com/docker/docker/pull/22982)
+ Enable syslog driver for windows [#25736](https://github.com/docker/docker/pull/25736)
+ Add Logentries Driver [#27471](https://github.com/docker/docker/pull/27471)
+ Update of AWS log driver to support tags [#27707](https://github.com/docker/docker/pull/27707)
+ Unix socket support for fluentd [#26088](https://github.com/docker/docker/pull/26088)
* Enable fluentd logging driver on Windows [#28189](https://github.com/docker/docker/pull/28189)
- Sanitize docker labels when used as journald field names [#23725](https://github.com/docker/docker/pull/23725)
- Fix an issue where `docker logs --tail` returned less lines than expected [#28203](https://github.com/docker/docker/pull/28203)
- Splunk Logging Driver: performance and reliability improvements [#26207](https://github.com/docker/docker/pull/26207)
- Splunk Logging Driver: configurable formats and skip for verifying connection [#25786](https://github.com/docker/docker/pull/25786)
@y
* Standardize the default logging tag value in all logging drivers [#22911](https://github.com/docker/docker/pull/22911)
- Improve performance and memory use when logging of long log lines [#22982](https://github.com/docker/docker/pull/22982)
+ Enable syslog driver for windows [#25736](https://github.com/docker/docker/pull/25736)
+ Add Logentries Driver [#27471](https://github.com/docker/docker/pull/27471)
+ Update of AWS log driver to support tags [#27707](https://github.com/docker/docker/pull/27707)
+ Unix socket support for fluentd [#26088](https://github.com/docker/docker/pull/26088)
* Enable fluentd logging driver on Windows [#28189](https://github.com/docker/docker/pull/28189)
- Sanitize docker labels when used as journald field names [#23725](https://github.com/docker/docker/pull/23725)
- Fix an issue where `docker logs --tail` returned less lines than expected [#28203](https://github.com/docker/docker/pull/28203)
- Splunk Logging Driver: performance and reliability improvements [#26207](https://github.com/docker/docker/pull/26207)
- Splunk Logging Driver: configurable formats and skip for verifying connection [#25786](https://github.com/docker/docker/pull/25786)
@z

@x
### Networking
@y
### Networking
@z

@x
+ Add `--attachable` network support to enable `docker run` to work in swarm-mode overlay network [#25962](https://github.com/docker/docker/pull/25962)
+ Add support for host port PublishMode in services using the `--publish` option in `docker service create` [#27917](https://github.com/docker/docker/pull/27917) and [#28943](https://github.com/docker/docker/pull/28943)
+ Add support for Windows server 2016 overlay network driver (requires upcoming ws2016 update) [#28182](https://github.com/docker/docker/pull/28182)
* Change the default `FORWARD` policy to `DROP` [#28257](https://github.com/docker/docker/pull/28257)
+ Add support for specifying static IP addresses for predefined network on windows [#22208](https://github.com/docker/docker/pull/22208)
- Fix `--publish` flag on `docker run` not working with IPv6 addresses [#27860](https://github.com/docker/docker/pull/27860)
- Fix inspect network show gateway with mask [#25564](https://github.com/docker/docker/pull/25564)
- Fix an issue where multiple addresses in a bridge may cause `--fixed-cidr` to not have the correct addresses [#26659](https://github.com/docker/docker/pull/26659)
+ Add creation timestamp to `docker network inspect` [#26130](https://github.com/docker/docker/pull/26130)
- Show peer nodes in `docker network inspect` for swarm overlay networks [#28078](https://github.com/docker/docker/pull/28078)
- Enable ping for service VIP address [#28019](https://github.com/docker/docker/pull/28019)
@y
+ Add `--attachable` network support to enable `docker run` to work in swarm-mode overlay network [#25962](https://github.com/docker/docker/pull/25962)
+ Add support for host port PublishMode in services using the `--publish` option in `docker service create` [#27917](https://github.com/docker/docker/pull/27917) and [#28943](https://github.com/docker/docker/pull/28943)
+ Add support for Windows server 2016 overlay network driver (requires upcoming ws2016 update) [#28182](https://github.com/docker/docker/pull/28182)
* Change the default `FORWARD` policy to `DROP` [#28257](https://github.com/docker/docker/pull/28257)
+ Add support for specifying static IP addresses for predefined network on windows [#22208](https://github.com/docker/docker/pull/22208)
- Fix `--publish` flag on `docker run` not working with IPv6 addresses [#27860](https://github.com/docker/docker/pull/27860)
- Fix inspect network show gateway with mask [#25564](https://github.com/docker/docker/pull/25564)
- Fix an issue where multiple addresses in a bridge may cause `--fixed-cidr` to not have the correct addresses [#26659](https://github.com/docker/docker/pull/26659)
+ Add creation timestamp to `docker network inspect` [#26130](https://github.com/docker/docker/pull/26130)
- Show peer nodes in `docker network inspect` for swarm overlay networks [#28078](https://github.com/docker/docker/pull/28078)
- Enable ping for service VIP address [#28019](https://github.com/docker/docker/pull/28019)
@z

@x
### Plugins
@y
### Plugins
@z

@x
- Move plugins out of experimental [#28226](https://github.com/docker/docker/pull/28226)
- Add `--force` on `docker plugin remove` [#25096](https://github.com/docker/docker/pull/25096)
* Add support for dynamically reloading authorization plugins [#22770](https://github.com/docker/docker/pull/22770)
+ Add description in `docker plugin ls` [#25556](https://github.com/docker/docker/pull/25556)
+ Add `-f`/`--format` to `docker plugin inspect` [#25990](https://github.com/docker/docker/pull/25990)
+ Add `docker plugin create` command [#28164](https://github.com/docker/docker/pull/28164)
* Send request's TLS peer certificates to authorization plugins [#27383](https://github.com/docker/docker/pull/27383)
* Support for global-scoped network and ipam plugins in swarm-mode [#27287](https://github.com/docker/docker/pull/27287)
* Split `docker plugin install` into two API call `/privileges` and `/pull` [#28963](https://github.com/docker/docker/pull/28963)
@y
- Move plugins out of experimental [#28226](https://github.com/docker/docker/pull/28226)
- Add `--force` on `docker plugin remove` [#25096](https://github.com/docker/docker/pull/25096)
* Add support for dynamically reloading authorization plugins [#22770](https://github.com/docker/docker/pull/22770)
+ Add description in `docker plugin ls` [#25556](https://github.com/docker/docker/pull/25556)
+ Add `-f`/`--format` to `docker plugin inspect` [#25990](https://github.com/docker/docker/pull/25990)
+ Add `docker plugin create` command [#28164](https://github.com/docker/docker/pull/28164)
* Send request's TLS peer certificates to authorization plugins [#27383](https://github.com/docker/docker/pull/27383)
* Support for global-scoped network and ipam plugins in swarm-mode [#27287](https://github.com/docker/docker/pull/27287)
* Split `docker plugin install` into two API call `/privileges` and `/pull` [#28963](https://github.com/docker/docker/pull/28963)
@z

@x
### Remote API (v1.25) & Client
@y
### Remote API (v1.25) & Client
@z

@x
+ Support `docker stack deploy` from a Compose file [#27998](https://github.com/docker/docker/pull/27998)
+ (experimental) Implement checkpoint and restore [#22049](https://github.com/docker/docker/pull/22049)
+ Add `--format` flag to `docker info` [#23808](https://github.com/docker/docker/pull/23808)
* Remove `--name` from `docker volume create` [#23830](https://github.com/docker/docker/pull/23830)
+ Add `docker stack ls` [#23886](https://github.com/docker/docker/pull/23886)
+ Add a new `is-task` ps filter [#24411](https://github.com/docker/docker/pull/24411)
+ Add `--env-file` flag to `docker service create` [#24844](https://github.com/docker/docker/pull/24844)
+ Add `--format` on `docker stats` [#24987](https://github.com/docker/docker/pull/24987)
+ Make `docker node ps` default to `self` in swarm node [#25214](https://github.com/docker/docker/pull/25214)
+ Add `--group` in `docker service create` [#25317](https://github.com/docker/docker/pull/25317)
+ Add `--no-trunc` to service/node/stack ps output [#25337](https://github.com/docker/docker/pull/25337)
+ Add Logs to `ContainerAttachOptions` so go clients can request to retrieve container logs as part of the attach process [#26718](https://github.com/docker/docker/pull/26718)
+ Allow client to talk to an older server [#27745](https://github.com/docker/docker/pull/27745)
* Inform user client-side that a container removal is in progress [#26074](https://github.com/docker/docker/pull/26074)
+ Add `Isolation` to the /info endpoint [#26255](https://github.com/docker/docker/pull/26255)
+ Add `userns` to the /info endpoint [#27840](https://github.com/docker/docker/pull/27840)
- Do not allow more than one mode be requested at once in the services endpoint [#26643](https://github.com/docker/docker/pull/26643)
+ Add capability to /containers/create API to specify mounts in a more granular and safer way [#22373](https://github.com/docker/docker/pull/22373)
+ Add `--format` flag to `network ls` and `volume ls` [#23475](https://github.com/docker/docker/pull/23475)
* Allow the top-level `docker inspect` command to inspect any kind of resource [#23614](https://github.com/docker/docker/pull/23614)
+ Add --cpus flag to control cpu resources for `docker run` and `docker create`, and add `NanoCPUs` to `HostConfig` [#27958](https://github.com/docker/docker/pull/27958)
- Allow unsetting the `--entrypoint` in `docker run` or `docker create` [#23718](https://github.com/docker/docker/pull/23718)
* Restructure CLI commands by adding `docker image` and `docker container` commands for more consistency [#26025](https://github.com/docker/docker/pull/26025)
- Remove `COMMAND` column from `service ls` output [#28029](https://github.com/docker/docker/pull/28029)
+ Add `--format` to `docker events` [#26268](https://github.com/docker/docker/pull/26268)
* Allow specifying multiple nodes on `docker node ps` [#26299](https://github.com/docker/docker/pull/26299)
* Restrict fractional digits to 2 decimals in `docker images` output [#26303](https://github.com/docker/docker/pull/26303)
+ Add `--dns-option` to `docker run` [#28186](https://github.com/docker/docker/pull/28186)
+ Add Image ID to container commit event [#28128](https://github.com/docker/docker/pull/28128)
+ Add external binaries version to docker info [#27955](https://github.com/docker/docker/pull/27955)
+ Add information for `Manager Addresses` in the output of `docker info` [#28042](https://github.com/docker/docker/pull/28042)
+ Add a new reference filter for `docker images` [#27872](https://github.com/docker/docker/pull/27872)
@y
+ Support `docker stack deploy` from a Compose file [#27998](https://github.com/docker/docker/pull/27998)
+ (experimental) Implement checkpoint and restore [#22049](https://github.com/docker/docker/pull/22049)
+ Add `--format` flag to `docker info` [#23808](https://github.com/docker/docker/pull/23808)
* Remove `--name` from `docker volume create` [#23830](https://github.com/docker/docker/pull/23830)
+ Add `docker stack ls` [#23886](https://github.com/docker/docker/pull/23886)
+ Add a new `is-task` ps filter [#24411](https://github.com/docker/docker/pull/24411)
+ Add `--env-file` flag to `docker service create` [#24844](https://github.com/docker/docker/pull/24844)
+ Add `--format` on `docker stats` [#24987](https://github.com/docker/docker/pull/24987)
+ Make `docker node ps` default to `self` in swarm node [#25214](https://github.com/docker/docker/pull/25214)
+ Add `--group` in `docker service create` [#25317](https://github.com/docker/docker/pull/25317)
+ Add `--no-trunc` to service/node/stack ps output [#25337](https://github.com/docker/docker/pull/25337)
+ Add Logs to `ContainerAttachOptions` so go clients can request to retrieve container logs as part of the attach process [#26718](https://github.com/docker/docker/pull/26718)
+ Allow client to talk to an older server [#27745](https://github.com/docker/docker/pull/27745)
* Inform user client-side that a container removal is in progress [#26074](https://github.com/docker/docker/pull/26074)
+ Add `Isolation` to the /info endpoint [#26255](https://github.com/docker/docker/pull/26255)
+ Add `userns` to the /info endpoint [#27840](https://github.com/docker/docker/pull/27840)
- Do not allow more than one mode be requested at once in the services endpoint [#26643](https://github.com/docker/docker/pull/26643)
+ Add capability to /containers/create API to specify mounts in a more granular and safer way [#22373](https://github.com/docker/docker/pull/22373)
+ Add `--format` flag to `network ls` and `volume ls` [#23475](https://github.com/docker/docker/pull/23475)
* Allow the top-level `docker inspect` command to inspect any kind of resource [#23614](https://github.com/docker/docker/pull/23614)
+ Add --cpus flag to control cpu resources for `docker run` and `docker create`, and add `NanoCPUs` to `HostConfig` [#27958](https://github.com/docker/docker/pull/27958)
- Allow unsetting the `--entrypoint` in `docker run` or `docker create` [#23718](https://github.com/docker/docker/pull/23718)
* Restructure CLI commands by adding `docker image` and `docker container` commands for more consistency [#26025](https://github.com/docker/docker/pull/26025)
- Remove `COMMAND` column from `service ls` output [#28029](https://github.com/docker/docker/pull/28029)
+ Add `--format` to `docker events` [#26268](https://github.com/docker/docker/pull/26268)
* Allow specifying multiple nodes on `docker node ps` [#26299](https://github.com/docker/docker/pull/26299)
* Restrict fractional digits to 2 decimals in `docker images` output [#26303](https://github.com/docker/docker/pull/26303)
+ Add `--dns-option` to `docker run` [#28186](https://github.com/docker/docker/pull/28186)
+ Add Image ID to container commit event [#28128](https://github.com/docker/docker/pull/28128)
+ Add external binaries version to docker info [#27955](https://github.com/docker/docker/pull/27955)
+ Add information for `Manager Addresses` in the output of `docker info` [#28042](https://github.com/docker/docker/pull/28042)
+ Add a new reference filter for `docker images` [#27872](https://github.com/docker/docker/pull/27872)
@z

@x
### Runtime
@y
### Runtime
@z

@x
+ Add `--experimental` daemon flag to enable experimental features, instead of shipping them in a separate build [#27223](https://github.com/docker/docker/pull/27223)
+ Add a `--shutdown-timeout` daemon flag to specify the default timeout (in seconds) to stop containers gracefully before daemon exit [#23036](https://github.com/docker/docker/pull/23036)
+ Add `--stop-timeout` to specify the timeout value (in seconds) for individual containers to stop [#22566](https://github.com/docker/docker/pull/22566)
+ Add a new daemon flag `--userland-proxy-path` to allow configuring the userland proxy instead of using the hardcoded `docker-proxy` from `$PATH` [#26882](https://github.com/docker/docker/pull/26882)
+ Add boolean flag `--init` on `dockerd` and on `docker run` to use [tini](https://github.com/krallin/tini) a zombie-reaping init process as PID 1 [#26061](https://github.com/docker/docker/pull/26061) [#28037](https://github.com/docker/docker/pull/28037)
+ Add a new daemon flag `--init-path` to allow configuring the path to the `docker-init` binary [#26941](https://github.com/docker/docker/pull/26941)
+ Add support for live reloading insecure registry in configuration [#22337](https://github.com/docker/docker/pull/22337)
+ Add support for storage-opt size on Windows daemons [#23391](https://github.com/docker/docker/pull/23391)
* Improve reliability of `docker run --rm` by moving it from the client to the daemon  [#20848](https://github.com/docker/docker/pull/20848)
+ Add support for `--cpu-rt-period` and `--cpu-rt-runtime` flags, allowing containers to run real-time threads when `CONFIG_RT_GROUP_SCHED` is enabled in the kernel [#23430](https://github.com/docker/docker/pull/23430)
* Allow parallel stop, pause, unpause [#24761](https://github.com/docker/docker/pull/24761) / [#26778](https://github.com/docker/docker/pull/26778)
* Implement XFS quota for overlay2 [#24771](https://github.com/docker/docker/pull/24771)
- Fix partial/full filter issue in `service tasks --filter` [#24850](https://github.com/docker/docker/pull/24850)
- Allow engine to run inside a user namespace [#25672](https://github.com/docker/docker/pull/25672)
- Fix a race condition between device deferred removal and resume device, when using the devicemapper graphdriver [#23497](https://github.com/docker/docker/pull/23497)
- Add `docker stats` support in Windows [#25737](https://github.com/docker/docker/pull/25737)
- Allow using `--pid=host` and `--net=host` when `--userns=host` [#25771](https://github.com/docker/docker/pull/25771)
+ (experimental) Add metrics (Prometheus) output for basic `container`, `image`, and `daemon` operations [#25820](https://github.com/docker/docker/pull/25820)
- Fix issue in `docker stats` with `NetworkDisabled=true` [#25905](https://github.com/docker/docker/pull/25905)
+ Add `docker top` support in Windows [#25891](https://github.com/docker/docker/pull/25891)
+ Record pid of exec'd process [#27470](https://github.com/docker/docker/pull/27470)
+ Add support for looking up user/groups via `getent` [#27599](https://github.com/docker/docker/pull/27599)
+ Add new `docker system` command with `df` and `prune` subcommands for system resource management, as well as `docker {container,image,volume,network} prune` subcommands [#26108](https://github.com/docker/docker/pull/26108) [#27525](https://github.com/docker/docker/pull/27525) / [#27525](https://github.com/docker/docker/pull/27525)
- Fix an issue where containers could not be stopped or killed by setting xfs max_retries to 0 upon ENOSPC with devicemapper [#26212](https://github.com/docker/docker/pull/26212)
- Fix `docker cp` failing to copy to a container's volume dir on CentOS with devicemapper [#28047](https://github.com/docker/docker/pull/28047)
* Promote overlay(2) graphdriver [#27932](https://github.com/docker/docker/pull/27932)
+ Add `--seccomp-profile` daemon flag to specify a path to a seccomp profile that overrides the default [#26276](https://github.com/docker/docker/pull/26276)
- Fix ulimits in `docker inspect` when `--default-ulimit` is set on daemon [#26405](https://github.com/docker/docker/pull/26405)
- Add workaround for overlay issues during build in older kernels [#28138](https://github.com/docker/docker/pull/28138)
+ Add `TERM` environment variable on `docker exec -t` [#26461](https://github.com/docker/docker/pull/26461)
* Honor a container’s `--stop-signal` setting upon `docker kill` [#26464](https://github.com/docker/docker/pull/26464)
@y
+ Add `--experimental` daemon flag to enable experimental features, instead of shipping them in a separate build [#27223](https://github.com/docker/docker/pull/27223)
+ Add a `--shutdown-timeout` daemon flag to specify the default timeout (in seconds) to stop containers gracefully before daemon exit [#23036](https://github.com/docker/docker/pull/23036)
+ Add `--stop-timeout` to specify the timeout value (in seconds) for individual containers to stop [#22566](https://github.com/docker/docker/pull/22566)
+ Add a new daemon flag `--userland-proxy-path` to allow configuring the userland proxy instead of using the hardcoded `docker-proxy` from `$PATH` [#26882](https://github.com/docker/docker/pull/26882)
+ Add boolean flag `--init` on `dockerd` and on `docker run` to use [tini](https://github.com/krallin/tini) a zombie-reaping init process as PID 1 [#26061](https://github.com/docker/docker/pull/26061) [#28037](https://github.com/docker/docker/pull/28037)
+ Add a new daemon flag `--init-path` to allow configuring the path to the `docker-init` binary [#26941](https://github.com/docker/docker/pull/26941)
+ Add support for live reloading insecure registry in configuration [#22337](https://github.com/docker/docker/pull/22337)
+ Add support for storage-opt size on Windows daemons [#23391](https://github.com/docker/docker/pull/23391)
* Improve reliability of `docker run --rm` by moving it from the client to the daemon  [#20848](https://github.com/docker/docker/pull/20848)
+ Add support for `--cpu-rt-period` and `--cpu-rt-runtime` flags, allowing containers to run real-time threads when `CONFIG_RT_GROUP_SCHED` is enabled in the kernel [#23430](https://github.com/docker/docker/pull/23430)
* Allow parallel stop, pause, unpause [#24761](https://github.com/docker/docker/pull/24761) / [#26778](https://github.com/docker/docker/pull/26778)
* Implement XFS quota for overlay2 [#24771](https://github.com/docker/docker/pull/24771)
- Fix partial/full filter issue in `service tasks --filter` [#24850](https://github.com/docker/docker/pull/24850)
- Allow engine to run inside a user namespace [#25672](https://github.com/docker/docker/pull/25672)
- Fix a race condition between device deferred removal and resume device, when using the devicemapper graphdriver [#23497](https://github.com/docker/docker/pull/23497)
- Add `docker stats` support in Windows [#25737](https://github.com/docker/docker/pull/25737)
- Allow using `--pid=host` and `--net=host` when `--userns=host` [#25771](https://github.com/docker/docker/pull/25771)
+ (experimental) Add metrics (Prometheus) output for basic `container`, `image`, and `daemon` operations [#25820](https://github.com/docker/docker/pull/25820)
- Fix issue in `docker stats` with `NetworkDisabled=true` [#25905](https://github.com/docker/docker/pull/25905)
+ Add `docker top` support in Windows [#25891](https://github.com/docker/docker/pull/25891)
+ Record pid of exec'd process [#27470](https://github.com/docker/docker/pull/27470)
+ Add support for looking up user/groups via `getent` [#27599](https://github.com/docker/docker/pull/27599)
+ Add new `docker system` command with `df` and `prune` subcommands for system resource management, as well as `docker {container,image,volume,network} prune` subcommands [#26108](https://github.com/docker/docker/pull/26108) [#27525](https://github.com/docker/docker/pull/27525) / [#27525](https://github.com/docker/docker/pull/27525)
- Fix an issue where containers could not be stopped or killed by setting xfs max_retries to 0 upon ENOSPC with devicemapper [#26212](https://github.com/docker/docker/pull/26212)
- Fix `docker cp` failing to copy to a container's volume dir on CentOS with devicemapper [#28047](https://github.com/docker/docker/pull/28047)
* Promote overlay(2) graphdriver [#27932](https://github.com/docker/docker/pull/27932)
+ Add `--seccomp-profile` daemon flag to specify a path to a seccomp profile that overrides the default [#26276](https://github.com/docker/docker/pull/26276)
- Fix ulimits in `docker inspect` when `--default-ulimit` is set on daemon [#26405](https://github.com/docker/docker/pull/26405)
- Add workaround for overlay issues during build in older kernels [#28138](https://github.com/docker/docker/pull/28138)
+ Add `TERM` environment variable on `docker exec -t` [#26461](https://github.com/docker/docker/pull/26461)
* Honor a container’s `--stop-signal` setting upon `docker kill` [#26464](https://github.com/docker/docker/pull/26464)
@z

@x
### Swarm Mode
@y
### Swarm Mode
@z

@x
+ Add secret management [#27794](https://github.com/docker/docker/pull/27794)
+ Add support for templating service options (hostname, mounts, and environment variables) [#28025](https://github.com/docker/docker/pull/28025)
* Display the endpoint mode in the output of `docker service inspect --pretty` [#26906](https://github.com/docker/docker/pull/26906)
* Make `docker service ps` output more bearable by shortening service IDs in task names [#28088](https://github.com/docker/docker/pull/28088)
* Make `docker node ps` default to the current node [#25214](https://github.com/docker/docker/pull/25214)
+ Add `--dns`, -`-dns-opt`, and `--dns-search` to service create. [#27567](https://github.com/docker/docker/pull/27567)
+ Add `--force` to `docker service update` [#27596](https://github.com/docker/docker/pull/27596)
+ Add `--health-*` and `--no-healthcheck` flags to `docker service create` and `docker service update` [#27369](https://github.com/docker/docker/pull/27369)
+ Add `-q` to `docker service ps` [#27654](https://github.com/docker/docker/pull/27654)
* Display number of global services in `docker service ls` [#27710](https://github.com/docker/docker/pull/27710)
- Remove `--name` flag from `docker service update`. This flag is only functional on `docker service create`, so was removed from the `update` command [#26988](https://github.com/docker/docker/pull/26988)
- Fix worker nodes failing to recover because of transient networking issues [#26646](https://github.com/docker/docker/issues/26646)
* Add support for health aware load balancing and DNS records [#27279](https://github.com/docker/docker/pull/27279)
+ Add `--hostname` to `docker service create` [#27857](https://github.com/docker/docker/pull/27857)
+ Add `--host` to `docker service create`, and `--host-add`, `--host-rm` to `docker service update` [#28031](https://github.com/docker/docker/pull/28031)
+ Add `--tty` flag to `docker service create`/`update` [#28076](https://github.com/docker/docker/pull/28076)
* Autodetect, store, and expose node IP address as seen by the manager [#27910](https://github.com/docker/docker/pull/27910)
* Encryption at rest of manager keys and raft data [#27967](https://github.com/docker/docker/pull/27967)
+ Add `--update-max-failure-ratio`, `--update-monitor` and `--rollback` flags to `docker service update` [#26421](https://github.com/docker/docker/pull/26421)
- Fix an issue with address autodiscovery on `docker swarm init` running inside a container [#26457](https://github.com/docker/docker/pull/26457)
+ (experimental) Add `docker service logs` command to view logs for a service [#28089](https://github.com/docker/docker/pull/28089)
+ Pin images by digest for `docker service create` and `update` [#28173](https://github.com/docker/docker/pull/28173)
* Add short (`-f`) flag for `docker node rm --force` and `docker swarm leave --force` [#28196](https://github.com/docker/docker/pull/28196)
+ Add options to customize Raft snapshots (`--max-snapshots`, `--snapshot-interval`) [#27997](https://github.com/docker/docker/pull/27997)
- Don't repull image if pinned by digest [#28265](https://github.com/docker/docker/pull/28265)
+ Swarm-mode support for Windows [#27838](https://github.com/docker/docker/pull/27838)
+ Allow hostname to be updated on service [#28771](https://github.com/docker/docker/pull/28771)
+ Support v2 plugins [#29433](https://github.com/docker/docker/pull/29433)
+ Add content trust for services [#29469](https://github.com/docker/docker/pull/29469)
@y
+ Add secret management [#27794](https://github.com/docker/docker/pull/27794)
+ Add support for templating service options (hostname, mounts, and environment variables) [#28025](https://github.com/docker/docker/pull/28025)
* Display the endpoint mode in the output of `docker service inspect --pretty` [#26906](https://github.com/docker/docker/pull/26906)
* Make `docker service ps` output more bearable by shortening service IDs in task names [#28088](https://github.com/docker/docker/pull/28088)
* Make `docker node ps` default to the current node [#25214](https://github.com/docker/docker/pull/25214)
+ Add `--dns`, -`-dns-opt`, and `--dns-search` to service create. [#27567](https://github.com/docker/docker/pull/27567)
+ Add `--force` to `docker service update` [#27596](https://github.com/docker/docker/pull/27596)
+ Add `--health-*` and `--no-healthcheck` flags to `docker service create` and `docker service update` [#27369](https://github.com/docker/docker/pull/27369)
+ Add `-q` to `docker service ps` [#27654](https://github.com/docker/docker/pull/27654)
* Display number of global services in `docker service ls` [#27710](https://github.com/docker/docker/pull/27710)
- Remove `--name` flag from `docker service update`. This flag is only functional on `docker service create`, so was removed from the `update` command [#26988](https://github.com/docker/docker/pull/26988)
- Fix worker nodes failing to recover because of transient networking issues [#26646](https://github.com/docker/docker/issues/26646)
* Add support for health aware load balancing and DNS records [#27279](https://github.com/docker/docker/pull/27279)
+ Add `--hostname` to `docker service create` [#27857](https://github.com/docker/docker/pull/27857)
+ Add `--host` to `docker service create`, and `--host-add`, `--host-rm` to `docker service update` [#28031](https://github.com/docker/docker/pull/28031)
+ Add `--tty` flag to `docker service create`/`update` [#28076](https://github.com/docker/docker/pull/28076)
* Autodetect, store, and expose node IP address as seen by the manager [#27910](https://github.com/docker/docker/pull/27910)
* Encryption at rest of manager keys and raft data [#27967](https://github.com/docker/docker/pull/27967)
+ Add `--update-max-failure-ratio`, `--update-monitor` and `--rollback` flags to `docker service update` [#26421](https://github.com/docker/docker/pull/26421)
- Fix an issue with address autodiscovery on `docker swarm init` running inside a container [#26457](https://github.com/docker/docker/pull/26457)
+ (experimental) Add `docker service logs` command to view logs for a service [#28089](https://github.com/docker/docker/pull/28089)
+ Pin images by digest for `docker service create` and `update` [#28173](https://github.com/docker/docker/pull/28173)
* Add short (`-f`) flag for `docker node rm --force` and `docker swarm leave --force` [#28196](https://github.com/docker/docker/pull/28196)
+ Add options to customize Raft snapshots (`--max-snapshots`, `--snapshot-interval`) [#27997](https://github.com/docker/docker/pull/27997)
- Don't repull image if pinned by digest [#28265](https://github.com/docker/docker/pull/28265)
+ Swarm-mode support for Windows [#27838](https://github.com/docker/docker/pull/27838)
+ Allow hostname to be updated on service [#28771](https://github.com/docker/docker/pull/28771)
+ Support v2 plugins [#29433](https://github.com/docker/docker/pull/29433)
+ Add content trust for services [#29469](https://github.com/docker/docker/pull/29469)
@z

@x
### Volume
@y
### Volume
@z

@x
+ Add support for labels on volumes [#21270](https://github.com/docker/docker/pull/21270)
+ Add support for filtering volumes by label [#25628](https://github.com/docker/docker/pull/25628)
* Add a `--force` flag in `docker volume rm` to forcefully purge the data of the volume that has already been deleted [#23436](https://github.com/docker/docker/pull/23436)
* Enhance `docker volume inspect` to show all options used when creating the volume [#26671](https://github.com/docker/docker/pull/26671)
* Add support for local NFS volumes to resolve hostnames [#27329](https://github.com/docker/docker/pull/27329)
@y
+ Add support for labels on volumes [#21270](https://github.com/docker/docker/pull/21270)
+ Add support for filtering volumes by label [#25628](https://github.com/docker/docker/pull/25628)
* Add a `--force` flag in `docker volume rm` to forcefully purge the data of the volume that has already been deleted [#23436](https://github.com/docker/docker/pull/23436)
* Enhance `docker volume inspect` to show all options used when creating the volume [#26671](https://github.com/docker/docker/pull/26671)
* Add support for local NFS volumes to resolve hostnames [#27329](https://github.com/docker/docker/pull/27329)
@z

@x
### Security
@y
### Security
@z

@x
- Fix selinux labeling of volumes shared in a container [#23024](https://github.com/docker/docker/pull/23024)
- Prohibit `/sys/firmware/**` from being accessed with apparmor [#26618](https://github.com/docker/docker/pull/26618)
@y
- Fix selinux labeling of volumes shared in a container [#23024](https://github.com/docker/docker/pull/23024)
- Prohibit `/sys/firmware/**` from being accessed with apparmor [#26618](https://github.com/docker/docker/pull/26618)
@z

@x
### Deprecation
@y
### Deprecation
@z

@x
- Marked the `docker daemon` command as deprecated. The daemon is moved to a separate binary (`dockerd`), and should be used instead [#26834](https://github.com/docker/docker/pull/26834)
- Deprecate unversioned API endpoints [#28208](https://github.com/docker/docker/pull/28208)
- Remove Ubuntu 15.10 (Wily Werewolf) as supported platform. Ubuntu 15.10 is EOL, and no longer receives updates [#27042](https://github.com/docker/docker/pull/27042)
- Remove Fedora 22 as supported platform. Fedora 22 is EOL, and no longer receives updates [#27432](https://github.com/docker/docker/pull/27432)
- Remove Fedora 23 as supported platform. Fedora 23 is EOL, and no longer receives updates [#29455](https://github.com/docker/docker/pull/29455)
- Deprecate the `repo:shortid` syntax on `docker pull` [#27207](https://github.com/docker/docker/pull/27207)
- Deprecate backing filesystem without `d_type` for overlay and overlay2 storage drivers [#27433](https://github.com/docker/docker/pull/27433)
- Deprecate `MAINTAINER` in Dockerfile [#25466](https://github.com/docker/docker/pull/25466)
- Deprecate `filter` param for endpoint `/images/json` [#27872](https://github.com/docker/docker/pull/27872)
- Deprecate setting duplicate engine labels [#24533](https://github.com/docker/docker/pull/24533)
- Deprecate "top-level" network information in `NetworkSettings` [#28437](https://github.com/docker/docker/pull/28437)
@y
- Marked the `docker daemon` command as deprecated. The daemon is moved to a separate binary (`dockerd`), and should be used instead [#26834](https://github.com/docker/docker/pull/26834)
- Deprecate unversioned API endpoints [#28208](https://github.com/docker/docker/pull/28208)
- Remove Ubuntu 15.10 (Wily Werewolf) as supported platform. Ubuntu 15.10 is EOL, and no longer receives updates [#27042](https://github.com/docker/docker/pull/27042)
- Remove Fedora 22 as supported platform. Fedora 22 is EOL, and no longer receives updates [#27432](https://github.com/docker/docker/pull/27432)
- Remove Fedora 23 as supported platform. Fedora 23 is EOL, and no longer receives updates [#29455](https://github.com/docker/docker/pull/29455)
- Deprecate the `repo:shortid` syntax on `docker pull` [#27207](https://github.com/docker/docker/pull/27207)
- Deprecate backing filesystem without `d_type` for overlay and overlay2 storage drivers [#27433](https://github.com/docker/docker/pull/27433)
- Deprecate `MAINTAINER` in Dockerfile [#25466](https://github.com/docker/docker/pull/25466)
- Deprecate `filter` param for endpoint `/images/json` [#27872](https://github.com/docker/docker/pull/27872)
- Deprecate setting duplicate engine labels [#24533](https://github.com/docker/docker/pull/24533)
- Deprecate "top-level" network information in `NetworkSettings` [#28437](https://github.com/docker/docker/pull/28437)
@z

@x
## 1.12.6 (2017-01-10)
@y
## 1.12.6 (2017-01-10)
@z

@x
> [!IMPORTANT]
>
> Docker 1.12 ships with an updated systemd unit file for rpm
based installs (which includes RHEL, Fedora, CentOS, and Oracle Linux 7). When upgrading from an older version of Docker, the upgrade process may not automatically install the updated version of the unit file, or fail to start the `docker service` if;
> - the systemd unit file (`/usr/lib/systemd/system/docker.service`) contains local changes, or
> - a systemd drop-in file is present, and contains `-H fd://` in the `ExecStart` directive
@y
> [!IMPORTANT]
>
> Docker 1.12 ships with an updated systemd unit file for rpm
based installs (which includes RHEL, Fedora, CentOS, and Oracle Linux 7). When upgrading from an older version of Docker, the upgrade process may not automatically install the updated version of the unit file, or fail to start the `docker service` if;
> - the systemd unit file (`/usr/lib/systemd/system/docker.service`) contains local changes, or
> - a systemd drop-in file is present, and contains `-H fd://` in the `ExecStart` directive
@z

@x
Starting the `docker service` will produce an error:
@y
Starting the `docker service` will produce an error:
@z

@x
    Failed to start docker.service: Unit docker.socket failed to load: No such file or directory.
@y
    Failed to start docker.service: Unit docker.socket failed to load: No such file or directory.
@z

@x
or
@y
or
@z

@x
    no sockets found via socket activation: make sure the service was started by systemd.
@y
    no sockets found via socket activation: make sure the service was started by systemd.
@z

@x
To resolve this:
@y
To resolve this:
@z

@x
- Backup the current version of the unit file, and replace the file with the
  [version that ships with docker 1.12](https://raw.githubusercontent.com/docker/docker/v1.12.0/contrib/init/systemd/docker.service.rpm)
- Remove the `Requires=docker.socket` directive from the `/usr/lib/systemd/system/docker.service` file if present
- Remove `-H fd://` from the `ExecStart` directive (both in the main unit file, and in any drop-in files present).
@y
- Backup the current version of the unit file, and replace the file with the
  [version that ships with docker 1.12](https://raw.githubusercontent.com/docker/docker/v1.12.0/contrib/init/systemd/docker.service.rpm)
- Remove the `Requires=docker.socket` directive from the `/usr/lib/systemd/system/docker.service` file if present
- Remove `-H fd://` from the `ExecStart` directive (both in the main unit file, and in any drop-in files present).
@z

@x
After making those changes, run `sudo systemctl daemon-reload`, and `sudo
systemctl restart docker` to reload changes and (re)start the docker daemon.
@y
After making those changes, run `sudo systemctl daemon-reload`, and `sudo
systemctl restart docker` to reload changes and (re)start the docker daemon.
@z

@x
> [!NOTE]
>
> Docker 1.12.5 will correctly validate that either an IPv6 subnet is provided or that the IPAM driver can provide one when you specify the `--ipv6` option.
@y
> [!NOTE]
>
> Docker 1.12.5 will correctly validate that either an IPv6 subnet is provided or that the IPAM driver can provide one when you specify the `--ipv6` option.
@z

@x
If you are currently using the `--ipv6` option _without_ specifying the
`--fixed-cidr-v6` option, the Docker daemon will refuse to start with the
following message:
@y
If you are currently using the `--ipv6` option _without_ specifying the
`--fixed-cidr-v6` option, the Docker daemon will refuse to start with the
following message:
@z

@x
```text
Error starting daemon: Error initializing network controller: Error creating
                       default "bridge" network: failed to parse pool request
                       for address space "LocalDefault" pool " subpool ":
                       could not find an available, non-overlapping IPv6 address
                       pool among the defaults to assign to the network
```
@y
```text
Error starting daemon: Error initializing network controller: Error creating
                       default "bridge" network: failed to parse pool request
                       for address space "LocalDefault" pool " subpool ":
                       could not find an available, non-overlapping IPv6 address
                       pool among the defaults to assign to the network
```
@z

@x
To resolve this error, either remove the `--ipv6` flag (to preserve the same
behavior as in Docker 1.12.3 and earlier), or provide an IPv6 subnet as the
value of the `--fixed-cidr-v6` flag.
@y
To resolve this error, either remove the `--ipv6` flag (to preserve the same
behavior as in Docker 1.12.3 and earlier), or provide an IPv6 subnet as the
value of the `--fixed-cidr-v6` flag.
@z

@x
In a similar way, if you specify the `--ipv6` flag when creating a network
with the default IPAM driver, without providing an IPv6 `--subnet`, network
creation will fail with the following message:
@y
In a similar way, if you specify the `--ipv6` flag when creating a network
with the default IPAM driver, without providing an IPv6 `--subnet`, network
creation will fail with the following message:
@z

@x
```text
Error response from daemon: failed to parse pool request for address space
                            "LocalDefault" pool "" subpool "": could not find an
                            available, non-overlapping IPv6 address pool among
                            the defaults to assign to the network
```
@y
```text
Error response from daemon: failed to parse pool request for address space
                            "LocalDefault" pool "" subpool "": could not find an
                            available, non-overlapping IPv6 address pool among
                            the defaults to assign to the network
```
@z

@x
To resolve this, either remove the `--ipv6` flag (to preserve the same behavior
as in Docker 1.12.3 and earlier), or provide an IPv6 subnet as the value of the
`--subnet` flag.
@y
To resolve this, either remove the `--ipv6` flag (to preserve the same behavior
as in Docker 1.12.3 and earlier), or provide an IPv6 subnet as the value of the
`--subnet` flag.
@z

@x
The network creation will instead succeed if you use an external IPAM driver
which supports automatic allocation of IPv6 subnets.
@y
The network creation will instead succeed if you use an external IPAM driver
which supports automatic allocation of IPv6 subnets.
@z

@x
### Runtime
@y
### Runtime
@z

@x
- Fix runC privilege escalation (CVE-2016-9962)
@y
- Fix runC privilege escalation (CVE-2016-9962)
@z

@x
## 1.12.5 (2016-12-15)
@y
## 1.12.5 (2016-12-15)
@z

@x
> [!IMPORTANT]
>
> Docker 1.12 ships with an updated systemd unit file for rpm
based installs (which includes RHEL, Fedora, CentOS, and Oracle Linux 7). When upgrading from an older version of Docker, the upgrade process may not automatically install the updated version of the unit file, or fail to start the `docker service` if;
> - the systemd unit file (`/usr/lib/systemd/system/docker.service`) contains local changes, or
> - a systemd drop-in file is present, and contains `-H fd://` in the `ExecStart` directive
@y
> [!IMPORTANT]
>
> Docker 1.12 ships with an updated systemd unit file for rpm
based installs (which includes RHEL, Fedora, CentOS, and Oracle Linux 7). When upgrading from an older version of Docker, the upgrade process may not automatically install the updated version of the unit file, or fail to start the `docker service` if;
> - the systemd unit file (`/usr/lib/systemd/system/docker.service`) contains local changes, or
> - a systemd drop-in file is present, and contains `-H fd://` in the `ExecStart` directive
@z

@x
Starting the `docker service` will produce an error:
@y
Starting the `docker service` will produce an error:
@z

@x
    Failed to start docker.service: Unit docker.socket failed to load: No such file or directory.
@y
    Failed to start docker.service: Unit docker.socket failed to load: No such file or directory.
@z

@x
or
@y
or
@z

@x
    no sockets found via socket activation: make sure the service was started by systemd.
@y
    no sockets found via socket activation: make sure the service was started by systemd.
@z

@x
To resolve this:
@y
To resolve this:
@z

@x
- Backup the current version of the unit file, and replace the file with the
  [version that ships with docker 1.12](https://raw.githubusercontent.com/docker/docker/v1.12.0/contrib/init/systemd/docker.service.rpm)
- Remove the `Requires=docker.socket` directive from the `/usr/lib/systemd/system/docker.service` file if present
- Remove `-H fd://` from the `ExecStart` directive (both in the main unit file, and in any drop-in files present).
@y
- Backup the current version of the unit file, and replace the file with the
  [version that ships with docker 1.12](https://raw.githubusercontent.com/docker/docker/v1.12.0/contrib/init/systemd/docker.service.rpm)
- Remove the `Requires=docker.socket` directive from the `/usr/lib/systemd/system/docker.service` file if present
- Remove `-H fd://` from the `ExecStart` directive (both in the main unit file, and in any drop-in files present).
@z

@x
After making those changes, run `sudo systemctl daemon-reload`, and `sudo
systemctl restart docker` to reload changes and (re)start the docker daemon.
@y
After making those changes, run `sudo systemctl daemon-reload`, and `sudo
systemctl restart docker` to reload changes and (re)start the docker daemon.
@z

@x
> [!NOTE]
>
> Docker 1.12.5 will correctly validate that either an IPv6 subnet is provided or that the IPAM driver can provide one when you specify the `--ipv6` option.
@y
> [!NOTE]
>
> Docker 1.12.5 will correctly validate that either an IPv6 subnet is provided or that the IPAM driver can provide one when you specify the `--ipv6` option.
@z

@x
If you are currently using the `--ipv6` option _without_ specifying the
`--fixed-cidr-v6` option, the Docker daemon will refuse to start with the
following message:
@y
If you are currently using the `--ipv6` option _without_ specifying the
`--fixed-cidr-v6` option, the Docker daemon will refuse to start with the
following message:
@z

@x
```text
Error starting daemon: Error initializing network controller: Error creating
                       default "bridge" network: failed to parse pool request
                       for address space "LocalDefault" pool " subpool ":
                       could not find an available, non-overlapping IPv6 address
                       pool among the defaults to assign to the network
```
@y
```text
Error starting daemon: Error initializing network controller: Error creating
                       default "bridge" network: failed to parse pool request
                       for address space "LocalDefault" pool " subpool ":
                       could not find an available, non-overlapping IPv6 address
                       pool among the defaults to assign to the network
```
@z

@x
To resolve this error, either remove the `--ipv6` flag (to preserve the same
behavior as in Docker 1.12.3 and earlier), or provide an IPv6 subnet as the
value of the `--fixed-cidr-v6` flag.
@y
To resolve this error, either remove the `--ipv6` flag (to preserve the same
behavior as in Docker 1.12.3 and earlier), or provide an IPv6 subnet as the
value of the `--fixed-cidr-v6` flag.
@z

@x
In a similar way, if you specify the `--ipv6` flag when creating a network
with the default IPAM driver, without providing an IPv6 `--subnet`, network
creation will fail with the following message:
@y
In a similar way, if you specify the `--ipv6` flag when creating a network
with the default IPAM driver, without providing an IPv6 `--subnet`, network
creation will fail with the following message:
@z

@x
```text
Error response from daemon: failed to parse pool request for address space
                            "LocalDefault" pool "" subpool "": could not find an
                            available, non-overlapping IPv6 address pool among
                            the defaults to assign to the network
```
@y
```text
Error response from daemon: failed to parse pool request for address space
                            "LocalDefault" pool "" subpool "": could not find an
                            available, non-overlapping IPv6 address pool among
                            the defaults to assign to the network
```
@z

@x
To resolve this, either remove the `--ipv6` flag (to preserve the same behavior
as in Docker 1.12.3 and earlier), or provide an IPv6 subnet as the value of the
`--subnet` flag.
@y
To resolve this, either remove the `--ipv6` flag (to preserve the same behavior
as in Docker 1.12.3 and earlier), or provide an IPv6 subnet as the value of the
`--subnet` flag.
@z

@x
The network network creation will instead succeed if you use an external IPAM driver
which supports automatic allocation of IPv6 subnets.
@y
The network network creation will instead succeed if you use an external IPAM driver
which supports automatic allocation of IPv6 subnets.
@z

@x
### Runtime
@y
### Runtime
@z

@x
- Fix race on sending stdin close event [#29424](https://github.com/docker/docker/pull/29424)
@y
- Fix race on sending stdin close event [#29424](https://github.com/docker/docker/pull/29424)
@z

@x
### Networking
@y
### Networking
@z

@x
- Fix panic in docker network ls when a network was created with `--ipv6` and no ipv6 `--subnet` in older docker versions [#29416](https://github.com/docker/docker/pull/29416)
@y
- Fix panic in docker network ls when a network was created with `--ipv6` and no ipv6 `--subnet` in older docker versions [#29416](https://github.com/docker/docker/pull/29416)
@z

@x
### Contrib
@y
### Contrib
@z

@x
- Fix compilation on Darwin [#29370](https://github.com/docker/docker/pull/29370)
@y
- Fix compilation on Darwin [#29370](https://github.com/docker/docker/pull/29370)
@z

@x
## 1.12.4 (2016-12-12)
@y
## 1.12.4 (2016-12-12)
@z

@x
> [!IMPORTANT]
>
> Docker 1.12 ships with an updated systemd unit file for rpm
based installs (which includes RHEL, Fedora, CentOS, and Oracle Linux 7). When upgrading from an older version of Docker, the upgrade process may not automatically install the updated version of the unit file, or fail to start the `docker service` if;
> - the systemd unit file (`/usr/lib/systemd/system/docker.service`) contains local changes, or
> - a systemd drop-in file is present, and contains `-H fd://` in the `ExecStart` directive
@y
> [!IMPORTANT]
>
> Docker 1.12 ships with an updated systemd unit file for rpm
based installs (which includes RHEL, Fedora, CentOS, and Oracle Linux 7). When upgrading from an older version of Docker, the upgrade process may not automatically install the updated version of the unit file, or fail to start the `docker service` if;
> - the systemd unit file (`/usr/lib/systemd/system/docker.service`) contains local changes, or
> - a systemd drop-in file is present, and contains `-H fd://` in the `ExecStart` directive
@z

@x
Starting the `docker service` will produce an error:
@y
Starting the `docker service` will produce an error:
@z

@x
    Failed to start docker.service: Unit docker.socket failed to load: No such file or directory.
@y
    Failed to start docker.service: Unit docker.socket failed to load: No such file or directory.
@z

@x
or
@y
or
@z

@x
    no sockets found via socket activation: make sure the service was started by systemd.
@y
    no sockets found via socket activation: make sure the service was started by systemd.
@z

@x
To resolve this:
@y
To resolve this:
@z

@x
- Backup the current version of the unit file, and replace the file with the
  [version that ships with docker 1.12](https://raw.githubusercontent.com/docker/docker/v1.12.0/contrib/init/systemd/docker.service.rpm)
- Remove the `Requires=docker.socket` directive from the `/usr/lib/systemd/system/docker.service` file if present
- Remove `-H fd://` from the `ExecStart` directive (both in the main unit file, and in any drop-in files present).
@y
- Backup the current version of the unit file, and replace the file with the
  [version that ships with docker 1.12](https://raw.githubusercontent.com/docker/docker/v1.12.0/contrib/init/systemd/docker.service.rpm)
- Remove the `Requires=docker.socket` directive from the `/usr/lib/systemd/system/docker.service` file if present
- Remove `-H fd://` from the `ExecStart` directive (both in the main unit file, and in any drop-in files present).
@z

@x
After making those changes, run `sudo systemctl daemon-reload`, and `sudo
systemctl restart docker` to reload changes and (re)start the docker daemon.
@y
After making those changes, run `sudo systemctl daemon-reload`, and `sudo
systemctl restart docker` to reload changes and (re)start the docker daemon.
@z

@x
### Runtime
@y
### Runtime
@z

@x
- Fix issue where volume metadata was not removed [#29083](https://github.com/docker/docker/pull/29083)
- Asynchronously close streams to prevent holding container lock [#29050](https://github.com/docker/docker/pull/29050)
- Fix selinux labels for newly created container volumes [#29050](https://github.com/docker/docker/pull/29050)
- Remove hostname validation [#28990](https://github.com/docker/docker/pull/28990)
- Fix deadlocks caused by IO races [#29095](https://github.com/docker/docker/pull/29095) [#29141](https://github.com/docker/docker/pull/29141)
- Return an empty stats if the container is restarting [#29150](https://github.com/docker/docker/pull/29150)
- Fix volume store locking [#29151](https://github.com/docker/docker/pull/29151)
- Ensure consistent status code in API [#29150](https://github.com/docker/docker/pull/29150)
- Fix incorrect opaque directory permission in overlay2 [#29093](https://github.com/docker/docker/pull/29093)
- Detect plugin content and error out on `docker pull` [#29297](https://github.com/docker/docker/pull/29297)
@y
- Fix issue where volume metadata was not removed [#29083](https://github.com/docker/docker/pull/29083)
- Asynchronously close streams to prevent holding container lock [#29050](https://github.com/docker/docker/pull/29050)
- Fix selinux labels for newly created container volumes [#29050](https://github.com/docker/docker/pull/29050)
- Remove hostname validation [#28990](https://github.com/docker/docker/pull/28990)
- Fix deadlocks caused by IO races [#29095](https://github.com/docker/docker/pull/29095) [#29141](https://github.com/docker/docker/pull/29141)
- Return an empty stats if the container is restarting [#29150](https://github.com/docker/docker/pull/29150)
- Fix volume store locking [#29151](https://github.com/docker/docker/pull/29151)
- Ensure consistent status code in API [#29150](https://github.com/docker/docker/pull/29150)
- Fix incorrect opaque directory permission in overlay2 [#29093](https://github.com/docker/docker/pull/29093)
- Detect plugin content and error out on `docker pull` [#29297](https://github.com/docker/docker/pull/29297)
@z

@x
### Swarm Mode
@y
### Swarm Mode
@z

@x
* Update Swarmkit [#29047](https://github.com/docker/docker/pull/29047)
  - orchestrator/global: Fix deadlock on updates [docker/swarmkit#1760](https://github.com/docker/swarmkit/pull/1760)
  - on leader switchover preserve the vxlan id for existing networks [docker/swarmkit#1773](https://github.com/docker/swarmkit/pull/1773)
- Refuse swarm spec not named "default" [#29152](https://github.com/docker/docker/pull/29152)
@y
* Update Swarmkit [#29047](https://github.com/docker/docker/pull/29047)
  - orchestrator/global: Fix deadlock on updates [docker/swarmkit#1760](https://github.com/docker/swarmkit/pull/1760)
  - on leader switchover preserve the vxlan id for existing networks [docker/swarmkit#1773](https://github.com/docker/swarmkit/pull/1773)
- Refuse swarm spec not named "default" [#29152](https://github.com/docker/docker/pull/29152)
@z

@x
### Networking
@y
### Networking
@z

@x
* Update libnetwork [#29004](https://github.com/docker/docker/pull/29004) [#29146](https://github.com/docker/docker/pull/29146)
  - Fix panic in embedded DNS [docker/libnetwork#1561](https://github.com/docker/libnetwork/pull/1561)
  - Fix unmarhalling panic when passing --link-local-ip on global scope network [docker/libnetwork#1564](https://github.com/docker/libnetwork/pull/1564)
  - Fix panic when network plugin returns nil StaticRoutes [docker/libnetwork#1563](https://github.com/docker/libnetwork/pull/1563)
  - Fix panic in `osl.(*networkNamespace).DeleteNeighbor` [docker/libnetwork#1555](https://github.com/docker/libnetwork/pull/1555)
  - Fix panic in swarm networking concurrent map read/write [docker/libnetwork#1570](https://github.com/docker/libnetwork/pull/1570)
  * Allow encrypted networks when running docker inside a container [docker/libnetwork#1502](https://github.com/docker/libnetwork/pull/1502)
  - Do not block autoallocation of IPv6 pool [docker/libnetwork#1538](https://github.com/docker/libnetwork/pull/1538)
  - Set timeout for netlink calls [docker/libnetwork#1557](https://github.com/docker/libnetwork/pull/1557)
  - Increase networking local store timeout to one minute [docker/libkv#140](https://github.com/docker/libkv/pull/140)
  - Fix a panic in `libnetwork.(*sandbox).execFunc` [docker/libnetwork#1556](https://github.com/docker/libnetwork/pull/1556)
  - Honor icc=false for internal networks [docker/libnetwork#1525](https://github.com/docker/libnetwork/pull/1525)
@y
* Update libnetwork [#29004](https://github.com/docker/docker/pull/29004) [#29146](https://github.com/docker/docker/pull/29146)
  - Fix panic in embedded DNS [docker/libnetwork#1561](https://github.com/docker/libnetwork/pull/1561)
  - Fix unmarhalling panic when passing --link-local-ip on global scope network [docker/libnetwork#1564](https://github.com/docker/libnetwork/pull/1564)
  - Fix panic when network plugin returns nil StaticRoutes [docker/libnetwork#1563](https://github.com/docker/libnetwork/pull/1563)
  - Fix panic in `osl.(*networkNamespace).DeleteNeighbor` [docker/libnetwork#1555](https://github.com/docker/libnetwork/pull/1555)
  - Fix panic in swarm networking concurrent map read/write [docker/libnetwork#1570](https://github.com/docker/libnetwork/pull/1570)
  * Allow encrypted networks when running docker inside a container [docker/libnetwork#1502](https://github.com/docker/libnetwork/pull/1502)
  - Do not block autoallocation of IPv6 pool [docker/libnetwork#1538](https://github.com/docker/libnetwork/pull/1538)
  - Set timeout for netlink calls [docker/libnetwork#1557](https://github.com/docker/libnetwork/pull/1557)
  - Increase networking local store timeout to one minute [docker/libkv#140](https://github.com/docker/libkv/pull/140)
  - Fix a panic in `libnetwork.(*sandbox).execFunc` [docker/libnetwork#1556](https://github.com/docker/libnetwork/pull/1556)
  - Honor icc=false for internal networks [docker/libnetwork#1525](https://github.com/docker/libnetwork/pull/1525)
@z

@x
### Logging
@y
### Logging
@z

@x
* Update syslog log driver [#29150](https://github.com/docker/docker/pull/29150)
@y
* Update syslog log driver [#29150](https://github.com/docker/docker/pull/29150)
@z

@x
### Contrib
@y
### Contrib
@z

@x
- Run "dnf upgrade" before installing in fedora [#29150](https://github.com/docker/docker/pull/29150)
- Add build-date back to RPM packages [#29150](https://github.com/docker/docker/pull/29150)
- deb package filename changed to include distribution to distinguish between distribution code names [#27829](https://github.com/docker/docker/pull/27829)
@y
- Run "dnf upgrade" before installing in fedora [#29150](https://github.com/docker/docker/pull/29150)
- Add build-date back to RPM packages [#29150](https://github.com/docker/docker/pull/29150)
- deb package filename changed to include distribution to distinguish between distribution code names [#27829](https://github.com/docker/docker/pull/27829)
@z

@x
## 1.12.3 (2016-10-26)
@y
## 1.12.3 (2016-10-26)
@z

@x
> [!IMPORTANT]
>
> Docker 1.12 ships with an updated systemd unit file for rpm
based installs (which includes RHEL, Fedora, CentOS, and Oracle Linux 7). When upgrading from an older version of Docker, the upgrade process may not automatically install the updated version of the unit file, or fail to start the Docker service if;
> - the systemd unit file (`/usr/lib/systemd/system/docker.service`) contains local changes, or
> - a systemd drop-in file is present, and contains `-H fd://` in the `ExecStart` directive
@y
> [!IMPORTANT]
>
> Docker 1.12 ships with an updated systemd unit file for rpm
based installs (which includes RHEL, Fedora, CentOS, and Oracle Linux 7). When upgrading from an older version of Docker, the upgrade process may not automatically install the updated version of the unit file, or fail to start the Docker service if;
> - the systemd unit file (`/usr/lib/systemd/system/docker.service`) contains local changes, or
> - a systemd drop-in file is present, and contains `-H fd://` in the `ExecStart` directive
@z

@x
Starting the `docker service` will produce an error:
@y
Starting the `docker service` will produce an error:
@z

@x
    Failed to start docker.service: Unit docker.socket failed to load: No such file or directory.
@y
    Failed to start docker.service: Unit docker.socket failed to load: No such file or directory.
@z

@x
or
@y
or
@z

@x
    no sockets found via socket activation: make sure the service was started by systemd.
@y
    no sockets found via socket activation: make sure the service was started by systemd.
@z

@x
To resolve this:
@y
To resolve this:
@z

@x
- Backup the current version of the unit file, and replace the file with the
  [version that ships with docker 1.12](https://raw.githubusercontent.com/docker/docker/v1.12.0/contrib/init/systemd/docker.service.rpm)
- Remove the `Requires=docker.socket` directive from the `/usr/lib/systemd/system/docker.service` file if present
- Remove `-H fd://` from the `ExecStart` directive (both in the main unit file, and in any drop-in files present).
@y
- Backup the current version of the unit file, and replace the file with the
  [version that ships with docker 1.12](https://raw.githubusercontent.com/docker/docker/v1.12.0/contrib/init/systemd/docker.service.rpm)
- Remove the `Requires=docker.socket` directive from the `/usr/lib/systemd/system/docker.service` file if present
- Remove `-H fd://` from the `ExecStart` directive (both in the main unit file, and in any drop-in files present).
@z

@x
After making those changes, run `sudo systemctl daemon-reload`, and `sudo
systemctl restart docker` to reload changes and (re)start the docker daemon.
@y
After making those changes, run `sudo systemctl daemon-reload`, and `sudo
systemctl restart docker` to reload changes and (re)start the docker daemon.
@z

@x
### Runtime
@y
### Runtime
@z

@x
- Fix ambient capability usage in containers (CVE-2016-8867) [#27610](https://github.com/docker/docker/pull/27610)
- Prevent a deadlock in libcontainerd for Windows [#27136](https://github.com/docker/docker/pull/27136)
- Fix error reporting in CopyFileWithTar [#27075](https://github.com/docker/docker/pull/27075)
* Reset health status to starting when a container is restarted [#27387](https://github.com/docker/docker/pull/27387)
* Properly handle shared mount propagation in storage directory [#27609](https://github.com/docker/docker/pull/27609)
- Fix docker exec [#27610](https://github.com/docker/docker/pull/27610)
- Fix backward compatibility with containerd’s events log [#27693](https://github.com/docker/docker/pull/27693)
@y
- Fix ambient capability usage in containers (CVE-2016-8867) [#27610](https://github.com/docker/docker/pull/27610)
- Prevent a deadlock in libcontainerd for Windows [#27136](https://github.com/docker/docker/pull/27136)
- Fix error reporting in CopyFileWithTar [#27075](https://github.com/docker/docker/pull/27075)
* Reset health status to starting when a container is restarted [#27387](https://github.com/docker/docker/pull/27387)
* Properly handle shared mount propagation in storage directory [#27609](https://github.com/docker/docker/pull/27609)
- Fix docker exec [#27610](https://github.com/docker/docker/pull/27610)
- Fix backward compatibility with containerd’s events log [#27693](https://github.com/docker/docker/pull/27693)
@z

@x
### Swarm Mode
@y
### Swarm Mode
@z

@x
- Fix conversion of restart-policy [#27062](https://github.com/docker/docker/pull/27062)
* Update Swarmkit [#27554](https://github.com/docker/docker/pull/27554)
 * Avoid restarting a task that has already been restarted [docker/swarmkit#1305](https://github.com/docker/swarmkit/pull/1305)
 * Allow duplicate published ports when they use different protocols [docker/swarmkit#1632](https://github.com/docker/swarmkit/pull/1632)
 * Allow multiple randomly assigned published ports on service [docker/swarmkit#1657](https://github.com/docker/swarmkit/pull/1657)
 - Fix panic when allocations happen at init time [docker/swarmkit#1651](https://github.com/docker/swarmkit/pull/1651)
@y
- Fix conversion of restart-policy [#27062](https://github.com/docker/docker/pull/27062)
* Update Swarmkit [#27554](https://github.com/docker/docker/pull/27554)
 * Avoid restarting a task that has already been restarted [docker/swarmkit#1305](https://github.com/docker/swarmkit/pull/1305)
 * Allow duplicate published ports when they use different protocols [docker/swarmkit#1632](https://github.com/docker/swarmkit/pull/1632)
 * Allow multiple randomly assigned published ports on service [docker/swarmkit#1657](https://github.com/docker/swarmkit/pull/1657)
 - Fix panic when allocations happen at init time [docker/swarmkit#1651](https://github.com/docker/swarmkit/pull/1651)
@z

@x
### Networking
@y
### Networking
@z

@x
* Update libnetwork [#27559](https://github.com/docker/docker/pull/27559)
 - Fix race in serializing sandbox to string [docker/libnetwork#1495](https://github.com/docker/libnetwork/pull/1495)
 - Fix race during deletion [docker/libnetwork#1503](https://github.com/docker/libnetwork/pull/1503)
 * Reset endpoint port info on connectivity revoke in bridge driver [docker/libnetwork#1504](https://github.com/docker/libnetwork/pull/1504)
 - Fix a deadlock in networking code [docker/libnetwork#1507](https://github.com/docker/libnetwork/pull/1507)
 - Fix a race in load balancer state [docker/libnetwork#1512](https://github.com/docker/libnetwork/pull/1512)
@y
* Update libnetwork [#27559](https://github.com/docker/docker/pull/27559)
 - Fix race in serializing sandbox to string [docker/libnetwork#1495](https://github.com/docker/libnetwork/pull/1495)
 - Fix race during deletion [docker/libnetwork#1503](https://github.com/docker/libnetwork/pull/1503)
 * Reset endpoint port info on connectivity revoke in bridge driver [docker/libnetwork#1504](https://github.com/docker/libnetwork/pull/1504)
 - Fix a deadlock in networking code [docker/libnetwork#1507](https://github.com/docker/libnetwork/pull/1507)
 - Fix a race in load balancer state [docker/libnetwork#1512](https://github.com/docker/libnetwork/pull/1512)
@z

@x
### Logging
@y
### Logging
@z

@x
* Update fluent-logger-golang to v1.2.1 [#27474](https://github.com/docker/docker/pull/27474)
@y
* Update fluent-logger-golang to v1.2.1 [#27474](https://github.com/docker/docker/pull/27474)
@z

@x
### Contrib
@y
### Contrib
@z

@x
* Update buildtags for armhf ubuntu-trusty [#27327](https://github.com/docker/docker/pull/27327)
* Add AppArmor to runc buildtags for armhf [#27421](https://github.com/docker/docker/pull/27421)
@y
* Update buildtags for armhf ubuntu-trusty [#27327](https://github.com/docker/docker/pull/27327)
* Add AppArmor to runc buildtags for armhf [#27421](https://github.com/docker/docker/pull/27421)
@z

@x
## 1.12.2 (2016-10-11)
@y
## 1.12.2 (2016-10-11)
@z

@x
> [!IMPORTANT]
>
> Docker 1.12 ships with an updated systemd unit file for rpm
based installs (which includes RHEL, Fedora, CentOS, and Oracle Linux 7). When upgrading from an older version of Docker, the upgrade process may not automatically install the updated version of the unit file, or fail to start the `docker service` if;
> - the systemd unit file (`/usr/lib/systemd/system/docker.service`) contains local changes, or
> - a systemd drop-in file is present, and contains `-H fd://` in the `ExecStart` directive
@y
> [!IMPORTANT]
>
> Docker 1.12 ships with an updated systemd unit file for rpm
based installs (which includes RHEL, Fedora, CentOS, and Oracle Linux 7). When upgrading from an older version of Docker, the upgrade process may not automatically install the updated version of the unit file, or fail to start the `docker service` if;
> - the systemd unit file (`/usr/lib/systemd/system/docker.service`) contains local changes, or
> - a systemd drop-in file is present, and contains `-H fd://` in the `ExecStart` directive
@z

@x
Starting the `docker service` will produce an error:
@y
Starting the `docker service` will produce an error:
@z

@x
    Failed to start docker.service: Unit docker.socket failed to load: No such file or directory.
@y
    Failed to start docker.service: Unit docker.socket failed to load: No such file or directory.
@z

@x
or
@y
or
@z

@x
    no sockets found via socket activation: make sure the service was started by systemd.
@y
    no sockets found via socket activation: make sure the service was started by systemd.
@z

@x
To resolve this:
@y
To resolve this:
@z

@x
- Backup the current version of the unit file, and replace the file with the
  [version that ships with docker 1.12](https://raw.githubusercontent.com/docker/docker/v1.12.0/contrib/init/systemd/docker.service.rpm)
- Remove the `Requires=docker.socket` directive from the `/usr/lib/systemd/system/docker.service` file if present
- Remove `-H fd://` from the `ExecStart` directive (both in the main unit file, and in any drop-in files present).
@y
- Backup the current version of the unit file, and replace the file with the
  [version that ships with docker 1.12](https://raw.githubusercontent.com/docker/docker/v1.12.0/contrib/init/systemd/docker.service.rpm)
- Remove the `Requires=docker.socket` directive from the `/usr/lib/systemd/system/docker.service` file if present
- Remove `-H fd://` from the `ExecStart` directive (both in the main unit file, and in any drop-in files present).
@z

@x
After making those changes, run `sudo systemctl daemon-reload`, and `sudo
systemctl restart docker` to reload changes and (re)start the docker daemon.
@y
After making those changes, run `sudo systemctl daemon-reload`, and `sudo
systemctl restart docker` to reload changes and (re)start the docker daemon.
@z

@x
### Runtime
@y
### Runtime
@z

@x
- Fix a panic due to a race condition filtering `docker ps` [#26049](https://github.com/docker/docker/pull/26049)
* Implement retry logic to prevent "Unable to remove filesystem" errors when using the aufs storage driver [#26536](https://github.com/docker/docker/pull/26536)
* Prevent devicemapper from removing device symlinks if `dm.use_deferred_removal` is enabled [#24740](https://github.com/docker/docker/pull/24740)
- Fix an issue where the CLI did not return correct exit codes if a command was run with invalid options [#26777](https://github.com/docker/docker/pull/26777)
- Fix a panic due to a bug in stdout / stderr processing in health checks [#26507](https://github.com/docker/docker/pull/26507)
- Fix exec's children handling [#26874](https://github.com/docker/docker/pull/26874)
- Fix exec form of HEALTHCHECK CMD [#26208](https://github.com/docker/docker/pull/26208)
@y
- Fix a panic due to a race condition filtering `docker ps` [#26049](https://github.com/docker/docker/pull/26049)
* Implement retry logic to prevent "Unable to remove filesystem" errors when using the aufs storage driver [#26536](https://github.com/docker/docker/pull/26536)
* Prevent devicemapper from removing device symlinks if `dm.use_deferred_removal` is enabled [#24740](https://github.com/docker/docker/pull/24740)
- Fix an issue where the CLI did not return correct exit codes if a command was run with invalid options [#26777](https://github.com/docker/docker/pull/26777)
- Fix a panic due to a bug in stdout / stderr processing in health checks [#26507](https://github.com/docker/docker/pull/26507)
- Fix exec's children handling [#26874](https://github.com/docker/docker/pull/26874)
- Fix exec form of HEALTHCHECK CMD [#26208](https://github.com/docker/docker/pull/26208)
@z

@x
### Networking
@y
### Networking
@z

@x
- Fix a daemon start panic on armv5 [#24315](https://github.com/docker/docker/issues/24315)
* Vendor libnetwork [#26879](https://github.com/docker/docker/pull/26879) [#26953](https://github.com/docker/docker/pull/26953)
 * Avoid returning early on agent join failures [docker/libnetwork#1473](https://github.com/docker/libnetwork/pull/1473)
 - Fix service published port cleanup issues [docker/libetwork#1432](https://github.com/docker/libnetwork/pull/1432) [docker/libnetwork#1433](https://github.com/docker/libnetwork/pull/1433)
 * Recover properly from transient gossip failures [docker/libnetwork#1446](https://github.com/docker/libnetwork/pull/1446)
 * Disambiguate node names known to gossip cluster to avoid node name collision [docker/libnetwork#1451](https://github.com/docker/libnetwork/pull/1451)
 * Honor user provided listen address for gossip  [docker/libnetwork#1460](https://github.com/docker/libnetwork/pull/1460)
 * Allow reachability via published port across services on the same host [docker/libnetwork#1398](https://github.com/docker/libnetwork/pull/1398)
 * Change the ingress sandbox name from random id to just `ingress_sbox` [docker/libnetwork#1449](https://github.com/docker/libnetwork/pull/1449)
 - Disable service discovery in ingress network [docker/libnetwork#1489](https://github.com/docker/libnetwork/pull/1489)
@y
- Fix a daemon start panic on armv5 [#24315](https://github.com/docker/docker/issues/24315)
* Vendor libnetwork [#26879](https://github.com/docker/docker/pull/26879) [#26953](https://github.com/docker/docker/pull/26953)
 * Avoid returning early on agent join failures [docker/libnetwork#1473](https://github.com/docker/libnetwork/pull/1473)
 - Fix service published port cleanup issues [docker/libetwork#1432](https://github.com/docker/libnetwork/pull/1432) [docker/libnetwork#1433](https://github.com/docker/libnetwork/pull/1433)
 * Recover properly from transient gossip failures [docker/libnetwork#1446](https://github.com/docker/libnetwork/pull/1446)
 * Disambiguate node names known to gossip cluster to avoid node name collision [docker/libnetwork#1451](https://github.com/docker/libnetwork/pull/1451)
 * Honor user provided listen address for gossip  [docker/libnetwork#1460](https://github.com/docker/libnetwork/pull/1460)
 * Allow reachability via published port across services on the same host [docker/libnetwork#1398](https://github.com/docker/libnetwork/pull/1398)
 * Change the ingress sandbox name from random id to just `ingress_sbox` [docker/libnetwork#1449](https://github.com/docker/libnetwork/pull/1449)
 - Disable service discovery in ingress network [docker/libnetwork#1489](https://github.com/docker/libnetwork/pull/1489)
@z

@x
### Swarm Mode
@y
### Swarm Mode
@z

@x
* Fix remote detection of a node's address when it joins the cluster [#26211](https://github.com/docker/docker/pull/26211)
* Vendor SwarmKit [#26765](https://github.com/docker/docker/pull/26765)
 * Bounce session after failed status update [docker/swarmkit#1539](https://github.com/docker/swarmkit/pull/1539)
 - Fix possible raft deadlocks [docker/swarmkit#1537](https://github.com/docker/swarmkit/pull/1537)
 - Fix panic and endpoint leak when a service is updated with no endpoints [docker/swarmkit#1481](https://github.com/docker/swarmkit/pull/1481)
 * Produce an error if the same port is published twice on `service create` or `service update` [docker/swarmkit#1495](https://github.com/docker/swarmkit/pull/1495)
 - Fix an issue where changes to a service were not detected, resulting in the service not being updated [docker/swarmkit#1497](https://github.com/docker/swarmkit/pull/1497)
 - Do not allow service creation on ingress network [docker/swarmkit#1600](https://github.com/docker/swarmkit/pull/1600)
@y
* Fix remote detection of a node's address when it joins the cluster [#26211](https://github.com/docker/docker/pull/26211)
* Vendor SwarmKit [#26765](https://github.com/docker/docker/pull/26765)
 * Bounce session after failed status update [docker/swarmkit#1539](https://github.com/docker/swarmkit/pull/1539)
 - Fix possible raft deadlocks [docker/swarmkit#1537](https://github.com/docker/swarmkit/pull/1537)
 - Fix panic and endpoint leak when a service is updated with no endpoints [docker/swarmkit#1481](https://github.com/docker/swarmkit/pull/1481)
 * Produce an error if the same port is published twice on `service create` or `service update` [docker/swarmkit#1495](https://github.com/docker/swarmkit/pull/1495)
 - Fix an issue where changes to a service were not detected, resulting in the service not being updated [docker/swarmkit#1497](https://github.com/docker/swarmkit/pull/1497)
 - Do not allow service creation on ingress network [docker/swarmkit#1600](https://github.com/docker/swarmkit/pull/1600)
@z

@x
### Contrib
@y
### Contrib
@z

@x
* Update the debian sysv-init script to use `dockerd` instead of `docker daemon` [#25869](https://github.com/docker/docker/pull/25869)
* Improve stability when running the docker client on MacOS Sierra [#26875](https://github.com/docker/docker/pull/26875)
- Fix installation on debian stretch [#27184](https://github.com/docker/docker/pull/27184)
@y
* Update the debian sysv-init script to use `dockerd` instead of `docker daemon` [#25869](https://github.com/docker/docker/pull/25869)
* Improve stability when running the docker client on MacOS Sierra [#26875](https://github.com/docker/docker/pull/26875)
- Fix installation on debian stretch [#27184](https://github.com/docker/docker/pull/27184)
@z

@x
### Windows
@y
### Windows
@z

@x
- Fix an issue where arrow-navigation did not work when running the docker client in ConEmu [#25578](https://github.com/docker/docker/pull/25578)
@y
- Fix an issue where arrow-navigation did not work when running the docker client in ConEmu [#25578](https://github.com/docker/docker/pull/25578)
@z

@x
## 1.12.1 (2016-08-18)
@y
## 1.12.1 (2016-08-18)
@z

@x
> [!IMPORTANT]
>
> Docker 1.12 ships with an updated systemd unit file for rpm
based installs (which includes RHEL, Fedora, CentOS, and Oracle Linux 7). When upgrading from an older version of Docker, the upgrade process may not automatically install the updated version of the unit file, or fail to start the `docker service` if;
> - the systemd unit file (`/usr/lib/systemd/system/docker.service`) contains local changes, or
> - a systemd drop-in file is present, and contains `-H fd://` in the `ExecStart` directive
@y
> [!IMPORTANT]
>
> Docker 1.12 ships with an updated systemd unit file for rpm
based installs (which includes RHEL, Fedora, CentOS, and Oracle Linux 7). When upgrading from an older version of Docker, the upgrade process may not automatically install the updated version of the unit file, or fail to start the `docker service` if;
> - the systemd unit file (`/usr/lib/systemd/system/docker.service`) contains local changes, or
> - a systemd drop-in file is present, and contains `-H fd://` in the `ExecStart` directive
@z

@x
Starting the `docker service` will produce an error:
@y
Starting the `docker service` will produce an error:
@z

@x
    Failed to start docker.service: Unit docker.socket failed to load: No such file or directory.
@y
    Failed to start docker.service: Unit docker.socket failed to load: No such file or directory.
@z

@x
or
@y
or
@z

@x
    no sockets found via socket activation: make sure the service was started by systemd.
@y
    no sockets found via socket activation: make sure the service was started by systemd.
@z

@x
To resolve this:
@y
To resolve this:
@z

@x
- Backup the current version of the unit file, and replace the file with the
  [version that ships with docker 1.12](https://raw.githubusercontent.com/docker/docker/v1.12.0/contrib/init/systemd/docker.service.rpm)
- Remove the `Requires=docker.socket` directive from the `/usr/lib/systemd/system/docker.service` file if present
- Remove `-H fd://` from the `ExecStart` directive (both in the main unit file, and in any drop-in files present).
@y
- Backup the current version of the unit file, and replace the file with the
  [version that ships with docker 1.12](https://raw.githubusercontent.com/docker/docker/v1.12.0/contrib/init/systemd/docker.service.rpm)
- Remove the `Requires=docker.socket` directive from the `/usr/lib/systemd/system/docker.service` file if present
- Remove `-H fd://` from the `ExecStart` directive (both in the main unit file, and in any drop-in files present).
@z

@x
After making those changes, run `sudo systemctl daemon-reload`, and `sudo
systemctl restart docker` to reload changes and (re)start the docker daemon.
@y
After making those changes, run `sudo systemctl daemon-reload`, and `sudo
systemctl restart docker` to reload changes and (re)start the docker daemon.
@z

@x
### Client
@y
### Client
@z

@x
* Add `Joined at` information in `node inspect --pretty` [#25512](https://github.com/docker/docker/pull/25512)
- Fix a crash on `service inspect` [#25454](https://github.com/docker/docker/pull/25454)
- Fix issue preventing `service update --env-add` to work as intended [#25427](https://github.com/docker/docker/pull/25427)
- Fix issue preventing `service update --publish-add` to work as intended [#25428](https://github.com/docker/docker/pull/25428)
- Remove `service update --network-add` and `service update --network-rm` flags
  because this feature is not yet implemented in 1.12, but was inadvertently added
  to the client in 1.12.0 [#25646](https://github.com/docker/docker/pull/25646)
@y
* Add `Joined at` information in `node inspect --pretty` [#25512](https://github.com/docker/docker/pull/25512)
- Fix a crash on `service inspect` [#25454](https://github.com/docker/docker/pull/25454)
- Fix issue preventing `service update --env-add` to work as intended [#25427](https://github.com/docker/docker/pull/25427)
- Fix issue preventing `service update --publish-add` to work as intended [#25428](https://github.com/docker/docker/pull/25428)
- Remove `service update --network-add` and `service update --network-rm` flags
  because this feature is not yet implemented in 1.12, but was inadvertently added
  to the client in 1.12.0 [#25646](https://github.com/docker/docker/pull/25646)
@z

@x
### Contrib
@y
### Contrib
@z

@x
+ Official ARM installation for Debian Jessie, Ubuntu Trusty, and Raspbian Jessie [#24815](https://github.com/docker/docker/pull/24815) [#25591](https://github.com/docker/docker/pull/25637)
- Add selinux policy per distribution/version, fixing issue preventing successful installation on Fedora 24, and Oracle Linux [#25334](https://github.com/docker/docker/pull/25334) [#25593](https://github.com/docker/docker/pull/25593)
@y
+ Official ARM installation for Debian Jessie, Ubuntu Trusty, and Raspbian Jessie [#24815](https://github.com/docker/docker/pull/24815) [#25591](https://github.com/docker/docker/pull/25637)
- Add selinux policy per distribution/version, fixing issue preventing successful installation on Fedora 24, and Oracle Linux [#25334](https://github.com/docker/docker/pull/25334) [#25593](https://github.com/docker/docker/pull/25593)
@z

@x
### Networking
@y
### Networking
@z

@x
- Fix issue that prevented containers to be accessed by hostname with Docker overlay driver in Swarm Mode [#25603](https://github.com/docker/docker/pull/25603) [#25648](https://github.com/docker/docker/pull/25648)
- Fix random network issues on service with published port [#25603](https://github.com/docker/docker/pull/25603)
- Fix unreliable inter-service communication after scaling down and up [#25603](https://github.com/docker/docker/pull/25603)
- Fix issue where removing all tasks on a node and adding them back breaks connectivity with other services [#25603](https://github.com/docker/docker/pull/25603)
- Fix issue where a task that fails to start results in a race, causing a `network xxx not found` error that masks the actual error [#25550](https://github.com/docker/docker/pull/25550)
- Relax validation of SRV records for external services that use SRV records not formatted according to RFC 2782 [#25739](https://github.com/docker/docker/pull/25739)
@y
- Fix issue that prevented containers to be accessed by hostname with Docker overlay driver in Swarm Mode [#25603](https://github.com/docker/docker/pull/25603) [#25648](https://github.com/docker/docker/pull/25648)
- Fix random network issues on service with published port [#25603](https://github.com/docker/docker/pull/25603)
- Fix unreliable inter-service communication after scaling down and up [#25603](https://github.com/docker/docker/pull/25603)
- Fix issue where removing all tasks on a node and adding them back breaks connectivity with other services [#25603](https://github.com/docker/docker/pull/25603)
- Fix issue where a task that fails to start results in a race, causing a `network xxx not found` error that masks the actual error [#25550](https://github.com/docker/docker/pull/25550)
- Relax validation of SRV records for external services that use SRV records not formatted according to RFC 2782 [#25739](https://github.com/docker/docker/pull/25739)
@z

@x
### Plugins (experimental)
@y
### Plugins (experimental)
@z

@x
* Make daemon events listen for plugin lifecycle events [#24760](https://github.com/docker/docker/pull/24760)
* Check for plugin state before enabling plugin [#25033](https://github.com/docker/docker/pull/25033)
- Remove plugin root from filesystem on `plugin rm` [#25187](https://github.com/docker/docker/pull/25187)
- Prevent deadlock when more than one plugin is installed [#25384](https://github.com/docker/docker/pull/25384)
@y
* Make daemon events listen for plugin lifecycle events [#24760](https://github.com/docker/docker/pull/24760)
* Check for plugin state before enabling plugin [#25033](https://github.com/docker/docker/pull/25033)
- Remove plugin root from filesystem on `plugin rm` [#25187](https://github.com/docker/docker/pull/25187)
- Prevent deadlock when more than one plugin is installed [#25384](https://github.com/docker/docker/pull/25384)
@z

@x
### Runtime
@y
### Runtime
@z

@x
* Mask join tokens in daemon logs [#25346](https://github.com/docker/docker/pull/25346)
- Fix `docker ps --filter` causing the results to no longer be sorted by creation time [#25387](https://github.com/docker/docker/pull/25387)
- Fix various crashes [#25053](https://github.com/docker/docker/pull/25053)
@y
* Mask join tokens in daemon logs [#25346](https://github.com/docker/docker/pull/25346)
- Fix `docker ps --filter` causing the results to no longer be sorted by creation time [#25387](https://github.com/docker/docker/pull/25387)
- Fix various crashes [#25053](https://github.com/docker/docker/pull/25053)
@z

@x
### Security
@y
### Security
@z

@x
* Add `/proc/timer_list` to the masked paths list to prevent information leak from the host [#25630](https://github.com/docker/docker/pull/25630)
* Allow systemd to run with only `--cap-add SYS_ADMIN` rather than having to also add `--cap-add DAC_READ_SEARCH` or disabling seccomp filtering [#25567](https://github.com/docker/docker/pull/25567)
@y
* Add `/proc/timer_list` to the masked paths list to prevent information leak from the host [#25630](https://github.com/docker/docker/pull/25630)
* Allow systemd to run with only `--cap-add SYS_ADMIN` rather than having to also add `--cap-add DAC_READ_SEARCH` or disabling seccomp filtering [#25567](https://github.com/docker/docker/pull/25567)
@z

@x
### Swarm
@y
### Swarm
@z

@x
- Fix an issue where the swarm can get stuck electing a new leader after quorum is lost [#25055](https://github.com/docker/docker/issues/25055)
- Fix unwanted rescheduling of containers after a leader failover [#25017](https://github.com/docker/docker/issues/25017)
- Change swarm root CA key to P256 curve [swarmkit#1376](https://github.com/docker/swarmkit/pull/1376)
- Allow forced removal of a node from a swarm [#25159](https://github.com/docker/docker/pull/25159)
- Fix connection leak when a node leaves a swarm [swarmkit/#1277](https://github.com/docker/swarmkit/pull/1277)
- Backdate swarm certificates by one hour to tolerate more clock skew [swarmkit/#1243](https://github.com/docker/swarmkit/pull/1243)
- Avoid high CPU use with many unschedulable tasks [swarmkit/#1287](https://github.com/docker/swarmkit/pull/1287)
- Fix issue with global tasks not starting up [swarmkit/#1295](https://github.com/docker/swarmkit/pull/1295)
- Garbage collect raft logs [swarmkit/#1327](https://github.com/docker/swarmkit/pull/1327)
@y
- Fix an issue where the swarm can get stuck electing a new leader after quorum is lost [#25055](https://github.com/docker/docker/issues/25055)
- Fix unwanted rescheduling of containers after a leader failover [#25017](https://github.com/docker/docker/issues/25017)
- Change swarm root CA key to P256 curve [swarmkit#1376](https://github.com/docker/swarmkit/pull/1376)
- Allow forced removal of a node from a swarm [#25159](https://github.com/docker/docker/pull/25159)
- Fix connection leak when a node leaves a swarm [swarmkit/#1277](https://github.com/docker/swarmkit/pull/1277)
- Backdate swarm certificates by one hour to tolerate more clock skew [swarmkit/#1243](https://github.com/docker/swarmkit/pull/1243)
- Avoid high CPU use with many unschedulable tasks [swarmkit/#1287](https://github.com/docker/swarmkit/pull/1287)
- Fix issue with global tasks not starting up [swarmkit/#1295](https://github.com/docker/swarmkit/pull/1295)
- Garbage collect raft logs [swarmkit/#1327](https://github.com/docker/swarmkit/pull/1327)
@z

@x
### Volume
@y
### Volume
@z

@x
- Persist local volume options after a daemon restart [#25316](https://github.com/docker/docker/pull/25316)
- Fix an issue where the mount ID was not returned on volume unmount [#25333](https://github.com/docker/docker/pull/25333)
- Fix an issue where a volume mount could inadvertently create a bind mount [#25309](https://github.com/docker/docker/pull/25309)
- `docker service create --mount type=bind,...` now correctly validates if the source path exists, instead of creating it [#25494](https://github.com/docker/docker/pull/25494)
@y
- Persist local volume options after a daemon restart [#25316](https://github.com/docker/docker/pull/25316)
- Fix an issue where the mount ID was not returned on volume unmount [#25333](https://github.com/docker/docker/pull/25333)
- Fix an issue where a volume mount could inadvertently create a bind mount [#25309](https://github.com/docker/docker/pull/25309)
- `docker service create --mount type=bind,...` now correctly validates if the source path exists, instead of creating it [#25494](https://github.com/docker/docker/pull/25494)
@z

@x
## 1.12.0 (2016-07-28)
@y
## 1.12.0 (2016-07-28)
@z

@x
> [!IMPORTANT]
>
> Docker 1.12.0 ships with an updated systemd unit file for rpm
based installs (which includes RHEL, Fedora, CentOS, and Oracle Linux 7). When upgrading from an older version of Docker, the upgrade process may not automatically install the updated version of the unit file, or fail to start the `docker service` if;
> - the systemd unit file (`/usr/lib/systemd/system/docker.service`) contains local changes, or
> - a systemd drop-in file is present, and contains `-H fd://` in the `ExecStart` directive
@y
> [!IMPORTANT]
>
> Docker 1.12.0 ships with an updated systemd unit file for rpm
based installs (which includes RHEL, Fedora, CentOS, and Oracle Linux 7). When upgrading from an older version of Docker, the upgrade process may not automatically install the updated version of the unit file, or fail to start the `docker service` if;
> - the systemd unit file (`/usr/lib/systemd/system/docker.service`) contains local changes, or
> - a systemd drop-in file is present, and contains `-H fd://` in the `ExecStart` directive
@z

@x
Starting the `docker service` will produce an error:
@y
Starting the `docker service` will produce an error:
@z

@x
    Failed to start docker.service: Unit docker.socket failed to load: No such file or directory.
@y
    Failed to start docker.service: Unit docker.socket failed to load: No such file or directory.
@z

@x
or
@y
or
@z

@x
    no sockets found via socket activation: make sure the service was started by systemd.
@y
    no sockets found via socket activation: make sure the service was started by systemd.
@z

@x
To resolve this:
@y
To resolve this:
@z

@x
- Backup the current version of the unit file, and replace the file with the
  [version that ships with docker 1.12](https://raw.githubusercontent.com/docker/docker/v1.12.0/contrib/init/systemd/docker.service.rpm)
- Remove the `Requires=docker.socket` directive from the `/usr/lib/systemd/system/docker.service` file if present
- Remove `-H fd://` from the `ExecStart` directive (both in the main unit file, and in any drop-in files present).
@y
- Backup the current version of the unit file, and replace the file with the
  [version that ships with docker 1.12](https://raw.githubusercontent.com/docker/docker/v1.12.0/contrib/init/systemd/docker.service.rpm)
- Remove the `Requires=docker.socket` directive from the `/usr/lib/systemd/system/docker.service` file if present
- Remove `-H fd://` from the `ExecStart` directive (both in the main unit file, and in any drop-in files present).
@z

@x
After making those changes, run `sudo systemctl daemon-reload`, and `sudo
systemctl restart docker` to reload changes and (re)start the docker daemon.
@y
After making those changes, run `sudo systemctl daemon-reload`, and `sudo
systemctl restart docker` to reload changes and (re)start the docker daemon.
@z

@x
> [!IMPORTANT]
>
> With Docker 1.12, a Linux `docker` installation now has two
additional binaries; `dockerd`, and `docker-proxy`. If you have scripts for installing `docker`, make sure to update them accordingly.
@y
> [!IMPORTANT]
>
> With Docker 1.12, a Linux `docker` installation now has two
additional binaries; `dockerd`, and `docker-proxy`. If you have scripts for installing `docker`, make sure to update them accordingly.
@z

@x
### Builder
@y
### Builder
@z

@x
+ New `HEALTHCHECK` Dockerfile instruction to support user-defined healthchecks [#23218](https://github.com/docker/docker/pull/23218)
+ New `SHELL` Dockerfile instruction to specify the default shell when using the shell form for commands in a Dockerfile [#22489](https://github.com/docker/docker/pull/22489)
+ Add `#escape=` Dockerfile directive to support platform-specific parsing of file paths in Dockerfile [#22268](https://github.com/docker/docker/pull/22268)
+ Add support for comments in `.dockerignore` [#23111](https://github.com/docker/docker/pull/23111)
* Support for UTF-8 in Dockerfiles [#23372](https://github.com/docker/docker/pull/23372)
* Skip UTF-8 BOM bytes from `Dockerfile` and `.dockerignore` if exist [#23234](https://github.com/docker/docker/pull/23234)
* Windows: support for `ARG` to match Linux [#22508](https://github.com/docker/docker/pull/22508)
- Fix error message when building using a daemon with the bridge network disabled [#22932](https://github.com/docker/docker/pull/22932)
@y
+ New `HEALTHCHECK` Dockerfile instruction to support user-defined healthchecks [#23218](https://github.com/docker/docker/pull/23218)
+ New `SHELL` Dockerfile instruction to specify the default shell when using the shell form for commands in a Dockerfile [#22489](https://github.com/docker/docker/pull/22489)
+ Add `#escape=` Dockerfile directive to support platform-specific parsing of file paths in Dockerfile [#22268](https://github.com/docker/docker/pull/22268)
+ Add support for comments in `.dockerignore` [#23111](https://github.com/docker/docker/pull/23111)
* Support for UTF-8 in Dockerfiles [#23372](https://github.com/docker/docker/pull/23372)
* Skip UTF-8 BOM bytes from `Dockerfile` and `.dockerignore` if exist [#23234](https://github.com/docker/docker/pull/23234)
* Windows: support for `ARG` to match Linux [#22508](https://github.com/docker/docker/pull/22508)
- Fix error message when building using a daemon with the bridge network disabled [#22932](https://github.com/docker/docker/pull/22932)
@z

@x
### Contrib
@y
### Contrib
@z

@x
* Enable seccomp for Centos 7 and Oracle Linux 7 [#22344](https://github.com/docker/docker/pull/22344)
- Remove MountFlags in systemd unit to allow shared mount propagation [#22806](https://github.com/docker/docker/pull/22806)
@y
* Enable seccomp for Centos 7 and Oracle Linux 7 [#22344](https://github.com/docker/docker/pull/22344)
- Remove MountFlags in systemd unit to allow shared mount propagation [#22806](https://github.com/docker/docker/pull/22806)
@z

@x
### Distribution
@y
### Distribution
@z

@x
+ Add `--max-concurrent-downloads` and `--max-concurrent-uploads` daemon flags useful for situations where network connections don't support multiple downloads/uploads [#22445](https://github.com/docker/docker/pull/22445)
* Registry operations now honor the `ALL_PROXY` environment variable [#22316](https://github.com/docker/docker/pull/22316)
* Provide more information to the user on `docker load` [#23377](https://github.com/docker/docker/pull/23377)
* Always save registry digest metadata about images pushed and pulled [#23996](https://github.com/docker/docker/pull/23996)
@y
+ Add `--max-concurrent-downloads` and `--max-concurrent-uploads` daemon flags useful for situations where network connections don't support multiple downloads/uploads [#22445](https://github.com/docker/docker/pull/22445)
* Registry operations now honor the `ALL_PROXY` environment variable [#22316](https://github.com/docker/docker/pull/22316)
* Provide more information to the user on `docker load` [#23377](https://github.com/docker/docker/pull/23377)
* Always save registry digest metadata about images pushed and pulled [#23996](https://github.com/docker/docker/pull/23996)
@z

@x
### Logging
@y
### Logging
@z

@x
+ Syslog logging driver now supports DGRAM sockets [#21613](https://github.com/docker/docker/pull/21613)
+ Add `--details` option to `docker logs` to also display log tags [#21889](https://github.com/docker/docker/pull/21889)
+ Enable syslog logger to have access to env and labels [#21724](https://github.com/docker/docker/pull/21724)
+ An additional syslog-format option `rfc5424micro` to allow microsecond resolution in syslog timestamp [#21844](https://github.com/docker/docker/pull/21844)
* Inherit the daemon log options when creating containers [#21153](https://github.com/docker/docker/pull/21153)
* Remove `docker/` prefix from log messages tag and replace it with `{{.DaemonName}}` so that users have the option of changing the prefix [#22384](https://github.com/docker/docker/pull/22384)
@y
+ Syslog logging driver now supports DGRAM sockets [#21613](https://github.com/docker/docker/pull/21613)
+ Add `--details` option to `docker logs` to also display log tags [#21889](https://github.com/docker/docker/pull/21889)
+ Enable syslog logger to have access to env and labels [#21724](https://github.com/docker/docker/pull/21724)
+ An additional syslog-format option `rfc5424micro` to allow microsecond resolution in syslog timestamp [#21844](https://github.com/docker/docker/pull/21844)
* Inherit the daemon log options when creating containers [#21153](https://github.com/docker/docker/pull/21153)
* Remove `docker/` prefix from log messages tag and replace it with `{{.DaemonName}}` so that users have the option of changing the prefix [#22384](https://github.com/docker/docker/pull/22384)
@z

@x
### Networking
@y
### Networking
@z

@x
+ Built-in Virtual-IP based  internal and ingress load-balancing using IPVS [#23361](https://github.com/docker/docker/pull/23361)
+ Routing Mesh using ingress overlay network [#23361](https://github.com/docker/docker/pull/23361)
+ Secured multi-host overlay networking using encrypted control-plane and Data-plane [#23361](https://github.com/docker/docker/pull/23361)
+ MacVlan driver is out of experimental [#23524](https://github.com/docker/docker/pull/23524)
+ Add `driver` filter to `network ls` [#22319](https://github.com/docker/docker/pull/22319)
+ Adding `network` filter to `docker ps --filter` [#23300](https://github.com/docker/docker/pull/23300)
+ Add `--link-local-ip` flag to `create`, `run` and `network connect` to specify a container's link-local address [#23415](https://github.com/docker/docker/pull/23415)
+ Add network label filter support [#21495](https://github.com/docker/docker/pull/21495)
* Removed dependency on external KV-Store for Overlay networking in Swarm-Mode  [#23361](https://github.com/docker/docker/pull/23361)
* Add container's short-id as default network alias [#21901](https://github.com/docker/docker/pull/21901)
* `run` options `--dns` and `--net=host` are no longer mutually exclusive [#22408](https://github.com/docker/docker/pull/22408)
- Fix DNS issue when renaming containers with generated names [#22716](https://github.com/docker/docker/pull/22716)
- Allow both `network inspect -f {{.Id}}` and `network inspect -f {{.ID}}` to address inconsistency with inspect output [#23226](https://github.com/docker/docker/pull/23226)
@y
+ Built-in Virtual-IP based  internal and ingress load-balancing using IPVS [#23361](https://github.com/docker/docker/pull/23361)
+ Routing Mesh using ingress overlay network [#23361](https://github.com/docker/docker/pull/23361)
+ Secured multi-host overlay networking using encrypted control-plane and Data-plane [#23361](https://github.com/docker/docker/pull/23361)
+ MacVlan driver is out of experimental [#23524](https://github.com/docker/docker/pull/23524)
+ Add `driver` filter to `network ls` [#22319](https://github.com/docker/docker/pull/22319)
+ Adding `network` filter to `docker ps --filter` [#23300](https://github.com/docker/docker/pull/23300)
+ Add `--link-local-ip` flag to `create`, `run` and `network connect` to specify a container's link-local address [#23415](https://github.com/docker/docker/pull/23415)
+ Add network label filter support [#21495](https://github.com/docker/docker/pull/21495)
* Removed dependency on external KV-Store for Overlay networking in Swarm-Mode  [#23361](https://github.com/docker/docker/pull/23361)
* Add container's short-id as default network alias [#21901](https://github.com/docker/docker/pull/21901)
* `run` options `--dns` and `--net=host` are no longer mutually exclusive [#22408](https://github.com/docker/docker/pull/22408)
- Fix DNS issue when renaming containers with generated names [#22716](https://github.com/docker/docker/pull/22716)
- Allow both `network inspect -f {{.Id}}` and `network inspect -f {{.ID}}` to address inconsistency with inspect output [#23226](https://github.com/docker/docker/pull/23226)
@z

@x
### Plugins (experimental)
@y
### Plugins (experimental)
@z

@x
+ New `plugin` command to manager plugins with `install`, `enable`, `disable`, `rm`, `inspect`, `set` subcommands [#23446](https://github.com/docker/docker/pull/23446)
@y
+ New `plugin` command to manager plugins with `install`, `enable`, `disable`, `rm`, `inspect`, `set` subcommands [#23446](https://github.com/docker/docker/pull/23446)
@z

@x
### Remote API (v1.24) & Client
@y
### Remote API (v1.24) & Client
@z

@x
+ Split the binary into two: `docker` (client) and `dockerd` (daemon) [#20639](https://github.com/docker/docker/pull/20639)
+ Add `before` and `since` filters to `docker images --filter` [#22908](https://github.com/docker/docker/pull/22908)
+ Add `--limit` option to `docker search` [#23107](https://github.com/docker/docker/pull/23107)
+ Add `--filter` option to `docker search` [#22369](https://github.com/docker/docker/pull/22369)
+ Add security options to `docker info` output [#21172](https://github.com/docker/docker/pull/21172) [#23520](https://github.com/docker/docker/pull/23520)
+ Add insecure registries to `docker info` output [#20410](https://github.com/docker/docker/pull/20410)
+ Extend Docker authorization with TLS user information [#21556](https://github.com/docker/docker/pull/21556)
+ devicemapper: expose Minimum Thin Pool Free Space through `docker info` [#21945](https://github.com/docker/docker/pull/21945)
* API now returns a JSON object when an error occurs making it more consistent [#22880](https://github.com/docker/docker/pull/22880)
- Prevent `docker run -i --restart` from hanging on exit [#22777](https://github.com/docker/docker/pull/22777)
- Fix API/CLI discrepancy on hostname validation [#21641](https://github.com/docker/docker/pull/21641)
- Fix discrepancy in the format of sizes in `stats` from HumanSize to BytesSize [#21773](https://github.com/docker/docker/pull/21773)
- authz: when request is denied return forbidden exit code (403) [#22448](https://github.com/docker/docker/pull/22448)
- Windows: fix tty-related displaying issues [#23878](https://github.com/docker/docker/pull/23878)
@y
+ Split the binary into two: `docker` (client) and `dockerd` (daemon) [#20639](https://github.com/docker/docker/pull/20639)
+ Add `before` and `since` filters to `docker images --filter` [#22908](https://github.com/docker/docker/pull/22908)
+ Add `--limit` option to `docker search` [#23107](https://github.com/docker/docker/pull/23107)
+ Add `--filter` option to `docker search` [#22369](https://github.com/docker/docker/pull/22369)
+ Add security options to `docker info` output [#21172](https://github.com/docker/docker/pull/21172) [#23520](https://github.com/docker/docker/pull/23520)
+ Add insecure registries to `docker info` output [#20410](https://github.com/docker/docker/pull/20410)
+ Extend Docker authorization with TLS user information [#21556](https://github.com/docker/docker/pull/21556)
+ devicemapper: expose Minimum Thin Pool Free Space through `docker info` [#21945](https://github.com/docker/docker/pull/21945)
* API now returns a JSON object when an error occurs making it more consistent [#22880](https://github.com/docker/docker/pull/22880)
- Prevent `docker run -i --restart` from hanging on exit [#22777](https://github.com/docker/docker/pull/22777)
- Fix API/CLI discrepancy on hostname validation [#21641](https://github.com/docker/docker/pull/21641)
- Fix discrepancy in the format of sizes in `stats` from HumanSize to BytesSize [#21773](https://github.com/docker/docker/pull/21773)
- authz: when request is denied return forbidden exit code (403) [#22448](https://github.com/docker/docker/pull/22448)
- Windows: fix tty-related displaying issues [#23878](https://github.com/docker/docker/pull/23878)
@z

@x
### Runtime
@y
### Runtime
@z

@x
+ Split the userland proxy to a separate binary (`docker-proxy`) [#23312](https://github.com/docker/docker/pull/23312)
+ Add `--live-restore` daemon flag to keep containers running when daemon shuts down, and regain control on startup [#23213](https://github.com/docker/docker/pull/23213)
+ Ability to add OCI-compatible runtimes (via `--add-runtime` daemon flag) and select one with `--runtime` on `create` and `run` [#22983](https://github.com/docker/docker/pull/22983)
+ New `overlay2` graphdriver for Linux 4.0+ with multiple lower directory support [#22126](https://github.com/docker/docker/pull/22126)
+ New load/save image events [#22137](https://github.com/docker/docker/pull/22137)
+ Add support for reloading daemon configuration through systemd [#22446](https://github.com/docker/docker/pull/22446)
+ Add disk quota support for btrfs [#19651](https://github.com/docker/docker/pull/19651)
+ Add disk quota support for zfs [#21946](https://github.com/docker/docker/pull/21946)
+ Add support for `docker run --pid=container:<id>` [#22481](https://github.com/docker/docker/pull/22481)
+ Align default seccomp profile with selected capabilities [#22554](https://github.com/docker/docker/pull/22554)
+ Add a `daemon reload` event when the daemon reloads its configuration [#22590](https://github.com/docker/docker/pull/22590)
+ Add `trace` capability in the pprof profiler to show execution traces in binary form [#22715](https://github.com/docker/docker/pull/22715)
+ Add a `detach` event [#22898](https://github.com/docker/docker/pull/22898)
+ Add support for setting sysctls with `--sysctl` [#19265](https://github.com/docker/docker/pull/19265)
+ Add `--storage-opt` flag to `create` and `run` allowing to set `size` on devicemapper [#19367](https://github.com/docker/docker/pull/19367)
+ Add `--oom-score-adjust` daemon flag with a default value of `-500` making the daemon less likely to be killed before containers [#24516](https://github.com/docker/docker/pull/24516)
* Undeprecate the `-c` short alias of `--cpu-shares` on `run`, `build`, `create`, `update` [#22621](https://github.com/docker/docker/pull/22621)
* Prevent from using aufs and overlay graphdrivers on an eCryptfs mount [#23121](https://github.com/docker/docker/pull/23121)
- Fix issues with tmpfs mount ordering [#22329](https://github.com/docker/docker/pull/22329)
- Created containers are no longer listed on `docker ps -a -f exited=0` [#21947](https://github.com/docker/docker/pull/21947)
- Fix an issue where containers are stuck in a "Removal In Progress" state [#22423](https://github.com/docker/docker/pull/22423)
- Fix bug that was returning an HTTP 500 instead of a 400 when not specifying a command on run/create [#22762](https://github.com/docker/docker/pull/22762)
- Fix bug with `--detach-keys` whereby input matching a prefix of the detach key was not preserved [#22943](https://github.com/docker/docker/pull/22943)
- SELinux labeling is now disabled when using `--privileged` mode [#22993](https://github.com/docker/docker/pull/22993)
- If volume-mounted into a container, `/etc/hosts`, `/etc/resolv.conf`, `/etc/hostname` are no longer SELinux-relabeled [#22993](https://github.com/docker/docker/pull/22993)
- Fix inconsistency in `--tmpfs` behavior regarding mount options [#22438](https://github.com/docker/docker/pull/22438)
- Fix an issue where daemon hangs at startup [#23148](https://github.com/docker/docker/pull/23148)
- Ignore SIGPIPE events to prevent journald restarts to crash docker in some cases [#22460](https://github.com/docker/docker/pull/22460)
- Containers are not removed from stats list on error [#20835](https://github.com/docker/docker/pull/20835)
- Fix `on-failure` restart policy when daemon restarts [#20853](https://github.com/docker/docker/pull/20853)
- Fix an issue with `stats` when a container is using another container's network [#21904](https://github.com/docker/docker/pull/21904)
@y
+ Split the userland proxy to a separate binary (`docker-proxy`) [#23312](https://github.com/docker/docker/pull/23312)
+ Add `--live-restore` daemon flag to keep containers running when daemon shuts down, and regain control on startup [#23213](https://github.com/docker/docker/pull/23213)
+ Ability to add OCI-compatible runtimes (via `--add-runtime` daemon flag) and select one with `--runtime` on `create` and `run` [#22983](https://github.com/docker/docker/pull/22983)
+ New `overlay2` graphdriver for Linux 4.0+ with multiple lower directory support [#22126](https://github.com/docker/docker/pull/22126)
+ New load/save image events [#22137](https://github.com/docker/docker/pull/22137)
+ Add support for reloading daemon configuration through systemd [#22446](https://github.com/docker/docker/pull/22446)
+ Add disk quota support for btrfs [#19651](https://github.com/docker/docker/pull/19651)
+ Add disk quota support for zfs [#21946](https://github.com/docker/docker/pull/21946)
+ Add support for `docker run --pid=container:<id>` [#22481](https://github.com/docker/docker/pull/22481)
+ Align default seccomp profile with selected capabilities [#22554](https://github.com/docker/docker/pull/22554)
+ Add a `daemon reload` event when the daemon reloads its configuration [#22590](https://github.com/docker/docker/pull/22590)
+ Add `trace` capability in the pprof profiler to show execution traces in binary form [#22715](https://github.com/docker/docker/pull/22715)
+ Add a `detach` event [#22898](https://github.com/docker/docker/pull/22898)
+ Add support for setting sysctls with `--sysctl` [#19265](https://github.com/docker/docker/pull/19265)
+ Add `--storage-opt` flag to `create` and `run` allowing to set `size` on devicemapper [#19367](https://github.com/docker/docker/pull/19367)
+ Add `--oom-score-adjust` daemon flag with a default value of `-500` making the daemon less likely to be killed before containers [#24516](https://github.com/docker/docker/pull/24516)
* Undeprecate the `-c` short alias of `--cpu-shares` on `run`, `build`, `create`, `update` [#22621](https://github.com/docker/docker/pull/22621)
* Prevent from using aufs and overlay graphdrivers on an eCryptfs mount [#23121](https://github.com/docker/docker/pull/23121)
- Fix issues with tmpfs mount ordering [#22329](https://github.com/docker/docker/pull/22329)
- Created containers are no longer listed on `docker ps -a -f exited=0` [#21947](https://github.com/docker/docker/pull/21947)
- Fix an issue where containers are stuck in a "Removal In Progress" state [#22423](https://github.com/docker/docker/pull/22423)
- Fix bug that was returning an HTTP 500 instead of a 400 when not specifying a command on run/create [#22762](https://github.com/docker/docker/pull/22762)
- Fix bug with `--detach-keys` whereby input matching a prefix of the detach key was not preserved [#22943](https://github.com/docker/docker/pull/22943)
- SELinux labeling is now disabled when using `--privileged` mode [#22993](https://github.com/docker/docker/pull/22993)
- If volume-mounted into a container, `/etc/hosts`, `/etc/resolv.conf`, `/etc/hostname` are no longer SELinux-relabeled [#22993](https://github.com/docker/docker/pull/22993)
- Fix inconsistency in `--tmpfs` behavior regarding mount options [#22438](https://github.com/docker/docker/pull/22438)
- Fix an issue where daemon hangs at startup [#23148](https://github.com/docker/docker/pull/23148)
- Ignore SIGPIPE events to prevent journald restarts to crash docker in some cases [#22460](https://github.com/docker/docker/pull/22460)
- Containers are not removed from stats list on error [#20835](https://github.com/docker/docker/pull/20835)
- Fix `on-failure` restart policy when daemon restarts [#20853](https://github.com/docker/docker/pull/20853)
- Fix an issue with `stats` when a container is using another container's network [#21904](https://github.com/docker/docker/pull/21904)
@z

@x
### Swarm Mode
@y
### Swarm Mode
@z

@x
+ New `swarm` command to manage swarms with `init`, `join`, `join-token`, `leave`, `update` subcommands [#23361](https://github.com/docker/docker/pull/23361) [#24823](https://github.com/docker/docker/pull/24823)
+ New `service` command to manage swarm-wide services with `create`, `inspect`, `update`, `rm`, `ps` subcommands [#23361](https://github.com/docker/docker/pull/23361) [#25140](https://github.com/docker/docker/pull/25140)
+ New `node` command to manage nodes with `accept`, `promote`, `demote`, `inspect`, `update`, `ps`, `ls` and `rm` subcommands [#23361](https://github.com/docker/docker/pull/23361) [#25140](https://github.com/docker/docker/pull/25140)
+ (experimental) New `stack` and `deploy` commands to manage and deploy multi-service applications [#23522](https://github.com/docker/docker/pull/23522) [#25140](https://github.com/docker/docker/pull/25140)
@y
+ New `swarm` command to manage swarms with `init`, `join`, `join-token`, `leave`, `update` subcommands [#23361](https://github.com/docker/docker/pull/23361) [#24823](https://github.com/docker/docker/pull/24823)
+ New `service` command to manage swarm-wide services with `create`, `inspect`, `update`, `rm`, `ps` subcommands [#23361](https://github.com/docker/docker/pull/23361) [#25140](https://github.com/docker/docker/pull/25140)
+ New `node` command to manage nodes with `accept`, `promote`, `demote`, `inspect`, `update`, `ps`, `ls` and `rm` subcommands [#23361](https://github.com/docker/docker/pull/23361) [#25140](https://github.com/docker/docker/pull/25140)
+ (experimental) New `stack` and `deploy` commands to manage and deploy multi-service applications [#23522](https://github.com/docker/docker/pull/23522) [#25140](https://github.com/docker/docker/pull/25140)
@z

@x
### Volume
@y
### Volume
@z

@x
+ Add support for local and global volume scopes (analogous to network scopes) [#22077](https://github.com/docker/docker/pull/22077)
+ Allow volume drivers to provide a `Status` field [#21006](https://github.com/docker/docker/pull/21006)
+ Add name/driver filter support for volume [#21361](https://github.com/docker/docker/pull/21361)
* Mount/Unmount operations now receives an opaque ID to allow volume drivers to differentiate between two callers [#21015](https://github.com/docker/docker/pull/21015)
- Fix issue preventing to remove a volume in a corner case [#22103](https://github.com/docker/docker/pull/22103)
- Windows: Enable auto-creation of host-path to match Linux [#22094](https://github.com/docker/docker/pull/22094)
@y
+ Add support for local and global volume scopes (analogous to network scopes) [#22077](https://github.com/docker/docker/pull/22077)
+ Allow volume drivers to provide a `Status` field [#21006](https://github.com/docker/docker/pull/21006)
+ Add name/driver filter support for volume [#21361](https://github.com/docker/docker/pull/21361)
* Mount/Unmount operations now receives an opaque ID to allow volume drivers to differentiate between two callers [#21015](https://github.com/docker/docker/pull/21015)
- Fix issue preventing to remove a volume in a corner case [#22103](https://github.com/docker/docker/pull/22103)
- Windows: Enable auto-creation of host-path to match Linux [#22094](https://github.com/docker/docker/pull/22094)
@z

@x
### Deprecation
@y
### Deprecation
@z

@x
* Environment variables `DOCKER_CONTENT_TRUST_OFFLINE_PASSPHRASE` and `DOCKER_CONTENT_TRUST_TAGGING_PASSPHRASE` have been renamed
  to `DOCKER_CONTENT_TRUST_ROOT_PASSPHRASE` and `DOCKER_CONTENT_TRUST_REPOSITORY_PASSPHRASE` respectively [#22574](https://github.com/docker/docker/pull/22574)
* Remove deprecated `syslog-tag`, `gelf-tag`, `fluentd-tag` log option in favor of the more generic `tag` one [#22620](https://github.com/docker/docker/pull/22620)
* Remove deprecated feature of passing HostConfig at API container start [#22570](https://github.com/docker/docker/pull/22570)
* Remove deprecated `-f`/`--force` flag on docker tag [#23090](https://github.com/docker/docker/pull/23090)
* Remove deprecated `/containers/<id|name>/copy` endpoint [#22149](https://github.com/docker/docker/pull/22149)
* Remove deprecated `docker ps` flags `--since` and `--before` [#22138](https://github.com/docker/docker/pull/22138)
* Deprecate the old 3-args form of `docker import` [#23273](https://github.com/docker/docker/pull/23273)
@y
* Environment variables `DOCKER_CONTENT_TRUST_OFFLINE_PASSPHRASE` and `DOCKER_CONTENT_TRUST_TAGGING_PASSPHRASE` have been renamed
  to `DOCKER_CONTENT_TRUST_ROOT_PASSPHRASE` and `DOCKER_CONTENT_TRUST_REPOSITORY_PASSPHRASE` respectively [#22574](https://github.com/docker/docker/pull/22574)
* Remove deprecated `syslog-tag`, `gelf-tag`, `fluentd-tag` log option in favor of the more generic `tag` one [#22620](https://github.com/docker/docker/pull/22620)
* Remove deprecated feature of passing HostConfig at API container start [#22570](https://github.com/docker/docker/pull/22570)
* Remove deprecated `-f`/`--force` flag on docker tag [#23090](https://github.com/docker/docker/pull/23090)
* Remove deprecated `/containers/<id|name>/copy` endpoint [#22149](https://github.com/docker/docker/pull/22149)
* Remove deprecated `docker ps` flags `--since` and `--before` [#22138](https://github.com/docker/docker/pull/22138)
* Deprecate the old 3-args form of `docker import` [#23273](https://github.com/docker/docker/pull/23273)
@z

@x
## 1.11.2 (2016-05-31)
@y
## 1.11.2 (2016-05-31)
@z

@x
### Networking
@y
### Networking
@z

@x
- Fix a stale endpoint issue on overlay networks during ungraceful restart ([#23015](https://github.com/docker/docker/pull/23015))
- Fix an issue where the wrong port could be reported by `docker inspect/ps/port` ([#22997](https://github.com/docker/docker/pull/22997))
@y
- Fix a stale endpoint issue on overlay networks during ungraceful restart ([#23015](https://github.com/docker/docker/pull/23015))
- Fix an issue where the wrong port could be reported by `docker inspect/ps/port` ([#22997](https://github.com/docker/docker/pull/22997))
@z

@x
### Runtime
@y
### Runtime
@z

@x
- Fix a potential panic when running `docker build` ([#23032](https://github.com/docker/docker/pull/23032))
- Fix interpretation of `--user` parameter ([#22998](https://github.com/docker/docker/pull/22998))
- Fix a bug preventing container statistics to be correctly reported ([#22955](https://github.com/docker/docker/pull/22955))
- Fix an issue preventing container to be restarted after daemon restart ([#22947](https://github.com/docker/docker/pull/22947))
- Fix issues when running 32 bit binaries on Ubuntu 16.04 ([#22922](https://github.com/docker/docker/pull/22922))
- Fix a possible deadlock on image deletion and container attach ([#22918](https://github.com/docker/docker/pull/22918))
- Fix an issue where containers fail to start after a daemon restart if they depend on a containerized cluster store ([#22561](https://github.com/docker/docker/pull/22561))
- Fix an issue causing `docker ps` to hang on CentOS when using devicemapper ([#22168](https://github.com/docker/docker/pull/22168), [#23067](https://github.com/docker/docker/pull/23067))
- Fix a bug preventing to `docker exec` into a container when using devicemapper ([#22168](https://github.com/docker/docker/pull/22168), [#23067](https://github.com/docker/docker/pull/23067))
@y
- Fix a potential panic when running `docker build` ([#23032](https://github.com/docker/docker/pull/23032))
- Fix interpretation of `--user` parameter ([#22998](https://github.com/docker/docker/pull/22998))
- Fix a bug preventing container statistics to be correctly reported ([#22955](https://github.com/docker/docker/pull/22955))
- Fix an issue preventing container to be restarted after daemon restart ([#22947](https://github.com/docker/docker/pull/22947))
- Fix issues when running 32 bit binaries on Ubuntu 16.04 ([#22922](https://github.com/docker/docker/pull/22922))
- Fix a possible deadlock on image deletion and container attach ([#22918](https://github.com/docker/docker/pull/22918))
- Fix an issue where containers fail to start after a daemon restart if they depend on a containerized cluster store ([#22561](https://github.com/docker/docker/pull/22561))
- Fix an issue causing `docker ps` to hang on CentOS when using devicemapper ([#22168](https://github.com/docker/docker/pull/22168), [#23067](https://github.com/docker/docker/pull/23067))
- Fix a bug preventing to `docker exec` into a container when using devicemapper ([#22168](https://github.com/docker/docker/pull/22168), [#23067](https://github.com/docker/docker/pull/23067))
@z

@x
## 1.11.1 (2016-04-26)
@y
## 1.11.1 (2016-04-26)
@z

@x
### Distribution
@y
### Distribution
@z

@x
- Fix schema2 manifest media type to be of type `application/vnd.docker.container.image.v1+json` ([#21949](https://github.com/docker/docker/pull/21949))
@y
- Fix schema2 manifest media type to be of type `application/vnd.docker.container.image.v1+json` ([#21949](https://github.com/docker/docker/pull/21949))
@z

@x
### Documentation
@y
### Documentation
@z

@x
+ Add missing API documentation for changes introduced with 1.11.0 ([#22048](https://github.com/docker/docker/pull/22048))
@y
+ Add missing API documentation for changes introduced with 1.11.0 ([#22048](https://github.com/docker/docker/pull/22048))
@z

@x
### Builder
@y
### Builder
@z

@x
* Append label passed to `docker build` as arguments as an implicit `LABEL` command at the end of the processed `Dockerfile` ([#22184](https://github.com/docker/docker/pull/22184))
@y
* Append label passed to `docker build` as arguments as an implicit `LABEL` command at the end of the processed `Dockerfile` ([#22184](https://github.com/docker/docker/pull/22184))
@z

@x
### Networking
@y
### Networking
@z

@x
- Fix a panic that would occur when forwarding DNS query ([#22261](https://github.com/docker/docker/pull/22261))
- Fix an issue where OS threads could end up within an incorrect network namespace when using user defined networks ([#22261](https://github.com/docker/docker/pull/22261))
@y
- Fix a panic that would occur when forwarding DNS query ([#22261](https://github.com/docker/docker/pull/22261))
- Fix an issue where OS threads could end up within an incorrect network namespace when using user defined networks ([#22261](https://github.com/docker/docker/pull/22261))
@z

@x
### Runtime
@y
### Runtime
@z

@x
- Fix a bug preventing labels configuration to be reloaded via the config file ([#22299](https://github.com/docker/docker/pull/22299))
- Fix a regression where container mounting `/var/run` would prevent other containers from being removed ([#22256](https://github.com/docker/docker/pull/22256))
- Fix an issue where it would be impossible to update both `memory-swap` and `memory` value together ([#22255](https://github.com/docker/docker/pull/22255))
- Fix a regression from 1.11.0 where the `/auth` endpoint would not initialize `serveraddress` if it is not provided ([#22254](https://github.com/docker/docker/pull/22254))
- Add missing cleanup of container temporary files when cancelling a schedule restart ([#22237](https://github.com/docker/docker/pull/22237))
- Remove scary error message when no restart policy is specified ([#21993](https://github.com/docker/docker/pull/21993))
- Fix a panic that would occur when the plugins were activated via the json spec ([#22191](https://github.com/docker/docker/pull/22191))
- Fix restart backoff logic to correctly reset delay if container ran for at least 10secs ([#22125](https://github.com/docker/docker/pull/22125))
- Remove error message when a container restart get cancelled ([#22123](https://github.com/docker/docker/pull/22123))
- Fix an issue where `docker` would not correctly clean up after `docker exec` ([#22121](https://github.com/docker/docker/pull/22121))
- Fix a panic that could occur when serving concurrent `docker stats` commands ([#22120](https://github.com/docker/docker/pull/22120))`
- Revert deprecation of non-existent host directories auto-creation ([#22065](https://github.com/docker/docker/pull/22065))
- Hide misleading rpc error on daemon shutdown ([#22058](https://github.com/docker/docker/pull/22058))
@y
- Fix a bug preventing labels configuration to be reloaded via the config file ([#22299](https://github.com/docker/docker/pull/22299))
- Fix a regression where container mounting `/var/run` would prevent other containers from being removed ([#22256](https://github.com/docker/docker/pull/22256))
- Fix an issue where it would be impossible to update both `memory-swap` and `memory` value together ([#22255](https://github.com/docker/docker/pull/22255))
- Fix a regression from 1.11.0 where the `/auth` endpoint would not initialize `serveraddress` if it is not provided ([#22254](https://github.com/docker/docker/pull/22254))
- Add missing cleanup of container temporary files when cancelling a schedule restart ([#22237](https://github.com/docker/docker/pull/22237))
- Remove scary error message when no restart policy is specified ([#21993](https://github.com/docker/docker/pull/21993))
- Fix a panic that would occur when the plugins were activated via the json spec ([#22191](https://github.com/docker/docker/pull/22191))
- Fix restart backoff logic to correctly reset delay if container ran for at least 10secs ([#22125](https://github.com/docker/docker/pull/22125))
- Remove error message when a container restart get cancelled ([#22123](https://github.com/docker/docker/pull/22123))
- Fix an issue where `docker` would not correctly clean up after `docker exec` ([#22121](https://github.com/docker/docker/pull/22121))
- Fix a panic that could occur when serving concurrent `docker stats` commands ([#22120](https://github.com/docker/docker/pull/22120))`
- Revert deprecation of non-existent host directories auto-creation ([#22065](https://github.com/docker/docker/pull/22065))
- Hide misleading rpc error on daemon shutdown ([#22058](https://github.com/docker/docker/pull/22058))
@z

@x
## 1.11.0 (2016-04-13)
@y
## 1.11.0 (2016-04-13)
@z

@x
> [!IMPORTANT]
>
> With Docker 1.11, a Linux Docker installation is now made of 4 binaries (`docker`, [`docker-containerd`](https://github.com/docker/containerd), [`docker-containerd-shim`](https://github.com/docker/containerd) and [`docker-runc`](https://github.com/opencontainers/runc)). If you have scripts relying on `docker` being a single static binaries, make sure to update them. Interaction with the daemon stay the same otherwise, the usage of the other binaries should be transparent. A Windows Docker installation remains a single binary, `docker.exe`.
@y
> [!IMPORTANT]
>
> With Docker 1.11, a Linux Docker installation is now made of 4 binaries (`docker`, [`docker-containerd`](https://github.com/docker/containerd), [`docker-containerd-shim`](https://github.com/docker/containerd) and [`docker-runc`](https://github.com/opencontainers/runc)). If you have scripts relying on `docker` being a single static binaries, make sure to update them. Interaction with the daemon stay the same otherwise, the usage of the other binaries should be transparent. A Windows Docker installation remains a single binary, `docker.exe`.
@z

@x
### Builder
@y
### Builder
@z

@x
- Fix a bug where Docker would not use the correct uid/gid when processing the `WORKDIR` command ([#21033](https://github.com/docker/docker/pull/21033))
- Fix a bug where copy operations with userns would not use the proper uid/gid ([#20782](https://github.com/docker/docker/pull/20782), [#21162](https://github.com/docker/docker/pull/21162))
@y
- Fix a bug where Docker would not use the correct uid/gid when processing the `WORKDIR` command ([#21033](https://github.com/docker/docker/pull/21033))
- Fix a bug where copy operations with userns would not use the proper uid/gid ([#20782](https://github.com/docker/docker/pull/20782), [#21162](https://github.com/docker/docker/pull/21162))
@z

@x
### Client
@y
### Client
@z

@x
* Usage of the `:` separator for security option has been deprecated. `=` should be used instead ([#21232](https://github.com/docker/docker/pull/21232))
+ The client user agent is now passed to the registry on `pull`, `build`, `push`, `login` and `search` operations ([#21306](https://github.com/docker/docker/pull/21306), [#21373](https://github.com/docker/docker/pull/21373))
* Allow setting the Domainname and Hostname separately through the API ([#20200](https://github.com/docker/docker/pull/20200))
* Docker info will now warn users if it can not detect the kernel version or the operating system ([#21128](https://github.com/docker/docker/pull/21128))
- Fix an issue where `docker stats --no-stream` output could be all 0s ([#20803](https://github.com/docker/docker/pull/20803))
- Fix a bug where some newly started container would not appear in a running `docker stats` command ([#20792](https://github.com/docker/docker/pull/20792))
* Post processing is no longer enabled for linux-cgo terminals ([#20587](https://github.com/docker/docker/pull/20587))
- Values to `--hostname` are now refused if they do not comply with [RFC1123](https://tools.ietf.org/html/rfc1123) ([#20566](https://github.com/docker/docker/pull/20566))
+ Docker learned how to use a SOCKS proxy ([#20366](https://github.com/docker/docker/pull/20366), [#18373](https://github.com/docker/docker/pull/18373))
+ Docker now supports external credential stores ([#20107](https://github.com/docker/docker/pull/20107))
* `docker ps` now supports displaying the list of volumes mounted inside a container ([#20017](https://github.com/docker/docker/pull/20017))
* `docker info` now also reports Docker's root directory location ([#19986](https://github.com/docker/docker/pull/19986))
- Docker now prohibits login in with an empty username (spaces are trimmed) ([#19806](https://github.com/docker/docker/pull/19806))
* Docker events attributes are now sorted by key ([#19761](https://github.com/docker/docker/pull/19761))
* `docker ps` no longer shows exported port for stopped containers ([#19483](https://github.com/docker/docker/pull/19483))
- Docker now cleans after itself if a save/export command fails ([#17849](https://github.com/docker/docker/pull/17849))
* Docker load learned how to display a progress bar ([#17329](https://github.com/docker/docker/pull/17329), [#120078](https://github.com/docker/docker/pull/20078))
@y
* Usage of the `:` separator for security option has been deprecated. `=` should be used instead ([#21232](https://github.com/docker/docker/pull/21232))
+ The client user agent is now passed to the registry on `pull`, `build`, `push`, `login` and `search` operations ([#21306](https://github.com/docker/docker/pull/21306), [#21373](https://github.com/docker/docker/pull/21373))
* Allow setting the Domainname and Hostname separately through the API ([#20200](https://github.com/docker/docker/pull/20200))
* Docker info will now warn users if it can not detect the kernel version or the operating system ([#21128](https://github.com/docker/docker/pull/21128))
- Fix an issue where `docker stats --no-stream` output could be all 0s ([#20803](https://github.com/docker/docker/pull/20803))
- Fix a bug where some newly started container would not appear in a running `docker stats` command ([#20792](https://github.com/docker/docker/pull/20792))
* Post processing is no longer enabled for linux-cgo terminals ([#20587](https://github.com/docker/docker/pull/20587))
- Values to `--hostname` are now refused if they do not comply with [RFC1123](https://tools.ietf.org/html/rfc1123) ([#20566](https://github.com/docker/docker/pull/20566))
+ Docker learned how to use a SOCKS proxy ([#20366](https://github.com/docker/docker/pull/20366), [#18373](https://github.com/docker/docker/pull/18373))
+ Docker now supports external credential stores ([#20107](https://github.com/docker/docker/pull/20107))
* `docker ps` now supports displaying the list of volumes mounted inside a container ([#20017](https://github.com/docker/docker/pull/20017))
* `docker info` now also reports Docker's root directory location ([#19986](https://github.com/docker/docker/pull/19986))
- Docker now prohibits login in with an empty username (spaces are trimmed) ([#19806](https://github.com/docker/docker/pull/19806))
* Docker events attributes are now sorted by key ([#19761](https://github.com/docker/docker/pull/19761))
* `docker ps` no longer shows exported port for stopped containers ([#19483](https://github.com/docker/docker/pull/19483))
- Docker now cleans after itself if a save/export command fails ([#17849](https://github.com/docker/docker/pull/17849))
* Docker load learned how to display a progress bar ([#17329](https://github.com/docker/docker/pull/17329), [#120078](https://github.com/docker/docker/pull/20078))
@z

@x
### Distribution
@y
### Distribution
@z

@x
- Fix a panic that occurred when pulling an image with 0 layers ([#21222](https://github.com/docker/docker/pull/21222))
- Fix a panic that could occur on error while pushing to a registry with a misconfigured token service ([#21212](https://github.com/docker/docker/pull/21212))
+ All first-level delegation roles are now signed when doing a trusted push ([#21046](https://github.com/docker/docker/pull/21046))
+ OAuth support for registries was added ([#20970](https://github.com/docker/docker/pull/20970))
* `docker login` now handles token using the implementation found in [docker/distribution](https://github.com/docker/distribution) ([#20832](https://github.com/docker/docker/pull/20832))
* `docker login` will no longer prompt for an email ([#20565](https://github.com/docker/docker/pull/20565))
* Docker will now fallback to registry V1 if no basic auth credentials are available ([#20241](https://github.com/docker/docker/pull/20241))
* Docker will now try to resume layer download where it left off after a network error/timeout ([#19840](https://github.com/docker/docker/pull/19840))
- Fix generated manifest mediaType when pushing cross-repository ([#19509](https://github.com/docker/docker/pull/19509))
- Fix docker requesting additional push credentials when pulling an image if Content Trust is enabled ([#20382](https://github.com/docker/docker/pull/20382))
@y
- Fix a panic that occurred when pulling an image with 0 layers ([#21222](https://github.com/docker/docker/pull/21222))
- Fix a panic that could occur on error while pushing to a registry with a misconfigured token service ([#21212](https://github.com/docker/docker/pull/21212))
+ All first-level delegation roles are now signed when doing a trusted push ([#21046](https://github.com/docker/docker/pull/21046))
+ OAuth support for registries was added ([#20970](https://github.com/docker/docker/pull/20970))
* `docker login` now handles token using the implementation found in [docker/distribution](https://github.com/docker/distribution) ([#20832](https://github.com/docker/docker/pull/20832))
* `docker login` will no longer prompt for an email ([#20565](https://github.com/docker/docker/pull/20565))
* Docker will now fallback to registry V1 if no basic auth credentials are available ([#20241](https://github.com/docker/docker/pull/20241))
* Docker will now try to resume layer download where it left off after a network error/timeout ([#19840](https://github.com/docker/docker/pull/19840))
- Fix generated manifest mediaType when pushing cross-repository ([#19509](https://github.com/docker/docker/pull/19509))
- Fix docker requesting additional push credentials when pulling an image if Content Trust is enabled ([#20382](https://github.com/docker/docker/pull/20382))
@z

@x
### Logging
@y
### Logging
@z

@x
- Fix a race in the journald log driver ([#21311](https://github.com/docker/docker/pull/21311))
* Docker syslog driver now uses the RFC-5424 format when emitting logs ([#20121](https://github.com/docker/docker/pull/20121))
* Docker GELF log driver now allows to specify the compression algorithm and level via the `gelf-compression-type` and `gelf-compression-level` options ([#19831](https://github.com/docker/docker/pull/19831))
* Docker daemon learned to output uncolorized logs via the `--raw-logs` options ([#19794](https://github.com/docker/docker/pull/19794))
+ Docker, on Windows platform, now includes an ETW (Event Tracing in Windows) logging driver named `etwlogs` ([#19689](https://github.com/docker/docker/pull/19689))
* Journald log driver learned how to handle tags ([#19564](https://github.com/docker/docker/pull/19564))
+ The fluentd log driver learned the following options: `fluentd-address`, `fluentd-buffer-limit`, `fluentd-retry-wait`, `fluentd-max-retries` and `fluentd-async-connect` ([#19439](https://github.com/docker/docker/pull/19439))
+ Docker learned to send log to Google Cloud via the new `gcplogs` logging driver. ([#18766](https://github.com/docker/docker/pull/18766))
@y
- Fix a race in the journald log driver ([#21311](https://github.com/docker/docker/pull/21311))
* Docker syslog driver now uses the RFC-5424 format when emitting logs ([#20121](https://github.com/docker/docker/pull/20121))
* Docker GELF log driver now allows to specify the compression algorithm and level via the `gelf-compression-type` and `gelf-compression-level` options ([#19831](https://github.com/docker/docker/pull/19831))
* Docker daemon learned to output uncolorized logs via the `--raw-logs` options ([#19794](https://github.com/docker/docker/pull/19794))
+ Docker, on Windows platform, now includes an ETW (Event Tracing in Windows) logging driver named `etwlogs` ([#19689](https://github.com/docker/docker/pull/19689))
* Journald log driver learned how to handle tags ([#19564](https://github.com/docker/docker/pull/19564))
+ The fluentd log driver learned the following options: `fluentd-address`, `fluentd-buffer-limit`, `fluentd-retry-wait`, `fluentd-max-retries` and `fluentd-async-connect` ([#19439](https://github.com/docker/docker/pull/19439))
+ Docker learned to send log to Google Cloud via the new `gcplogs` logging driver. ([#18766](https://github.com/docker/docker/pull/18766))
@z

@x
### Misc
@y
### Misc
@z

@x
+ When saving linked images together with `docker save` a subsequent `docker load` will correctly restore their parent/child relationship ([#21385](https://github.com/docker/docker/pull/21385))
+ Support for building the Docker cli for OpenBSD was added ([#21325](https://github.com/docker/docker/pull/21325))
+ Labels can now be applied at network, volume and image creation ([#21270](https://github.com/docker/docker/pull/21270))
* The `dockremap` is now created as a system user ([#21266](https://github.com/docker/docker/pull/21266))
- Fix a few response body leaks ([#21258](https://github.com/docker/docker/pull/21258))
- Docker, when run as a service with systemd, will now properly manage its processes cgroups ([#20633](https://github.com/docker/docker/pull/20633))
* `docker info` now reports the value of cgroup KernelMemory or emits a warning if it is not supported ([#20863](https://github.com/docker/docker/pull/20863))
* `docker info` now also reports the cgroup driver in use ([#20388](https://github.com/docker/docker/pull/20388))
* Docker completion is now available on PowerShell ([#19894](https://github.com/docker/docker/pull/19894))
* `dockerinit` is no more ([#19490](https://github.com/docker/docker/pull/19490),[#19851](https://github.com/docker/docker/pull/19851))
+ Support for building Docker on arm64 was added ([#19013](https://github.com/docker/docker/pull/19013))
+ Experimental support for building docker.exe in a native Windows Docker installation ([#18348](https://github.com/docker/docker/pull/18348))
@y
+ When saving linked images together with `docker save` a subsequent `docker load` will correctly restore their parent/child relationship ([#21385](https://github.com/docker/docker/pull/21385))
+ Support for building the Docker cli for OpenBSD was added ([#21325](https://github.com/docker/docker/pull/21325))
+ Labels can now be applied at network, volume and image creation ([#21270](https://github.com/docker/docker/pull/21270))
* The `dockremap` is now created as a system user ([#21266](https://github.com/docker/docker/pull/21266))
- Fix a few response body leaks ([#21258](https://github.com/docker/docker/pull/21258))
- Docker, when run as a service with systemd, will now properly manage its processes cgroups ([#20633](https://github.com/docker/docker/pull/20633))
* `docker info` now reports the value of cgroup KernelMemory or emits a warning if it is not supported ([#20863](https://github.com/docker/docker/pull/20863))
* `docker info` now also reports the cgroup driver in use ([#20388](https://github.com/docker/docker/pull/20388))
* Docker completion is now available on PowerShell ([#19894](https://github.com/docker/docker/pull/19894))
* `dockerinit` is no more ([#19490](https://github.com/docker/docker/pull/19490),[#19851](https://github.com/docker/docker/pull/19851))
+ Support for building Docker on arm64 was added ([#19013](https://github.com/docker/docker/pull/19013))
+ Experimental support for building docker.exe in a native Windows Docker installation ([#18348](https://github.com/docker/docker/pull/18348))
@z

@x
### Networking
@y
### Networking
@z

@x
- Fix panic if a node is forcibly removed from the cluster ([#21671](https://github.com/docker/docker/pull/21671))
- Fix "error creating vxlan interface" when starting a container in a Swarm cluster ([#21671](https://github.com/docker/docker/pull/21671))
* `docker network inspect` will now report all endpoints whether they have an active container or not ([#21160](https://github.com/docker/docker/pull/21160))
+ Experimental support for the MacVlan and IPVlan network drivers has been added ([#21122](https://github.com/docker/docker/pull/21122))
* Output of `docker network ls` is now sorted by network name ([#20383](https://github.com/docker/docker/pull/20383))
- Fix a bug where Docker would allow a network to be created with the reserved `default` name ([#19431](https://github.com/docker/docker/pull/19431))
* `docker network inspect` returns whether a network is internal or not ([#19357](https://github.com/docker/docker/pull/19357))
+ Control IPv6 via explicit option when creating a network (`docker network create --ipv6`). This shows up as a new `EnableIPv6` field in `docker network inspect` ([#17513](https://github.com/docker/docker/pull/17513))
* Support for AAAA Records (aka IPv6 Service Discovery) in embedded DNS Server ([#21396](https://github.com/docker/docker/pull/21396))
- Fix to not forward docker domain IPv6 queries to external servers ([#21396](https://github.com/docker/docker/pull/21396))
* Multiple A/AAAA records from embedded DNS Server for DNS Round robin ([#21019](https://github.com/docker/docker/pull/21019))
- Fix endpoint count inconsistency after an ungraceful dameon restart ([#21261](https://github.com/docker/docker/pull/21261))
- Move the ownership of exposed ports and port-mapping options from Endpoint to Sandbox ([#21019](https://github.com/docker/docker/pull/21019))
- Fixed a bug which prevents docker reload when host is configured with ipv6.disable=1 ([#21019](https://github.com/docker/docker/pull/21019))
- Added inbuilt nil IPAM driver ([#21019](https://github.com/docker/docker/pull/21019))
- Fixed bug in iptables.Exists() logic [#21019](https://github.com/docker/docker/pull/21019)
- Fixed a Veth interface leak when using overlay network ([#21019](https://github.com/docker/docker/pull/21019))
- Fixed a bug which prevents docker reload after a network delete during shutdown ([#20214](https://github.com/docker/docker/pull/20214))
- Make sure iptables chains are recreated on firewalld reload ([#20419](https://github.com/docker/docker/pull/20419))
- Allow to pass global datastore during config reload ([#20419](https://github.com/docker/docker/pull/20419))
- For anonymous containers use the alias name for IP to name mapping, ie:DNS PTR record ([#21019](https://github.com/docker/docker/pull/21019))
- Fix a panic when deleting an entry from /etc/hosts file  ([#21019](https://github.com/docker/docker/pull/21019))
- Source the forwarded DNS queries from the container net namespace  ([#21019](https://github.com/docker/docker/pull/21019))
- Fix to retain the network internal mode config for bridge networks on daemon reload ([#21780] (https://github.com/docker/docker/pull/21780))
- Fix to retain IPAM driver option configs on daemon reload ([#21914] (https://github.com/docker/docker/pull/21914))
@y
- Fix panic if a node is forcibly removed from the cluster ([#21671](https://github.com/docker/docker/pull/21671))
- Fix "error creating vxlan interface" when starting a container in a Swarm cluster ([#21671](https://github.com/docker/docker/pull/21671))
* `docker network inspect` will now report all endpoints whether they have an active container or not ([#21160](https://github.com/docker/docker/pull/21160))
+ Experimental support for the MacVlan and IPVlan network drivers has been added ([#21122](https://github.com/docker/docker/pull/21122))
* Output of `docker network ls` is now sorted by network name ([#20383](https://github.com/docker/docker/pull/20383))
- Fix a bug where Docker would allow a network to be created with the reserved `default` name ([#19431](https://github.com/docker/docker/pull/19431))
* `docker network inspect` returns whether a network is internal or not ([#19357](https://github.com/docker/docker/pull/19357))
+ Control IPv6 via explicit option when creating a network (`docker network create --ipv6`). This shows up as a new `EnableIPv6` field in `docker network inspect` ([#17513](https://github.com/docker/docker/pull/17513))
* Support for AAAA Records (aka IPv6 Service Discovery) in embedded DNS Server ([#21396](https://github.com/docker/docker/pull/21396))
- Fix to not forward docker domain IPv6 queries to external servers ([#21396](https://github.com/docker/docker/pull/21396))
* Multiple A/AAAA records from embedded DNS Server for DNS Round robin ([#21019](https://github.com/docker/docker/pull/21019))
- Fix endpoint count inconsistency after an ungraceful dameon restart ([#21261](https://github.com/docker/docker/pull/21261))
- Move the ownership of exposed ports and port-mapping options from Endpoint to Sandbox ([#21019](https://github.com/docker/docker/pull/21019))
- Fixed a bug which prevents docker reload when host is configured with ipv6.disable=1 ([#21019](https://github.com/docker/docker/pull/21019))
- Added inbuilt nil IPAM driver ([#21019](https://github.com/docker/docker/pull/21019))
- Fixed bug in iptables.Exists() logic [#21019](https://github.com/docker/docker/pull/21019)
- Fixed a Veth interface leak when using overlay network ([#21019](https://github.com/docker/docker/pull/21019))
- Fixed a bug which prevents docker reload after a network delete during shutdown ([#20214](https://github.com/docker/docker/pull/20214))
- Make sure iptables chains are recreated on firewalld reload ([#20419](https://github.com/docker/docker/pull/20419))
- Allow to pass global datastore during config reload ([#20419](https://github.com/docker/docker/pull/20419))
- For anonymous containers use the alias name for IP to name mapping, ie:DNS PTR record ([#21019](https://github.com/docker/docker/pull/21019))
- Fix a panic when deleting an entry from /etc/hosts file  ([#21019](https://github.com/docker/docker/pull/21019))
- Source the forwarded DNS queries from the container net namespace  ([#21019](https://github.com/docker/docker/pull/21019))
- Fix to retain the network internal mode config for bridge networks on daemon reload ([#21780] (https://github.com/docker/docker/pull/21780))
- Fix to retain IPAM driver option configs on daemon reload ([#21914] (https://github.com/docker/docker/pull/21914))
@z

@x
### Plugins
@y
### Plugins
@z

@x
- Fix a file descriptor leak that would occur every time plugins were enumerated ([#20686](https://github.com/docker/docker/pull/20686))
- Fix an issue where Authz plugin would corrupt the payload body when faced with a large amount of data ([#20602](https://github.com/docker/docker/pull/20602))
@y
- Fix a file descriptor leak that would occur every time plugins were enumerated ([#20686](https://github.com/docker/docker/pull/20686))
- Fix an issue where Authz plugin would corrupt the payload body when faced with a large amount of data ([#20602](https://github.com/docker/docker/pull/20602))
@z

@x
### Runtime
@y
### Runtime
@z

@x
- Fix a panic that could occur when cleanup after a container started with invalid parameters ([#21716](https://github.com/docker/docker/pull/21716))
- Fix a race with event timers stopping early ([#21692](https://github.com/docker/docker/pull/21692))
- Fix race conditions in the layer store, potentially corrupting the map and crashing the process ([#21677](https://github.com/docker/docker/pull/21677))
- Un-deprecate auto-creation of host directories for mounts. This feature was marked deprecated in ([#21666](https://github.com/docker/docker/pull/21666))
  Docker 1.9, but was decided to be too much of a backward-incompatible change, so it was decided to keep the feature.
+ It is now possible for containers to share the NET and IPC namespaces when `userns` is enabled ([#21383](https://github.com/docker/docker/pull/21383))
+ `docker inspect <image-id>` will now expose the rootfs layers ([#21370](https://github.com/docker/docker/pull/21370))
+ Docker Windows gained a minimal `top` implementation ([#21354](https://github.com/docker/docker/pull/21354))
* Docker learned to report the faulty exe when a container cannot be started due to its condition ([#21345](https://github.com/docker/docker/pull/21345))
* Docker with device mapper will now refuse to run if `udev sync` is not available ([#21097](https://github.com/docker/docker/pull/21097))
- Fix a bug where Docker would not validate the config file upon configuration reload ([#21089](https://github.com/docker/docker/pull/21089))
- Fix a hang that would happen on attach if initial start was to fail ([#21048](https://github.com/docker/docker/pull/21048))
- Fix an issue where registry service options in the daemon configuration file were not properly taken into account ([#21045](https://github.com/docker/docker/pull/21045))
- Fix a race between the exec and resize operations ([#21022](https://github.com/docker/docker/pull/21022))
- Fix an issue where nanoseconds were not correctly taken in account when filtering Docker events ([#21013](https://github.com/docker/docker/pull/21013))
- Fix the handling of Docker command when passed a 64 bytes id ([#21002](https://github.com/docker/docker/pull/21002))
* Docker will now return a `204` (i.e http.StatusNoContent) code when it successfully deleted a network ([#20977](https://github.com/docker/docker/pull/20977))
- Fix a bug where the daemon would wait indefinitely in case the process it was about to killed had already exited on its own ([#20967](https://github.com/docker/docker/pull/20967)
* The devmapper driver learned the `dm.min_free_space` option. If the mapped device free space reaches the passed value, new device creation will be prohibited. ([#20786](https://github.com/docker/docker/pull/20786))
+ Docker can now prevent processes in container to gain new privileges via the `--security-opt=no-new-privileges` flag ([#20727](https://github.com/docker/docker/pull/20727))
- Starting a container with the `--device` option will now correctly resolves symlinks ([#20684](https://github.com/docker/docker/pull/20684))
+ Docker now relies on [`containerd`](https://github.com/docker/containerd) and [`runc`](https://github.com/opencontainers/runc) to spawn containers. ([#20662](https://github.com/docker/docker/pull/20662))
- Fix docker configuration reloading to only alter value present in the given config file ([#20604](https://github.com/docker/docker/pull/20604))
+ Docker now allows setting a container hostname via the `--hostname` flag when `--net=host` ([#20177](https://github.com/docker/docker/pull/20177))
+ Docker now allows executing privileged container while running with `--userns-remap` if both `--privileged` and the new `--userns=host` flag are specified ([#20111](https://github.com/docker/docker/pull/20111))
- Fix Docker not cleaning up correctly old containers upon restarting after a crash ([#19679](https://github.com/docker/docker/pull/19679))
* Docker will now error out if it doesn't recognize a configuration key within the config file ([#19517](https://github.com/docker/docker/pull/19517))
- Fix container loading, on daemon startup, when they depends on a plugin running within a container ([#19500](https://github.com/docker/docker/pull/19500))
* `docker update` learned how to change a container restart policy ([#19116](https://github.com/docker/docker/pull/19116))
* `docker inspect` now also returns a new `State` field containing the container state in a human readable way (i.e. one of `created`, `restarting`, `running`, `paused`, `exited` or `dead`)([#18966](https://github.com/docker/docker/pull/18966))
+ Docker learned to limit the number of active pids (i.e. processes) within the container via the `pids-limit` flags. NOTE: This requires `CGROUP_PIDS=y` to be in the kernel configuration. ([#18697](https://github.com/docker/docker/pull/18697))
- `docker load` now has a `--quiet` option to suppress the load output ([#20078](https://github.com/docker/docker/pull/20078))
- Fix a bug in neighbor discovery for IPv6 peers ([#20842](https://github.com/docker/docker/pull/20842))
- Fix a panic during cleanup if a container was started with invalid options ([#21802](https://github.com/docker/docker/pull/21802))
- Fix a situation where a container cannot be stopped if the terminal is closed ([#21840](https://github.com/docker/docker/pull/21840))
@y
- Fix a panic that could occur when cleanup after a container started with invalid parameters ([#21716](https://github.com/docker/docker/pull/21716))
- Fix a race with event timers stopping early ([#21692](https://github.com/docker/docker/pull/21692))
- Fix race conditions in the layer store, potentially corrupting the map and crashing the process ([#21677](https://github.com/docker/docker/pull/21677))
- Un-deprecate auto-creation of host directories for mounts. This feature was marked deprecated in ([#21666](https://github.com/docker/docker/pull/21666))
  Docker 1.9, but was decided to be too much of a backward-incompatible change, so it was decided to keep the feature.
+ It is now possible for containers to share the NET and IPC namespaces when `userns` is enabled ([#21383](https://github.com/docker/docker/pull/21383))
+ `docker inspect <image-id>` will now expose the rootfs layers ([#21370](https://github.com/docker/docker/pull/21370))
+ Docker Windows gained a minimal `top` implementation ([#21354](https://github.com/docker/docker/pull/21354))
* Docker learned to report the faulty exe when a container cannot be started due to its condition ([#21345](https://github.com/docker/docker/pull/21345))
* Docker with device mapper will now refuse to run if `udev sync` is not available ([#21097](https://github.com/docker/docker/pull/21097))
- Fix a bug where Docker would not validate the config file upon configuration reload ([#21089](https://github.com/docker/docker/pull/21089))
- Fix a hang that would happen on attach if initial start was to fail ([#21048](https://github.com/docker/docker/pull/21048))
- Fix an issue where registry service options in the daemon configuration file were not properly taken into account ([#21045](https://github.com/docker/docker/pull/21045))
- Fix a race between the exec and resize operations ([#21022](https://github.com/docker/docker/pull/21022))
- Fix an issue where nanoseconds were not correctly taken in account when filtering Docker events ([#21013](https://github.com/docker/docker/pull/21013))
- Fix the handling of Docker command when passed a 64 bytes id ([#21002](https://github.com/docker/docker/pull/21002))
* Docker will now return a `204` (i.e http.StatusNoContent) code when it successfully deleted a network ([#20977](https://github.com/docker/docker/pull/20977))
- Fix a bug where the daemon would wait indefinitely in case the process it was about to killed had already exited on its own ([#20967](https://github.com/docker/docker/pull/20967)
* The devmapper driver learned the `dm.min_free_space` option. If the mapped device free space reaches the passed value, new device creation will be prohibited. ([#20786](https://github.com/docker/docker/pull/20786))
+ Docker can now prevent processes in container to gain new privileges via the `--security-opt=no-new-privileges` flag ([#20727](https://github.com/docker/docker/pull/20727))
- Starting a container with the `--device` option will now correctly resolves symlinks ([#20684](https://github.com/docker/docker/pull/20684))
+ Docker now relies on [`containerd`](https://github.com/docker/containerd) and [`runc`](https://github.com/opencontainers/runc) to spawn containers. ([#20662](https://github.com/docker/docker/pull/20662))
- Fix docker configuration reloading to only alter value present in the given config file ([#20604](https://github.com/docker/docker/pull/20604))
+ Docker now allows setting a container hostname via the `--hostname` flag when `--net=host` ([#20177](https://github.com/docker/docker/pull/20177))
+ Docker now allows executing privileged container while running with `--userns-remap` if both `--privileged` and the new `--userns=host` flag are specified ([#20111](https://github.com/docker/docker/pull/20111))
- Fix Docker not cleaning up correctly old containers upon restarting after a crash ([#19679](https://github.com/docker/docker/pull/19679))
* Docker will now error out if it doesn't recognize a configuration key within the config file ([#19517](https://github.com/docker/docker/pull/19517))
- Fix container loading, on daemon startup, when they depends on a plugin running within a container ([#19500](https://github.com/docker/docker/pull/19500))
* `docker update` learned how to change a container restart policy ([#19116](https://github.com/docker/docker/pull/19116))
* `docker inspect` now also returns a new `State` field containing the container state in a human readable way (i.e. one of `created`, `restarting`, `running`, `paused`, `exited` or `dead`)([#18966](https://github.com/docker/docker/pull/18966))
+ Docker learned to limit the number of active pids (i.e. processes) within the container via the `pids-limit` flags. NOTE: This requires `CGROUP_PIDS=y` to be in the kernel configuration. ([#18697](https://github.com/docker/docker/pull/18697))
- `docker load` now has a `--quiet` option to suppress the load output ([#20078](https://github.com/docker/docker/pull/20078))
- Fix a bug in neighbor discovery for IPv6 peers ([#20842](https://github.com/docker/docker/pull/20842))
- Fix a panic during cleanup if a container was started with invalid options ([#21802](https://github.com/docker/docker/pull/21802))
- Fix a situation where a container cannot be stopped if the terminal is closed ([#21840](https://github.com/docker/docker/pull/21840))
@z

@x
### Security
@y
### Security
@z

@x
* Object with the `pcp_pmcd_t` selinux type were given management access to `/var/lib/docker(/.*)?` ([#21370](https://github.com/docker/docker/pull/21370))
* `restart_syscall`, `copy_file_range`, `mlock2` joined the list of allowed calls in the default seccomp profile ([#21117](https://github.com/docker/docker/pull/21117), [#21262](https://github.com/docker/docker/pull/21262))
* `send`, `recv` and `x32` were added to the list of allowed syscalls and arch in the default seccomp profile ([#19432](https://github.com/docker/docker/pull/19432))
* Docker Content Trust now requests the server to perform snapshot signing ([#21046](https://github.com/docker/docker/pull/21046))
* Support for using YubiKeys for Content Trust signing has been moved out of experimental ([#21591](https://github.com/docker/docker/pull/21591))
@y
* Object with the `pcp_pmcd_t` selinux type were given management access to `/var/lib/docker(/.*)?` ([#21370](https://github.com/docker/docker/pull/21370))
* `restart_syscall`, `copy_file_range`, `mlock2` joined the list of allowed calls in the default seccomp profile ([#21117](https://github.com/docker/docker/pull/21117), [#21262](https://github.com/docker/docker/pull/21262))
* `send`, `recv` and `x32` were added to the list of allowed syscalls and arch in the default seccomp profile ([#19432](https://github.com/docker/docker/pull/19432))
* Docker Content Trust now requests the server to perform snapshot signing ([#21046](https://github.com/docker/docker/pull/21046))
* Support for using YubiKeys for Content Trust signing has been moved out of experimental ([#21591](https://github.com/docker/docker/pull/21591))
@z

@x
### Volumes
@y
### Volumes
@z

@x
* Output of `docker volume ls` is now sorted by volume name ([#20389](https://github.com/docker/docker/pull/20389))
* Local volumes can now accept options similar to the unix `mount` tool ([#20262](https://github.com/docker/docker/pull/20262))
- Fix an issue where one letter directory name could not be used as source for volumes ([#21106](https://github.com/docker/docker/pull/21106))
+ `docker run -v` now accepts a new flag `nocopy`. This tells the runtime not to copy the container path content into the volume (which is the default behavior) ([#21223](https://github.com/docker/docker/pull/21223))
@y
* Output of `docker volume ls` is now sorted by volume name ([#20389](https://github.com/docker/docker/pull/20389))
* Local volumes can now accept options similar to the unix `mount` tool ([#20262](https://github.com/docker/docker/pull/20262))
- Fix an issue where one letter directory name could not be used as source for volumes ([#21106](https://github.com/docker/docker/pull/21106))
+ `docker run -v` now accepts a new flag `nocopy`. This tells the runtime not to copy the container path content into the volume (which is the default behavior) ([#21223](https://github.com/docker/docker/pull/21223))
@z

@x
## 1.10.3 (2016-03-10)
@y
## 1.10.3 (2016-03-10)
@z

@x
### Runtime
@y
### Runtime
@z

@x
- Fix Docker client exiting with an "Unrecognized input header" error [#20706](https://github.com/docker/docker/pull/20706)
- Fix Docker exiting if Exec is started with both `AttachStdin` and `Detach` [#20647](https://github.com/docker/docker/pull/20647)
@y
- Fix Docker client exiting with an "Unrecognized input header" error [#20706](https://github.com/docker/docker/pull/20706)
- Fix Docker exiting if Exec is started with both `AttachStdin` and `Detach` [#20647](https://github.com/docker/docker/pull/20647)
@z

@x
### Distribution
@y
### Distribution
@z

@x
- Fix a crash when pushing multiple images sharing the same layers to the same repository in parallel [#20831](https://github.com/docker/docker/pull/20831)
- Fix a panic when pushing images to a registry which uses a misconfigured token service [#21030](https://github.com/docker/docker/pull/21030)
@y
- Fix a crash when pushing multiple images sharing the same layers to the same repository in parallel [#20831](https://github.com/docker/docker/pull/20831)
- Fix a panic when pushing images to a registry which uses a misconfigured token service [#21030](https://github.com/docker/docker/pull/21030)
@z

@x
### Plugin system
@y
### Plugin system
@z

@x
- Fix issue preventing volume plugins to start when SELinux is enabled [#20834](https://github.com/docker/docker/pull/20834)
- Prevent Docker from exiting if a volume plugin returns a null response for Get requests [#20682](https://github.com/docker/docker/pull/20682)
- Fix plugin system leaking file descriptors if a plugin has an error [#20680](https://github.com/docker/docker/pull/20680)
@y
- Fix issue preventing volume plugins to start when SELinux is enabled [#20834](https://github.com/docker/docker/pull/20834)
- Prevent Docker from exiting if a volume plugin returns a null response for Get requests [#20682](https://github.com/docker/docker/pull/20682)
- Fix plugin system leaking file descriptors if a plugin has an error [#20680](https://github.com/docker/docker/pull/20680)
@z

@x
### Security
@y
### Security
@z

@x
- Fix linux32 emulation to fail during docker build [#20672](https://github.com/docker/docker/pull/20672)
  It was due to the `personality` syscall being blocked by the default seccomp profile.
- Fix Oracle XE 10g failing to start in a container [#20981](https://github.com/docker/docker/pull/20981)
  It was due to the `ipc` syscall being blocked by the default seccomp profile.
- Fix user namespaces not working on Linux From Scratch [#20685](https://github.com/docker/docker/pull/20685)
- Fix issue preventing daemon to start if userns is enabled and the `subuid` or `subgid` files contain comments [#20725](https://github.com/docker/docker/pull/20725)
@y
- Fix linux32 emulation to fail during docker build [#20672](https://github.com/docker/docker/pull/20672)
  It was due to the `personality` syscall being blocked by the default seccomp profile.
- Fix Oracle XE 10g failing to start in a container [#20981](https://github.com/docker/docker/pull/20981)
  It was due to the `ipc` syscall being blocked by the default seccomp profile.
- Fix user namespaces not working on Linux From Scratch [#20685](https://github.com/docker/docker/pull/20685)
- Fix issue preventing daemon to start if userns is enabled and the `subuid` or `subgid` files contain comments [#20725](https://github.com/docker/docker/pull/20725)
@z

@x
## 1.10.2 (2016-02-22)
@y
## 1.10.2 (2016-02-22)
@z

@x
### Runtime
@y
### Runtime
@z

@x
- Prevent systemd from deleting containers' cgroups when its configuration is reloaded [#20518](https://github.com/docker/docker/pull/20518)
- Fix SELinux issues by disregarding `--read-only` when mounting `/dev/mqueue` [#20333](https://github.com/docker/docker/pull/20333)
- Fix chown permissions used during `docker cp` when userns is used [#20446](https://github.com/docker/docker/pull/20446)
- Fix configuration loading issue with all booleans defaulting to `true` [#20471](https://github.com/docker/docker/pull/20471)
- Fix occasional panic with `docker logs -f` [#20522](https://github.com/docker/docker/pull/20522)
@y
- Prevent systemd from deleting containers' cgroups when its configuration is reloaded [#20518](https://github.com/docker/docker/pull/20518)
- Fix SELinux issues by disregarding `--read-only` when mounting `/dev/mqueue` [#20333](https://github.com/docker/docker/pull/20333)
- Fix chown permissions used during `docker cp` when userns is used [#20446](https://github.com/docker/docker/pull/20446)
- Fix configuration loading issue with all booleans defaulting to `true` [#20471](https://github.com/docker/docker/pull/20471)
- Fix occasional panic with `docker logs -f` [#20522](https://github.com/docker/docker/pull/20522)
@z

@x
### Distribution
@y
### Distribution
@z

@x
- Keep layer reference if deletion failed to avoid a badly inconsistent state [#20513](https://github.com/docker/docker/pull/20513)
- Handle gracefully a corner case when canceling migration [#20372](https://github.com/docker/docker/pull/20372)
- Fix docker import on compressed data [#20367](https://github.com/docker/docker/pull/20367)
- Fix tar-split files corruption during migration that later cause docker push and docker save to fail [#20458](https://github.com/docker/docker/pull/20458)
@y
- Keep layer reference if deletion failed to avoid a badly inconsistent state [#20513](https://github.com/docker/docker/pull/20513)
- Handle gracefully a corner case when canceling migration [#20372](https://github.com/docker/docker/pull/20372)
- Fix docker import on compressed data [#20367](https://github.com/docker/docker/pull/20367)
- Fix tar-split files corruption during migration that later cause docker push and docker save to fail [#20458](https://github.com/docker/docker/pull/20458)
@z

@x
### Networking
@y
### Networking
@z

@x
- Fix daemon crash if embedded DNS is sent garbage [#20510](https://github.com/docker/docker/pull/20510)
@y
- Fix daemon crash if embedded DNS is sent garbage [#20510](https://github.com/docker/docker/pull/20510)
@z

@x
### Volumes
@y
### Volumes
@z

@x
- Fix issue with multiple volume references with same name [#20381](https://github.com/docker/docker/pull/20381)
@y
- Fix issue with multiple volume references with same name [#20381](https://github.com/docker/docker/pull/20381)
@z

@x
### Security
@y
### Security
@z

@x
- Fix potential cache corruption and delegation conflict issues [#20523](https://github.com/docker/docker/pull/20523)
@y
- Fix potential cache corruption and delegation conflict issues [#20523](https://github.com/docker/docker/pull/20523)
@z

@x
## 1.10.1 (2016-02-11)
@y
## 1.10.1 (2016-02-11)
@z

@x
### Runtime
@y
### Runtime
@z

@x
* Do not stop daemon on migration hard failure [#20156](https://github.com/docker/docker/pull/20156)
- Fix various issues with migration to content-addressable images [#20058](https://github.com/docker/docker/pull/20058)
- Fix ZFS permission bug with user namespaces [#20045](https://github.com/docker/docker/pull/20045)
- Do not leak /dev/mqueue from the host to all containers, keep it container-specific [#19876](https://github.com/docker/docker/pull/19876) [#20133](https://github.com/docker/docker/pull/20133)
- Fix `docker ps --filter before=...` to not show stopped containers without providing `-a` flag [#20135](https://github.com/docker/docker/pull/20135)
@y
* Do not stop daemon on migration hard failure [#20156](https://github.com/docker/docker/pull/20156)
- Fix various issues with migration to content-addressable images [#20058](https://github.com/docker/docker/pull/20058)
- Fix ZFS permission bug with user namespaces [#20045](https://github.com/docker/docker/pull/20045)
- Do not leak /dev/mqueue from the host to all containers, keep it container-specific [#19876](https://github.com/docker/docker/pull/19876) [#20133](https://github.com/docker/docker/pull/20133)
- Fix `docker ps --filter before=...` to not show stopped containers without providing `-a` flag [#20135](https://github.com/docker/docker/pull/20135)
@z

@x
### Security
@y
### Security
@z

@x
- Fix issue preventing docker events to work properly with authorization plugin [#20002](https://github.com/docker/docker/pull/20002)
@y
- Fix issue preventing docker events to work properly with authorization plugin [#20002](https://github.com/docker/docker/pull/20002)
@z

@x
### Distribution
@y
### Distribution
@z

@x
* Add additional verifications and prevent from uploading invalid data to registries [#20164](https://github.com/docker/docker/pull/20164)
- Fix regression preventing uppercase characters in image reference hostname [#20175](https://github.com/docker/docker/pull/20175)
@y
* Add additional verifications and prevent from uploading invalid data to registries [#20164](https://github.com/docker/docker/pull/20164)
- Fix regression preventing uppercase characters in image reference hostname [#20175](https://github.com/docker/docker/pull/20175)
@z

@x
### Networking
@y
### Networking
@z

@x
- Fix embedded DNS for user-defined networks in the presence of firewalld [#20060](https://github.com/docker/docker/pull/20060)
- Fix issue where removing a network during shutdown left Docker inoperable [#20181](https://github.com/docker/docker/issues/20181) [#20235](https://github.com/docker/docker/issues/20235)
- Embedded DNS is now able to return compressed results [#20181](https://github.com/docker/docker/issues/20181)
- Fix port-mapping issue with `userland-proxy=false` [#20181](https://github.com/docker/docker/issues/20181)
@y
- Fix embedded DNS for user-defined networks in the presence of firewalld [#20060](https://github.com/docker/docker/pull/20060)
- Fix issue where removing a network during shutdown left Docker inoperable [#20181](https://github.com/docker/docker/issues/20181) [#20235](https://github.com/docker/docker/issues/20235)
- Embedded DNS is now able to return compressed results [#20181](https://github.com/docker/docker/issues/20181)
- Fix port-mapping issue with `userland-proxy=false` [#20181](https://github.com/docker/docker/issues/20181)
@z

@x
### Logging
@y
### Logging
@z

@x
- Fix bug where tcp+tls protocol would be rejected [#20109](https://github.com/docker/docker/pull/20109)
@y
- Fix bug where tcp+tls protocol would be rejected [#20109](https://github.com/docker/docker/pull/20109)
@z

@x
### Volumes
@y
### Volumes
@z

@x
- Fix issue whereby older volume drivers would not receive volume options [#19983](https://github.com/docker/docker/pull/19983)
@y
- Fix issue whereby older volume drivers would not receive volume options [#19983](https://github.com/docker/docker/pull/19983)
@z

@x
### Misc
@y
### Misc
@z

@x
- Remove TasksMax from Docker systemd service [#20167](https://github.com/docker/docker/pull/20167)
@y
- Remove TasksMax from Docker systemd service [#20167](https://github.com/docker/docker/pull/20167)
@z

@x
## 1.10.0 (2016-02-04)
@y
## 1.10.0 (2016-02-04)
@z

@x
> [!IMPORTANT]
>
> Docker 1.10 uses a new content-addressable storage for images and layers.
@y
> [!IMPORTANT]
>
> Docker 1.10 uses a new content-addressable storage for images and layers.
@z

@x
A migration is performed the first time `docker` is run, and can take a significant amount of time depending on the number of images present. Refer to this page on the wiki for more information: https://github.com/docker/docker/wiki/Engine-v1.10.0-content-addressability-migration
We also released a cool migration utility that enables you to perform the migration before updating to reduce downtime.
Engine 1.10 migrator can be found on Docker Hub: https://hub.docker.com/r/docker/v1.10-migrator/
@y
A migration is performed the first time `docker` is run, and can take a significant amount of time depending on the number of images present. Refer to this page on the wiki for more information: https://github.com/docker/docker/wiki/Engine-v1.10.0-content-addressability-migration
We also released a cool migration utility that enables you to perform the migration before updating to reduce downtime.
Engine 1.10 migrator can be found on Docker Hub: https://hub.docker.com/r/docker/v1.10-migrator/
@z

@x
### Runtime
@y
### Runtime
@z

@x
+ New `docker update` command that allows updating resource constraints on running containers [#15078](https://github.com/docker/docker/pull/15078)
+ Add `--tmpfs` flag to `docker run` to create a tmpfs mount in a container [#13587](https://github.com/docker/docker/pull/13587)
+ Add `--format` flag to `docker images` command [#17692](https://github.com/docker/docker/pull/17692)
+ Allow to set daemon configuration in a file and hot-reload it with the `SIGHUP` signal [#18587](https://github.com/docker/docker/pull/18587)
+ Updated docker events to include more meta-data and event types [#18888](https://github.com/docker/docker/pull/18888)
  This change is backward compatible in the API, but not on the CLI.
+ Add `--blkio-weight-device` flag to `docker run` [#13959](https://github.com/docker/docker/pull/13959)
+ Add `--device-read-bps` and `--device-write-bps` flags to `docker run` [#14466](https://github.com/docker/docker/pull/14466)
+ Add `--device-read-iops` and `--device-write-iops` flags to `docker run` [#15879](https://github.com/docker/docker/pull/15879)
+ Add `--oom-score-adj` flag to `docker run` [#16277](https://github.com/docker/docker/pull/16277)
+ Add `--detach-keys` flag to `attach`, `run`, `start` and `exec` commands to override the default key sequence that detaches from a container  [#15666](https://github.com/docker/docker/pull/15666)
+ Add `--shm-size` flag to `run`, `create` and `build` to set the size of `/dev/shm` [#16168](https://github.com/docker/docker/pull/16168)
+ Show the number of running, stopped, and paused containers in `docker info` [#19249](https://github.com/docker/docker/pull/19249)
+ Show the `OSType` and `Architecture` in `docker info` [#17478](https://github.com/docker/docker/pull/17478)
+ Add `--cgroup-parent` flag on `daemon` to set cgroup parent for all containers [#19062](https://github.com/docker/docker/pull/19062)
+ Add `-L` flag to docker cp to follow symlinks [#16613](https://github.com/docker/docker/pull/16613)
+ New `status=dead` filter for `docker ps` [#17908](https://github.com/docker/docker/pull/17908)
* Change `docker run` exit codes to distinguish between runtime and application errors [#14012](https://github.com/docker/docker/pull/14012)
* Enhance `docker events --since` and `--until` to support nanoseconds and timezones [#17495](https://github.com/docker/docker/pull/17495)
* Add `--all`/`-a` flag to `stats` to include both running and stopped containers [#16742](https://github.com/docker/docker/pull/16742)
* Change the default cgroup-driver to `cgroupfs` [#17704](https://github.com/docker/docker/pull/17704)
* Emit a "tag" event when tagging an image with `build -t` [#17115](https://github.com/docker/docker/pull/17115)
* Best effort for linked containers' start order when starting the daemon [#18208](https://github.com/docker/docker/pull/18208)
* Add ability to add multiple tags on `build` [#15780](https://github.com/docker/docker/pull/15780)
* Permit `OPTIONS` request against any url, thus fixing issue with CORS [#19569](https://github.com/docker/docker/pull/19569)
- Fix the `--quiet` flag on `docker build` to actually be quiet [#17428](https://github.com/docker/docker/pull/17428)
- Fix `docker images --filter dangling=false` to now show all non-dangling images [#19326](https://github.com/docker/docker/pull/19326)
- Fix race condition causing autorestart turning off on restart [#17629](https://github.com/docker/docker/pull/17629)
- Recognize GPFS filesystems [#19216](https://github.com/docker/docker/pull/19216)
- Fix obscure bug preventing to start containers [#19751](https://github.com/docker/docker/pull/19751)
- Forbid `exec` during container restart [#19722](https://github.com/docker/docker/pull/19722)
- devicemapper: Increasing `--storage-opt dm.basesize` will now increase the base device size on daemon restart [#19123](https://github.com/docker/docker/pull/19123)
@y
+ New `docker update` command that allows updating resource constraints on running containers [#15078](https://github.com/docker/docker/pull/15078)
+ Add `--tmpfs` flag to `docker run` to create a tmpfs mount in a container [#13587](https://github.com/docker/docker/pull/13587)
+ Add `--format` flag to `docker images` command [#17692](https://github.com/docker/docker/pull/17692)
+ Allow to set daemon configuration in a file and hot-reload it with the `SIGHUP` signal [#18587](https://github.com/docker/docker/pull/18587)
+ Updated docker events to include more meta-data and event types [#18888](https://github.com/docker/docker/pull/18888)
  This change is backward compatible in the API, but not on the CLI.
+ Add `--blkio-weight-device` flag to `docker run` [#13959](https://github.com/docker/docker/pull/13959)
+ Add `--device-read-bps` and `--device-write-bps` flags to `docker run` [#14466](https://github.com/docker/docker/pull/14466)
+ Add `--device-read-iops` and `--device-write-iops` flags to `docker run` [#15879](https://github.com/docker/docker/pull/15879)
+ Add `--oom-score-adj` flag to `docker run` [#16277](https://github.com/docker/docker/pull/16277)
+ Add `--detach-keys` flag to `attach`, `run`, `start` and `exec` commands to override the default key sequence that detaches from a container  [#15666](https://github.com/docker/docker/pull/15666)
+ Add `--shm-size` flag to `run`, `create` and `build` to set the size of `/dev/shm` [#16168](https://github.com/docker/docker/pull/16168)
+ Show the number of running, stopped, and paused containers in `docker info` [#19249](https://github.com/docker/docker/pull/19249)
+ Show the `OSType` and `Architecture` in `docker info` [#17478](https://github.com/docker/docker/pull/17478)
+ Add `--cgroup-parent` flag on `daemon` to set cgroup parent for all containers [#19062](https://github.com/docker/docker/pull/19062)
+ Add `-L` flag to docker cp to follow symlinks [#16613](https://github.com/docker/docker/pull/16613)
+ New `status=dead` filter for `docker ps` [#17908](https://github.com/docker/docker/pull/17908)
* Change `docker run` exit codes to distinguish between runtime and application errors [#14012](https://github.com/docker/docker/pull/14012)
* Enhance `docker events --since` and `--until` to support nanoseconds and timezones [#17495](https://github.com/docker/docker/pull/17495)
* Add `--all`/`-a` flag to `stats` to include both running and stopped containers [#16742](https://github.com/docker/docker/pull/16742)
* Change the default cgroup-driver to `cgroupfs` [#17704](https://github.com/docker/docker/pull/17704)
* Emit a "tag" event when tagging an image with `build -t` [#17115](https://github.com/docker/docker/pull/17115)
* Best effort for linked containers' start order when starting the daemon [#18208](https://github.com/docker/docker/pull/18208)
* Add ability to add multiple tags on `build` [#15780](https://github.com/docker/docker/pull/15780)
* Permit `OPTIONS` request against any url, thus fixing issue with CORS [#19569](https://github.com/docker/docker/pull/19569)
- Fix the `--quiet` flag on `docker build` to actually be quiet [#17428](https://github.com/docker/docker/pull/17428)
- Fix `docker images --filter dangling=false` to now show all non-dangling images [#19326](https://github.com/docker/docker/pull/19326)
- Fix race condition causing autorestart turning off on restart [#17629](https://github.com/docker/docker/pull/17629)
- Recognize GPFS filesystems [#19216](https://github.com/docker/docker/pull/19216)
- Fix obscure bug preventing to start containers [#19751](https://github.com/docker/docker/pull/19751)
- Forbid `exec` during container restart [#19722](https://github.com/docker/docker/pull/19722)
- devicemapper: Increasing `--storage-opt dm.basesize` will now increase the base device size on daemon restart [#19123](https://github.com/docker/docker/pull/19123)
@z

@x
### Security
@y
### Security
@z

@x
+ Add `--userns-remap` flag to `daemon` to support user namespaces (previously in experimental) [#19187](https://github.com/docker/docker/pull/19187)
+ Add support for custom seccomp profiles in `--security-opt` [#17989](https://github.com/docker/docker/pull/17989)
+ Add default seccomp profile [#18780](https://github.com/docker/docker/pull/18780)
+ Add `--authorization-plugin` flag to `daemon` to customize ACLs [#15365](https://github.com/docker/docker/pull/15365)
+ Docker Content Trust now supports the ability to read and write user delegations [#18887](https://github.com/docker/docker/pull/18887)
  This is an optional, opt-in feature that requires the explicit use of the Notary command-line utility in order to be enabled.
  Enabling delegation support in a specific repository will break the ability of Docker 1.9 and 1.8 to pull from that repository, if content trust is enabled.
* Allow SELinux to run in a container when using the BTRFS storage driver [#16452](https://github.com/docker/docker/pull/16452)
@y
+ Add `--userns-remap` flag to `daemon` to support user namespaces (previously in experimental) [#19187](https://github.com/docker/docker/pull/19187)
+ Add support for custom seccomp profiles in `--security-opt` [#17989](https://github.com/docker/docker/pull/17989)
+ Add default seccomp profile [#18780](https://github.com/docker/docker/pull/18780)
+ Add `--authorization-plugin` flag to `daemon` to customize ACLs [#15365](https://github.com/docker/docker/pull/15365)
+ Docker Content Trust now supports the ability to read and write user delegations [#18887](https://github.com/docker/docker/pull/18887)
  This is an optional, opt-in feature that requires the explicit use of the Notary command-line utility in order to be enabled.
  Enabling delegation support in a specific repository will break the ability of Docker 1.9 and 1.8 to pull from that repository, if content trust is enabled.
* Allow SELinux to run in a container when using the BTRFS storage driver [#16452](https://github.com/docker/docker/pull/16452)
@z

@x
### Distribution
@y
### Distribution
@z

@x
* Use content-addressable storage for images and layers [#17924](https://github.com/docker/docker/pull/17924)
  A migration is performed the first time docker is run; it can take a significant amount of time depending on the number of images and containers present.
  Images no longer depend on the parent chain but contain a list of layer references.
  `docker load`/`docker save` tarballs now also contain content-addressable image configurations.
  For more information: https://github.com/docker/docker/wiki/Engine-v1.10.0-content-addressability-migration
* Add support for the new [manifest format ("schema2")](https://github.com/docker/distribution/blob/master/docs/spec/manifest-v2-2.md) [#18785](https://github.com/docker/docker/pull/18785)
* Lots of improvements for push and pull: performance++, retries on failed downloads, cancelling on client disconnect [#18353](https://github.com/docker/docker/pull/18353), [#18418](https://github.com/docker/docker/pull/18418), [#19109](https://github.com/docker/docker/pull/19109), [#18353](https://github.com/docker/docker/pull/18353)
* Limit v1 protocol fallbacks [#18590](https://github.com/docker/docker/pull/18590)
- Fix issue where docker could hang indefinitely waiting for a nonexistent process to pull an image [#19743](https://github.com/docker/docker/pull/19743)
@y
* Use content-addressable storage for images and layers [#17924](https://github.com/docker/docker/pull/17924)
  A migration is performed the first time docker is run; it can take a significant amount of time depending on the number of images and containers present.
  Images no longer depend on the parent chain but contain a list of layer references.
  `docker load`/`docker save` tarballs now also contain content-addressable image configurations.
  For more information: https://github.com/docker/docker/wiki/Engine-v1.10.0-content-addressability-migration
* Add support for the new [manifest format ("schema2")](https://github.com/docker/distribution/blob/master/docs/spec/manifest-v2-2.md) [#18785](https://github.com/docker/docker/pull/18785)
* Lots of improvements for push and pull: performance++, retries on failed downloads, cancelling on client disconnect [#18353](https://github.com/docker/docker/pull/18353), [#18418](https://github.com/docker/docker/pull/18418), [#19109](https://github.com/docker/docker/pull/19109), [#18353](https://github.com/docker/docker/pull/18353)
* Limit v1 protocol fallbacks [#18590](https://github.com/docker/docker/pull/18590)
- Fix issue where docker could hang indefinitely waiting for a nonexistent process to pull an image [#19743](https://github.com/docker/docker/pull/19743)
@z

@x
### Networking
@y
### Networking
@z

@x
+ Use DNS-based discovery instead of `/etc/hosts` [#19198](https://github.com/docker/docker/pull/19198)
+ Support for network-scoped alias using `--net-alias` on `run` and `--alias` on `network connect` [#19242](https://github.com/docker/docker/pull/19242)
+ Add `--ip` and `--ip6` on `run` and `network connect` to support custom IP addresses for a container in a network [#19001](https://github.com/docker/docker/pull/19001)
+ Add `--ipam-opt` to `network create` for passing custom IPAM options [#17316](https://github.com/docker/docker/pull/17316)
+ Add `--internal` flag to `network create` to restrict external access to and from the network [#19276](https://github.com/docker/docker/pull/19276)
+ Add `kv.path` option to `--cluster-store-opt` [#19167](https://github.com/docker/docker/pull/19167)
+ Add `discovery.heartbeat` and `discovery.ttl` options to `--cluster-store-opt` to configure discovery TTL and heartbeat timer [#18204](https://github.com/docker/docker/pull/18204)
+ Add `--format` flag to `network inspect` [#17481](https://github.com/docker/docker/pull/17481)
+ Add `--link` to `network connect` to provide a container-local alias [#19229](https://github.com/docker/docker/pull/19229)
+ Support for Capability exchange with remote IPAM plugins [#18775](https://github.com/docker/docker/pull/18775)
+ Add `--force` to `network disconnect` to force container to be disconnected from network [#19317](https://github.com/docker/docker/pull/19317)
* Support for multi-host networking using built-in overlay driver for all engine supported kernels: 3.10+ [#18775](https://github.com/docker/docker/pull/18775)
* `--link` is now supported on `docker run` for containers in user-defined network [#19229](https://github.com/docker/docker/pull/19229)
* Enhance `docker network rm` to allow removing multiple networks [#17489](https://github.com/docker/docker/pull/17489)
* Include container names in `network inspect` [#17615](https://github.com/docker/docker/pull/17615)
* Include auto-generated subnets for user-defined networks in `network inspect` [#17316](https://github.com/docker/docker/pull/17316)
* Add `--filter` flag to `network ls` to hide predefined networks [#17782](https://github.com/docker/docker/pull/17782)
* Add support for network connect/disconnect to stopped containers [#18906](https://github.com/docker/docker/pull/18906)
* Add network ID to container inspect [#19323](https://github.com/docker/docker/pull/19323)
- Fix MTU issue where Docker would not start with two or more default routes [#18108](https://github.com/docker/docker/pull/18108)
- Fix duplicate IP address for containers [#18106](https://github.com/docker/docker/pull/18106)
- Fix issue preventing sometimes docker from creating the bridge network [#19338](https://github.com/docker/docker/pull/19338)
- Do not substitute 127.0.0.1 name server when using `--net=host` [#19573](https://github.com/docker/docker/pull/19573)
@y
+ Use DNS-based discovery instead of `/etc/hosts` [#19198](https://github.com/docker/docker/pull/19198)
+ Support for network-scoped alias using `--net-alias` on `run` and `--alias` on `network connect` [#19242](https://github.com/docker/docker/pull/19242)
+ Add `--ip` and `--ip6` on `run` and `network connect` to support custom IP addresses for a container in a network [#19001](https://github.com/docker/docker/pull/19001)
+ Add `--ipam-opt` to `network create` for passing custom IPAM options [#17316](https://github.com/docker/docker/pull/17316)
+ Add `--internal` flag to `network create` to restrict external access to and from the network [#19276](https://github.com/docker/docker/pull/19276)
+ Add `kv.path` option to `--cluster-store-opt` [#19167](https://github.com/docker/docker/pull/19167)
+ Add `discovery.heartbeat` and `discovery.ttl` options to `--cluster-store-opt` to configure discovery TTL and heartbeat timer [#18204](https://github.com/docker/docker/pull/18204)
+ Add `--format` flag to `network inspect` [#17481](https://github.com/docker/docker/pull/17481)
+ Add `--link` to `network connect` to provide a container-local alias [#19229](https://github.com/docker/docker/pull/19229)
+ Support for Capability exchange with remote IPAM plugins [#18775](https://github.com/docker/docker/pull/18775)
+ Add `--force` to `network disconnect` to force container to be disconnected from network [#19317](https://github.com/docker/docker/pull/19317)
* Support for multi-host networking using built-in overlay driver for all engine supported kernels: 3.10+ [#18775](https://github.com/docker/docker/pull/18775)
* `--link` is now supported on `docker run` for containers in user-defined network [#19229](https://github.com/docker/docker/pull/19229)
* Enhance `docker network rm` to allow removing multiple networks [#17489](https://github.com/docker/docker/pull/17489)
* Include container names in `network inspect` [#17615](https://github.com/docker/docker/pull/17615)
* Include auto-generated subnets for user-defined networks in `network inspect` [#17316](https://github.com/docker/docker/pull/17316)
* Add `--filter` flag to `network ls` to hide predefined networks [#17782](https://github.com/docker/docker/pull/17782)
* Add support for network connect/disconnect to stopped containers [#18906](https://github.com/docker/docker/pull/18906)
* Add network ID to container inspect [#19323](https://github.com/docker/docker/pull/19323)
- Fix MTU issue where Docker would not start with two or more default routes [#18108](https://github.com/docker/docker/pull/18108)
- Fix duplicate IP address for containers [#18106](https://github.com/docker/docker/pull/18106)
- Fix issue preventing sometimes docker from creating the bridge network [#19338](https://github.com/docker/docker/pull/19338)
- Do not substitute 127.0.0.1 name server when using `--net=host` [#19573](https://github.com/docker/docker/pull/19573)
@z

@x
### Logging
@y
### Logging
@z

@x
+ New logging driver for Splunk [#16488](https://github.com/docker/docker/pull/16488)
+ Add support for syslog over TCP+TLS [#18998](https://github.com/docker/docker/pull/18998)
* Enhance `docker logs --since` and `--until` to support nanoseconds and time [#17495](https://github.com/docker/docker/pull/17495)
* Enhance AWS logs to auto-detect region [#16640](https://github.com/docker/docker/pull/16640)
@y
+ New logging driver for Splunk [#16488](https://github.com/docker/docker/pull/16488)
+ Add support for syslog over TCP+TLS [#18998](https://github.com/docker/docker/pull/18998)
* Enhance `docker logs --since` and `--until` to support nanoseconds and time [#17495](https://github.com/docker/docker/pull/17495)
* Enhance AWS logs to auto-detect region [#16640](https://github.com/docker/docker/pull/16640)
@z

@x
### Volumes
@y
### Volumes
@z

@x
+ Add support to set the mount propagation mode for a volume [#17034](https://github.com/docker/docker/pull/17034)
* Add `ls` and `inspect` endpoints to volume plugin API [#16534](https://github.com/docker/docker/pull/16534)
  Existing plugins need to make use of these new APIs to satisfy users' expectation
  For that, use the new MIME type `application/vnd.docker.plugins.v1.2+json` [#19549](https://github.com/docker/docker/pull/19549)
- Fix data not being copied to named volumes [#19175](https://github.com/docker/docker/pull/19175)
- Fix issues preventing volume drivers from being containerized [#19500](https://github.com/docker/docker/pull/19500)
- Fix `docker volumes ls --dangling=false` to now show all non-dangling volumes [#19671](https://github.com/docker/docker/pull/19671)
- Do not remove named volumes on container removal [#19568](https://github.com/docker/docker/pull/19568)
- Allow external volume drivers to host anonymous volumes [#19190](https://github.com/docker/docker/pull/19190)
@y
+ Add support to set the mount propagation mode for a volume [#17034](https://github.com/docker/docker/pull/17034)
* Add `ls` and `inspect` endpoints to volume plugin API [#16534](https://github.com/docker/docker/pull/16534)
  Existing plugins need to make use of these new APIs to satisfy users' expectation
  For that, use the new MIME type `application/vnd.docker.plugins.v1.2+json` [#19549](https://github.com/docker/docker/pull/19549)
- Fix data not being copied to named volumes [#19175](https://github.com/docker/docker/pull/19175)
- Fix issues preventing volume drivers from being containerized [#19500](https://github.com/docker/docker/pull/19500)
- Fix `docker volumes ls --dangling=false` to now show all non-dangling volumes [#19671](https://github.com/docker/docker/pull/19671)
- Do not remove named volumes on container removal [#19568](https://github.com/docker/docker/pull/19568)
- Allow external volume drivers to host anonymous volumes [#19190](https://github.com/docker/docker/pull/19190)
@z

@x
### Builder
@y
### Builder
@z

@x
+ Add support for `**` in `.dockerignore` to wildcard multiple levels of directories [#17090](https://github.com/docker/docker/pull/17090)
- Fix handling of UTF-8 characters in Dockerfiles [#17055](https://github.com/docker/docker/pull/17055)
- Fix permissions problem when reading from STDIN [#19283](https://github.com/docker/docker/pull/19283)
@y
+ Add support for `**` in `.dockerignore` to wildcard multiple levels of directories [#17090](https://github.com/docker/docker/pull/17090)
- Fix handling of UTF-8 characters in Dockerfiles [#17055](https://github.com/docker/docker/pull/17055)
- Fix permissions problem when reading from STDIN [#19283](https://github.com/docker/docker/pull/19283)
@z

@x
### Client
@y
### Client
@z

@x
+ Add support for overriding the API version to use via an `DOCKER_API_VERSION` environment-variable [#15964](https://github.com/docker/docker/pull/15964)
- Fix a bug preventing Windows clients to log in to Docker Hub [#19891](https://github.com/docker/docker/pull/19891)
@y
+ Add support for overriding the API version to use via an `DOCKER_API_VERSION` environment-variable [#15964](https://github.com/docker/docker/pull/15964)
- Fix a bug preventing Windows clients to log in to Docker Hub [#19891](https://github.com/docker/docker/pull/19891)
@z

@x
### Misc
@y
### Misc
@z

@x
* systemd: Set TasksMax in addition to LimitNPROC in systemd service file [#19391](https://github.com/docker/docker/pull/19391)
@y
* systemd: Set TasksMax in addition to LimitNPROC in systemd service file [#19391](https://github.com/docker/docker/pull/19391)
@z

@x
### Deprecations
@y
### Deprecations
@z

@x
* Remove LXC support. The LXC driver was deprecated in Docker 1.8, and has now been removed [#17700](https://github.com/docker/docker/pull/17700)
* Remove `--exec-driver` daemon flag, because it is no longer in use [#17700](https://github.com/docker/docker/pull/17700)
* Remove old deprecated single-dashed long CLI flags (such as `-rm`; use `--rm` instead) [#17724](https://github.com/docker/docker/pull/17724)
* Deprecate HostConfig at API container start [#17799](https://github.com/docker/docker/pull/17799)
* Deprecate docker packages for newly EOL'd Linux distributions: Fedora 21 and Ubuntu 15.04 (Vivid) [#18794](https://github.com/docker/docker/pull/18794), [#18809](https://github.com/docker/docker/pull/18809)
* Deprecate `-f` flag for docker tag [#18350](https://github.com/docker/docker/pull/18350)
@y
* Remove LXC support. The LXC driver was deprecated in Docker 1.8, and has now been removed [#17700](https://github.com/docker/docker/pull/17700)
* Remove `--exec-driver` daemon flag, because it is no longer in use [#17700](https://github.com/docker/docker/pull/17700)
* Remove old deprecated single-dashed long CLI flags (such as `-rm`; use `--rm` instead) [#17724](https://github.com/docker/docker/pull/17724)
* Deprecate HostConfig at API container start [#17799](https://github.com/docker/docker/pull/17799)
* Deprecate docker packages for newly EOL'd Linux distributions: Fedora 21 and Ubuntu 15.04 (Vivid) [#18794](https://github.com/docker/docker/pull/18794), [#18809](https://github.com/docker/docker/pull/18809)
* Deprecate `-f` flag for docker tag [#18350](https://github.com/docker/docker/pull/18350)
@z

@x
## 1.9.1 (2015-11-21)
@y
## 1.9.1 (2015-11-21)
@z

@x
### Runtime
@y
### Runtime
@z

@x
- Do not prevent daemon from booting if images could not be restored (#17695)
- Force IPC mount to unmount on daemon shutdown/init (#17539)
- Turn IPC unmount errors into warnings (#17554)
- Fix `docker stats` performance regression (#17638)
- Clarify cryptic error message upon `docker logs` if `--log-driver=none` (#17767)
- Fix seldom panics (#17639, #17634, #17703)
- Fix opq whiteouts problems for files with dot prefix (#17819)
- devicemapper: try defaulting to xfs instead of ext4 for performance reasons (#17903, #17918)
- devicemapper: fix displayed fs in docker info (#17974)
- selinux: only relabel if user requested so with the `z` option (#17450, #17834)
- Do not make network calls when normalizing names (#18014)
@y
- Do not prevent daemon from booting if images could not be restored (#17695)
- Force IPC mount to unmount on daemon shutdown/init (#17539)
- Turn IPC unmount errors into warnings (#17554)
- Fix `docker stats` performance regression (#17638)
- Clarify cryptic error message upon `docker logs` if `--log-driver=none` (#17767)
- Fix seldom panics (#17639, #17634, #17703)
- Fix opq whiteouts problems for files with dot prefix (#17819)
- devicemapper: try defaulting to xfs instead of ext4 for performance reasons (#17903, #17918)
- devicemapper: fix displayed fs in docker info (#17974)
- selinux: only relabel if user requested so with the `z` option (#17450, #17834)
- Do not make network calls when normalizing names (#18014)
@z

@x
### Client
@y
### Client
@z

@x
- Fix `docker login` on windows (#17738)
- Fix bug with `docker inspect` output when not connected to daemon (#17715)
- Fix `docker inspect -f {{.HostConfig.Dns}} somecontainer` (#17680)
@y
- Fix `docker login` on windows (#17738)
- Fix bug with `docker inspect` output when not connected to daemon (#17715)
- Fix `docker inspect -f {{.HostConfig.Dns}} somecontainer` (#17680)
@z

@x
### Builder
@y
### Builder
@z

@x
- Fix regression with symlink behavior in ADD/COPY (#17710)
@y
- Fix regression with symlink behavior in ADD/COPY (#17710)
@z

@x
### Networking
@y
### Networking
@z

@x
- Allow passing a network ID as an argument for `--net` (#17558)
- Fix connect to host and prevent disconnect from host for `host` network (#17476)
- Fix `--fixed-cidr` issue when gateway ip falls in ip-range and ip-range is
  not the first block in the network (#17853)
- Restore deterministic `IPv6` generation from `MAC` address on default `bridge` network (#17890)
- Allow port-mapping only for endpoints created on docker run (#17858)
- Fixed an endpoint delete issue with a possible stale sbox (#18102)
@y
- Allow passing a network ID as an argument for `--net` (#17558)
- Fix connect to host and prevent disconnect from host for `host` network (#17476)
- Fix `--fixed-cidr` issue when gateway ip falls in ip-range and ip-range is
  not the first block in the network (#17853)
- Restore deterministic `IPv6` generation from `MAC` address on default `bridge` network (#17890)
- Allow port-mapping only for endpoints created on docker run (#17858)
- Fixed an endpoint delete issue with a possible stale sbox (#18102)
@z

@x
### Distribution
@y
### Distribution
@z

@x
- Correct parent chain in v2 push when v1Compatibility files on the disk are inconsistent (#18047)
@y
- Correct parent chain in v2 push when v1Compatibility files on the disk are inconsistent (#18047)
@z

@x
## 1.9.0 (2015-11-03)
@y
## 1.9.0 (2015-11-03)
@z

@x
### Runtime
@y
### Runtime
@z

@x
+ `docker stats` now returns block IO metrics (#15005)
+ `docker stats` now details network stats per interface (#15786)
+ Add `ancestor=<image>` filter to `docker ps --filter` flag to filter
containers based on their ancestor images (#14570)
+ Add `label=<somelabel>` filter to `docker ps --filter` to filter containers
based on label (#16530)
+ Add `--kernel-memory` flag to `docker run` (#14006)
+ Add `--message` flag to `docker import` allowing to specify an optional
message (#15711)
+ Add `--privileged` flag to `docker exec` (#14113)
+ Add `--stop-signal` flag to `docker run` allowing to replace the container
process stopping signal (#15307)
+ Add a new `unless-stopped` restart policy (#15348)
+ Inspecting an image now returns tags (#13185)
+ Add container size information to `docker inspect` (#15796)
+ Add `RepoTags` and `RepoDigests` field to `/images/{name:.*}/json` (#17275)
- Remove the deprecated `/container/ps` endpoint from the API (#15972)
- Send and document correct HTTP codes for `/exec/<name>/start` (#16250)
- Share shm and mqueue between containers sharing IPC namespace (#15862)
- Event stream now shows OOM status when `--oom-kill-disable` is set (#16235)
- Ensure special network files (/etc/hosts etc.) are read-only if bind-mounted
with `ro` option (#14965)
- Improve `rmi` performance (#16890)
- Do not update /etc/hosts for the default bridge network, except for links (#17325)
- Fix conflict with duplicate container names (#17389)
- Fix an issue with incorrect template execution in `docker inspect` (#17284)
- DEPRECATE `-c` short flag variant for `--cpu-shares` in docker run (#16271)
@y
+ `docker stats` now returns block IO metrics (#15005)
+ `docker stats` now details network stats per interface (#15786)
+ Add `ancestor=<image>` filter to `docker ps --filter` flag to filter
containers based on their ancestor images (#14570)
+ Add `label=<somelabel>` filter to `docker ps --filter` to filter containers
based on label (#16530)
+ Add `--kernel-memory` flag to `docker run` (#14006)
+ Add `--message` flag to `docker import` allowing to specify an optional
message (#15711)
+ Add `--privileged` flag to `docker exec` (#14113)
+ Add `--stop-signal` flag to `docker run` allowing to replace the container
process stopping signal (#15307)
+ Add a new `unless-stopped` restart policy (#15348)
+ Inspecting an image now returns tags (#13185)
+ Add container size information to `docker inspect` (#15796)
+ Add `RepoTags` and `RepoDigests` field to `/images/{name:.*}/json` (#17275)
- Remove the deprecated `/container/ps` endpoint from the API (#15972)
- Send and document correct HTTP codes for `/exec/<name>/start` (#16250)
- Share shm and mqueue between containers sharing IPC namespace (#15862)
- Event stream now shows OOM status when `--oom-kill-disable` is set (#16235)
- Ensure special network files (/etc/hosts etc.) are read-only if bind-mounted
with `ro` option (#14965)
- Improve `rmi` performance (#16890)
- Do not update /etc/hosts for the default bridge network, except for links (#17325)
- Fix conflict with duplicate container names (#17389)
- Fix an issue with incorrect template execution in `docker inspect` (#17284)
- DEPRECATE `-c` short flag variant for `--cpu-shares` in docker run (#16271)
@z

@x
### Client
@y
### Client
@z

@x
+ Allow `docker import` to import from local files (#11907)
@y
+ Allow `docker import` to import from local files (#11907)
@z

@x
### Builder
@y
### Builder
@z

@x
+ Add a `STOPSIGNAL` Dockerfile instruction allowing to set a different
stop-signal for the container process (#15307)
+ Add an `ARG` Dockerfile instruction and a `--build-arg` flag to `docker build`
that allows to add build-time environment variables (#15182)
- Improve cache miss performance (#16890)
@y
+ Add a `STOPSIGNAL` Dockerfile instruction allowing to set a different
stop-signal for the container process (#15307)
+ Add an `ARG` Dockerfile instruction and a `--build-arg` flag to `docker build`
that allows to add build-time environment variables (#15182)
- Improve cache miss performance (#16890)
@z

@x
### Storage
@y
### Storage
@z

@x
- devicemapper: Implement deferred deletion capability (#16381)
@y
- devicemapper: Implement deferred deletion capability (#16381)
@z

@x
### Networking
@y
### Networking
@z

@x
+ `docker network` exits experimental and is part of standard release (#16645)
+ New network top-level concept, with associated subcommands and API (#16645)
  WARNING: the API is different from the experimental API
+ Support for multiple isolated/micro-segmented networks (#16645)
+ Built-in multihost networking using VXLAN based overlay driver (#14071)
+ Support for third-party network plugins (#13424)
+ Ability to dynamically connect containers to multiple networks (#16645)
+ Support for user-defined IP address management via pluggable IPAM drivers (#16910)
+ Add daemon flags `--cluster-store` and `--cluster-advertise` for built-in nodes discovery (#16229)
+ Add `--cluster-store-opt` for setting up TLS settings (#16644)
+ Add `--dns-opt` to the daemon (#16031)
- DEPRECATE following container `NetworkSettings` fields in API v1.21: `EndpointID`, `Gateway`,
  `GlobalIPv6Address`, `GlobalIPv6PrefixLen`, `IPAddress`, `IPPrefixLen`, `IPv6Gateway` and `MacAddress`.
  Those are now specific to the `bridge` network. Use `NetworkSettings.Networks` to inspect
  the networking settings of a container per network.
@y
+ `docker network` exits experimental and is part of standard release (#16645)
+ New network top-level concept, with associated subcommands and API (#16645)
  WARNING: the API is different from the experimental API
+ Support for multiple isolated/micro-segmented networks (#16645)
+ Built-in multihost networking using VXLAN based overlay driver (#14071)
+ Support for third-party network plugins (#13424)
+ Ability to dynamically connect containers to multiple networks (#16645)
+ Support for user-defined IP address management via pluggable IPAM drivers (#16910)
+ Add daemon flags `--cluster-store` and `--cluster-advertise` for built-in nodes discovery (#16229)
+ Add `--cluster-store-opt` for setting up TLS settings (#16644)
+ Add `--dns-opt` to the daemon (#16031)
- DEPRECATE following container `NetworkSettings` fields in API v1.21: `EndpointID`, `Gateway`,
  `GlobalIPv6Address`, `GlobalIPv6PrefixLen`, `IPAddress`, `IPPrefixLen`, `IPv6Gateway` and `MacAddress`.
  Those are now specific to the `bridge` network. Use `NetworkSettings.Networks` to inspect
  the networking settings of a container per network.
@z

@x
### Volumes
@y
### Volumes
@z

@x
+ New top-level `volume` subcommand and API (#14242)
- Move API volume driver settings to host-specific config (#15798)
- Print an error message if volume name is not unique (#16009)
- Ensure volumes created from Dockerfiles always use the local volume driver
(#15507)
- DEPRECATE auto-creating missing host paths for bind mounts (#16349)
@y
+ New top-level `volume` subcommand and API (#14242)
- Move API volume driver settings to host-specific config (#15798)
- Print an error message if volume name is not unique (#16009)
- Ensure volumes created from Dockerfiles always use the local volume driver
(#15507)
- DEPRECATE auto-creating missing host paths for bind mounts (#16349)
@z

@x
### Logging
@y
### Logging
@z

@x
+ Add `awslogs` logging driver for Amazon CloudWatch (#15495)
+ Add generic `tag` log option to allow customizing container/image
information passed to driver (#15384)
- Implement the `docker logs` endpoint for the journald driver (#13707)
- DEPRECATE driver-specific log tags (#15384)
@y
+ Add `awslogs` logging driver for Amazon CloudWatch (#15495)
+ Add generic `tag` log option to allow customizing container/image
information passed to driver (#15384)
- Implement the `docker logs` endpoint for the journald driver (#13707)
- DEPRECATE driver-specific log tags (#15384)
@z

@x
### Distribution
@y
### Distribution
@z

@x
+ `docker search` now works with partial names (#16509)
- Push optimization: avoid buffering to file (#15493)
- The daemon will display progress for images that were already being pulled
by another client (#15489)
- Only permissions required for the current action being performed are requested (#)
+ Renaming trust keys (and respective environment variables) from `offline` to
`root` and `tagging` to `repository` (#16894)
- DEPRECATE trust key environment variables
`DOCKER_CONTENT_TRUST_OFFLINE_PASSPHRASE` and
`DOCKER_CONTENT_TRUST_TAGGING_PASSPHRASE` (#16894)
@y
+ `docker search` now works with partial names (#16509)
- Push optimization: avoid buffering to file (#15493)
- The daemon will display progress for images that were already being pulled
by another client (#15489)
- Only permissions required for the current action being performed are requested (#)
+ Renaming trust keys (and respective environment variables) from `offline` to
`root` and `tagging` to `repository` (#16894)
- DEPRECATE trust key environment variables
`DOCKER_CONTENT_TRUST_OFFLINE_PASSPHRASE` and
`DOCKER_CONTENT_TRUST_TAGGING_PASSPHRASE` (#16894)
@z

@x
### Security
@y
### Security
@z

@x
+ Add SELinux profiles to the rpm package (#15832)
- Fix various issues with AppArmor profiles provided in the deb package
(#14609)
- Add AppArmor policy that prevents writing to /proc (#15571)
@y
+ Add SELinux profiles to the rpm package (#15832)
- Fix various issues with AppArmor profiles provided in the deb package
(#14609)
- Add AppArmor policy that prevents writing to /proc (#15571)
@z

@x
## 1.8.3 (2015-10-12)
@y
## 1.8.3 (2015-10-12)
@z

@x
### Distribution
@y
### Distribution
@z

@x
- Fix layer IDs lead to local graph poisoning (CVE-2014-8178)
- Fix manifest validation and parsing logic errors allow pull-by-digest validation bypass (CVE-2014-8179)
+ Add `--disable-legacy-registry` to prevent a daemon from using a v1 registry
@y
- Fix layer IDs lead to local graph poisoning (CVE-2014-8178)
- Fix manifest validation and parsing logic errors allow pull-by-digest validation bypass (CVE-2014-8179)
+ Add `--disable-legacy-registry` to prevent a daemon from using a v1 registry
@z

@x
## 1.8.2 (2015-09-10)
@y
## 1.8.2 (2015-09-10)
@z

@x
### Distribution
@y
### Distribution
@z

@x
- Fixes rare edge case of handling GNU LongLink and LongName entries.
- Fix ^C on docker pull.
- Fix docker pull issues on client disconnection.
- Fix issue that caused the daemon to panic when loggers weren't configured properly.
- Fix goroutine leak pulling images from registry V2.
@y
- Fixes rare edge case of handling GNU LongLink and LongName entries.
- Fix ^C on docker pull.
- Fix docker pull issues on client disconnection.
- Fix issue that caused the daemon to panic when loggers weren't configured properly.
- Fix goroutine leak pulling images from registry V2.
@z

@x
### Runtime
@y
### Runtime
@z

@x
- Fix a bug mounting cgroups for docker daemons running inside docker containers.
- Initialize log configuration properly.
@y
- Fix a bug mounting cgroups for docker daemons running inside docker containers.
- Initialize log configuration properly.
@z

@x
### Client:
@y
### Client:
@z

@x
- Handle `-q` flag in `docker ps` properly when there is a default format.
@y
- Handle `-q` flag in `docker ps` properly when there is a default format.
@z

@x
### Networking
@y
### Networking
@z

@x
- Fix several corner cases with netlink.
@y
- Fix several corner cases with netlink.
@z

@x
### Contrib
@y
### Contrib
@z

@x
- Fix several issues with bash completion.
@y
- Fix several issues with bash completion.
@z

@x
## 1.8.1 (2015-08-12)
@y
## 1.8.1 (2015-08-12)
@z

@x
### Distribution
@y
### Distribution
@z

@x
* Fix a bug where pushing multiple tags would result in invalid images
@y
* Fix a bug where pushing multiple tags would result in invalid images
@z

@x
## 1.8.0 (2015-08-11)
@y
## 1.8.0 (2015-08-11)
@z

@x
### Distribution
@y
### Distribution
@z

@x
+ Trusted pull, push and build, disabled by default
* Make tar layers deterministic between registries
* Don't allow deleting the image of running containers
* Check if a tag name to load is a valid digest
* Allow one character repository names
* Add a more accurate error description for invalid tag name
* Make build cache ignore mtime
@y
+ Trusted pull, push and build, disabled by default
* Make tar layers deterministic between registries
* Don't allow deleting the image of running containers
* Check if a tag name to load is a valid digest
* Allow one character repository names
* Add a more accurate error description for invalid tag name
* Make build cache ignore mtime
@z

@x
### Cli
@y
### Cli
@z

@x
+ Add support for DOCKER_CONFIG/--config to specify config file dir
+ Add --type flag  for docker inspect command
+ Add formatting options to `docker ps` with `--format`
+ Replace `docker -d` with new subcommand `docker daemon`
* Zsh completion updates and improvements
* Add some missing events to bash completion
* Support daemon urls with base paths in `docker -H`
* Validate status= filter to docker ps
* Display when a container is in --net=host in docker ps
* Extend docker inspect to export image metadata related to graph driver
* Restore --default-gateway{,-v6} daemon options
* Add missing unpublished ports in docker ps
* Allow duration strings in `docker events` as --since/--until
* Expose more mounts information in `docker inspect`
@y
+ Add support for DOCKER_CONFIG/--config to specify config file dir
+ Add --type flag  for docker inspect command
+ Add formatting options to `docker ps` with `--format`
+ Replace `docker -d` with new subcommand `docker daemon`
* Zsh completion updates and improvements
* Add some missing events to bash completion
* Support daemon urls with base paths in `docker -H`
* Validate status= filter to docker ps
* Display when a container is in --net=host in docker ps
* Extend docker inspect to export image metadata related to graph driver
* Restore --default-gateway{,-v6} daemon options
* Add missing unpublished ports in docker ps
* Allow duration strings in `docker events` as --since/--until
* Expose more mounts information in `docker inspect`
@z

@x
### Runtime
@y
### Runtime
@z

@x
+ Add new Fluentd logging driver
+ Allow `docker import` to load from local files
+ Add logging driver for GELF via UDP
+ Allow to copy files from host to containers with `docker cp`
+ Promote volume drivers from experimental to master
+ Add rollover options to json-file log driver, and --log-driver-opts flag
+ Add memory swappiness tuning options
* Remove cgroup read-only flag when privileged
* Make /proc, /sys, & /dev readonly for readonly containers
* Add cgroup bind mount by default
* Overlay: Export metadata for container and image in `docker inspect`
* Devicemapper: external device activation
* Devicemapper: Compare uuid of base device on startup
* Remove RC4 from the list of registry cipher suites
* Add syslog-facility option
* LXC execdriver compatibility with recent LXC versions
* Mark LXC execriver as deprecated (to be removed with the migration to runc)
@y
+ Add new Fluentd logging driver
+ Allow `docker import` to load from local files
+ Add logging driver for GELF via UDP
+ Allow to copy files from host to containers with `docker cp`
+ Promote volume drivers from experimental to master
+ Add rollover options to json-file log driver, and --log-driver-opts flag
+ Add memory swappiness tuning options
* Remove cgroup read-only flag when privileged
* Make /proc, /sys, & /dev readonly for readonly containers
* Add cgroup bind mount by default
* Overlay: Export metadata for container and image in `docker inspect`
* Devicemapper: external device activation
* Devicemapper: Compare uuid of base device on startup
* Remove RC4 from the list of registry cipher suites
* Add syslog-facility option
* LXC execdriver compatibility with recent LXC versions
* Mark LXC execriver as deprecated (to be removed with the migration to runc)
@z

@x
### Plugins
@y
### Plugins
@z

@x
* Separate plugin sockets and specs locations
* Allow TLS connections to plugins
@y
* Separate plugin sockets and specs locations
* Allow TLS connections to plugins
@z

@x
### Bug fixes
@y
### Bug fixes
@z

@x
- Add missing 'Names' field to /containers/json API output
- Make `docker rmi` of dangling images safe while pulling
- Devicemapper: Change default basesize to 100G
- Go Scheduler issue with sync.Mutex and gcc
- Fix issue where Search API endpoint would panic due to empty AuthConfig
- Set image canonical names correctly
- Check dockerinit only if lxc driver is used
- Fix ulimit usage of nproc
- Always attach STDIN if -i,--interactive is specified
- Show error messages when saving container state fails
- Fixed incorrect assumption on --bridge=none treated as disable network
- Check for invalid port specifications in host configuration
- Fix endpoint leave failure for --net=host mode
- Fix goroutine leak in the stats API if the container is not running
- Check for apparmor file before reading it
- Fix DOCKER_TLS_VERIFY being ignored
- Set umask to the default on startup
- Correct the message of pause and unpause a non-running container
- Adjust disallowed CpuShares in container creation
- ZFS: correctly apply selinux context
- Display empty string instead of <nil> when IP opt is nil
- `docker kill` returns error when container is not running
- Fix COPY/ADD quoted/json form
- Fix goroutine leak on logs -f with no output
- Remove panic in nat package on invalid hostport
- Fix container linking in Fedora 22
- Fix error caused using default gateways outside of the allocated range
- Format times in inspect command with a template as RFC3339Nano
- Make registry client to accept 2xx and 3xx http status responses as successful
- Fix race issue that caused the daemon to crash with certain layer downloads failed in a specific order.
- Fix error when the docker ps format was not valid.
- Remove redundant ip forward check.
- Fix issue trying to push images to repository mirrors.
- Fix error cleaning up network entrypoints when there is an initialization issue.
@y
- Add missing 'Names' field to /containers/json API output
- Make `docker rmi` of dangling images safe while pulling
- Devicemapper: Change default basesize to 100G
- Go Scheduler issue with sync.Mutex and gcc
- Fix issue where Search API endpoint would panic due to empty AuthConfig
- Set image canonical names correctly
- Check dockerinit only if lxc driver is used
- Fix ulimit usage of nproc
- Always attach STDIN if -i,--interactive is specified
- Show error messages when saving container state fails
- Fixed incorrect assumption on --bridge=none treated as disable network
- Check for invalid port specifications in host configuration
- Fix endpoint leave failure for --net=host mode
- Fix goroutine leak in the stats API if the container is not running
- Check for apparmor file before reading it
- Fix DOCKER_TLS_VERIFY being ignored
- Set umask to the default on startup
- Correct the message of pause and unpause a non-running container
- Adjust disallowed CpuShares in container creation
- ZFS: correctly apply selinux context
- Display empty string instead of <nil> when IP opt is nil
- `docker kill` returns error when container is not running
- Fix COPY/ADD quoted/json form
- Fix goroutine leak on logs -f with no output
- Remove panic in nat package on invalid hostport
- Fix container linking in Fedora 22
- Fix error caused using default gateways outside of the allocated range
- Format times in inspect command with a template as RFC3339Nano
- Make registry client to accept 2xx and 3xx http status responses as successful
- Fix race issue that caused the daemon to crash with certain layer downloads failed in a specific order.
- Fix error when the docker ps format was not valid.
- Remove redundant ip forward check.
- Fix issue trying to push images to repository mirrors.
- Fix error cleaning up network entrypoints when there is an initialization issue.
@z

@x
## 1.7.1 (2015-07-14)
@y
## 1.7.1 (2015-07-14)
@z

@x
### Runtime
@y
### Runtime
@z

@x
- Fix default user spawning exec process with `docker exec`
- Make `--bridge=none` not to configure the network bridge
- Publish networking stats properly
- Fix implicit devicemapper selection with static binaries
- Fix socket connections that hung intermittently
- Fix bridge interface creation on CentOS/RHEL 6.6
- Fix local dns lookups added to resolv.conf
- Fix copy command mounting volumes
- Fix read/write privileges in volumes mounted with --volumes-from
@y
- Fix default user spawning exec process with `docker exec`
- Make `--bridge=none` not to configure the network bridge
- Publish networking stats properly
- Fix implicit devicemapper selection with static binaries
- Fix socket connections that hung intermittently
- Fix bridge interface creation on CentOS/RHEL 6.6
- Fix local dns lookups added to resolv.conf
- Fix copy command mounting volumes
- Fix read/write privileges in volumes mounted with --volumes-from
@z

@x
### Remote API
@y
### Remote API
@z

@x
- Fix unmarshalling of Command and Entrypoint
- Set limit for minimum client version supported
- Validate port specification
- Return proper errors when attach/reattach fail
@y
- Fix unmarshalling of Command and Entrypoint
- Set limit for minimum client version supported
- Validate port specification
- Return proper errors when attach/reattach fail
@z

@x
### Distribution
@y
### Distribution
@z

@x
- Fix pulling private images
- Fix fallback between registry V2 and V1
@y
- Fix pulling private images
- Fix fallback between registry V2 and V1
@z

@x
## 1.7.0 (2015-06-16)
@y
## 1.7.0 (2015-06-16)
@z

@x
### Runtime
+ Experimental feature: support for out-of-process volume plugins
* The userland proxy can be disabled in favor of hairpin NAT using the daemon’s `--userland-proxy=false` flag
* The `exec` command supports the `-u|--user` flag to specify the new process owner
+ Default gateway for containers can be specified daemon-wide using the `--default-gateway` and `--default-gateway-v6` flags
+ The CPU CFS (Completely Fair Scheduler) quota can be set in `docker run` using `--cpu-quota`
+ Container block IO can be controlled in `docker run` using`--blkio-weight`
+ ZFS support
+ The `docker logs` command supports a `--since` argument
+ UTS namespace can be shared with the host with `docker run --uts=host`
@y
### Runtime
+ Experimental feature: support for out-of-process volume plugins
* The userland proxy can be disabled in favor of hairpin NAT using the daemon’s `--userland-proxy=false` flag
* The `exec` command supports the `-u|--user` flag to specify the new process owner
+ Default gateway for containers can be specified daemon-wide using the `--default-gateway` and `--default-gateway-v6` flags
+ The CPU CFS (Completely Fair Scheduler) quota can be set in `docker run` using `--cpu-quota`
+ Container block IO can be controlled in `docker run` using`--blkio-weight`
+ ZFS support
+ The `docker logs` command supports a `--since` argument
+ UTS namespace can be shared with the host with `docker run --uts=host`
@z

@x
### Quality
* Networking stack was entirely rewritten as part of the libnetwork effort
* Engine internals refactoring
* Volumes code was entirely rewritten to support the plugins effort
+ Sending SIGUSR1 to a daemon will dump all goroutines stacks without exiting
@y
### Quality
* Networking stack was entirely rewritten as part of the libnetwork effort
* Engine internals refactoring
* Volumes code was entirely rewritten to support the plugins effort
+ Sending SIGUSR1 to a daemon will dump all goroutines stacks without exiting
@z

@x
### Build
+ Support ${variable:-value} and ${variable:+value} syntax for environment variables
+ Support resource management flags `--cgroup-parent`, `--cpu-period`, `--cpu-quota`, `--cpuset-cpus`, `--cpuset-mems`
+ git context changes with branches and directories
* The .dockerignore file support exclusion rules
@y
### Build
+ Support ${variable:-value} and ${variable:+value} syntax for environment variables
+ Support resource management flags `--cgroup-parent`, `--cpu-period`, `--cpu-quota`, `--cpuset-cpus`, `--cpuset-mems`
+ git context changes with branches and directories
* The .dockerignore file support exclusion rules
@z

@x
### Distribution
+ Client support for v2 mirroring support for the official registry
@y
### Distribution
+ Client support for v2 mirroring support for the official registry
@z

@x
### Bugfixes
* Firewalld is now supported and will automatically be used when available
* mounting --device recursively
@y
### Bugfixes
* Firewalld is now supported and will automatically be used when available
* mounting --device recursively
@z

@x
## 1.6.2 (2015-05-13)
@y
## 1.6.2 (2015-05-13)
@z

@x
### Runtime
- Revert change prohibiting mounting into /sys
@y
### Runtime
- Revert change prohibiting mounting into /sys
@z

@x
## 1.6.1 (2015-05-07)
@y
## 1.6.1 (2015-05-07)
@z

@x
### Security
- Fix read/write /proc paths (CVE-2015-3630)
- Prohibit VOLUME /proc and VOLUME / (CVE-2015-3631)
- Fix opening of file-descriptor 1 (CVE-2015-3627)
- Fix symlink traversal on container respawn allowing local privilege escalation (CVE-2015-3629)
- Prohibit mount of /sys
@y
### Security
- Fix read/write /proc paths (CVE-2015-3630)
- Prohibit VOLUME /proc and VOLUME / (CVE-2015-3631)
- Fix opening of file-descriptor 1 (CVE-2015-3627)
- Fix symlink traversal on container respawn allowing local privilege escalation (CVE-2015-3629)
- Prohibit mount of /sys
@z

@x
### Runtime
- Update AppArmor policy to not allow mounts
@y
### Runtime
- Update AppArmor policy to not allow mounts
@z

@x
## 1.6.0 (2015-04-07)
@y
## 1.6.0 (2015-04-07)
@z

@x
### Builder
+ Building images from an image ID
+ Build containers with resource constraints, ie `docker build --cpu-shares=100 --memory=1024m...`
+ `commit --change` to apply specified Dockerfile instructions while committing the image
+ `import --change` to apply specified Dockerfile instructions while importing the image
+ Builds no longer continue in the background when canceled with CTRL-C
@y
### Builder
+ Building images from an image ID
+ Build containers with resource constraints, ie `docker build --cpu-shares=100 --memory=1024m...`
+ `commit --change` to apply specified Dockerfile instructions while committing the image
+ `import --change` to apply specified Dockerfile instructions while importing the image
+ Builds no longer continue in the background when canceled with CTRL-C
@z

@x
### Client
+ Windows Support
@y
### Client
+ Windows Support
@z

@x
### Runtime
+ Container and image Labels
+ `--cgroup-parent` for specifying a parent cgroup to place container cgroup within
+ Logging drivers, `json-file`, `syslog`, or `none`
+ Pulling images by ID
+ `--ulimit` to set the ulimit on a container
+ `--default-ulimit` option on the daemon which applies to all created containers (and overwritten by `--ulimit` on run)
@y
### Runtime
+ Container and image Labels
+ `--cgroup-parent` for specifying a parent cgroup to place container cgroup within
+ Logging drivers, `json-file`, `syslog`, or `none`
+ Pulling images by ID
+ `--ulimit` to set the ulimit on a container
+ `--default-ulimit` option on the daemon which applies to all created containers (and overwritten by `--ulimit` on run)
@z

@x
## 1.5.0 (2015-02-10)
@y
## 1.5.0 (2015-02-10)
@z

@x
### Builder
+ Dockerfile to use for a given `docker build` can be specified with the `-f` flag
* Dockerfile and .dockerignore files can be themselves excluded as part of the .dockerignore file, thus preventing modifications to these files invalidating ADD or COPY instructions cache
* ADD and COPY instructions accept relative paths
* Dockerfile `FROM scratch` instruction is now interpreted as a no-base specifier
* Improve performance when exposing a large number of ports
@y
### Builder
+ Dockerfile to use for a given `docker build` can be specified with the `-f` flag
* Dockerfile and .dockerignore files can be themselves excluded as part of the .dockerignore file, thus preventing modifications to these files invalidating ADD or COPY instructions cache
* ADD and COPY instructions accept relative paths
* Dockerfile `FROM scratch` instruction is now interpreted as a no-base specifier
* Improve performance when exposing a large number of ports
@z

@x
### Hack
+ Allow client-side only integration tests for Windows
* Include docker-py integration tests against Docker daemon as part of our test suites
@y
### Hack
+ Allow client-side only integration tests for Windows
* Include docker-py integration tests against Docker daemon as part of our test suites
@z

@x
### Packaging
+ Support for the new version of the registry HTTP API
* Speed up `docker push` for images with a majority of already existing layers
- Fixed contacting a private registry through a proxy
@y
### Packaging
+ Support for the new version of the registry HTTP API
* Speed up `docker push` for images with a majority of already existing layers
- Fixed contacting a private registry through a proxy
@z

@x
### Remote API
+ A new endpoint will stream live container resource metrics and can be accessed with the `docker stats` command
+ Containers can be renamed using the new `rename` endpoint and the associated `docker rename` command
* Container `inspect` endpoint show the ID of `exec` commands running in this container
* Container `inspect` endpoint show the number of times Docker auto-restarted the container
* New types of event can be streamed by the `events` endpoint: ‘OOM’ (container died with out of memory), ‘exec_create’, and ‘exec_start'
- Fixed returned string fields which hold numeric characters incorrectly omitting surrounding double quotes
@y
### Remote API
+ A new endpoint will stream live container resource metrics and can be accessed with the `docker stats` command
+ Containers can be renamed using the new `rename` endpoint and the associated `docker rename` command
* Container `inspect` endpoint show the ID of `exec` commands running in this container
* Container `inspect` endpoint show the number of times Docker auto-restarted the container
* New types of event can be streamed by the `events` endpoint: ‘OOM’ (container died with out of memory), ‘exec_create’, and ‘exec_start'
- Fixed returned string fields which hold numeric characters incorrectly omitting surrounding double quotes
@z

@x
### Runtime
+ Docker daemon has full IPv6 support
+ The `docker run` command can take the `--pid=host` flag to use the host PID namespace, which makes it possible for example to debug host processes using containerized debugging tools
+ The `docker run` command can take the `--read-only` flag to make the container’s root filesystem mounted as readonly, which can be used in combination with volumes to force a container’s processes to only write to locations that will be persisted
+ Container total memory usage can be limited for `docker run` using the `--memory-swap` flag
* Major stability improvements for devicemapper storage driver
* Better integration with host system: containers will reflect changes to the host's `/etc/resolv.conf` file when restarted
* Better integration with host system: per-container iptable rules are moved to the DOCKER chain
- Fixed container exiting on out of memory to return an invalid exit code
@y
### Runtime
+ Docker daemon has full IPv6 support
+ The `docker run` command can take the `--pid=host` flag to use the host PID namespace, which makes it possible for example to debug host processes using containerized debugging tools
+ The `docker run` command can take the `--read-only` flag to make the container’s root filesystem mounted as readonly, which can be used in combination with volumes to force a container’s processes to only write to locations that will be persisted
+ Container total memory usage can be limited for `docker run` using the `--memory-swap` flag
* Major stability improvements for devicemapper storage driver
* Better integration with host system: containers will reflect changes to the host's `/etc/resolv.conf` file when restarted
* Better integration with host system: per-container iptable rules are moved to the DOCKER chain
- Fixed container exiting on out of memory to return an invalid exit code
@z

@x
### Other
* The HTTP_PROXY, HTTPS_PROXY, and NO_PROXY environment variables are properly taken into account by the client when connecting to the Docker daemon
@y
### Other
* The HTTP_PROXY, HTTPS_PROXY, and NO_PROXY environment variables are properly taken into account by the client when connecting to the Docker daemon
@z

@x
## 1.4.1 (2014-12-15)
@y
## 1.4.1 (2014-12-15)
@z

@x
### Runtime
- Fix issue with volumes-from and bind mounts not being honored after create
@y
### Runtime
- Fix issue with volumes-from and bind mounts not being honored after create
@z

@x
## 1.4.0 (2014-12-11)
@y
## 1.4.0 (2014-12-11)
@z

@x
### Notable Features since 1.3.0
+ Set key=value labels to the daemon (displayed in `docker info`), applied with
  new `-label` daemon flag
+ Add support for `ENV` in Dockerfile of the form:
  `ENV name=value name2=value2...`
+ New Overlayfs Storage Driver
+ `docker info` now returns an `ID` and `Name` field
+ Filter events by event name, container, or image
+ `docker cp` now supports copying from container volumes
- Fixed `docker tag`, so it honors `--force` when overriding a tag for existing
  image.
@y
### Notable Features since 1.3.0
+ Set key=value labels to the daemon (displayed in `docker info`), applied with
  new `-label` daemon flag
+ Add support for `ENV` in Dockerfile of the form:
  `ENV name=value name2=value2...`
+ New Overlayfs Storage Driver
+ `docker info` now returns an `ID` and `Name` field
+ Filter events by event name, container, or image
+ `docker cp` now supports copying from container volumes
- Fixed `docker tag`, so it honors `--force` when overriding a tag for existing
  image.
@z

@x
## 1.3.3 (2014-12-11)
@y
## 1.3.3 (2014-12-11)
@z

@x
### Security
- Fix path traversal vulnerability in processing of absolute symbolic links (CVE-2014-9356)
- Fix decompression of xz image archives, preventing privilege escalation (CVE-2014-9357)
- Validate image IDs (CVE-2014-9358)
@y
### Security
- Fix path traversal vulnerability in processing of absolute symbolic links (CVE-2014-9356)
- Fix decompression of xz image archives, preventing privilege escalation (CVE-2014-9357)
- Validate image IDs (CVE-2014-9358)
@z

@x
### Runtime
- Fix an issue when image archives are being read slowly
@y
### Runtime
- Fix an issue when image archives are being read slowly
@z

@x
### Client
- Fix a regression related to stdin redirection
- Fix a regression with `docker cp` when destination is the current directory
@y
### Client
- Fix a regression related to stdin redirection
- Fix a regression with `docker cp` when destination is the current directory
@z

@x
## 1.3.2 (2014-11-20)
@y
## 1.3.2 (2014-11-20)
@z

@x
### Security
- Fix tar breakout vulnerability
* Extractions are now sandboxed chroot
- Security options are no longer committed to images
@y
### Security
- Fix tar breakout vulnerability
* Extractions are now sandboxed chroot
- Security options are no longer committed to images
@z

@x
### Runtime
- Fix deadlock in `docker ps -f exited=1`
- Fix a bug when `--volumes-from` references a container that failed to start
@y
### Runtime
- Fix deadlock in `docker ps -f exited=1`
- Fix a bug when `--volumes-from` references a container that failed to start
@z

@x
### Registry
+ `--insecure-registry` now accepts CIDR notation such as 10.1.0.0/16
* Private registries whose IPs fall in the 127.0.0.0/8 range do no need the `--insecure-registry` flag
- Skip the experimental registry v2 API when mirroring is enabled
@y
### Registry
+ `--insecure-registry` now accepts CIDR notation such as 10.1.0.0/16
* Private registries whose IPs fall in the 127.0.0.0/8 range do no need the `--insecure-registry` flag
- Skip the experimental registry v2 API when mirroring is enabled
@z

@x
## 1.3.1 (2014-10-28)
@y
## 1.3.1 (2014-10-28)
@z

@x
### Security
* Prevent fallback to SSL protocols < TLS 1.0 for client, daemon and registry
+ Secure HTTPS connection to registries with certificate verification and without HTTP fallback unless `--insecure-registry` is specified
@y
### Security
* Prevent fallback to SSL protocols < TLS 1.0 for client, daemon and registry
+ Secure HTTPS connection to registries with certificate verification and without HTTP fallback unless `--insecure-registry` is specified
@z

@x
### Runtime
- Fix issue where volumes would not be shared
@y
### Runtime
- Fix issue where volumes would not be shared
@z

@x
### Client
- Fix issue with `--iptables=false` not automatically setting `--ip-masq=false`
- Fix docker run output to non-TTY stdout
@y
### Client
- Fix issue with `--iptables=false` not automatically setting `--ip-masq=false`
- Fix docker run output to non-TTY stdout
@z

@x
### Builder
- Fix escaping `$` for environment variables
- Fix issue with lowercase `onbuild` Dockerfile instruction
- Restrict environment variable expansion to `ENV`, `ADD`, `COPY`, `WORKDIR`, `EXPOSE`, `VOLUME` and `USER`
@y
### Builder
- Fix escaping `$` for environment variables
- Fix issue with lowercase `onbuild` Dockerfile instruction
- Restrict environment variable expansion to `ENV`, `ADD`, `COPY`, `WORKDIR`, `EXPOSE`, `VOLUME` and `USER`
@z

@x
## 1.3.0 (2014-10-14)
@y
## 1.3.0 (2014-10-14)
@z

@x
### Notable features since 1.2.0
+ Docker `exec` allows you to run additional processes inside existing containers
+ Docker `create` gives you the ability to create a container via the CLI without executing a process
+ `--security-opts` options to allow user to customize container labels and apparmor profiles
+ Docker `ps` filters
- Wildcard support to COPY/ADD
+ Move production URLs to get.docker.com from get.docker.io
+ Allocate IP address on the bridge inside a valid CIDR
+ Use drone.io for PR and CI testing
+ Ability to setup an official registry mirror
+ Ability to save multiple images with docker `save`
@y
### Notable features since 1.2.0
+ Docker `exec` allows you to run additional processes inside existing containers
+ Docker `create` gives you the ability to create a container via the CLI without executing a process
+ `--security-opts` options to allow user to customize container labels and apparmor profiles
+ Docker `ps` filters
- Wildcard support to COPY/ADD
+ Move production URLs to get.docker.com from get.docker.io
+ Allocate IP address on the bridge inside a valid CIDR
+ Use drone.io for PR and CI testing
+ Ability to setup an official registry mirror
+ Ability to save multiple images with docker `save`
@z

@x
## 1.2.0 (2014-08-20)
@y
## 1.2.0 (2014-08-20)
@z

@x
### Runtime
+ Make /etc/hosts /etc/resolv.conf and /etc/hostname editable at runtime
+ Auto-restart containers using policies
+ Use /var/lib/docker/tmp for large temporary files
+ `--cap-add` and `--cap-drop` to tweak what linux capability you want
+ `--device` to use devices in containers
@y
### Runtime
+ Make /etc/hosts /etc/resolv.conf and /etc/hostname editable at runtime
+ Auto-restart containers using policies
+ Use /var/lib/docker/tmp for large temporary files
+ `--cap-add` and `--cap-drop` to tweak what linux capability you want
+ `--device` to use devices in containers
@z

@x
### Client
+ `docker search` on private registries
+ Add `exited` filter to `docker ps --filter`
* `docker rm -f` now kills instead of stop
+ Support for IPv6 addresses in `--dns` flag
@y
### Client
+ `docker search` on private registries
+ Add `exited` filter to `docker ps --filter`
* `docker rm -f` now kills instead of stop
+ Support for IPv6 addresses in `--dns` flag
@z

@x
### Proxy
+ Proxy instances in separate processes
* Small bug fix on UDP proxy
@y
### Proxy
+ Proxy instances in separate processes
* Small bug fix on UDP proxy
@z

@x
## 1.1.2 (2014-07-23)
@y
## 1.1.2 (2014-07-23)
@z

@x
### Runtime
+ Fix port allocation for existing containers
+ Fix containers restart on daemon restart
@y
### Runtime
+ Fix port allocation for existing containers
+ Fix containers restart on daemon restart
@z

@x
### Packaging
+ Fix /etc/init.d/docker issue on Debian
@y
### Packaging
+ Fix /etc/init.d/docker issue on Debian
@z

@x
## 1.1.1 (2014-07-09)
@y
## 1.1.1 (2014-07-09)
@z

@x
### Builder
* Fix issue with ADD
@y
### Builder
* Fix issue with ADD
@z

@x
## 1.1.0 (2014-07-03)
@y
## 1.1.0 (2014-07-03)
@z

@x
### Notable features since 1.0.1
+ Add `.dockerignore` support
+ Pause containers during `docker commit`
+ Add `--tail` to `docker logs`
@y
### Notable features since 1.0.1
+ Add `.dockerignore` support
+ Pause containers during `docker commit`
+ Add `--tail` to `docker logs`
@z

@x
### Builder
+ Allow a tar file as context for `docker build`
* Fix issue with white-spaces and multi-lines in `Dockerfiles`
@y
### Builder
+ Allow a tar file as context for `docker build`
* Fix issue with white-spaces and multi-lines in `Dockerfiles`
@z

@x
### Runtime
* Overall performance improvements
* Allow `/` as source of `docker run -v`
* Fix port allocation
* Fix bug in `docker save`
* Add links information to `docker inspect`
@y
### Runtime
* Overall performance improvements
* Allow `/` as source of `docker run -v`
* Fix port allocation
* Fix bug in `docker save`
* Add links information to `docker inspect`
@z

@x
### Client
* Improve command line parsing for `docker commit`
@y
### Client
* Improve command line parsing for `docker commit`
@z

@x
### Remote API
* Improve status code for the `start` and `stop` endpoints
@y
### Remote API
* Improve status code for the `start` and `stop` endpoints
@z

@x
## 1.0.1 (2014-06-19)
@y
## 1.0.1 (2014-06-19)
@z

@x
### Notable features since 1.0.0
* Enhance security for the LXC driver
@y
### Notable features since 1.0.0
* Enhance security for the LXC driver
@z

@x
### Builder
* Fix `ONBUILD` instruction passed to grandchildren
@y
### Builder
* Fix `ONBUILD` instruction passed to grandchildren
@z

@x
### Runtime
* Fix events subscription
* Fix /etc/hostname file with host networking
* Allow `-h` and `--net=none`
* Fix issue with hotplug devices in `--privileged`
@y
### Runtime
* Fix events subscription
* Fix /etc/hostname file with host networking
* Allow `-h` and `--net=none`
* Fix issue with hotplug devices in `--privileged`
@z

@x
### Client
* Fix artifacts with events
* Fix a panic with empty flags
* Fix `docker cp` on Mac OS X
@y
### Client
* Fix artifacts with events
* Fix a panic with empty flags
* Fix `docker cp` on Mac OS X
@z

@x
### Miscellaneous
* Fix compilation on Mac OS X
* Fix several races
@y
### Miscellaneous
* Fix compilation on Mac OS X
* Fix several races
@z

@x
## 1.0.0 (2014-06-09)
@y
## 1.0.0 (2014-06-09)
@z

@x
### Notable features since 0.12.0
* Production support
@y
### Notable features since 0.12.0
* Production support
@z

@x
## 0.12.0 (2014-06-05)
@y
## 0.12.0 (2014-06-05)
@z

@x
### Notable features since 0.11.0
* 40+ various improvements to stability, performance and usability
* New `COPY` Dockerfile instruction to allow copying a local file from the context into the container without ever extracting if the file is a tar file
* Inherit file permissions from the host on `ADD`
* New `pause` and `unpause` commands to allow pausing and unpausing of containers using cgroup freezer
* The `images` command has a `-f`/`--filter` option to filter the list of images
* Add `--force-rm` to clean up after a failed build
* Standardize JSON keys in Remote API to CamelCase
* Pull from a docker run now assumes `latest` tag if not specified
* Enhance security on Linux capabilities and device nodes
@y
### Notable features since 0.11.0
* 40+ various improvements to stability, performance and usability
* New `COPY` Dockerfile instruction to allow copying a local file from the context into the container without ever extracting if the file is a tar file
* Inherit file permissions from the host on `ADD`
* New `pause` and `unpause` commands to allow pausing and unpausing of containers using cgroup freezer
* The `images` command has a `-f`/`--filter` option to filter the list of images
* Add `--force-rm` to clean up after a failed build
* Standardize JSON keys in Remote API to CamelCase
* Pull from a docker run now assumes `latest` tag if not specified
* Enhance security on Linux capabilities and device nodes
@z

@x
## 0.11.1 (2014-05-07)
@y
## 0.11.1 (2014-05-07)
@z

@x
### Registry
- Fix push and pull to private registry
@y
### Registry
- Fix push and pull to private registry
@z

@x
## 0.11.0 (2014-05-07)
@y
## 0.11.0 (2014-05-07)
@z

@x
### Notable features since 0.10.0
@y
### Notable features since 0.10.0
@z

@x
* SELinux support for mount and process labels
* Linked containers can be accessed by hostname
* Use the net `--net` flag to allow advanced network configuration such as host networking so that containers can use the host's network interfaces
* Add a ping endpoint to the Remote API to do healthchecks of your docker daemon
* Logs can now be returned with an optional timestamp
* Docker now works with registries that support SHA-512
* Multiple registry endpoints are supported to allow registry mirrors
@y
* SELinux support for mount and process labels
* Linked containers can be accessed by hostname
* Use the net `--net` flag to allow advanced network configuration such as host networking so that containers can use the host's network interfaces
* Add a ping endpoint to the Remote API to do healthchecks of your docker daemon
* Logs can now be returned with an optional timestamp
* Docker now works with registries that support SHA-512
* Multiple registry endpoints are supported to allow registry mirrors
@z

@x
## 0.10.0 (2014-04-08)
@y
## 0.10.0 (2014-04-08)
@z

@x
### Builder
- Fix printing multiple messages on a single line. Fixes broken output during builds.
- Follow symlinks inside container's root for ADD build instructions.
- Fix EXPOSE caching.
@y
### Builder
- Fix printing multiple messages on a single line. Fixes broken output during builds.
- Follow symlinks inside container's root for ADD build instructions.
- Fix EXPOSE caching.
@z

@x
### Documentation
- Add the new options of `docker ps` to the documentation.
- Add the options of `docker restart` to the documentation.
- Update daemon docs and help messages for --iptables and --ip-forward.
- Updated apt-cacher-ng docs example.
- Remove duplicate description of --mtu from docs.
- Add missing -t and -v for `docker images` to the docs.
- Add fixes to the cli docs.
- Update libcontainer docs.
- Update images in docs to remove references to AUFS and LXC.
- Update the nodejs_web_app in the docs to use the new epel RPM address.
- Fix external link on security of containers.
- Update remote API docs.
- Add image size to history docs.
- Be explicit about binding to all interfaces in redis example.
- Document DisableNetwork flag in the 1.10 remote api.
- Document that `--lxc-conf` is lxc only.
- Add chef usage documentation.
- Add example for an image with multiple for `docker load`.
- Explain what `docker run -a` does in the docs.
@y
### Documentation
- Add the new options of `docker ps` to the documentation.
- Add the options of `docker restart` to the documentation.
- Update daemon docs and help messages for --iptables and --ip-forward.
- Updated apt-cacher-ng docs example.
- Remove duplicate description of --mtu from docs.
- Add missing -t and -v for `docker images` to the docs.
- Add fixes to the cli docs.
- Update libcontainer docs.
- Update images in docs to remove references to AUFS and LXC.
- Update the nodejs_web_app in the docs to use the new epel RPM address.
- Fix external link on security of containers.
- Update remote API docs.
- Add image size to history docs.
- Be explicit about binding to all interfaces in redis example.
- Document DisableNetwork flag in the 1.10 remote api.
- Document that `--lxc-conf` is lxc only.
- Add chef usage documentation.
- Add example for an image with multiple for `docker load`.
- Explain what `docker run -a` does in the docs.
@z

@x
### Contrib
- Add variable for DOCKER_LOGFILE to sysvinit and use append instead of overwrite in opening the logfile.
- Fix init script cgroup mounting workarounds to be more similar to cgroupfs-mount and thus work properly.
- Remove inotifywait hack from the upstart host-integration example because it's not necessary any more.
- Add check-config script to contrib.
- Fix fish shell completion.
@y
### Contrib
- Add variable for DOCKER_LOGFILE to sysvinit and use append instead of overwrite in opening the logfile.
- Fix init script cgroup mounting workarounds to be more similar to cgroupfs-mount and thus work properly.
- Remove inotifywait hack from the upstart host-integration example because it's not necessary any more.
- Add check-config script to contrib.
- Fix fish shell completion.
@z

@x
### Hack
* Clean up "go test" output from "make test" to be much more readable/scannable.
* Exclude more "definitely not unit tested Go source code" directories from hack/make/test.
+ Generate md5 and sha256 hashes when building, and upload them via hack/release.sh.
- Include contributed completions in Ubuntu PPA.
+ Add cli integration tests.
* Add tweaks to the hack scripts to make them simpler.
@y
### Hack
* Clean up "go test" output from "make test" to be much more readable/scannable.
* Exclude more "definitely not unit tested Go source code" directories from hack/make/test.
+ Generate md5 and sha256 hashes when building, and upload them via hack/release.sh.
- Include contributed completions in Ubuntu PPA.
+ Add cli integration tests.
* Add tweaks to the hack scripts to make them simpler.
@z

@x
### Remote API
+ Add TLS auth support for API.
* Move git clone from daemon to client.
- Fix content-type detection in docker cp.
* Split API into 2 go packages.
@y
### Remote API
+ Add TLS auth support for API.
* Move git clone from daemon to client.
- Fix content-type detection in docker cp.
* Split API into 2 go packages.
@z

@x
### Runtime
* Support hairpin NAT without going through Docker server.
- devicemapper: succeed immediately when removing non-existent devices.
- devicemapper: improve handling of devicemapper devices (add per device lock, increase sleep time and unlock while sleeping).
- devicemapper: increase timeout in waitClose to 10 seconds.
- devicemapper: ensure we shut down thin pool cleanly.
- devicemapper: pass info, rather than hash to activateDeviceIfNeeded, deactivateDevice, setInitialized, deleteDevice.
- devicemapper: avoid AB-BA deadlock.
- devicemapper: make shutdown better/faster.
- improve alpha sorting in mflag.
- Remove manual http cookie management because the cookiejar is being used.
- Use BSD raw mode on Darwin. Fixes nano, tmux and others.
- Add FreeBSD support for the client.
- Merge auth package into registry.
- Add deprecation warning for -t on `docker pull`.
- Remove goroutine leak on error.
- Update parseLxcInfo to comply with new lxc1.0 format.
- Fix attach exit on darwin.
- Improve deprecation message.
- Retry to retrieve the layer metadata up to 5 times for `docker pull`.
- Only unshare the mount namespace for execin.
- Merge existing config when committing.
- Disable daemon startup timeout.
- Fix issue #4681: add loopback interface when networking is disabled.
- Add failing test case for issue #4681.
- Send SIGTERM to child, instead of SIGKILL.
- Show the driver and the kernel version in `docker info` even when not in debug mode.
- Always symlink /dev/ptmx for libcontainer. This fixes console related problems.
- Fix issue caused by the absence of /etc/apparmor.d.
- Don't leave empty cidFile behind when failing to create the container.
- Mount cgroups automatically if they're not mounted already.
- Use mock for search tests.
- Update to double-dash everywhere.
- Move .dockerenv parsing to lxc driver.
- Move all bind-mounts in the container inside the namespace.
- Don't use separate bind mount for container.
- Always symlink /dev/ptmx for libcontainer.
- Don't kill by pid for other drivers.
- Add initial logging to libcontainer.
* Sort by port in `docker ps`.
- Move networking drivers into runtime top level package.
+ Add --no-prune to `docker rmi`.
+ Add time since exit in `docker ps`.
- graphdriver: add build tags.
- Prevent allocation of previously allocated ports & prevent improve port allocation.
* Add support for --since/--before in `docker ps`.
- Clean up container stop.
+ Add support for configurable dns search domains.
- Add support for relative WORKDIR instructions.
- Add --output flag for docker save.
- Remove duplication of DNS entries in config merging.
- Add cpuset.cpus to cgroups and native driver options.
- Remove docker-ci.
- Promote btrfs. btrfs is no longer considered experimental.
- Add --input flag to `docker load`.
- Return error when existing bridge doesn't match IP address.
- Strip comments before parsing line continuations to avoid interpreting instructions as comments.
- Fix TestOnlyLoopbackExistsWhenUsingDisableNetworkOption to ignore "DOWN" interfaces.
- Add systemd implementation of cgroups and make containers show up as systemd units.
- Fix commit and import when no repository is specified.
- Remount /var/lib/docker as --private to fix scaling issue.
- Use the environment's proxy when pinging the remote registry.
- Reduce error level from harmless errors.
* Allow --volumes-from to be individual files.
- Fix expanding buffer in StdCopy.
- Set error regardless of attach or stdin. This fixes #3364.
- Add support for --env-file to load environment variables from files.
- Symlink /etc/mtab and /proc/mounts.
- Allow pushing a single tag.
- Shut down containers cleanly at shutdown and wait forever for the containers to shut down. This makes container shutdown on daemon shutdown work properly via SIGTERM.
- Don't throw error when starting an already running container.
- Fix dynamic port allocation limit.
- remove setupDev from libcontainer.
- Add API version to `docker version`.
- Return correct exit code when receiving signal and make SIGQUIT quit without cleanup.
- Fix --volumes-from mount failure.
- Allow non-privileged containers to create device nodes.
- Skip login tests because of external dependency on a hosted service.
- Deprecate `docker images --tree` and `docker images --viz`.
- Deprecate `docker insert`.
- Include base abstraction for apparmor. This fixes some apparmor related problems on Ubuntu 14.04.
- Add specific error message when hitting 401 over HTTP on push.
- Fix absolute volume check.
- Remove volumes-from from the config.
- Move DNS options to hostconfig.
- Update the apparmor profile for libcontainer.
- Add deprecation notice for `docker commit -run`.
@y
### Runtime
* Support hairpin NAT without going through Docker server.
- devicemapper: succeed immediately when removing non-existent devices.
- devicemapper: improve handling of devicemapper devices (add per device lock, increase sleep time and unlock while sleeping).
- devicemapper: increase timeout in waitClose to 10 seconds.
- devicemapper: ensure we shut down thin pool cleanly.
- devicemapper: pass info, rather than hash to activateDeviceIfNeeded, deactivateDevice, setInitialized, deleteDevice.
- devicemapper: avoid AB-BA deadlock.
- devicemapper: make shutdown better/faster.
- improve alpha sorting in mflag.
- Remove manual http cookie management because the cookiejar is being used.
- Use BSD raw mode on Darwin. Fixes nano, tmux and others.
- Add FreeBSD support for the client.
- Merge auth package into registry.
- Add deprecation warning for -t on `docker pull`.
- Remove goroutine leak on error.
- Update parseLxcInfo to comply with new lxc1.0 format.
- Fix attach exit on darwin.
- Improve deprecation message.
- Retry to retrieve the layer metadata up to 5 times for `docker pull`.
- Only unshare the mount namespace for execin.
- Merge existing config when committing.
- Disable daemon startup timeout.
- Fix issue #4681: add loopback interface when networking is disabled.
- Add failing test case for issue #4681.
- Send SIGTERM to child, instead of SIGKILL.
- Show the driver and the kernel version in `docker info` even when not in debug mode.
- Always symlink /dev/ptmx for libcontainer. This fixes console related problems.
- Fix issue caused by the absence of /etc/apparmor.d.
- Don't leave empty cidFile behind when failing to create the container.
- Mount cgroups automatically if they're not mounted already.
- Use mock for search tests.
- Update to double-dash everywhere.
- Move .dockerenv parsing to lxc driver.
- Move all bind-mounts in the container inside the namespace.
- Don't use separate bind mount for container.
- Always symlink /dev/ptmx for libcontainer.
- Don't kill by pid for other drivers.
- Add initial logging to libcontainer.
* Sort by port in `docker ps`.
- Move networking drivers into runtime top level package.
+ Add --no-prune to `docker rmi`.
+ Add time since exit in `docker ps`.
- graphdriver: add build tags.
- Prevent allocation of previously allocated ports & prevent improve port allocation.
* Add support for --since/--before in `docker ps`.
- Clean up container stop.
+ Add support for configurable dns search domains.
- Add support for relative WORKDIR instructions.
- Add --output flag for docker save.
- Remove duplication of DNS entries in config merging.
- Add cpuset.cpus to cgroups and native driver options.
- Remove docker-ci.
- Promote btrfs. btrfs is no longer considered experimental.
- Add --input flag to `docker load`.
- Return error when existing bridge doesn't match IP address.
- Strip comments before parsing line continuations to avoid interpreting instructions as comments.
- Fix TestOnlyLoopbackExistsWhenUsingDisableNetworkOption to ignore "DOWN" interfaces.
- Add systemd implementation of cgroups and make containers show up as systemd units.
- Fix commit and import when no repository is specified.
- Remount /var/lib/docker as --private to fix scaling issue.
- Use the environment's proxy when pinging the remote registry.
- Reduce error level from harmless errors.
* Allow --volumes-from to be individual files.
- Fix expanding buffer in StdCopy.
- Set error regardless of attach or stdin. This fixes #3364.
- Add support for --env-file to load environment variables from files.
- Symlink /etc/mtab and /proc/mounts.
- Allow pushing a single tag.
- Shut down containers cleanly at shutdown and wait forever for the containers to shut down. This makes container shutdown on daemon shutdown work properly via SIGTERM.
- Don't throw error when starting an already running container.
- Fix dynamic port allocation limit.
- remove setupDev from libcontainer.
- Add API version to `docker version`.
- Return correct exit code when receiving signal and make SIGQUIT quit without cleanup.
- Fix --volumes-from mount failure.
- Allow non-privileged containers to create device nodes.
- Skip login tests because of external dependency on a hosted service.
- Deprecate `docker images --tree` and `docker images --viz`.
- Deprecate `docker insert`.
- Include base abstraction for apparmor. This fixes some apparmor related problems on Ubuntu 14.04.
- Add specific error message when hitting 401 over HTTP on push.
- Fix absolute volume check.
- Remove volumes-from from the config.
- Move DNS options to hostconfig.
- Update the apparmor profile for libcontainer.
- Add deprecation notice for `docker commit -run`.
@z

@x
## 0.9.1 (2014-03-24)
@y
## 0.9.1 (2014-03-24)
@z

@x
### Builder
- Fix printing multiple messages on a single line. Fixes broken output during builds.
@y
### Builder
- Fix printing multiple messages on a single line. Fixes broken output during builds.
@z

@x
### Documentation
- Fix external link on security of containers.
@y
### Documentation
- Fix external link on security of containers.
@z

@x
### Contrib
- Fix init script cgroup mounting workarounds to be more similar to cgroupfs-mount and thus work properly.
- Add variable for DOCKER_LOGFILE to sysvinit and use append instead of overwrite in opening the logfile.
@y
### Contrib
- Fix init script cgroup mounting workarounds to be more similar to cgroupfs-mount and thus work properly.
- Add variable for DOCKER_LOGFILE to sysvinit and use append instead of overwrite in opening the logfile.
@z

@x
### Hack
- Generate md5 and sha256 hashes when building, and upload them via hack/release.sh.
@y
### Hack
- Generate md5 and sha256 hashes when building, and upload them via hack/release.sh.
@z

@x
### Remote API
- Fix content-type detection in `docker cp`.
@y
### Remote API
- Fix content-type detection in `docker cp`.
@z

@x
### Runtime
- Use BSD raw mode on Darwin. Fixes nano, tmux and others.
- Only unshare the mount namespace for execin.
- Retry to retrieve the layer metadata up to 5 times for `docker pull`.
- Merge existing config when committing.
- Fix panic in monitor.
- Disable daemon startup timeout.
- Fix issue #4681: add loopback interface when networking is disabled.
- Add failing test case for issue #4681.
- Send SIGTERM to child, instead of SIGKILL.
- Show the driver and the kernel version in `docker info` even when not in debug mode.
- Always symlink /dev/ptmx for libcontainer. This fixes console related problems.
- Fix issue caused by the absence of /etc/apparmor.d.
- Don't leave empty cidFile behind when failing to create the container.
- Improve deprecation message.
- Fix attach exit on darwin.
- devicemapper: improve handling of devicemapper devices (add per device lock, increase sleep time, unlock while sleeping).
- devicemapper: succeed immediately when removing non-existent devices.
- devicemapper: increase timeout in waitClose to 10 seconds.
- Remove goroutine leak on error.
- Update parseLxcInfo to comply with new lxc1.0 format.
@y
### Runtime
- Use BSD raw mode on Darwin. Fixes nano, tmux and others.
- Only unshare the mount namespace for execin.
- Retry to retrieve the layer metadata up to 5 times for `docker pull`.
- Merge existing config when committing.
- Fix panic in monitor.
- Disable daemon startup timeout.
- Fix issue #4681: add loopback interface when networking is disabled.
- Add failing test case for issue #4681.
- Send SIGTERM to child, instead of SIGKILL.
- Show the driver and the kernel version in `docker info` even when not in debug mode.
- Always symlink /dev/ptmx for libcontainer. This fixes console related problems.
- Fix issue caused by the absence of /etc/apparmor.d.
- Don't leave empty cidFile behind when failing to create the container.
- Improve deprecation message.
- Fix attach exit on darwin.
- devicemapper: improve handling of devicemapper devices (add per device lock, increase sleep time, unlock while sleeping).
- devicemapper: succeed immediately when removing non-existent devices.
- devicemapper: increase timeout in waitClose to 10 seconds.
- Remove goroutine leak on error.
- Update parseLxcInfo to comply with new lxc1.0 format.
@z

@x
## 0.9.0 (2014-03-10)
@y
## 0.9.0 (2014-03-10)
@z

@x
### Builder
- Avoid extra mount/unmount during build. This fixes mount/unmount related errors during build.
- Add error to docker build --rm. This adds missing error handling.
- Forbid chained onbuild, `onbuild from` and  `onbuild maintainer` triggers.
- Make `--rm` the default for `docker build`.
@y
### Builder
- Avoid extra mount/unmount during build. This fixes mount/unmount related errors during build.
- Add error to docker build --rm. This adds missing error handling.
- Forbid chained onbuild, `onbuild from` and  `onbuild maintainer` triggers.
- Make `--rm` the default for `docker build`.
@z

@x
### Documentation
- Download the docker client binary for Mac over https.
- Update the titles of the install instructions & descriptions.
* Add instructions for upgrading boot2docker.
* Add port forwarding example in OS X install docs.
- Attempt to disentangle repository and registry.
- Update docs to explain more about `docker ps`.
- Update sshd example to use a Dockerfile.
- Rework some examples, including the Python examples.
- Update docs to include instructions for a container's lifecycle.
- Update docs documentation to discuss the docs branch.
- Don't skip cert check for an example & use HTTPS.
- Bring back the memory and swap accounting section which was lost when the kernel page was removed.
- Explain DNS warnings and how to fix them on systems running and using a local nameserver.
@y
### Documentation
- Download the docker client binary for Mac over https.
- Update the titles of the install instructions & descriptions.
* Add instructions for upgrading boot2docker.
* Add port forwarding example in OS X install docs.
- Attempt to disentangle repository and registry.
- Update docs to explain more about `docker ps`.
- Update sshd example to use a Dockerfile.
- Rework some examples, including the Python examples.
- Update docs to include instructions for a container's lifecycle.
- Update docs documentation to discuss the docs branch.
- Don't skip cert check for an example & use HTTPS.
- Bring back the memory and swap accounting section which was lost when the kernel page was removed.
- Explain DNS warnings and how to fix them on systems running and using a local nameserver.
@z

@x
### Contrib
- Add Tanglu support for mkimage-debootstrap.
- Add SteamOS support for mkimage-debootstrap.
@y
### Contrib
- Add Tanglu support for mkimage-debootstrap.
- Add SteamOS support for mkimage-debootstrap.
@z

@x
### Hack
- Get package coverage when running integration tests.
- Remove the Vagrantfile. This is being replaced with boot2docker.
- Fix tests on systems where aufs isn't available.
- Update packaging instructions and remove the dependency on lxc.
@y
### Hack
- Get package coverage when running integration tests.
- Remove the Vagrantfile. This is being replaced with boot2docker.
- Fix tests on systems where aufs isn't available.
- Update packaging instructions and remove the dependency on lxc.
@z

@x
### Remote API
* Move code specific to the API to the api package.
- Fix header content type for the API. Makes all endpoints use proper content type.
- Fix registry auth & remove ping calls from CmdPush and CmdPull.
- Add newlines to the JSON stream functions.
@y
### Remote API
* Move code specific to the API to the api package.
- Fix header content type for the API. Makes all endpoints use proper content type.
- Fix registry auth & remove ping calls from CmdPush and CmdPull.
- Add newlines to the JSON stream functions.
@z

@x
### Runtime
* Do not ping the registry from the CLI. All requests to registries flow through the daemon.
- Check for nil information return in the lxc driver. This fixes panics with older lxc versions.
- Devicemapper: cleanups and fix for unmount. Fixes two problems which were causing unmount to fail intermittently.
- Devicemapper: remove directory when removing device. Directories don't get left behind when removing the device.
* Devicemapper: enable skip_block_zeroing. Improves performance by not zeroing blocks.
- Devicemapper: fix shutdown warnings. Fixes shutdown warnings concerning pool device removal.
- Ensure docker cp stream is closed properly. Fixes problems with files not being copied by `docker cp`.
- Stop making `tcp://` default to `127.0.0.1:4243` and remove the default port for tcp.
- Fix `--run` in `docker commit`. This makes `docker commit --run` work again.
- Fix custom bridge related options. This makes custom bridges work again.
+ Mount-bind the PTY as container console. This allows tmux/screen to run.
+ Add the pure Go libcontainer library to make it possible to run containers using only features of the Linux kernel.
+ Add native exec driver which uses libcontainer and make it the default exec driver.
- Add support for handling extended attributes in archives.
* Set the container MTU to be the same as the host MTU.
+ Add simple sha256 checksums for layers to speed up `docker push`.
* Improve kernel version parsing.
* Allow flag grouping (`docker run -it`).
- Remove chroot exec driver.
- Fix divide by zero to fix panic.
- Rewrite `docker rmi`.
- Fix docker info with lxc 1.0.0.
- Fix fedora tty with apparmor.
* Don't always append env vars, replace defaults with vars from config.
* Fix a goroutine leak.
* Switch to Go 1.2.1.
- Fix unique constraint error checks.
* Handle symlinks for Docker's data directory and for TMPDIR.
- Add deprecation warnings for flags (-flag is deprecated in favor of --flag)
- Add apparmor profile for the native execution driver.
* Move system specific code from archive to pkg/system.
- Fix duplicate signal for `docker run -i -t` (issue #3336).
- Return correct process pid for lxc.
- Add a -G option to specify the group which unix sockets belong to.
+ Add `-f` flag to `docker rm` to force removal of running containers.
+ Kill ghost containers and restart all ghost containers when the docker daemon restarts.
+ Add `DOCKER_RAMDISK` environment variable to make Docker work when the root is on a ramdisk.
@y
### Runtime
* Do not ping the registry from the CLI. All requests to registries flow through the daemon.
- Check for nil information return in the lxc driver. This fixes panics with older lxc versions.
- Devicemapper: cleanups and fix for unmount. Fixes two problems which were causing unmount to fail intermittently.
- Devicemapper: remove directory when removing device. Directories don't get left behind when removing the device.
* Devicemapper: enable skip_block_zeroing. Improves performance by not zeroing blocks.
- Devicemapper: fix shutdown warnings. Fixes shutdown warnings concerning pool device removal.
- Ensure docker cp stream is closed properly. Fixes problems with files not being copied by `docker cp`.
- Stop making `tcp://` default to `127.0.0.1:4243` and remove the default port for tcp.
- Fix `--run` in `docker commit`. This makes `docker commit --run` work again.
- Fix custom bridge related options. This makes custom bridges work again.
+ Mount-bind the PTY as container console. This allows tmux/screen to run.
+ Add the pure Go libcontainer library to make it possible to run containers using only features of the Linux kernel.
+ Add native exec driver which uses libcontainer and make it the default exec driver.
- Add support for handling extended attributes in archives.
* Set the container MTU to be the same as the host MTU.
+ Add simple sha256 checksums for layers to speed up `docker push`.
* Improve kernel version parsing.
* Allow flag grouping (`docker run -it`).
- Remove chroot exec driver.
- Fix divide by zero to fix panic.
- Rewrite `docker rmi`.
- Fix docker info with lxc 1.0.0.
- Fix fedora tty with apparmor.
* Don't always append env vars, replace defaults with vars from config.
* Fix a goroutine leak.
* Switch to Go 1.2.1.
- Fix unique constraint error checks.
* Handle symlinks for Docker's data directory and for TMPDIR.
- Add deprecation warnings for flags (-flag is deprecated in favor of --flag)
- Add apparmor profile for the native execution driver.
* Move system specific code from archive to pkg/system.
- Fix duplicate signal for `docker run -i -t` (issue #3336).
- Return correct process pid for lxc.
- Add a -G option to specify the group which unix sockets belong to.
+ Add `-f` flag to `docker rm` to force removal of running containers.
+ Kill ghost containers and restart all ghost containers when the docker daemon restarts.
+ Add `DOCKER_RAMDISK` environment variable to make Docker work when the root is on a ramdisk.
@z

@x
## 0.8.1 (2014-02-18)
@y
## 0.8.1 (2014-02-18)
@z

@x
### Builder
@y
### Builder
@z

@x
- Avoid extra mount/unmount during build. This removes an unneeded mount/unmount operation which was causing problems with devicemapper
- Fix regression with ADD of tar files. This stops Docker from decompressing tarballs added via ADD from the local file system
- Add error to `docker build --rm`. This adds a missing error check to ensure failures to remove containers are detected and reported
@y
- Avoid extra mount/unmount during build. This removes an unneeded mount/unmount operation which was causing problems with devicemapper
- Fix regression with ADD of tar files. This stops Docker from decompressing tarballs added via ADD from the local file system
- Add error to `docker build --rm`. This adds a missing error check to ensure failures to remove containers are detected and reported
@z

@x
### Documentation
@y
### Documentation
@z

@x
* Update issue filing instructions
* Warn against the use of symlinks for Docker's storage folder
* Replace the Firefox example with an IceWeasel example
* Rewrite the PostgreSQL example using a Dockerfile and add more details to it
* Improve the OS X documentation
@y
* Update issue filing instructions
* Warn against the use of symlinks for Docker's storage folder
* Replace the Firefox example with an IceWeasel example
* Rewrite the PostgreSQL example using a Dockerfile and add more details to it
* Improve the OS X documentation
@z

@x
### Remote API
@y
### Remote API
@z

@x
- Fix broken images API for version less than 1.7
- Use the right encoding for all API endpoints which return JSON
- Move remote api client to api/
- Queue calls to the API using generic socket wait
@y
- Fix broken images API for version less than 1.7
- Use the right encoding for all API endpoints which return JSON
- Move remote api client to api/
- Queue calls to the API using generic socket wait
@z

@x
### Runtime
@y
### Runtime
@z

@x
- Fix the use of custom settings for bridges and custom bridges
- Refactor the devicemapper code to avoid many mount/unmount race conditions and failures
- Remove two panics which could make Docker crash in some situations
- Don't ping registry from the CLI client
- Enable skip_block_zeroing for devicemapper. This stops devicemapper from always zeroing entire blocks
- Fix --run in `docker commit`. This makes docker commit store `--run` in the image configuration
- Remove directory when removing devicemapper device. This cleans up leftover mount directories
- Drop NET_ADMIN capability for non-privileged containers. Unprivileged containers can't change their network configuration
- Ensure `docker cp` stream is closed properly
- Avoid extra mount/unmount during container registration. This removes an unneeded mount/unmount operation which was causing problems with devicemapper
- Stop allowing tcp:// as a default tcp bin address which binds to 127.0.0.1:4243 and remove the default port
+ Mount-bind the PTY as container console. This allows tmux and screen to run in a container
- Clean up archive closing. This fixes and improves archive handling
- Fix engine tests on systems where temp directories are symlinked
- Add test methods for save and load
- Avoid temporarily unmounting the container when restarting it. This fixes a race for devicemapper during restart
- Support submodules when building from a GitHub repository
- Quote volume path to allow spaces
- Fix remote tar ADD behavior. This fixes a regression which was causing Docker to extract tarballs
@y
- Fix the use of custom settings for bridges and custom bridges
- Refactor the devicemapper code to avoid many mount/unmount race conditions and failures
- Remove two panics which could make Docker crash in some situations
- Don't ping registry from the CLI client
- Enable skip_block_zeroing for devicemapper. This stops devicemapper from always zeroing entire blocks
- Fix --run in `docker commit`. This makes docker commit store `--run` in the image configuration
- Remove directory when removing devicemapper device. This cleans up leftover mount directories
- Drop NET_ADMIN capability for non-privileged containers. Unprivileged containers can't change their network configuration
- Ensure `docker cp` stream is closed properly
- Avoid extra mount/unmount during container registration. This removes an unneeded mount/unmount operation which was causing problems with devicemapper
- Stop allowing tcp:// as a default tcp bin address which binds to 127.0.0.1:4243 and remove the default port
+ Mount-bind the PTY as container console. This allows tmux and screen to run in a container
- Clean up archive closing. This fixes and improves archive handling
- Fix engine tests on systems where temp directories are symlinked
- Add test methods for save and load
- Avoid temporarily unmounting the container when restarting it. This fixes a race for devicemapper during restart
- Support submodules when building from a GitHub repository
- Quote volume path to allow spaces
- Fix remote tar ADD behavior. This fixes a regression which was causing Docker to extract tarballs
@z

@x
## 0.8.0 (2014-02-04)
@y
## 0.8.0 (2014-02-04)
@z

@x
### Notable features since 0.7.0
@y
### Notable features since 0.7.0
@z

@x
* Images and containers can be removed much faster
* Building an image from source with docker build is now much faster
* The Docker daemon starts and stops much faster
* The memory footprint of many common operations has been reduced, by streaming files instead of buffering them in memory, fixing memory leaks, and fixing various suboptimal memory allocations
* Several race conditions were fixed, making Docker more stable under very high concurrency load. This makes Docker more stable and less likely to crash and reduces the memory footprint of many common operations
* All packaging operations are now built on the Go language’s standard tar implementation, which is bundled with Docker itself. This makes packaging more portable across host distributions, and solves several issues caused by quirks and incompatibilities between different distributions of tar
* Docker can now create, remove and modify larger numbers of containers and images graciously thanks to more aggressive releasing of system resources. For example the storage driver API now allows Docker to do reference counting on mounts created by the drivers
With the ongoing changes to the networking and execution subsystems of docker testing these areas have been a focus of the refactoring.  By moving these subsystems into separate packages we can test, analyze, and monitor coverage and quality of these packages
* Many components have been separated into smaller sub-packages, each with a dedicated test suite. As a result the code is better-tested, more readable and easier to change
@y
* Images and containers can be removed much faster
* Building an image from source with docker build is now much faster
* The Docker daemon starts and stops much faster
* The memory footprint of many common operations has been reduced, by streaming files instead of buffering them in memory, fixing memory leaks, and fixing various suboptimal memory allocations
* Several race conditions were fixed, making Docker more stable under very high concurrency load. This makes Docker more stable and less likely to crash and reduces the memory footprint of many common operations
* All packaging operations are now built on the Go language’s standard tar implementation, which is bundled with Docker itself. This makes packaging more portable across host distributions, and solves several issues caused by quirks and incompatibilities between different distributions of tar
* Docker can now create, remove and modify larger numbers of containers and images graciously thanks to more aggressive releasing of system resources. For example the storage driver API now allows Docker to do reference counting on mounts created by the drivers
With the ongoing changes to the networking and execution subsystems of docker testing these areas have been a focus of the refactoring.  By moving these subsystems into separate packages we can test, analyze, and monitor coverage and quality of these packages
* Many components have been separated into smaller sub-packages, each with a dedicated test suite. As a result the code is better-tested, more readable and easier to change
@z

@x
* The ADD instruction now supports caching, which avoids unnecessarily re-uploading the same source content again and again when it hasn’t changed
* The new ONBUILD instruction adds to your image a “trigger” instruction to be executed at a later time, when the image is used as the base for another build
* Docker now ships with an experimental storage driver which uses the BTRFS filesystem for copy-on-write
* Docker is officially supported on Mac OS X
* The Docker daemon supports systemd socket activation
@y
* The ADD instruction now supports caching, which avoids unnecessarily re-uploading the same source content again and again when it hasn’t changed
* The new ONBUILD instruction adds to your image a “trigger” instruction to be executed at a later time, when the image is used as the base for another build
* Docker now ships with an experimental storage driver which uses the BTRFS filesystem for copy-on-write
* Docker is officially supported on Mac OS X
* The Docker daemon supports systemd socket activation
@z

@x
## 0.7.6 (2014-01-14)
@y
## 0.7.6 (2014-01-14)
@z

@x
### Builder
@y
### Builder
@z

@x
* Do not follow symlink outside of build context
@y
* Do not follow symlink outside of build context
@z

@x
### Runtime
@y
### Runtime
@z

@x
- Remount bind mounts when ro is specified
* Use https for fetching docker version
@y
- Remount bind mounts when ro is specified
* Use https for fetching docker version
@z

@x
### Other
@y
### Other
@z

@x
* Inline the test.docker.io fingerprint
* Add ca-certificates to packaging documentation
@y
* Inline the test.docker.io fingerprint
* Add ca-certificates to packaging documentation
@z

@x
## 0.7.5 (2014-01-09)
@y
## 0.7.5 (2014-01-09)
@z

@x
### Builder
@y
### Builder
@z

@x
* Disable compression for build. More space usage but a much faster upload
- Fix ADD caching for certain paths
- Do not compress archive from git build
@y
* Disable compression for build. More space usage but a much faster upload
- Fix ADD caching for certain paths
- Do not compress archive from git build
@z

@x
### Documentation
@y
### Documentation
@z

@x
- Fix error in GROUP add example
* Make sure the GPG fingerprint is inline in the documentation
* Give more specific advice on setting up signing of commits for DCO
@y
- Fix error in GROUP add example
* Make sure the GPG fingerprint is inline in the documentation
* Give more specific advice on setting up signing of commits for DCO
@z

@x
### Runtime
@y
### Runtime
@z

@x
- Fix misspelled container names
- Do not add hostname when networking is disabled
* Return most recent image from the cache by date
- Return all errors from docker wait
* Add Content-Type Header "application/json" to GET /version and /info responses
@y
- Fix misspelled container names
- Do not add hostname when networking is disabled
* Return most recent image from the cache by date
- Return all errors from docker wait
* Add Content-Type Header "application/json" to GET /version and /info responses
@z

@x
### Other
@y
### Other
@z

@x
* Update DCO to version 1.1
+ Update Makefile to use "docker:GIT_BRANCH" as the generated image name
* Update Travis to check for new 1.1 DCO version
@y
* Update DCO to version 1.1
+ Update Makefile to use "docker:GIT_BRANCH" as the generated image name
* Update Travis to check for new 1.1 DCO version
@z

@x
## 0.7.4 (2014-01-07)
@y
## 0.7.4 (2014-01-07)
@z

@x
### Builder
@y
### Builder
@z

@x
- Fix ADD caching issue with . prefixed path
- Fix docker build on devicemapper by reverting sparse file tar option
- Fix issue with file caching and prevent wrong cache hit
* Use same error handling while unmarshalling CMD and ENTRYPOINT
@y
- Fix ADD caching issue with . prefixed path
- Fix docker build on devicemapper by reverting sparse file tar option
- Fix issue with file caching and prevent wrong cache hit
* Use same error handling while unmarshalling CMD and ENTRYPOINT
@z

@x
### Documentation
@y
### Documentation
@z

@x
* Simplify and streamline Amazon Quickstart
* Install instructions use unprefixed Fedora image
* Update instructions for mtu flag for Docker on GCE
+ Add Ubuntu Saucy to installation
- Fix for wrong version warning on master instead of latest
@y
* Simplify and streamline Amazon Quickstart
* Install instructions use unprefixed Fedora image
* Update instructions for mtu flag for Docker on GCE
+ Add Ubuntu Saucy to installation
- Fix for wrong version warning on master instead of latest
@z

@x
### Runtime
@y
### Runtime
@z

@x
- Only get the image's rootfs when we need to calculate the image size
- Correctly handle unmapping UDP ports
* Make CopyFileWithTar use a pipe instead of a buffer to save memory on docker build
- Fix login message to say pull instead of push
- Fix "docker load" help by removing "SOURCE" prompt and mentioning STDIN
* Make blank -H option default to the same as no -H was sent
* Extract cgroups utilities to own submodule
@y
- Only get the image's rootfs when we need to calculate the image size
- Correctly handle unmapping UDP ports
* Make CopyFileWithTar use a pipe instead of a buffer to save memory on docker build
- Fix login message to say pull instead of push
- Fix "docker load" help by removing "SOURCE" prompt and mentioning STDIN
* Make blank -H option default to the same as no -H was sent
* Extract cgroups utilities to own submodule
@z

@x
### Other
@y
### Other
@z

@x
+ Add Travis CI configuration to validate DCO and gofmt requirements
+ Add Developer Certificate of Origin Text
* Upgrade VBox Guest Additions
* Check standalone header when pinging a registry server
@y
+ Add Travis CI configuration to validate DCO and gofmt requirements
+ Add Developer Certificate of Origin Text
* Upgrade VBox Guest Additions
* Check standalone header when pinging a registry server
@z

@x
## 0.7.3 (2014-01-02)
@y
## 0.7.3 (2014-01-02)
@z

@x
### Builder
@y
### Builder
@z

@x
+ Update ADD to use the image cache, based on a hash of the added content
* Add error message for empty Dockerfile
@y
+ Update ADD to use the image cache, based on a hash of the added content
* Add error message for empty Dockerfile
@z

@x
### Documentation
@y
### Documentation
@z

@x
- Fix outdated link to the "Introduction" on www.docker.io
+ Update the docs to get wider when the screen does
- Add information about needing to install LXC when using raw binaries
* Update Fedora documentation to disentangle the docker and docker.io conflict
* Add a note about using the new `-mtu` flag in several GCE zones
+ Add FrugalWare installation instructions
+ Add a more complete example of `docker run`
- Fix API documentation for creating and starting Privileged containers
- Add missing "name" parameter documentation on "/containers/create"
* Add a mention of `lxc-checkconfig` as a way to check for some of the necessary kernel configuration
- Update the 1.8 API documentation with some additions that were added to the docs for 1.7
@y
- Fix outdated link to the "Introduction" on www.docker.io
+ Update the docs to get wider when the screen does
- Add information about needing to install LXC when using raw binaries
* Update Fedora documentation to disentangle the docker and docker.io conflict
* Add a note about using the new `-mtu` flag in several GCE zones
+ Add FrugalWare installation instructions
+ Add a more complete example of `docker run`
- Fix API documentation for creating and starting Privileged containers
- Add missing "name" parameter documentation on "/containers/create"
* Add a mention of `lxc-checkconfig` as a way to check for some of the necessary kernel configuration
- Update the 1.8 API documentation with some additions that were added to the docs for 1.7
@z

@x
### Hack
@y
### Hack
@z

@x
- Add missing libdevmapper dependency to the packagers documentation
* Update minimum Go requirement to a hard line at Go 1.2+
* Many minor improvements to the Vagrantfile
+ Add ability to customize dockerinit search locations when compiling (to be used very sparingly only by packagers of platforms who require a nonstandard location)
+ Add coverprofile generation reporting
- Add `-a` to our Go build flags, removing the need for recompiling the stdlib manually
* Update Dockerfile to be more canonical and have less spurious warnings during build
- Fix some miscellaneous `docker pull` progress bar display issues
* Migrate more miscellaneous packages under the "pkg" folder
* Update TextMate highlighting to automatically be enabled for files named "Dockerfile"
* Reorganize syntax highlighting files under a common "contrib/syntax" directory
* Update install.sh script (https://get.docker.io/) to not fail if busybox fails to download or run at the end of the Ubuntu/Debian installation
* Add support for container names in bash completion
@y
- Add missing libdevmapper dependency to the packagers documentation
* Update minimum Go requirement to a hard line at Go 1.2+
* Many minor improvements to the Vagrantfile
+ Add ability to customize dockerinit search locations when compiling (to be used very sparingly only by packagers of platforms who require a nonstandard location)
+ Add coverprofile generation reporting
- Add `-a` to our Go build flags, removing the need for recompiling the stdlib manually
* Update Dockerfile to be more canonical and have less spurious warnings during build
- Fix some miscellaneous `docker pull` progress bar display issues
* Migrate more miscellaneous packages under the "pkg" folder
* Update TextMate highlighting to automatically be enabled for files named "Dockerfile"
* Reorganize syntax highlighting files under a common "contrib/syntax" directory
* Update install.sh script (https://get.docker.io/) to not fail if busybox fails to download or run at the end of the Ubuntu/Debian installation
* Add support for container names in bash completion
@z

@x
### Packaging
@y
### Packaging
@z

@x
+ Add an official Docker client binary for Darwin (Mac OS X)
* Remove empty "Vendor" string and added "License" on deb package
+ Add a stubbed version of "/etc/default/docker" in the deb package
@y
+ Add an official Docker client binary for Darwin (Mac OS X)
* Remove empty "Vendor" string and added "License" on deb package
+ Add a stubbed version of "/etc/default/docker" in the deb package
@z

@x
### Runtime
@y
### Runtime
@z

@x
* Update layer application to extract tars in place, avoiding file churn while handling whiteouts
- Fix permissiveness of mtime comparisons in tar handling (since GNU tar and Go tar do not yet support sub-second mtime precision)
* Reimplement `docker top` in pure Go to work more consistently, and even inside Docker-in-Docker (thus removing the shell injection vulnerability present in some versions of `lxc-ps`)
+ Update `-H unix://` to work similarly to `-H tcp://` by inserting the default values for missing portions
- Fix more edge cases regarding dockerinit and deleted or replaced docker or dockerinit files
* Update container name validation to include '.'
- Fix use of a symlink or non-absolute path as the argument to `-g` to work as expected
* Update to handle external mounts outside of LXC, fixing many small mounting quirks and making future execution backends and other features simpler
* Update to use proper box-drawing characters everywhere in `docker images -tree`
* Move MTU setting from LXC configuration to directly use netlink
* Add `-S` option to external tar invocation for more efficient spare file handling
+ Add arch/os info to User-Agent string, especially for registry requests
+ Add `-mtu` option to Docker daemon for configuring MTU
- Fix `docker build` to exit with a non-zero exit code on error
+ Add `DOCKER_HOST` environment variable to configure the client `-H` flag without specifying it manually for every invocation
@y
* Update layer application to extract tars in place, avoiding file churn while handling whiteouts
- Fix permissiveness of mtime comparisons in tar handling (since GNU tar and Go tar do not yet support sub-second mtime precision)
* Reimplement `docker top` in pure Go to work more consistently, and even inside Docker-in-Docker (thus removing the shell injection vulnerability present in some versions of `lxc-ps`)
+ Update `-H unix://` to work similarly to `-H tcp://` by inserting the default values for missing portions
- Fix more edge cases regarding dockerinit and deleted or replaced docker or dockerinit files
* Update container name validation to include '.'
- Fix use of a symlink or non-absolute path as the argument to `-g` to work as expected
* Update to handle external mounts outside of LXC, fixing many small mounting quirks and making future execution backends and other features simpler
* Update to use proper box-drawing characters everywhere in `docker images -tree`
* Move MTU setting from LXC configuration to directly use netlink
* Add `-S` option to external tar invocation for more efficient spare file handling
+ Add arch/os info to User-Agent string, especially for registry requests
+ Add `-mtu` option to Docker daemon for configuring MTU
- Fix `docker build` to exit with a non-zero exit code on error
+ Add `DOCKER_HOST` environment variable to configure the client `-H` flag without specifying it manually for every invocation
@z

@x
## 0.7.2 (2013-12-16)
@y
## 0.7.2 (2013-12-16)
@z

@x
### Runtime
@y
### Runtime
@z

@x
+ Validate container names on creation with standard regex
* Increase maximum image depth to 127 from 42
* Continue to move api endpoints to the job api
+ Add -bip flag to allow specification of dynamic bridge IP via CIDR
- Allow bridge creation when ipv6 is not enabled on certain systems
* Set hostname and IP address from within dockerinit
* Drop capabilities from within dockerinit
- Fix volumes on host when symlink is present the image
- Prevent deletion of image if ANY container is depending on it even if the container is not running
* Update docker push to use new progress display
* Use os.Lstat to allow mounting unix sockets when inspecting volumes
- Adjust handling of inactive user login
- Add missing defines in devicemapper for older kernels
- Allow untag operations with no container validation
- Add auth config to docker build
@y
+ Validate container names on creation with standard regex
* Increase maximum image depth to 127 from 42
* Continue to move api endpoints to the job api
+ Add -bip flag to allow specification of dynamic bridge IP via CIDR
- Allow bridge creation when ipv6 is not enabled on certain systems
* Set hostname and IP address from within dockerinit
* Drop capabilities from within dockerinit
- Fix volumes on host when symlink is present the image
- Prevent deletion of image if ANY container is depending on it even if the container is not running
* Update docker push to use new progress display
* Use os.Lstat to allow mounting unix sockets when inspecting volumes
- Adjust handling of inactive user login
- Add missing defines in devicemapper for older kernels
- Allow untag operations with no container validation
- Add auth config to docker build
@z

@x
### Documentation
@y
### Documentation
@z

@x
* Add more information about Docker logging
+ Add RHEL documentation
* Add a direct example for changing the CMD that is run in a container
* Update Arch installation documentation
+ Add section on Trusted Builds
+ Add Network documentation page
@y
* Add more information about Docker logging
+ Add RHEL documentation
* Add a direct example for changing the CMD that is run in a container
* Update Arch installation documentation
+ Add section on Trusted Builds
+ Add Network documentation page
@z

@x
### Other
@y
### Other
@z

@x
+ Add new cover bundle for providing code coverage reporting
* Separate integration tests in bundles
* Make Tianon the hack maintainer
* Update mkimage-debootstrap with more tweaks for keeping images small
* Use https to get the install script
* Remove vendored dotcloud/tar now that Go 1.2 has been released
@y
+ Add new cover bundle for providing code coverage reporting
* Separate integration tests in bundles
* Make Tianon the hack maintainer
* Update mkimage-debootstrap with more tweaks for keeping images small
* Use https to get the install script
* Remove vendored dotcloud/tar now that Go 1.2 has been released
@z

@x
## 0.7.1 (2013-12-05)
@y
## 0.7.1 (2013-12-05)
@z

@x
### Documentation
@y
### Documentation
@z

@x
+ Add @SvenDowideit as documentation maintainer
+ Add links example
+ Add documentation regarding ambassador pattern
+ Add Google Cloud Platform docs
+ Add dockerfile best practices
* Update doc for RHEL
* Update doc for registry
* Update Postgres examples
* Update doc for Ubuntu install
* Improve remote api doc
@y
+ Add @SvenDowideit as documentation maintainer
+ Add links example
+ Add documentation regarding ambassador pattern
+ Add Google Cloud Platform docs
+ Add dockerfile best practices
* Update doc for RHEL
* Update doc for registry
* Update Postgres examples
* Update doc for Ubuntu install
* Improve remote api doc
@z

@x
### Runtime
@y
### Runtime
@z

@x
+ Add hostconfig to docker inspect
+ Implement `docker log -f` to stream logs
+ Add env variable to disable kernel version warning
+ Add -format to `docker inspect`
+ Support bind-mount for files
- Fix bridge creation on RHEL
- Fix image size calculation
- Make sure iptables are called even if the bridge already exists
- Fix issue with stderr only attach
- Remove init layer when destroying a container
- Fix same port binding on different interfaces
- `docker build` now returns the correct exit code
- Fix `docker port` to display correct port
- `docker build` now check that the dockerfile exists client side
- `docker attach` now returns the correct exit code
- Remove the name entry when the container does not exist
@y
+ Add hostconfig to docker inspect
+ Implement `docker log -f` to stream logs
+ Add env variable to disable kernel version warning
+ Add -format to `docker inspect`
+ Support bind-mount for files
- Fix bridge creation on RHEL
- Fix image size calculation
- Make sure iptables are called even if the bridge already exists
- Fix issue with stderr only attach
- Remove init layer when destroying a container
- Fix same port binding on different interfaces
- `docker build` now returns the correct exit code
- Fix `docker port` to display correct port
- `docker build` now check that the dockerfile exists client side
- `docker attach` now returns the correct exit code
- Remove the name entry when the container does not exist
@z

@x
### Registry
@y
### Registry
@z

@x
* Improve progress bars, add ETA for downloads
* Simultaneous pulls now waits for the first to finish instead of failing
- Tag only the top-layer image when pushing to registry
- Fix issue with offline image transfer
- Fix issue preventing using ':' in password for registry
@y
* Improve progress bars, add ETA for downloads
* Simultaneous pulls now waits for the first to finish instead of failing
- Tag only the top-layer image when pushing to registry
- Fix issue with offline image transfer
- Fix issue preventing using ':' in password for registry
@z

@x
### Other
@y
### Other
@z

@x
+ Add pprof handler for debug
+ Create a Makefile
* Use stdlib tar that now includes fix
* Improve make.sh test script
* Handle SIGQUIT on the daemon
* Disable verbose during tests
* Upgrade to go1.2 for official build
* Improve unit tests
* The test suite now runs all tests even if one fails
* Refactor C in Go (Devmapper)
- Fix OS X compilation
@y
+ Add pprof handler for debug
+ Create a Makefile
* Use stdlib tar that now includes fix
* Improve make.sh test script
* Handle SIGQUIT on the daemon
* Disable verbose during tests
* Upgrade to go1.2 for official build
* Improve unit tests
* The test suite now runs all tests even if one fails
* Refactor C in Go (Devmapper)
- Fix OS X compilation
@z

@x
## 0.7.0 (2013-11-25)
@y
## 0.7.0 (2013-11-25)
@z

@x
### Notable features since 0.6.0
@y
### Notable features since 0.6.0
@z

@x
* Storage drivers: choose from aufs, device-mapper, or vfs.
* Standard Linux support: docker now runs on unmodified Linux kernels and all major distributions.
* Links: compose complex software stacks by connecting containers to each other.
* Container naming: organize your containers by giving them memorable names.
* Advanced port redirects: specify port redirects per interface, or keep sensitive ports private.
* Offline transfer: push and pull images to the filesystem without losing information.
* Quality: numerous bugfixes and small usability improvements. Significant increase in test coverage.
@y
* Storage drivers: choose from aufs, device-mapper, or vfs.
* Standard Linux support: docker now runs on unmodified Linux kernels and all major distributions.
* Links: compose complex software stacks by connecting containers to each other.
* Container naming: organize your containers by giving them memorable names.
* Advanced port redirects: specify port redirects per interface, or keep sensitive ports private.
* Offline transfer: push and pull images to the filesystem without losing information.
* Quality: numerous bugfixes and small usability improvements. Significant increase in test coverage.
@z

@x
## 0.6.7 (2013-11-21)
@y
## 0.6.7 (2013-11-21)
@z

@x
### Runtime
@y
### Runtime
@z

@x
* Improve stability, fixes some race conditions
* Skip the volumes mounted when deleting the volumes of container.
* Fix layer size computation: handle hard links correctly
* Use the work Path for docker cp CONTAINER:PATH
* Fix tmp dir never cleanup
* Speedup docker ps
* More informative error message on name collisions
* Fix nameserver regex
* Always return long id's
* Fix container restart race condition
* Keep published ports on docker stop;docker start
* Fix container networking on Fedora
* Correctly express "any address" to iptables
* Fix network setup when reconnecting to ghost container
* Prevent deletion if image is used by a running container
* Lock around read operations in graph
@y
* Improve stability, fixes some race conditions
* Skip the volumes mounted when deleting the volumes of container.
* Fix layer size computation: handle hard links correctly
* Use the work Path for docker cp CONTAINER:PATH
* Fix tmp dir never cleanup
* Speedup docker ps
* More informative error message on name collisions
* Fix nameserver regex
* Always return long id's
* Fix container restart race condition
* Keep published ports on docker stop;docker start
* Fix container networking on Fedora
* Correctly express "any address" to iptables
* Fix network setup when reconnecting to ghost container
* Prevent deletion if image is used by a running container
* Lock around read operations in graph
@z

@x
### RemoteAPI
@y
### RemoteAPI
@z

@x
* Return full ID on docker rmi
@y
* Return full ID on docker rmi
@z

@x
### Client
@y
### Client
@z

@x
+ Add -tree option to images
+ Offline image transfer
* Exit with status 2 on usage error and display usage on stderr
* Do not forward SIGCHLD to container
* Use string timestamp for docker events -since
@y
+ Add -tree option to images
+ Offline image transfer
* Exit with status 2 on usage error and display usage on stderr
* Do not forward SIGCHLD to container
* Use string timestamp for docker events -since
@z

@x
### Other
@y
### Other
@z

@x
* Update to go 1.2rc5
+ Add /etc/default/docker support to upstart
@y
* Update to go 1.2rc5
+ Add /etc/default/docker support to upstart
@z

@x
## 0.6.6 (2013-11-06)
@y
## 0.6.6 (2013-11-06)
@z

@x
### Runtime
@y
### Runtime
@z

@x
* Ensure container name on register
* Fix regression in /etc/hosts
+ Add lock around write operations in graph
* Check if port is valid
* Fix restart runtime error with ghost container networking
+ Add some more colors and animals to increase the pool of generated names
* Fix issues in docker inspect
+ Escape apparmor confinement
+ Set environment variables using a file.
* Prevent docker insert to erase something
+ Prevent DNS server conflicts in CreateBridgeIface
+ Validate bind mounts on the server side
+ Use parent image config in docker build
* Fix regression in /etc/hosts
@y
* Ensure container name on register
* Fix regression in /etc/hosts
+ Add lock around write operations in graph
* Check if port is valid
* Fix restart runtime error with ghost container networking
+ Add some more colors and animals to increase the pool of generated names
* Fix issues in docker inspect
+ Escape apparmor confinement
+ Set environment variables using a file.
* Prevent docker insert to erase something
+ Prevent DNS server conflicts in CreateBridgeIface
+ Validate bind mounts on the server side
+ Use parent image config in docker build
* Fix regression in /etc/hosts
@z

@x
### Client
@y
### Client
@z

@x
+ Add -P flag to publish all exposed ports
+ Add -notrunc and -q flags to docker history
* Fix docker commit, tag and import usage
+ Add stars, trusted builds and library flags in docker search
* Fix docker logs with tty
@y
+ Add -P flag to publish all exposed ports
+ Add -notrunc and -q flags to docker history
* Fix docker commit, tag and import usage
+ Add stars, trusted builds and library flags in docker search
* Fix docker logs with tty
@z

@x
### RemoteAPI
@y
### RemoteAPI
@z

@x
* Make /events API send headers immediately
* Do not split last column docker top
+ Add size to history
@y
* Make /events API send headers immediately
* Do not split last column docker top
+ Add size to history
@z

@x
### Other
@y
### Other
@z

@x
+ Contrib: Desktop integration. Firefox usecase.
+ Dockerfile: bump to go1.2rc3
@y
+ Contrib: Desktop integration. Firefox usecase.
+ Dockerfile: bump to go1.2rc3
@z

@x
## 0.6.5 (2013-10-29)
@y
## 0.6.5 (2013-10-29)
@z

@x
### Runtime
@y
### Runtime
@z

@x
+ Containers can now be named
+ Containers can now be linked together for service discovery
+ 'run -a', 'start -a' and 'attach' can forward signals to the container for better integration with process supervisors
+ Automatically start crashed containers after a reboot
+ Expose IP, port, and proto as separate environment vars for container links
* Allow ports to be published to specific ips
* Prohibit inter-container communication by default
- Ignore ErrClosedPipe for stdin in Container.Attach
- Remove unused field kernelVersion
* Fix issue when mounting subdirectories of /mnt in container
- Fix untag during removal of images
* Check return value of syscall.Chdir when changing working directory inside dockerinit
@y
+ Containers can now be named
+ Containers can now be linked together for service discovery
+ 'run -a', 'start -a' and 'attach' can forward signals to the container for better integration with process supervisors
+ Automatically start crashed containers after a reboot
+ Expose IP, port, and proto as separate environment vars for container links
* Allow ports to be published to specific ips
* Prohibit inter-container communication by default
- Ignore ErrClosedPipe for stdin in Container.Attach
- Remove unused field kernelVersion
* Fix issue when mounting subdirectories of /mnt in container
- Fix untag during removal of images
* Check return value of syscall.Chdir when changing working directory inside dockerinit
@z

@x
### Client
@y
### Client
@z

@x
- Only pass stdin to hijack when needed to avoid closed pipe errors
* Use less reflection in command-line method invocation
- Monitor the tty size after starting the container, not prior
- Remove useless os.Exit() calls after log.Fatal
@y
- Only pass stdin to hijack when needed to avoid closed pipe errors
* Use less reflection in command-line method invocation
- Monitor the tty size after starting the container, not prior
- Remove useless os.Exit() calls after log.Fatal
@z

@x
### Hack
@y
### Hack
@z

@x
+ Add initial init scripts library and a safer Ubuntu packaging script that works for Debian
* Add -p option to invoke debootstrap with http_proxy
- Update install.sh with $sh_c to get sudo/su for modprobe
* Update all the mkimage scripts to use --numeric-owner as a tar argument
* Update hack/release.sh process to automatically invoke hack/make.sh and bail on build and test issues
@y
+ Add initial init scripts library and a safer Ubuntu packaging script that works for Debian
* Add -p option to invoke debootstrap with http_proxy
- Update install.sh with $sh_c to get sudo/su for modprobe
* Update all the mkimage scripts to use --numeric-owner as a tar argument
* Update hack/release.sh process to automatically invoke hack/make.sh and bail on build and test issues
@z

@x
### Other
@y
### Other
@z

@x
* Documentation: Fix the flags for nc in example
* Testing: Remove warnings and prevent mount issues
- Testing: Change logic for tty resize to avoid warning in tests
- Builder: Fix race condition in docker build with verbose output
- Registry: Fix content-type for PushImageJSONIndex method
* Contrib: Improve helper tools to generate debian and Arch linux server images
@y
* Documentation: Fix the flags for nc in example
* Testing: Remove warnings and prevent mount issues
- Testing: Change logic for tty resize to avoid warning in tests
- Builder: Fix race condition in docker build with verbose output
- Registry: Fix content-type for PushImageJSONIndex method
* Contrib: Improve helper tools to generate debian and Arch linux server images
@z

@x
## 0.6.4 (2013-10-16)
@y
## 0.6.4 (2013-10-16)
@z

@x
### Runtime
@y
### Runtime
@z

@x
- Add cleanup of container when Start() fails
* Add better comments to utils/stdcopy.go
* Add utils.Errorf for error logging
+ Add -rm to docker run for removing a container on exit
- Remove error messages which are not actually errors
- Fix `docker rm` with volumes
- Fix some error cases where an HTTP body might not be closed
- Fix panic with wrong dockercfg file
- Fix the attach behavior with -i
* Record termination time in state.
- Use empty string so TempDir uses the OS's temp dir automatically
- Make sure to close the network allocators
+ Autorestart containers by default
* Bump vendor kr/pty to commit 3b1f6487b `(syscall.O_NOCTTY)`
* lxc: Allow set_file_cap capability in container
- Move run -rm to the cli only
* Split stdout stderr
* Always create a new session for the container
@y
- Add cleanup of container when Start() fails
* Add better comments to utils/stdcopy.go
* Add utils.Errorf for error logging
+ Add -rm to docker run for removing a container on exit
- Remove error messages which are not actually errors
- Fix `docker rm` with volumes
- Fix some error cases where an HTTP body might not be closed
- Fix panic with wrong dockercfg file
- Fix the attach behavior with -i
* Record termination time in state.
- Use empty string so TempDir uses the OS's temp dir automatically
- Make sure to close the network allocators
+ Autorestart containers by default
* Bump vendor kr/pty to commit 3b1f6487b `(syscall.O_NOCTTY)`
* lxc: Allow set_file_cap capability in container
- Move run -rm to the cli only
* Split stdout stderr
* Always create a new session for the container
@z

@x
### Testing
@y
### Testing
@z

@x
- Add aggregated docker-ci email report
- Add cleanup to remove leftover containers
* Add nightly release to docker-ci
* Add more tests around auth.ResolveAuthConfig
- Remove a few errors in tests
- Catch errClosing error when TCP and UDP proxies are terminated
* Only run certain tests with TESTFLAGS='-run TestName' make.sh
* Prevent docker-ci to test closing PRs
* Replace panic by log.Fatal in tests
- Increase TestRunDetach timeout
@y
- Add aggregated docker-ci email report
- Add cleanup to remove leftover containers
* Add nightly release to docker-ci
* Add more tests around auth.ResolveAuthConfig
- Remove a few errors in tests
- Catch errClosing error when TCP and UDP proxies are terminated
* Only run certain tests with TESTFLAGS='-run TestName' make.sh
* Prevent docker-ci to test closing PRs
* Replace panic by log.Fatal in tests
- Increase TestRunDetach timeout
@z

@x
### Documentation
@y
### Documentation
@z

@x
* Add initial draft of the Docker infrastructure doc
* Add devenvironment link to CONTRIBUTING.md
* Add `apt-get install curl` to Ubuntu docs
* Add explanation for export restrictions
* Add .dockercfg doc
* Remove Gentoo install notes about #1422 workaround
* Fix help text for -v option
* Fix Ping endpoint documentation
- Fix parameter names in docs for ADD command
- Fix ironic typo in changelog
* Various command fixes in postgres example
* Document how to edit and release docs
- Minor updates to `postgresql_service.rst`
* Clarify LGTM process to contributors
- Corrected error in the package name
* Document what `vagrant up` is actually doing
+ improve doc search results
* Cleanup whitespace in API 1.5 docs
* use angle brackets in MAINTAINER example email
* Update archlinux.rst
+ Changes to a new style for the docs. Includes version switcher.
* Formatting, add information about multiline json
* Improve registry and index REST API documentation
- Replace deprecated upgrading reference to docker-latest.tgz, which hasn't been updated since 0.5.3
* Update Gentoo installation documentation now that we're in the portage tree proper
* Cleanup and reorganize docs and tooling for contributors and maintainers
- Minor spelling correction of protocoll -> protocol
@y
* Add initial draft of the Docker infrastructure doc
* Add devenvironment link to CONTRIBUTING.md
* Add `apt-get install curl` to Ubuntu docs
* Add explanation for export restrictions
* Add .dockercfg doc
* Remove Gentoo install notes about #1422 workaround
* Fix help text for -v option
* Fix Ping endpoint documentation
- Fix parameter names in docs for ADD command
- Fix ironic typo in changelog
* Various command fixes in postgres example
* Document how to edit and release docs
- Minor updates to `postgresql_service.rst`
* Clarify LGTM process to contributors
- Corrected error in the package name
* Document what `vagrant up` is actually doing
+ improve doc search results
* Cleanup whitespace in API 1.5 docs
* use angle brackets in MAINTAINER example email
* Update archlinux.rst
+ Changes to a new style for the docs. Includes version switcher.
* Formatting, add information about multiline json
* Improve registry and index REST API documentation
- Replace deprecated upgrading reference to docker-latest.tgz, which hasn't been updated since 0.5.3
* Update Gentoo installation documentation now that we're in the portage tree proper
* Cleanup and reorganize docs and tooling for contributors and maintainers
- Minor spelling correction of protocoll -> protocol
@z

@x
### Contrib
@y
### Contrib
@z

@x
* Add vim syntax highlighting for Dockerfiles from @honza
* Add mkimage-arch.sh
* Reorganize contributed completion scripts to add zsh completion
@y
* Add vim syntax highlighting for Dockerfiles from @honza
* Add mkimage-arch.sh
* Reorganize contributed completion scripts to add zsh completion
@z

@x
### Hack
@y
### Hack
@z

@x
* Add vagrant user to the docker group
* Add proper bash completion for "docker push"
* Add xz utils as a runtime dep
* Add cleanup/refactor portion of #2010 for hack and Dockerfile updates
+ Add contrib/mkimage-centos.sh back (from #1621), and associated documentation link
* Add several of the small make.sh fixes from #1920, and make the output more consistent and contributor-friendly
+ Add @tianon to hack/MAINTAINERS
* Improve network performance for VirtualBox
* Revamp install.sh to be usable by more people, and to use official install methods whenever possible (apt repo, portage tree, etc.)
- Fix contrib/mkimage-debian.sh apt caching prevention
+ Add Dockerfile.tmLanguage to contrib
* Configured FPM to make /etc/init/docker.conf a config file
* Enable SSH Agent forwarding in Vagrant VM
* Several small tweaks/fixes for contrib/mkimage-debian.sh
@y
* Add vagrant user to the docker group
* Add proper bash completion for "docker push"
* Add xz utils as a runtime dep
* Add cleanup/refactor portion of #2010 for hack and Dockerfile updates
+ Add contrib/mkimage-centos.sh back (from #1621), and associated documentation link
* Add several of the small make.sh fixes from #1920, and make the output more consistent and contributor-friendly
+ Add @tianon to hack/MAINTAINERS
* Improve network performance for VirtualBox
* Revamp install.sh to be usable by more people, and to use official install methods whenever possible (apt repo, portage tree, etc.)
- Fix contrib/mkimage-debian.sh apt caching prevention
+ Add Dockerfile.tmLanguage to contrib
* Configured FPM to make /etc/init/docker.conf a config file
* Enable SSH Agent forwarding in Vagrant VM
* Several small tweaks/fixes for contrib/mkimage-debian.sh
@z

@x
### Other
@y
### Other
@z

@x
- Builder: Abort build if mergeConfig returns an error and fix duplicate error message
- Packaging: Remove deprecated packaging directory
- Registry: Use correct auth config when logging in.
- Registry: Fix the error message so it is the same as the regex
@y
- Builder: Abort build if mergeConfig returns an error and fix duplicate error message
- Packaging: Remove deprecated packaging directory
- Registry: Use correct auth config when logging in.
- Registry: Fix the error message so it is the same as the regex
@z

@x
## 0.6.3 (2013-09-23)
@y
## 0.6.3 (2013-09-23)
@z

@x
### Packaging
@y
### Packaging
@z

@x
* Add 'docker' group on install for ubuntu package
* Update tar vendor dependency
* Download apt key over HTTPS
@y
* Add 'docker' group on install for ubuntu package
* Update tar vendor dependency
* Download apt key over HTTPS
@z

@x
### Runtime
@y
### Runtime
@z

@x
- Only copy and change permissions on non-bindmount volumes
* Allow multiple volumes-from
- Fix HTTP imports from STDIN
@y
- Only copy and change permissions on non-bindmount volumes
* Allow multiple volumes-from
- Fix HTTP imports from STDIN
@z

@x
### Documentation
@y
### Documentation
@z

@x
* Update section on extracting the docker binary after build
* Update development environment docs for new build process
* Remove 'base' image from documentation
@y
* Update section on extracting the docker binary after build
* Update development environment docs for new build process
* Remove 'base' image from documentation
@z

@x
### Other
@y
### Other
@z

@x
- Client: Fix detach issue
- Registry: Update regular expression to match index
@y
- Client: Fix detach issue
- Registry: Update regular expression to match index
@z

@x
## 0.6.2 (2013-09-17)
@y
## 0.6.2 (2013-09-17)
@z

@x
### Runtime
@y
### Runtime
@z

@x
+ Add domainname support
+ Implement image filtering with path.Match
* Remove unnecessary warnings
* Remove os/user dependency
* Only mount the hostname file when the config exists
* Handle signals within the `docker login` command
- UID and GID are now also applied to volumes
- `docker start` set error code upon error
- `docker run` set the same error code as the process started
@y
+ Add domainname support
+ Implement image filtering with path.Match
* Remove unnecessary warnings
* Remove os/user dependency
* Only mount the hostname file when the config exists
* Handle signals within the `docker login` command
- UID and GID are now also applied to volumes
- `docker start` set error code upon error
- `docker run` set the same error code as the process started
@z

@x
### Builder
@y
### Builder
@z

@x
+ Add -rm option in order to remove intermediate containers
* Allow multiline for the RUN instruction
@y
+ Add -rm option in order to remove intermediate containers
* Allow multiline for the RUN instruction
@z

@x
### Registry
@y
### Registry
@z

@x
* Implement login with private registry
- Fix push issues
@y
* Implement login with private registry
- Fix push issues
@z

@x
### Other
@y
### Other
@z

@x
+ Hack: Vendor all dependencies
* Remote API: Bump to v1.5
* Packaging: Break down hack/make.sh into small scripts, one per 'bundle': test, binary, ubuntu etc.
* Documentation: General improvements
@y
+ Hack: Vendor all dependencies
* Remote API: Bump to v1.5
* Packaging: Break down hack/make.sh into small scripts, one per 'bundle': test, binary, ubuntu etc.
* Documentation: General improvements
@z

@x
## 0.6.1 (2013-08-23)
@y
## 0.6.1 (2013-08-23)
@z

@x
### Registry
@y
### Registry
@z

@x
* Pass "meta" headers in API calls to the registry
@y
* Pass "meta" headers in API calls to the registry
@z

@x
### Packaging
@y
### Packaging
@z

@x
- Use correct upstart script with new build tool
- Use libffi-dev, don't build it from sources
- Remove duplicate mercurial install command
@y
- Use correct upstart script with new build tool
- Use libffi-dev, don't build it from sources
- Remove duplicate mercurial install command
@z

@x
## 0.6.0 (2013-08-22)
@y
## 0.6.0 (2013-08-22)
@z

@x
### Runtime
@y
### Runtime
@z

@x
+ Add lxc-conf flag to allow custom lxc options
+ Add an option to set the working directory
* Add Image name to LogEvent tests
+ Add -privileged flag and relevant tests, docs, and examples
* Add websocket support to /container/<name>/attach/ws
* Add warning when net.ipv4.ip_forwarding = 0
* Add hostname to environment
* Add last stable version in `docker version`
- Fix race conditions in parallel pull
- Fix Graph ByParent() to generate list of child images per parent image.
- Fix typo: fmt.Sprint -> fmt.Sprintf
- Fix small \n error un docker build
* Fix to "Inject dockerinit at /.dockerinit"
* Fix #910. print user name to docker info output
* Use Go 1.1.2 for dockerbuilder
* Use ranged for loop on channels
- Use utils.ParseRepositoryTag instead of strings.Split(name, ":") in server.ImageDelete
- Improve CMD, ENTRYPOINT, and attach docs.
- Improve connect message with socket error
- Load authConfig only when needed and fix useless WARNING
- Show tag used when image is missing
* Apply volumes-from before creating volumes
- Make docker run handle SIGINT/SIGTERM
- Prevent crash when .dockercfg not readable
- Install script should be fetched over https, not http.
* API, issue 1471: Use groups for socket permissions
- Correctly detect IPv4 forwarding
* Mount /dev/shm as a tmpfs
- Switch from http to https for get.docker.io
* Let userland proxy handle container-bound traffic
* Update the Docker CLI to specify a value for the "Host" header.
- Change network range to avoid conflict with EC2 DNS
- Reduce connect and read timeout when pinging the registry
* Parallel pull
- Handle ip route showing mask-less IP addresses
* Allow ENTRYPOINT without CMD
- Always consider localhost as a domain name when parsing the FQN repos name
* Refactor checksum
@y
+ Add lxc-conf flag to allow custom lxc options
+ Add an option to set the working directory
* Add Image name to LogEvent tests
+ Add -privileged flag and relevant tests, docs, and examples
* Add websocket support to /container/<name>/attach/ws
* Add warning when net.ipv4.ip_forwarding = 0
* Add hostname to environment
* Add last stable version in `docker version`
- Fix race conditions in parallel pull
- Fix Graph ByParent() to generate list of child images per parent image.
- Fix typo: fmt.Sprint -> fmt.Sprintf
- Fix small \n error un docker build
* Fix to "Inject dockerinit at /.dockerinit"
* Fix #910. print user name to docker info output
* Use Go 1.1.2 for dockerbuilder
* Use ranged for loop on channels
- Use utils.ParseRepositoryTag instead of strings.Split(name, ":") in server.ImageDelete
- Improve CMD, ENTRYPOINT, and attach docs.
- Improve connect message with socket error
- Load authConfig only when needed and fix useless WARNING
- Show tag used when image is missing
* Apply volumes-from before creating volumes
- Make docker run handle SIGINT/SIGTERM
- Prevent crash when .dockercfg not readable
- Install script should be fetched over https, not http.
* API, issue 1471: Use groups for socket permissions
- Correctly detect IPv4 forwarding
* Mount /dev/shm as a tmpfs
- Switch from http to https for get.docker.io
* Let userland proxy handle container-bound traffic
* Update the Docker CLI to specify a value for the "Host" header.
- Change network range to avoid conflict with EC2 DNS
- Reduce connect and read timeout when pinging the registry
* Parallel pull
- Handle ip route showing mask-less IP addresses
* Allow ENTRYPOINT without CMD
- Always consider localhost as a domain name when parsing the FQN repos name
* Refactor checksum
@z

@x
### Documentation
@y
### Documentation
@z

@x
* Add MongoDB image example
* Add instructions for creating and using the docker group
* Add sudo to examples and installation to documentation
* Add ufw doc
* Add a reference to ps -a
* Add information about Docker's high level tools over LXC.
* Fix typo in docs for docker run -dns
* Fix a typo in the ubuntu installation guide
* Fix to docs regarding adding docker groups
* Update default -H docs
* Update readme with dependencies for building
* Update amazon.rst to explain that Vagrant is not necessary for running Docker on ec2
* PostgreSQL service example in documentation
* Suggest installing linux-headers by default.
* Change the twitter handle
* Clarify Amazon EC2 installation
* 'Base' image is deprecated and should no longer be referenced in the docs.
* Move note about officially supported kernel
- Solved the logo being squished in Safari
@y
* Add MongoDB image example
* Add instructions for creating and using the docker group
* Add sudo to examples and installation to documentation
* Add ufw doc
* Add a reference to ps -a
* Add information about Docker's high level tools over LXC.
* Fix typo in docs for docker run -dns
* Fix a typo in the ubuntu installation guide
* Fix to docs regarding adding docker groups
* Update default -H docs
* Update readme with dependencies for building
* Update amazon.rst to explain that Vagrant is not necessary for running Docker on ec2
* PostgreSQL service example in documentation
* Suggest installing linux-headers by default.
* Change the twitter handle
* Clarify Amazon EC2 installation
* 'Base' image is deprecated and should no longer be referenced in the docs.
* Move note about officially supported kernel
- Solved the logo being squished in Safari
@z

@x
### Builder
@y
### Builder
@z

@x
+ Add USER instruction do Dockerfile
+ Add workdir support for the Buildfile
* Add no cache for docker build
- Fix docker build and docker events output
- Only count known instructions as build steps
- Make sure ENV instruction within build perform a commit each time
- Forbid certain paths within docker build ADD
- Repository name (and optionally a tag) in build usage
- Make sure ADD will create everything in 0755
@y
+ Add USER instruction do Dockerfile
+ Add workdir support for the Buildfile
* Add no cache for docker build
- Fix docker build and docker events output
- Only count known instructions as build steps
- Make sure ENV instruction within build perform a commit each time
- Forbid certain paths within docker build ADD
- Repository name (and optionally a tag) in build usage
- Make sure ADD will create everything in 0755
@z

@x
### Remote API
@y
### Remote API
@z

@x
* Sort Images by most recent creation date.
* Reworking opaque requests in registry module
* Add image name in /events
* Use mime pkg to parse Content-Type
* 650 http utils and user agent field
@y
* Sort Images by most recent creation date.
* Reworking opaque requests in registry module
* Add image name in /events
* Use mime pkg to parse Content-Type
* 650 http utils and user agent field
@z

@x
### Hack
@y
### Hack
@z

@x
+ Bash Completion: Limit commands to containers of a relevant state
* Add docker dependencies coverage testing into docker-ci
@y
+ Bash Completion: Limit commands to containers of a relevant state
* Add docker dependencies coverage testing into docker-ci
@z

@x
### Packaging
@y
### Packaging
@z

@x
+ Docker-brew 0.5.2 support and memory footprint reduction
* Add new docker dependencies into docker-ci
- Revert "docker.upstart: avoid spawning a `sh` process"
+ Docker-brew and Docker standard library
+ Release docker with docker
* Fix the upstart script generated by get.docker.io
* Enabled the docs to generate manpages.
* Revert Bind daemon to 0.0.0.0 in Vagrant.
@y
+ Docker-brew 0.5.2 support and memory footprint reduction
* Add new docker dependencies into docker-ci
- Revert "docker.upstart: avoid spawning a `sh` process"
+ Docker-brew and Docker standard library
+ Release docker with docker
* Fix the upstart script generated by get.docker.io
* Enabled the docs to generate manpages.
* Revert Bind daemon to 0.0.0.0 in Vagrant.
@z

@x
### Register
@y
### Register
@z

@x
* Improve auth push
* Registry unit tests + mock registry
@y
* Improve auth push
* Registry unit tests + mock registry
@z

@x
### Tests
@y
### Tests
@z

@x
* Improve TestKillDifferentUser to prevent timeout on buildbot
- Fix typo in TestBindMounts (runContainer called without image)
* Improve TestGetContainersTop so it does not rely on sleep
* Relax the lo interface test to allow iface index != 1
* Add registry functional test to docker-ci
* Add some tests in server and utils
@y
* Improve TestKillDifferentUser to prevent timeout on buildbot
- Fix typo in TestBindMounts (runContainer called without image)
* Improve TestGetContainersTop so it does not rely on sleep
* Relax the lo interface test to allow iface index != 1
* Add registry functional test to docker-ci
* Add some tests in server and utils
@z

@x
### Other
@y
### Other
@z

@x
* Contrib: bash completion script
* Client: Add docker cp command and copy api endpoint to copy container files/folders to the host
* Don't read from stdout when only attached to stdin
@y
* Contrib: bash completion script
* Client: Add docker cp command and copy api endpoint to copy container files/folders to the host
* Don't read from stdout when only attached to stdin
@z

@x
## 0.5.3 (2013-08-13)
@y
## 0.5.3 (2013-08-13)
@z

@x
### Runtime
@y
### Runtime
@z

@x
* Use docker group for socket permissions
- Spawn shell within upstart script
- Handle ip route showing mask-less IP addresses
- Add hostname to environment
@y
* Use docker group for socket permissions
- Spawn shell within upstart script
- Handle ip route showing mask-less IP addresses
- Add hostname to environment
@z

@x
### Builder
@y
### Builder
@z

@x
- Make sure ENV instruction within build perform a commit each time
@y
- Make sure ENV instruction within build perform a commit each time
@z

@x
## 0.5.2 (2013-08-08)
@y
## 0.5.2 (2013-08-08)
@z

@x
* Builder: Forbid certain paths within docker build ADD
- Runtime: Change network range to avoid conflict with EC2 DNS
* API: Change daemon to listen on unix socket by default
@y
* Builder: Forbid certain paths within docker build ADD
- Runtime: Change network range to avoid conflict with EC2 DNS
* API: Change daemon to listen on unix socket by default
@z

@x
## 0.5.1 (2013-07-30)
@y
## 0.5.1 (2013-07-30)
@z

@x
### Runtime
@y
### Runtime
@z

@x
+ Add `ps` args to `docker top`
+ Add support for container ID files (pidfile like)
+ Add container=lxc in default env
+ Support networkless containers with `docker run -n` and `docker -d -b=none`
* Stdout/stderr logs are now stored in the same file as JSON
* Allocate a /16 IP range by default, with fallback to /24. Try 12 ranges instead of 3.
* Change .dockercfg format to json and support multiple auth remote
- Do not override volumes from config
- Fix issue with EXPOSE override
@y
+ Add `ps` args to `docker top`
+ Add support for container ID files (pidfile like)
+ Add container=lxc in default env
+ Support networkless containers with `docker run -n` and `docker -d -b=none`
* Stdout/stderr logs are now stored in the same file as JSON
* Allocate a /16 IP range by default, with fallback to /24. Try 12 ranges instead of 3.
* Change .dockercfg format to json and support multiple auth remote
- Do not override volumes from config
- Fix issue with EXPOSE override
@z

@x
### API
@y
### API
@z

@x
+ Docker client now sets useragent (RFC 2616)
+ Add /events endpoint
@y
+ Docker client now sets useragent (RFC 2616)
+ Add /events endpoint
@z

@x
### Builder
@y
### Builder
@z

@x
+ ADD command now understands URLs
+ CmdAdd and CmdEnv now respect Dockerfile-set ENV variables
- Create directories with 755 instead of 700 within ADD instruction
@y
+ ADD command now understands URLs
+ CmdAdd and CmdEnv now respect Dockerfile-set ENV variables
- Create directories with 755 instead of 700 within ADD instruction
@z

@x
### Hack
@y
### Hack
@z

@x
* Simplify unit tests with helpers
* Improve docker.upstart event
* Add coverage testing into docker-ci
@y
* Simplify unit tests with helpers
* Improve docker.upstart event
* Add coverage testing into docker-ci
@z

@x
## 0.5.0 (2013-07-17)
@y
## 0.5.0 (2013-07-17)
@z

@x
### Runtime
@y
### Runtime
@z

@x
+ List all processes running inside a container with 'docker top'
+ Host directories can be mounted as volumes with 'docker run -v'
+ Containers can expose public UDP ports (eg, '-p 123/udp')
+ Optionally specify an exact public port (eg. '-p 80:4500')
* 'docker login' supports additional options
- Don't save a container's hostname when committing an image.
@y
+ List all processes running inside a container with 'docker top'
+ Host directories can be mounted as volumes with 'docker run -v'
+ Containers can expose public UDP ports (eg, '-p 123/udp')
+ Optionally specify an exact public port (eg. '-p 80:4500')
* 'docker login' supports additional options
- Don't save a container's hostname when committing an image.
@z

@x
### Registry
@y
### Registry
@z

@x
+ New image naming scheme inspired by Go packaging convention allows arbitrary combinations of registries
- Fix issues when uploading images to a private registry
@y
+ New image naming scheme inspired by Go packaging convention allows arbitrary combinations of registries
- Fix issues when uploading images to a private registry
@z

@x
### Builder
@y
### Builder
@z

@x
+ ENTRYPOINT instruction sets a default binary entry point to a container
+ VOLUME instruction marks a part of the container as persistent data
* 'docker build' displays the full output of a build by default
@y
+ ENTRYPOINT instruction sets a default binary entry point to a container
+ VOLUME instruction marks a part of the container as persistent data
* 'docker build' displays the full output of a build by default
@z

@x
## 0.4.8 (2013-07-01)
@y
## 0.4.8 (2013-07-01)
@z

@x
+ Builder: New build operation ENTRYPOINT adds an executable entry point to the container.  - Runtime: Fix a bug which caused 'docker run -d' to no longer print the container ID.
- Tests: Fix issues in the test suite
@y
+ Builder: New build operation ENTRYPOINT adds an executable entry point to the container.  - Runtime: Fix a bug which caused 'docker run -d' to no longer print the container ID.
- Tests: Fix issues in the test suite
@z

@x
## 0.4.7 (2013-06-28)
@y
## 0.4.7 (2013-06-28)
@z

@x
### Remote API
@y
### Remote API
@z

@x
* The progress bar updates faster when downloading and uploading large files
- Fix a bug in the optional unix socket transport
@y
* The progress bar updates faster when downloading and uploading large files
- Fix a bug in the optional unix socket transport
@z

@x
### Runtime
@y
### Runtime
@z

@x
* Improve detection of kernel version
+ Host directories can be mounted as volumes with 'docker run -b'
- fix an issue when only attaching to stdin
* Use 'tar --numeric-owner' to avoid uid mismatch across multiple hosts
@y
* Improve detection of kernel version
+ Host directories can be mounted as volumes with 'docker run -b'
- fix an issue when only attaching to stdin
* Use 'tar --numeric-owner' to avoid uid mismatch across multiple hosts
@z

@x
### Hack
@y
### Hack
@z

@x
* Improve test suite and dev environment
* Remove dependency on unit tests on 'os/user'
@y
* Improve test suite and dev environment
* Remove dependency on unit tests on 'os/user'
@z

@x
### Other
@y
### Other
@z

@x
* Registry: easier push/pull to a custom registry
+ Documentation: add terminology section
@y
* Registry: easier push/pull to a custom registry
+ Documentation: add terminology section
@z

@x
## 0.4.6 (2013-06-22)
@y
## 0.4.6 (2013-06-22)
@z

@x
- Runtime: fix a bug which caused creation of empty images (and volumes) to crash.
@y
- Runtime: fix a bug which caused creation of empty images (and volumes) to crash.
@z

@x
## 0.4.5 (2013-06-21)
@y
## 0.4.5 (2013-06-21)
@z

@x
+ Builder: 'docker build git://URL' fetches and builds a remote git repository
* Runtime: 'docker ps -s' optionally prints container size
* Tests: improved and simplified
- Runtime: fix a regression introduced in 0.4.3 which caused the logs command to fail.
- Builder: fix a regression when using ADD with single regular file.
@y
+ Builder: 'docker build git://URL' fetches and builds a remote git repository
* Runtime: 'docker ps -s' optionally prints container size
* Tests: improved and simplified
- Runtime: fix a regression introduced in 0.4.3 which caused the logs command to fail.
- Builder: fix a regression when using ADD with single regular file.
@z

@x
## 0.4.4 (2013-06-19)
@y
## 0.4.4 (2013-06-19)
@z

@x
- Builder: fix a regression introduced in 0.4.3 which caused builds to fail on new clients.
@y
- Builder: fix a regression introduced in 0.4.3 which caused builds to fail on new clients.
@z

@x
## 0.4.3 (2013-06-19)
@y
## 0.4.3 (2013-06-19)
@z

@x
### Builder
@y
### Builder
@z

@x
+ ADD of a local file will detect tar archives and unpack them
* ADD improvements: use tar for copy + automatically unpack local archives
* ADD uses tar/untar for copies instead of calling 'cp -ar'
* Fix the behavior of ADD to be (mostly) reverse-compatible, predictable and well-documented.
- Fix a bug which caused builds to fail if ADD was the first command
* Nicer output for 'docker build'
@y
+ ADD of a local file will detect tar archives and unpack them
* ADD improvements: use tar for copy + automatically unpack local archives
* ADD uses tar/untar for copies instead of calling 'cp -ar'
* Fix the behavior of ADD to be (mostly) reverse-compatible, predictable and well-documented.
- Fix a bug which caused builds to fail if ADD was the first command
* Nicer output for 'docker build'
@z

@x
### Runtime
@y
### Runtime
@z

@x
* Remove bsdtar dependency
* Add unix socket and multiple -H support
* Prevent rm of running containers
* Use go1.1 cookiejar
- Fix issue detaching from running TTY container
- Forbid parallel push/pull for a single image/repo. Fixes `#311`
- Fix race condition within Run command when attaching.
@y
* Remove bsdtar dependency
* Add unix socket and multiple -H support
* Prevent rm of running containers
* Use go1.1 cookiejar
- Fix issue detaching from running TTY container
- Forbid parallel push/pull for a single image/repo. Fixes `#311`
- Fix race condition within Run command when attaching.
@z

@x
### Client
@y
### Client
@z

@x
* HumanReadable ProgressBar sizes in pull
* Fix docker version's git commit output
@y
* HumanReadable ProgressBar sizes in pull
* Fix docker version's git commit output
@z

@x
### API
@y
### API
@z

@x
* Send all tags on History API call
* Add tag lookup to history command. Fixes #882
@y
* Send all tags on History API call
* Add tag lookup to history command. Fixes #882
@z

@x
### Documentation
@y
### Documentation
@z

@x
- Fix missing command in irc bouncer example
@y
- Fix missing command in irc bouncer example
@z

@x
## 0.4.2 (2013-06-17)
@y
## 0.4.2 (2013-06-17)
@z

@x
- Packaging: Bumped version to work around an Ubuntu bug
@y
- Packaging: Bumped version to work around an Ubuntu bug
@z

@x
## 0.4.1 (2013-06-17)
@y
## 0.4.1 (2013-06-17)
@z

@x
### Remote Api
@y
### Remote Api
@z

@x
+ Add flag to enable cross domain requests
+ Add images and containers sizes in docker ps and docker images
@y
+ Add flag to enable cross domain requests
+ Add images and containers sizes in docker ps and docker images
@z

@x
### Runtime
@y
### Runtime
@z

@x
+ Configure dns configuration host-wide with 'docker -d -dns'
+ Detect faulty DNS configuration and replace it with a public default
+ Allow docker run <name>:<id>
+ You can now specify public port (ex: -p 80:4500)
* Improve image removal to garbage-collect unreferenced parents
@y
+ Configure dns configuration host-wide with 'docker -d -dns'
+ Detect faulty DNS configuration and replace it with a public default
+ Allow docker run <name>:<id>
+ You can now specify public port (ex: -p 80:4500)
* Improve image removal to garbage-collect unreferenced parents
@z

@x
### Client
@y
### Client
@z

@x
* Allow multiple params in inspect
* Print the container id before the hijack in `docker run`
@y
* Allow multiple params in inspect
* Print the container id before the hijack in `docker run`
@z

@x
### Registry
@y
### Registry
@z

@x
* Add regexp check on repo's name
* Move auth to the client
- Remove login check on pull
@y
* Add regexp check on repo's name
* Move auth to the client
- Remove login check on pull
@z

@x
### Other
@y
### Other
@z

@x
* Vagrantfile: Add the rest api port to vagrantfile's port_forward
* Upgrade to Go 1.1
- Builder: don`t ignore last line in Dockerfile when it doesn`t end with \n
@y
* Vagrantfile: Add the rest api port to vagrantfile's port_forward
* Upgrade to Go 1.1
- Builder: don`t ignore last line in Dockerfile when it doesn`t end with \n
@z

@x
## 0.4.0 (2013-06-03)
@y
## 0.4.0 (2013-06-03)
@z

@x
### Builder
@y
### Builder
@z

@x
+ Introducing Builder
+ 'docker build' builds a container, layer by layer, from a source repository containing a Dockerfile
@y
+ Introducing Builder
+ 'docker build' builds a container, layer by layer, from a source repository containing a Dockerfile
@z

@x
### Remote API
@y
### Remote API
@z

@x
+ Introducing Remote API
+ control Docker programmatically using a simple HTTP/json API
@y
+ Introducing Remote API
+ control Docker programmatically using a simple HTTP/json API
@z

@x
### Runtime
@y
### Runtime
@z

@x
* Various reliability and usability improvements
@y
* Various reliability and usability improvements
@z

@x
## 0.3.4 (2013-05-30)
@y
## 0.3.4 (2013-05-30)
@z

@x
### Builder
@y
### Builder
@z

@x
+ 'docker build' builds a container, layer by layer, from a source repository containing a Dockerfile
+ 'docker build -t FOO' applies the tag FOO to the newly built container.
@y
+ 'docker build' builds a container, layer by layer, from a source repository containing a Dockerfile
+ 'docker build -t FOO' applies the tag FOO to the newly built container.
@z

@x
### Runtime
@y
### Runtime
@z

@x
+ Interactive TTYs correctly handle window resize
* Fix how configuration is merged between layers
@y
+ Interactive TTYs correctly handle window resize
* Fix how configuration is merged between layers
@z

@x
### Remote API
@y
### Remote API
@z

@x
+ Split stdout and stderr on 'docker run'
+ Optionally listen on a different IP and port (use at your own risk)
@y
+ Split stdout and stderr on 'docker run'
+ Optionally listen on a different IP and port (use at your own risk)
@z

@x
### Documentation
@y
### Documentation
@z

@x
* Improve install instructions.
@y
* Improve install instructions.
@z

@x
## 0.3.3 (2013-05-23)
@y
## 0.3.3 (2013-05-23)
@z

@x
- Registry: Fix push regression
- Various bugfixes
@y
- Registry: Fix push regression
- Various bugfixes
@z

@x
## 0.3.2 (2013-05-09)
@y
## 0.3.2 (2013-05-09)
@z

@x
### Registry
@y
### Registry
@z

@x
* Improve the checksum process
* Use the size to have a good progress bar while pushing
* Use the actual archive if it exists in order to speed up the push
- Fix error 400 on push
@y
* Improve the checksum process
* Use the size to have a good progress bar while pushing
* Use the actual archive if it exists in order to speed up the push
- Fix error 400 on push
@z

@x
### Runtime
@y
### Runtime
@z

@x
* Store the actual archive on commit
@y
* Store the actual archive on commit
@z

@x
## 0.3.1 (2013-05-08)
@y
## 0.3.1 (2013-05-08)
@z

@x
### Builder
@y
### Builder
@z

@x
+ Implement the autorun capability within docker builder
+ Add caching to docker builder
+ Add support for docker builder with native API as top level command
+ Implement ENV within docker builder
- Check the command existence prior create and add Unit tests for the case
* use any whitespaces instead of tabs
@y
+ Implement the autorun capability within docker builder
+ Add caching to docker builder
+ Add support for docker builder with native API as top level command
+ Implement ENV within docker builder
- Check the command existence prior create and add Unit tests for the case
* use any whitespaces instead of tabs
@z

@x
### Runtime
@y
### Runtime
@z

@x
+ Add go version to debug infos
* Kernel version - don't show the dash if flavor is empty
@y
+ Add go version to debug infos
* Kernel version - don't show the dash if flavor is empty
@z

@x
### Registry
@y
### Registry
@z

@x
+ Add docker search top level command in order to search a repository
- Fix pull for official images with specific tag
- Fix issue when login in with a different user and trying to push
* Improve checksum - async calculation
@y
+ Add docker search top level command in order to search a repository
- Fix pull for official images with specific tag
- Fix issue when login in with a different user and trying to push
* Improve checksum - async calculation
@z

@x
### Images
@y
### Images
@z

@x
+ Output graph of images to dot (graphviz)
- Fix ByParent function
@y
+ Output graph of images to dot (graphviz)
- Fix ByParent function
@z

@x
### Documentation
@y
### Documentation
@z

@x
+ New introduction and high-level overview
+ Add the documentation for docker builder
- CSS fix for docker documentation to make REST API docs look better.
- Fix CouchDB example page header mistake
- Fix README formatting
* Update www.docker.io website.
@y
+ New introduction and high-level overview
+ Add the documentation for docker builder
- CSS fix for docker documentation to make REST API docs look better.
- Fix CouchDB example page header mistake
- Fix README formatting
* Update www.docker.io website.
@z

@x
### Other
@y
### Other
@z

@x
+ Website: new high-level overview
- Makefile: Swap "go get" for "go get -d", especially to compile on go1.1rc
* Packaging: packaging ubuntu; issue #510: Use golang-stable PPA package to build docker
@y
+ Website: new high-level overview
- Makefile: Swap "go get" for "go get -d", especially to compile on go1.1rc
* Packaging: packaging ubuntu; issue #510: Use golang-stable PPA package to build docker
@z

@x
## 0.3.0 (2013-05-06)
@y
## 0.3.0 (2013-05-06)
@z

@x
### Runtime
@y
### Runtime
@z

@x
- Fix the command existence check
- strings.Split may return an empty string on no match
- Fix an index out of range crash if cgroup memory is not
@y
- Fix the command existence check
- strings.Split may return an empty string on no match
- Fix an index out of range crash if cgroup memory is not
@z

@x
### Documentation
@y
### Documentation
@z

@x
* Various improvements
+ New example: sharing data between 2 couchdb databases
@y
* Various improvements
+ New example: sharing data between 2 couchdb databases
@z

@x
### Other
@y
### Other
@z

@x
* Vagrant: Use only one deb line in /etc/apt
+ Registry: Implement the new registry
@y
* Vagrant: Use only one deb line in /etc/apt
+ Registry: Implement the new registry
@z

@x
## 0.2.2 (2013-05-03)
@y
## 0.2.2 (2013-05-03)
@z

@x
+ Support for data volumes ('docker run -v=PATH')
+ Share data volumes between containers ('docker run -volumes-from')
+ Improve documentation
* Upgrade to Go 1.0.3
* Various upgrades to the dev environment for contributors
@y
+ Support for data volumes ('docker run -v=PATH')
+ Share data volumes between containers ('docker run -volumes-from')
+ Improve documentation
* Upgrade to Go 1.0.3
* Various upgrades to the dev environment for contributors
@z

@x
## 0.2.1 (2013-05-01)
@y
## 0.2.1 (2013-05-01)
@z

@x
+ 'docker commit -run' bundles a layer with default runtime options: command, ports etc.
* Improve install process on Vagrant
+ New Dockerfile operation: "maintainer"
+ New Dockerfile operation: "expose"
+ New Dockerfile operation: "cmd"
+ Contrib script to build a Debian base layer
+ 'docker -d -r': restart crashed containers at daemon startup
* Runtime: improve test coverage
@y
+ 'docker commit -run' bundles a layer with default runtime options: command, ports etc.
* Improve install process on Vagrant
+ New Dockerfile operation: "maintainer"
+ New Dockerfile operation: "expose"
+ New Dockerfile operation: "cmd"
+ Contrib script to build a Debian base layer
+ 'docker -d -r': restart crashed containers at daemon startup
* Runtime: improve test coverage
@z

@x
## 0.2.0 (2013-04-23)
@y
## 0.2.0 (2013-04-23)
@z

@x
- Runtime: ghost containers can be killed and waited for
* Documentation: update install instructions
- Packaging: fix Vagrantfile
- Development: automate releasing binaries and ubuntu packages
+ Add a changelog
- Various bugfixes
@y
- Runtime: ghost containers can be killed and waited for
* Documentation: update install instructions
- Packaging: fix Vagrantfile
- Development: automate releasing binaries and ubuntu packages
+ Add a changelog
- Various bugfixes
@z

@x
## 0.1.8 (2013-04-22)
@y
## 0.1.8 (2013-04-22)
@z

@x
- Dynamically detect cgroup capabilities
- Issue stability warning on kernels <3.8
- 'docker push' buffers on disk instead of memory
- Fix 'docker diff' for removed files
- Fix 'docker stop' for ghost containers
- Fix handling of pidfile
- Various bugfixes and stability improvements
@y
- Dynamically detect cgroup capabilities
- Issue stability warning on kernels <3.8
- 'docker push' buffers on disk instead of memory
- Fix 'docker diff' for removed files
- Fix 'docker stop' for ghost containers
- Fix handling of pidfile
- Various bugfixes and stability improvements
@z

@x
## 0.1.7 (2013-04-18)
@y
## 0.1.7 (2013-04-18)
@z

@x
- Container ports are available on localhost
- 'docker ps' shows allocated TCP ports
- Contributors can run 'make hack' to start a continuous integration VM
- Streamline ubuntu packaging & uploading
- Various bugfixes and stability improvements
@y
- Container ports are available on localhost
- 'docker ps' shows allocated TCP ports
- Contributors can run 'make hack' to start a continuous integration VM
- Streamline ubuntu packaging & uploading
- Various bugfixes and stability improvements
@z

@x
## 0.1.6 (2013-04-17)
@y
## 0.1.6 (2013-04-17)
@z

@x
- Record the author an image with 'docker commit -author'
@y
- Record the author an image with 'docker commit -author'
@z

@x
## 0.1.5 (2013-04-17)
@y
## 0.1.5 (2013-04-17)
@z

@x
- Disable standalone mode
- Use a custom DNS resolver with 'docker -d -dns'
- Detect ghost containers
- Improve diagnosis of missing system capabilities
- Allow disabling memory limits at compile time
- Add debian packaging
- Documentation: installing on Arch Linux
- Documentation: running Redis on docker
- Fix lxc 0.9 compatibility
- Automatically load aufs module
- Various bugfixes and stability improvements
@y
- Disable standalone mode
- Use a custom DNS resolver with 'docker -d -dns'
- Detect ghost containers
- Improve diagnosis of missing system capabilities
- Allow disabling memory limits at compile time
- Add debian packaging
- Documentation: installing on Arch Linux
- Documentation: running Redis on docker
- Fix lxc 0.9 compatibility
- Automatically load aufs module
- Various bugfixes and stability improvements
@z

@x
## 0.1.4 (2013-04-09)
@y
## 0.1.4 (2013-04-09)
@z

@x
- Full support for TTY emulation
- Detach from a TTY session with the escape sequence `C-p C-q`
- Various bugfixes and stability improvements
- Minor UI improvements
- Automatically create our own bridge interface 'docker0'
@y
- Full support for TTY emulation
- Detach from a TTY session with the escape sequence `C-p C-q`
- Various bugfixes and stability improvements
- Minor UI improvements
- Automatically create our own bridge interface 'docker0'
@z

@x
## 0.1.3 (2013-04-04)
@y
## 0.1.3 (2013-04-04)
@z

@x
- Choose TCP frontend port with '-p :PORT'
- Layer format is versioned
- Major reliability improvements to the process manager
- Various bugfixes and stability improvements
@y
- Choose TCP frontend port with '-p :PORT'
- Layer format is versioned
- Major reliability improvements to the process manager
- Various bugfixes and stability improvements
@z

@x
## 0.1.2 (2013-04-03)
@y
## 0.1.2 (2013-04-03)
@z

@x
- Set container hostname with 'docker run -h'
- Selective attach at run with 'docker run -a [stdin[,stdout[,stderr]]]'
- Various bugfixes and stability improvements
- UI polish
- Progress bar on push/pull
- Use XZ compression by default
- Make IP allocator lazy
@y
- Set container hostname with 'docker run -h'
- Selective attach at run with 'docker run -a [stdin[,stdout[,stderr]]]'
- Various bugfixes and stability improvements
- UI polish
- Progress bar on push/pull
- Use XZ compression by default
- Make IP allocator lazy
@z

@x
## 0.1.1 (2013-03-31)
@y
## 0.1.1 (2013-03-31)
@z

@x
- Display shorthand IDs for convenience
- Stabilize process management
- Layers can include a commit message
- Simplified 'docker attach'
- Fix support for re-attaching
- Various bugfixes and stability improvements
- Auto-download at run
- Auto-login on push
- Beefed up documentation
@y
- Display shorthand IDs for convenience
- Stabilize process management
- Layers can include a commit message
- Simplified 'docker attach'
- Fix support for re-attaching
- Various bugfixes and stability improvements
- Auto-download at run
- Auto-login on push
- Beefed up documentation
@z

@x
## 0.1.0 (2013-03-23)
@y
## 0.1.0 (2013-03-23)
@z

@x
Initial public release
@y
Initial public release
@z

@x
- Implement registry in order to push/pull images
- TCP port allocation
- Fix termcaps on Linux
- Add documentation
- Add Vagrant support with Vagrantfile
- Add unit tests
- Add repository/tags to ease image management
- Improve the layer implementation
@y
- Implement registry in order to push/pull images
- TCP port allocation
- Fix termcaps on Linux
- Add documentation
- Add Vagrant support with Vagrantfile
- Add unit tests
- Add repository/tags to ease image management
- Improve the layer implementation
@z
