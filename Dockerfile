# Base image
FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies and modern Node.js (v18)
RUN apt update && apt install -y curl git nginx && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt install -y nodejs && \
    rm -rf /var/lib/apt/lists/*

# Create app directory
WORKDIR /var/www/node_app

# Copy app and install dependencies
COPY package*.json ./
RUN npm install
COPY . .

# Replace the default Nginx config
COPY nginx.conf /etc/nginx/sites-available/default

# Expose ports
EXPOSE 4000 80

# Start both Nginx and Node
CMD service nginx start && npm start
