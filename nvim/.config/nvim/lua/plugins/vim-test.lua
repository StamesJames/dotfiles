return {
  {
    "vim-test/vim-test",
    dependencies = {
      "preservim/vimux",
    },
    config = function(_, _)
      vim.keymap.set("n", "<leader>t", ":TestNearest<CR>")
      vim.keymap.set("n", "<leader>T", ":TestFile<CR>")
      vim.keymap.set("n", "<leader>a", ":TestSuit<CR>")
      vim.keymap.set("n", "<leader>l", ":TestLast<CR>")
      vim.keymap.set("n", "<leader>g", ":TestVisit<CR>")
      vim.cmd("let test#stratagy = 'vimux'")
    end,
  },
}
