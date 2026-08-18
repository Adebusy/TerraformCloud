resource "aws_key_pair" "terraform" {
  key_name   = "terraform-key"
  public_key = file(pathexpand("~/.ssh/terraform-key.pub"))
}

module "network" {
  source               = "../../modules/network"
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone   = var.availability_zone
  environment          = var.environment
}

module "bastion" {
  source = "../../modules/bastion"

  vpc_id                = module.network.vpc_id
  public_subnet_id      = module.network.public_subnet_id
  ami_id                = var.ami_id
  bastion_instance_type = var.bastion_instance_type
  key_name              = aws_key_pair.terraform.key_name
  allowed_ssh_cidr      = var.allowed_ssh_cidr
  environment           = var.environment
}

module "private-instance" {
  source = "../../modules/private-instance"

  vpc_id                    = module.network.vpc_id
  private_subnet_id         = module.network.private_subnet_id
  bastion_security_group_id = module.bastion.security_group_id

  ami_id                = var.ami_id
  private_instance_type = var.private_instance_type
  key_name              = aws_key_pair.terraform.key_name
  environment           = var.environment
}