# ollama
Run ollama server in container


## Nvidia
- `docker run -d -v ollama:/root/.ollama -p 11434:11434 --gpus all --name ollama ollama/ollama`

## AMD
- `docker run -d --device /dev/kfd --device /dev/dri -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama:rocm`


## Download model
1. `docker exec -it ollama /bin/bash`
2. `ollama pull <model>`
    - list of models can be found [here](https://ollama.com/search)
    - e.g. `ollama pull deepseek-r1:8b-llama-distill-q8_0`














