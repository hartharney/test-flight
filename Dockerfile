# Install Node.js
FROM node:20-alpine3.20 AS builder

# create app directory
WORKDIR /app

# Install app dependencies
COPY package.json /app

# Install app dependencies
RUN npm install

# Bundle app source
COPY . /app

# Expose the port the app runs in
EXPOSE 3000

# Serve the app
RUN npm run build

# Install server image
FROM nginx:alpine

# copy build directoty into server
COPY --from=builder /app/build /usr/share/nginx/html