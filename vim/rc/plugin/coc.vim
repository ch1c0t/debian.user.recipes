command! InstallCocExtentions call InstallCocExtentions()
function! InstallCocExtentions()
  CocInstall coc-rust-analyzer
  CocInstall coc-json
endfunction

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes

inoremap <silent><expr> <c-@> coc#refresh()
