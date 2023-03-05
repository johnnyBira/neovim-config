local starter = require('mini.starter')

local sessions = require('mini.sessions')
sessions.setup()

local my_items = {
  starter.sections.sessions(5, true),
}

local starter = require('mini.starter')
starter.setup({
  items = my_items,
  -- footer = footer_n_seconds,
  -- content_hooks = { hook_top_pad_10 },
})
