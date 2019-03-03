use actix_web::{server, App, HttpRequest};

fn index(_req: &HttpRequest) -> &'static str {
    "Hello world from GAE!"
}

fn main() {
    server::new(|| App::new().resource("/", |r| r.f(index)))
        .bind("0.0.0.0:8080")
        .unwrap()
        .run();
}
