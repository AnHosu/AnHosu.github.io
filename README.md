# my-website
Repo for my website

## Writing posts

Posts with code are written in Quarto and rendered locally to Hugo Markdown; CI only runs Hugo.

1. Create `content/post/<slug>/index.qmd` with Hugo front matter (`title`, `date`, `tags`, `math: true` for equations) and an engine: `jupyter: python3` (Python), `jupyter: rust` (Rust via evcxr), or R chunks (knitr).
2. Render with `quarto render content/post/<slug>/index.qmd`, or `quarto render` for all posts. Results are cached in `_freeze/` (git-ignored), so unchanged posts aren't re-executed.
3. Preview with `hugo server`, then commit `index.qmd`, the generated `index.md` and `index_files/`.

Python dependencies live in `pyproject.toml`; add them with `uv add <package>`.

R dependencies are locked in `renv.lock`, and R started in the repo uses the project library in `renv/`. After using a new package in a post, install it with `renv::install("<package>")` and record it with `renv::snapshot()`, which finds packages by scanning the `.qmd` files. Restore everything with `renv::restore()`. Legacy blogdown posts (`index.Rmd`) are excluded via `.renvignore`.

## Linting Python posts

Ruff can't read `.qmd` files, but it lints Jupyter notebooks. Convert the post to a notebook outside the repo, then check it:

```sh
quarto convert content/post/<slug>/index.qmd --output /tmp/post.ipynb
uv run ruff check --config pyproject.toml /tmp/post.ipynb
```

The rules are set under `[tool.ruff.lint]` in `pyproject.toml`; they include naming (lowercase variable names) and type annotations. `--config` is needed because the notebook sits outside the repo, where Ruff wouldn't find `pyproject.toml` on its own. Findings are reported as `cell N:line:column`, where cells are counted from the start of the document, including text cells.
