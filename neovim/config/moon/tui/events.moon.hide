group = vim.api.nvim_create_augroup 'MostEvents', clear: true

remove_from = (t, elements) ->
  elements = {e,true for e in *elements}
  for index, element in ipairs t do
    if elements[element]
      table.remove t, index

stream_autocmd_events = ->
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

-- a workaround for the above
file_not_loaded_yet = true
timer = vim.uv.new_timer!
timer\start 100, 100, vim.schedule_wrap ->
  if file_not_loaded_yet and is_current_buffer_empty!
    vim.cmd 'edit %'
    file_not_loaded_yet = false
    timer\close!
