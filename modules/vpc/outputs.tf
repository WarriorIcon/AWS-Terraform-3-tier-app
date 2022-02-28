output "public_subnets" {
  description = "VPC main.tf outputs the public subnets here"
  value       = module.vpc.public_subnets
}