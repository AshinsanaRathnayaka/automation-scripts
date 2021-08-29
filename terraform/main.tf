#vpc network 

module "vpc" {
  source                = "terraform-aws-modules/vpc/aws"
  version               = "3.6.0"

  name                  = "${var.environment_name}-${var.environment_type}-vpc"
  cidr                  = "10.0.0.0/16"

  azs                   = var.availability_zones
  public_subnets        = ["10.0.20.0/24", "10.0.21.0/24"]


  enable_nat_gateway    = true
  enable_vpn_gateway    = false

  tags = {
    terraform           = "true"
    environment_name    = var.environment_name
    environment_type    = var.environment_type
  }
}

#security group for nginx server

module "nginx_security_group" {
  source                  = "terraform-aws-modules/security-group/aws"
  version                 = "4.3.0"

  name                    = "${var.environment_name}-${var.environment_type}-nginx-sg"
  description             = "Security group for Nginx server"
  vpc_id                  = module.vpc.vpc_id

  ingress_cidr_blocks     = ["0.0.0.0/0"]
  ingress_rules           = ["http-80-tcp", "all-icmp"]
  egress_rules            = ["all-all"]
}


#key-pair for nginx server

module "nginx_key_pair" {
  source                  = "terraform-aws-modules/key-pair/aws"
  version                 = "1.0.0"

  key_name                = "${var.environment_name}-${var.environment_type}-nginx-key-pair"
  public_key              = var.ssh_public_key

}

#ec2 instance for nginx server

module "nginx" {
  source                  = "terraform-aws-modules/ec2-instance/aws"
  version                 = "~> 2.0"

  name                    = "${var.environment_name}-${var.environment_type}-nginx"
  instance_count          = 1

  ami                     = var.ec2_ami
  instance_type           = var.nginx_instance_type
  key_name                = module.nginx_key_pair.key_pair_key_name
  monitoring              = true
  vpc_security_group_ids  = [module.nginx_security_group.security_group_id]
  subnet_id               = module.vpc.public_subnets[0]
  user_data               = "${file("nginx.sh")}"

  tags = {
    terraform           = "true"
    environment_name    = var.environment_name
    environment_type    = var.environment_type
  }
}
