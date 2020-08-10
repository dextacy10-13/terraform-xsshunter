# terraform-xsshunter
Basic IaC orchestrate and provision environment for xsshunter to run on

# WIP
1. Use packer to build a base image with as much baked in as possible, Get AMI
2. With Terraform get Domain zone id as variable (assume you have Zone in AWS for domain)
3. Create EC2 instance using the Custom AMI you got from image made with Packer
4. Create DNS - A record point to EC2, Create *.{{domain}} CNAME and point to A record
5.  