#! /bin/bash
set -euo pipefail

# go-quorum distributions versions array
declare -a ver=("v2.2.1" "v2.2.2" "v2.2.3" "v2.2.4" "v2.2.5" "v2.3.0" "v2.4.0" "v2.5.0" "v2.6.0" "v2.7.0" "v20.10.0" "v21.1.0")

# to be updated based on requirement
DIST_IDENTIFIER="geth"
CLOUDSMITH_REPO="consensys/go-quorum"
CLOUDSMITH_API_KEY=""

python3 -m pip install --upgrade cloudsmith-cli

for VERSION in "${ver[@]}"; do

  SUMMARY="Geth - ${VERSION}"
  LINUX_NAME="${DIST_IDENTIFIER}_${VERSION}_linux_amd64.tar.gz"
  DARWIN_NAME="${DIST_IDENTIFIER}_${VERSION}_darwin_amd64.tar.gz"

  cloudsmith push raw $CLOUDSMITH_REPO "./${LINUX_NAME}" --name "${LINUX_NAME}" --version "${VERSION}" --republish --summary "${SUMMARY} binary distribution" --description "${SUMMARY} binary distribution for linux" --content-type 'application/tar+gzip' -k $CLOUDSMITH_API_KEY
  cloudsmith push raw $CLOUDSMITH_REPO "./${DARWIN_NAME}" --name "${DARWIN_NAME}" --version "${VERSION}" --republish --summary "${SUMMARY} binary distribution" --description "${SUMMARY} binary distribution for darwin" --content-type 'application/tar+gzip' -k $CLOUDSMITH_API_KEY

done
