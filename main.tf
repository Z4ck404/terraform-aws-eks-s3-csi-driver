resource "aws_iam_policy" "s3_policy" {
  name        = "${var.s3_bucket_name}-s3-access-policy"
  description = "IAM policy for S3 access"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid      = "MountpointFullBucketAccess",
        Effect   = "Allow",
        Action   = ["s3:ListBucket"],
        Resource = ["arn:aws:s3:::${var.s3_bucket_name}"],
      },
      {
        Sid    = "MountpointFullObjectAccess",
        Effect = "Allow",
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:AbortMultipartUpload",
          "s3:DeleteObject",
        ],
        Resource = ["arn:aws:s3:::${var.s3_bucket_name}/*"],
      },
    ],
  })
}

resource "aws_iam_role" "s3_role" {
  name = "${var.s3_bucket_name}-s3-csi-access-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Federated = data.aws_iam_openid_connect_provider.this.arn
        },
        Action = "sts:AssumeRoleWithWebIdentity",
        Condition = {
          StringLike = {
            "${data.aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer}:sub" = "system:serviceaccount:kube-system:s3-csi-*",
            "${data.aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer}:aud" = "sts.amazonaws.com",
          },
        },
      },
    ],
  })
}

resource "aws_iam_role_policy_attachment" "s3_role_attachment" {
  policy_arn = aws_iam_policy.s3_policy.arn
  role       = aws_iam_role.s3_role.name
}


resource "aws_eks_addon" "s3_csi" {
  cluster_name      = data.aws_eks_cluster.eks_cluster.id
  addon_name        = "aws-mountpoint-s3-csi-driver"
  addon_version     = data.aws_eks_addon_version.s3_csi.version
  resolve_conflicts = "OVERWRITE"

  service_account_role_arn = aws_iam_role.s3_role.arn
}
