
provider "aws" {
    region     = var.region
}

# resource "aws_security_group" "test_sg" {
#   name_prefix = "test_sg_one"
#   vpc_id      = module.vpc.vpc_id

#   ingress {
#     from_port = 9200
#     to_port   = 9200
#     protocol  = "tcp"

#     cidr_blocks = [
#       "10.0.0.0/8",
#     ]
#   }
# }

# create an instance
resource "aws_instance" "linux_instance" {
    ami             = lookup(var.amis, var.region) 
    subnet_id       = var.subnet 
    security_groups = var.securityGroups 
    key_name        = var.keyName 
    instance_type   = var.instanceType 
    
    ebs_block_device {
        device_name = "/dev/xvdb"
        volume_type = "gp2"
        volume_size = 8 
    }
  # Name the instance
    tags = {
        Name = var.instanceName
    }
    volume_tags = {
        Name = var.instanceName
    }
    #   Copy in the bash script we want to execute.
    connection {
        type = "ssh"
        user        = "ubuntu"
        private_key = "${file(var.keyPath)}"
        host = "${self.private_ip}"
    }
    provisioner "file" {
        source      = "./setup.sh"
        destination = "~/setup.sh"
    }
    # Change permissions on bash script & execute 
    provisioner "remote-exec" {
        inline = [
            "chmod +x ~/setup.sh",
            "sudo bash ~/setup.sh",
        ]
    }
}