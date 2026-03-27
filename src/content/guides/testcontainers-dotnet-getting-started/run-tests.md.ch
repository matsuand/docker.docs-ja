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
Run the tests:
@y
Run the tests:
@z

@x
```console
$ dotnet test
```
@y
```console
$ dotnet test
```
@z

@x
You can see in the output that Testcontainers pulls the Postgres Docker image
from Docker Hub (if not already available locally), starts the container, and
runs the test.
@y
You can see in the output that Testcontainers pulls the Postgres Docker image
from Docker Hub (if not already available locally), starts the container, and
runs the test.
@z

@x
Writing an integration test using Testcontainers works like writing a unit test
that you can run from your IDE. Your teammates can clone the project and run
tests without installing Postgres on their machines.
@y
Writing an integration test using Testcontainers works like writing a unit test
that you can run from your IDE. Your teammates can clone the project and run
tests without installing Postgres on their machines.
@z

@x
## Summary
@y
## Summary
@z

@x
The Testcontainers for .NET library helps you write integration tests using the
same type of database (Postgres) that you use in production, instead of mocks.
Because you aren't using mocks and instead talk to real services, you're free
to refactor code and still verify that the application works as expected.
@y
The Testcontainers for .NET library helps you write integration tests using the
same type of database (Postgres) that you use in production, instead of mocks.
Because you aren't using mocks and instead talk to real services, you're free
to refactor code and still verify that the application works as expected.
@z

@x
In addition to Postgres, Testcontainers provides dedicated
[modules](https://www.nuget.org/profiles/Testcontainers) for many SQL
databases, NoSQL databases, messaging queues, and more.
@y
In addition to Postgres, Testcontainers provides dedicated
[modules](https://www.nuget.org/profiles/Testcontainers) for many SQL
databases, NoSQL databases, messaging queues, and more.
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
- [Testing an ASP.NET Core web app](https://testcontainers.com/guides/testing-an-aspnet-core-web-app/)
@y
- [Testing an ASP.NET Core web app](https://testcontainers.com/guides/testing-an-aspnet-core-web-app/)
@z
