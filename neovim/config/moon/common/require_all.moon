find_paths = (pattern) ->
  { :glob } = vim.fn
  vim.split(glob(pattern), "\n")

remove_prefix = (s, prefix) ->
  if s\sub(1, #prefix) == prefix
    s\sub(#prefix + 1)
  else
    s

export require_all = (name) ->
  { :joinpath } = vim.fs
  { :stdpath } = vim.fn

  nvim_config = stdpath 'config'
  lua_path = joinpath nvim_config, 'lua'

  pattern = joinpath lua_path, name, "*.lua"
  paths = find_paths pattern

  for _, path in pairs paths do
    relative_path = remove_prefix(path, lua_path .. '/')
    name = relative_path\sub(1, -5)\gsub('/', '.')
    require name
