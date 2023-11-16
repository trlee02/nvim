vim.api.nvim_create_autocmd({'UIEnter'}, {
  callback = function(event)
    local client = vim.api.nvim_get_chan_info(vim.v.event.chan).client
    if client ~= nil and client.name == "Firenvim" then
      vim.o.laststatus = 0
    end
  end
})

-- The delay of lines is needed for textbozes that automatically resize themselves
-- Firenvim buffers will have the URL name as the buffer name followed by 2 underscores
vim.api.nvim_create_autocmd({'BufEnter'}, {
  pattern = 'chat.openai.com_*.txt',
  callback = function()
    vim.cmd("set filetype=markdown")
    vim.fn.timer_start(1000, function()
      vim.opt.lines = 10
    end)
  end
})

vim.g.firenvim_config = {
  globalSettings = { alt = "all" },
  localSettings = {
    [".*"] = {
      cmdline  = "neovim",
      content  = "text",
      priority = 0,
      selector = "textarea",
      takeover = "always"
    },
    ['https?://[^/]*messages.google.com/*'] = {
      takeover = 'never',
    },
  }
}
