# Use the official NGINX image from Docker Hub
FROM nginx:latest

# Create a directory for the website content
RUN mkdir -p /usr/share/nginx/html

# Copy the custom index.html file into the NGINX default content directory
COPY ./index.html /usr/share/nginx/html/index.html

# Expose port 8093
EXPOSE 8093

# Start NGINX when the container starts
CMD ["nginx", "-g", "daemon off;"]
