return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "b0o/SchemaStore.nvim",
      version = false, -- last release is way too old
    },
    ---@type PluginLspOpts
    opts = {
      -- make sure mason installs the server
      ---@type lspconfig.options
      servers = {
        pyright = {},
        yamlls = {
          -- lazy-load schemastore when needed
          on_new_config = function(new_config)
            new_config.settings.yaml.schemas = new_config.settings.yaml.schemas or {}
            vim.list_extend(new_config.settings.yaml.schemas, require("schemastore").yaml.schemas())
          end,
          settings = {
            redhat = { telemetry = { enabled = false } },
            yaml = {
              keyOrdering = false,
              format = {
                enable = true,
              },
              hover = true,
              completion = true,
              validate = true,
              schemaStore = {
                -- Must disable built-in schemaStore support to use
                -- schemas from SchemaStore.nvim plugin
                enable = false,
                -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                url = "",
              },
              schemas = require("schemastore").yaml.schemas(),
              customTags = {
                "!Base64",
                "!Cidr",
                "!And",
                "!Equals",
                "!If",
                "!Not",
                "!Or",
                "!Condition",
                "!FindInMap sequence",
                "!GetAtt scalar",
                "!GetAZs",
                "!ImportValue",
                "!Join sequence",
                "!Select",
                "!Split",
                "!Sub",
                "!Transform",
                "!Ref scalar",
              },
            },
          },
        },
      },
    },
  },
}
