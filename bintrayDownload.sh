#! /bin/bash
set -euo pipefail

# download go-quorum distributions
declare -a ver=("v21.1.0" "v20.10.0" "v2.7.0" "v2.6.0" "v2.5.0" "v2.4.0" "v2.3.0" "v2.2.5" "v2.2.4" "v2.2.3" "v2.2.2" "v2.2.1")

## now loop through the above array
for v in "${ver[@]}"
do
  curl -v -L "https://bintray.com/quorumengineering/quorum/download_file?file_path=${v}%2Fgeth_${v}_darwin_amd64.tar.gz" --output "geth_${v}_darwin_amd64.tar.gz"
  curl -v -L "https://bintray.com/quorumengineering/quorum/download_file?file_path=${v}%2Fgeth_${v}_linux_amd64.tar.gz" --output "geth_${v}_linux_amd64.tar.gz"
done
