# Use the official n8n image
FROM n8nio/n8n:latest

# Switch to root to install dependencies if needed
USER root

# Create data directory with proper permissions
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n

# Switch back to node user
USER node

# Set the working directory
WORKDIR /home/node

# Expose n8n port
EXPOSE 5678

# The CMD is inherited from the base image