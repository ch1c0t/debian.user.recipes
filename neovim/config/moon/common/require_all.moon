glob = (pattern) ->
  { :glob } = vim.fn
  vim.split(glob(pattern), "\n")

remove_prefix = (s, prefix) ->
  if s\sub(1, #prefix) == prefix
    s\sub(#prefix + 1)
  else
    s

export require_all = (path) ->
  { :joinpath } = vim.fs
  { :stdpath } = vim.fn

  nvim_config = stdpath 'config'
  lua_path = joinpath nvim_config, 'lua'

  pattern = joinpath lua_path, path, "*.lua"
  paths = glob pattern
  if type(paths) == 'string'
    paths = {paths}

  for _, path in pairs paths do
    relative_path = remove_prefix path, lua_path .. '/'
    name = relative_path\sub(1, -5)\gsub('/', '.')
    require name
