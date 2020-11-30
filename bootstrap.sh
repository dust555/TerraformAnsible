#!/usr/bin/env bash
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get install -y ansible
apt-get install wget -y
wget https://releases.hashicorp.com/terraform/0.13.5/terraform_0.13.5_linux_amd64.zip
apt-get install zip -y
unzip terraform*.zip
mv terraform /usr/local/bin
apt-get install python -y
mkdir /var/iasdata
chmod 777 /var/iasdata
cp /vagrant/iasdata/* /var/iasdata
chmod 0600 /var/iasdata/customkey.pem