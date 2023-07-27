return {
  { "f-person/git-blame.nvim" },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      local icons = require("lazyvim.config").icons
      local Util = require("lazyvim.util")
      local git_blame = require("gitblame")
      local clients_lsp = function()
        local bufnr = vim.api.nvim_get_current_buf()

        local clients = vim.lsp.get_active_clients({ bufnr })
        if next(clients) == nil then
          return ""
        end

        local c = {}
        for _, client in pairs(clients) do
          table.insert(c, client.name)
        end
        return "\u{f085} [" .. table.concat(c, ", ") .. "]"
      end

      return {
        options = {
          theme = "auto",
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "alpha" } },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = {
            { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
          },
          lualine_x = { clients_lsp },
          lualine_y = {
            { "progress", separator = " ", padding = { left = 1, right = 1 } },
          },
          lualine_z = {
            { "location", padding = { left = 0, right = 1 } },
          },
        },
        extensions = { "neo-tree", "lazy" },
      }
    end,
  },
}
