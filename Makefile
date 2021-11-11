

BINARY=go-bindata-assetfs
VERSION=1.0.1
DATE?=$(shell date -u '+%Y-%m-%d_%H:%M:%S')
#LDFLAGS=CGO_ENABLED=0 -X main.Version=${VERSION} -X main.BuildDate=${DATE}
LDFLAGS=-X main.Version=${VERSION} -X main.BuildDate=${DATE}

SRC=$(shell find . -name '*.go')
MAIN=$(shell find . -name 'main.go')

default: build

all: clean build_all install

go-bindata:
	go get -u github.com/go-bindata/go-bindata/...

build:
	go build -ldflags "${LDFLAGS}" -o ./bin/${BINARY} ${MAIN}
#	go build -ldflags "${LDFLAGS}" -o ${BINARY} github.com/elazarl/go-bindata-assetfs/go-bindata-assetfs/main.go

.PHONY: check clean install build_all all
