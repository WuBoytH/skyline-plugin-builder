FROM rust:latest as base

COPY scripts scripts
RUN ./scripts/setup.sh

FROM base as test
RUN git clone https://github.com/WuBoytH/skyline-rs-template/ --single-branch --branch smash_smashline && cd skyline-rs-template && cargo skyline build --release

FROM base as builder
RUN rm scripts -rf
ENTRYPOINT [ "/bin/bash" ]