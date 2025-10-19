#!/usr/bin/env bash
set -Eeuo pipefail

# Return code
RET_CODE=0

# Optional debug logging: pass `debug: true` in the action inputs to enable
[[ "${INPUT_DEBUG:-false}" == "true" ]] && set -x

info()  { printf "[INFO] ℹ️ %s\n" "$*"; }
#shellcheck disable=SC2329
warn()  { printf "[WARN] ⚠️ %s\n" "$*" >&2; }
#shellcheck disable=SC2329
error() { printf "[ERROR] ❌ %s\n" "$*" >&2; }

write_output() {
  local kv="$1"
  if [[ -n "${GITHUB_OUTPUT:-}" ]]; then
    printf "%s\n" "${kv}" >> "${GITHUB_OUTPUT}"
  else
    info "[LOCAL] output -> ${kv}"
  fi
}

trap 'error "Action failed. Check logs above."' ERR

# Inputs
DIR_FILTER="${INPUT_DIR_FILTER:-.}"
GITHUB_TOKEN="${INPUT_GITHUB_TOKEN:-}"

info "Inputs:"
info "  dir_filter: ${DIR_FILTER:+<set>}${DIR_FILTER:-<empty>}"
if [[ -n "${GITHUB_TOKEN:-}" ]]; then
  info "  github_token: <hidden>"
else
  info "  github_token: <empty>"
fi

WORK_DIR=/github/workspace

# Split dir_filter into array
IFS=',' read -r -a ARRAY <<< "${INPUT_DIR_FILTER}"

# Go through all dir prefixes
for PREFIX in "${ARRAY[@]}"; do
    # Go through all matching directories
    for DIRECTORY in "${PREFIX}"*; do
        [[ -d "${DIRECTORY}" ]] || break
        info "Using directory: ${DIRECTORY}"
        cd "${WORK_DIR}/${DIRECTORY}" || RET_CODE=1
        terraform init || RET_CODE=1
        terraform validate || RET_CODE=1
        rm -rf .terraform/
        cd "${WORK_DIR}" || RET_CODE=1
    done
done

write_output "dir_filter=${DIR_FILTER}"

exit ${RET_CODE}
