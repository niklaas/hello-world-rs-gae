FROM scratch

COPY target/x86_64-unknown-linux-musl/release/hello-world-rs-gae .

ENTRYPOINT ["./hello-world-rs-gae"]
