#!/bin/bash
echo "This script can build and run Ansible or Terraform Docker Container"

if [ $(getent group docker) ]; then
  echo "Docker group exists."
else
  echo "Docker group does not exist."
  echo "Make sure that Docker Engine installed in your system."
  exit
fi

if getent group docker | grep -q "\b$USER\b"; then
    echo "$USER is member of Docker group"
else
    echo "$USER is not member of Docker group"
        echo "Error. Make sure that your account is added into "docker" group"
        exit
fi

read -p "Enter 1 or 'Ansible' to run Ansible Container. Enter 2 or 'Terraform' to run Terraform Container:" Keypress

case $Keypress in
  1|Ansible)
  /usr/bin/docker build ./ansible_container -t ansible_image:latest \
  && /usr/bin/docker run --rm -it --name ansible_container --env-file \
  ./ansible_container/aws.env -v $PWD/ansible_container/ansible-files:/root/ansible-files \
  ansible_image:latest bash
  ;;
  2|Terraform)
  /usr/bin/docker build ./terraform_container -t terraform_image:latest \
  && /usr/bin/docker run --rm -it --name ansible_container -v \
  $PWD/terraform_container:/root/terraform terraform_image:latest bash
  ;;
  *)
  echo "Error.Please choose from available options"
  exit
  ;;
esac

