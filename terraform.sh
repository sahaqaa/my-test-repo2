#!/bin/bash
docker build ./terraform_container -t terraform_image:latest
docker run --rm -it --name ansible_container -v $PWD/terraform_container:/root/terraform terraform_image:latest bash
