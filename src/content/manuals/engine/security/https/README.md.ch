%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
build:
  list: never
  publishResources: false
  render: never
---
@y
---
build:
  list: never
  publishResources: false
  render: never
---
@z

@x
This is an initial attempt to make it easier to test the TLS (HTTPS) examples in the protect-access.md
doc.
@y
This is an initial attempt to make it easier to test the TLS (HTTPS) examples in the protect-access.md
doc.
@z

@x
At this point, it is a manual thing, and I've been running it in boot2docker.
@y
At this point, it is a manual thing, and I've been running it in boot2docker.
@z

@x
My process is as following:
@y
My process is as following:
@z

@x
    $ boot2docker ssh
    root@boot2docker:/# git clone https://github.com/moby/moby
    root@boot2docker:/# cd docker/docs/articles/https
    root@boot2docker:/# make cert
@y
    $ boot2docker ssh
    root@boot2docker:/# git clone https://github.com/moby/moby
    root@boot2docker:/# cd docker/docs/articles/https
    root@boot2docker:/# make cert
@z

@x
lots of things to see and manually answer, as openssl wants to be interactive
@y
lots of things to see and manually answer, as openssl wants to be interactive
@z

@x
> [!NOTE]: make sure you enter the hostname (`boot2docker` in my case) when prompted for `Computer Name`)
@y
> [!NOTE]: make sure you enter the hostname (`boot2docker` in my case) when prompted for `Computer Name`)
@z

@x
    root@boot2docker:/# sudo make run
@y
    root@boot2docker:/# sudo make run
@z

@x
Start another terminal:
@y
Start another terminal:
@z

@x
    $ boot2docker ssh
    root@boot2docker:/# cd docker/docs/articles/https
    root@boot2docker:/# make client
@y
    $ boot2docker ssh
    root@boot2docker:/# cd docker/docs/articles/https
    root@boot2docker:/# make client
@z

@x
The last connects first with `--tls` and then with `--tlsverify`, both should succeed.
@y
The last connects first with `--tls` and then with `--tlsverify`, both should succeed.
@z
