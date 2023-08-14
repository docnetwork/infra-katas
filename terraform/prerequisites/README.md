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
