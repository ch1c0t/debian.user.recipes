" https://stackoverflow.com/questions/24555192/command-for-putting-backticks-around-the-current-word
execute "set <M-b>=\eb"
nnoremap <M-b>b ciw`<C-r>"`<Esc>
xnoremap <M-b>b c`<C-r>"`<Esc>
