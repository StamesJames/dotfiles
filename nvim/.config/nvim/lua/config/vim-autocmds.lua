return {
  setup = function()
    -- autocmds
    vim.api.nvim_create_autocmd("TextYankPost", {
      desc = "Higlight when yanking text",
      group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
      callback = function()
        vim.highlight.on_yank()
      end,
    })

    vim.api.nvim_create_autocmd("TermOpen", {
      desc = "Setting Configs for opened vim terminals",
      group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
      callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
      end,
    })
  end,
}
