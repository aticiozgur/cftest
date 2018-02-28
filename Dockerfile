FROM golang:alpine AS build-env
ADD . /go/src/github.com/aticiozgur/cftest
RUN cd /go/src/github.com/aticiozgur/cftest && CGO_ENABLED=0 GOOS=linux go build -a -ldflags '-extldflags "-static"' .

FROM alpine:3.5
LABEL Ozgur Atici

RUN ln -s /go/src/github.com/aticiozgur/cftest /app
RUN chmod +x /app

ENV PORT 8080
EXPOSE 8080

ENTRYPOINT ["/app"]
