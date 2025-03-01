%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Leveraging RAG in GenAI to teach new information
linkTitle: Leveraging RAG in GenAI
description:  This guide walks through the process of setting up and utilizing a GenAI stack with Retrieval-Augmented Generation (RAG) systems and graph databases. Learn how to integrate graph databases like Neo4j with AI models for more accurate, contextually-aware responses.
keywords: Docker, GenAI, Retrieval-Augmented Generation, RAG, Graph Databases, Neo4j, AI, LLM
summary: |
  This guide explains setting up a GenAI stack with Retrieval-Augmented Generation (RAG) and Neo4j, covering key concepts, deployment steps, and a case study. It also includes troubleshooting tips for optimizing AI performance with real-time data.
@y
title: Leveraging RAG in GenAI to teach new information
linkTitle: Leveraging RAG in GenAI
description:  This guide walks through the process of setting up and utilizing a GenAI stack with Retrieval-Augmented Generation (RAG) systems and graph databases. Learn how to integrate graph databases like Neo4j with AI models for more accurate, contextually-aware responses.
keywords: Docker, GenAI, Retrieval-Augmented Generation, RAG, Graph Databases, Neo4j, AI, LLM
summary: |
  This guide explains setting up a GenAI stack with Retrieval-Augmented Generation (RAG) and Neo4j, covering key concepts, deployment steps, and a case study. It also includes troubleshooting tips for optimizing AI performance with real-time data.
@z

@x
  time: 35 minutes
@y
  time: 35 分
@z

@x
## Introduction
@y
## Introduction
@z

@x
Retrieval-Augmented Generation (RAG) is a powerful framework that enhances large language models (LLMs) by integrating information retrieval from external knowledge sources. This guide focuses on a specialized RAG implementation using graph databases like Neo4j, which excel in managing highly connected, relational data. Unlike traditional RAG setups with vector databases, combining RAG with graph databases offers better context-awareness and relationship-driven insights.
@y
Retrieval-Augmented Generation (RAG) is a powerful framework that enhances large language models (LLMs) by integrating information retrieval from external knowledge sources. This guide focuses on a specialized RAG implementation using graph databases like Neo4j, which excel in managing highly connected, relational data. Unlike traditional RAG setups with vector databases, combining RAG with graph databases offers better context-awareness and relationship-driven insights.
@z

@x
In this guide, you will:
@y
In this guide, you will:
@z

@x
* Explore the advantages of integrating graph databases into a RAG framework.
* Configure a GenAI stack with Docker, incorporating Neo4j and an AI model.
* Analyze a real-world case study that highlights the effectiveness of this approach for handling specialized queries.
@y
* Explore the advantages of integrating graph databases into a RAG framework.
* Configure a GenAI stack with Docker, incorporating Neo4j and an AI model.
* Analyze a real-world case study that highlights the effectiveness of this approach for handling specialized queries.
@z

@x
## Understanding RAG 
@y
## Understanding RAG 
@z

@x
RAG is a hybrid framework that enhances the capabilities of large language models by integrating information retrieval. It combines three core components:  
@y
RAG is a hybrid framework that enhances the capabilities of large language models by integrating information retrieval. It combines three core components:  
@z

@x
- **Information retrieval** from an external knowledge base  
- **Large Language Model (LLM)** for generating responses  
- **Vector embeddings** to enable semantic search  
@y
- **Information retrieval** from an external knowledge base  
- **Large Language Model (LLM)** for generating responses  
- **Vector embeddings** to enable semantic search  
@z

@x
In a RAG system, vector embeddings are used to represent the semantic meaning of text in a way that a machine can understand and process. For instance, the words "dog" and "puppy" will have similar embeddings because they share similar meanings. By integrating these embeddings into the RAG framework, the system can combine the generative power of large language models with the ability to pull in highly relevant, contextually-aware data from external sources.
@y
In a RAG system, vector embeddings are used to represent the semantic meaning of text in a way that a machine can understand and process. For instance, the words "dog" and "puppy" will have similar embeddings because they share similar meanings. By integrating these embeddings into the RAG framework, the system can combine the generative power of large language models with the ability to pull in highly relevant, contextually-aware data from external sources.
@z

@x
The system operates as follows:  
1. Questions get turned into mathematical patterns that capture their meaning  
2. These patterns help find matching information in a database
3. The found information gets added to the original question before passed to LLM 
4. The LLM generates responses that blend the model's inherent knowledge with the this extra information.  
@y
The system operates as follows:  
1. Questions get turned into mathematical patterns that capture their meaning  
2. These patterns help find matching information in a database
3. The found information gets added to the original question before passed to LLM 
4. The LLM generates responses that blend the model's inherent knowledge with the this extra information.  
@z

@x
To hold this vector information in an efficient manner, we need a special type of database.
@y
To hold this vector information in an efficient manner, we need a special type of database.
@z

@x
## Introduction to Graph databases 
@y
## Introduction to Graph databases 
@z

@x
Graph databases, such as Neo4j, are specifically designed for managing highly connected data. Unlike traditional relational databases, graph databases prioritize both the entities and the relationships between them, making them ideal for tasks where connections are as important as the data itself.
@y
Graph databases, such as Neo4j, are specifically designed for managing highly connected data. Unlike traditional relational databases, graph databases prioritize both the entities and the relationships between them, making them ideal for tasks where connections are as important as the data itself.
@z

@x
Graph databases stand out for their unique approach to data storage and querying. They use nodes (or vertices) to represent entities and edges to represent the relationships between these entities. This structure allows for efficient handling of highly connected data and complex queries, which are difficult to manage in traditional database systems.
@y
Graph databases stand out for their unique approach to data storage and querying. They use nodes (or vertices) to represent entities and edges to represent the relationships between these entities. This structure allows for efficient handling of highly connected data and complex queries, which are difficult to manage in traditional database systems.
@z

@x
SQL databases and graph databases differ significantly in their data models. SQL databases use a tabular structure with rows and columns, where relationships between entities are established using foreign keys. This approach works well for structured data and predefined relationships. In contrast, graph databases represent data as nodes (entities) and edges (relationships), making the representation of relationships more intuitive and flexible. This structure is particularly advantageous for complex, interconnected data.
@y
SQL databases and graph databases differ significantly in their data models. SQL databases use a tabular structure with rows and columns, where relationships between entities are established using foreign keys. This approach works well for structured data and predefined relationships. In contrast, graph databases represent data as nodes (entities) and edges (relationships), making the representation of relationships more intuitive and flexible. This structure is particularly advantageous for complex, interconnected data.
@z

@x
Another key difference lies in schema flexibility. SQL databases operate on a rigid schema, meaning any changes to the data structure, such as adding new columns or altering relationships, typically require careful planning and migration processes. Graph databases, however, are schema-optional, allowing for much greater flexibility. New nodes, edges, or properties can be introduced without disrupting existing data, enabling faster adaptation to changing requirements.
@y
Another key difference lies in schema flexibility. SQL databases operate on a rigid schema, meaning any changes to the data structure, such as adding new columns or altering relationships, typically require careful planning and migration processes. Graph databases, however, are schema-optional, allowing for much greater flexibility. New nodes, edges, or properties can be introduced without disrupting existing data, enabling faster adaptation to changing requirements.
@z

@x
## Practical implementation: testing RAG effectiveness
@y
## Practical implementation: testing RAG effectiveness
@z

@x
To illustrate the power of RAG systems in practice, let's examine a real-world implementation using Apache NiFi as our subject matter. This case study demonstrates how RAG can enhance an AI's ability to provide accurate, contextual information about specialized technical topics.
@y
To illustrate the power of RAG systems in practice, let's examine a real-world implementation using Apache NiFi as our subject matter. This case study demonstrates how RAG can enhance an AI's ability to provide accurate, contextual information about specialized technical topics.
@z

@x
### Teaching AI about new technologies
@y
### Teaching AI about new technologies
@z

@x
Apache NiFi serves as an excellent example of the limitations of traditional LLMs and how RAG can overcome them. As a relatively recent technology, many LLMs have limited or outdated knowledge about it, making it a perfect candidate for demonstrating RAG's capabilities.
@y
Apache NiFi serves as an excellent example of the limitations of traditional LLMs and how RAG can overcome them. As a relatively recent technology, many LLMs have limited or outdated knowledge about it, making it a perfect candidate for demonstrating RAG's capabilities.
@z

@x
Without RAG, the LLM may provide broad responses or acknowledge its limited knowledge when asked about information that is beyond its cutoff date. The following example demonstrates this.
```text
Question: What important events happened in 2024?
RAG: Disabled
I'm happy to help! Unfortunately, I'm a large language model, I don't have access to real-time information or events that occurred after my training data cutoff in 2024. Therefore, I cannot provide you with any important events that happened in 2024. My apologize for any inconvenience this may cause. Is there anything else I can help you with?
```
@y
Without RAG, the LLM may provide broad responses or acknowledge its limited knowledge when asked about information that is beyond its cutoff date. The following example demonstrates this.
```text
Question: What important events happened in 2024?
RAG: Disabled
I'm happy to help! Unfortunately, I'm a large language model, I don't have access to real-time information or events that occurred after my training data cutoff in 2024. Therefore, I cannot provide you with any important events that happened in 2024. My apologize for any inconvenience this may cause. Is there anything else I can help you with?
```
@z

@x
## Setting up GenAI stack with GPU acceleration on Linux 
@y
## Setting up GenAI stack with GPU acceleration on Linux 
@z

@x
To set up and run the GenAI stack on a Linux host, execute one of the following commands, either for GPU or CPU powered:
@y
To set up and run the GenAI stack on a Linux host, execute one of the following commands, either for GPU or CPU powered:
@z

@x
### GPU powered
@y
### GPU powered
@z

@x
```bash
git clone https://github.com/docker/genai-stack
docker compose --profile linux-gpu up -d
mv env.example .env
nano .env
```
In the `.env` file, make sure following lines are commented out. Set your own credentials for security
@y
```bash
git clone https://github.com/docker/genai-stack
docker compose --profile linux-gpu up -d
mv env.example .env
nano .env
```
In the `.env` file, make sure following lines are commented out. Set your own credentials for security
@z

@x
    NEO4J_URI=neo4j://database:7687
    NEO4J_USERNAME=neo4j
    NEO4J_PASSWORD=password
    OLLAMA_BASE_URL=http://llm-gpu:11434
@y
    NEO4J_URI=neo4j://database:7687
    NEO4J_USERNAME=neo4j
    NEO4J_PASSWORD=password
    OLLAMA_BASE_URL=http://llm-gpu:11434
@z

@x
### CPU powered
@y
### CPU powered
@z

@x
```bash
git clone https://github.com/docker/genai-stack
docker compose --profile linux up -d
mv env.example .env
nano .env
```
In the `.env` file, make sure following lines are commented out. Set your own credentials for security
@y
```bash
git clone https://github.com/docker/genai-stack
docker compose --profile linux up -d
mv env.example .env
nano .env
```
In the `.env` file, make sure following lines are commented out. Set your own credentials for security
@z

@x
    NEO4J_URI=neo4j://database:7687
    NEO4J_USERNAME=neo4j
    NEO4J_PASSWORD=password
    OLLAMA_BASE_URL=http://llm:11434
@y
    NEO4J_URI=neo4j://database:7687
    NEO4J_USERNAME=neo4j
    NEO4J_PASSWORD=password
    OLLAMA_BASE_URL=http://llm:11434
@z

@x
### Setting up on other platforms 
@y
### Setting up on other platforms 
@z

@x
For instructions on how to set up the stack on other platforms, refer to [this page](https://github.com/docker/genai-stack). 
@y
For instructions on how to set up the stack on other platforms, refer to [this page](https://github.com/docker/genai-stack). 
@z

@x
### Initial startup
@y
### Initial startup
@z

@x
The first startup may take some time because the system needs to download a large language model.
@y
The first startup may take some time because the system needs to download a large language model.
@z

@x
### Monitoring progress
@y
### Monitoring progress
@z

@x
We can monitor the download and initialization progress by viewing the logs. Run the following command to view the logs:
@y
We can monitor the download and initialization progress by viewing the logs. Run the following command to view the logs:
@z

@x
```bash
docker compose logs
```
@y
```bash
docker compose logs
```
@z

@x
Wait for specific lines in the logs indicating that the download is complete and the stack is ready. These lines typically confirm successful setup and initialization.
@y
Wait for specific lines in the logs indicating that the download is complete and the stack is ready. These lines typically confirm successful setup and initialization.
@z

@x
    pull-model-1 exited with code 0
    database-1    | 2024-12-29 09:35:53.269+0000 INFO  Started.
    pdf_bot-1     |   You can now view your Streamlit app in your browser.
    loader-1      |   You can now view your Streamlit app in your browser.
    bot-1         |   You can now view your Streamlit app in your browser.
@y
    pull-model-1 exited with code 0
    database-1    | 2024-12-29 09:35:53.269+0000 INFO  Started.
    pdf_bot-1     |   You can now view your Streamlit app in your browser.
    loader-1      |   You can now view your Streamlit app in your browser.
    bot-1         |   You can now view your Streamlit app in your browser.
@z

@x
    You can now access the interface at [http://localhost:8501/](http://localhost:8501/) to ask questions. For example, you can try the sample question:
@y
    You can now access the interface at [http://localhost:8501/](http://localhost:8501/) to ask questions. For example, you can try the sample question:
@z

@x
When we see those lines in the logs, web apps are ready to be used.
@y
When we see those lines in the logs, web apps are ready to be used.
@z

@x
Since our goal is to teach AI about things it does not yet know, we begin by asking it a simple question about Nifi at 
[http://localhost:8501/](http://localhost:8501/).
![alt text](image.png)
@y
Since our goal is to teach AI about things it does not yet know, we begin by asking it a simple question about Nifi at 
[http://localhost:8501/](http://localhost:8501/).
![alt text](image.png)
@z

@x
```text
Question: What is Apache Nifi? 
RAG: Disabled
Hello! I'm here to help you with your question about Apache NiFi. Unfortunately, I don't know the answer to that question. I'm just an AI and my knowledge cutoff is December 2022, so I may not be familiar with the latest technologies or software. Can you please provide more context or details about Apache NiFi? Maybe there's something I can help you with related to it.
```
@y
```text
Question: What is Apache Nifi? 
RAG: Disabled
Hello! I'm here to help you with your question about Apache NiFi. Unfortunately, I don't know the answer to that question. I'm just an AI and my knowledge cutoff is December 2022, so I may not be familiar with the latest technologies or software. Can you please provide more context or details about Apache NiFi? Maybe there's something I can help you with related to it.
```
@z

@x
As we can see, AI does not know anything about this subject because it did not exist during the time of its training, also known as the information cutoff point.
@y
As we can see, AI does not know anything about this subject because it did not exist during the time of its training, also known as the information cutoff point.
@z

@x
Now it's time to teach the AI some new tricks. First, connect to [http://localhost:8502/](http://localhost:8502/). Instead of using the "neo4j" tag, change it to the "apache-nifi" tag, then select the **Import** button. 
@y
Now it's time to teach the AI some new tricks. First, connect to [http://localhost:8502/](http://localhost:8502/). Instead of using the "neo4j" tag, change it to the "apache-nifi" tag, then select the **Import** button. 
@z

@x
![alt text](image-1.png)
@y
![alt text](image-1.png)
@z

@x
After the import is successful, we can access Neo4j to verify the data. 
@y
After the import is successful, we can access Neo4j to verify the data. 
@z

@x
After logging in to [http://localhost:7474/](http://localhost:7474/) using the credentials from the `.env` file, you can run queries on Neo4j. Using the Neo4j Cypher query language, you can check for the data stored in the database.
@y
After logging in to [http://localhost:7474/](http://localhost:7474/) using the credentials from the `.env` file, you can run queries on Neo4j. Using the Neo4j Cypher query language, you can check for the data stored in the database.
@z

@x
To count the data, run the following query:
@y
To count the data, run the following query:
@z

@x
```cypher
MATCH (n)
RETURN DISTINCT labels(n) AS NodeTypes, count(*) AS Count
ORDER BY Count DESC;
```
@y
```cypher
MATCH (n)
RETURN DISTINCT labels(n) AS NodeTypes, count(*) AS Count
ORDER BY Count DESC;
```
@z

@x
To execute this query, write in the box on the top and select the blue run button.
@y
To execute this query, write in the box on the top and select the blue run button.
@z

@x
![alt text](image-2.png)
@y
![alt text](image-2.png)
@z

@x
Results will appear below. What we are seeing here is the information system downloaded from Stack Overflow and saved in the graph database. RAG will utilize this information to enhance its responses.
@y
Results will appear below. What we are seeing here is the information system downloaded from Stack Overflow and saved in the graph database. RAG will utilize this information to enhance its responses.
@z

@x
You can also run the following query to visualize the data:
@y
You can also run the following query to visualize the data:
@z

@x
```cypher
CALL db.schema.visualization()
```
@y
```cypher
CALL db.schema.visualization()
```
@z

@x
To check the relationships in the database, run the following query:
@y
To check the relationships in the database, run the following query:
@z

@x
```cypher
CALL db.relationshipTypes()
```
@y
```cypher
CALL db.relationshipTypes()
```
@z

@x
Now, we are ready to enable our LLM to use this information. Go back to [http://localhost:8501/](http://localhost:8501/), enable the **RAG** checkbox, and ask the same question again. The LLM will now provide a more detailed answer.
@y
Now, we are ready to enable our LLM to use this information. Go back to [http://localhost:8501/](http://localhost:8501/), enable the **RAG** checkbox, and ask the same question again. The LLM will now provide a more detailed answer.
@z

@x
![alt text](image-3.png)
@y
![alt text](image-3.png)
@z

@x
The system delivers comprehensive, accurate information by pulling from current technical documentation.
```text
Question: What is Apache Nifi? 
RAG: Enabled
@y
The system delivers comprehensive, accurate information by pulling from current technical documentation.
```text
Question: What is Apache Nifi? 
RAG: Enabled
@z

@x
Answer:
Apache NiFi is an open-source, distributed data processing system that allows you to collect, transform, and transport data across various sources and sinks. It provides a graphical user interface for designing and managing data flows, as well as a set of APIs for integrating with other systems.
According to this Stack Overflow question, the free Neo4J JDBC driver doesn't understand SQL, only Cypher, so you would need to use a non-free BI Connector to connect to Neo4j from Apache Drill.
Additionally, this Stack Overflow question suggests that Apache POI does work in a Neo4j User Defined Function. However, there may be an unknown glitch in the standalone UDF mentioned in the initial question.
To export data from Neo4j to Excel using APOC Extended procedures, you can use apoc.export.xls.query which takes a Cypher query and exports the results to an Excel file.
@y
Answer:
Apache NiFi is an open-source, distributed data processing system that allows you to collect, transform, and transport data across various sources and sinks. It provides a graphical user interface for designing and managing data flows, as well as a set of APIs for integrating with other systems.
According to this Stack Overflow question, the free Neo4J JDBC driver doesn't understand SQL, only Cypher, so you would need to use a non-free BI Connector to connect to Neo4j from Apache Drill.
Additionally, this Stack Overflow question suggests that Apache POI does work in a Neo4j User Defined Function. However, there may be an unknown glitch in the standalone UDF mentioned in the initial question.
To export data from Neo4j to Excel using APOC Extended procedures, you can use apoc.export.xls.query which takes a Cypher query and exports the results to an Excel file.
@z

@x
References:
How to connect and query Neo4j Database on Apache Drill?
Is a Neo4j UDF compatible with Apache POI?
```
@y
References:
How to connect and query Neo4j Database on Apache Drill?
Is a Neo4j UDF compatible with Apache POI?
```
@z

@x
Keep in mind that new questions will be added to Stack Overflow, and due to the inherent randomness in most AI models, the answers may vary and won't be identical to those in this example.
@y
Keep in mind that new questions will be added to Stack Overflow, and due to the inherent randomness in most AI models, the answers may vary and won't be identical to those in this example.
@z

@x
Feel free to start over with another [Stack Overflow tag](https://stackoverflow.com/tags). To drop all data in Neo4j, you can use the following command in the Neo4j Web UI:
@y
Feel free to start over with another [Stack Overflow tag](https://stackoverflow.com/tags). To drop all data in Neo4j, you can use the following command in the Neo4j Web UI:
@z

@x
```cypher
MATCH (n)
DETACH DELETE n;
```
@y
```cypher
MATCH (n)
DETACH DELETE n;
```
@z

@x
For optimal results, choose a tag that the LLM is not familiar with.
@y
For optimal results, choose a tag that the LLM is not familiar with.
@z

@x
### When to leverage RAG for optimal results
@y
### When to leverage RAG for optimal results
@z

@x
Retrieval-Augmented Generation (RAG) is particularly effective in scenarios where standard Large Language Models (LLMs) fall short. The three key areas where RAG excels are knowledge limitations, business requirements, and cost efficiency. Below, we explore these aspects in more detail.
@y
Retrieval-Augmented Generation (RAG) is particularly effective in scenarios where standard Large Language Models (LLMs) fall short. The three key areas where RAG excels are knowledge limitations, business requirements, and cost efficiency. Below, we explore these aspects in more detail.
@z

@x
#### Overcoming knowledge limitations
@y
#### Overcoming knowledge limitations
@z

@x
LLMs are trained on a fixed dataset up until a certain point in time. This means they lack access to:
@y
LLMs are trained on a fixed dataset up until a certain point in time. This means they lack access to:
@z

@x
* Real-time information: LLMs do not continuously update their knowledge, so they may not be aware of recent events, newly released research, or emerging technologies.
* Specialized knowledge: Many niche subjects, proprietary frameworks, or industry-specific best practices may not be well-documented in the model’s training corpus.
* Accurate contextual understanding: LLMs can struggle with nuances or evolving terminologies that frequently change within dynamic fields like finance, cybersecurity, or medical research.
@y
* Real-time information: LLMs do not continuously update their knowledge, so they may not be aware of recent events, newly released research, or emerging technologies.
* Specialized knowledge: Many niche subjects, proprietary frameworks, or industry-specific best practices may not be well-documented in the model’s training corpus.
* Accurate contextual understanding: LLMs can struggle with nuances or evolving terminologies that frequently change within dynamic fields like finance, cybersecurity, or medical research.
@z

@x
By incorporating RAG with a graph database such as Neo4j, AI models can access and retrieve the latest, relevant, and highly connected data before generating a response. This ensures that answers are up-to-date and grounded in factual information rather than inferred approximations.
@y
By incorporating RAG with a graph database such as Neo4j, AI models can access and retrieve the latest, relevant, and highly connected data before generating a response. This ensures that answers are up-to-date and grounded in factual information rather than inferred approximations.
@z

@x
#### Addressing business and compliance needs
@y
#### Addressing business and compliance needs
@z

@x
Organizations in industries like healthcare, legal services, and financial analysis require their AI-driven solutions to be:
@y
Organizations in industries like healthcare, legal services, and financial analysis require their AI-driven solutions to be:
@z

@x
* Accurate: Businesses need AI-generated content that is factual and relevant to their specific domain.
* Compliant: Many industries must adhere to strict regulations regarding data usage and security.
* Traceable: Enterprises often require AI responses to be auditable, meaning they need to reference source material.
@y
* Accurate: Businesses need AI-generated content that is factual and relevant to their specific domain.
* Compliant: Many industries must adhere to strict regulations regarding data usage and security.
* Traceable: Enterprises often require AI responses to be auditable, meaning they need to reference source material.
@z

@x
By using RAG, AI-generated answers can be sourced from trusted databases, ensuring higher accuracy and compliance with industry standards. This mitigates risks such as misinformation or regulatory violations.
@y
By using RAG, AI-generated answers can be sourced from trusted databases, ensuring higher accuracy and compliance with industry standards. This mitigates risks such as misinformation or regulatory violations.
@z

@x
#### Enhancing cost efficiency and performance
@y
#### Enhancing cost efficiency and performance
@z

@x
Training and fine-tuning large AI models can be computationally expensive and time-consuming. However, integrating RAG provides:
@y
Training and fine-tuning large AI models can be computationally expensive and time-consuming. However, integrating RAG provides:
@z

@x
* Reduced fine-tuning needs: Instead of retraining an AI model every time new data emerges, RAG allows the model to fetch and incorporate updated information dynamically.
* Better performance with smaller models: With the right retrieval techniques, even compact AI models can perform well by leveraging external knowledge efficiently.
* Lower operational costs: Instead of investing in expensive infrastructure to support large-scale retraining, businesses can optimize resources by utilizing RAG’s real-time retrieval capabilities.
@y
* Reduced fine-tuning needs: Instead of retraining an AI model every time new data emerges, RAG allows the model to fetch and incorporate updated information dynamically.
* Better performance with smaller models: With the right retrieval techniques, even compact AI models can perform well by leveraging external knowledge efficiently.
* Lower operational costs: Instead of investing in expensive infrastructure to support large-scale retraining, businesses can optimize resources by utilizing RAG’s real-time retrieval capabilities.
@z

@x
By following this guide, you now have the foundational knowledge to implement RAG with Neo4j, enabling your AI system to deliver more accurate, relevant, and insightful responses. The next step is experimentation—choose a dataset, configure your stack, and start enhancing your AI with the power of retrieval-augmented generation.
@y
By following this guide, you now have the foundational knowledge to implement RAG with Neo4j, enabling your AI system to deliver more accurate, relevant, and insightful responses. The next step is experimentation—choose a dataset, configure your stack, and start enhancing your AI with the power of retrieval-augmented generation.
@z
