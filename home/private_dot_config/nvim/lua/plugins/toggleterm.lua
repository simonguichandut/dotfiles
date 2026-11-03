return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      direction = "float",
      terminal_mappings = true,
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)

      vim.keymap.set("n", "<leader>T", function()
        local terminal = require("toggleterm.terminal")

        for _, term in ipairs(terminal.get_all(true)) do
          term:shutdown()
        end

        terminal.Terminal:new({
          cmd = vim.o.shell,
          dir = vim.fn.getcwd(),
          direction = "float",
          close_on_exit = true,
        }):open()
      end, { desc = "Open fresh floating terminal" })

      vim.keymap.set("t", "<C-q>", function()
        local _, term = require("toggleterm.terminal").identify()
        if term then term:shutdown() end
      end, { desc = "Close floating terminal" })
    end,
  },
}
