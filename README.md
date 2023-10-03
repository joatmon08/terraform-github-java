# terraform-github-java

Repository to provision a GitHub repository as a starter
template and create Argo CD application for it.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | >= 5.39 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.19.0 |
| <a name="provider_github"></a> [github](#provider\_github) | 5.39.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.23.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_repository.app](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [kubernetes_manifest.application_argocd_hashicups](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [aws_eks_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster_auth.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |
| [terraform_remote_state.infrastructure](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_business_unit"></a> [business\_unit](#input\_business\_unit) | Business unit for service | `string` | n/a | yes |
| <a name="input_kubernetes_server"></a> [kubernetes\_server](#input\_kubernetes\_server) | Deploy to Kubernetes server | `string` | `"https://kubernetes.default.svc"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of repository | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | GitHub template owner | `string` | `"joatmon08"` | no |
| <a name="input_template_repository"></a> [template\_repository](#input\_template\_repository) | Template repository for Java app | `string` | `"spring-boot-template"` | no |
| <a name="input_tfc_organization"></a> [tfc\_organization](#input\_tfc\_organization) | TFC Organization with infrastructure resources | `string` | `"tpmm-org-platform-engineering"` | no |
| <a name="input_tfc_workspace_infrastructure"></a> [tfc\_workspace\_infrastructure](#input\_tfc\_workspace\_infrastructure) | TFC Workspace with infrastructure resources | `string` | `"infrastructure"` | no |

## Outputs

No outputs.
