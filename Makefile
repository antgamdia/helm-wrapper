BINARY_NAME=helm-wrapper
LDFLAGS="-s -w"

.PHONY: default

default: build-docker;

build:
	go build -ldflags ${LDFLAGS} -o ${BINARY_NAME}

build-docker:
	docker build -t antgamdia/helm-wrapper:1be6d76 . 
	docker push antgamdia/helm-wrapper:1be6d76

.build-alpine:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
	go build -installsuffix cgo -ldflags ${LDFLAGS} -o ${BINARY_NAME} .
