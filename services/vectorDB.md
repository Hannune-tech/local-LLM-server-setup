# Vector DB setting
VectorDB play important role in LLM applications. In this file I will demostrate how to setup vector db in docker container

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

## ChromaDB
### Setup
```
docker pull chromadb/chroma:latest

docker run -d --name chromadb -p 8000:8000 \
-v $(pwd)/chroma_data:/chroma/chroma \
-e ANONYMIZED_TELEMETRY=False \
chromadb/chroma:latest
```