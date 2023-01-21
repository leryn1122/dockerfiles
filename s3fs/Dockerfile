ARG DEBIAN_VERSION=11.6-slim
FROM debian:${DEBIAN_VERSION}

LABEL maintainers="Leryn <leryn1122@gmail.com>"
LABEL description="s3fs fuse"

ENV MNT_POINT=/var/s3 \
    IAM_ROLE=none \
    S3_ENDPOINT='' \
    S3_REGION=''

ARG MIRRORS_SOURCE=deb.debian.org \
    S3FS_VERSION=1.89

VOLUME /var/s3

RUN sed -i "s/deb.debian.org/${MIRRORS_SOURCE}/g" /etc/apt/sources.list \
 && apt-get update && apt-get install -y \
      s3fs=${S3FS_VERSION} \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && sed -i 's/#user_allow_other/user_allow_other/g' /etc/fuse.conf

COPY docker-entrypoint.sh . 

CMD /docker-entrypoint.sh
