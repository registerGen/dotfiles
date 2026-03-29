return {
  {
    "zbirenbaum/copilot.lua",
    dependencies = {
      "copilotlsp-nvim/copilot-lsp",
    },
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      panel = { enabled = false },
      suggestion = {
        auto_trigger = true,
        enabled = true,
        keymap = {
          accept = "<C-a>",
        },
      },
      nes = {
        auto_trigger = true,
        enabled = true,
        keymap = {
          accept_and_goto = "<M-a>",
        },
      }
    },
  },
}
