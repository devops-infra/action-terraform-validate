#!/usr/bin/env bash

RETURN=0

WORK_DIR=/github/workspace

# Split dir_filter into array
IFS=',' read -r -a ARRAY <<< "${INPUT_DIR_FILTER}"

# Go through all dir prefixes
for PREFIX in "${ARRAY[@]}"; do
    # Go through all matching directories
    for DIRECTORY in $(ls -d ${PREFIX}*/); do
        cd ${DIRECTORY}
        echo -e "\nDirectory: ${DIRECTORY}"
        terraform init || RETURN=1
        terraform validate || RETURN=1
        rm -rf .terraform/
        cd ${WORK_DIR}
    done
done

exit ${RETURN}
