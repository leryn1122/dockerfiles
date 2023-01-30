ARG GO_VERSION=1.19
ARG DEBIAN_VERSION=11.6-slim
FROM golang:${GO_VERSION}-alpine AS build

ARG MIRRORS_SOURCE="dl-cdn.alpinelinux.org" \
    GOPROXY="https://goproxy.io,direct" \
    GITHUB_PROXY="" \
    DELVE_VERSION=v1.7.3

WORKDIR /opt

RUN sed -i "s/dl-cdn.alpinelinux.org/${MIRRORS_SOURCE}/g" /etc/apk/repositories \
 && apk --no-cache add \
      git \
      gcc \
      g++ \
      make \
      binutils

RUN go env -w GO111MODULE=on \
 && go env -w GOPROXY=${GOPROXY} \
 && git clone ${GITHUB_PROXY}https://github.com/go-delve/delve --branch ${DELVE_VERSION} --depth 1 . \
 && make install \
 && make build

FROM debian:${DEBIAN_VERSION} AS runtime

LABEL maintainers="Leryn <leryn1122@gmail.com>"
LABEL description="go-delve"

ARG MIRRORS_SOURCE="deb.debian.org"

RUN sed -i "s/deb.debian.org/${MIRRORS_SOURCE}/g" /etc/apt/sources.list

COPY --from=build /opt/dlv /dlv

ENTRYPOINT [ "/dlv" ]