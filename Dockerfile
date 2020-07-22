# prodction version of react app web container

## Multi-step build process uses different base images
## Build Phase/stage
FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN yarn install
COPY . .
RUN yarn build

## Run Phase, We're going to be using nginx server in order to serve the built result static content
## https://hub.docker.com/_/nginx
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
