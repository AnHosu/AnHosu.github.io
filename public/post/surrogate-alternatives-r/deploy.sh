#!/bin/bash
set -euxo pipefail
cat header.yml > index.html
cat ~/bayes-opt/06-surrogate-alternatives/index.html >> index.html
cp -r ~/bayes-opt/06-surrogate-alternatives/index_files index_files
