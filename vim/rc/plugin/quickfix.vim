nnoremap ]q :cnext<cr>
nnoremap [q :cprevious<cr>
nnoremap ]Q :cnewer<cr>
nnoremap [Q :colder<cr>

nnoremap ]l :lnext<cr>
nnoremap [l :lprevious<cr>
nnoremap ]L :lnewer<cr>
nnoremap [L :lolder<cr>

nnoremap <leader>q :ShowQuickfixList<cr>
nnoremap <leader>l :ShowLocationList<cr>

command! ShowQuickfixList call ShowQuickfixList()
function! ShowQuickfixList()
  ShowOnlyFirstWindow
  cwindow
endfunction

command! ShowLocationList call ShowLocationList()
function! ShowLocationList()
  ShowOnlyFirstWindow
  if empty(getloclist(0))
    CocDiagnostics
  else
    lopen
  endif
endfunction

hi QuickFixLine ctermbg=Red

" https://vi.stackexchange.com/a/21739
augroup quickfix
  autocmd!
  autocmd QuickFixCmdPost [^l]* call OpenQuickFixList()
augroup END

function OpenQuickFixList()
  wincmd o
  vert cwindow
  wincmd p
  wincmd =
endfunction
