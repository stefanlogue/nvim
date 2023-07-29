return {
  {
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    enabled = true,
    config = function()
      require("lsp_lines").setup()
    end,
  },
}
