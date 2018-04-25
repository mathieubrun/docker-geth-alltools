# geth-alltools

Official Ethereum [geth Docker image](https://hub.docker.com/r/ethereum/client-go/) does not contain tools like puppeth. This is an adaptation of [Dockerfile.alltools](https://github.com/ethereum/go-ethereum/blob/v1.8.6/Dockerfile.alltools)

## Usage

```` sh
docker run --rm -ti -p "8545:8545" mathieubrun/geth-alltools:latest
````