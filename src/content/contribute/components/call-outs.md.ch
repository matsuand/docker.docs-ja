%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
description: components and formatting examples used in Docker's docs
title: Callouts
@y
description: components and formatting examples used in Docker's docs
title: Callouts
@z

@x
We support these broad categories of callouts:
@y
We support these broad categories of callouts:
@z

@x
- Alerts: Note, Tip, Important, Warning, Caution
@y
- Alerts: Note, Tip, Important, Warning, Caution
@z

@x
We also support summary bars, which represent a feature's required subscription, version, or Adminstrator role.
To add a summary bar:
@y
We also support summary bars, which represent a feature's required subscription, version, or Adminstrator role.
To add a summary bar:
@z

@x
Add the feature name to the `/data/summary.yaml` file. Use the following attributes:
@y
Add the feature name to the `/data/summary.yaml` file. Use the following attributes:
@z

@x
| Attribute      | Description                                            | Possible values                                         |
|----------------|--------------------------------------------------------|---------------------------------------------------------|
| `subscription` | Notes the subscription required to use the feature     | All, Personal, Pro, Team, Business                      |
| `availability` | Notes what product development stage the feature is in | Experimental, Beta, Early access, GA, Retired           |
| `requires`     | Notes what minimum version is required for the feature | No specific value, use a string to describe the version and link to relevant release notes |
| `for`          | Notes if the feature is intended for IT Administrators | Administrators                                          |
@y
| Attribute      | Description                                            | Possible values                                         |
|----------------|--------------------------------------------------------|---------------------------------------------------------|
| `subscription` | Notes the subscription required to use the feature     | All, Personal, Pro, Team, Business                      |
| `availability` | Notes what product development stage the feature is in | Experimental, Beta, Early access, GA, Retired           |
| `requires`     | Notes what minimum version is required for the feature | No specific value, use a string to describe the version and link to relevant release notes |
| `for`          | Notes if the feature is intended for IT Administrators | Administrators                                          |
@z

@x
Then, add the `summary-bar` shortcode on the page you want to add the summary bar to. Note, the feature name is case sensitive. The icons that appear in the summary bar are automatically rendered.
@y
Then, add the `summary-bar` shortcode on the page you want to add the summary bar to. Note, the feature name is case sensitive. The icons that appear in the summary bar are automatically rendered.
@z

@x
## Examples
@y
## Examples
@z

@x
{{< summary-bar feature_name="PKG installer" >}}
@y
{{< summary-bar feature_name="PKG installer" >}}
@z

@x
> [!NOTE]
>
> Note the way the `get_hit_count` function is written. This basic retry
> loop lets us attempt our request multiple times if the redis service is
> not available. This is useful at startup while the application comes
> online, but also makes our application more resilient if the Redis
> service needs to be restarted anytime during the app's lifetime. In a
> cluster, this also helps handling momentary connection drops between
> nodes.
@y
> [!NOTE]
>
> Note the way the `get_hit_count` function is written. This basic retry
> loop lets us attempt our request multiple times if the redis service is
> not available. This is useful at startup while the application comes
> online, but also makes our application more resilient if the Redis
> service needs to be restarted anytime during the app's lifetime. In a
> cluster, this also helps handling momentary connection drops between
> nodes.
@z

@x
> [!TIP]
>
> For a smaller base image, use `alpine`.
@y
> [!TIP]
>
> For a smaller base image, use `alpine`.
@z

@x
> [!IMPORTANT]
>
> Treat access tokens like your password and keep them secret. Store your
> tokens securely (for example, in a credential manager).
@y
> [!IMPORTANT]
>
> Treat access tokens like your password and keep them secret. Store your
> tokens securely (for example, in a credential manager).
@z

@x
> [!WARNING]
>
> Removing Volumes
>
> By default, named volumes in your compose file are NOT removed when running
> `docker compose down`. If you want to remove the volumes, you will need to add
> the `--volumes` flag.
>
> The Docker Desktop Dashboard does not remove volumes when you delete the app stack.
@y
> [!WARNING]
>
> Removing Volumes
>
> By default, named volumes in your compose file are NOT removed when running
> `docker compose down`. If you want to remove the volumes, you will need to add
> the `--volumes` flag.
>
> The Docker Desktop Dashboard does not remove volumes when you delete the app stack.
@z

@x
> [!CAUTION]
>
> Here be dragons.
@y
> [!CAUTION]
>
> Here be dragons.
@z

@x
For both of the following callouts, consult [the Docker release lifecycle](/release-lifecycle) for more information on when to use them.
@y
For both of the following callouts, consult [the Docker release lifecycle](__SUBDIR__/release-lifecycle) for more information on when to use them.
@z

@x
## Formatting 
@y
## Formatting 
@z

@x
```go
> {{< summary-bar feature_name="PKG installer" >}}
```
@y
```go
> {{< summary-bar feature_name="PKG installer" >}}
```
@z

@x
```html
> [!NOTE]
>
> Note the way the `get_hit_count` function is written. This basic retry
> loop lets us attempt our request multiple times if the redis service is
> not available. This is useful at startup while the application comes
> online, but also makes our application more resilient if the Redis
> service needs to be restarted anytime during the app's lifetime. In a
> cluster, this also helps handling momentary connection drops between
> nodes.
@y
```html
> [!NOTE]
>
> Note the way the `get_hit_count` function is written. This basic retry
> loop lets us attempt our request multiple times if the redis service is
> not available. This is useful at startup while the application comes
> online, but also makes our application more resilient if the Redis
> service needs to be restarted anytime during the app's lifetime. In a
> cluster, this also helps handling momentary connection drops between
> nodes.
@z

@x
> [!TIP]
>
> For a smaller base image, use `alpine`.
@y
> [!TIP]
>
> For a smaller base image, use `alpine`.
@z

@x
> [!IMPORTANT]
>
> Treat access tokens like your password and keep them secret. Store your
> tokens securely (for example, in a credential manager).
@y
> [!IMPORTANT]
>
> Treat access tokens like your password and keep them secret. Store your
> tokens securely (for example, in a credential manager).
@z

@x
> [!WARNING]
>
> Removing Volumes
>
> By default, named volumes in your compose file are NOT removed when running
> `docker compose down`. If you want to remove the volumes, you will need to add
> the `--volumes` flag.
>
> The Docker Desktop Dashboard does not remove volumes when you delete the app stack.
@y
> [!WARNING]
>
> Removing Volumes
>
> By default, named volumes in your compose file are NOT removed when running
> `docker compose down`. If you want to remove the volumes, you will need to add
> the `--volumes` flag.
>
> The Docker Desktop Dashboard does not remove volumes when you delete the app stack.
@z

@x
> [!CAUTION]
>
> Here be dragons.
```
@y
> [!CAUTION]
>
> Here be dragons.
```
@z
