# Build Geth in a stock Go builder container
FROM golang:1.10-alpine as builder

ARG TAG=v1.8.6

RUN apk add --no-cache git make gcc musl-dev linux-headers

RUN git clone --depth 1 --branch $TAG https://github.com/ethereum/go-ethereum.git /go-ethereum

RUN cd /go-ethereum && make all

# Pull all binaries into a second stage deploy alpine container
FROM alpine:latest

RUN apk add --no-cache ca-certificates
COPY --from=builder /go-ethereum/build/bin/* /usr/local/bin/

EXPOSE 8545 8546 30303 30303/udp