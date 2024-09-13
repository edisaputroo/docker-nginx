# Use the latest NGINX image
FROM nginx:latest

# Set working directory
WORKDIR /usr/share/nginx/html

# Copy the script to the container
COPY generate_index.sh /usr/share/nginx/html/

# Make the script executable
RUN chmod +x generate_index.sh

# Run the script to generate index.html with system info
RUN ./generate_index.sh

# Expose port 8093
EXPOSE 8093

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
