# GitHub Action validating Terraform modules

GitHub Action automatically validating Terraform modules.

Dockerized as [christophshyper/action-terraform-validate](https://hub.docker.com/repository/docker/christophshyper/action-terraform-validate).

Features:
* Main action is using `terraform validate`.
* It's a stripped down image of my other creation - [devops-infra/docker-terragrunt](https://github.com/devops-infra/docker-terragrunt) - framework for managing Infrastructure-as-a-Code.
* it's main use will be everywhere where [Terraform](https://github.com/hashicorp/terraform) is used and is great for statically or actively checking modules' sources.


## Badge swag
[
![GitHub](https://img.shields.io/badge/github-devops--infra%2Faction--terraform--validate-brightgreen.svg?style=flat-square&logo=github)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/devops-infra/action-terraform-validate?color=brightgreen&label=Code%20size&style=flat-square&logo=github)
![GitHub last commit](https://img.shields.io/github/last-commit/devops-infra/action-terraform-validate?color=brightgreen&label=Last%20commit&style=flat-square&logo=github)
](https://github.com/devops-infra/action-terraform-validate "shields.io")
[![Push to master](https://img.shields.io/github/workflow/status/devops-infra/action-terraform-validate/Push%20to%20master?color=brightgreen&label=Master%20branch&logo=github&style=flat-square)
](https://github.com/devops-infra/action-terraform-validate/actions?query=workflow%3A%22Push+to+master%22)
[![Push to other](https://img.shields.io/github/workflow/status/devops-infra/action-terraform-validate/Push%20to%20other?color=brightgreen&label=Pull%20requests&logo=github&style=flat-square)
](https://github.com/devops-infra/action-terraform-validate/actions?query=workflow%3A%22Push+to+other%22)
<br>
[
![DockerHub](https://img.shields.io/badge/docker-christophshyper%2Faction--terraform--validate-blue.svg?style=flat-square&logo=docker)
![Dockerfile size](https://img.shields.io/github/size/devops-infra/action-terraform-validate/Dockerfile?label=Dockerfile%20size&style=flat-square&logo=docker)
![Image size](https://img.shields.io/docker/image-size/christophshyper/action-terraform-validate/latest?label=Image%20size&style=flat-square&logo=docker)
![Docker Pulls](https://img.shields.io/docker/pulls/christophshyper/action-terraform-validate?color=blue&label=Pulls&logo=docker&style=flat-square)
![Docker version](https://img.shields.io/docker/v/christophshyper/action-terraform-validate?color=blue&label=Version&logo=docker&style=flat-square)
](https://hub.docker.com/r/christophshyper/action-terraform-validate "shields.io")


## Reference

```yaml
    - name: Validate Terraform modules
      uses: devops-infra/action-terraform-validate@master
      with:
        dir_filter: modules
```

Input Variable | Required | Default |Description
:--- | :---: | :---: | :---
dir_filter | No | `*` | Prefixes or sub-directories to search for Terraform modules. Use comma as separator.

## Examples

Validate whole Terraform setup in repository root. Run the Action via GitHub.
```yaml
name: Validate Terraform
on:
  push
jobs:
  terraform-validate:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout repository
      uses: actions/checkout@master
    - name: Validate Terraform configuration
      uses: devops-infra/action-terraform-validate@master
```

Validate Terraform modules only in `modules/aws` and `modules/gcp` directories. Run the Action via DockerHub.
```yaml
name: Validate Terraform
on:
  push
jobs:
  terraform-validate:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout repository
      uses: actions/checkout@master
    - name: Validate Terraform modules
      uses: devops-infra/action-terrraform-validate@master
      with:
        dir_filter: modules/aws,modules/gcp
```
