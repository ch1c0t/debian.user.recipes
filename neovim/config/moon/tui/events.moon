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
--stream_autocmd_events!

streaming_events = false
timer = vim.uv.new_timer!
timer\start 1000, 1000, vim.schedule_wrap ->
  if (not streaming_events) and is_current_buffer_empty!
    streaming_events = true
    stream_autocmd_events!
