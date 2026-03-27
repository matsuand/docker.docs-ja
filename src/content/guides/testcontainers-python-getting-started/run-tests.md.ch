%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

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
Run the tests using pytest:
@y
Run the tests using pytest:
@z

@x
```console
$ pytest -v
```
@y
```console
$ pytest -v
```
@z

@x
You should see output similar to:
@y
You should see output similar to:
@z

@x
```text
============================= test session starts ==============================
platform linux -- Python 3.13.x, pytest-9.x.x
collected 2 items
@y
```text
============================= test session starts ==============================
platform linux -- Python 3.13.x, pytest-9.x.x
collected 2 items
@z

@x
tests/test_customers.py::test_get_all_customers PASSED                   [ 50%]
tests/test_customers.py::test_get_customer_by_email PASSED               [100%]
@y
tests/test_customers.py::test_get_all_customers PASSED                   [ 50%]
tests/test_customers.py::test_get_customer_by_email PASSED               [100%]
@z

@x
============================== 2 passed in 1.90s ===============================
```
@y
============================== 2 passed in 1.90s ===============================
```
@z

@x
The tests run against a real PostgreSQL database instead of mocks, which gives
more confidence in the implementation.
@y
The tests run against a real PostgreSQL database instead of mocks, which gives
more confidence in the implementation.
@z

@x
## Summary
@y
## Summary
@z

@x
The Testcontainers for Python library helps you write integration tests using the
same type of database (Postgres) that you use in production, instead of mocks.
Because you aren't using mocks and instead talk to real services, you're free
to refactor code and still verify that the application works as expected.
@y
The Testcontainers for Python library helps you write integration tests using the
same type of database (Postgres) that you use in production, instead of mocks.
Because you aren't using mocks and instead talk to real services, you're free
to refactor code and still verify that the application works as expected.
@z

@x
In addition to PostgreSQL, Testcontainers for Python provides modules for many
SQL databases, NoSQL databases, messaging queues, and more. You can use
Testcontainers to run any containerized dependency for your tests.
@y
In addition to PostgreSQL, Testcontainers for Python provides modules for many
SQL databases, NoSQL databases, messaging queues, and more. You can use
Testcontainers to run any containerized dependency for your tests.
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
- [testcontainers-python documentation](https://testcontainers-python.readthedocs.io/)
- [Getting started with Testcontainers for Go](/guides/testcontainers-go-getting-started/)
- [Getting started with Testcontainers for Java](https://testcontainers.com/guides/getting-started-with-testcontainers-for-java/)
- [Getting started with Testcontainers for Node.js](https://testcontainers.com/guides/getting-started-with-testcontainers-for-nodejs/)
@y
- [testcontainers-python documentation](https://testcontainers-python.readthedocs.io/)
- [Getting started with Testcontainers for Go](__SUBDIR__/guides/testcontainers-go-getting-started/)
- [Getting started with Testcontainers for Java](https://testcontainers.com/guides/getting-started-with-testcontainers-for-java/)
- [Getting started with Testcontainers for Node.js](https://testcontainers.com/guides/getting-started-with-testcontainers-for-nodejs/)
@z
