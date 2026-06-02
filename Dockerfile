FROM hashicorp/terraform:1.15 AS terraform

FROM alpine:3.23.4

# Copy all needed files
COPY --from=terraform /bin/terraform /usr/bin/terraform
COPY entrypoint.sh /usr/bin/
COPY alpine-packages.txt /tmp/alpine-packages.txt

# Install needed packages
SHELL ["/bin/sh", "-euxo", "pipefail", "-c"]
# hadolint ignore=DL3018
RUN set -eux; \
  xargs -r apk add --no-cache < /tmp/alpine-packages.txt; \
  chmod +x /usr/bin/entrypoint.sh /usr/bin/terraform; \
  terraform version; \
  git --version; \
  curl --version; \
  rm -rf /var/cache/*; \
  rm -rf /root/.cache/*; \
  rm -rf /tmp/*

# Finish up
CMD ["terraform", "version"]
WORKDIR /github/workspace
ENTRYPOINT ["entrypoint.sh"]
