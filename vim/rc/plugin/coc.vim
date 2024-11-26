command InstallCocExtentions call InstallCocExtentions()
function! InstallCocExtentions()
  CocInstall coc-rust-analyzer
  CocInstall coc-json
endfunction
