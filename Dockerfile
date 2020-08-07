FROM bitnami/golang as builder

WORKDIR /go/src/github.com/helm-wrapper/helm-wrapper

COPY go.mod go.sum ./
COPY cmd cmd
COPY web web
COPY api api

RUN CGO_ENABLED=0 go build -installsuffix cgo -ldflags "-s -w" ./cmd/helm-wrapper


FROM scratch

COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /go/src/github.com/helm-wrapper/helm-wrapper/helm-wrapper /helm-wrapper
COPY --from=builder /go/src/github.com/helm-wrapper/helm-wrapper/web /web
COPY --from=builder /go/src/github.com/helm-wrapper/helm-wrapper/api /api
COPY ./configs/config-example.yaml ./config.yaml

EXPOSE 8080

CMD ["/helm-wrapper"]
