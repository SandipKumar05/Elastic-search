variable "region" {
   default = "us-east-1"
}
variable "availabilityZone" {
   default = "us-east-1a"
}
variable "instanceType" {
   default = "t2.micro"
}
variable "keyName" {
   default = "testSandip"
}
variable "keyPath" {
   default = "~/.ssh/testSandip"
}
variable "subnet" {
   default = "subnet-59ac1913"
}
variable "securityGroups" {
   type = list
   default = [ "sg-0a3fd108223ed8e35" ]
}
variable "instanceName" {
   default = "testES"
}
# ubuntu 18 AMI
variable "amis" {
   default = {
     "us-east-1" = "ami-0d49832888bbf7541"
   }
}
