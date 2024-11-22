function! FindHelp()
  try
    let $VIM_RUNTIMEPATH = &runtimepath
    let tag_name = system("vim-helptags | fzy")
  catch /Vim:Interrupt/
  endtry
  redraw!

  if v:shell_error == 0 && !empty(tag_name)
    ShowOnlyFirstWindow
    execute "help " . tag_name
  endif
endfunction

function! ShowPaths()
  try
    let $VIM_RUNTIMEPATH = &runtimepath
    silent let output = system("vim-helptags")
  catch /Vim:Interrupt/
  endtry
  redraw!

  if v:shell_error == 0 && !empty(output)
    ShowOnlyFirstWindow
    vnew
    call append(0, split(output))
  endif
endfunction
