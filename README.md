![image](https://github.com/mytechnotalent/Automated-DevOps/blob/main/Automated%20DevOps.png?raw=true)

# Automated DevOps
Automated DevOps is a repo that integrates Red Hat Linux 8, CentOS Stream and Oracle Linux 8 Packer templates for a vSphere & ESXi enterprise environment with Ansible provisioning for the VM instances utilizing GitLab Infrastructure As Code build automation.

## Step 1: Clone Repo
```bash
git clone https://github.com/mytechnotalent/Automated-DevOps.git
```

## Step 2: Run `setup.sh` [MAC]
```bash
./setup.sh
```

## Step 3: Import Repo In GitLab
[Instructions](https://docs.gitlab.com/ee/user/project/import/github.html)

## Step 4: Install SSH Pass
```bash
brew install hudochenkov/sshpass/sshpass
```

## Step 5: Setup SSH In GitLab
```bash
ssh local@gitlab-runner.example.com
stty sane
ssh-keygen -t rsa -b 2048
cat ~/.ssh/id_rsa.pub
[Preferences - SSH Keys - Add an SSH key - Add key]
```

## Step 6: Clone Repo -> GitLab Runner VM
```bash
git clone git@gitlab.com:<gitlab-account>/automated-devops.git
cd automated-devops
vim ~/.vimrc
  set number
  set tabstop=2    
  set shiftwidth=2
  set expandtab 
  syntax on
```

## Step 7: Register GitLab Runner
```bash
sudo gitlab-runner register  # password: server
  https://gitlab.com
  [Settings, CI/CD, Runners, Expand, registration token, copy]
  gitlab-runner
  ci
  shell
sudo gitlab-runner status
sudo gitlab-runner stop
```

## Step 8: Setup Enterprise Automation Environment
```bash
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt 
cat ~/.ssh/id_rsa.pub
vim Enterprise_Instance_Templates/files/lab_admin.pub
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
git add .
git commit -m "Add lab_admin.pub key"
git push
```

## Step 9: Automate Enterprise Instance Template Creation
```bash
sudo gitlab-runner run
```

## Step 10: Automate GitLab Runner Template & Enterprise Instance Template Destruction [MAC]
```bash
ansible-playbook -i GitLab_Runner_Template/gitlab_runner_inventory GitLab_Runner_Template/destroy_gitlab_runner_template.yml
ansible-playbook -i Enterprise_Instance_Templates/enterprise_instance_inventory Enterprise_Instance_Templates/destroy_enterprise_instances.yml
```

## License
[Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0)
