FROM alpine:latest
EXPOSE 8080
ENV API_KEY=
ENV SLACK_WEBHOOK=
ENV SLACK_ATTACHMENT_COLOR=
ENV LISTEN_PORT=8080
RUN apk --no-cache add ca-certificates
COPY synology-notifications /
ENTRYPOINT ./synology-notifications
