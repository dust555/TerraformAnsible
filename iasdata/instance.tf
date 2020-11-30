provider "aws" {
	access_key = ""
	secret_key = ""
	region = "eu-west-1"
}

resource "aws_key_pair" "customkey" {
	key_name = "customkey"
	public_key = "${file("customkey.pub")}"
}


resource "aws_instance" "AWS_Ansible_Server01" {
	ami = "ami-0775b4648aabb6e6c"
	instance_type = "t2.nano"
	key_name = "${aws_key_pair.customkey.key_name}"
}

resource "aws_instance" "AWS_Ansible_Server02" {
	ami = "ami-0775b4648aabb6e6c"
	instance_type = "t2.micro"
	key_name = "${aws_key_pair.customkey.key_name}"
}


resource "local_file" "inventory" {
    filename = "./hosts"
    content     = <<EOF
	[all:vars]
	ansible_connection=ssh
	ansible_user=ubuntu
	ansible_ssh_private_key_file=customkey.pem

    [frontend]
    ${aws_instance.AWS_Ansible_Server01.public_ip}

    [backend]
    ${aws_instance.AWS_Ansible_Server02.public_ip}

    EOF

}