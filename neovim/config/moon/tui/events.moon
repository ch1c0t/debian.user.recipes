p 'from events.moon'
log_all_event = ->
  vim.api.nvim_create_autocmd '*',
    callback: (data) ->
      p data.event
