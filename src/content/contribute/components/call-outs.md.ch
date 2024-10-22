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
- Alerts (Note, Tip, Important, Warning, Caution)
- Version callouts
- Experimental, which use the `{{%/* experimental */%}}` shortcode
- Restricted, which use the `{{%/* restricted */%}}` shortcode
@y
- Alerts (Note, Tip, Important, Warning, Caution)
- Version callouts
- Experimental, which use the `{{%/* experimental */%}}` shortcode
- Restricted, which use the `{{%/* restricted */%}}` shortcode
@z

@x
The experimental and restricted shortcodes take a title as an argument. The
title is optional, defaults to "Experimental" or "Restricted" respectively, and
is displayed in the callout.
@y
The experimental and restricted shortcodes take a title as an argument. The
title is optional, defaults to "Experimental" or "Restricted" respectively, and
is displayed in the callout.
@z

@x
## Examples
@y
## Examples
@z

@x
{{< introduced buildx 0.16.0 >}}
@y
{{< introduced buildx 0.16.0 >}}
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
{{% experimental title="Beta feature" %}}
The Builds view is currently in Beta. This feature may change or be removed from future releases.
{{% /experimental %}}
@y
{{% experimental title="Beta feature" %}}
The Builds view is currently in Beta. This feature may change or be removed from future releases.
{{% /experimental %}}
@z

@x
{{% restricted %}}
Docker Scout is an [early access](/release-lifecycle/#early-access-ea) product.
{{% /restricted %}}
@y
{{% restricted %}}
Docker Scout is an [early access](__SUBDIR__/release-lifecycle/#early-access-ea) product.
{{% /restricted %}}
@z

@x
## Formatting 
@y
## Formatting 
@z

@x
```go
{{</* introduced buildx 0.10.4 "../../release-notes.md#0104" */>}}
```
@y
```go
{{</* introduced buildx 0.10.4 "../../release-notes.md#0104" */>}}
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

@x
```go
{{%/* experimental title="Beta feature" */%}}
The Builds view is currently in Beta. This feature may change or be removed from future releases.
{{%/* /experimental */%}}
@y
```go
{{%/* experimental title="Beta feature" */%}}
The Builds view is currently in Beta. This feature may change or be removed from future releases.
{{%/* /experimental */%}}
@z

@x
{{%/* restricted */%}}
Docker Scout is an [early access](/release-lifecycle/#early-access-ea) product.
{{%/* /restricted */%}}
```
@y
{{%/* restricted */%}}
Docker Scout is an [early access](__SUBDIR__/release-lifecycle/#early-access-ea) product.
{{%/* /restricted */%}}
```
@z
