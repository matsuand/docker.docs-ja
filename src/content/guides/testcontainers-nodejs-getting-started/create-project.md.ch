%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Create the Node.js project
linkTitle: Create the project
description: Set up a Node.js project with a PostgreSQL-backed customer repository.
@y
title: Create the Node.js project
linkTitle: Create the project
description: Set up a Node.js project with a PostgreSQL-backed customer repository.
@z

@x
## Initialize the project
@y
## Initialize the project
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
## Implement the customer repository
@y
## Implement the customer repository
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
