# Stage 1 - Build the SUI binary
FROM ubuntu:20.04 AS build

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y rustc cargo git cmake libssl-dev libclang-dev curl build-essential

WORKDIR /sui

RUN git clone https://github.com/MystenLabs/sui && cd sui && \
     cargo build --bin sui && \
     cargo build --bin sui-tool && \
     cp -r target/debug/sui /usr/local/bin/sui && cp -r target/debug/sui-tool /usr/local/bin/sui-tool

# Stage 2 - Copy the SUI binary to a smaller image

FROM ubuntu:20.04
WORKDIR /sui

COPY --from=build /usr/local/bin/sui-tool .
COPY --from=build /usr/local/bin/sui .

COPY sui.sh /usr/local/bin/sui
RUN chmod +x /usr/local/bin/sui

RUN apt-get install -y ca-certificates ## nedeed for sui client to interact with RPCs

CMD ["/bin/sh"]
