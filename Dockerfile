# Use the official nginx base image
FROM nginx:latest

# Install OpenJDK 17 (Java) and Maven
RUN apt-get update && \
    apt-get install -y openjdk-17-jre-headless maven

# Copy your application files to the appropriate location
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx with the specified configuration
CMD ["nginx", "-g", "daemon off;"]
