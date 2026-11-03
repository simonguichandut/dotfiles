return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      current_line_blame = false,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 500,
        ignore_whitespace = true,
      },
      current_line_blame_formatter = "      <author>, <author_time:%R> • <summary>",
    },
    config = function(_, opts)
      require("gitsigns").setup(opts)

      local function set_blame_highlight()
        vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", {
          fg = "#8b3f48",
          italic = true,
        })
      end

      set_blame_highlight()
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = set_blame_highlight,
      })
    end,
    keys = {
      {
        "<leader>gb",
        function()
          require("gitsigns").toggle_current_line_blame()
        end,
        desc = "Toggle inline Git blame",
      },
    },
  },
}
