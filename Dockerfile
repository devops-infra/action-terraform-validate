# Instead of building from scratch pull my other docker image
FROM devopsinfra/docker-terragrunt:slim-tf-latest AS builder

FROM ubuntu:questing-20251007

# Disable interactive mode
ENV DEBIAN_FRONTEND=noninteractive

# Copy all needed files
COPY --from=builder /usr/bin/terraform /usr/bin/
COPY entrypoint.sh /usr/bin/

# Install needed packages
SHELL ["/bin/bash", "-euxo", "pipefail", "-c"]
# hadolint ignore=DL3008
RUN chmod +x /usr/bin/entrypoint.sh /usr/bin/terraform ;\
  apt-get update -y ;\
  apt-get install --no-install-recommends -y \
    bash \
    curl \
    git ;\
  apt-get clean ;\
  rm -rf /var/lib/apt/lists/*

# Finish up
CMD ["terraform --version"]
WORKDIR /github/workspace
ENTRYPOINT ["entrypoint.sh"]
