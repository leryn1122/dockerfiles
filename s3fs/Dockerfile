ARG UBUNTU_VERSION=20.04
FROM ubuntu:${UBUNTU_VERSION}

ENV MNT_POINT=/var/s3 \
    IAM_ROLE=none \
    S3_ENDPOINT='' \
    S3_REGION=''

VOLUME /var/s3

RUN { \
      echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse" ; \
      echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse" ; \
      echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse" ; \
      echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse" ; \
      echo "" ; \
      echo "deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse" ; \
      echo "deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse" ; \
      echo "deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse" ; \
      echo "deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse" ; \
    } > /etc/apt/sources.list \
      && apt update \
      && apt install -y s3fs \
      && rm -rf /var/lib/apt/lists/* \
      && sed -i s/"#user_allow_other"/"user_allow_other"/g /etc/fuse.conf

COPY docker-entrypoint.sh . 

CMD /docker-entrypoint.sh
