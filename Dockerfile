FROM node:12-buster as builder
WORKDIR '/build/app'
COPY app ./

RUN ls /build/app

RUN rm -rf package-lock.json
RUN apt -y update && apt -y install git
RUN npm install
RUN npm run build

RUN ls /build/app/dist

FROM nginx
EXPOSE 80
COPY --from=builder /build/app/dist /usr/share/nginx/html
