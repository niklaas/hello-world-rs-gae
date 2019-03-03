# Stage: development {{{1

FROM rust as development
WORKDIR /usr/src/hello-world-rs-gae

# Stage: builder {{{1

FROM ekidd/rust-musl-builder as builder

WORKDIR /home/rust

# Avoid having to install/build all dependencies by copying
# the Cargo files and making a dummy src/main.rs
COPY Cargo.toml .
COPY Cargo.lock .
RUN echo "fn main() {}" > src/main.rs
RUN cargo test
RUN cargo build --release

# We need to touch our real main.rs file or else Docker will use
# the cached one.
COPY src/ src/
RUN sudo touch src/main.rs

RUN cargo test
RUN cargo build --release

RUN strip target/x86_64-unknown-linux-musl/release/hello-world-rs-gae

# Stage: production {{{1

FROM scratch as production

WORKDIR /home/rust/
COPY --from=builder /home/rust/target/x86_64-unknown-linux-musl/release/hello-world-rs-gae .

ENTRYPOINT ["./hello-world-rs-gae"]

# vim:set fdm=marker:
