# Official AWS VPC Module
# This nifty VPC module makes building a VPC easy - auto builds the internet gateway and route table associations. 
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.12.0"
  # insert the 23 required variables here

  name = "3-tier-terraform-vpc"
  cidr = "10.16.0.0/16"

  /* This is a HA architecture that can be done with 2 or more AZs. 
      * 2 private subnets and 1 public subnet per AZ 
      * The DB tier and App tier are private. 
      * 2 Load Balancers,
  */

  azs             = ["us-east-1a", "us-east-1b", /*"us-east-1c", "us-east-1d"*/] # 2 AZs will deploy 2 NAT Gateways for this HA architecture.
  public_subnets  = ["10.16.0.0/24", "10.16.16.0/20", /*"10.16.32.0/20", "10.16.48.0/20"*/]
  private_subnets = ["10.16.64.0/24", "10.16.80.0/20", "10.16.96.0/20", "10.16.112.0/20"]

  enable_nat_gateway     = false
  one_nat_gateway_per_az = false #This is key to our HA architecture. Set to true
  single_nat_gateway     = false

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }

  enable_flow_log = false
}

