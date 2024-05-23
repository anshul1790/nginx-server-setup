# Use the official Alpine base image
FROM alpine:latest

# Install Nginx
RUN apk update && apk add nginx

# Remove default server definition
RUN rm -f /etc/nginx/conf.d/default.conf

# Copy custom Nginx configuration file to the Nginx configuration directory
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]