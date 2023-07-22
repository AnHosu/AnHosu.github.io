#!/bin/bash
set -euxo pipefail
cat header.yml > index.html
cat ~/bayes-opt/08-test-functions/index.html >> index.html
cp -r ~/bayes-opt/08-test-functions/index_files index_files
