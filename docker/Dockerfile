# Stage 1 — build
FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY app/ .
RUN go mod init nodehealth && go build -o nodehealth main.go

# Stage 2 — minimal runtime image
FROM alpine:3.19
RUN adduser -D -u 1000 nodeuser
WORKDIR /app
COPY --from=builder /app/nodehealth .
USER nodeuser
EXPOSE 8080
HEALTHCHECK --interval=10s --timeout=3s CMD wget -qO- http://localhost:8080/health || exit 1
ENTRYPOINT ["./nodehealth"]
