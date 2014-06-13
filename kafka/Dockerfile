# DOCKER-VERSION 0.11.1
# See also https://github.com/relateiq/docker_public/blob/master/images/kafka/Dockerfile
# Build a Kafka image with topics
# NOTE - NOT WORKING PROPERLY
# fails on RUN apt-get update

FROM ubuntu:14.04

MAINTAINER nmeaney.tech@gmail.com

# Make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
RUN apt-get update

# Install dependencies
RUN apt-get install -y unzip openjdk-6-jdk wget git

# Install Kafka
RUN wget -q http://mirror.gopotato.co.uk/apache/kafka/0.8.1.1/kafka_2.8.0-0.8.1.1.tgz -O /tmp/kafka_2.8.0-0.8.1.1.tgz
RUN tar xfz /tmp/kafka_2.8.0-0.8.1.1.tgz -C /opt

# Set KAFKA_HOME environment variable
ENV KAFKA_HOME /opt/kafka_2.8.0-0.8.1.1

ADD start-kafka.sh /usr/bin/start-kafka.sh

CMD start-kafka.sh
