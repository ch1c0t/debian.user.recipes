p 'from events.moon'
log_all_events = ->
  group = vim.api.nvim_create_augroup 'AllEvents', clear: true

  -- https://github.com/wsdjeg/logevent.nvim
  events = vim.fn.getcompletion '', 'event'

  for event in events
    vim.api.nvim_create_autocmd event,
      group: group
      callback: (data) ->
        p data.event
