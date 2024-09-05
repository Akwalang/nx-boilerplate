# Build the application from source
FROM golang:1.22.2 AS build-stage

ARG PACKAGE_NAME

WORKDIR /app

COPY ./packages/${PACKAGE_NAME}/go.mod ./
COPY ./packages/${PACKAGE_NAME}/go.sum ./

RUN go mod download

COPY ./packages/${PACKAGE_NAME}/cmd ./cmd
COPY ./packages/${PACKAGE_NAME}/pkg ./pkg

RUN CGO_ENABLED=0 GOOS=linux go build -o /bin/main ./cmd/main.go

FROM build-stage AS run-test-stage
RUN go test -v ./packages/${PACKAGE_NAME}/...

FROM gcr.io/distroless/base-debian11 AS build-release-stage

WORKDIR /

COPY --from=build-stage /bin/main /bin/main

EXPOSE 8080

USER nonroot:nonroot

ENTRYPOINT ["/bin/main"]
