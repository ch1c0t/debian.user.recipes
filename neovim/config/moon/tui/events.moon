remove_from = (t, elements) ->
  elements = {e,true for e in *elements}
  for index, element in ipairs t do
    if elements[element]
      table.remove t, index

stream_autocmd_events = ->
  group = vim.api.nvim_create_augroup 'AllEvents', clear: true

  -- https://github.com/wsdjeg/logevent.nvim
  events = vim.fn.getcompletion '', 'event'
  remove_from events, {
    'SourcePost'
    'FuncUndefined'
  }

  for event in *events
    vim.api.nvim_create_autocmd event,
      group: group
      callback: (data) ->
        vim.fn.MyPythonFunction data

-- a side effect of this breaks loading files on startup
stream_autocmd_events!
