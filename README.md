# Introduction

This is a sample project that shows how to use [Google App Engine][gae] for
deploying a an [actix-web][aw] server written in [Rust][rust] to serve a simple
"Hello World!" page.

[rust-musl-builder][rmb] makes it possible to create small statically-linked
[Rust][rust] binaries. [Google App Engine][gae] makes deploying projects
written in any language so easy. This setup combines both tools to provide a
startpoint for building an effortless, lightweight, performant and
automatically scaling REST-Endpoint.

# Structure

- `Dockerfile` is used by Google App Engine as runtime for the project. It is
  very minimal and only includes the statically-linked binary.
- `build.sh` is uses [rust-musl-builder][rmb] to build the statically linked
  binary i.e., the server.

# Instructions

1. Build the project with `$ sh build.sh`. This requires [Docker][docker].
2. Deploy the server with `$ gcloud app deploy`.

[aw]: https://actix.rs
[docker]: https://www.docker.com
[rmb]: https://github.com/emk/rust-musl-builder
[rust]: https://www.rust-lang.org
