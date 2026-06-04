# GitHub Action validating Terraform modules
**GitHub Action automatically validating Terraform modules.**


## 📦 Available on
- **Docker Hub:** [devopsinfra/action-terraform-validate:latest](https://hub.docker.com/repository/docker/devopsinfra/action-terraform-validate)
- **GitHub Packages:** [ghcr.io/devops-infra/action-terraform-validate:latest](https://github.com/devops-infra/action-terraform-validate/pkgs/container/action-terraform-validate)


## ✨ Features
* Main action is using `terraform validate`.
* Its main use will be everywhere where [Terraform](https://github.com/hashicorp/terraform) or [OpenTofu](https://github.com/opentofu/opentofu) is used and is great for statically or actively checking modules' sources.


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


## 🏷️ Version Tags: vX, vX.Y, vX.Y.Z
This action supports three tag levels for flexible versioning:
- `vX`: latest patch of the major version (e.g., `v1`).
- `vX.Y`: latest patch of the minor version (e.g., `v1.2`).
- `vX.Y.Z`: fixed to a specific release (e.g., `v1.2.3`).




## 📖 API Reference
```yaml
    - name: Validate Terraform modules
      uses: devops-infra/action-terraform-validate@v1.0.6
      with:
        dir_filter: modules
```


### 🔧 Input Parameters
| Input        | Required | Default | Description                                                                          |
|:-------------|:--------:|:-------:|--------------------------------------------------------------------------------------|
| `dir_filter` |    No    |   `*`   | Prefixes or sub-directories to search for Terraform modules. Use comma as separator. |


## 💻 Usage Examples

### 📝 Basic Example
Validate whole Terraform setup in repository root.

```yaml
name: Validate Terraform
on:
  push
jobs:
  terraform-validate:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout repository
      uses: actions/checkout@v6

    - name: Validate Terraform configuration
      uses: devops-infra/action-terraform-validate@v1.0.6
```

### 🔀 Advanced Example
Validate Terraform modules only in `modules/aws` and `modules/gcp` directories.

```yaml
name: Validate Terraform
on:
  push
jobs:
  terraform-validate:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout repository
      uses: actions/checkout@v6

    - name: Validate Terraform modules
      uses: devops-infra/action-terraform-validate@v1.0.6
      with:
        dir_filter: modules/aws,modules/gcp
```


### 🎯 Use specific version
Pick the tag level based on your stability needs:
- `vX.Y.Z`: exact immutable release (most predictable)
- `vX.Y`: latest patch within one minor line
- `vX`: latest patch within one major line

```yaml
name: Use pinned action version
on: [push]
jobs:
  terraform-validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v6

      - uses: devops-infra/action-terraform-validate@v1.0.6
        id: pin-patch

      - uses: devops-infra/action-terraform-validate@v1.0
        id: pin-minor

      - uses: devops-infra/action-terraform-validate@v1
        id: pin-major
```


## 🤝 Contributing
Contributions are welcome! See [CONTRIBUTING](https://github.com/devops-infra/.github/blob/master/CONTRIBUTING.md).
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


## 📄 License
MIT — see [LICENSE](LICENSE).


## 💬 Support
If you have any questions or need help, please:
- Create an [issue](https://github.com/devops-infra/action-terraform-validate/issues)
- Star this repository if you find it useful!

## 🧪 End-to-End Validation
Use the manual workflow `.github/workflows/manual-e2e-validate.yml` to validate this action against the centralized E2E repository.

- `mode=image` validates a published image tag (recommended for `-test` and `-rc` release checks).
- `mode=ref` validates ref-oriented E2E paths against stable pinned action refs.

CI/CD automation also runs these E2E checks automatically:

- Pull requests: E2E validation runs through reusable org workflows.
- Release branch prepare: E2E validation runs against release candidate artifacts (`-rc`).
- Release create: E2E validation runs against production release artifacts.

Example trigger inputs:

```text
mode=ref
```

```text
mode=image
image_tag=v1.2.3-test
```

## Forking
To publish images from a fork, set these variables so Task uses your registry identities:
`DOCKER_USERNAME`, `DOCKER_ORG_NAME`, `GITHUB_USERNAME`, `GITHUB_ORG_NAME`.

Two supported options (environment variables take precedence over `.env`):
```bash
# .env (local only, not committed)
DOCKER_USERNAME=your-dockerhub-user
DOCKER_ORG_NAME=your-dockerhub-org
GITHUB_USERNAME=your-github-user
GITHUB_ORG_NAME=your-github-org
```

```bash
# Shell override
DOCKER_USERNAME=your-dockerhub-user \
DOCKER_ORG_NAME=your-dockerhub-org \
GITHUB_USERNAME=your-github-user \
GITHUB_ORG_NAME=your-github-org \
task docker:build
```

Recommended setup:
- Local development: use a `.env` file.
- GitHub Actions: set repo variables for the four values above, and secrets for `DOCKER_TOKEN` and `GITHUB_TOKEN`.

Publish images without a release:
- Run the `(Manual) Release Create` workflow with `build_only: true` to build and push images without tagging a release.
