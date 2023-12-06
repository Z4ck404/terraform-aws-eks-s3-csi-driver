variable "aws_profile" {
  description = "AWS Profile"
  type        = string
  default     = ""
}

variable "aws_region" {
  description = "Region Code"
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "eks_cluster_name" {
  description = "EKS cluster name"
  type        = string
}