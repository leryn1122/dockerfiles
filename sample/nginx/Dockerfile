FROM node:{{ .dependency.nodejs }}-slim AS build

WORKDIR /opt

COPY .npmrc ~
COPY . .

RUN npm install pnpm -g \
  && pnpm install \
  && pnpm build

FROM nginx:{{ .dependency.nginx }} AS publish

COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /opt/dist/ /usr/share/nginx/html/

EXPOSE 80/tcp