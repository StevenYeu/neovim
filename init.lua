vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.python3_host_prog = '/Users/stevenyeu/.pyenv/shims/python'

-- [[ Install `lazy.nvim` plugin manager ]]
require('lazy-bootstrap')

-- [[ Configure plugins ]]
require('lazy-plugins')

-- [[ Setting options ]]
require('options')

-- [[ Basic Keymaps ]]
require('keymaps')

