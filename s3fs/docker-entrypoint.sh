#!/bin/bash

set -euo pipefail
set -o errexit
set -o errtrace

IFS=$'\n\t'

export S3_ACL=${S3_ACL:-private}

mkdir -p ${MNT_POINT}

export AWSACCESSKEYID=${AWSACCESSKEYID:-$AWS_KEY}
export AWSSECRETACCESSKEY=${AWSSECRETACCESSKEY:-$AWS_SECRET_KEY}

echo "${AWS_KEY}:${AWS_SECRET_KEY}" > /etc/passwd-s3fs

chmod 0400 /etc/passwd-s3fs

/usr/bin/s3fs ${S3_BUCKET} ${MNT_POINT} -d -f \
    -o passwd_file=/etc/passwd-s3fs \
    -o url=${S3_ENDPOINT} \
    -o endpoint=${S3_REGION},allow_other,retries=5 \
    -o use_path_request_style \
    -o no_check_certificate
