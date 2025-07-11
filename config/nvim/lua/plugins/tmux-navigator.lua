return {
  "christoomey/vim-tmux-navigator",
  lazy = false,
  keys = {
    { "<C-h>", "<cmd> TmuxNavigateLeft<CR>", desc = "Tmux navigate left" },
    { "<C-j>", "<cmd> TmuxNavigateUp<CR>", desc = "Tmux navigate up" },
    { "<C-k>", "<cmd> TmuxNavigateDown<CR>", desc = "Tmux navigate down" },
    { "<C-l>", "<cmd> TmuxNavigateRight<CR>", desc = "Tmux navigate right" },
  },
}
