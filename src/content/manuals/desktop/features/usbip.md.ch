%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Using USB/IP with Docker Desktop
linkTitle: USB/IP support
@y
title: Using USB/IP with Docker Desktop
linkTitle: USB/IP support
@z

@x
description: How to use USB/IP in Docker Desktop
keywords: usb, usbip, docker desktop, macos, windows, linux
@y
description: How to use USB/IP in Docker Desktop
keywords: usb, usbip, docker desktop, macos, windows, linux
@z

@x
{{< summary-bar feature_name="USB/IP support" >}}
@y
{{< summary-bar feature_name="USB/IP support" >}}
@z

@x
> [!NOTE]
>
> Available on Docker Desktop for Mac, Linux, and Windows with the Hyper-V backend.
@y
> [!NOTE]
>
> Available on Docker Desktop for Mac, Linux, and Windows with the Hyper-V backend.
@z

@x
USB/IP enables you to share USB devices over the network, which can then be accessed from within Docker containers. This page focuses on sharing USB devices connected to the machine you run Docker Desktop on. You can repeat the following process to attach and use additional USB devices as needed.
@y
USB/IP enables you to share USB devices over the network, which can then be accessed from within Docker containers. This page focuses on sharing USB devices connected to the machine you run Docker Desktop on. You can repeat the following process to attach and use additional USB devices as needed.
@z

@x
> [!NOTE]
>
> The Docker Desktop VM kernel image comes pre-configured with drivers for many common USB devices, but Docker can't guarantee every possible USB device will work with this setup.
@y
> [!NOTE]
>
> The Docker Desktop VM kernel image comes pre-configured with drivers for many common USB devices, but Docker can't guarantee every possible USB device will work with this setup.
@z

@x
## Setup and use
@y
## Setup and use
@z

@x
### Step one: Run a USB/IP server
@y
### Step one: Run a USB/IP server
@z

@x
To use USB/IP, you need to run a USB/IP server. For this guide, the implementation provided by [jiegec/usbip](https://github.com/jiegec/usbip) will be used.
@y
To use USB/IP, you need to run a USB/IP server. For this guide, the implementation provided by [jiegec/usbip](https://github.com/jiegec/usbip) will be used.
@z

@x
1. Clone the repository.
@y
1. Clone the repository.
@z

@x
    ```console
    $ git clone https://github.com/jiegec/usbip
    $ cd usbip
    ```
@y
    ```console
    $ git clone https://github.com/jiegec/usbip
    $ cd usbip
    ```
@z

@x
2. Run the emulated Human Interface Device (HID) device example.
@y
2. Run the emulated Human Interface Device (HID) device example.
@z

@x
    ```console
    $ env RUST_LOG=info cargo run --example hid_keyboard
    ```
@y
    ```console
    $ env RUST_LOG=info cargo run --example hid_keyboard
    ```
@z

@x
### Step two: Start a privileged Docker container
@y
### Step two: Start a privileged Docker container
@z

@x
To attach the USB device, start a privileged Docker container with the PID namespace set to `host`:
@y
To attach the USB device, start a privileged Docker container with the PID namespace set to `host`:
@z

@x
```console
$ docker run --rm -it --privileged --pid=host alpine
```
@y
```console
$ docker run --rm -it --privileged --pid=host alpine
```
@z

@x
### Step three: Enter the mount namespace of PID 1
@y
### Step three: Enter the mount namespace of PID 1
@z

@x
Inside the container, enter the mount namespace of the `init` process to gain access to the pre-installed USB/IP tools:
@y
Inside the container, enter the mount namespace of the `init` process to gain access to the pre-installed USB/IP tools:
@z

@x
```console
$ nsenter -t 1 -m
```
@y
```console
$ nsenter -t 1 -m
```
@z

@x
### Step four: Use USB/IP tools
@y
### Step four: Use USB/IP tools
@z

@x
Now you can use the USB/IP tools as you would on any other system:
@y
Now you can use the USB/IP tools as you would on any other system:
@z

@x
#### List USB devices
@y
#### List USB devices
@z

@x
To list exportable USB devices from the host:
@y
To list exportable USB devices from the host:
@z

@x
```console
$ usbip list -r host.docker.internal
```
@y
```console
$ usbip list -r host.docker.internal
```
@z

@x
Expected output:
@y
Expected output:
@z

@x
```console
Exportable USB devices
======================
 - host.docker.internal
      0-0-0: unknown vendor : unknown product (0000:0000)
           : /sys/bus/0/0/0
           : (Defined at Interface level) (00/00/00)
           :  0 - unknown class / unknown subclass / unknown protocol (03/00/00)
```
@y
```console
Exportable USB devices
======================
 - host.docker.internal
      0-0-0: unknown vendor : unknown product (0000:0000)
           : /sys/bus/0/0/0
           : (Defined at Interface level) (00/00/00)
           :  0 - unknown class / unknown subclass / unknown protocol (03/00/00)
```
@z

@x
#### Attach a USB device
@y
#### Attach a USB device
@z

@x
To attach a specific USB device, or the emulated keyboard in this case:
@y
To attach a specific USB device, or the emulated keyboard in this case:
@z

@x
```console
$ usbip attach -r host.docker.internal -d 0-0-0
```
@y
```console
$ usbip attach -r host.docker.internal -d 0-0-0
```
@z

@x
#### Verify device attachment
@y
#### Verify device attachment
@z

@x
After attaching the emulated keyboard, check the `/dev/input` directory for the device node:
@y
After attaching the emulated keyboard, check the `/dev/input` directory for the device node:
@z

@x
```console
$ ls /dev/input/
```
@y
```console
$ ls /dev/input/
```
@z

@x
Example output:
@y
Example output:
@z

@x
```console
event0  mice
```
@y
```console
event0  mice
```
@z

@x
### Step five: Use the attached device in another container
@y
### Step five: Use the attached device in another container
@z

@x
While the initial container remains running to keep the USB device operational, you can access the attached device from another container. For example:
@y
While the initial container remains running to keep the USB device operational, you can access the attached device from another container. For example:
@z

@x
1. Start a new container with the attached device.
@y
1. Start a new container with the attached device.
@z

@x
    ```console
    $ docker run --rm -it --device "/dev/input/event0" alpine
    ```
@y
    ```console
    $ docker run --rm -it --device "/dev/input/event0" alpine
    ```
@z

@x
2. Install a tool like `evtest` to test the emulated keyboard.
@y
2. Install a tool like `evtest` to test the emulated keyboard.
@z

@x
    ```console
    $ apk add evtest
    $ evtest /dev/input/event0
    ```
@y
    ```console
    $ apk add evtest
    $ evtest /dev/input/event0
    ```
@z

@x
3. Interact with the device, and observe the output.
@y
3. Interact with the device, and observe the output.
@z

@x
    Example output:
@y
    Example output:
@z

@x
    ```console
    Input driver version is 1.0.1
    Input device ID: bus 0x3 vendor 0x0 product 0x0 version 0x111
    ...
    Properties:
    Testing ... (interrupt to exit)
    Event: time 1717575532.881540, type 4 (EV_MSC), code 4 (MSC_SCAN), value 7001e
    Event: time 1717575532.881540, type 1 (EV_KEY), code 2 (KEY_1), value 1
    Event: time 1717575532.881540, -------------- SYN_REPORT ------------
    ...
    ```
@y
    ```console
    Input driver version is 1.0.1
    Input device ID: bus 0x3 vendor 0x0 product 0x0 version 0x111
    ...
    Properties:
    Testing ... (interrupt to exit)
    Event: time 1717575532.881540, type 4 (EV_MSC), code 4 (MSC_SCAN), value 7001e
    Event: time 1717575532.881540, type 1 (EV_KEY), code 2 (KEY_1), value 1
    Event: time 1717575532.881540, -------------- SYN_REPORT ------------
    ...
    ```
@z

@x
> [!IMPORTANT]
>
> The initial container must remain running to maintain the connection to the USB device. Exiting the container will stop the device from working.
@y
> [!IMPORTANT]
>
> The initial container must remain running to maintain the connection to the USB device. Exiting the container will stop the device from working.
@z
