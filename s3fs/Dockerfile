FROM debian:11.6-slim

LABEL maintainers="Leryn <leryn1122@gmail.com>"
LABEL description="s3fs fuse"

ENV MNT_POINT=/var/s3 \
    IAM_ROLE=none \
    S3_ENDPOINT='' \
    S3_REGION=''

RUN sed -i "s/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/g" /etc/apt/sources.list \
 && apt-get update && apt-get install -y \
      s3fs=1.89 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && sed -i 's/#user_allow_other/user_allow_other/g' /etc/fuse.conf

COPY docker-entrypoint.sh . 

CMD /docker-entrypoint.sh
