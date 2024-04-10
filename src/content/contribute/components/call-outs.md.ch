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
- Notes (no HTML attribute required)
- Tips, which use the `{ .tip }` class
- Important, which use the `{ .important }` class
- Warning, which use the `{ .warning }` class
- Experimental, which use the `{ .experimental }` class
- Restricted, which use the `{ .restricted }` class
@y
- Notes (no HTML attribute required)
- Tips, which use the `{ .tip }` class
- Important, which use the `{ .important }` class
- Warning, which use the `{ .warning }` class
- Experimental, which use the `{ .experimental }` class
- Restricted, which use the `{ .restricted }` class
@z

@x
## Examples
@y
## Examples
@z

@x
> **Note**
>
> Note the way the `get_hit_count` function is written. This basic retry
> loop lets us attempt our request multiple times if the redis service is
> not available. This is useful at startup while the application comes
> online, but also makes our application more resilient if the Redis
> service needs to be restarted anytime during the app's lifetime. In a
> cluster, this also helps handling momentary connection drops between
> nodes.
@y
> **Note**
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
> **Tip**
>
> For a smaller base image, use `alpine`.
{ .tip }
@y
> **Tip**
>
> For a smaller base image, use `alpine`.
{ .tip }
@z

@x
> **Important**
>
> Treat access tokens like your password and keep them secret. Store your
> tokens securely (for example, in a credential manager).
{ .important }
@y
> **Important**
>
> Treat access tokens like your password and keep them secret. Store your
> tokens securely (for example, in a credential manager).
{ .important }
@z

@x
> **Warning**
>
> Removing Volumes
>
> By default, named volumes in your compose file are NOT removed when running
> `docker compose down`. If you want to remove the volumes, you will need to add
> the `--volumes` flag.
>
> The Docker Dashboard does not remove volumes when you delete the app stack.
{ .warning }
@y
> **Warning**
>
> Removing Volumes
>
> By default, named volumes in your compose file are NOT removed when running
> `docker compose down`. If you want to remove the volumes, you will need to add
> the `--volumes` flag.
>
> The Docker Dashboard does not remove volumes when you delete the app stack.
{ .warning }
@z

@x
For both of the following callouts, consult [the Docker release lifecycle](/release-lifecycle) for more information on when to use them.
@y
For both of the following callouts, consult [the Docker release lifecycle](__SUBDIR__/release-lifecycle) for more information on when to use them.
@z

@x
> **Beta feature**
>
> The Builds view is currently in Beta. This feature may change or be removed from future releases.
{ .experimental }
@y
> **Beta feature**
>
> The Builds view is currently in Beta. This feature may change or be removed from future releases.
{ .experimental }
@z

@x
> **Restricted**
>
> Docker Scout is an [early access](/release-lifecycle/#early-access-ea)
> product.
{ .restricted}
@y
> **Restricted**
>
> Docker Scout is an [early access](__SUBDIR__/release-lifecycle/#early-access-ea)
> product.
{ .restricted}
@z

@x
## Formatting 
@y
## Formatting 
@z

@x
```html
> **Note**
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
> **Note**
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
> **Tip**
>
> For a smaller base image, use `alpine`.
{ .tip }
@y
> **Tip**
>
> For a smaller base image, use `alpine`.
{ .tip }
@z

@x
> **Important**
>
> Treat access tokens like your password and keep them secret. Store your
> tokens securely (for example, in a credential manager).
{ .important }
@y
> **Important**
>
> Treat access tokens like your password and keep them secret. Store your
> tokens securely (for example, in a credential manager).
{ .important }
@z

@x
> **Warning**
>
> Removing Volumes
>
> By default, named volumes in your compose file are NOT removed when running
> `docker compose down`. If you want to remove the volumes, you will need to add
> the `--volumes` flag.
>
> The Docker Dashboard does _not_ remove volumes when you delete the app stack.
{ .warning }
@y
> **Warning**
>
> Removing Volumes
>
> By default, named volumes in your compose file are NOT removed when running
> `docker compose down`. If you want to remove the volumes, you will need to add
> the `--volumes` flag.
>
> The Docker Dashboard does _not_ remove volumes when you delete the app stack.
{ .warning }
@z

@x
> **Beta feature**
>
> The Builds view is currently in Beta. This feature may change or be removed from future releases.
{ .experimental }
@y
> **Beta feature**
>
> The Builds view is currently in Beta. This feature may change or be removed from future releases.
{ .experimental }
@z

@x
> **Restricted**
>
> Docker Scout is an [early access](/release-lifecycle/#early-access-ea)
> product.
{ .restricted }
```
@y
> **Restricted**
>
> Docker Scout is an [early access](__SUBDIR__/release-lifecycle/#early-access-ea)
> product.
{ .restricted }
```
@z
