{
  'nvim-mini/mini.snippets'
  version: '*'
  config: ->
    gen_loader = require('mini.snippets').gen_loader
    require('mini.snippets').setup
      snippets: {
        gen_loader.from_file('~/.config/nvim/snippets/global.json')
        gen_loader.from_lang!
      }
}
