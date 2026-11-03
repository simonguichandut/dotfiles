return {
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("monokai-pro").setup({
        filter = "spectrum",
        transparent_background = true,
      })
      vim.cmd.colorscheme("monokai-pro")
      vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#69676c", bg = "NONE" })
      vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#69676c", bg = "NONE" })
    end,
  },
}
