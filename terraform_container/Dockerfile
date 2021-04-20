FROM golang:1.16.3-buster as builder

RUN apt-get update && apt-get install -y \
  git \
  && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/hashicorp/terraform.git

WORKDIR ./terraform
RUN go install


FROM debian:buster

WORKDIR /usr/bin/
COPY --from=builder /go/bin/terraform .

