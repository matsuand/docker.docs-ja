%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Write tests with Testcontainers
linkTitle: Write tests
description: Write integration tests using Testcontainers for Node.js and Jest with a real PostgreSQL database.
@y
title: Write tests with Testcontainers
linkTitle: Write tests
description: Write integration tests using Testcontainers for Node.js and Jest with a real PostgreSQL database.
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
