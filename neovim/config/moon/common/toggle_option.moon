backup_options = {}

falsy_values = {
  false
  nil
  ""
  0
}

any_of = (list, table) ->
  value = table.equals
  for element in *list
    if element == value
      return true

export is_option_falsy = (name) ->
  value = vim.opt[name]\get!
  any_of falsy_values, equals: value

export toggle_option = (name) ->
  if is_option_falsy(name)
    value = backup_options[name] or true
    vim.opt[name] = value
  else
    backup_options[name] = vim.opt[name]
    vim.opt[name] = false
