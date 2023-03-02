#!/bin/bash
echo "::group::Pushing helm package to registry"
export HELM_REGISTRY=$(node -p "require('./package.json').helm.registry");
export HELM_EXPERIMENTAL_OCI=1
helm push ./monitoring* oci://"${HELM_REGISTRY}"
echo "::endgroup::"