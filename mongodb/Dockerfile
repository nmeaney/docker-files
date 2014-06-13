# MongoDB Dockerfile
#
# Derived from Dockerfile at:
# https://github.com/dockerfile/mongodb
# http://dockerfile.github.io/#/mongodb
#
# Installs MongoDB Following the Instructions at MongoDB Docs:
# http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/
#
# DOCKER-VERSION 0.11.1

# Pull base image
FROM ubuntu:14.04

MAINTAINER nmeaney.tech@gmail.com

# Update the repository sources
RUN apt-get update

# Add the package verification key
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

# Add MongoDB to the repository sources list
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list

# Update the repository sources list once more
RUN apt-get update

# Install MongoDB package (.deb)
RUN apt-get install -y mongodb-10gen

# Create the default data directory
RUN mkdir -p /data/db

# Define mountable directories
VOLUME ["/data"]

# Define working directory
WORKDIR /data

# Define default command
CMD ["mongod"]
# CMD ["mongod --rest --httpinterface"]

# Expose ports
# - 27017: process
# - 28017: http
EXPOSE 27017
EXPOSE 28017
