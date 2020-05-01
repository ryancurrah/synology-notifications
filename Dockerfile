# ---- Build container
FROM golang:alpine AS builder
WORKDIR /synology-notifications
COPY . .
RUN apk add --no-cache git
RUN go build -v ./...

# ---- App container
FROM alpine:latest as synology-notifications
EXPOSE 8080
ENV API_KEY=
ENV SLACK_WEBHOOK=
ENV SLACK_ATTACHMENT_COLOR=
ENV LISTEN_PORT=8080
RUN apk --no-cache add ca-certificates
COPY --from=builder synology-notifications/synology-notifications /
ENTRYPOINT ./synology-notifications
LABEL Name=synology-notifications Version=0.0.1
