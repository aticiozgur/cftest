FROM golang:alpine AS builder
ADD . /go/src/github.com/aticiozgur/cftest
WORKDIR /go/src/github.com/aticiozgur/cftest
RUN CGO_ENABLED=0 GOOS=linux go build -a -ldflags '-extldflags "-static"' .

FROM alpine:3.5
LABEL Ozgur Atici
WORKDIR /root/
COPY --from=builder go/src/github.com/aticiozgur/cftest/cftest .

ENV PORT 8080
EXPOSE 8080

ENTRYPOINT ["./cftest"]