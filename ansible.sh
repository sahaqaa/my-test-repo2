#!/bin/bash
docker build ./ansible_container -t ansible_image:latest
docker run --rm -it --name ansible_container --env-file ./ansible_container/aws.env -v $PWD/ansible_container/ansible-files:/root/ansible-files ansible_image:latest bash
