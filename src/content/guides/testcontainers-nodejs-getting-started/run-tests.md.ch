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
Add the test script to `package.json` if it isn't there already:
@y
Add the test script to `package.json` if it isn't there already:
@z

@x
```json
{
  "scripts": {
    "test": "jest"
  }
}
```
@y
```json
{
  "scripts": {
    "test": "jest"
  }
}
```
@z

@x
Then run the tests:
@y
Then run the tests:
@z

@x
```console
$ npm test
```
@y
```console
$ npm test
```
@z

@x
You should see output like:
@y
You should see output like:
@z

@x
```text
 PASS  src/customer-repository.test.js
  Customer Repository
    ✓ should create and return multiple customers (5 ms)
@y
```text
 PASS  src/customer-repository.test.js
  Customer Repository
    ✓ should create and return multiple customers (5 ms)
@z

@x
Test Suites: 1 passed, 1 total
Tests:       1 passed, 1 total
```
@y
Test Suites: 1 passed, 1 total
Tests:       1 passed, 1 total
```
@z

@x
To see what Testcontainers is doing under the hood — which containers it
starts, what versions it uses — set the `DEBUG` environment variable:
@y
To see what Testcontainers is doing under the hood — which containers it
starts, what versions it uses — set the `DEBUG` environment variable:
@z

@x
```console
$ DEBUG=testcontainers* npm test
```
@y
```console
$ DEBUG=testcontainers* npm test
```
@z

@x
## Summary
@y
## Summary
@z

@x
The Testcontainers for Node.js library helps you write integration tests using
the same type of database (Postgres) that you use in production, instead of
mocks. Because you aren't using mocks and instead talk to real services, you're
free to refactor code and still verify that the application works as expected.
@y
The Testcontainers for Node.js library helps you write integration tests using
the same type of database (Postgres) that you use in production, instead of
mocks. Because you aren't using mocks and instead talk to real services, you're
free to refactor code and still verify that the application works as expected.
@z

@x
In addition to PostgreSQL, Testcontainers provides dedicated
[modules](https://github.com/testcontainers/testcontainers-node/tree/main/packages/modules)
for many SQL databases, NoSQL databases, messaging queues, and more.
@y
In addition to PostgreSQL, Testcontainers provides dedicated
[modules](https://github.com/testcontainers/testcontainers-node/tree/main/packages/modules)
for many SQL databases, NoSQL databases, messaging queues, and more.
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
- [Testcontainers for Node.js documentation](https://node.testcontainers.org)
@y
- [Testcontainers for Node.js documentation](https://node.testcontainers.org)
@z
