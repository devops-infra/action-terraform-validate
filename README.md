# GitHub Action validating Terraform modules

**GitHub Action automatically validating Terraform modules.**

Dockerized as [devopsinfra/action-terraform-validate](https://hub.docker.com/repository/docker/devopsinfra/action-terraform-validate).

Features:
* Main action is using `terraform validate`.
* It's a stripped down image of my other creation - [devops-infra/docker-terragrunt](https://github.com/devops-infra/docker-terragrunt) - framework for managing Infrastructure-as-a-Code.
* it's main use will be everywhere where [Terraform](https://github.com/hashicorp/terraform) is used and is great for statically or actively checking modules' sources.


## Badge swag
[![Master branch](https://github.com/devops-infra/action-terraform-validate/workflows/Master%20branch/badge.svg)](https://github.com/devops-infra/action-terraform-validate/actions?query=workflow%3A%22Master+branch%22)
[![Other branches](https://github.com/devops-infra/action-terraform-validate/workflows/Other%20branches/badge.svg)](https://github.com/devops-infra/action-terraform-validate/actions?query=workflow%3A%22Other+branches%22)
<br>
[
![GitHub repo](https://img.shields.io/badge/GitHub-devops--infra%2Faction--terraform--validate-blueviolet.svg?style=plastic&logo=github)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/devops-infra/action-terraform-validate?color=blueviolet&label=Code%20size&style=plastic&logo=github)
![GitHub last commit](https://img.shields.io/github/last-commit/devops-infra/action-terraform-validate?color=blueviolet&logo=github&style=plastic&label=Last%20commit)
![GitHub license](https://img.shields.io/github/license/devops-infra/action-terraform-validate?color=blueviolet&logo=github&style=plastic&label=License)
](https://github.com/devops-infra/action-terraform-validate "shields.io")
<br>
[
![DockerHub](https://img.shields.io/badge/DockerHub-devopsinfra%2Faction--terraform--validate-blue.svg?style=plastic&logo=docker)
![Docker version](https://img.shields.io/docker/v/devopsinfra/action-terraform-validate?color=blue&label=Version&logo=docker&style=plastic)
![Image size](https://img.shields.io/docker/image-size/devopsinfra/action-terraform-validate/latest?label=Image%20size&style=plastic&logo=docker)
![Docker Pulls](https://img.shields.io/docker/pulls/devopsinfra/action-terraform-validate?color=blue&label=Pulls&logo=docker&style=plastic)
](https://hub.docker.com/r/devopsinfra/action-terraform-validate "shields.io")


## Reference

```yaml
    - name: Validate Terraform modules
      uses: devops-infra/action-terraform-validate@v0.3.1
      with:
        dir_filter: modules
```

| Input Variable | Required | Default | Description                                                                          |
| -------------- | -------- | ------- | ------------------------------------------------------------------------------------ |
| dir_filter     | No       | `*`     | Prefixes or sub-directories to search for Terraform modules. Use comma as separator. |

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
      uses: actions/checkout@v2
    - name: Validate Terraform configuration
      uses: devops-infra/action-terraform-validate@v0.3.1
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
      uses: actions/checkout@v2
    - name: Validate Terraform modules
      uses: devops-infra/action-terraform-validate@v0.3.1
      with:
        dir_filter: modules/aws,modules/gcp
```
