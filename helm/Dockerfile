ARG ALPINE_VERSION=3.17.0
FROM alpine:${ALPINE_VERSION}

ARG HELM_VERSION=3.10.0 \
    GITHUB_PROXY=https://ghproxy.com/

ENV BASE_URL="https://get.helm.sh"

RUN case `uname -m` in \
        x86_64) ARCH=amd64; ;; \
        armv7l) ARCH=arm; ;; \
        aarch64) ARCH=arm64; ;; \
        ppc64le) ARCH=ppc64le; ;; \
        s390x) ARCH=s390x; ;; \
        *) echo "un-supported arch, exit ..."; exit 1; ;; \
    esac \
      && sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
      && apk add --update --no-cache wget git curl \
      && wget ${BASE_URL}/helm-v${HELM_VERSION}-linux-${ARCH}.tar.gz -O - | tar -xz \
      && mv linux-${ARCH}/helm /usr/bin/helm \
      && chmod +x /usr/bin/helm \
      && rm -rf linux-${ARCH} \
      && helm plugin install ${GITHUB_PROXY}https://github.com/chartmuseum/helm-push.git

WORKDIR /apps

ENTRYPOINT ["helm"]
CMD ["--help"]
