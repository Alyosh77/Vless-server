FROM alpine:latest
RUN apk update && apk add --no-cache curl wget unzip
WORKDIR /app
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh
CMD ["/app/entrypoint.sh"]
