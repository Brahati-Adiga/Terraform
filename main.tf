module "VPC" {
  source = "./modules/vpc"
  
  cidr_block = var.cidr_block
  cidr_block_1 = var.cidr_block_1
  cidr_block_2 = var.cidr_block_2
  az1 = var.az1
  az2 = var.az2
  vpc_name = var.vpc_name
}

module "s3-backend" {
  source = "./modules/s3-backend"

  bucket_name        = var.bucket_name
  object_lock_enabled = var.object_lock_enabled
  force_destroy      = var.force_destroy
}

module "ec2" {
  source = "./modules/ec2"

  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_1      = module.VPC.subnet_1_id
  subnet_2      = module.VPC.subnet_2_id
  sg_id        = module.VPC.sg_id
}

module "alb" {
  source = "./modules/alb"

  alb_name     = var.alb_name
  alb_internal = var.alb_internal
  tg_name      = var.tg_name
  port         = var.port
  subnet_1      = module.VPC.subnet_1_id
  subnet_2      = module.VPC.subnet_2_id
  sg_id        = module.VPC.sg_id
  vpc_id      = module.VPC.vpc_id
  instance_1_id = module.ec2.instance_1_id
  instance_2_id = module.ec2.instance_2_id
}