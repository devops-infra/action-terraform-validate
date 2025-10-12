# Instead of building from scratch pull my other docker image
FROM devopsinfra/docker-terragrunt:slim-tf-latest as builder

# Use a clean tiny image to store artifacts in
FROM alpine:3.22.2

# Copy all needed files
COPY --from=builder /usr/bin/terraform /usr/bin/
COPY entrypoint.sh /usr/bin/

# Install needed packages
RUN set -eux ;\
  chmod +x /usr/bin/entrypoint.sh /usr/bin/terraform ;\
  apk update --no-cache ;\
  apk add --no-cache \
    bash~=5.2 \
    curl~=8.14 \
    git~=2.49 ;\
  rm -rf /var/cache/* ;\
  rm -rf /root/.cache/*

# Finish up
CMD ["terraform --version"]
WORKDIR /github/workspace
ENTRYPOINT ["entrypoint.sh"]
