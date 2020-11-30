starting virtual machine with terraform and ansible installed

vagrant up



content of /vagrant/iasdata is copied to /var/iasdata



ssh into virtual machine

vagrant ssh


enter access_key and secret_key in instance.tf


vagrant@terraformansible:/var/iasdata$ terraform init
vagrant@terraformansible:/var/iasdata$ terraform apply

will create the hosts file and 2 ec2 instances



test connection using AnsiblePingPlaybook.yaml


vagrant@terraformansible:/var/iasdata$sudo ansible-playbook AnsiblePingPlaybook.yaml -i hosts


delete ec2 instances

vagrant@terraformansible:/var/iasdata$ terraform destroy
