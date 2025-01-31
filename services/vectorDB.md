# Setting Up Vector Databases: Elasticsearch and ChromaDB
VectorDB play important role in LLM applications. In this file I will demonstrate how to setup vector db in docker container

## Elasticsearch
### Setup
```
docker network create elastic

docker run --name es01 --net elastic -p 9200:9200 -p 9300:9300 \
-e "discovery.type=single-node" \
-e "xpack.security.enabled=true" \
-e "xpack.security.authc.api_key.enabled=true" \
docker.elastic.co/elasticsearch/elasticsearch:7.15.1
```

### Note
#### Important: Elasticsearch has undergone significant changes in its licensing model. Please consider the following:
- **Versions up to 7.x**: Available under the Elastic License, generally allowing free use for most purposes.
- **Version 8.0 and later**: Dual-licensed under the Elastic License 2.0 and the Server Side Public License (SSPL).
    - The Elastic License 2.0 imposes restrictions on certain use cases, especially for commercial purposes.
    - Commercial use may require purchasing a subscription or complying with specific licensing terms.

#### Before deployment:
- Review the current licensing terms on the Elastic website.
- Assess your use case carefully.
- For production or commercial environments, consult with your legal team to ensure compliance.

## ChromaDB
### Setup
```
docker pull chromadb/chroma:latest

docker run -d --name chromadb -p 8000:8000 \
-v $(pwd)/chroma_data:/chroma/chroma \
-e ANONYMIZED_TELEMETRY=False \
chromadb/chroma:latest
```