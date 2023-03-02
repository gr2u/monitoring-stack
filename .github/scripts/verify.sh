#!/bin/bash
export HELM_REGISTRY=$(node -p "require('./package.json').helm.registry");
echo "::group::Helm install"
curl -fsSL https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash;
echo "::endgroup::"

echo "::group::Helm lint"
helm lint ./helm
echo "::endgroup::"

echo "::group::Helm registry login"
helm registry login $HELM_REGISTRY --username="${REGISTRY_USERNAME}" --password="${REGISTRY_PASSWORD}"
echo "::endgroup::"