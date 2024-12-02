autocmd BufWrite <buffer> call Diagnose()
function! Diagnose()
  ShowOnlyFirstWindow
  CocDiagnostics
  wincmd L
endfunction
