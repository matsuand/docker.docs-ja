%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Create the Micronaut project
linkTitle: Create the project
description: Set up a Micronaut project with Kafka, Micronaut Data JPA, and MySQL.
@y
title: Create the Micronaut project
linkTitle: Create the project
description: Set up a Micronaut project with Kafka, Micronaut Data JPA, and MySQL.
@z

@x
## Set up the project
@y
## Set up the project
@z

@x
Create a Micronaut project from [Micronaut Launch](https://micronaut.io/launch) by
selecting the **kafka**, **data-jpa**, **mysql**, **awaitility**, **assertj**, and
**testcontainers** features.
@y
Create a Micronaut project from [Micronaut Launch](https://micronaut.io/launch) by
selecting the **kafka**, **data-jpa**, **mysql**, **awaitility**, **assertj**, and
**testcontainers** features.
@z

@x
Alternatively, clone the
[guide repository](https://github.com/testcontainers/tc-guide-testing-micronaut-kafka-listener).
@y
Alternatively, clone the
[guide repository](https://github.com/testcontainers/tc-guide-testing-micronaut-kafka-listener).
@z

@x
You'll use the [Awaitility](http://www.awaitility.org/) library to assert the
expectations of an asynchronous process flow.
@y
You'll use the [Awaitility](http://www.awaitility.org/) library to assert the
expectations of an asynchronous process flow.
@z

@x
The key dependencies in `pom.xml` are:
@y
The key dependencies in `pom.xml` are:
@z

@x
```xml
<parent>
    <groupId>io.micronaut.platform</groupId>
    <artifactId>micronaut-parent</artifactId>
    <version>4.1.4</version>
</parent>
<dependencies>
    <dependency>
        <groupId>io.micronaut.data</groupId>
        <artifactId>micronaut-data-hibernate-jpa</artifactId>
        <scope>compile</scope>
    </dependency>
    <dependency>
        <groupId>io.micronaut.kafka</groupId>
        <artifactId>micronaut-kafka</artifactId>
        <scope>compile</scope>
    </dependency>
    <dependency>
        <groupId>io.micronaut.serde</groupId>
        <artifactId>micronaut-serde-jackson</artifactId>
        <scope>compile</scope>
    </dependency>
    <dependency>
        <groupId>io.micronaut.sql</groupId>
        <artifactId>micronaut-jdbc-hikari</artifactId>
        <scope>compile</scope>
    </dependency>
    <dependency>
        <groupId>mysql</groupId>
        <artifactId>mysql-connector-java</artifactId>
        <scope>runtime</scope>
    </dependency>
    <dependency>
        <groupId>org.awaitility</groupId>
        <artifactId>awaitility</artifactId>
        <version>4.2.0</version>
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
</dependencies>
```
@y
```xml
<parent>
    <groupId>io.micronaut.platform</groupId>
    <artifactId>micronaut-parent</artifactId>
    <version>4.1.4</version>
</parent>
<dependencies>
    <dependency>
        <groupId>io.micronaut.data</groupId>
        <artifactId>micronaut-data-hibernate-jpa</artifactId>
        <scope>compile</scope>
    </dependency>
    <dependency>
        <groupId>io.micronaut.kafka</groupId>
        <artifactId>micronaut-kafka</artifactId>
        <scope>compile</scope>
    </dependency>
    <dependency>
        <groupId>io.micronaut.serde</groupId>
        <artifactId>micronaut-serde-jackson</artifactId>
        <scope>compile</scope>
    </dependency>
    <dependency>
        <groupId>io.micronaut.sql</groupId>
        <artifactId>micronaut-jdbc-hikari</artifactId>
        <scope>compile</scope>
    </dependency>
    <dependency>
        <groupId>mysql</groupId>
        <artifactId>mysql-connector-java</artifactId>
        <scope>runtime</scope>
    </dependency>
    <dependency>
        <groupId>org.awaitility</groupId>
        <artifactId>awaitility</artifactId>
        <version>4.2.0</version>
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
</dependencies>
```
@z

@x
The Micronaut parent POM manages the Testcontainers BOM, so you don't need to
specify versions for Testcontainers modules individually.
@y
The Micronaut parent POM manages the Testcontainers BOM, so you don't need to
specify versions for Testcontainers modules individually.
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
public class Product {
@y
@Entity
@Table(name = "products")
public class Product {
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
## Create the Micronaut Data JPA repository
@y
## Create the Micronaut Data JPA repository
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
import io.micronaut.data.annotation.Query;
import io.micronaut.data.annotation.Repository;
import io.micronaut.data.jpa.repository.JpaRepository;
import java.math.BigDecimal;
import java.util.Optional;
@y
import io.micronaut.data.annotation.Query;
import io.micronaut.data.annotation.Repository;
import io.micronaut.data.jpa.repository.JpaRepository;
import java.math.BigDecimal;
import java.util.Optional;
@z

@x
@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
@y
@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
@z

@x
    Optional<Product> findByCode(String code);
@y
    Optional<Product> findByCode(String code);
@z

@x
    @Query("update Product p set p.price = :price where p.code = :productCode")
    void updateProductPrice(String productCode, BigDecimal price);
}
```
@y
    @Query("update Product p set p.price = :price where p.code = :productCode")
    void updateProductPrice(String productCode, BigDecimal price);
}
```
@z

@x
Unlike Spring Data JPA, Micronaut Data uses compile-time annotation processing
to implement repository methods, avoiding runtime reflection.
@y
Unlike Spring Data JPA, Micronaut Data uses compile-time annotation processing
to implement repository methods, avoiding runtime reflection.
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
import io.micronaut.serde.annotation.Serdeable;
import java.math.BigDecimal;
@y
import io.micronaut.serde.annotation.Serdeable;
import java.math.BigDecimal;
@z

@x
@Serdeable
public record ProductPriceChangedEvent(String productCode, BigDecimal price) {}
```
@y
@Serdeable
public record ProductPriceChangedEvent(String productCode, BigDecimal price) {}
```
@z

@x
The `@Serdeable` annotation tells Micronaut Serialization that this type can be
serialized and deserialized.
@y
The `@Serdeable` annotation tells Micronaut Serialization that this type can be
serialized and deserialized.
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
import static io.micronaut.configuration.kafka.annotation.OffsetReset.EARLIEST;
@y
import static io.micronaut.configuration.kafka.annotation.OffsetReset.EARLIEST;
@z

@x
import io.micronaut.configuration.kafka.annotation.KafkaListener;
import io.micronaut.configuration.kafka.annotation.Topic;
import jakarta.inject.Singleton;
import jakarta.transaction.Transactional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
@y
import io.micronaut.configuration.kafka.annotation.KafkaListener;
import io.micronaut.configuration.kafka.annotation.Topic;
import jakarta.inject.Singleton;
import jakarta.transaction.Transactional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
@z

@x
@Singleton
@Transactional
class ProductPriceChangedEventHandler {
@y
@Singleton
@Transactional
class ProductPriceChangedEventHandler {
@z

@x
    private static final Logger LOG = LoggerFactory.getLogger(ProductPriceChangedEventHandler.class);
@y
    private static final Logger LOG = LoggerFactory.getLogger(ProductPriceChangedEventHandler.class);
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
    @Topic("product-price-changes")
    @KafkaListener(offsetReset = EARLIEST, groupId = "demo")
    public void handle(ProductPriceChangedEvent event) {
        LOG.info("Received a ProductPriceChangedEvent with productCode:{}: ", event.productCode());
        productRepository.updateProductPrice(event.productCode(), event.price());
    }
}
```
@y
    @Topic("product-price-changes")
    @KafkaListener(offsetReset = EARLIEST, groupId = "demo")
    public void handle(ProductPriceChangedEvent event) {
        LOG.info("Received a ProductPriceChangedEvent with productCode:{}: ", event.productCode());
        productRepository.updateProductPrice(event.productCode(), event.price());
    }
}
```
@z

@x
Key details:
@y
Key details:
@z

@x
- The `@KafkaListener` annotation marks this class as a Kafka message listener.
  Setting `offsetReset` to `EARLIEST` makes the listener start consuming
  messages from the beginning of the partition, which is useful during testing.
- The `@Topic` annotation specifies which topic to subscribe to.
- Micronaut handles JSON deserialization of the `ProductPriceChangedEvent`
  automatically using Micronaut Serialization.
@y
- The `@KafkaListener` annotation marks this class as a Kafka message listener.
  Setting `offsetReset` to `EARLIEST` makes the listener start consuming
  messages from the beginning of the partition, which is useful during testing.
- The `@Topic` annotation specifies which topic to subscribe to.
- Micronaut handles JSON deserialization of the `ProductPriceChangedEvent`
  automatically using Micronaut Serialization.
@z

@x
## Configure the datasource
@y
## Configure the datasource
@z

@x
Add the following properties to `src/main/resources/application.properties`:
@y
Add the following properties to `src/main/resources/application.properties`:
@z

@x
```properties
micronaut.application.name=tc-guide-testing-micronaut-kafka-listener
datasources.default.db-type=mysql
datasources.default.dialect=MYSQL
jpa.default.properties.hibernate.hbm2ddl.auto=update
jpa.default.entity-scan.packages=com.testcontainers.demo
datasources.default.driver-class-name=com.mysql.cj.jdbc.Driver
```
@y
```properties
micronaut.application.name=tc-guide-testing-micronaut-kafka-listener
datasources.default.db-type=mysql
datasources.default.dialect=MYSQL
jpa.default.properties.hibernate.hbm2ddl.auto=update
jpa.default.entity-scan.packages=com.testcontainers.demo
datasources.default.driver-class-name=com.mysql.cj.jdbc.Driver
```
@z

@x
Hibernate's `hbm2ddl.auto=update` creates and updates the database schema
automatically. For testing, you'll override this to `create-drop` in the test
properties file.
@y
Hibernate's `hbm2ddl.auto=update` creates and updates the database schema
automatically. For testing, you'll override this to `create-drop` in the test
properties file.
@z

@x
Create `src/test/resources/application-test.properties`:
@y
Create `src/test/resources/application-test.properties`:
@z

@x
```properties
jpa.default.properties.hibernate.hbm2ddl.auto=create-drop
```
@y
```properties
jpa.default.properties.hibernate.hbm2ddl.auto=create-drop
```
@z
