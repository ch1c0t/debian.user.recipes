" https://stackoverflow.com/questions/24555192/command-for-putting-backticks-around-the-current-word
execute "set <M-b>=\eb"

nnoremap <M-b>b ciw`<C-r>"`<Esc>
nnoremap <M-b>B ciW`<C-r>"`<Esc>
nnoremap <M-b>3 I```<cr>```<Esc>O
inoremap <M-b>b ``<esc>i
xnoremap <M-b>b c`<C-r>"`<Esc>
