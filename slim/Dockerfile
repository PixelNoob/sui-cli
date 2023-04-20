FROM rust:1.65.0 AS chef
WORKDIR /sui
RUN apt-get update && apt-get install -y git cmake clang
RUN git clone https://github.com/MystenLabs/sui && cd sui && git checkout $COMMIT
RUN cd sui && cargo build --release --bin sui --bin sui-tool 

FROM debian:bullseye-slim AS runtime
WORKDIR sui
COPY --from=chef /sui/sui/target/release/sui /usr/local/bin
COPY --from=chef /sui/sui/target/release/sui-tool /usr/local/bin

CMD ["/bin/bash"]
