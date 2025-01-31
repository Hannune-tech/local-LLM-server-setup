# Setting Fan Speed for AMD Radeon Pro W6800 GPU
My graphic card is AMD Radeon Pro W6800, the fan didn't work even the temperature was high. So I ran additional software in container to adjust fan speed.

## Dockerfile
```
FROM ubuntu:22.04
RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip3 install amdgpu-fan
CMD ["amdgpu-fan"]
```

## Adjusting fan speed
1. Exec to your amdgpu-fan conainer
    - `docker exec -it <container_name> /bin/bash`
2. Modify the following file
    - `nano /etc/amdgpu-fan.yml`
    - Change the range of temperature and fan speed ratio
        ```
        speed_matrix:  # -[temp(*C), speed(0-100%)]
        - [0, 0]
        - [40, 30]
        - [60, 50]
        - [80, 100]
        ```

## Reference
- [amdgpu-fan GitHub Repository](https://github.com/chestm007/amdgpu-fan)