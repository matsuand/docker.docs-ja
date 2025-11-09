%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Troubleshoot Docker Offload
linktitle: Troubleshoot
@y
title: Troubleshoot Docker Offload
linktitle: Troubleshoot
@z

@x
description: Learn how to troubleshoot issues with Docker Offload.
keywords: cloud, troubleshooting, cloud mode, Docker Desktop, cloud builder, usage
tags: [Troubleshooting]
@y
description: Learn how to troubleshoot issues with Docker Offload.
keywords: cloud, troubleshooting, cloud mode, Docker Desktop, cloud builder, usage
tags: [Troubleshooting]
@z

@x
Docker Offload requires:
@y
Docker Offload requires:
@z

@x
- Authentication
- An active internet connection
- No restrictive proxy or firewall blocking traffic to Docker Cloud
- Access to Docker Offload
- Docker Desktop 4.50 or later
@y
- Authentication
- An active internet connection
- No restrictive proxy or firewall blocking traffic to Docker Cloud
- Access to Docker Offload
- Docker Desktop 4.50 or later
@z

@x
Docker Desktop uses Offload to run both builds and containers in the cloud.
If builds or containers are failing to run, falling back to local, or reporting
session errors, use the following steps to help resolve the issue.
@y
Docker Desktop uses Offload to run both builds and containers in the cloud.
If builds or containers are failing to run, falling back to local, or reporting
session errors, use the following steps to help resolve the issue.
@z

@x
1. Ensure Docker Offload is enabled in Docker Desktop:
@y
1. Ensure Docker Offload is enabled in Docker Desktop:
@z

@x
   1. Open Docker Desktop and sign in.
   2. Go to **Settings** > **Docker Offload**.
   3. Ensure that **Enable Docker Offload** is toggled on.
@y
   1. Open Docker Desktop and sign in.
   2. Go to **Settings** > **Docker Offload**.
   3. Ensure that **Enable Docker Offload** is toggled on.
@z

@x
2. Use the following command to check if the connection is active:
@y
2. Use the following command to check if the connection is active:
@z

@x
   ```console
   $ docker offload status
   ```
@y
   ```console
   $ docker offload status
   ```
@z

@x
3. To get more information, run the following command:
@y
3. To get more information, run the following command:
@z

@x
   ```console
   $ docker offload diagnose
   ```
@y
   ```console
   $ docker offload diagnose
   ```
@z

@x
4. If you're not connected, start a new session:
@y
4. If you're not connected, start a new session:
@z

@x
   ```console
   $ docker offload start
   ```
@y
   ```console
   $ docker offload start
   ```
@z

@x
5. Verify authentication with `docker login`.
@y
5. Verify authentication with `docker login`.
@z

@x
6. If needed, you can sign out and then sign in again:
@y
6. If needed, you can sign out and then sign in again:
@z

@x
   ```console
   $ docker logout
   $ docker login
   ```
@y
   ```console
   $ docker logout
   $ docker login
   ```
@z

@x
7. Verify your usage and billing. For more information, see [Docker Offload usage](/offload/usage/).
@y
7. Verify your usage and billing. For more information, see [Docker Offload usage](__SUBDIR__/offload/usage/).
@z
