provider "aws" {
    region     = "${var.region}"    
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
}

################## Creating an EKS Cluster ##################
resource "aws_eks_cluster" "cluster" {
  name     = "whiz"
  role_arn = "arn:aws:iam::996376718650:role/task98_role_15214.43661765337623"

  vpc_config {
    subnet_ids = ["subnet-0671e6f5301ce9f25", "subnet-0e37efb24042b2c4f"]
  }
}
