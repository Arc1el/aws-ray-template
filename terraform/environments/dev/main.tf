module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr          = "10.0.0.0/16"
  environment       = local.environment
  project_name      = local.project_name
  public_subnet_id  = module.subnet.public_subnet_ids[0]  # ap-northeast-2a의 퍼블릭 서브넷 사용
}

module "subnet" {
  source = "../../modules/subnet"

  vpc_id              = module.vpc.vpc_id
  vpc_cidr            = module.vpc.vpc_cidr
  azs                 = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
  environment         = local.environment
  project_name        = local.project_name
  private_route_table_id = module.vpc.private_route_table_id
  public_route_table_id  = module.vpc.public_route_table_id
}