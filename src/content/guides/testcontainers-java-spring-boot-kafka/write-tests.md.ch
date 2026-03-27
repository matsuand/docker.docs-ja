%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Write tests with Testcontainers
linkTitle: Write tests
description: Test the Spring Boot Kafka listener using Testcontainers Kafka and MySQL modules with Awaitility.
@y
title: Write tests with Testcontainers
linkTitle: Write tests
description: Test the Spring Boot Kafka listener using Testcontainers Kafka and MySQL modules with Awaitility.
@z

@x
To test the Kafka listener, you need a running Kafka broker and a MySQL
database, plus a started Spring context. Testcontainers spins up both services
in Docker containers and `@DynamicPropertySource` connects them to Spring.
@y
To test the Kafka listener, you need a running Kafka broker and a MySQL
database, plus a started Spring context. Testcontainers spins up both services
in Docker containers and `@DynamicPropertySource` connects them to Spring.
@z

@x
## Write the test
@y
## Write the test
@z

@x
Create `ProductPriceChangedEventHandlerTest.java`:
@y
Create `ProductPriceChangedEventHandlerTest.java`:
@z

@x
```java
package com.testcontainers.demo;
@y
```java
package com.testcontainers.demo;
@z

@x
import static java.util.concurrent.TimeUnit.SECONDS;
import static org.assertj.core.api.Assertions.assertThat;
import static org.awaitility.Awaitility.await;
@y
import static java.util.concurrent.TimeUnit.SECONDS;
import static org.assertj.core.api.Assertions.assertThat;
import static org.awaitility.Awaitility.await;
@z

@x
import java.math.BigDecimal;
import java.time.Duration;
import java.util.Optional;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
import org.springframework.test.context.TestPropertySource;
import org.testcontainers.kafka.ConfluentKafkaContainer;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;
@y
import java.math.BigDecimal;
import java.time.Duration;
import java.util.Optional;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
import org.springframework.test.context.TestPropertySource;
import org.testcontainers.kafka.ConfluentKafkaContainer;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;
@z

@x
@SpringBootTest
@TestPropertySource(
  properties = {
    "spring.kafka.consumer.auto-offset-reset=earliest",
    "spring.datasource.url=jdbc:tc:mysql:8.0.32:///db",
  }
)
@Testcontainers
class ProductPriceChangedEventHandlerTest {
@y
@SpringBootTest
@TestPropertySource(
  properties = {
    "spring.kafka.consumer.auto-offset-reset=earliest",
    "spring.datasource.url=jdbc:tc:mysql:8.0.32:///db",
  }
)
@Testcontainers
class ProductPriceChangedEventHandlerTest {
@z

@x
  @Container
  static final ConfluentKafkaContainer kafka =
    new ConfluentKafkaContainer("confluentinc/cp-kafka:7.8.0");
@y
  @Container
  static final ConfluentKafkaContainer kafka =
    new ConfluentKafkaContainer("confluentinc/cp-kafka:7.8.0");
@z

@x
  @DynamicPropertySource
  static void overrideProperties(DynamicPropertyRegistry registry) {
    registry.add("spring.kafka.bootstrap-servers", kafka::getBootstrapServers);
  }
@y
  @DynamicPropertySource
  static void overrideProperties(DynamicPropertyRegistry registry) {
    registry.add("spring.kafka.bootstrap-servers", kafka::getBootstrapServers);
  }
@z

@x
  @Autowired
  private KafkaTemplate<String, Object> kafkaTemplate;
@y
  @Autowired
  private KafkaTemplate<String, Object> kafkaTemplate;
@z

@x
  @Autowired
  private ProductRepository productRepository;
@y
  @Autowired
  private ProductRepository productRepository;
@z

@x
  @BeforeEach
  void setUp() {
    Product product = new Product(null, "P100", "Product One", BigDecimal.TEN);
    productRepository.save(product);
  }
@y
  @BeforeEach
  void setUp() {
    Product product = new Product(null, "P100", "Product One", BigDecimal.TEN);
    productRepository.save(product);
  }
@z

@x
  @Test
  void shouldHandleProductPriceChangedEvent() {
    ProductPriceChangedEvent event = new ProductPriceChangedEvent(
      "P100",
      new BigDecimal("14.50")
    );
@y
  @Test
  void shouldHandleProductPriceChangedEvent() {
    ProductPriceChangedEvent event = new ProductPriceChangedEvent(
      "P100",
      new BigDecimal("14.50")
    );
@z

@x
    kafkaTemplate.send("product-price-changes", event.productCode(), event);
@y
    kafkaTemplate.send("product-price-changes", event.productCode(), event);
@z

@x
    await()
      .pollInterval(Duration.ofSeconds(3))
      .atMost(10, SECONDS)
      .untilAsserted(() -> {
        Optional<Product> optionalProduct = productRepository.findByCode(
          "P100"
        );
        assertThat(optionalProduct).isPresent();
        assertThat(optionalProduct.get().getCode()).isEqualTo("P100");
        assertThat(optionalProduct.get().getPrice())
          .isEqualTo(new BigDecimal("14.50"));
      });
  }
}
```
@y
    await()
      .pollInterval(Duration.ofSeconds(3))
      .atMost(10, SECONDS)
      .untilAsserted(() -> {
        Optional<Product> optionalProduct = productRepository.findByCode(
          "P100"
        );
        assertThat(optionalProduct).isPresent();
        assertThat(optionalProduct.get().getCode()).isEqualTo("P100");
        assertThat(optionalProduct.get().getPrice())
          .isEqualTo(new BigDecimal("14.50"));
      });
  }
}
```
@z

@x
Here's what the test does:
@y
Here's what the test does:
@z

@x
- `@SpringBootTest` starts the full Spring application context.
- The Testcontainers special JDBC URL (`jdbc:tc:mysql:8.0.32:///db`) in
  `@TestPropertySource` spins up a MySQL container and configures it as the
  datasource automatically.
- `@Testcontainers` and `@Container` manage the lifecycle of the Kafka
  container. `@DynamicPropertySource` registers the Kafka bootstrap servers
  with Spring so that the producer and consumer connect to the test container.
- `@BeforeEach` creates a `Product` record in the database before each test.
- The test sends a `ProductPriceChangedEvent` to the `product-price-changes`
  topic using `KafkaTemplate`. Spring Boot converts the object to JSON using
  `JsonSerializer`.
- Because Kafka message processing is asynchronous, the test uses
  [Awaitility](http://www.awaitility.org/) to poll every 3 seconds (up to a
  maximum of 10 seconds) until the product price in the database matches the
  expected value.
- The property `spring.kafka.consumer.auto-offset-reset` is set to `earliest`
  so that the listener consumes messages even if they're sent to the topic
  before the listener is ready. This setting is helpful when running tests.
@y
- `@SpringBootTest` starts the full Spring application context.
- The Testcontainers special JDBC URL (`jdbc:tc:mysql:8.0.32:///db`) in
  `@TestPropertySource` spins up a MySQL container and configures it as the
  datasource automatically.
- `@Testcontainers` and `@Container` manage the lifecycle of the Kafka
  container. `@DynamicPropertySource` registers the Kafka bootstrap servers
  with Spring so that the producer and consumer connect to the test container.
- `@BeforeEach` creates a `Product` record in the database before each test.
- The test sends a `ProductPriceChangedEvent` to the `product-price-changes`
  topic using `KafkaTemplate`. Spring Boot converts the object to JSON using
  `JsonSerializer`.
- Because Kafka message processing is asynchronous, the test uses
  [Awaitility](http://www.awaitility.org/) to poll every 3 seconds (up to a
  maximum of 10 seconds) until the product price in the database matches the
  expected value.
- The property `spring.kafka.consumer.auto-offset-reset` is set to `earliest`
  so that the listener consumes messages even if they're sent to the topic
  before the listener is ready. This setting is helpful when running tests.
@z
