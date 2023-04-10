variable "REGION" {
  default = "us-east-2"
}
variable "AMIS" {
  type = map(any)
  default = {
    us-east-2  = "ami-0a695f0d95cefc163"
    us-east-1  = "ami-007855ac798b5175e"
    ap-south-1 = "ami-02eb7a4783e7e9317"
  }
}
variable "PRIV_KEY_PATH" {
  default = "vprofilekey"
}
variable "PUB_KEY_PATH" {
  default = "vprofilekey.pub"
}
variable "USERNAME" {
  default = "ubuntu"
}

variable "MYIP" {
  default = ["0.0.0.0/0"]
}

variable "rmquser" {
  default = "rabbit"
}

variable "rmppass" {
  default = "Gr33n@pple123456"
}

variable "dbuser" {
  default = "admin"
}

variable "dbpass" {
  default = "admin@123"
}

variable "dbname" {
  default = "account"
}

variable "instance_count" {
  default = "1"
}

variable "VPC_NAME" {
  default = "vprofile-VPC"
}

variable "ZONE1" {
  default = "us-east-2a"
}

variable "ZONE2" {
  default = "us-east-2b"
}
variable "ZONE3" {
  default = "us-east-2c"
}

variable "VpcCIDR" {
  default = "172.21.0.0/16"
}

variable "PubSub1CIDR" {
  default = "172.21.1.0/24"
}

variable "PubSub2CIDR" {
  default = "172.21.2.0/24"
}

variable "PubSub3CIDR" {
  default = "172.21.3.0/24"
}

variable "PrivSub1CIDR" {
  default = "172.21.4.0/24"
}

variable "PrivSub2CIDR" {
  default = "172.21.5.0/24"
}

variable "PrivSub3CIDR" {
  default = "172.21.6.0/24"
}







