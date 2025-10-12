# GitHub Action validating Terraform modules

**GitHub Action automatically validating Terraform modules.**


## 📦 Available on
- **Docker Hub:** [devopsinfra/action-terraform-validate:latest](https://hub.docker.com/repository/docker/devopsinfra/action-terraform-validate)
- **GitHub Packages:** [ghcr.io/devops-infra/action-terraform-validate:latest](https://github.com/devops-infra/action-terraform-validate/pkgs/container/action-terraform-validate)


## ✨ Features
* Main action is using `terraform validate`.
* It's a stripped down image of my other creation - [devops-infra/docker-terragrunt](https://github.com/devops-infra/docker-terragrunt) - framework for managing Infrastructure-as-a-Code.
* it's main use will be everywhere where [Terraform](https://github.com/hashicorp/terraform) or [OpenTofu](https://github.com/opentofu/opentofu) is used and is great for statically or actively checking modules' sources.


## 📊 Badges
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


## 📖 API Reference

```yaml
    - name: Validate Terraform modules
      uses: devops-infra/action-terraform-validate@v0.4.0
      with:
        dir_filter: modules
```

### 🔧 Input Paremeters

| Input        | Required | Default | Description                                                                          |
|:-------------|:--------:|:-------:|--------------------------------------------------------------------------------------|
| `dir_filter` |    No    |   `*`   | Prefixes or sub-directories to search for Terraform modules. Use comma as separator. |


## 💻 Usage Examples

### 📝 Basic
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
      uses: actions/checkout@v5

    - name: Validate Terraform configuration
      uses: devops-infra/action-terraform-validate@v0.4.0
```

### 🔀 Advanced
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
      uses: actions/checkout@v5

    - name: Validate Terraform modules
      uses: devops-infra/action-terraform-validate@v0.4.0
      with:
        dir_filter: modules/aws,modules/gcp
```

## 🏷️ Version Tags: vX, vX.Y, vX.Y.Z
This action supports three tag levels for flexible versioning:
- `vX`: latest patch of the major version (e.g., `v1`).
- `vX.Y`: latest patch of the minor version (e.g., `v1.2`).
- `vX.Y.Z`: fixed to a specific release.


## 🤝 Contributing
Contributions are welcome! See [CONTRIBUTING](https://github.com/devops-infra/.github/blob/master/CONTRIBUTING.md).
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


## 📄 License
MIT — see [LICENSE](LICENSE).


## 💬 Support
If you have any questions or need help, please:
- Create an [issue](https://github.com/devops-infra/action-terraform-validate/issues)
- Star this repository if you find it useful!
