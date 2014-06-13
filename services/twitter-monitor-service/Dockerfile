# Dockerfile for node.js-based service
#
# DOCKER-VERSION 0.11.1

# Pull base image
FROM nmeaney/nodejs-base

# Define the working directory
WORKDIR /services

# Add a service startup script and make executable
ADD startService.sh /services/
RUN chmod +x /services/startService.sh

# Run the startup script
CMD /services/startService.sh
