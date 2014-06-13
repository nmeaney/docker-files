#!/bin/bash
# Update twitter-monitor-service codebase from git on startup
# Runs in Docker container (see Dockerfile)
#
# NOTE - This script is designed to run on staging & production environments
#        Because... git clone needs access to the TSSG network (to connect to gitlab)
#        But on Mac, npm needs access to the TSSG_GUESTS wi-fi network (to connect to the Internet)

# Remove the repo if it already exists
rm -rf twitter-monitor-service; true

# Download from gitlab (requires TSSG network access)
# git clone http://nmeaney:ttqkC88T@gitlab.tssg.org/nmeaney/twitter-monitor-service.git
git clone http://nmeaney:ttqkC88T@10.37.84.20/nmeaney/twitter-monitor-service.git

# Install node modules for project
cd twitter-monitor-service
npm install

# Create log folder and file
mkdir -p /var/log/nmeaney/
touch /var/log/nmeaney/twitter-monitor-service-$NODE_ENV.log

# Start the twitter-monitor-service
# nohup node startService.js >> /var/log/nmeaney/twitter-monitor-service-$NODE_ENV.log 2>&1 &
node startService.js
