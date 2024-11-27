" https://stackoverflow.com/questions/7501092/can-i-map-alt-key-in-vim/27206531#27206531
exe "set <M-h>=\eh"
exe "set <M-j>=\ej"
exe "set <M-k>=\ek"
exe "set <M-l>=\el"

nnoremap <M-h> <c-w>h
nnoremap <M-j> <c-w>j
nnoremap <M-k> <c-w>k
nnoremap <M-l> <c-w>l

command! ShowOnlyFirstWindow call ShowOnlyFirstWindow()
function! ShowOnlyFirstWindow()
  1 wincmd w
  wincmd o
endfunction
