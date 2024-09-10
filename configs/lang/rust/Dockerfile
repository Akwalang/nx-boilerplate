FROM rust:latest AS builder

ARG PACKAGE_NAME

WORKDIR /app

COPY ./packages/${PACKAGE_NAME}/Cargo.toml ./
COPY ./packages/${PACKAGE_NAME}/Cargo.lock ./

RUN cargo fetch

COPY ./packages/${PACKAGE_NAME}/ .

RUN cargo build --release

FROM rust:latest

ARG PACKAGE_NAME

USER root

RUN apt-get update && apt-get install -y libssl-dev ca-certificates && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY --from=builder /app/target/release/${PACKAGE_NAME} ./application

EXPOSE 3000

CMD ["./application"]
