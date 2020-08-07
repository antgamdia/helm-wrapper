FROM alpine:3.12

ENV GIN_MODE=release

COPY config-example.yaml /config.yaml
COPY helm-wrapper /helm-wrapper

CMD [ "/helm-wrapper" ]