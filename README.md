# PlatformAutomationAWS

This project uses terraforms to provision EKS cluster on AWS

# STEPS

1. Create a VPC where the EKS cluster will be created. Use the cloudformation script below : 
2. Open AWS cloudFormation on AWS console . Search for CloudFormation via the search box and click on cloudformation
3. Click on create stack
4. Select specify and Amazon S3 template URL  https://s3.us-west-2.amazonaws.com/amazon-eks/cloudformation/2020-10-29/amazon-eks-vpc-private-subnets.yaml
5. Create user credentials at programmatic level to access resources. Use the AWS console
    Open up the AWS management console and go to IAM
    Create a new user or use your exististing AWS user
    Give the user programmatic access
    Copy the access key and secret key
6. Create S3 bucket to store the terraform state file https://www.golinuxcloud.com/configure-s3-bucket-as-terraform-backend/
7. Create an Elastic Container Registry
8. Create An EKS Cluster IAM Role, And Policy For EKS
9. Create An EKS Cluster   
10. Create Docker image of the app. See docker file for reference
11. Log into AWS ECR
    aws ecr get-login-password --region *your_aws_region* | docker login --username AWS --password-stdin *your_aws_account_id*.dkr.ecr.*your_aws_region*.amazonaws.com
    tag docker image : docker tag uber *your_aws_account_id*.dkr.ecr.*your_aws_region*.amazonaws.com 
    push image to repository: docker push *your_aws_account_id*.dkr.ecr.us-east-1.amazonaws.com/*repo_name*
12. Connect to EKS cluster from terminal : aws eks --region *your_aws_region* update-kubeconfig --name *your_eks_cluster_name . Test connection by running kubectl get nodes
13. Create a kubernetes manifest to deploy app. Refer to deployment.yaml

# Create EKS Cluster With CICD

# Secrets
    Set up authentication from GitHub to AWS. To do that, you'll need to set up secrets.
1.  Since you'll be adding those two secrets to the GitHub repository, you'll need an AWS Access Key ID and an AWS Secret Access Key. You'll be able to access AWS via GitHub Actions with the help of these two secrets.
2.  In the code repository, go to Settings --> Secrets
3.  Add in two secrets in Repository secrets: AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY

    Save
4.    Pipeline
5.   Now that the secrets are created, it's time to create the pipeline.

6. Under the GitHub repository, click on the Actions tab
7. Under Get started with Actions, click the set up a workflow yourself button
8. Inside of the workflow, copy in the contents that you can find here
    
The pipeline functions:

  workflow_dispatch on line 4 means the pipeline won't automatically run unless you kick it off. Ther are other options that can trigger the pipeline like push_on to branchYou can of course change this to have the pipeline automatically run if you, for example, push code to the dev or main branch.
    The code is checked-out ffrom github
    Authentication occurs to AWS with the aws secret and access key id configured
    Terraform is set up
    Terraform init 
    Terraform format 
    Terraform plan 
    Terraform apply 
    Run the pipeline. The EKS cluster will be created automatically




