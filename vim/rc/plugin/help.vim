nmap <silent> <leader>h :call FindHelp()<cr>
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
