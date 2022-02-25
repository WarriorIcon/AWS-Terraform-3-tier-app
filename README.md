# AWS Terraform 3-Tier App Demo
This is a high availability architecture that deploys to 2 or more AZs. 
-The VPC uses 2 private subnets and 1 public subnet per AZ.
-The DB tier and App tier are private. A Load Balancer distributes requests across the public subnets.
-Autoscaling EC2s in the public subnets communicate with private subnet Autoscaling EC2s hosting app-tier logic via another Load Balancer.
-App tier private subnet EC2s communicate with the private RDS Multi-AZ enabled instance in the Database Tier. 
-Multi-AZ enabled RDS allows for HA failover

## 