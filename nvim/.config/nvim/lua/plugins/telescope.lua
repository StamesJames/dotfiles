return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-ui-select.nvim",
    },
    opts = {
      pickers = {
        find_files = {
          -- theme = "ivy"
        },
      },
      extensions = {
        ["ui-select"] = {},
        fzf = {},
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("fzf")
      telescope.load_extension("ui-select")

      local live_multigrep = require("config.telescope.multigrep").live_multigrep

      -- key bindings
      vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags)
      vim.keymap.set("n", "<leader>fd", require("telescope.builtin").find_files)
      vim.keymap.set("n", "<leader>fg", live_multigrep)
      vim.keymap.set("n", "<leader>en", function()
        require("telescope.builtin").find_files({
          cwd = vim.fn.stdpath("config"),
        })
      end)
      vim.keymap.set("n", "<leader>ep", function()
        require("telescope.builtin").find_files({
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
        })
      end)
      vim.keymap.set("n", "<leader>fn", function()
        require("telescope.builtin").find_files({
          cwd = vim.fn.expand("~/Nextcloud/notes/"),
        })
      end)
    end,
  },
}
