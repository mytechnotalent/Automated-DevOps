#!/bin/sh
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
brew tap hashicorp/tap
brew install hashicorp/tap/packer
cd Enterprise_Templates
packer build -var-file rhel_8/variables.json rhel_8/rhel_8.json
packer build -var-file centos_stream/variables.json centos_stream/centos_stream.json
packer build -var-file oracle_8/variables.json oracle_8/oracle_8.json
cd ..
cd GitLab_Runner_Template
ansible-playbook -i gitlab_runner_inventory create_gitlab_runner_template.yml

