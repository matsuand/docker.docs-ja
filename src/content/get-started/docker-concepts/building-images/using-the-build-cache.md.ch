%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
title: Using the build cache
keywords: concepts, build, images, container, docker desktop
description: This concept page will teach you about the build cache, what changes invalidate the cache and how to effectively use the build cache.
@y
title: ビルドキャッシュの利用
keywords: concepts, build, images, container, docker desktop
description: This concept page will teach you about the build cache, what changes invalidate the cache and how to effectively use the build cache.
@z

@x
{{< youtube-embed Ri6jMknjprY >}}
@y
{{< youtube-embed Ri6jMknjprY >}}
@z

@x
## Explanation
@y
## Explanation
@z

@x
Consider the following Dockerfile that you created for the [getting-started](./writing-a-dockerfile/) app.
@y
Consider the following Dockerfile that you created for the [getting-started](./writing-a-dockerfile/) app.
@z

% snip code...

@x
When you run the `docker build` command to create a new image, Docker executes each instruction in your Dockerfile, creating a layer for each command and in the order specified. For each instruction, Docker checks whether it can reuse the instruction from a previous build. If it finds that you've already executed a similar instruction before, Docker doesn't need to redo it. Instead, it’ll use the cached result. This way, your build process becomes faster and more efficient, saving you valuable time and resources.
@y
When you run the `docker build` command to create a new image, Docker executes each instruction in your Dockerfile, creating a layer for each command and in the order specified. For each instruction, Docker checks whether it can reuse the instruction from a previous build. If it finds that you've already executed a similar instruction before, Docker doesn't need to redo it. Instead, it’ll use the cached result. This way, your build process becomes faster and more efficient, saving you valuable time and resources.
@z

@x
Using the build cache effectively lets you achieve faster builds by reusing results from previous builds and skipping unnecessary work.
In order to maximize cache usage and avoid resource-intensive and time-consuming rebuilds, it's important to understand how cache invalidation works.
Here are a few examples of situations that can cause cache to be invalidated:
@y
Using the build cache effectively lets you achieve faster builds by reusing results from previous builds and skipping unnecessary work.
In order to maximize cache usage and avoid resource-intensive and time-consuming rebuilds, it's important to understand how cache invalidation works.
Here are a few examples of situations that can cause cache to be invalidated:
@z

@x
- Any changes to the command of a `RUN` instruction invalidates that layer. Docker detects the change and invalidates the build cache if there's any modification to a `RUN` command in your Dockerfile.
@y
- Any changes to the command of a `RUN` instruction invalidates that layer. Docker detects the change and invalidates the build cache if there's any modification to a `RUN` command in your Dockerfile.
@z

@x
- Any changes to files copied into the image with the `COPY` or `ADD` instructions. Docker keeps an eye on any alterations to files within your project directory. Whether it's a change in content or properties like permissions, Docker considers these modifications as triggers to invalidate the cache.
@y
- Any changes to files copied into the image with the `COPY` or `ADD` instructions. Docker keeps an eye on any alterations to files within your project directory. Whether it's a change in content or properties like permissions, Docker considers these modifications as triggers to invalidate the cache.
@z

@x
- Once one layer is invalidated, all following layers are also invalidated. If any previous layer, including the base image or intermediary layers, has been invalidated due to changes, Docker ensures that subsequent layers relying on it are also invalidated. This keeps the build process synchronized and prevents inconsistencies.
@y
- Once one layer is invalidated, all following layers are also invalidated. If any previous layer, including the base image or intermediary layers, has been invalidated due to changes, Docker ensures that subsequent layers relying on it are also invalidated. This keeps the build process synchronized and prevents inconsistencies.
@z

@x
When you're writing or editing a Dockerfile, keep an eye out for unnecessary cache misses to ensure that builds run as fast and efficiently as possible.
@y
When you're writing or editing a Dockerfile, keep an eye out for unnecessary cache misses to ensure that builds run as fast and efficiently as possible.
@z

@x
## Try it out
@y
## Try it out
@z

@x
In this hands-on guide, you will learn how to use the Docker build cache effectively for a Node.js application.
@y
In this hands-on guide, you will learn how to use the Docker build cache effectively for a Node.js application.
@z

@x
### Build the application
@y
### Build the application
@z

@x
1. [Download and install](https://www.docker.com/products/docker-desktop/) Docker Desktop.
@y
1. [Download and install](https://www.docker.com/products/docker-desktop/) Docker Desktop.
@z

@x
2. Open a terminal and [clone this sample application](https://github.com/dockersamples/todo-list-app).
@y
2. Open a terminal and [clone this sample application](https://github.com/dockersamples/todo-list-app).
@z

@x
    ```console
    $ git clone https://github.com/dockersamples/todo-list-app
    ```
@y
    ```console
    $ git clone https://github.com/dockersamples/todo-list-app
    ```
@z

@x
3. Navigate into the `todo-list-app` directory:
@y
3. Navigate into the `todo-list-app` directory:
@z

% snip command...

@x
    Inside this directory, you'll find a file named `Dockerfile` with the following content:
@y
    Inside this directory, you'll find a file named `Dockerfile` with the following content:
@z

% snip code...

@x
4. Execute the following command to build the Docker image:
@y
4. Execute the following command to build the Docker image:
@z

% snip command...

@x
    Here’s the result of the build process:
@y
    Here’s the result of the build process:
@z

% snip output...

@x
    The first line indicates that the entire build process took *20.0 seconds*. The first build may take some time as it installs dependencies.
@y
    The first line indicates that the entire build process took *20.0 seconds*. The first build may take some time as it installs dependencies.
@z

@x
5. Rebuild without making changes.
@y
5. Rebuild without making changes.
@z

@x
   Now, re-run the `docker build` command without making any change in the source code or Dockerfile as shown:
@y
   Now, re-run the `docker build` command without making any change in the source code or Dockerfile as shown:
@z

% snip command...

@x
   Subsequent builds after the initial are faster due to the caching mechanism, as long as the commands and context remain unchanged. Docker caches the intermediate layers generated during the build process. When you rebuild the image without making any changes to the Dockerfile or the source code, Docker can reuse the cached layers, significantly speeding up the build process.
@y
   Subsequent builds after the initial are faster due to the caching mechanism, as long as the commands and context remain unchanged. Docker caches the intermediate layers generated during the build process. When you rebuild the image without making any changes to the Dockerfile or the source code, Docker can reuse the cached layers, significantly speeding up the build process.
@z

% snip output...

@x
   The subsequent build was completed in just 1.0 second by leveraging the cached layers. No need to repeat time-consuming steps like installing dependencies.
@y
   The subsequent build was completed in just 1.0 second by leveraging the cached layers. No need to repeat time-consuming steps like installing dependencies.
@z

@x
    <table>
      <thead>
        <tr>
          <th>Steps
          </th>
          <th>Description
          </th>
          <th>Time Taken (1st Run)
          </th>
          <th>Time Taken (2nd Run)
          </th>
        </tr>
      </thead>
      <tbody>
      <tr>
       <td>1
       </td>
       <td><code>Load build definition from Dockerfile</code>
       </td>
       <td>0.0 seconds
       </td>
       <td>0.0 seconds
       </td>
      </tr>
      <tr>
       <td>2
       </td>
       <td><code>Load metadata for docker.io/library/node:22-alpine</code>
       </td>
       <td>2.7 seconds
       </td>
       <td>0.9 seconds
       </td>
      </tr>
      <tr>
       <td>3
       </td>
       <td><code>Load .dockerignore</code>
       </td>
       <td>0.0 seconds
       </td>
       <td>0.0 seconds
       </td>
      </tr>
      <tr>
       <td>4
       </td>
       <td><code>Load build context</code>
    <p>
    (Context size: 4.60MB)
       </td>
       <td>0.1 seconds
       </td>
       <td>0.0 seconds
       </td>
      </tr>
      <tr>
       <td>5
       </td>
       <td><code>Set the working directory (WORKDIR)</code>
       </td>
       <td>0.1 seconds
       </td>
       <td>0.0 seconds
       </td>
      </tr>
      <tr>
       <td>6
       </td>
       <td><code>Copy the local code into the container</code>
       </td>
       <td>0.0 seconds
       </td>
       <td>0.0 seconds
       </td>
      </tr>
      <tr>
       <td>7
       </td>
       <td><code>Run yarn install --production</code>
       </td>
       <td>10.0 seconds
       </td>
       <td>0.0 seconds
       </td>
      </tr>
      <tr>
       <td>8
       </td>
       <td><code>Exporting layers</code>
       </td>
       <td>2.2 seconds
       </td>
       <td>0.0 seconds
       </td>
      </tr>
      <tr>
       <td>9
       </td>
       <td><code>Exporting the final image</code>
       </td>
       <td>3.0 seconds
       </td>
       <td>0.0 seconds
       </td>
     </tr>
     </tbody>
    </table>
@y
    <table>
      <thead>
        <tr>
          <th>Steps
          </th>
          <th>Description
          </th>
          <th>Time Taken (1st Run)
          </th>
          <th>Time Taken (2nd Run)
          </th>
        </tr>
      </thead>
      <tbody>
      <tr>
       <td>1
       </td>
       <td><code>Load build definition from Dockerfile</code>
       </td>
       <td>0.0 seconds
       </td>
       <td>0.0 seconds
       </td>
      </tr>
      <tr>
       <td>2
       </td>
       <td><code>Load metadata for docker.io/library/node:22-alpine</code>
       </td>
       <td>2.7 seconds
       </td>
       <td>0.9 seconds
       </td>
      </tr>
      <tr>
       <td>3
       </td>
       <td><code>Load .dockerignore</code>
       </td>
       <td>0.0 seconds
       </td>
       <td>0.0 seconds
       </td>
      </tr>
      <tr>
       <td>4
       </td>
       <td><code>Load build context</code>
    <p>
    (Context size: 4.60MB)
       </td>
       <td>0.1 seconds
       </td>
       <td>0.0 seconds
       </td>
      </tr>
      <tr>
       <td>5
       </td>
       <td><code>Set the working directory (WORKDIR)</code>
       </td>
       <td>0.1 seconds
       </td>
       <td>0.0 seconds
       </td>
      </tr>
      <tr>
       <td>6
       </td>
       <td><code>Copy the local code into the container</code>
       </td>
       <td>0.0 seconds
       </td>
       <td>0.0 seconds
       </td>
      </tr>
      <tr>
       <td>7
       </td>
       <td><code>Run yarn install --production</code>
       </td>
       <td>10.0 seconds
       </td>
       <td>0.0 seconds
       </td>
      </tr>
      <tr>
       <td>8
       </td>
       <td><code>Exporting layers</code>
       </td>
       <td>2.2 seconds
       </td>
       <td>0.0 seconds
       </td>
      </tr>
      <tr>
       <td>9
       </td>
       <td><code>Exporting the final image</code>
       </td>
       <td>3.0 seconds
       </td>
       <td>0.0 seconds
       </td>
     </tr>
     </tbody>
    </table>
@z

@x
    Going back to the `docker image history` output, you see that each command in the Dockerfile becomes a new layer in the image. You might remember that when you made a change to the image, the `yarn` dependencies had to be reinstalled. Is there a way to fix this? It doesn't make much sense to reinstall the same dependencies every time you build, right?
@y
    Going back to the `docker image history` output, you see that each command in the Dockerfile becomes a new layer in the image. You might remember that when you made a change to the image, the `yarn` dependencies had to be reinstalled. Is there a way to fix this? It doesn't make much sense to reinstall the same dependencies every time you build, right?
@z

@x
    To fix this, restructure your Dockerfile so that the dependency cache remains valid unless it really needs to be invalidated. For Node-based applications, dependencies are defined in the `package.json` file. You'll want to reinstall the dependencies if that file changes, but use cached dependencies if the file is unchanged. So, start by copying only that file first, then install the dependencies, and finally copy everything else. Then, you only need to recreate the yarn dependencies if there was a change to the `package.json` file.
@y
    To fix this, restructure your Dockerfile so that the dependency cache remains valid unless it really needs to be invalidated. For Node-based applications, dependencies are defined in the `package.json` file. You'll want to reinstall the dependencies if that file changes, but use cached dependencies if the file is unchanged. So, start by copying only that file first, then install the dependencies, and finally copy everything else. Then, you only need to recreate the yarn dependencies if there was a change to the `package.json` file.
@z

@x
6. Update the Dockerfile to copy in the `package.json` file first, install dependencies, and then copy everything else in.
@y
6. Update the Dockerfile to copy in the `package.json` file first, install dependencies, and then copy everything else in.
@z

% snip code...

@x
7. Create a file named `.dockerignore` in the same folder as the Dockerfile with the following contents.
@y
7. Create a file named `.dockerignore` in the same folder as the Dockerfile with the following contents.
@z

% snip code...

@x
8. Build the new image:
@y
8. Build the new image:
@z

% snip command...

@x
    You'll then see output similar to the following:
@y
    You'll then see output similar to the following:
@z

% snip output...

@x
    You'll see that all layers were rebuilt. Perfectly fine since you changed the Dockerfile quite a bit.
@y
    You'll see that all layers were rebuilt. Perfectly fine since you changed the Dockerfile quite a bit.
@z

@x
9. Now, make a change to the `src/static/index.html` file (like change the title to say "The Awesome Todo App").
@y
9. Now, make a change to the `src/static/index.html` file (like change the title to say "The Awesome Todo App").
@z

@x
10. Build the Docker image. This time, your output should look a little different.
@y
10. Build the Docker image. This time, your output should look a little different.
@z

% snip command...

@x
    You'll then see output similar to the following:
@y
    You'll then see output similar to the following:
@z

% snip output...

@x
    First off, you should notice that the build was much faster. You'll see that several steps are using previously cached layers. That's good news; you're using the build cache. Pushing and pulling this image and updates to it will be much faster as well.
@y
    First off, you should notice that the build was much faster. You'll see that several steps are using previously cached layers. That's good news; you're using the build cache. Pushing and pulling this image and updates to it will be much faster as well.
@z

@x
By following these optimization techniques, you can make your Docker builds faster and more efficient, leading to quicker iteration cycles and improved development productivity.
@y
By following these optimization techniques, you can make your Docker builds faster and more efficient, leading to quicker iteration cycles and improved development productivity.
@z

@x
## Additional resources
@y
## Additional resources
@z

@x
* [Optimizing builds with cache management](/build/cache/)
* [Cache Storage Backend](/build/cache/backends/)
* [Build cache invalidation](/build/cache/invalidation/)
@y
* [Optimizing builds with cache management](__SUBDIR__/build/cache/)
* [Cache Storage Backend](__SUBDIR__/build/cache/backends/)
* [Build cache invalidation](__SUBDIR__/build/cache/invalidation/)
@z

@x
## Next steps
@y
## Next steps
@z

@x
Now that you understand how to use the Docker build cache effectively, you're ready to learn about Multi-stage builds.
@y
Now that you understand how to use the Docker build cache effectively, you're ready to learn about Multi-stage builds.
@z

@x
{{< button text="Multi-stage builds" url="multi-stage-builds" >}}
@y
{{< button text="Multi-stage builds" url="multi-stage-builds" >}}
@z
