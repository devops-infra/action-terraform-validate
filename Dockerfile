# Instead of building from scratch pull my other docker image
FROM christophshyper/docker-terragrunt:latest as builder

# Use a clean tiny image to store artifacts in
FROM alpine:3.11

# For http://label-schema.org/rc1/#build-time-labels
ARG BUILD_DATE=2020-04-01T00:00:00Z
ARG VCS_REF=abcdef1
ARG VERSION=v0.0
LABEL \
  com.github.actions.author="Krzysztof Szyper <biotyk@mail.com>" \
  com.github.actions.color="white" \
  com.github.actions.description="GitHub Action that will run terraform validate." \
  com.github.actions.icon="wind" \
  com.github.actions.name="Validate Terraform modules" \
  org.label-schema.build-date="${BUILD_DATE}" \
  org.label-schema.description="GitHub Action that will run terraform validate." \
  org.label-schema.name="action-terraform-validate" \
  org.label-schema.schema-version="1.0"	\
  org.label-schema.url="https://github.com/ChristophShyper/action-terraform-validate" \
  org.label-schema.vcs-ref="${VCS_REF}" \
  org.label-schema.vcs-url="https://github.com/ChristophShyper/action-terraform-validate" \
  org.label-schema.vendor="Krzysztof Szyper <biotyk@mail.com>" \
  org.label-schema.version="${VERSION}" \
  maintainer="Krzysztof Szyper <biotyk@mail.com>" \
  repository="https://github.com/ChristophShyper/action-terraform-validate" \
  alpine="3.11"

# Copy all needed files
COPY --from=builder /usr/bin/terraform /usr/bin/
COPY entrypoint.sh /usr/bin/

# Install needed packages
RUN set -eux \
  && chmod +x /usr/bin/entrypoint.sh /usr/bin/terraform \
  && apk update --no-cache \
  && apk upgrade --no-cache \
  && apk add --no-cache bash \
  && rm -rf /var/cache/* \
  && rm -rf /root/.cache/*

# Finish up
CMD terraform --version
WORKDIR /github/workspace
ENTRYPOINT entrypoint.sh
