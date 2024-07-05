# Dockerized App to AWS ECS with Terraform

This is **NOT** a tutorial on how to deploy an app to AWS ECS with Terraform. This is a simple example of how to use Docker, Terraform, and AWS ECS to deploy a simple app.

This is mailny for my own reference, but if you find it useful, feel free to use it.

## Tools

- Terraform (well actually Tofu)
- aws dynamo
- aws S3

## Description

I wanted to deploy an app to AWS ECS using Terraform. I found a lot of tutorials on how to do this, but I wanted to do it my way. I wanted to use Docker, Terraform, and AWS ECS to deploy a simple app.

I wanted to see how I manage terraform state, how I manage secrets, and how I manage the deployment of the app. So I decide to have terraform state on S3 and dynamoDB.

So I have terraform to build my S3 and dynamoDB, and then I have terraform to build my ECS cluster, and then I have terraform to build my app.

## Build Terraform state S3 and DynamoDB

View "terraform-backend" folder, it contains the definitions for a new s3 bucket and dynamoDB table to store the terraform state.

On paper this is a one-time thing, but I was playing around with it, so I had to destroy and recreate it a few times.

steps:

- got to the "terraform-backend" folder
- run `terraform init`
- run `terraform plan`
- run `terraform apply`
- run `terraform destroy` (when you want to remove it in the end)

*** verify if S3 bucket deletion actually works, as I needed to manually empty the items before I could have deleted the bucket.

## Build the App

This one create all the needed items to deploy the app to AWS ECS.
VPC, subnets, security groups, ECS cluster, ECS service, ECS task definition, and the app itself.

The outputs is used for me to get the load balancer url in the end.

steps:

- got to the "terraform-app" folder
- run `terraform init -backend-config=backend-config.hcl`
- run `terraform plan`
- run `terraform apply`
- run `terraform destroy` (when you want to remove it in the end)

### side notes

I used tofu instead of terraform. Just replace `terraform` with `tofu` in the commands above.
