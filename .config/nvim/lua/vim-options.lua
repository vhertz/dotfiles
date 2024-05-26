-- Basic settings
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.cursorline = true -- Highlight the current line
vim.opt.wrap = false -- Do not wrap lines
vim.opt.scrolloff = 8 -- Keep 8 lines visible above/below the cursor
vim.opt.sidescrolloff = 8 -- Keep 8 columns visible left/right of the cursor
vim.g.mapleader = " " -- Use the space key as the leader

-- Tab and indent settings
vim.opt.tabstop = 4 -- Number of spaces that a <Tab> in the file counts for
vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.autoindent = true -- Copy indent from the current line when starting a new line
vim.opt.smartindent = true -- Automatically insert one extra level of indentation in some cases
vim.opt.cindent = true -- Enable C-style indentation

-- Search settings
vim.opt.hlsearch = true -- Highlight all matches of the previous search pattern
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true -- Override the 'ignorecase' option if the search pattern contains upper case characters
vim.opt.incsearch = true -- Show the match while typing

-- Clipboard settings
vim.opt.clipboard:append("unnamedplus") -- Use the system clipboard

-- Status line and tab line
vim.opt.laststatus = 3 -- Always display the status line
vim.opt.showtabline = 2 -- Always display the tab line

-- Backspace settings
vim.opt.backspace = { "indent", "eol", "start" }

-- Enhanced command-line completion
vim.opt.wildmenu = true -- Enable command-line completion menu
vim.opt.wildmode = { "longest:full", "full" } -- Command-line completion mode

-- Other useful settings
vim.opt.updatetime = 300 -- Faster completion (default is 4000 ms)
vim.opt.signcolumn = "yes" -- Always show the sign column

