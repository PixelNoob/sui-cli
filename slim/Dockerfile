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

FROM alpine:latest

COPY --from=build /usr/local/bin/sui-tool /usr/local/bin/sui-tool
COPY --from=build /usr/local/bin/sui /usr/local/bin/sui

RUN apk add --no-cache libssl1.1

COPY sui.sh /usr/local/bin/sui
RUN chmod +x /usr/local/bin/sui

CMD ["/bin/sh"]
