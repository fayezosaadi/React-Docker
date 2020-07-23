# prodction version of react app web container

## Multi-step build process uses different base images
## Build Phase/stage
FROM node:alpine
WORKDIR /app
COPY package.json .
RUN yarn install
COPY . .
RUN yarn build

## Run Phase, We're going to be using nginx server in order to serve the built result static content
## https://hub.docker.com/_/nginx
FROM nginx
# expose port for elastic beachstalk
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
