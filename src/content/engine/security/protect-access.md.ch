%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
description: How to setup and run Docker with SSH or HTTPS
keywords: docker, docs, article, example, ssh, https, daemon, tls, ca,  certificate
title: Protect the Docker daemon socket
@y
description: How to setup and run Docker with SSH or HTTPS
keywords: docker, docs, article, example, ssh, https, daemon, tls, ca,  certificate
title: Protect the Docker daemon socket
@z

@x
By default, Docker runs through a non-networked UNIX socket. It can also
optionally communicate using SSH or a TLS (HTTPS) socket.
@y
By default, Docker runs through a non-networked UNIX socket. It can also
optionally communicate using SSH or a TLS (HTTPS) socket.
@z

@x
## Use SSH to protect the Docker daemon socket
@y
## Use SSH to protect the Docker daemon socket
@z

@x
> **Note**
>
> The given `USERNAME` must have permissions to access the docker socket on the
> remote machine. Refer to [manage Docker as a non-root user](../install/linux-postinstall.md#manage-docker-as-a-non-root-user)
> to learn how to give a non-root user access to the docker socket.
@y
> **Note**
>
> The given `USERNAME` must have permissions to access the docker socket on the
> remote machine. Refer to [manage Docker as a non-root user](../install/linux-postinstall.md#manage-docker-as-a-non-root-user)
> to learn how to give a non-root user access to the docker socket.
@z

@x
The following example creates a [`docker context`](/engine/manage-resources/contexts.md)
to connect with a remote `dockerd` daemon on `host1.example.com` using SSH, and
as the `docker-user` user on the remote machine:
@y
The following example creates a [`docker context`](engine/manage-resources/contexts.md)
to connect with a remote `dockerd` daemon on `host1.example.com` using SSH, and
as the `docker-user` user on the remote machine:
@z

@x
```console
$ docker context create \
    --docker host=ssh://docker-user@host1.example.com \
    --description="Remote engine" \
    my-remote-engine
@y
```console
$ docker context create \
    --docker host=ssh://docker-user@host1.example.com \
    --description="Remote engine" \
    my-remote-engine
@z

@x
my-remote-engine
Successfully created context "my-remote-engine"
```
@y
my-remote-engine
Successfully created context "my-remote-engine"
```
@z

@x
After creating the context, use `docker context use` to switch the `docker` CLI
to use it, and to connect to the remote engine:
@y
After creating the context, use `docker context use` to switch the `docker` CLI
to use it, and to connect to the remote engine:
@z

@x
```console
$ docker context use my-remote-engine
my-remote-engine
Current context is now "my-remote-engine"
@y
```console
$ docker context use my-remote-engine
my-remote-engine
Current context is now "my-remote-engine"
@z

@x
$ docker info
<prints output of the remote engine>
```
@y
$ docker info
<prints output of the remote engine>
```
@z

@x
Use the `default` context to switch back to the default (local) daemon:
@y
Use the `default` context to switch back to the default (local) daemon:
@z

@x
```console
$ docker context use default
default
Current context is now "default"
```
@y
```console
$ docker context use default
default
Current context is now "default"
```
@z

@x
Alternatively, use the `DOCKER_HOST` environment variable to temporarily switch
the `docker` CLI to connect to the remote host using SSH. This does not require
creating a context, and can be useful to create an ad-hoc connection with a different
engine:
@y
Alternatively, use the `DOCKER_HOST` environment variable to temporarily switch
the `docker` CLI to connect to the remote host using SSH. This does not require
creating a context, and can be useful to create an ad-hoc connection with a different
engine:
@z

@x
```console
$ export DOCKER_HOST=ssh://docker-user@host1.example.com
$ docker info
<prints output of the remote engine>
```
@y
```console
$ export DOCKER_HOST=ssh://docker-user@host1.example.com
$ docker info
<prints output of the remote engine>
```
@z

@x
### SSH Tips
@y
### SSH Tips
@z

@x
For the best user experience with SSH, configure `~/.ssh/config` as follows to allow
reusing a SSH connection for multiple invocations of the `docker` CLI:
@y
For the best user experience with SSH, configure `~/.ssh/config` as follows to allow
reusing a SSH connection for multiple invocations of the `docker` CLI:
@z

@x
```text
ControlMaster     auto
ControlPath       ~/.ssh/control-%C
ControlPersist    yes
```
@y
```text
ControlMaster     auto
ControlPath       ~/.ssh/control-%C
ControlPersist    yes
```
@z

@x
## Use TLS (HTTPS) to protect the Docker daemon socket
@y
## Use TLS (HTTPS) to protect the Docker daemon socket
@z

@x
If you need Docker to be reachable through HTTP rather than SSH in a safe manner,
you can enable TLS (HTTPS) by specifying the `tlsverify` flag and pointing Docker's
`tlscacert` flag to a trusted CA certificate.
@y
If you need Docker to be reachable through HTTP rather than SSH in a safe manner,
you can enable TLS (HTTPS) by specifying the `tlsverify` flag and pointing Docker's
`tlscacert` flag to a trusted CA certificate.
@z

@x
In the daemon mode, it only allows connections from clients
authenticated by a certificate signed by that CA. In the client mode,
it only connects to servers with a certificate signed by that CA.
@y
In the daemon mode, it only allows connections from clients
authenticated by a certificate signed by that CA. In the client mode,
it only connects to servers with a certificate signed by that CA.
@z

@x
> **Important**
>
> Using TLS and managing a CA is an advanced topic. Familiarize yourself
> with OpenSSL, x509, and TLS before using it in production.
{ .important }
@y
> **Important**
>
> Using TLS and managing a CA is an advanced topic. Familiarize yourself
> with OpenSSL, x509, and TLS before using it in production.
{ .important }
@z

@x
### Create a CA, server and client keys with OpenSSL
@y
### Create a CA, server and client keys with OpenSSL
@z

@x
> **Note**
>
> Replace all instances of `$HOST` in the following example with the
> DNS name of your Docker daemon's host.
@y
> **Note**
>
> Replace all instances of `$HOST` in the following example with the
> DNS name of your Docker daemon's host.
@z

@x
First, on the Docker daemon's host machine, generate CA private and public keys:
@y
First, on the Docker daemon's host machine, generate CA private and public keys:
@z

@x
```console
$ openssl genrsa -aes256 -out ca-key.pem 4096
Generating RSA private key, 4096 bit long modulus
..............................................................................++
........++
e is 65537 (0x10001)
Enter pass phrase for ca-key.pem:
Verifying - Enter pass phrase for ca-key.pem:
@y
```console
$ openssl genrsa -aes256 -out ca-key.pem 4096
Generating RSA private key, 4096 bit long modulus
..............................................................................++
........++
e is 65537 (0x10001)
Enter pass phrase for ca-key.pem:
Verifying - Enter pass phrase for ca-key.pem:
@z

@x
$ openssl req -new -x509 -days 365 -key ca-key.pem -sha256 -out ca.pem
Enter pass phrase for ca-key.pem:
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [AU]:
State or Province Name (full name) [Some-State]:Queensland
Locality Name (eg, city) []:Brisbane
Organization Name (eg, company) [Internet Widgits Pty Ltd]:Docker Inc
Organizational Unit Name (eg, section) []:Sales
Common Name (e.g. server FQDN or YOUR name) []:$HOST
Email Address []:Sven@home.org.au
```
@y
$ openssl req -new -x509 -days 365 -key ca-key.pem -sha256 -out ca.pem
Enter pass phrase for ca-key.pem:
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [AU]:
State or Province Name (full name) [Some-State]:Queensland
Locality Name (eg, city) []:Brisbane
Organization Name (eg, company) [Internet Widgits Pty Ltd]:Docker Inc
Organizational Unit Name (eg, section) []:Sales
Common Name (e.g. server FQDN or YOUR name) []:$HOST
Email Address []:Sven@home.org.au
```
@z

@x
Now that you have a CA, you can create a server key and certificate
signing request (CSR). Make sure that "Common Name" matches the hostname you use
to connect to Docker:
@y
Now that you have a CA, you can create a server key and certificate
signing request (CSR). Make sure that "Common Name" matches the hostname you use
to connect to Docker:
@z

@x
> **Note**
>
> Replace all instances of `$HOST` in the following example with the
> DNS name of your Docker daemon's host.
@y
> **Note**
>
> Replace all instances of `$HOST` in the following example with the
> DNS name of your Docker daemon's host.
@z

@x
```console
$ openssl genrsa -out server-key.pem 4096
Generating RSA private key, 4096 bit long modulus
.....................................................................++
.................................................................................................++
e is 65537 (0x10001)
@y
```console
$ openssl genrsa -out server-key.pem 4096
Generating RSA private key, 4096 bit long modulus
.....................................................................++
.................................................................................................++
e is 65537 (0x10001)
@z

@x
$ openssl req -subj "/CN=$HOST" -sha256 -new -key server-key.pem -out server.csr
```
@y
$ openssl req -subj "/CN=$HOST" -sha256 -new -key server-key.pem -out server.csr
```
@z

@x
Next, we're going to sign the public key with our CA:
@y
Next, we're going to sign the public key with our CA:
@z

@x
Since TLS connections can be made through IP address as well as DNS name, the IP addresses
need to be specified when creating the certificate. For example, to allow connections
using `10.10.10.20` and `127.0.0.1`:
@y
Since TLS connections can be made through IP address as well as DNS name, the IP addresses
need to be specified when creating the certificate. For example, to allow connections
using `10.10.10.20` and `127.0.0.1`:
@z

@x
```console
$ echo subjectAltName = DNS:$HOST,IP:10.10.10.20,IP:127.0.0.1 >> extfile.cnf
```
@y
```console
$ echo subjectAltName = DNS:$HOST,IP:10.10.10.20,IP:127.0.0.1 >> extfile.cnf
```
@z

@x
Set the Docker daemon key's extended usage attributes to be used only for
server authentication:
@y
Set the Docker daemon key's extended usage attributes to be used only for
server authentication:
@z

@x
```console
$ echo extendedKeyUsage = serverAuth >> extfile.cnf
```
@y
```console
$ echo extendedKeyUsage = serverAuth >> extfile.cnf
```
@z

@x
Now, generate the signed certificate:
@y
Now, generate the signed certificate:
@z

@x
```console
$ openssl x509 -req -days 365 -sha256 -in server.csr -CA ca.pem -CAkey ca-key.pem \
  -CAcreateserial -out server-cert.pem -extfile extfile.cnf
Signature ok
subject=/CN=your.host.com
Getting CA Private Key
Enter pass phrase for ca-key.pem:
```
@y
```console
$ openssl x509 -req -days 365 -sha256 -in server.csr -CA ca.pem -CAkey ca-key.pem \
  -CAcreateserial -out server-cert.pem -extfile extfile.cnf
Signature ok
subject=/CN=your.host.com
Getting CA Private Key
Enter pass phrase for ca-key.pem:
```
@z

@x
[Authorization plugins](/engine/extend/plugins_authorization/) offer more
fine-grained control to supplement authentication from mutual TLS. In addition
to other information described in the above document, authorization plugins
running on a Docker daemon receive the certificate information for connecting
Docker clients.
@y
[Authorization plugins](__SUBDIR__/engine/extend/plugins_authorization/) offer more
fine-grained control to supplement authentication from mutual TLS. In addition
to other information described in the above document, authorization plugins
running on a Docker daemon receive the certificate information for connecting
Docker clients.
@z

@x
For client authentication, create a client key and certificate signing
request:
@y
For client authentication, create a client key and certificate signing
request:
@z

@x
> **Note**
>
> For simplicity of the next couple of steps, you may perform this
> step on the Docker daemon's host machine as well.
@y
> **Note**
>
> For simplicity of the next couple of steps, you may perform this
> step on the Docker daemon's host machine as well.
@z

@x
```console
$ openssl genrsa -out key.pem 4096
Generating RSA private key, 4096 bit long modulus
.........................................................++
................++
e is 65537 (0x10001)
@y
```console
$ openssl genrsa -out key.pem 4096
Generating RSA private key, 4096 bit long modulus
.........................................................++
................++
e is 65537 (0x10001)
@z

@x
$ openssl req -subj '/CN=client' -new -key key.pem -out client.csr
```
@y
$ openssl req -subj '/CN=client' -new -key key.pem -out client.csr
```
@z

@x
To make the key suitable for client authentication, create a new extensions
config file:
@y
To make the key suitable for client authentication, create a new extensions
config file:
@z

@x
```console
$ echo extendedKeyUsage = clientAuth > extfile-client.cnf
```
@y
```console
$ echo extendedKeyUsage = clientAuth > extfile-client.cnf
```
@z

@x
Now, generate the signed certificate:
@y
Now, generate the signed certificate:
@z

@x
```console
$ openssl x509 -req -days 365 -sha256 -in client.csr -CA ca.pem -CAkey ca-key.pem \
  -CAcreateserial -out cert.pem -extfile extfile-client.cnf
Signature ok
subject=/CN=client
Getting CA Private Key
Enter pass phrase for ca-key.pem:
```
@y
```console
$ openssl x509 -req -days 365 -sha256 -in client.csr -CA ca.pem -CAkey ca-key.pem \
  -CAcreateserial -out cert.pem -extfile extfile-client.cnf
Signature ok
subject=/CN=client
Getting CA Private Key
Enter pass phrase for ca-key.pem:
```
@z

@x
After generating `cert.pem` and `server-cert.pem` you can safely remove the
two certificate signing requests and extensions config files:
@y
After generating `cert.pem` and `server-cert.pem` you can safely remove the
two certificate signing requests and extensions config files:
@z

@x
```console
$ rm -v client.csr server.csr extfile.cnf extfile-client.cnf
```
@y
```console
$ rm -v client.csr server.csr extfile.cnf extfile-client.cnf
```
@z

@x
With a default `umask` of 022, your secret keys are *world-readable* and
writable for you and your group.
@y
With a default `umask` of 022, your secret keys are *world-readable* and
writable for you and your group.
@z

@x
To protect your keys from accidental damage, remove their
write permissions. To make them only readable by you, change file modes as follows:
@y
To protect your keys from accidental damage, remove their
write permissions. To make them only readable by you, change file modes as follows:
@z

@x
```console
$ chmod -v 0400 ca-key.pem key.pem server-key.pem
```
@y
```console
$ chmod -v 0400 ca-key.pem key.pem server-key.pem
```
@z

@x
Certificates can be world-readable, but you might want to remove write access to
prevent accidental damage:
@y
Certificates can be world-readable, but you might want to remove write access to
prevent accidental damage:
@z

@x
```console
$ chmod -v 0444 ca.pem server-cert.pem cert.pem
```
@y
```console
$ chmod -v 0444 ca.pem server-cert.pem cert.pem
```
@z

@x
Now you can make the Docker daemon only accept connections from clients
providing a certificate trusted by your CA:
@y
Now you can make the Docker daemon only accept connections from clients
providing a certificate trusted by your CA:
@z

@x
```console
$ dockerd \
    --tlsverify \
    --tlscacert=ca.pem \
    --tlscert=server-cert.pem \
    --tlskey=server-key.pem \
    -H=0.0.0.0:2376
```
@y
```console
$ dockerd \
    --tlsverify \
    --tlscacert=ca.pem \
    --tlscert=server-cert.pem \
    --tlskey=server-key.pem \
    -H=0.0.0.0:2376
```
@z

@x
To connect to Docker and validate its certificate, provide your client keys,
certificates and trusted CA:
@y
To connect to Docker and validate its certificate, provide your client keys,
certificates and trusted CA:
@z

@x
> **Tip**
>
> This step should be run on your Docker client machine. As such, you
> need to copy your CA certificate, your server certificate, and your client
> certificate to that machine.
{ .tip }
@y
> **Tip**
>
> This step should be run on your Docker client machine. As such, you
> need to copy your CA certificate, your server certificate, and your client
> certificate to that machine.
{ .tip }
@z

@x
> **Note**
>
> Replace all instances of `$HOST` in the following example with the
> DNS name of your Docker daemon's host.
@y
> **Note**
>
> Replace all instances of `$HOST` in the following example with the
> DNS name of your Docker daemon's host.
@z

@x
```console
$ docker --tlsverify \
    --tlscacert=ca.pem \
    --tlscert=cert.pem \
    --tlskey=key.pem \
    -H=$HOST:2376 version
```
@y
```console
$ docker --tlsverify \
    --tlscacert=ca.pem \
    --tlscert=cert.pem \
    --tlskey=key.pem \
    -H=$HOST:2376 version
```
@z

@x
> **Note**
>
> Docker over TLS should run on TCP port 2376.
@y
> **Note**
>
> Docker over TLS should run on TCP port 2376.
@z

@x
> **Warning**
>
> As shown in the example above, you don't need to run the `docker` client
> with `sudo` or the `docker` group when you use certificate authentication.
> That means anyone with the keys can give any instructions to your Docker
> daemon, giving them root access to the machine hosting the daemon. Guard
> these keys as you would a root password!
{ .warning }
@y
> **Warning**
>
> As shown in the example above, you don't need to run the `docker` client
> with `sudo` or the `docker` group when you use certificate authentication.
> That means anyone with the keys can give any instructions to your Docker
> daemon, giving them root access to the machine hosting the daemon. Guard
> these keys as you would a root password!
{ .warning }
@z

@x
### Secure by default
@y
### Secure by default
@z

@x
If you want to secure your Docker client connections by default, you can move
the files to the `.docker` directory in your home directory --- and set the
`DOCKER_HOST` and `DOCKER_TLS_VERIFY` variables as well (instead of passing
`-H=tcp://$HOST:2376` and `--tlsverify` on every call).
@y
If you want to secure your Docker client connections by default, you can move
the files to the `.docker` directory in your home directory --- and set the
`DOCKER_HOST` and `DOCKER_TLS_VERIFY` variables as well (instead of passing
`-H=tcp://$HOST:2376` and `--tlsverify` on every call).
@z

@x
```console
$ mkdir -pv ~/.docker
$ cp -v {ca,cert,key}.pem ~/.docker
@y
```console
$ mkdir -pv ~/.docker
$ cp -v {ca,cert,key}.pem ~/.docker
@z

@x
$ export DOCKER_HOST=tcp://$HOST:2376 DOCKER_TLS_VERIFY=1
```
@y
$ export DOCKER_HOST=tcp://$HOST:2376 DOCKER_TLS_VERIFY=1
```
@z

@x
Docker now connects securely by default:
@y
Docker now connects securely by default:
@z

@x
    $ docker ps
@y
    $ docker ps
@z

@x
### Other modes
@y
### Other modes
@z

@x
If you don't want to have complete two-way authentication, you can run
Docker in various other modes by mixing the flags.
@y
If you don't want to have complete two-way authentication, you can run
Docker in various other modes by mixing the flags.
@z

@x
#### Daemon modes
@y
#### Daemon modes
@z

@x
 - `tlsverify`, `tlscacert`, `tlscert`, `tlskey` set: Authenticate clients
 - `tls`, `tlscert`, `tlskey`: Do not authenticate clients
@y
 - `tlsverify`, `tlscacert`, `tlscert`, `tlskey` set: Authenticate clients
 - `tls`, `tlscert`, `tlskey`: Do not authenticate clients
@z

@x
#### Client modes
@y
#### Client modes
@z

@x
 - `tls`: Authenticate server based on public/default CA pool
 - `tlsverify`, `tlscacert`: Authenticate server based on given CA
 - `tls`, `tlscert`, `tlskey`: Authenticate with client certificate, do not
   authenticate server based on given CA
 - `tlsverify`, `tlscacert`, `tlscert`, `tlskey`: Authenticate with client
   certificate and authenticate server based on given CA
@y
 - `tls`: Authenticate server based on public/default CA pool
 - `tlsverify`, `tlscacert`: Authenticate server based on given CA
 - `tls`, `tlscert`, `tlskey`: Authenticate with client certificate, do not
   authenticate server based on given CA
 - `tlsverify`, `tlscacert`, `tlscert`, `tlskey`: Authenticate with client
   certificate and authenticate server based on given CA
@z

@x
If found, the client sends its client certificate, so you just need
to drop your keys into `~/.docker/{ca,cert,key}.pem`. Alternatively,
if you want to store your keys in another location, you can specify that
location using the environment variable `DOCKER_CERT_PATH`.
@y
If found, the client sends its client certificate, so you just need
to drop your keys into `~/.docker/{ca,cert,key}.pem`. Alternatively,
if you want to store your keys in another location, you can specify that
location using the environment variable `DOCKER_CERT_PATH`.
@z

@x
```console
$ export DOCKER_CERT_PATH=~/.docker/zone1/
$ docker --tlsverify ps
```
@y
```console
$ export DOCKER_CERT_PATH=~/.docker/zone1/
$ docker --tlsverify ps
```
@z

@x
#### Connecting to the secure Docker port using `curl`
@y
#### Connecting to the secure Docker port using `curl`
@z

@x
To use `curl` to make test API requests, you need to use three extra command line
flags:
@y
To use `curl` to make test API requests, you need to use three extra command line
flags:
@z

@x
```console
$ curl https://$HOST:2376/images/json \
  --cert ~/.docker/cert.pem \
  --key ~/.docker/key.pem \
  --cacert ~/.docker/ca.pem
```
@y
```console
$ curl https://$HOST:2376/images/json \
  --cert ~/.docker/cert.pem \
  --key ~/.docker/key.pem \
  --cacert ~/.docker/ca.pem
```
@z

@x
## Related information
@y
## Related information
@z

@x
* [Using certificates for repository client verification](certificates.md)
* [Use trusted images](trust/index.md)
@y
* [Using certificates for repository client verification](certificates.md)
* [Use trusted images](trust/index.md)
@z
