#!/bin/bash
echo "::group::Adding helm repos"
export HELM_CHART_VERSION=$(node -p "require('./package.json').version");

helm repo add prometheus-community https://grafana.github.io/helm-charts 
helm repo add grafana https://prometheus-community.github.io/helm-charts
helm repo update 
echo "::endgroup::"

echo "::group::Building helm dependencies and package"
helm dep build ./helm
helm package ./helm --version="${HELM_CHART_VERSION}"
echo "::endgroup::"