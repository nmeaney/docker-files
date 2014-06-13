# Dockerfile - base image for node.js services
#
# DOCKER-VERSION 0.11.1

# Pull base image
FROM ubuntu:14.04

# Make sure the package repository is up to date (NOTE - trusty === Ubuntu 14.04)
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list

# Install dependency packages
RUN apt-get update; apt-get install -y software-properties-common python-software-properties git

# Add node.js to package repository
RUN add-apt-repository -y ppa:chris-lea/node.js

# Install nodejs & npm
RUN apt-get update; apt-get install -y nodejs

# Set default node environment variable
ENV NODE_ENV development
