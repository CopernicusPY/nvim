local nvim_tree = require("nvim-tree")
local api = require("nvim-tree.api")

nvim_tree.setup({
  view = {
    side = "right",
      centralize_selection = true
  },
  diagnostics = {
    enable = true
  },
  git = {
    enable = true,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
  view = {
    side = "right",
  },
  actions = {
    expand_all = {
      exclude = { ".git", "node_modules" }
    }
  }
})

api.tree.toggle()
