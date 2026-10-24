#!/usr/bin/env bash
set -euo pipefail

# Python environment used by Quarto's Jupyter engine (QUARTO_PYTHON points here)
uv sync

# R packages for R posts, as recorded in renv.lock
Rscript -e 'renv::restore(prompt = FALSE)'

# Rust Jupyter kernel for Rust posts
EVCXR_VERSION=0.22.0
curl -fsSL "https://github.com/evcxr/evcxr/releases/download/v${EVCXR_VERSION}/evcxr_jupyter-v${EVCXR_VERSION}-$(uname -m)-unknown-linux-gnu.tar.gz" \
  | tar -xz --strip-components=1 -C "${CARGO_HOME:-$HOME/.cargo}/bin" --wildcards '*/evcxr_jupyter'
evcxr_jupyter --install

hugo version
quarto check jupyter
quarto check knitr
