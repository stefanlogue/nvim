-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.g.python_host_prog = "/Users/stefanlogue/.pyenv/versions/nvim3.10/bin/python"
vim.g.python3_host_prog = "/Users/stefanlogue/.pyenv/versions/nvim3.10/bin/python"

vim.g.gitblame_display_virtual_text = 0
vim.opt.termguicolors = true

require("telescope").load_extension("refactoring")
require("telescope").load_extension("fzf")

vim.diagnostic.config({
  virtual_lines = {
    highlight_whole_line = false,
  },
})
