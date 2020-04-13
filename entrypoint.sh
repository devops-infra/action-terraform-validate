#!/usr/bin/env bash

# Return code
RET_CODE=0

WORK_DIR=/github/workspace

# Split dir_filter into array
IFS=',' read -r -a ARRAY <<< "${INPUT_DIR_FILTER}"

# Go through all dir prefixes
for PREFIX in "${ARRAY[@]}"; do
    # Go through all matching directories
    for DIRECTORY in $(ls -d ${PREFIX}*/); do
        cd ${DIRECTORY}
        echo -e "\nDirectory: ${DIRECTORY}"
        terraform init || RET_CODE=1
        terraform validate || RET_CODE=1
        rm -rf .terraform/
        cd ${WORK_DIR}
    done
done

exit ${RET_CODE}
