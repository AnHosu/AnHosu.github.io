#!/bin/bash
set -euxo pipefail
cat header.yml > index.html
cat ~/bayes-opt/07-initial-designs/index.html >> index.html
cp -r ~/bayes-opt/07-initial-designs/index_files index_files
