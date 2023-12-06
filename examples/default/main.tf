provider "aws" {
  region  = "us-west-2"
  profile = "zack-labs"
}

module "eks-s3-csi-driver" {
  source  = "../.."

  aws_profile      = "zack-labs"
  aws_region       = "us-west-2"
  eks_cluster_name = "zack-demo-0"

  s3_bucket_name = "zack-s3-mount--usw2-az1--x-s3"
}