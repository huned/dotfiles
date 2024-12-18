require("codecompanion").setup({
  display = {
    chat = {
      window = {
        layout = "horizontal",
        width = 1,
        height = 0.5,
      }
    }
  },
  adapters = {
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
              default = "claude-3-5-sonnet-20241022",
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
