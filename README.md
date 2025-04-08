# My dotfiles, managed using [just](https://just.systems)

## How this works

`just` is used to create scripts, that allow:
    - using `envsubst` to template files prefixed with `+`
    - using `rsync` (falling back to GNU `cp`) to copy the raw or templated files to the correct location

Each directory contains the files to link and, optionnaly, a `dots.env` file containing env vars:
    - `dots_target_dir` lets you specify where to copy the file tree. For instance, for `nvim`, it is set to `$HOME/.config/nvim`


## Templating

The files can be templated, using variables from both `variables.just` and `.env`, which is a symlink to a theme variables file.
This allows for a unified colorscheme across all managed dotfiles.

## TODO

- [ ] Manage packages
