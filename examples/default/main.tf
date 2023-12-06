provider "aws" {
  region  = "us-west-2"
  profile = "bigdata-labs"
}

module "eks-s3-csi-driver" {
  source  = "Z4ck404/eks-s3-csi-driver/aws"
  version = "0.0.1"

  aws_profile      = "bigdata-labs"
  aws_region       = "us-west-2"
  eks_cluster_name = "demo-0"

  s3_bucket_name = "zack-s3-mount--usw2-az1--x-s3"
}