# README

## Prequisition

Terraform is NOT allowed in the current region.

### Terraform installation

Reference:
  - [terraform.io](https://www.terraform.io)
  - [hashicorp/terraform](https://github.com/hashicorp/terraform)

Install [terraform](https://developer.hashicorp.com/terraform/downloads?product_intent=terraform) executable
or run the following bash command on Linux (Ubuntu/Debian distros):

```bash
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

### terraform-provider-cloudtower installation

Use Smartx Cloudtower provider:

Reference:
  - [smartxworks/terraform-provider-cloudtower](https://github.com/smartxworks/terraform-provider-cloudtower)
  - [smartxworks/cloudtower](https://registry.terraform.io/providers/smartxworks/cloudtower/latest)

```bash
wget -O https://github.com/smartxworks/terraform-provider-cloudtower/releases/download/v0.1.9/terraform-provider-cloudtower_0.1.9_linux_amd64.zip
unzip terraform-provider-cloudtower_0.1.9_linux_amd64.zip
mv terraform-provider-cloudtower_v0.1.9 terraform-mirrors/registry.terraform.io/smartxworks/cloudtower/0.1.9/linux_amd64
```

### Executable locations

Those exetubles were intended to be placed at:

`terraform` at docker-build context root,
`terraform-provider-cloudtower_v0.1.9` at `terraform-mirrors/registry.terraform.io/smartxworks/cloudtower/0.1.9/linux_amd64`.