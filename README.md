# terraform-aws-eks-s3-csi-driver

Create the IAM resources for the S3 CSI Driver and install the add-on on an existing EKS cluster.

<img width="618" alt="Capture d’écran 2024-04-09 à 07 14 27" src="https://github.com/Z4ck404/terraform-aws-eks-s3-csi-driver/assets/35115877/d808caa3-9fc9-400a-9ed9-b8aa6ad006bd">



## Usage:

```
module "eks-s3-csi-driver" {
  source  = "Z4ck404/eks-s3-csi-driver/aws"

  aws_profile      = "zack-labs"
  aws_region       = "us-west-2"
  eks_cluster_name = "zack-demo-0"

  s3_bucket_name = "zack-s3-mount--usw2-az1--x-s3"
}
```
## examples:

- Once you create the IAM resources and install the add-on on your cluster, you can go a head and apply the following to test:

`kubectl apply -f /examples/default/example-s3-pvc.yaml`

- You can find more here: [AWS Examples S3 mount on eks using the driver](https://github.com/awslabs/mountpoint-s3-csi-driver/blob/main/examples/kubernetes/static_provisioning/static_provisioning.yaml)


## The module:



<!-- BEGIN_TF_DOCS -->
### Requirements

No requirements.

### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [aws_eks_addon.s3_csi](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_addon) | resource |
| [aws_iam_policy.s3_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.s3_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.s3_role_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_eks_addon_version.s3_csi](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_addon_version) | data source |
| [aws_eks_cluster.eks_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_iam_openid_connect_provider.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_openid_connect_provider) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_profile"></a> [aws\_profile](#input\_aws\_profile) | AWS Profile | `string` | `""` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Region Code | `string` | n/a | yes |
| <a name="input_eks_cluster_name"></a> [eks\_cluster\_name](#input\_eks\_cluster\_name) | EKS cluster name | `string` | n/a | yes |
| <a name="input_s3_bucket_name"></a> [s3\_bucket\_name](#input\_s3\_bucket\_name) | Name of the S3 bucket | `string` | n/a | yes |

### Outputs

No outputs.
<!-- END_TF_DOCS -->
