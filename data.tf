data "aws_eks_cluster" "eks_cluster" {
  name = var.eks_cluster_name
}

data "aws_eks_addon_version" "s3_csi" {
  addon_name         = "aws-mountpoint-s3-csi-driver"
  kubernetes_version = data.aws_eks_cluster.eks_cluster.version
}

data "aws_iam_openid_connect_provider" "this" {
  url = data.aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}