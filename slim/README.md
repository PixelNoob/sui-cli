# sui-cli
Sui is a next-generation smart contract platform powered by MOVE programming language.

## Build the image

    docker build -t sui . 

## Run commands from inside the docker container

    docker run -it --name sui-cli sui:latest

Inside the container you can run:

    sui-cli
    sui-tool

## Run commands from host with container running

    docker exec sui-cli sui sui-cli
    docker exec sui-cli sui sui-tool
    
## Set an alias in .bashrc for easy of use 

    alias sui-cli="docker exec sui-cli sui sui-cli"
    alias sui-tool="docker exec sui-cli sui sui-tool"
    
## Run compile image from dockerhub

    docker run -it --name sui-cli pixelnoob/sui:latest
