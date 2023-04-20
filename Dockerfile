FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y rustc cargo git cmake libssl-dev libclang-dev curl build-essential

RUN git clone https://github.com/MystenLabs/sui && cd sui

WORKDIR /sui


RUN git clone https://github.com/MystenLabs/sui && \
    cargo build --bin sui && \
    cargo build --bin sui-tool && \
    echo "alias sui-cli='$(pwd)/target/debug/sui'" >> ~/.bashrc && \
    echo "alias sui-tool='$(pwd)/target/debug/sui-tool'" >> ~/.bashrc

COPY sui.sh /usr/local/bin/sui
RUN chmod +x /usr/local/bin/sui

CMD ["/bin/bash"]
