project              = "secure-app"
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24"]
azs                  = ["eu-north-1a", "eu-north-1b"]
db_name = "secureappdb"
db_username = "Tejiri"
instance_class  = "db.t3.micro"

ami_id         = "ami-00f34bf9aeacdf007"  # Update to your preferred AMI
instance_type  = "t3.micro"
key_name       = "Tej-ec2"
