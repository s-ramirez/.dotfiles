return {
  {
    'coder/claudecode.nvim',
    dependencies = { 'folke/snacks.nvim' },
    config = true,
    keys = {
      { '<leader>a', desc = 'AI/Claude Code' },
      { '<leader>ac', '<cmd>ClaudeCode<cr>', desc = 'Toggle Claude' },
      { '<leader>af', '<cmd>ClaudeCodeFocus<cr>', desc = 'Focus Claude' },
      { '<leader>ar', '<cmd>ClaudeCode --resume<cr>', desc = 'Resume Session' },
      { '<leader>aC', '<cmd>ClaudeCode --continue<cr>', desc = 'Continue Work' },
      { '<leader>am', '<cmd>ClaudeCodeSelectModel<cr>', desc = 'Select Model' },
      { '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>', desc = 'Add Current Buffer' },
      { '<leader>as', '<cmd>ClaudeCodeSend<cr>', mode = 'v', desc = 'Send Selection' },
      { '<leader>aa', '<cmd>ClaudeCodeDiffAccept<cr>', desc = 'Accept Changes' },
      { '<leader>ad', '<cmd>ClaudeCodeDiffDeny<cr>', desc = 'Reject Changes' },
    },
  },
}
