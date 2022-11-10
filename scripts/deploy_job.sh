#!/usr/bin/env bash

# shellcheck source=./code-engine-utilities.sh
source "${WORKSPACE}/$(get_env ONE_PIPELINE_CONFIG_DIRECTORY_NAME)/scripts/code-engine-utilities.sh"

echo "Deploying your code as Code Engine job...."
deploy-code-engine-job "$(get_env app-name)" "$(load_artifact app-image name)" "${IMAGE_PULL_SECRET_NAME}"

# Bind services, if any
bind-services-to-code-engine-job "$(get_env app-name)"

echo "Checking if job is ready..."
# TODO