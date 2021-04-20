FROM python:3.9.4-buster

RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list \
  && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 \
  && apt-get update && apt-get install -y \
     ansible=2.9.20-1ppa~trusty \
  && rm -rf /var/lib/apt/lists/*
