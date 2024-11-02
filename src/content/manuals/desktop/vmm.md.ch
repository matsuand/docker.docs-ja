%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Virtual Machine Manager for Docker Desktop on Mac
linkTitle: Virtual Machine Manager 
@y
title: Virtual Machine Manager for Docker Desktop on Mac
linkTitle: Virtual Machine Manager 
@z

@x
keywords: virtualization software, resource allocation, mac, docker desktop, vm monitoring, vm performance, apple silicon
description: Discover Docker Desktop for Mac's Virtual Machine Manager (VMM) options, including the new Docker VMM for Apple Silicon, offering enhanced performance and efficiency
@y
keywords: virtualization software, resource allocation, mac, docker desktop, vm monitoring, vm performance, apple silicon
description: Discover Docker Desktop for Mac's Virtual Machine Manager (VMM) options, including the new Docker VMM for Apple Silicon, offering enhanced performance and efficiency
@z

@x
The Virtual Machine Manager (VMM) in Docker Desktop for Mac is responsible for creating and managing the virtual machine used to run containers. Depending on your system architecture and performance needs, you can choose from multiple VMM options in Docker Desktop's [settings](/manuals/desktop/settings.md#general). This page provides an overview of the available options.
@y
The Virtual Machine Manager (VMM) in Docker Desktop for Mac is responsible for creating and managing the virtual machine used to run containers. Depending on your system architecture and performance needs, you can choose from multiple VMM options in Docker Desktop's [settings](manuals/desktop/settings.md#general). This page provides an overview of the available options.
@z

@x
## Docker VMM (Beta)
@y
## Docker VMM (Beta)
@z

@x
Docker VMM is a new, container-optimized hypervisor introduced in Docker Desktop 4.35 and available on Apple Silicon Macs only. Its enhanced speed and resource efficiency makes it an ideal choice for optimizing your workflow. 
@y
Docker VMM is a new, container-optimized hypervisor introduced in Docker Desktop 4.35 and available on Apple Silicon Macs only. Its enhanced speed and resource efficiency makes it an ideal choice for optimizing your workflow. 
@z

@x
Docker VMM brings exciting advancements specifically tailored for Apple Silicon machines. By optimizing both the Linux kernel and hypervisor layers, Docker VMM delivers significant performance enhancements across common developer tasks. 
@y
Docker VMM brings exciting advancements specifically tailored for Apple Silicon machines. By optimizing both the Linux kernel and hypervisor layers, Docker VMM delivers significant performance enhancements across common developer tasks. 
@z

@x
Some key performance enhancements provided by Docker VMM include:
 - Faster I/O operations: With a cold cache, iterating over a large shared filesystem with `find` is 2x faster than when the Apple Virtualization Framework is used.
 - Improved caching: With a warm cache, performance can improve by as much as 25x, even surpassing native Mac operations.
@y
Some key performance enhancements provided by Docker VMM include:
 - Faster I/O operations: With a cold cache, iterating over a large shared filesystem with `find` is 2x faster than when the Apple Virtualization Framework is used.
 - Improved caching: With a warm cache, performance can improve by as much as 25x, even surpassing native Mac operations.
@z

@x
These improvements directly impact developers who rely on frequent file access and overall system responsiveness during containerized development. Docker VMM marks a significant leap in speed, enabling smoother workflows and faster iteration cycles.
@y
These improvements directly impact developers who rely on frequent file access and overall system responsiveness during containerized development. Docker VMM marks a significant leap in speed, enabling smoother workflows and faster iteration cycles.
@z

@x
### Known issues 
@y
### Known issues 
@z

@x
As Docker VMM is still in Beta, there are a few known limitations:
@y
As Docker VMM is still in Beta, there are a few known limitations:
@z

@x
- Docker VMM does not currently support Rosetta, so emulation of amd64 architectures is slow. Docker is exploring potential solutions.
- Certain databases, like MongoDB and Cassandra, may fail when using virtiofs with Docker VMM. This issue is expected to be resolved in a future release.
@y
- Docker VMM does not currently support Rosetta, so emulation of amd64 architectures is slow. Docker is exploring potential solutions.
- Certain databases, like MongoDB and Cassandra, may fail when using virtiofs with Docker VMM. This issue is expected to be resolved in a future release.
@z

@x
## Apple Virtualization Framework
@y
## Apple Virtualization Framework
@z

@x
The Apple Virtualization Framework is a stable and well-established option for managing virtual machines on Mac. It has been a reliable choice for many Mac users over the years. This framework is best suited for developers who prefer a proven solution with solid performance and broad compatibility.
@y
The Apple Virtualization Framework is a stable and well-established option for managing virtual machines on Mac. It has been a reliable choice for many Mac users over the years. This framework is best suited for developers who prefer a proven solution with solid performance and broad compatibility.
@z

@x
## QEMU (Legacy) for Apple Silicon
@y
## QEMU (Legacy) for Apple Silicon
@z

@x
> [!NOTE]
>
> QEMU will be deprecated in a future release. 
@y
> [!NOTE]
>
> QEMU will be deprecated in a future release. 
@z

@x
QEMU is a legacy virtualization option for Apple Silicon Macs, primarily supported for older use cases. 
@y
QEMU is a legacy virtualization option for Apple Silicon Macs, primarily supported for older use cases. 
@z

@x
Docker recommends transitioning to newer alternatives, such as Docker VMM or the Apple Virtualization Framework, as they offer superior performance and ongoing support. Docker VMM, in particular, offers substantial speed improvements and a more efficient development environment, making it a compelling choice for developers working with Apple Silicon.
@y
Docker recommends transitioning to newer alternatives, such as Docker VMM or the Apple Virtualization Framework, as they offer superior performance and ongoing support. Docker VMM, in particular, offers substantial speed improvements and a more efficient development environment, making it a compelling choice for developers working with Apple Silicon.
@z

@x
Note that this is not related to using QEMU to emulate non-native architectures in [multi-platform builds](/manuals/build/building/multi-platform.md#qemu).
@y
Note that this is not related to using QEMU to emulate non-native architectures in [multi-platform builds](manuals/build/building/multi-platform.md#qemu).
@z

@x
## HyperKit (Legacy) for Intel-based Macs
@y
## HyperKit (Legacy) for Intel-based Macs
@z

@x
> [!NOTE]
>
> HyperKit will be deprecated in a future release.
@y
> [!NOTE]
>
> HyperKit will be deprecated in a future release.
@z

@x
HyperKit is another legacy virtualization option, specifically for Intel-based Macs. Like QEMU, it is still available but considered deprecated. Docker recommends switching to modern alternatives for better performance and to future-proof your setup.
@y
HyperKit is another legacy virtualization option, specifically for Intel-based Macs. Like QEMU, it is still available but considered deprecated. Docker recommends switching to modern alternatives for better performance and to future-proof your setup.
@z
