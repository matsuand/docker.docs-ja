%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Create the Spring Boot project
linkTitle: Create the project
description: Set up a Spring Boot project with Kafka, Spring Data JPA, and MySQL.
@y
title: Create the Spring Boot project
linkTitle: Create the project
description: Set up a Spring Boot project with Kafka, Spring Data JPA, and MySQL.
@z

@x
## Set up the project
@y
## Set up the project
@z

@x
Create a Spring Boot project from [Spring Initializr](https://start.spring.io)
by selecting the **Spring for Apache Kafka**, **Spring Data JPA**, **MySQL Driver**,
and **Testcontainers** starters.
@y
Create a Spring Boot project from [Spring Initializr](https://start.spring.io)
by selecting the **Spring for Apache Kafka**, **Spring Data JPA**, **MySQL Driver**,
and **Testcontainers** starters.
@z

@x
Alternatively, clone the
[guide repository](https://github.com/testcontainers/tc-guide-testing-spring-boot-kafka-listener).
@y
Alternatively, clone the
[guide repository](https://github.com/testcontainers/tc-guide-testing-spring-boot-kafka-listener).
@z

@x
After generating the application, add the Awaitility library as a test
dependency. You'll use it later to assert the expectations of an asynchronous
process flow.
@y
After generating the application, add the Awaitility library as a test
dependency. You'll use it later to assert the expectations of an asynchronous
process flow.
@z

@x
The key dependencies in `pom.xml` are:
@y
The key dependencies in `pom.xml` are:
@z

@x
```xml
<properties>
    <java.version>17</java.version>
    <testcontainers.version>2.0.4</testcontainers.version>
</properties>
<dependencies>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-data-jpa</artifactId>
    </dependency>
    <dependency>
        <groupId>org.springframework.kafka</groupId>
        <artifactId>spring-kafka</artifactId>
    </dependency>
    <dependency>
        <groupId>com.mysql</groupId>
        <artifactId>mysql-connector-j</artifactId>
        <scope>runtime</scope>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-test</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.springframework.kafka</groupId>
        <artifactId>spring-kafka-test</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.testcontainers</groupId>
        <artifactId>testcontainers-junit-jupiter</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.testcontainers</groupId>
        <artifactId>testcontainers-kafka</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.testcontainers</groupId>
        <artifactId>testcontainers-mysql</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.awaitility</groupId>
        <artifactId>awaitility</artifactId>
        <scope>test</scope>
    </dependency>
</dependencies>
```
@y
```xml
<properties>
    <java.version>17</java.version>
    <testcontainers.version>2.0.4</testcontainers.version>
</properties>
<dependencies>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-data-jpa</artifactId>
    </dependency>
    <dependency>
        <groupId>org.springframework.kafka</groupId>
        <artifactId>spring-kafka</artifactId>
    </dependency>
    <dependency>
        <groupId>com.mysql</groupId>
        <artifactId>mysql-connector-j</artifactId>
        <scope>runtime</scope>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-test</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.springframework.kafka</groupId>
        <artifactId>spring-kafka-test</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.testcontainers</groupId>
        <artifactId>testcontainers-junit-jupiter</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.testcontainers</groupId>
        <artifactId>testcontainers-kafka</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.testcontainers</groupId>
        <artifactId>testcontainers-mysql</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.awaitility</groupId>
        <artifactId>awaitility</artifactId>
        <scope>test</scope>
    </dependency>
</dependencies>
```
@z

@x
Using the Testcontainers BOM (Bill of Materials) is recommended so that you
don't have to repeat the version for every Testcontainers module dependency.
@y
Using the Testcontainers BOM (Bill of Materials) is recommended so that you
don't have to repeat the version for every Testcontainers module dependency.
@z

@x
## Create the JPA entity
@y
## Create the JPA entity
@z

@x
The application listens to a topic called `product-price-changes`. When a
message arrives, it extracts the product code and price from the event payload
and updates the price for that product in the MySQL database.
@y
The application listens to a topic called `product-price-changes`. When a
message arrives, it extracts the product code and price from the event payload
and updates the price for that product in the MySQL database.
@z

@x
Create `Product.java`:
@y
Create `Product.java`:
@z

@x
```java
package com.testcontainers.demo;
@y
```java
package com.testcontainers.demo;
@z

@x
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.math.BigDecimal;
@y
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.math.BigDecimal;
@z

@x
@Entity
@Table(name = "products")
class Product {
@y
@Entity
@Table(name = "products")
class Product {
@z

@x
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;
@y
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;
@z

@x
  @Column(nullable = false, unique = true)
  private String code;
@y
  @Column(nullable = false, unique = true)
  private String code;
@z

@x
  @Column(nullable = false)
  private String name;
@y
  @Column(nullable = false)
  private String name;
@z

@x
  @Column(nullable = false)
  private BigDecimal price;
@y
  @Column(nullable = false)
  private BigDecimal price;
@z

@x
  public Product() {}
@y
  public Product() {}
@z

@x
  public Product(Long id, String code, String name, BigDecimal price) {
    this.id = id;
    this.code = code;
    this.name = name;
    this.price = price;
  }
@y
  public Product(Long id, String code, String name, BigDecimal price) {
    this.id = id;
    this.code = code;
    this.name = name;
    this.price = price;
  }
@z

@x
  public Long getId() {
    return id;
  }
@y
  public Long getId() {
    return id;
  }
@z

@x
  public void setId(Long id) {
    this.id = id;
  }
@y
  public void setId(Long id) {
    this.id = id;
  }
@z

@x
  public String getCode() {
    return code;
  }
@y
  public String getCode() {
    return code;
  }
@z

@x
  public void setCode(String code) {
    this.code = code;
  }
@y
  public void setCode(String code) {
    this.code = code;
  }
@z

@x
  public String getName() {
    return name;
  }
@y
  public String getName() {
    return name;
  }
@z

@x
  public void setName(String name) {
    this.name = name;
  }
@y
  public void setName(String name) {
    this.name = name;
  }
@z

@x
  public BigDecimal getPrice() {
    return price;
  }
@y
  public BigDecimal getPrice() {
    return price;
  }
@z

@x
  public void setPrice(BigDecimal price) {
    this.price = price;
  }
}
```
@y
  public void setPrice(BigDecimal price) {
    this.price = price;
  }
}
```
@z

@x
## Create the Spring Data JPA repository
@y
## Create the Spring Data JPA repository
@z

@x
Create a repository interface for the `Product` entity with a method to find a
product by code and a method to update the price for a given product code:
@y
Create a repository interface for the `Product` entity with a method to find a
product by code and a method to update the price for a given product code:
@z

@x
```java
package com.testcontainers.demo;
@y
```java
package com.testcontainers.demo;
@z

@x
import java.math.BigDecimal;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
@y
import java.math.BigDecimal;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
@z

@x
interface ProductRepository extends JpaRepository<Product, Long> {
  Optional<Product> findByCode(String code);
@y
interface ProductRepository extends JpaRepository<Product, Long> {
  Optional<Product> findByCode(String code);
@z

@x
  @Modifying
  @Query("update Product p set p.price = :price where p.code = :productCode")
  void updateProductPrice(
    @Param("productCode") String productCode,
    @Param("price") BigDecimal price
  );
}
```
@y
  @Modifying
  @Query("update Product p set p.price = :price where p.code = :productCode")
  void updateProductPrice(
    @Param("productCode") String productCode,
    @Param("price") BigDecimal price
  );
}
```
@z

@x
## Add a schema creation script
@y
## Add a schema creation script
@z

@x
Because the application doesn't use an in-memory database, you need to create
the MySQL tables. The recommended approach for production is a migration tool
like Flyway or Liquibase, but for this guide the built-in Spring Boot schema
initialization is sufficient.
@y
Because the application doesn't use an in-memory database, you need to create
the MySQL tables. The recommended approach for production is a migration tool
like Flyway or Liquibase, but for this guide the built-in Spring Boot schema
initialization is sufficient.
@z

@x
Create `src/main/resources/schema.sql`:
@y
Create `src/main/resources/schema.sql`:
@z

@x
```sql
create table products (
      id int NOT NULL AUTO_INCREMENT,
      code varchar(255) not null,
      name varchar(255) not null,
      price numeric(5,2) not null,
      PRIMARY KEY (id),
      UNIQUE (code)
);
```
@y
```sql
create table products (
      id int NOT NULL AUTO_INCREMENT,
      code varchar(255) not null,
      name varchar(255) not null,
      price numeric(5,2) not null,
      PRIMARY KEY (id),
      UNIQUE (code)
);
```
@z

@x
Enable schema initialization in `src/main/resources/application.properties`:
@y
Enable schema initialization in `src/main/resources/application.properties`:
@z

@x
```properties
spring.sql.init.mode=always
```
@y
```properties
spring.sql.init.mode=always
```
@z

@x
## Create the event payload
@y
## Create the event payload
@z

@x
Create a record named `ProductPriceChangedEvent` that represents the structure
of the event payload received from the Kafka topic:
@y
Create a record named `ProductPriceChangedEvent` that represents the structure
of the event payload received from the Kafka topic:
@z

@x
```java
package com.testcontainers.demo;
@y
```java
package com.testcontainers.demo;
@z

@x
import java.math.BigDecimal;
@y
import java.math.BigDecimal;
@z

@x
record ProductPriceChangedEvent(String productCode, BigDecimal price) {}
```
@y
record ProductPriceChangedEvent(String productCode, BigDecimal price) {}
```
@z

@x
The sender and receiver agree on the following JSON format:
@y
The sender and receiver agree on the following JSON format:
@z

@x
```json
{
  "productCode": "P100",
  "price": 25.0
}
```
@y
```json
{
  "productCode": "P100",
  "price": 25.0
}
```
@z

@x
## Implement the Kafka listener
@y
## Implement the Kafka listener
@z

@x
Create `ProductPriceChangedEventHandler.java`, which handles messages from the
`product-price-changes` topic and updates the product price in the database:
@y
Create `ProductPriceChangedEventHandler.java`, which handles messages from the
`product-price-changes` topic and updates the product price in the database:
@z

@x
```java
package com.testcontainers.demo;
@y
```java
package com.testcontainers.demo;
@z

@x
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
@y
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
@z

@x
@Component
@Transactional
class ProductPriceChangedEventHandler {
@y
@Component
@Transactional
class ProductPriceChangedEventHandler {
@z

@x
  private static final Logger log = LoggerFactory.getLogger(
    ProductPriceChangedEventHandler.class
  );
@y
  private static final Logger log = LoggerFactory.getLogger(
    ProductPriceChangedEventHandler.class
  );
@z

@x
  private final ProductRepository productRepository;
@y
  private final ProductRepository productRepository;
@z

@x
  ProductPriceChangedEventHandler(ProductRepository productRepository) {
    this.productRepository = productRepository;
  }
@y
  ProductPriceChangedEventHandler(ProductRepository productRepository) {
    this.productRepository = productRepository;
  }
@z

@x
  @KafkaListener(topics = "product-price-changes", groupId = "demo")
  public void handle(ProductPriceChangedEvent event) {
    log.info(
      "Received a ProductPriceChangedEvent with productCode:{}: ",
      event.productCode()
    );
    productRepository.updateProductPrice(event.productCode(), event.price());
  }
}
```
@y
  @KafkaListener(topics = "product-price-changes", groupId = "demo")
  public void handle(ProductPriceChangedEvent event) {
    log.info(
      "Received a ProductPriceChangedEvent with productCode:{}: ",
      event.productCode()
    );
    productRepository.updateProductPrice(event.productCode(), event.price());
  }
}
```
@z

@x
The `@KafkaListener` annotation specifies the topic name to listen to. Spring
Kafka handles serialization and deserialization based on the properties
configured in `application.properties`.
@y
The `@KafkaListener` annotation specifies the topic name to listen to. Spring
Kafka handles serialization and deserialization based on the properties
configured in `application.properties`.
@z

@x
## Configure Kafka serialization
@y
## Configure Kafka serialization
@z

@x
Add the following Kafka properties to
`src/main/resources/application.properties`:
@y
Add the following Kafka properties to
`src/main/resources/application.properties`:
@z

@x
```properties
######## Kafka Configuration  #########
spring.kafka.bootstrap-servers=localhost:9092
spring.kafka.producer.key-serializer=org.apache.kafka.common.serialization.StringSerializer
spring.kafka.producer.value-serializer=org.springframework.kafka.support.serializer.JsonSerializer
@y
```properties
######## Kafka Configuration  #########
spring.kafka.bootstrap-servers=localhost:9092
spring.kafka.producer.key-serializer=org.apache.kafka.common.serialization.StringSerializer
spring.kafka.producer.value-serializer=org.springframework.kafka.support.serializer.JsonSerializer
@z

@x
spring.kafka.consumer.group-id=demo
spring.kafka.consumer.auto-offset-reset=latest
spring.kafka.consumer.key-deserializer=org.apache.kafka.common.serialization.StringDeserializer
spring.kafka.consumer.value-deserializer=org.springframework.kafka.support.serializer.JsonDeserializer
spring.kafka.consumer.properties.spring.json.trusted.packages=com.testcontainers.demo
```
@y
spring.kafka.consumer.group-id=demo
spring.kafka.consumer.auto-offset-reset=latest
spring.kafka.consumer.key-deserializer=org.apache.kafka.common.serialization.StringDeserializer
spring.kafka.consumer.value-deserializer=org.springframework.kafka.support.serializer.JsonDeserializer
spring.kafka.consumer.properties.spring.json.trusted.packages=com.testcontainers.demo
```
@z

@x
The `productCode` key is (de)serialized using `StringSerializer`/`StringDeserializer`,
and the `ProductPriceChangedEvent` value is (de)serialized using
`JsonSerializer`/`JsonDeserializer`.
@y
The `productCode` key is (de)serialized using `StringSerializer`/`StringDeserializer`,
and the `ProductPriceChangedEvent` value is (de)serialized using
`JsonSerializer`/`JsonDeserializer`.
@z
