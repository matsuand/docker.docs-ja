%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応。
% snip code...

@x
To configure Registry Access Management permissions, perform the following steps:
@y
To configure Registry Access Management permissions, perform the following steps:
@z

@x
1. Sign in to {{ $product_link }}.
2. {{ $ram_navigation }}
3. Enable Registry Access Management to set the permissions for your registry.
@y
1. Sign in to {{ $product_link }}.
2. {{ $ram_navigation }}
3. Enable Registry Access Management to set the permissions for your registry.
@z

@x
   > [!NOTE]
   >
   > When enabled, the Docker Hub registry is set by default, however you can also restrict this registry for your developers.
@y
   > [!NOTE]
   >
   > When enabled, the Docker Hub registry is set by default, however you can also restrict this registry for your developers.
@z

@x
4. Select **Add registry** and enter your registry details in the applicable fields, and then select **Create** to add the registry to your list. There is no limit on the number of registries you can add.
5. Verify that the registry appears in your list and select **Save changes**.
@y
4. Select **Add registry** and enter your registry details in the applicable fields, and then select **Create** to add the registry to your list. There is no limit on the number of registries you can add.
5. Verify that the registry appears in your list and select **Save changes**.
@z

@x
Once you add a registry, it can take up to 24 hours for the changes to be enforced on your developers’ machines. 
@y
Once you add a registry, it can take up to 24 hours for the changes to be enforced on your developers’ machines. 
@z

@x
If you want to apply the changes sooner, you must force a Docker signout on your developers’ machine and have the developers re-authenticate for Docker Desktop. See the [Caveats](#caveats) section below to learn more about limitations when using this feature.
@y
If you want to apply the changes sooner, you must force a Docker signout on your developers’ machine and have the developers re-authenticate for Docker Desktop. See the [Caveats](#caveats) section below to learn more about limitations when using this feature.
@z

@x
> [!IMPORTANT]
>
> Starting with Docker Desktop version 4.36, you can enforce sign-in for multiple organizations. If a developer belongs to multiple organizations with different RAM policies, only the RAM policy for the first organization listed in the `registry.json` file, `.plist` file, or registry key is enforced.
@y
> [!IMPORTANT]
>
> Starting with Docker Desktop version 4.36, you can enforce sign-in for multiple organizations. If a developer belongs to multiple organizations with different RAM policies, only the RAM policy for the first organization listed in the `registry.json` file, `.plist` file, or registry key is enforced.
@z

@x
> [!TIP]
>
> Since RAM sets policies about where content can be fetched from, the [ADD](/reference/dockerfile/#add) instruction of the Dockerfile, when the parameter of the ADD instruction is a URL, is also subject to registry restrictions. It's recommended that you add the domains of URL parameters to the list of allowed registry addresses under the Registry Access Management settings of your organization.
@y
> [!TIP]
>
> Since RAM sets policies about where content can be fetched from, the [ADD](__SUBDIR__/reference/dockerfile/#add) instruction of the Dockerfile, when the parameter of the ADD instruction is a URL, is also subject to registry restrictions. It's recommended that you add the domains of URL parameters to the list of allowed registry addresses under the Registry Access Management settings of your organization.
@z
