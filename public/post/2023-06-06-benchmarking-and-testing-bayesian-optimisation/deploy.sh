#!/bin/bash
set -euxo pipefail
cat header.yml > index.html
cat ~/bayes-opt/08-benchmarking/index.html >> index.html
cp -r ~/bayes-opt/08-benchmarking/index_files index_files
