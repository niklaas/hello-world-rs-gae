FROM rust:1.33

WORKDIR /usr/src/hello-world-rs-gae
COPY . .

RUN cargo install --path .

CMD ["hello-world-rs-gae"]
