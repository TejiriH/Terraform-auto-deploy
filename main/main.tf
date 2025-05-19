module "networking" {
  source               = "../modules/networking"
  project              = var.project
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  azs                  = var.azs
}

module "security_groups" {
  source  = "../modules/security-groups"
  project = var.project
  vpc_id  = module.networking.vpc_id  # ✅ Use output directly from networking module
}

module "database" {
  source  = "../modules/database"
  project = var.project
  vpc_id  = module.networking.vpc_id
  db_name = var.db_name
  db_username = var.db_username
  # db_password = var.db_password
  private_subnet_id = module.networking.private_subnets
  db_sg_id = [module.security_groups.db_sg_id]
  instance_class = var.instance_class
}

# Web Layer (public subnet)
module "web_ec2" {
  source             = "../modules/ec2"
  project            = var.project
  name               = "web"
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  subnet_id          = module.networking.public_subnets[0]
  security_group_ids = [module.security_groups.web_sg_id]
  public_ip          = true
  key_name           = var.key_name
}

# App Layer (private subnet)
module "app_ec2" {
  source             = "../modules/ec2"
  project            = var.project
  name               = "app"
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  subnet_id          = module.networking.private_subnets[0]
  security_group_ids = [module.security_groups.app_sg_id]
  public_ip          = false
  key_name           = var.key_name
}

