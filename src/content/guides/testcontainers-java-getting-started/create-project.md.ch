%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Create the Java project
linkTitle: Create the project
description: Set up a Java project with Maven and implement a PostgreSQL-backed customer service.
@y
title: Create the Java project
linkTitle: Create the project
description: Set up a Java project with Maven and implement a PostgreSQL-backed customer service.
@z

@x
## Set up the Maven project
@y
## Set up the Maven project
@z

@x
Create a Java project with Maven from your preferred IDE. This guide uses
Maven, but you can use Gradle if you prefer. Add the following dependencies
to `pom.xml`:
@y
Create a Java project with Maven from your preferred IDE. This guide uses
Maven, but you can use Gradle if you prefer. Add the following dependencies
to `pom.xml`:
@z

@x
```xml
<dependencies>
    <dependency>
        <groupId>org.postgresql</groupId>
        <artifactId>postgresql</artifactId>
        <version>42.7.3</version>
    </dependency>
    <dependency>
        <groupId>ch.qos.logback</groupId>
        <artifactId>logback-classic</artifactId>
        <version>1.5.6</version>
    </dependency>
    <dependency>
        <groupId>org.junit.jupiter</groupId>
        <artifactId>junit-jupiter</artifactId>
        <version>5.10.2</version>
        <scope>test</scope>
    </dependency>
</dependencies>
@y
```xml
<dependencies>
    <dependency>
        <groupId>org.postgresql</groupId>
        <artifactId>postgresql</artifactId>
        <version>42.7.3</version>
    </dependency>
    <dependency>
        <groupId>ch.qos.logback</groupId>
        <artifactId>logback-classic</artifactId>
        <version>1.5.6</version>
    </dependency>
    <dependency>
        <groupId>org.junit.jupiter</groupId>
        <artifactId>junit-jupiter</artifactId>
        <version>5.10.2</version>
        <scope>test</scope>
    </dependency>
</dependencies>
@z

@x
<build>
    <plugins>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-surefire-plugin</artifactId>
            <version>3.2.5</version>
        </plugin>
    </plugins>
</build>
```
@y
<build>
    <plugins>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-surefire-plugin</artifactId>
            <version>3.2.5</version>
        </plugin>
    </plugins>
</build>
```
@z

@x
This adds the Postgres JDBC driver, logback for logging, JUnit 5 for testing,
and the latest `maven-surefire-plugin` for JUnit 5 support.
@y
This adds the Postgres JDBC driver, logback for logging, JUnit 5 for testing,
and the latest `maven-surefire-plugin` for JUnit 5 support.
@z

@x
## Implement the business logic
@y
## Implement the business logic
@z

@x
Create a `Customer` record:
@y
Create a `Customer` record:
@z

@x
```java
package com.testcontainers.demo;
@y
```java
package com.testcontainers.demo;
@z

@x
public record Customer(Long id, String name) {}
```
@y
public record Customer(Long id, String name) {}
```
@z

@x
Create a `DBConnectionProvider` class to hold JDBC connection parameters and
provide a database `Connection`:
@y
Create a `DBConnectionProvider` class to hold JDBC connection parameters and
provide a database `Connection`:
@z

@x
```java
package com.testcontainers.demo;
@y
```java
package com.testcontainers.demo;
@z

@x
import java.sql.Connection;
import java.sql.DriverManager;
@y
import java.sql.Connection;
import java.sql.DriverManager;
@z

@x
class DBConnectionProvider {
@y
class DBConnectionProvider {
@z

@x
  private final String url;
  private final String username;
  private final String password;
@y
  private final String url;
  private final String username;
  private final String password;
@z

@x
  public DBConnectionProvider(String url, String username, String password) {
    this.url = url;
    this.username = username;
    this.password = password;
  }
@y
  public DBConnectionProvider(String url, String username, String password) {
    this.url = url;
    this.username = username;
    this.password = password;
  }
@z

@x
  Connection getConnection() {
    try {
      return DriverManager.getConnection(url, username, password);
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }
}
```
@y
  Connection getConnection() {
    try {
      return DriverManager.getConnection(url, username, password);
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }
}
```
@z

@x
Create the `CustomerService` class:
@y
Create the `CustomerService` class:
@z

@x
```java
package com.testcontainers.demo;
@y
```java
package com.testcontainers.demo;
@z

@x
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
@y
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
@z

@x
public class CustomerService {
@y
public class CustomerService {
@z

@x
  private final DBConnectionProvider connectionProvider;
@y
  private final DBConnectionProvider connectionProvider;
@z

@x
  public CustomerService(DBConnectionProvider connectionProvider) {
    this.connectionProvider = connectionProvider;
    createCustomersTableIfNotExists();
  }
@y
  public CustomerService(DBConnectionProvider connectionProvider) {
    this.connectionProvider = connectionProvider;
    createCustomersTableIfNotExists();
  }
@z

@x
  public void createCustomer(Customer customer) {
    try (Connection conn = this.connectionProvider.getConnection()) {
      PreparedStatement pstmt = conn.prepareStatement(
        "insert into customers(id,name) values(?,?)"
      );
      pstmt.setLong(1, customer.id());
      pstmt.setString(2, customer.name());
      pstmt.execute();
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }
@y
  public void createCustomer(Customer customer) {
    try (Connection conn = this.connectionProvider.getConnection()) {
      PreparedStatement pstmt = conn.prepareStatement(
        "insert into customers(id,name) values(?,?)"
      );
      pstmt.setLong(1, customer.id());
      pstmt.setString(2, customer.name());
      pstmt.execute();
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }
@z

@x
  public List<Customer> getAllCustomers() {
    List<Customer> customers = new ArrayList<>();
@y
  public List<Customer> getAllCustomers() {
    List<Customer> customers = new ArrayList<>();
@z

@x
    try (Connection conn = this.connectionProvider.getConnection()) {
      PreparedStatement pstmt = conn.prepareStatement(
        "select id,name from customers"
      );
      ResultSet rs = pstmt.executeQuery();
      while (rs.next()) {
        long id = rs.getLong("id");
        String name = rs.getString("name");
        customers.add(new Customer(id, name));
      }
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
    return customers;
  }
@y
    try (Connection conn = this.connectionProvider.getConnection()) {
      PreparedStatement pstmt = conn.prepareStatement(
        "select id,name from customers"
      );
      ResultSet rs = pstmt.executeQuery();
      while (rs.next()) {
        long id = rs.getLong("id");
        String name = rs.getString("name");
        customers.add(new Customer(id, name));
      }
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
    return customers;
  }
@z

@x
  private void createCustomersTableIfNotExists() {
    try (Connection conn = this.connectionProvider.getConnection()) {
      PreparedStatement pstmt = conn.prepareStatement(
        """
        create table if not exists customers (
            id bigint not null,
            name varchar not null,
            primary key (id)
        )
        """
      );
      pstmt.execute();
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }
}
```
@y
  private void createCustomersTableIfNotExists() {
    try (Connection conn = this.connectionProvider.getConnection()) {
      PreparedStatement pstmt = conn.prepareStatement(
        """
        create table if not exists customers (
            id bigint not null,
            name varchar not null,
            primary key (id)
        )
        """
      );
      pstmt.execute();
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }
}
```
@z

@x
Here's what `CustomerService` does:
@y
Here's what `CustomerService` does:
@z

@x
- The constructor calls `createCustomersTableIfNotExists()` to ensure the table exists.
- `createCustomer()` inserts a customer record into the database.
- `getAllCustomers()` fetches all rows from the `customers` table and returns a list of `Customer` objects.
@y
- The constructor calls `createCustomersTableIfNotExists()` to ensure the table exists.
- `createCustomer()` inserts a customer record into the database.
- `getAllCustomers()` fetches all rows from the `customers` table and returns a list of `Customer` objects.
@z
