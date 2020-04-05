# Validate Terraform modules

Dockerized ([christophshyper/action-terraform-validate](https://hub.docker.com/repository/docker/christophshyper/action-terraform-validate)) GitHub Action automatically validating Terraform modules.

Container is a stripped down image of my other creation - [ChristophShyper/docker-terragrunt](https://github.com/ChristophShyper/docker-terragrunt) - framework for managing Infrastructure-as-a-Code.

So it's main use will be everywhere where [Terraform](https://github.com/hashicorp/terraform) is used and is great for statically or actively checking modules' sources.

Main action is using `terraform validate`.


## Badge swag
[
![GitHub](https://img.shields.io/badge/github-ChristophShyper%2Faction--terraform--validate-brightgreen.svg?style=flat-square&logo=github)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/christophshyper/action-terraform-validate?color=brightgreen&label=Code%20size&style=flat-square&logo=github)
![GitHub last commit](https://img.shields.io/github/last-commit/christophshyper/action-terraform-validate?color=brightgreen&label=Last%20commit&style=flat-square&logo=github)
![On each commit push](https://img.shields.io/github/workflow/status/christophshyper/action-terraform-validate/On%20each%20commit%20push?color=brightgreen&label=Actions&logo=github&style=flat-square)
](https://github.com/christophshyper/action-terraform-validate "shields.io")

[
![DockerHub](https://img.shields.io/badge/docker-christophshyper%2Faction--terraform--validate-blue.svg?style=flat-square&logo=docker)
![Dockerfile size](https://img.shields.io/github/size/christophshyper/action-terraform-validate/Dockerfile?label=Dockerfile&style=flat-square&logo=docker)
![Docker Pulls](https://img.shields.io/docker/pulls/christophshyper/action-terraform-validate?color=blue&label=Pulls&logo=docker&style=flat-square)
![Docker version](https://img.shields.io/docker/v/christophshyper/action-terraform-validate?color=blue&label=Version&logo=docker&style=flat-square)
](https://hub.docker.com/r/christophshyper/action-terraform-validate "shields.io")


## Usage

Input Variable | Required | Default |Description
:--- | :---: | :---: | :---
dir_filter | No | `*` | Prefixes or sub-directories to search for Terraform modules. Use comma as separator.

## Examples


```yaml
name: Check TFLint
on:
  push:
    branches:
      - "**"
jobs:
  format-hcl:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@v2
    - name: Check linting of Terraform files
      uses: docker://christophshyper/action-terrraform-validate:latest
```


```yaml
name: Check TFLint with custom config
on:
  push:
    branches:
      - "**"
jobs:
  format-hcl:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@v2
    - name: Check linting of Terraform modules
      uses: docker://christophshyper/action-terrraform-validate:latest
      with:
        dir_filter: modules/aws,modules/gcp
```
