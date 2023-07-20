FROM golang:1.19-alpine AS build

WORKDIR /opt

ENV GITHUB_PROXY=https://ghproxy.com/

RUN sed -i "s/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g" /etc/apk/repositories \
 && apk add --update --no-cache \
      git \
      gcc \
      g++ \
      make \
      binutils

RUN go env -w GO111MODULE=on \
 && go env -w GOPROXY={{ .proxy.goproxy }} \
 && git clone "$GITHUB_PROXYhttps://github.com/go-delve/delve" --branch v1.7.3 --depth 1 . \
 && make install \
 && make build

FROM debian:11.6-slim AS runtime

LABEL maintainers="Leryn <leryn1122@gmail.com>"
LABEL description="go-delve"

ARG MIRRORS_SOURCE="deb.debian.org"

RUN sed -i "s/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/g" /etc/apt/sources.list

COPY --from=build /opt/dlv /dlv

ENTRYPOINT [ "/dlv" ]