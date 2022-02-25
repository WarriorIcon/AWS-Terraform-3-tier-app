# AWS Terraform 3-Tier App Demo
This is a high availability architecture that deploys to 2 or more AZs. 
- The VPC uses 2 private subnets and 1 public subnet per AZ.
- The DB tier and App tier are private. A Load Balancer distributes requests across the public subnets.
- Autoscaling EC2s in the public subnets communicate with private subnet Autoscaling EC2s.
- A 2nd Load Balancer distributes load across app-tier EC2s in private subnets.*
- App tier private subnet EC2s communicate with the private Multi-AZ enabled RDS instance in the Database Tier. 
- Multi-AZ enabled RDS allows for HA failover. 

## 