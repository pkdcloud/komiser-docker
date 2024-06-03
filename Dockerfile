# Builder stage
FROM alpine:latest AS builder

RUN apk add --no-cache wget
ADD https://cli.komiser.io/latest/komiser_Linux_x86_64 /komiser
RUN chmod +x /komiser

# Final stage
FROM scratch

COPY --from=builder /komiser /komiser
COPY config.toml /config.toml

ENTRYPOINT ["/komiser", "start", "--config", "/config.toml", "--regions", "ap-southeast-2"]
