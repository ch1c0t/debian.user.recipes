function! FindHelp()
  try
    let output = system("find . -type f | fzy")
  catch /Vim:Interrupt/
  endtry
  redraw!

  if v:shell_error == 0 && !empty(output)
    call ShowOnlyFirstWindow()
    exe 'vsplit' . output
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
    call ShowOnlyFirstWindow()
    vnew
    call append(0, split(output))
  endif
endfunction
