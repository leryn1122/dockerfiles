FROM alpine:{{ .dependency.alpine }}

LABEL maintainers="Leryn <leryn1122@gmail.com>"
LABEL description="helm"

ARG BASE_URL="https://get.helm.sh"

RUN case `uname -m` in \
      x86_64)  ARCH=amd64; ;; \
      armv7l)  ARCH=arm; ;; \
      aarch64) ARCH=arm64; ;; \
      ppc64le) ARCH=ppc64le; ;; \
      s390x)   ARCH=s390x; ;; \
      *) echo "unsupported arch, exit ..."; exit 1; ;; \
    esac \
 && sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories \
 && apk add --update --no-cache \
      curl \
      git \
      wget \
 && wget -q ${BASE_URL}/helm-v{{ .dependency.helm }}-linux-${ARCH}.tar.gz -O - | tar -xz \
 && mv linux-${ARCH}/helm /usr/bin/helm \
 && chmod +x /usr/bin/helm \
 && rm -rf linux-${ARCH} \
 && helm plugin install https://ghproxy.com/https://github.com/chartmuseum/helm-push.git

WORKDIR /opt

ENTRYPOINT ["helm"]

CMD ["--help"]
