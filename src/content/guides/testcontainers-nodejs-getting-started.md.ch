%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Getting started with Testcontainers for Node.js
linkTitle: Testcontainers for Node.js
description: Learn how to use Testcontainers for Node.js to test database interactions with a real PostgreSQL instance.
keywords: testcontainers, nodejs, javascript, testing, postgresql, integration testing, jest
summary: |
  Learn how to create a Node.js application and test database interactions
  using Testcontainers for Node.js with a real PostgreSQL instance.
aliases:
  - /guides/testcontainers-nodejs-getting-started/create-project/
  - /guides/testcontainers-nodejs-getting-started/run-tests/
  - /guides/testcontainers-nodejs-getting-started/write-tests/
params:
  tags: [testing]
  time: 15 minutes
---
@y
---
title: Getting started with Testcontainers for Node.js
linkTitle: Testcontainers for Node.js
description: Learn how to use Testcontainers for Node.js to test database interactions with a real PostgreSQL instance.
keywords: testcontainers, nodejs, javascript, testing, postgresql, integration testing, jest
summary: |
  Learn how to create a Node.js application and test database interactions
  using Testcontainers for Node.js with a real PostgreSQL instance.
aliases:
  - /guides/testcontainers-nodejs-getting-started/create-project/
  - /guides/testcontainers-nodejs-getting-started/run-tests/
  - /guides/testcontainers-nodejs-getting-started/write-tests/
params:
  tags: [testing]
  time: 15 minutes
---
@z

@x
<!-- Source: https://github.com/testcontainers/tc-guide-getting-started-with-testcontainers-for-nodejs -->
@y
<!-- Source: https://github.com/testcontainers/tc-guide-getting-started-with-testcontainers-for-nodejs -->
@z

@x
In this guide, you will learn how to:
@y
In this guide, you will learn how to:
@z

@x
- Create a Node.js application that stores and retrieves customers from PostgreSQL
- Write integration tests using Testcontainers and Jest
- Run tests against a real PostgreSQL database in a Docker container
@y
- Create a Node.js application that stores and retrieves customers from PostgreSQL
- Write integration tests using Testcontainers and Jest
- Run tests against a real PostgreSQL database in a Docker container
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- Node.js 18+
- npm
- A Docker environment supported by Testcontainers
@y
- Node.js 18+
- npm
- A Docker environment supported by Testcontainers
@z

@x
> [!NOTE]
> If you're new to Testcontainers, visit the
> [Testcontainers overview](https://testcontainers.com/getting-started/) to learn more about
> Testcontainers and the benefits of using it.
@y
> [!NOTE]
> If you're new to Testcontainers, visit the
> [Testcontainers overview](https://testcontainers.com/getting-started/) to learn more about
> Testcontainers and the benefits of using it.
@z

@x
## Create the Node.js project
@y
## Create the Node.js project
@z

@x
### Initialize the project
@y
### Initialize the project
@z

@x
Create a new Node.js project:
@y
Create a new Node.js project:
@z

@x
```console
$ npm init -y
```
@y
```console
$ npm init -y
```
@z

@x
Add `pg`, `jest`, and `@testcontainers/postgresql` as dependencies:
@y
Add `pg`, `jest`, and `@testcontainers/postgresql` as dependencies:
@z

@x
```console
$ npm install pg --save
$ npm install jest @testcontainers/postgresql --save-dev
```
@y
```console
$ npm install pg --save
$ npm install jest @testcontainers/postgresql --save-dev
```
@z

@x
### Implement the customer repository
@y
### Implement the customer repository
@z

@x
Create `src/customer-repository.js` with functions to manage customers in
PostgreSQL:
@y
Create `src/customer-repository.js` with functions to manage customers in
PostgreSQL:
@z

@x
```javascript
async function createCustomerTable(client) {
  const sql =
    "CREATE TABLE IF NOT EXISTS customers (id INT NOT NULL, name VARCHAR NOT NULL, PRIMARY KEY (id))";
  await client.query(sql);
}
@y
```javascript
async function createCustomerTable(client) {
  const sql =
    "CREATE TABLE IF NOT EXISTS customers (id INT NOT NULL, name VARCHAR NOT NULL, PRIMARY KEY (id))";
  await client.query(sql);
}
@z

@x
async function createCustomer(client, customer) {
  const sql = "INSERT INTO customers (id, name) VALUES($1, $2)";
  await client.query(sql, [customer.id, customer.name]);
}
@y
async function createCustomer(client, customer) {
  const sql = "INSERT INTO customers (id, name) VALUES($1, $2)";
  await client.query(sql, [customer.id, customer.name]);
}
@z

@x
async function getCustomers(client) {
  const sql = "SELECT * FROM customers";
  const result = await client.query(sql);
  return result.rows;
}
@y
async function getCustomers(client) {
  const sql = "SELECT * FROM customers";
  const result = await client.query(sql);
  return result.rows;
}
@z

@x
module.exports = { createCustomerTable, createCustomer, getCustomers };
```
@y
module.exports = { createCustomerTable, createCustomer, getCustomers };
```
@z

@x
The module provides three functions:
@y
The module provides three functions:
@z

@x
- `createCustomerTable()` creates the `customers` table if it doesn't exist.
- `createCustomer()` inserts a customer record.
- `getCustomers()` fetches all customer records.
@y
- `createCustomerTable()` creates the `customers` table if it doesn't exist.
- `createCustomer()` inserts a customer record.
- `getCustomers()` fetches all customer records.
@z

@x
## Write tests with Testcontainers
@y
## Write tests with Testcontainers
@z

@x
Create `src/customer-repository.test.js` with the test:
@y
Create `src/customer-repository.test.js` with the test:
@z

@x
```javascript
const { Client } = require("pg");
const { PostgreSqlContainer } = require("@testcontainers/postgresql");
const {
  createCustomerTable,
  createCustomer,
  getCustomers,
} = require("./customer-repository");
@y
```javascript
const { Client } = require("pg");
const { PostgreSqlContainer } = require("@testcontainers/postgresql");
const {
  createCustomerTable,
  createCustomer,
  getCustomers,
} = require("./customer-repository");
@z

@x
describe("Customer Repository", () => {
  jest.setTimeout(60000);
@y
describe("Customer Repository", () => {
  jest.setTimeout(60000);
@z

@x
  let postgresContainer;
  let postgresClient;
@y
  let postgresContainer;
  let postgresClient;
@z

@x
  beforeAll(async () => {
    postgresContainer = await new PostgreSqlContainer().start();
    postgresClient = new Client({
      connectionString: postgresContainer.getConnectionUri(),
    });
    await postgresClient.connect();
    await createCustomerTable(postgresClient);
  });
@y
  beforeAll(async () => {
    postgresContainer = await new PostgreSqlContainer().start();
    postgresClient = new Client({
      connectionString: postgresContainer.getConnectionUri(),
    });
    await postgresClient.connect();
    await createCustomerTable(postgresClient);
  });
@z

@x
  afterAll(async () => {
    await postgresClient.end();
    await postgresContainer.stop();
  });
@y
  afterAll(async () => {
    await postgresClient.end();
    await postgresContainer.stop();
  });
@z

@x
  it("should create and return multiple customers", async () => {
    const customer1 = { id: 1, name: "John Doe" };
    const customer2 = { id: 2, name: "Jane Doe" };
@y
  it("should create and return multiple customers", async () => {
    const customer1 = { id: 1, name: "John Doe" };
    const customer2 = { id: 2, name: "Jane Doe" };
@z

@x
    await createCustomer(postgresClient, customer1);
    await createCustomer(postgresClient, customer2);
@y
    await createCustomer(postgresClient, customer1);
    await createCustomer(postgresClient, customer2);
@z

@x
    const customers = await getCustomers(postgresClient);
    expect(customers).toEqual([customer1, customer2]);
  });
});
```
@y
    const customers = await getCustomers(postgresClient);
    expect(customers).toEqual([customer1, customer2]);
  });
});
```
@z

@x
Here's what the test does:
@y
Here's what the test does:
@z

@x
- The `beforeAll` block starts a real PostgreSQL container using
  `PostgreSqlContainer`. It then creates a `pg` client connected to the
  container and sets up the `customers` table.
- The `afterAll` block closes the client connection and stops the container.
- The test inserts two customers, fetches all customers, and asserts the
  results match.
@y
- The `beforeAll` block starts a real PostgreSQL container using
  `PostgreSqlContainer`. It then creates a `pg` client connected to the
  container and sets up the `customers` table.
- The `afterAll` block closes the client connection and stops the container.
- The test inserts two customers, fetches all customers, and asserts the
  results match.
@z

@x
The test timeout is set to 60 seconds to allow time for the container to start
on the first run (when the Docker image needs to be pulled).
@y
The test timeout is set to 60 seconds to allow time for the container to start
on the first run (when the Docker image needs to be pulled).
@z

@x
## Run tests and next steps
@y
## Run tests and next steps
@z

@x
### Run the tests
@y
### Run the tests
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
### Summary
@y
### Summary
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
### Further reading
@y
### Further reading
@z

@x
- [Testcontainers for Node.js documentation](https://node.testcontainers.org)
@y
- [Testcontainers for Node.js documentation](https://node.testcontainers.org)
@z
