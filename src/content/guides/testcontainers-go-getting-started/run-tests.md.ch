%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Run tests and next steps
linkTitle: Run tests
description: Run your Testcontainers-based integration tests and explore next steps.
@y
title: Run tests and next steps
linkTitle: Run tests
description: Run your Testcontainers-based integration tests and explore next steps.
@z

@x
## Run the tests
@y
## Run the tests
@z

@x
Run all the tests using `go test ./...`. Optionally add the `-v` flag for
verbose output:
@y
Run all the tests using `go test ./...`. Optionally add the `-v` flag for
verbose output:
@z

@x
```console
$ go test -v ./...
```
@y
```console
$ go test -v ./...
```
@z

@x
You should see two Postgres Docker containers start automatically: one for the
suite and its two tests, and another for the initial standalone test. All tests
should pass. After the tests finish, the containers are stopped and removed
automatically.
@y
You should see two Postgres Docker containers start automatically: one for the
suite and its two tests, and another for the initial standalone test. All tests
should pass. After the tests finish, the containers are stopped and removed
automatically.
@z

@x
## Summary
@y
## Summary
@z

@x
The Testcontainers for Go library helps you write integration tests by using
the same type of database (Postgres) that you use in production, instead of
mocks. Because you aren't using mocks and instead talk to real services, you're
free to refactor code and still verify that the application works as expected.
@y
The Testcontainers for Go library helps you write integration tests by using
the same type of database (Postgres) that you use in production, instead of
mocks. Because you aren't using mocks and instead talk to real services, you're
free to refactor code and still verify that the application works as expected.
@z

@x
To learn more about Testcontainers, visit the
[Testcontainers overview](https://testcontainers.com/getting-started/).
@y
To learn more about Testcontainers, visit the
[Testcontainers overview](https://testcontainers.com/getting-started/).
@z

@x
## Further reading
@y
## Further reading
@z

@x
- [Testcontainers for Go documentation](https://golang.testcontainers.org/)
- [Testcontainers for Go quickstart](https://golang.testcontainers.org/quickstart/)
- [Testcontainers Postgres module for Go](https://golang.testcontainers.org/modules/postgres/)
@y
- [Testcontainers for Go documentation](https://golang.testcontainers.org/)
- [Testcontainers for Go quickstart](https://golang.testcontainers.org/quickstart/)
- [Testcontainers Postgres module for Go](https://golang.testcontainers.org/modules/postgres/)
@z
