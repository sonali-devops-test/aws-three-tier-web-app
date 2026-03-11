# this Build stage..


#workflow changes 1
#workflow changes 2

FROM node:18-alpine AS build

WORKDIR /usr/src/app

# Copy package files.....
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy rest of source
COPY . .

# Build React app for production
RUN npm run build

# Second stage: use Nginx to serve the built static files
FROM nginx:stable-alpine

# Copy the build output to Nginx html folder
COPY --from=build /usr/src/app/build /usr/share/nginx/html

# Expose port 80 (HTTP)
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]

