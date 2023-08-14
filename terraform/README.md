# Terraform Katas
- tf-intro: A basic introduction to terraform
- tf-import: Practice importing existing resources into your terraform state
- cloudacademy series - This is a collection of exercises that were pulled out of a cloudacademy course.
  - Exercise 1 - Simple AWS VPC spanning 2 AZs.
  - Exercise 2 - Advanced AWS VPC spanning 2 AZs with both public and private subnets.
  - Exercise 3 - Same as Exercise 2 but using a different tf technique using "count" meta argument.
  - Exercise 4 - Advanced VPC to host a cloud native application.
  - Exercise 5 - EKS Cluster to deploy pre-built cloud native web app
  - Exercise 6 - Example of using terraform cdk and typescript

# Installing terraform
You can use the following scripts to install the terraform-cli.

### Linux

```
#!/bin/bash
# dowload
cd /tmp
LATEST_TAG=$(curl -sL https://api.github.com/repos/hashicorp/terraform/releases/latest | grep tag_name)
VERSION=$(echo $LATEST_TAG | grep -Eo "(\d+\.)+\d+")
curl -OL https://releases.hashicorp.com/terraform/${VERSION}/terraform_${VERSION}_linux_amd64.zip

# install
unzip terraform_${VERSION}_linux_amd64.zip
mv terraform /usr/local/bin/

# auto-completion setup
terraform -install-autocomplete

# test
terraform version
```

### macos

```
#!/bin/bash
# dowload
cd /tmp
LATEST_TAG=$(curl -sL https://api.github.com/repos/hashicorp/terraform/releases/latest | grep tag_name)
VERSION=$(echo $LATEST_TAG | grep -Eo "(\d+\.)+\d+")
curl -OL https://releases.hashicorp.com/terraform/${VERSION}/terraform_${VERSION}_darwin_amd64.zip

# install
unzip terraform_${VERSION}_darwin_amd64.zip
mv terraform /usr/local/bin/

# autocompletion
terraform -install-autocomplete
terraform version

```

## TFEnv

TFEnv is a version manager for terraform.  https://github.com/tfutils/tfenv
This tool allows you to specify a terraform version in a configuration file that will automatically be downloaded and used when running terraform commands.
We use this tool in our infra-configs repo.

You can follow the link above on how this tool can be used.  In our infra-configs repo we use a .terraform-version file at the root of the repo to manage which version is used.  For these exercises you can use the latest version of terraform.

### Install tfenv via Homebrew

```$ brew install tfenv```

### Install terraform with tfenv
```$ tfenv install latest```




# Additional Ideas

- Map in a map exercise
- working with modules and submodules
- targeted deploys
- Refactoring with variables and locals

Places to look:
- https://developer.hashicorp.com/terraform/tutorials/aws-get-started
- https://developer.hashicorp.com/terraform/tutorials/modules/module-object-attributes
- https://github.com/gruntwork-io/terraform-training-solutions

- https://github.com/ArieHein/terraform-train
