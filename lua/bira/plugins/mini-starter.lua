local my_items = {
  { name = 'Echo random number', action = 'lua print(math.random())', section = 'Section 1' },
  function()
    return {
      { name = 'Item #1 from function', action = [[echo 'Item #1']], section = 'From function' },
      { name = 'Placeholder (always incative) item', action = '', section = 'From function' },
      function()
        return {
          name = 'Item #1 from double function',
          action = [[echo 'Double function']],
          section = 'From double function',
        }
      end,
    }
  end,
  { name = [[Another item in 'Section 1']], action = 'lua print(math.random() + 10)', section = 'Section 1' },
}

local footer_n_seconds = (function()
  local timer = vim.loop.new_timer()
  local n_seconds = 0
  timer:start(0, 1000, vim.schedule_wrap(function()
    if vim.api.nvim_buf_get_option(0, 'filetype') ~= 'starter' then
      timer:stop()
      return
    end
    n_seconds = n_seconds + 1
    MiniStarter.refresh()
  end))

  return function()
    return 'Number of seconds since opening: ' .. n_seconds
  end
end)()

local hook_top_pad_10 = function(content)
  -- Pad from top
  for _ = 1, 10 do
    -- Insert at start a line with single content unit
    table.insert(content, 1, { { type = 'empty', string = '' } })
  end
  return content
end

local starter = require('mini.starter')
starter.setup({
  items = my_items,
  footer = footer_n_seconds,
  content_hooks = { hook_top_pad_10 },
})
