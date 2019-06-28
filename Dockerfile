# Multi-step build process uses different base images
# Build Phase/stage
FROM node:alpine as builder
WORKDIR './app'
COPY package.json .
RUN npm install
COPY . .
CMD ["npm", "run", "build"]

# Run Phase, We're going to be using nginx server in order to serve the built result https://hub.docker.com/_/nginx
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
