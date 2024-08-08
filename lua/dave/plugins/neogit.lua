return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration

    'nvim-telescope/telescope.nvim', -- optional
  },
  config = function()
    require('neogit').setup {

      vim.keymap.set('n', '<leader>gb', ':Neogit branch<CR>', { desc = 'Neo[g]it [b]ranch' }),
      vim.keymap.set('n', '<leader>gc', ':Neogit commit<CR>', { desc = 'Neo[g]it [c]ommit' }),
      vim.keymap.set('n', '<leader>gf', ':Neogit fetch<CR>', { desc = 'Neo[g]it [f]etch' }),
      vim.keymap.set('n', '<leader>gp', ':Neogit push<CR>', { desc = 'Neo[g]it [p]ush' }),
      vim.keymap.set('n', '<leader>gP', ':Neogit pull<CR>', { desc = 'Neo[g]it [P]ull' }),
      vim.keymap.set('n', '<leader>gg', ':Neogit<CR>', { desc = 'Neo[g]it status' }),
    }
  end,
}
