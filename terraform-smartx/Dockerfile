FROM alpine:3.18.2 AS build

WORKDIR /root

COPY terraform /usr/local/bin

COPY terraform-mirrors /opt/terraform-mirrors

COPY .terraformrc /root/

RUN mkdir -p ~/.terraform.d/terraform-plugin-cache \
 && terraform init \
 && rm -rf .*_history

ENTRYPOINT [ "terraform" ]

CMD [ "--help" ]