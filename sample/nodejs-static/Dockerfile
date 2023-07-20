FROM node:16.20.1-slim AS build

WORKDIR /opt

COPY .npmrc ~

COPY . .

RUN npm install pnpm -g \
  && pnpm install \
  && pnpm build

FROM nginx:nginx:1.22-alpine-slim  AS publish

COPY nginx.conf /etc/nginx/nginx.conf

COPY --from=build /opt/dist/ /usr/share/nginx/html/

EXPOSE 80/tcp