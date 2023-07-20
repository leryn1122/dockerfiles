FROM alpine:3.16.2 AS build

WORKDIR /root

COPY terraform /usr/local/bin

COPY terraform-mirrors /tmp/terraform-mirrors

COPY .terraformrc /root/

RUN mkdir -p ~/.terraform.d/terraform-plugin-cache \
 && terraform init \
 && rm -rf .*_history

FROM alpine:3.16.2 AS runtime

WORKDIR /root

COPY terraform /usr/local/bin

COPY --from=build /root /root

ENTRYPOINT [ "/bin/sh", "-c", "terraform" ]

CMD [ "--help" ]