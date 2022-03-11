FROM node:alpine as builder
WORKDIR '/build/app'
COPY app ./

RUN npm install --registry=https://registry.npm.taobao.org
RUN npm run build

RUN ls /build/app/dist

FROM nginx
EXPOSE 80
COPY --from=builder /app/build/app/dist /usr/share/nginx/html