return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = false,
    opts = {
      filesystem = {
        hijack_netrw_behavior = "open_current",
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = true,
        },
        follow_current_file = {
          enabled = true,
        },
      },
    },
    config = function(_, opts)
      require("neo-tree").setup(opts)

      vim.api.nvim_create_autocmd("VimEnter", {
        once = true,
        callback = function()
          local path = vim.fn.argv(0)
          if path ~= "" and vim.fn.isdirectory(path) == 1 then
            require("neo-tree.command").execute({
              action = "focus",
              source = "filesystem",
              position = "current",
              dir = vim.fn.fnamemodify(path, ":p"),
            })
          end
        end,
      })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      {
        "<leader>E",
        "<cmd>Neotree toggle position=left<cr>",
        desc = "Toggle file explorer",
      },
    },
  },
}
