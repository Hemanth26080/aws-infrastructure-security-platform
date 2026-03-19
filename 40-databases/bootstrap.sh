#!/bin/bash

component=$1
environment=$2
dnf install ansible -y
#ansible-pull -U https://github.com/Hemanth26080/ansible_roboshop_roles.git -e component=$component main.yaml
# git clone ansible-playbook
# cd ansible-playbook
# ansible-playbook -i inventory main.yaml

REPO_URL=https://github.com/Hemanth26080/ansible_roboshop_roles.git
REPO_DIR=/opt/roboshop/ansible
ANSIBLE_DIR=ansible_roboshop_roles

mkdir -p $REPO_DIR
mkdir -p /var/log/roboshop/
touch ansible.log

cd $REPO_DIR

# check if ansible repo is already cloned or not

if [ -d $ANSIBLE_DIR ]; then

    cd $ANSIBLE_DIR
    git pull
else
    git clone $REPO_URL
    cd $ANSIBLE_DIR
fi

echo 'password' > /tmp/.vault_pass
chmod 600 /tmp/.vault_pass
ansible-playbook -e component=$component -e env=$environment --vault-password-file=/tmp/.vault_pass main.yaml || ansible-playbook -e component=$component -e env=$environment main.yaml
rm -f /tmp/.vault_pass