opt = vim.opt

toggle_visibility_of_hidden_characters = ->
  value = opt.list\get!

  if value
    opt.list = false
  else
    opt.listchars =
      eol: "$"      -- End of line
      tab: ">-"     -- Tab character (displays as ">-" for each two characters of width)
      trail: "-"    -- Trailing spaces
      nbsp: "&"     -- Non-breaking space
      extends: "~"  -- Lines that extend past the window width
      precedes: "~" -- Lines that precede the window width
      space: "·"    -- Regular spaces (optional, as it marks all spaces)
    opt.list = true

map 'n',
  "<A-o>v": toggle_visibility_of_hidden_characters
