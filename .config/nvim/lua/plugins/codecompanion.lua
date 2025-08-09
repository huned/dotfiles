require("codecompanion").setup({
  --- display = {
  ---   chat = {
  ---     window = {
  ---       layout = "horizontal",
  ---       width = 1,
  ---       height = 0.5,
  ---     }
  ---   }
  --- },
  adapters = {
    opts = {
      show_defaults = false,
    },
    ollama = function ()
      return require("codecompanion.adapters").extend("ollama", {
          name = "qwen3",
          schema = {
            model = {
              default = "qwen3:4b",
            },
            num_ctx = {
              default = 16384,
            },
            num_predict = {
              default = -1,
            }
          },
        })
    end,
    openai = function()
      return require("codecompanion.adapters").extend("openai", {
          env = {
            api_key = "OPENAI_API_KEY",
          },
        })
    end,
    anthropic = function()
      return require("codecompanion.adapters").extend("anthropic", {
          schema = {
            model = {
              -- default = "claude-3-5-sonnet-20241022",
              default = "claude-3-7-sonnet-20250219",
            },
          },
        })
    end,
  },
  strategies = {
    chat = {
      adapter = "anthropic",
    },
    inline = {
      adapter = "anthropic",
    },
  },
})
