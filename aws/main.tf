
module "networking" {
    
source = "./modules/networking"
  region               = "${var.region}"
  environment          = "${var.environment}"
  vpc_cidr             = "${var.vpc_cidr}"
  public_subnets_cidr  = "${var.public_subnets_cidr}"
  private_subnets_cidr = "${var.private_subnets_cidr}"
  availability_zones   = "${local.production_availability_zones}"
}

module "eks" {
  source = "./modules/eks"
  
  region        = var.region
  cluster_name  = var.cluster_name
  vpc_id        = module.vpc.vpc_id
  subnets       = module.vpc.private_subnets
  
}
