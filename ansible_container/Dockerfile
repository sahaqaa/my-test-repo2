FROM python:3.9.4-buster

RUN echo "alias ap='ansible-playbook'" >> ~/.bashrc
RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list \
  && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 \
  && apt-get update && apt-get install -y \
     ansible \
     curl    \
     unzip   \
  && rm -rf /var/lib/apt/lists/* \
  && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
  && unzip awscliv2.zip \
  && ./aws/install      \
  && rm awscliv2.zip \
  && rm -rf aws